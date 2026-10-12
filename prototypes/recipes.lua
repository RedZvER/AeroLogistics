local function recipe(name, ingredients, count, energy)
  return {type="recipe",name=name,enabled=false,ingredients=ingredients,
    results={{type="item",name=name,amount=count or 1}},energy_required=energy or 3}
end
data:extend({
 {type="recipe",name="aerol-runway-stone-item",enabled=true,ingredients={{type="item",name="stone-brick",amount=1}},results={{type="item",name="aerol-runway-stone-item",amount=1}},energy_required=0.5},
 {type="recipe",name="aerol-runway-concrete-item",enabled=false,ingredients={{type="item",name="stone-brick",amount=5},{type="item",name="iron-plate",amount=1}},results={{type="item",name="aerol-runway-concrete-item",amount=5}},energy_required=2},
 {type="recipe",name="aerol-runway-reinforced-item",enabled=false,ingredients={{type="item",name="concrete",amount=10},{type="item",name="steel-plate",amount=2},{type="item",name="iron-stick",amount=4}},results={{type="item",name="aerol-runway-reinforced-item",amount=10}},energy_required=4},
 recipe("aerol-small-hangar",{{type="item",name="iron-plate",amount=30},{type="item",name="steel-plate",amount=10},{type="item",name="iron-gear-wheel",amount=10}},1,5),
 recipe("aerol-large-hangar",{{type="item",name="steel-plate",amount=40},{type="item",name="concrete",amount=30},{type="item",name="engine-unit",amount=10}},1,10),
 recipe("aerol-aircraft-stand",{{type="item",name="stone-brick",amount=15},{type="item",name="iron-plate",amount=10},{type="item",name="iron-stick",amount=5}},1,3),
 recipe("aerol-control-tower",{{type="item",name="steel-plate",amount=20},{type="item",name="electronic-circuit",amount=10},{type="item",name="radar",amount=1}},1,8),
 recipe("aerol-fuel-depot",{{type="item",name="steel-plate",amount=15},{type="item",name="pipe",amount=10},{type="item",name="iron-gear-wheel",amount=5}},1,5),
 recipe("aerol-cargo-terminal",{{type="item",name="steel-plate",amount=20},{type="item",name="iron-gear-wheel",amount=10},{type="item",name="electronic-circuit",amount=5}},1,6),
 recipe("aerol-repair-shop",{{type="item",name="steel-plate",amount=20},{type="item",name="iron-gear-wheel",amount=15},{type="item",name="engine-unit",amount=5}},1,8),
 recipe("aerol-mail-plane",{{type="item",name="engine-unit",amount=8},{type="item",name="steel-plate",amount=20},{type="item",name="electronic-circuit",amount=10}},1,15)
})
