; convert the number at hl to text (ascii) format and write it to de
TwoByteNumberToText::
	push bc
	ld bc, -10000
	call .get_digit
	ld bc, -1000
	call .get_digit
	ld bc, -100
	call .get_digit
	ld bc, -10
	call .get_digit
	ld bc, -1
	call .get_digit
	xor a ; TX_END
	ld [de], a
	pop bc
	ret
.get_digit
	ld a, "0" - 1
.subtract_loop
	inc a
	add hl, bc
	jr c, .subtract_loop
	ld [de], a
	inc de
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	ret

; given a number between 0-255 in a, converts it to TX_SYMBOL format,
; and writes it to wStringBuffer + 2 and to the BGMap0 address at bc.
; any leading zeros are replaced with SYM_SPACE.
; preserves bc and de
; input:
;	a = number that will be printed
;	bc = screen coordinates at which to begin printing the number
WriteOneByteNumberInTxSymbolFormat_TrimLeadingZeros::
	push de
	push bc
	ld l, a
	ld h, $00
	call TwoByteNumberToTxSymbol_TrimLeadingZeros
.print_number
	ld hl, wStringBuffer + 2
	ld a, 3
	pop bc
	call CopyDataToBGMap0
	pop de
	ret

; given a number between 0-999 in hl, converts it to TX_SYMBOL format,
; and writes it to wStringBuffer + 2 and to the BGMap0 address at bc.
; also prints any leading zeros.
; preserves bc and de
; input:
;	hl = number that will be printed
;	bc = screen coordinates at which to begin printing the number
WriteThreeDigitNumberInTxSymbolFormat::
	push de
	push bc
	call TwoByteNumberToTxSymbol
	jr WriteOneByteNumberInTxSymbolFormat_TrimLeadingZeros.print_number

; converts the number at hl to TX_SYMBOL text format and writes it to wStringBuffer
; input:
;	hl = number to covert to text
; ouput:
;	[wStringBuffer] = number in text symbol format with leading zeros (6 bytes, but the last one is empty)
TwoByteNumberToTxSymbol::
	ld de, wStringBuffer
;	fallthrough
