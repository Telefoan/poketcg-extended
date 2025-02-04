OpenEnergyDebugScreen:
    xor a
	ld [wGlossaryPageNo], a
	call .display_menu





EnergyDebugMainMenuPointerTable:
	dw EnergyDebug_AddEnergy
	dw EnergyDebug_RemoveEnergy
	dw EnergyDebug_Exit

EnergyDebug_AddEnergy:
    ret

EnergyDebug_RemoveEnergy:
    ret

EnergyDebug_Exit:
    farcall _EnegyDebug_Exit
    ret