# AeroLogistics visual direction — runway and taxiway milestone

## Art direction
Blend the readable industrial visual language of Factorio with the stronger military-airfield identity of Command & Conquer: Generals. It should feel native to Factorio: restrained palette, top-down/isometric-compatible shapes, clear silhouettes, practical wear, no photorealism, no glossy modern airport look.

## Palette and materials
- Runway: charcoal asphalt, slightly varied patches, white centerline and threshold bars, restrained runway numbers.
- Taxiway: medium concrete, narrow yellow centerline, yellow hold/turn guidance; markings must remain legible at normal gameplay zoom.
- Apron: lighter reinforced concrete with subtle panel joints and faded yellow aircraft-stand outlines.
- Details: Factorio-like orange warning lights, small red-white edge markers, restrained grime and industrial wear.

## Asset set, priority order
1. Runway surface variants: unmarked asphalt, threshold/end, centerline/number markings.
2. Taxiway: straight, 90-degree turn, T-junction and four-way junction.
3. Apron/parking: plain apron, single stand, double stand and service area.
4. Small transition/edge pieces to avoid obvious seams.

## Technical constraints
- Build seamless  tileable ground textures at Factorio's native tile scale; keep markings on dedicated variants rather than baking long continuous lines into every tile.
- Keep the existing legacy tile/item prototype names intact for save compatibility.
- New prototypes currently inherit vanilla tile graphics as a safe placeholder. Dedicated custom PNGs and correct transition/overlay definitions are a separate asset-integration task; this branch does not yet contain final custom artwork.
- Check joins at 100% and gameplay zoom, all rotations, corners and mixed boundaries. Avoid text/large runway numbers on generic repeatable tiles because they repeat awkwardly.

## Current code milestone
Adds separate runway-asphalt, taxiway-concrete and apron-concrete tile/item prototypes, recipes and technology unlocks. The visuals still use vanilla art until sprite sheets are produced and wired into tile definitions.
