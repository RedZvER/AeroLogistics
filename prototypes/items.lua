local function entity_item(name, icon, order, stack)
    return {
        type = "item",
        name = name,
        icon = icon,
        icon_size = 64,
        subgroup = "storage",
        order = order,
        place_result = name,
        stack_size = stack or 10
    }
end

local function tile_item(name, tile, icon, order)
    return {
        type = "item",
        name = name,
        icon = icon,
        icon_size = 64,
        subgroup = "terrain",
        order = order,
        stack_size = 100,
        place_as_tile = {
            result = tile
        }
    }
end

data:extend({tile_item("aerol-runway-stone-item", "aerol-runway-stone", "__base__/graphics/icons/stone-brick.png",
    "a[aerol]-a"),

             tile_item("aerol-runway-concrete-item", "aerol-runway-concrete", "__base__/graphics/icons/concrete.png",
    "a[aerol]-b"),

             tile_item("aerol-runway-reinforced-item", "aerol-runway-reinforced",
    "__base__/graphics/icons/refined-concrete.png", "a[aerol]-c"),
             entity_item("aerol-small-hangar", "__AeroLogistics__/graphics/aerol/icon-small-hangar.png",
    "z[aerol]-a[hangar]"),
             entity_item("aerol-large-hangar", "__AeroLogistics__/graphics/aerol/icon-large-hangar.png",
    "z[aerol]-b[hangar]"),
             entity_item("aerol-aircraft-stand", "__AeroLogistics__/graphics/aerol/icon-aircraft-stand.png",
    "z[aerol]-c[stand]", 20),
             entity_item("aerol-control-tower", "__AeroLogistics__/graphics/aerol/icon-control-tower.png",
    "z[aerol]-d[tower]", 5),
             entity_item("aerol-fuel-depot", "__AeroLogistics__/graphics/aerol/icon-fuel-depot.png", "z[aerol]-e[fuel]"),
             entity_item("aerol-cargo-terminal", "__AeroLogistics__/graphics/aerol/icon-cargo-terminal.png",
    "z[aerol]-f[cargo]"),
             entity_item("aerol-repair-shop", "__AeroLogistics__/graphics/aerol/icon-repair-shop.png",
    "z[aerol]-g[repair]", 5),
             entity_item("aerol-mail-plane", "__AeroLogistics__/graphics/aerol/icon-mail-plane.png",
    "z[aerol]-h[plane]", 1)})
