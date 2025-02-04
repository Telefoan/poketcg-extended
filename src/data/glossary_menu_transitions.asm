OpenGlossaryScreen_TransitionTable:
	;				  x,   y,   att, i-u, i-d, i-r, i-l.
	cursor_transition $08, $28, $00, $04, $01, $05, $05; Index: $00 	Deck				Energy Card
	cursor_transition $08, $38, $00, $00, $02, $06, $06; Index: $01		Discard Pile		Trainer Card
	cursor_transition $08, $48, $00, $01, $03, $07, $07; Index: $02		Hand				Basic Pokemon
	cursor_transition $08, $58, $00, $02, $04, $08, $08; Index: $03		Arena				Evolution Card
	cursor_transition $08, $68, $00, $03, $00, $09, $09; Index: $04		Bench 				Attack
	cursor_transition $58, $28, $00, $09, $06, $00, $00; Index: $05		Active Pokemon 		Pokemon Power
	cursor_transition $58, $38, $00, $05, $07, $01, $01; Index: $06		Bench Pokemon 		Weakness
	cursor_transition $58, $48, $00, $06, $08, $02, $02; Index: $07		Prizes 				Resistance
	cursor_transition $58, $58, $00, $07, $09, $03, $03; Index: $08		Damage Counter 		Retreat
	cursor_transition $58, $68, $00, $08, $05, $04, $04; Index: $09		To Next Page		To Previous Page


OpenEnergyDebugScreen_TransitionTable:
	;				  x,   y,   att, i-u, i-d, i-r, i-l.
	cursor_transition $08, $28, $00, 
	cursor_transition $08, $38, $00, 