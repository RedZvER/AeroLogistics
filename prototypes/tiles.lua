local function add_tile(source_name, new_name, order)
  local source = data.raw.tile[source_name]
  if not source then error("AeroLogistics: missing base tile " .. source_name) end
  local tile = table.deepcopy(source)
  tile.name = new_name
  tile.localised_name = {"tile-name." .. new_name}
  tile.order = order
  data:extend({tile})
end

-- New named surfaces are ready for dedicated AeroLogistics sprite sheets.
-- Until those assets are added, they inherit vanilla textures/transitions.
add_tile("refined-concrete", "aerol-runway-asphalt", "z[aerol]-a[runway]")
add_tile("concrete", "aerol-taxiway-concrete", "z[aerol]-b[taxiway]")
add_tile("refined-concrete", "aerol-apron-concrete", "z[aerol]-c[apron]")

-- Keep original prototypes intact for existing saves.
add_tile("stone-path", "aerol-runway-stone", "z[aerol]-x[stone]")
add_tile("concrete", "aerol-runway-concrete", "z[aerol]-y[concrete]")
add_tile("refined-concrete", "aerol-runway-reinforced", "z[aerol]-z[reinforced]")
