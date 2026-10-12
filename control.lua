local PREFIX = "aerol-taxi-marking-"
local NAMES = {
  [PREFIX .. "end"] = true, [PREFIX .. "straight"] = true,
  [PREFIX .. "corner"] = true, [PREFIX .. "tee"] = true,
  [PREFIX .. "cross"] = true
}
local DIRS = {
  {x = 0, y = -1, bit = 1},
  {x = 1, y = 0, bit = 2},
  {x = 0, y = 1, bit = 4},
  {x = -1, y = 0, bit = 8}
}
local function is_marking(entity)
  return entity and entity.valid and NAMES[entity.name] == true
end
local function at(surface, p)
  local found = surface.find_entities_filtered{
    position = p,
    name = {PREFIX .. "end", PREFIX .. "straight", PREFIX .. "corner", PREFIX .. "tee", PREFIX .. "cross"}
  }
  for _, entity in pairs(found) do if entity.valid then return entity end end
  return nil
end
local function has(mask, bit)
  return math.floor(mask / bit) % 2 == 1
end
local function shape_for(mask)
  local count = 0
  for _, d in ipairs(DIRS) do if has(mask, d.bit) then count = count + 1 end end
  if count <= 1 then return "end" end
  if count == 2 then
    if mask == 5 or mask == 10 then return "straight" end
    return "corner"
  end
  if count == 3 then return "tee" end
  return "cross"
end
local function update_one(entity)
  if not is_marking(entity) then return end
  local mask, p = 0, entity.position
  for _, d in ipairs(DIRS) do
    local neighbour = at(entity.surface, {x = p.x + d.x, y = p.y + d.y})
    if neighbour and neighbour.unit_number ~= entity.unit_number then mask = mask + d.bit end
  end
  local shape = shape_for(mask)
  local target = PREFIX .. shape
  local direction = entity.direction
  if shape == "straight" then
    direction = (mask == 5) and defines.direction.north or defines.direction.east
  elseif shape == "corner" then
    local directions = {[3] = defines.direction.north, [6] = defines.direction.east,
      [12] = defines.direction.south, [9] = defines.direction.west}
    direction = directions[mask] or direction
  elseif shape == "tee" then
    local directions = {[7] = defines.direction.north, [14] = defines.direction.east,
      [13] = defines.direction.south, [11] = defines.direction.west}
    direction = directions[mask] or direction
  elseif shape == "end" then
    local directions = {[1] = defines.direction.north, [2] = defines.direction.east,
      [4] = defines.direction.south, [8] = defines.direction.west}
    direction = directions[mask] or direction
  end
  if entity.name == target and entity.direction == direction then return end
  local surface, position, force = entity.surface, entity.position, entity.force
  entity.destroy{raise_destroy = false}
  local replacement = surface.create_entity{
    name = target, position = position, force = force, direction = direction,
    raise_built = false, create_build_effect_smoke = false
  }
end
local function refresh_around(entity)
  if not entity or not entity.valid then return end
  local surface, p = entity.surface, entity.position
  update_one(at(surface, p))
  for _, d in ipairs(DIRS) do update_one(at(surface, {x = p.x + d.x, y = p.y + d.y})) end
end
script.on_event({
  defines.events.on_built_entity, defines.events.on_robot_built_entity,
  defines.events.script_raised_built, defines.events.script_raised_revive
}, function(event)
  local entity = event.created_entity or event.entity
  if is_marking(entity) then refresh_around(entity) end
end)
script.on_event({
  defines.events.on_pre_player_mined_item, defines.events.on_robot_pre_mined,
  defines.events.on_entity_died, defines.events.script_raised_destroy
}, function(event)
  local entity = event.entity
  if not is_marking(entity) then return end
  local surface, p = entity.surface, entity.position
  for _, d in ipairs(DIRS) do
    local neighbour = at(surface, {x = p.x + d.x, y = p.y + d.y})
    if neighbour and neighbour.valid then update_one(neighbour) end
  end
end)
