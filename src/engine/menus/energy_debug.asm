EnergyDebugMenu:
    push hl
	push bc
	push de
    push nc
    call DisplayEnergyDebugMenu
.loop
    ld a, 1 << AUTO_CLOSE_TEXTBOX
.wait_input
    call DoFrameIfLCDEnabled
	call HandleMenuInput
	jr nc, .wait_input
	ld a, e
	ld [wd237], a
	ldh a, [hffb4]
	cp e
	jr nz, .exit
	cp $5
	jr z, .exit
	ld a, [wMenuInputTablePointer]
	ld hl, EnergyDebugMainMenuPointerTable
	call JumpToFunctionInTable
	ld hl, DisplayEnergyDebugMenu
	jr .loop
.exit
    pop de
	pop bc
	pop hl
    pop nc
	jp DuelCheckMenu_InPlayArea


EnergyDebugMenuParams:
    db  0,  0 ;  menu coords
	db  14, 14 ;  menu text box dimensions

	db 2, 2 ; text alignment for InitTextPrinting
	tx DebugMenuPageText
	db $ff

	db 1, 2 ; cursor x, cursor y
	db 2 ; y displacement between items
	db 2 ; number of items
	db SYM_CURSOR_R ; cursor tile number
	db SYM_SPACE ; tile behind cursor
	dw NULL ; function pointer if non-0

DisplayEnergyDebugMenu:
	ld a, [wMenuInputTablePointer]
	ld hl, EnergyDebugMenuParams
	farcall InitAndPrintMenu
	ret

EnergyDebugMainMenuPointerTable:
	dw EnergyDebug_AddEnergy
	dw EnergyDebug_RemoveEnergy

EnergyDebug_AddEnergy:
    .choose_energy
    ret

EnergyDebug_RemoveEnergy:
    .choose_energy
    ret

HandleColorChoiceScreen:
	or a
	call z, SwapTurn
	push af
	call .DrawScreen
	pop af
	call z, SwapTurn

	ld hl, .menu_params
	xor a
	call InitializeMenuParameters
	call EnableLCD

.loop_input
	call DoFrame
	call HandleMenuInput
	jr nc, .loop_input
	cp -1 ; b pressed?
	jr z, .set_carry
	ld e, a
	ld d, $00
	ld hl, EnergyDebugListItemToColor
	add hl, de
	ld a, [hl]
	or a
	ret
.set_carry
	scf
	ret

.menu_params
	db 1, 1 ; cursor x, cursor y
	db 2 ; y displacement between items
	db 7 ; number of items
	db SYM_CURSOR_R ; cursor tile number
	db SYM_SPACE ; tile behind cursor
	dw NULL ; function pointer if non-0

.DrawScreen:
	push hl
	push af
	call EmptyScreen
	call ZeroObjectPositions
	call LoadDuelCardSymbolTiles

    lb de, 4, 1
	ldtx hl, ColorListText
	call InitTextPrinting_ProcessTextFromID

    lb de, 1, 14
	pop hl
	call InitTextPrinting_ProcessTextFromID

    ld hl, EnergyTileAndBGP
	lb de, 2, 0
	ld c, NUM_TYPES

.loop_colors
	ld a, [hli]
	push de
	push bc
	push hl
	lb hl, 1, 2
	lb bc, 2, 2
	call FillRectangle
	pop hl
	push hl
	call BankswitchVRAM1
	ld a, [hl]
	lb hl, 0, 0
	lb bc, 2, 2
	call FillRectangle
	call BankswitchVRAM0

.skip_vram1
	pop hl
	pop bc
	pop de
	inc hl
	inc e
	inc e
	dec c
	jr nz, .loop_colors
	ret

EnergyTileAndBGP:
	; tile, BG
	db $e4, $02
	db $e0, $01
	db $eC, $02
	db $e8, $01
	db $f0, $03
	db $f4, $03
    ; dark placeholder
    ; steel placeholder
    ; Dragon placeholder
    db $f8, $00 ;i think this should be the colorless symbol and pallet but idk what and where that would be

EnergyDebugListItemToColor:
	db FIRE
	db GRASS
    db LIGHTNING
	db WATER
	db FIGHTING
	db PSYCHIC
    ;db DARK 
    ;db STEEL 
    ;db DRAGON 
    db COLORLESS 