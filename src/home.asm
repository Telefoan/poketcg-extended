INCLUDE "macros.asm"
INCLUDE "constants.asm"

; rst vectors
SECTION "rst00", ROM0
	ret
	ds 7

SECTION "rst08", ROM0
; returns [[hWhoseTurn] << 8 + a] in a and in [hl]
; i.e. duelvar a of the player whose turn it is
; preserves bc and de
; input:
;	a = wPlayerDuelVariables constant
GetTurnDuelistVariable::
	ld l, a
	ldh a, [hWhoseTurn]
	ld h, a
	ld a, [hl]
	ret
	ds 2

SECTION "rst10", ROM0
; switch ROM bank to a
; preserves all registers
; input:
;	a = ROM bank to use
; updated 2/16/25
BankswitchROM::
	ldh [hBankROM], a
	ld [MBC3RomBank], a
	ret
	ds 2

SECTION "rst18", ROM0
	jp Bank1Call
	ds 5
SECTION "rst20", ROM0
	jp RST20
	ds 5
SECTION "rst28", ROM0
	jp FarCall
	ds 5
SECTION "rst30", ROM0
; returns [hWhoseTurn] <-- ([hWhoseTurn] ^ $1)
;   As a side effect, this also returns a duelist variable in a similar manner to
;   GetNonTurnDuelistVariable, but this function seems to only ever be called to
;   swap the turn value.
; preserves all registers
; updated 2/16/25
SwapTurn::
	push af
	push hl
	call GetNonTurnDuelistVariable
	ld a, h
	ldh [hWhoseTurn], a

; interrupts
SECTION "rst38", ROM0
	ret
	ds 7

; interrupts
SECTION "vblank", ROM0
	jp VBlankHandler
	ds 5
SECTION "lcdc", ROM0
	call wLCDCFunctionTrampoline
	reti
	ds 4
SECTION "timer", ROM0
	jp TimerHandler
	ds 5
SECTION "serial", ROM0
	reti
	ds 7
SECTION "joypad", ROM0
	reti
	ds $9f

SECTION "romheader", ROM0
	nop
	jp Start

	ds $4c

INCLUDE "home/start.asm"
INCLUDE "home/vblank.asm"
INCLUDE "home/time.asm"
INCLUDE "home/lcd.asm"
INCLUDE "home/interrupt.asm"
INCLUDE "home/setup.asm"
INCLUDE "home/palettes.asm"
INCLUDE "home/empty_screen.asm"
INCLUDE "home/input.asm"
INCLUDE "home/frames.asm"
INCLUDE "home/dma.asm"
INCLUDE "home/jumptable.asm"
INCLUDE "home/write_number.asm"
INCLUDE "home/bg_map.asm"
INCLUDE "home/copy.asm"
INCLUDE "home/switch_rom.asm"
INCLUDE "home/sram.asm"
INCLUDE "home/vram.asm"
INCLUDE "home/double_speed.asm"
INCLUDE "home/clear_sram.asm"
INCLUDE "home/random.asm"
INCLUDE "home/decompress.asm"
INCLUDE "home/objects.asm"
INCLUDE "home/farcall.asm"
INCLUDE "home/hblank.asm"
INCLUDE "home/math.asm"
INCLUDE "home/list.asm"
INCLUDE "home/duel.asm"
INCLUDE "home/card_collection.asm"
INCLUDE "home/text_box.asm"
INCLUDE "home/tiles.asm"
INCLUDE "home/process_text.asm"
INCLUDE "home/menus.asm"
INCLUDE "home/ai.asm"
INCLUDE "home/print_text.asm"
INCLUDE "home/card_data.asm"
INCLUDE "home/effect_commands.asm"
INCLUDE "home/load_deck.asm"
INCLUDE "home/damage.asm"
INCLUDE "home/coin_toss.asm"
INCLUDE "home/duel_menus.asm"
INCLUDE "home/substatus.asm"
INCLUDE "home/card_color.asm"
INCLUDE "home/sound.asm"
INCLUDE "home/map.asm"
INCLUDE "home/save.asm"
INCLUDE "home/script.asm"
INCLUDE "home/play_animation.asm"
INCLUDE "home/memory.asm"
INCLUDE "home/call_regs.asm"
INCLUDE "home/lcd_enable_frame.asm"
INCLUDE "home/division.asm"
INCLUDE "home/play_song.asm"
INCLUDE "home/load_animation.asm"
INCLUDE "home/scroll.asm"
INCLUDE "home/audio_callback.asm"
