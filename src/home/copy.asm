; copies c bytes of data from hl to de, b times.
; used to copy gfx data with c = TILE_SIZE
; input:
;	b = number of times to copy
;	c = number of bytes to copy
;	hl = address from which to start copying the data
;	de = where to copy the data
; updated 2/16/25
CopyGfxData::
	ld a, [wLCDC]
	rla
	jr nc, .next_tile
.hblank_copy
	push bc
	push hl
	push de
	ld b, c
	call HblankCopyDataHLtoDE ; updated 2/16/25
	ld b, $0
	pop hl
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	add hl, bc
	pop bc
	dec b
	jr nz, .hblank_copy
	ret
.next_tile
	push bc
.copy_tile
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy_tile
	pop bc
	dec b
	jr nz, .next_tile
	ret

; copy bc bytes from hl to de. preserves all registers except af
CopyDataHLtoDE_SaveRegisters::
	push hl
	push de
	push bc
	call CopyDataHLtoDE
	pop bc
	pop de
	pop hl
	ret

; copy bc bytes from hl to de
CopyDataHLtoDE::
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, CopyDataHLtoDE
	ret

; copies b bytes of data from hl to de
; input:
;	b = number of bytes to copy
;	hl = address from which to start copying the data
;	de = where to copy the data
CopyNBytesFromHLToDE::
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, CopyNBytesFromHLToDE
	ret

; copies b bytes of data from hl to de, but only during hblank
; preserves bc
; input:
;	b = number of bytes to copy
;	hl = address from which to start copying the data
;	de = where to copy the data
; updated 2/16/25
HblankCopyDataHLtoDE::
	push bc
.loop
	ei
	di
	ldh a, [rSTAT]       ;
	and STAT_LCDC_STATUS ;
	jr nz, .loop         ; assert hblank
	ld a, [hl]
	ld [de], a
	ldh a, [rSTAT]       ;
	and STAT_LCDC_STATUS ;
	jr nz, .loop         ; assert still in hblank
	ei
	inc hl
	inc de
	dec b
	jr nz, .loop
	pop bc
	ret

; copies c bytes of data from de to hl
; if LCD on, copy during h-blank only
; input:
;	c = number of bytes to copy
;	de = address from which to start copying the data
;	hl = where to copy the data
; updated 2/16/25
SafeCopyDataDEtoHL::
	ld a, [wLCDC]
	bit LCDC_ENABLE_F, a
	jr nz, HblankCopyDataDEtoHL  ; LCD is on
;	fallthrough
