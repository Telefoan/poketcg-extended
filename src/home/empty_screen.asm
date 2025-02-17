; initialize the screen by emptying the tilemap. used during screen transitions
; used during screen transitions.
; updated 2/16/25
EmptyScreen::
	call DisableLCD ; updated 2/16/25
	call FillTileMap ; updated 2/16/25
	xor a
	ld [wDuelDisplayedScreen], a
	ld a, [wConsole]
	cp CONSOLE_SGB
	ret nz 
	call EnableLCD ; updated 2/16/25
	ld hl, AttrBlkPacket_EmptyScreen ; updated 2/16/25
	call SendSGB ; updated 2/16/25
	jp DisableLCD ; updated 2/16/25

; returns v*BGMap0 + BG_MAP_WIDTH * c + b in de.
; used to map coordinates at bc to a BGMap0 address.
BCCoordToBGMap0Address::
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld c, b
	ld b, HIGH(v0BGMap0)
	add hl, bc
	ld e, l
	ld d, h
	ret

AttrBlkPacket_EmptyScreen:: ; updated 2/16/25
;	sgb ATTR_BLK, 1 ; sgb_command, length
	db 1 ; number of data sets
	; Control Code, Color Palette Designation, X1, Y1, X2, Y2
	db ATTR_BLK_CTRL_INSIDE + ATTR_BLK_CTRL_LINE, 0 << 0 + 0 << 2, 0, 0, 19, 17 ; data set 1
	ds 6 ; data set 2
	ds 2 ; data set 3
