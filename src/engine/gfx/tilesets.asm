; \1 = pointer
; \2 = number of tiles
MACRO tileset
	dwb \1, BANK(\1) - BANK(Tilesets)
	db \2
ENDM

Tilesets:
	table_width 4, Tilesets
	tileset OverworldMapTiles,             193 ; TILESET_OVERWORLD_MAP
	tileset MasonLaboratoryTilesetGfx,     151 ; TILESET_MASON_LABORATORY
	tileset IshiharaTilesetGfx,             77 ; TILESET_ISHIHARA
	tileset ClubEntranceTilesetGfx,        129 ; TILESET_CLUB_ENTRANCE
	tileset ClubLobbyTilesetGfx,           120 ; TILESET_CLUB_LOBBY
	tileset FightingClubTilesetGfx,         99 ; TILESET_FIGHTING_CLUB
	tileset RockClubTilesetGfx,             60 ; TILESET_ROCK_CLUB
	tileset WaterClubTilesetGfx,           161 ; TILESET_WATER_CLUB
	tileset LightningClubTilesetGfx,       131 ; TILESET_LIGHTNING_CLUB
	tileset GrassClubTilesetGfx,            87 ; TILESET_GRASS_CLUB
	tileset PsychicClubTilesetGfx,          58 ; TILESET_PSYCHIC_CLUB
	tileset ScienceClubTilesetGfx,          82 ; TILESET_SCIENCE_CLUB
	tileset FireClubTilesetGfx,             87 ; TILESET_FIRE_CLUB
	tileset ChallengeHallTilesetGfx,       157 ; TILESET_CHALLENGE_HALL
	tileset PokemonDomeEntranceTilesetGfx,  78 ; TILESET_POKEMON_DOME_ENTRANCE
	tileset PokemonDomeTilesetGfx,         207 ; TILESET_POKEMON_DOME
	tileset HallOfHonorTilesetGfx,         121 ; TILESET_HALL_OF_HONOR
	tileset MedalGfx,                       72 ; TILESET_MEDAL
	tileset ColosseumGfx,                   86 ; TILESET_COLOSSEUM
	tileset EvolutionGfx,                   86 ; TILESET_EVOLUTION
	tileset MysteryGfx,                     86 ; TILESET_MYSTERY
	tileset LaboratoryGfx,                  86 ; TILESET_LABORATORY
	tileset CharizardIntroGfx,              96 ; TILESET_CHARIZARD_INTRO
	tileset ScytherIntroGfx,                96 ; TILESET_SCYTHER_INTRO
	tileset AerodactylIntroGfx,             96 ; TILESET_AERODACTYL_INTRO
	tileset SolidTiles1,                     4 ; TILESET_SOLID_TILES_1
	tileset SolidTiles2,                     4 ; TILESET_SOLID_TILES_2
	tileset PlayerGfx,                      36 ; TILESET_PLAYER
	tileset RonaldGfx,                      36 ; TILESET_RONALD
	tileset TitleScreenGfx,                212 ; TILESET_TITLE_SCREEN
	tileset CopyrightGfx,                   36 ; TILESET_COPYRIGHT
	tileset NintendoGfx,                    24 ; TILESET_NINTENDO
	tileset CompaniesGfx,                   49 ; TILESET_COMPANIES
	tileset SamGfx,                         36 ; TILESET_SAM
	tileset ImakuniGfx,                     36 ; TILESET_IMAKUNI
	tileset NikkiGfx,                       36 ; TILESET_NIKKI
	tileset RickGfx,                        36 ; TILESET_RICK
	tileset KenGfx,                         36 ; TILESET_KEN
	tileset AmyGfx,                         36 ; TILESET_AMY
	tileset IsaacGfx,                       36 ; TILESET_ISAAC
	tileset MitchGfx,                       36 ; TILESET_MITCH
	tileset GeneGfx,                        36 ; TILESET_GENE
	tileset MurrayGfx,                      36 ; TILESET_MURRAY
	tileset CourtneyGfx,                    36 ; TILESET_COURTNEY
	tileset SteveGfx,                       36 ; TILESET_STEVE
	tileset JackGfx,                        36 ; TILESET_JACK
	tileset RodGfx,                         36 ; TILESET_ROD
	tileset JosephGfx,                      36 ; TILESET_JOSEPH
	tileset DavidGfx,                       36 ; TILESET_DAVID
	tileset ErikGfx,                        36 ; TILESET_ERIK
	tileset JohnGfx,                        36 ; TILESET_JOHN
	tileset AdamGfx,                        36 ; TILESET_ADAM
	tileset JonathanGfx,                    36 ; TILESET_JONATHAN
	tileset JoshuaGfx,                      36 ; TILESET_JOSHUA
	tileset NicholasGfx,                    36 ; TILESET_NICHOLAS
	tileset BrandonGfx,                     36 ; TILESET_BRANDON
	tileset MatthewGfx,                     36 ; TILESET_MATTHEW
	tileset RyanGfx,                        36 ; TILESET_RYAN
	tileset AndrewGfx,                      36 ; TILESET_ANDREW
	tileset ChrisGfx,                       36 ; TILESET_CHRIS
	tileset MichaelGfx,                     36 ; TILESET_MICHAEL
	tileset DanielGfx,                      36 ; TILESET_DANIEL
	tileset RobertGfx,                      36 ; TILESET_ROBERT
	tileset BrittanyGfx,                    36 ; TILESET_BRITTANY
	tileset KristinGfx,                     36 ; TILESET_KRISTIN
	tileset HeatherGfx,                     36 ; TILESET_HEATHER
	tileset SaraGfx,                        36 ; TILESET_SARA
	tileset AmandaGfx,                      36 ; TILESET_AMANDA
	tileset JenniferGfx,                    36 ; TILESET_JENNIFER
	tileset JessicaGfx,                     36 ; TILESET_JESSICA
	tileset StephanieGfx,                   36 ; TILESET_STEPHANIE
	tileset AaronGfx,                       36 ; TILESET_AARON
	tileset MintGfx,                        36 ; TILESET_MINT
	assert_table_length NUM_TILESETS
