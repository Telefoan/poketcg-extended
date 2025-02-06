OpenEnergyDebugScreen:
    xor a
	ld [wSpareMemoryBlock1], a
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

    call OpenEnergyDebugChooseEnergyScreen
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

	ld a, [wSpareMemoryBlock1]
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
	ld a, [wSpareMemoryBlock1]
	
	ldtx hl, DebugMenuPageText
	jp ProcessTextFromID

OpenEnergyDebugChooseEnergyScreen:
	xor a
	ld [wSpareMemoryBlock1], a
	call .display_menu

    xor a
    ld [wInPlayAreaCurPosition], a 
    ld de, OpenEnergyDebugChooseEnergyScreen_TransitionTable
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
	jp nz, .on_select

	farcall YourOrOppPlayAreaScreen_HandleInput
	jp nc, .next

	cp -1 ; b button
	jp nz, .check_button

	farcall ZeroObjectPositionsWithCopyToggleOn
	ret

.check_button
	push af
	farcall ZeroObjectPositionsWithCopyToggleOn
	pop af

    ;call OpenEnergyDebugChooseEnergyScreen
	call .display_menu
	xor a
	ld [wCheckMenuCursorBlinkCounter], a
	jp .next

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
	ldtx hl, EnergyDebugMenuChooseEnergyText
	call ProcessTextFromID
	call .print_menu
	ldtx hl, DebugSelectOptionText
	jp DrawWideTextBox_PrintText


.print_menu
    ld hl, wDefaultText

	ld a, TX_SYMBOL
	ld [hli], a

	ld a, [wSpareMemoryBlock1]
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
	ld a, [wSpareMemoryBlock1]
	
	ldtx hl, DebugEnergyPageText
	jp ProcessTextFromID


EnergyDebugMainMenuPointerTable:
	dw EnergyDebug_AddEnergy
	dw EnergyDebug_RemoveEnergy

EnergyDebug_AddEnergy:
    .choose_energy
    ret

EnergyDebug_RemoveEnergy:
    .choose_energy
    ret


EnergyDebugAddChooseEnergyPointerTable:
	dw EnergyDebug_AddEnergy_Fire
	dw EnergyDebug_AddEnergy_Grass
	dw EnergyDebug_AddEnergy_Lightning
	dw EnergyDebug_AddEnergy_Water
	dw EnergyDebug_AddEnergy_Fighting
	dw EnergyDebug_AddEnergy_Psychic
	dw EnergyDebug_AddEnergy_Dark
	dw EnergyDebug_AddEnergy_Steel
	dw EnergyDebug_AddEnergy_Dragon
	dw EnergyDebug_AddEnergy_Colorless

EnergyDebug_AddEnergy_Fire:
	call EnergyDebug_IncrementEnergy_Step1
	ld a, [wAttachedEnergies]
	add %10000000
	ld [wAttachedEnergies], a
	ret
	;ld de, FireEnergyCard
	;call EnergyDebug_IncrementEnergy_Step3
	;ret
	

EnergyDebug_AddEnergy_Grass:

EnergyDebug_AddEnergy_Lightning:
EnergyDebug_AddEnergy_Water:
EnergyDebug_AddEnergy_Fighting:
EnergyDebug_AddEnergy_Psychic:
EnergyDebug_AddEnergy_Dark:
EnergyDebug_AddEnergy_Steel:
EnergyDebug_AddEnergy_Dragon:
EnergyDebug_AddEnergy_Colorless:




EnergyDebug_EnergyRemoval_EnergyCheck:
	call CheckIfThereAreAnyEnergyCardsAttached
	ldtx hl, NoEnergyAttachedToOpponentsActiveText

EnergyDebug_EnergyRemoval_PlayerSelection:
	ldtx hl, ChoosePokemonToRemoveEnergyFromText
	call DrawWideTextBox_WaitForInput
	call HandlePokemonAndEnergySelectionScreen

EnergyDebug_EnergyRemoval_DiscardEffect:
	ldh a, [hTempPlayAreaLocation_ffa1]
	call PutCardInDiscardPile
	call IsPlayerTurn
	ret c

EnergyDebug_IncrementEnergy_Step1:
	push hl
	push de
	push bc
	xor a 
	ld c, NUM_TYPES
	ld hl, wAttachedEnergies

	ld a, [hl]
	push hl
	push de
	push bc
	ld a, l

	ret

