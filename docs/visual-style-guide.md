# AeroLogistics visual direction — runway and taxiway marking milestone

## Art direction
Blend the readable industrial visual language of Factorio with the stronger military-airfield identity of Command & Conquer: Generals. It should feel native to Factorio: restrained palette, top-down/isometric-compatible shapes, clear silhouettes, practical wear, no photorealism, no glossy modern airport look.

## Separate surface from guidance markings
**A taxiway is a route marked on the airport ground, not a separate paving material.** The yellow taxiway centerline indicates aircraft movement between runway, apron and parking stands. Do not represent every taxiway as a distinct concrete surface.

- Runway: charcoal asphalt with white centerline, threshold bars, edge markings and runway numbers where appropriate.
- Apron: concrete or reinforced concrete with subtle panel joints, faded yellow stand boxes and service-area markings.
- Taxi guidance: narrow yellow centerline and yellow turns/junctions drawn over the underlying asphalt or concrete. Include straight, 90-degree turn, 45-degree turn, T-junction, cross-junction and branching pieces.
- Details: Factorio-like orange warning lights, small red-white edge markers, restrained grime and industrial wear.

## Asset set, priority order
1. Base surfaces: plain runway asphalt and plain apron/concrete without baked-in taxi guidance.
2. Runway markings: threshold/end, centerline, edge and runway-number variants.
3. Yellow taxiway line pieces: straight, 90-degree and 45-degree turns, T-junction, cross-junction and branch.
4. Apron markings: aircraft stands, service lanes and keep-clear zones.
5. Small edge/transition pieces to avoid obvious seams.

## Technical constraints
- Build seamless tileable ground textures at Factorio's native tile scale. Keep long continuous guidance lines out of generic repeatable base textures.
- Factorio ground tiles cannot simply draw a separate marking layer over any arbitrary tile unless the marking is implemented as a compatible overlay/decal system. For the first implementation, use purpose-made marking tile variants (including transparent-background line artwork where supported by the tile prototype's sprite/transition setup), or placeable marking entities/decoratives if overlay support proves unsuitable.
- Keep existing legacy tile/item prototype names intact for save compatibility.
- New prototypes currently inherit vanilla tile graphics as placeholders. This branch does not yet contain integrated final custom artwork.
- Check joins at 100% and gameplay zoom, all rotations, corners and mixed boundaries. Avoid text/large runway numbers on generic repeatable tiles because they repeat awkwardly.

## Current code milestone
Adds separate runway-asphalt, taxiway-concrete and apron-concrete tile/item prototypes, recipes and technology unlocks. The intended visual model is now explicit: yellow taxiway lines are movement guidance on top of the airport ground, not a unique surface material. Custom sprite assets and their integration remain to be implemented and tested in Factorio.
