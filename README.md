# tinytcg

Highly optimized disassembly of Pokémon TCG, meant to be used as a base for hacks. Removes GameBoy compatibility and multiplayer features to allow for more ROM space.
Compared to the base game, this build saves 83,897 bytes, translating to 9.8% more available space.

## Current ROM map summary

```
SUMMARY:
	ROM0: 13110 bytes used / 3274 free
	ROMX: 754418 bytes used / 277774 free in 63 banks
	SRAM: 20903 bytes used / 11865 free in 4 banks
	WRAM0: 3987 bytes used / 109 free
	WRAMX: 3813 bytes used / 283 free in 1 bank
	HRAM: 56 bytes used / 71 free
```

## Removed content

- GameBoy tilemaps and compatibility functionality;
- Unused content (Japanese title screen, unreferenced routines, unused text, debug menus);
- Printer functions;
- Card Pop!;
- Gift Center;
- Link duels.

## Added content

- A simplistic compatibility screen when GameBoy is detected.

## Instructions to build

To assemble, first download RGBDS (https://github.com/gbdev/rgbds/releases) and extract it to /usr/local/bin.
Run `make` in your shell.

This will output a file named "tinytcg.gbc".
