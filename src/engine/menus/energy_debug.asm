OpenEnergyDebugScreen:
    xor a
	ld [wGlossaryPageNo], a
	call .display_menu

    xor a
    ld [wInPlayAreaCurPosition], a 
    ld de, OpenEnergyDebugScreen_TransitionTable
    ld hl, wMenuInputTablePointer
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, $ff
	ld [wDuelInitialPrizesUpperBitsSet], a
	xor a
	ld [wCheckMenuCursorBlinkCounter], a

.next
	ld a, $01
	ld [wVBlankOAMCopyToggle], a
	call DoFrame
	ldh a, [hKeysPressed]
	and SELECT
	jr nz, .on_select

	farcall YourOrOppPlayAreaScreen_HandleInput
	jr nc, .next

	cp -1 ; b button
	jr nz, .check_button

	farcall ZeroObjectPositionsWithCopyToggleOn
	ret

.check_button
	push af
	farcall ZeroObjectPositionsWithCopyToggleOn
	pop af

    call .display_energy_menu
	call .display_menu
	xor a
	ld [wCheckMenuCursorBlinkCounter], a
	jr .next

.on_select
	ld a, $01
	farcall PlaySFXConfirmOrCancel

.display_menu ;display energy Debug Menu
    xor a
	ld [wTileMapFill], a
	call ZeroObjectPositions
	ld a, $01
	ld [wVBlankOAMCopyToggle], a
	call DoFrame
	call EmptyScreen
	call Set_OBJ_8x8
	farcall LoadCursorTile

	lb de, 5, 0
	call InitTextPrinting
	ldtx hl, EnergyDebugMenuText
	call ProcessTextFromID
	call .print_menu
	ldtx hl, DebugSelectOptionText
	jp DrawWideTextBox_PrintText

.print_menu
    ld hl, wDefaultText

	ld a, TX_SYMBOL
	ld [hli], a

	ld a, [wGlossaryPageNo]
	add SYM_1
	ld [hli], a

	ld a, TX_SYMBOL
	ld [hli], a

	ld a, SYM_SLASH
	ld [hli], a

	ld a, TX_SYMBOL
	ld [hli], a

	ld a, SYM_2
	ld [hli], a

	ld [hl], TX_END

	lb de, 16, 1
	call InitTextPrinting
	ld hl, wDefaultText
	call ProcessText

	lb de, 1, 3
	call InitTextPrinting
	ld a, [wGlossaryPageNo]
	
	ldtx hl, DebugMenuPageText
	jp ProcessTextFromID

.choose_energy
    xor a
	ld [wGlossaryPageNo], a
	call .display_energy_menu

    xor a
	ld [wInPlayAreaCurPosition], a
    ld de, OpenEnergyDebugChooseEnergyScreen_TransitionTable ; this data is stored in bank 2.
    ld hl, wMenuInputTablePointer
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, $ff
	ld [wDuelInitialPrizesUpperBitsSet], a
	xor a
	ld [wCheckMenuCursorBlinkCounter], a
.display_energy_menu
    xor a
	ld [wTileMapFill], a
	call ZeroObjectPositions
	ld a, $01
	ld [wVBlankOAMCopyToggle], a
	call DoFrame
	call EmptyScreen
	call Set_OBJ_8x8
	farcall LoadCursorTile

	lb de, 5, 0
	call InitTextPrinting
	ldtx hl, EnergyDebugMenuChooseEnergyText
	call ProcessTextFromID
	call .print_menu
	ldtx hl, DebugSelectOptionText
	jp DrawWideTextBox_PrintText


EnergyDebugMainMenuPointerTable:
	dw EnergyDebug_AddEnergy
	dw EnergyDebug_RemoveEnergy
	dw EnergyDebug_Exit

EnergyDebug_AddEnergy:
    ret

EnergyDebug_RemoveEnergy:
    ret

EnergyDebug_Exit:
    ret