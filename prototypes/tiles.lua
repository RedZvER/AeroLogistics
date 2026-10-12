local function add_tile(source_name, new_name, order)
  local source = data.raw.tile[source_name]
  if not source then error("AeroLogistics: missing base tile " .. source_name) end
  local tile = table.deepcopy(source)
  tile.name = new_name
  tile.localised_name = {"tile-name." .. new_name}
  tile.order = order
  data:extend({tile})
end

-- Reuse vanilla graphics/transitions so the prototype is self-contained.
add_tile("stone-path", "aerol-runway-stone", "z[aerol]-a[stone]")
add_tile("concrete", "aerol-runway-concrete", "z[aerol]-b[concrete]")
add_tile("refined-concrete", "aerol-runway-reinforced", "z[aerol]-c[reinforced]")
