# AeroLogistics visual direction — runway and taxiway marking milestone

## Art direction
Blend the readable industrial visual language of Factorio with the stronger military-airfield identity of Command & Conquer: Generals. Use restrained materials, strong top-down readability, practical wear, and no photorealism.

## Ground versus guidance markings
A taxiway is a route marked on airport ground, not a separate paving material. The yellow centerline indicates aircraft movement between runway, apron and stands.

- Runway: charcoal asphalt with white centerline, threshold bars, edge markings and runway numbers on dedicated end pieces.
- Apron: concrete or reinforced concrete with panel joints, faded yellow stand outlines and service-area markings.
- Taxi guidance: narrow yellow line on top of the underlying asphalt or concrete. Pieces needed: straight, 90-degree turn, 45-degree turn, T-junction, cross-junction and branch.
- Details: restrained orange edge lights, red-white markers and industrial wear.

## Implementation decision
Factorio tile prototypes replace the ground surface; they do not provide a general-purpose, independently placeable transparent overlay layer for arbitrary existing tiles. A real yellow-line overlay should therefore be implemented as a placeable, blueprintable decal/marking entity with a transparent sprite and no blocking collision, rather than as a new concrete tile.

## Required assets
Transparent PNG sprites at the mod's native tile scale:
- `taxi-line-straight.png`
- `taxi-line-corner.png`
- `taxi-line-diagonal.png`
- `taxi-line-t-junction.png`
- `taxi-line-cross.png`
- `taxi-line-branch.png`

Sprites should use a muted yellow centerline with a subtle dark outline for contrast. Keep all line endpoints aligned to tile edges so blueprints connect cleanly. Do not bake long guidance lines into the generic asphalt or apron textures.

## Validation checklist
- Confirm the marking is visible over both plain ground and the AeroLogistics runway/apron tiles.
- Confirm it does not block walking, vehicles or aircraft entities.
- Confirm rotations and neighboring pieces align without gaps.
- Confirm blueprints preserve connected line networks and mining removes the marking only.
- Test in Factorio 2.0; Space Age remains optional.

## Current code milestone
The 0.3.0 branch contains the runway/asphalt, taxiway-concrete and apron-concrete placeholder tile/item prototypes, recipes and technology unlocks. Those tiles still inherit vanilla art. Transparent custom marking sprites and their in-game placement prototypes are not yet integrated; the design above is the implementation contract for that next code change.
