local function use_custom_picture(entity, asset, width, height)
  entity.picture = {
    layers = {{
      filename = "__AeroLogistics__/graphics/aerol/" .. asset .. ".png",
      width = width,
      height = height,
      shift = {0, 0}
    }}
  }
end

local function make_module(name, asset, icon, size, health, order, width, height, footprint_x, footprint_y)
  local entity = table.deepcopy(data.raw.container["steel-chest"])
  entity.name = name
  entity.icon = "__AeroLogistics__/graphics/aerol/" .. icon .. ".png"
  entity.minable = {mining_time = 0.5, result = name}
  entity.max_health = health
  entity.inventory_size = size
  entity.order = order
  entity.next_upgrade = nil
  entity.fast_replaceable_group = "aerol-airport-module"
  entity.circuit_wire_max_distance = 9
  entity.collision_box = {{-footprint_x / 2, -footprint_y / 2}, {footprint_x / 2, footprint_y / 2}}
  entity.selection_box = {{-footprint_x / 2, -footprint_y / 2}, {footprint_x / 2, footprint_y / 2}}
  use_custom_picture(entity, asset, width, height)
  return entity
end

local small = make_module("aerol-small-hangar", "small-hangar", "icon-small-hangar", 24, 350, "z[aerol]-a", 129, 113, 2, 2)
local large = make_module("aerol-large-hangar", "large-hangar", "icon-large-hangar", 48, 500, "z[aerol]-b", 170, 140, 3, 3)
local stand = make_module("aerol-aircraft-stand", "aircraft-stand", "icon-aircraft-stand", 12, 250, "z[aerol]-c", 123, 94, 2, 2)
local tower = make_module("aerol-control-tower", "control-tower", "icon-control-tower", 20, 400, "z[aerol]-d", 116, 138, 2, 3)
local fuel = make_module("aerol-fuel-depot", "fuel-depot", "icon-fuel-depot", 20, 300, "z[aerol]-e", 132, 111, 2, 2)
local cargo = make_module("aerol-cargo-terminal", "cargo-terminal", "icon-cargo-terminal", 48, 350, "z[aerol]-f", 116, 126, 2, 2)
local repair = make_module("aerol-repair-shop", "repair-shop", "icon-repair-shop", 20, 400, "z[aerol]-g", 116, 127, 2, 2)

-- Temporary vehicle placeholder. Its inventory icon is custom; physical aircraft art and flight behaviour are a later step.
local plane = table.deepcopy(data.raw.car["car"])
plane.name = "aerol-mail-plane"
plane.icon = "__AeroLogistics__/graphics/aerol/icon-mail-plane.png"
plane.minable = {mining_time = 1, result = "aerol-mail-plane"}
plane.max_health = 250
plane.inventory_size = 20
plane.consumption = "300kW"
plane.effectivity = 0.8
plane.friction = 0.002
plane.rotation_speed = 0.01
plane.weight = 1000
plane.order = "z[aerol]-h[plane]"
plane.next_upgrade = nil

data:extend({small, large, stand, tower, fuel, cargo, repair, plane})
