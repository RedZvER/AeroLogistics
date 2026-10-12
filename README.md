# AeroLogistics 0.3.0 — Runway & Taxiway Foundations

Factorio 2.0 prototype with optional Space Age dependency.

## This milestone
- Establishes the AeroLogistics art direction: Factorio-native industrial readability with a stronger Generals-style military airfield identity.
- Adds separate runway-asphalt, taxiway-concrete and apron-concrete paving prototypes and crafting recipes.
- Unlocks taxiway concrete with Basic Aviation and apron concrete with Advanced Airports.
- Preserves the original runway tile/item IDs for existing saves.
- Adds English and Russian names for the new tiles/items.

## Important visual status
This is the prototype foundation, not the finished custom texture pack. New tile prototypes currently inherit vanilla Factorio tile graphics; custom runway markings, taxiway junctions, thresholds, lights and apron stand sprites still need to be drawn and connected to the tile definitions. The concept image is a visual target, not a game-ready sprite sheet.

## Install/test
Download the ZIP for the `feature/0.3.0-runway-taxiway-visuals` branch and place the mod folder containing `info.json` in the Factorio mods directory. Test startup, crafting and research, then verify that the new surfaces can be placed and that old saves still load.

## Known limitations
No Factorio launch test has been performed from this development environment. Aircraft behavior, cargo operations, fuel consumption, routing and dispatcher automation are not implemented.
