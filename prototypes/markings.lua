-- Taxi guidance overlays with 4-direction sprite sheets.
local shapes = {"end", "straight", "corner", "tee", "cross"}
local entities = {}
for _, shape in ipairs(shapes) do
  local sprite = "__AeroLogistics__/graphics/aerol/markings/taxi-" .. shape .. "-sheet.png"
  entities[#entities + 1] = {
    type = "simple-entity-with-owner",
    name = "aerol-taxi-marking-" .. shape,
    icon = "__base__/graphics/icons/constant-combinator.png",
    icon_size = 64,
    flags = {"placeable-player", "player-creation"},
    max_health = 50,
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selectable_in_game = true,
    minable = {mining_time = 0.1, result = "aerol-taxi-marking-item"},
    fast_replaceable_group = "aerol-taxi-marking",
    render_layer = "floor",
    picture = {
      north = {filename = sprite, width = 64, height = 64, x = 0, y = 0},
      east  = {filename = sprite, width = 64, height = 64, x = 64, y = 0},
      south = {filename = sprite, width = 64, height = 64, x = 0, y = 64},
      west  = {filename = sprite, width = 64, height = 64, x = 64, y = 64}
    }
  }
end
data:extend(entities)
