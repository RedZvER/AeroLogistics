-- Taxi guidance overlays. Each direction uses an isolated 64x64 image
-- to prevent adjacent atlas frames from bleeding into the rendered sprite.
local shapes = {"end", "straight", "corner", "tee", "cross"}
local directions = {"north", "east", "south", "west"}
local entities = {}
for _, shape in ipairs(shapes) do
  local picture = {}
  for _, direction in ipairs(directions) do
    picture[direction] = {
      filename = "__AeroLogistics__/graphics/aerol/markings/taxi-" .. shape .. "-" .. direction .. ".png",
      width = 64,
      height = 64
    }
  end
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
    picture = picture
  }
end
data:extend(entities)
