// Fatal Fury 3: Road to the Final Victory
// #ID = 13773

// Settings

function settings_difficulty() => byte(0x00E04C)
function settings_timer() => byte(0x00E04F)

function default_timer() => settings_timer() == 0x60

// Game
function game_mode() => byte(0x41d6)
         MODE_TITLE_SCREEN = 0x00
         MODE_ARCADE_MODE_P1 = 0x01
         MODE_ARCADE_MODE_P2 = 0x02
         MODE_VERSUS_MODE = 0x03
         MODE_DEMO_MODE = 0x04
         MODE_CHARACTER_SELECT = 0x05

function game_screen_16bits() => word(0x000002)
function game_screen() => byte(0x000003)
		 GS_INTRODUCTION = 0xAE
		 GS_DEMO = 0xB0
		 GS_RANKING = 0xB2
		 GS_TITLE_SCREEN = 0xB3
		 GS_HOW_TO_PLAY = 0xBB
		 GS_CHARACTER_SELECT = 0xBD
		 GS_STAGE_SELECT = 0xC0
		 GS_STAGE_MAP = 0xC5
		 GS_VERSUS_SCREEN = 0xC6
		 GS_FIGHTING = 0xCA
		 GS_ROUND_END = 0xCB
		 GS_ROUND_RESULT = 0xD2
		 GS_WIN_QUOTE_ARCADE = 0xD4
		 GS_WIN_QUOTE_VERSUS = 0xD5
		 GS_CONTINUE = 0xD6
		 GS_ENDING_PART_1_JIN_BROTHERS = 0xD7
		 GS_ENDING_PART_2_CHARACTER = 0xD8
		 GS_GAME_OVER = 0xDA

function game_stage() => byte(0x005626)
		 STAGE_SOUND_BEACH = 0x01
		 STAGE_HOWARD_ARENA = 0x02
		 STAGE_NATIONAL_PARK = 0x03
		 STAGE_EAST_SIDE_PARK = 0x04
		 STAGE_GEESE_TOWER = 0x05
		 STAGE_DREAM_AMUSEMENT_PARK = 0x06
		 STAGE_PAO_PAO_CAFE_2 = 0x07
		 STAGE_PORT_TOWN = 0x08
		 STAGE_PIONEER_PLAZA = 0x09
		 STAGE_SOUTH_TOWN_AIRPORT = 0x0A
		 STAGE_SOUTH_STATION = 0x0B
	 	 STAGE_DELTA_PARK_GREEN = 0x0C
		 STAGE_DELTA_PARK_LAKE = 0x0D
		 STAGE_DELTA_PARK_FLAMES = 0x0E

function game_arcade_match() => byte(0x00562A)
function game_turbo_enabled_0xff() => byte(0x0056AF)

function arcade_total_grade_score() => word(0x007FBE)

function p1_score_xxxx0000() => word(0xe008)
function p1_score_0000xxxx() => word(0xe00a)

// Match

function match_round() => byte(0x00562C)
function round_timer() => byte(0x005681)
function round_best_time() => word(0x005682)

function p1_match_grade_score() => byte(0x005674)
function p1_round_score() => word(0x005692)
function p1_round_finishing_move() => byte(0x0056A0)

// P1
function p1_character() => byte(0x00561C)
function p1_hp() => byte(0x000488)
function p1_rounds_won() => byte(0x005667)
function p1_active_state() => byte(0x00FDB7)

function p1_animation() => word(0x000402)
function p1_moves() => byte(0x0004B5)

// P1 flags

function p1_special_moves_bitflags() => byte(0x0004C6)

function p1_hidden_desp_move_flag() => bit6(0x04c9)
function p1_desp_move_flag() => bit7(0x04c9)
function p1_taunting_flag() => bit3(0x04ca)
function p1_feint_desp_move_flag() => bit0(0x04cb)

function p1_projectile_on_screen() => bit0(0x04a1)

function p1_potential_power_0xff() => byte(0x008A85)
function p1_can_perform_hidden_desperation_move_0xff() => byte(0x008A87)
function p1_performed_hidden_desperation_move_0xff() => byte(0x008A89)
function p1_hit_combo() => byte(0x008A95)

// P2

function p2_character() => byte(0x00561E)
function p2_hp() => byte(0x000588)
function p2_rounds_won() => byte(0x005666)
function p2_active_state() => byte(0x00FDB6)

function p2_animation() => word(0x000502)

function p2_out_of_bounds_type1() => bit4(0x00055B)
function p2_out_of_bounds_type2() => bit3(0x0005CF)
function p2_knocked_into_wall_bitflags() => byte(0x0005F8)

function p2_potential_power_0xff() => byte(0x008A84)

characters = {
    "Terry": 0x01,
    "Andy": 0x02,
    "Joe": 0x03,
    "Mai": 0x04,
    "Geese": 0x05,
    "Sokaku": 0x06,
    "Bob Wilson": 0x07,
    "Hon-Fu": 0x08,
    "Blue-Mary": 0x09,
    "Franco Bash": 0x0A,
    "Yamazaki": 0x0B,
    "Chonshu": 0x0C,
    "Chonrei": 0x0D
}

// Utility

function p1_only() => never(p1_active_state() == 0) && never(p2_active_state() > 0)
function game_beaten() => (game_screen_16bits() == 0xd7ca && prev(game_screen_16bits()) != 0xd7ca && game_arcade_match() >= 0x0d) || game_beaten_true_ending()
function game_beaten_true_ending() => game_arcade_match() == 0x0f && prev(game_arcade_match()) == 0x0e 
function arcade_mode_start() => game_arcade_match() == 1 && game_screen() == GS_CHARACTER_SELECT

function p1_won_a_round() => p1_rounds_won() > prev(p1_rounds_won())
function p1_won_a_match() => p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1


// =========================================
//               Beat the Game              
// =========================================

achievement("The Batte of Destiny", "Beat the game on any difficulty and default settings.", 5, type="win_condition",
			trigger = 	p1_only() &&
						default_timer() &&
						game_beaten()
			)

function achiev_beat_the_game_character_ending(title, char) {
	achievement(title, format("Beat the game and get an ending using only {0} on any difficulty and default settings.", char), 10,
			trigger = 	p1_only() &&
						default_timer() &&
						once(arcade_mode_start()) &&
						never(p1_character() != characters[char] && p1_won_a_round()) &&
						p1_character() == characters[char] &&
						trigger_when(game_beaten())
			)
}

function achiev_beat_the_game_character(title, char) {
	achievement(title, format("Beat the game using only {0} on any difficulty and default settings.", char), 10,
			trigger = 	p1_only() &&
						default_timer() &&
						once(arcade_mode_start()) &&
						never(p1_character() != characters[char] && p1_won_a_round()) &&
						p1_character() == characters[char] &&
						trigger_when(game_beaten_true_ending())
			)
}

achiev_beat_the_game_character_ending("The Returning Legendary Man", "Terry")
achiev_beat_the_game_character_ending("The Stoic Young Noble of Koppo", "Andy")
achiev_beat_the_game_character_ending("The Youthful Muay Thai Champ", "Joe")
achiev_beat_the_game_character_ending("The Fabulous Ninja Babe", "Mai")
achiev_beat_the_game_character_ending("The Resurrected Ruler of Southtown", "Geese")
achiev_beat_the_game_character_ending("Scion of Shura Hunters", "Sokaku")
achiev_beat_the_game_character_ending("Pao Pao Cafe's Anticipated Rookie", "Bob Wilson")
achiev_beat_the_game_character_ending("Hong Kong's Toughest Flat", "Hon-Fu")
achiev_beat_the_game_character_ending("The Resourceful Lady Agent", "Blue-Mary")
achiev_beat_the_game_character_ending("The Suffering Former Kick Boxer", "Franco Bash")
achiev_beat_the_game_character("Ryuji Yamazaki", "Yamazaki")
achiev_beat_the_game_character("Jin Chonshu", "Chonshu")
achiev_beat_the_game_character("Jin Chonrei", "Chonrei")

achievement("Road to the Final Victory!", "Beat the game with the true ending without using a continue on Level-3 difficulty and default settings.", 50,
			trigger = 	p1_only() &&
						settings_difficulty() >= 2 &&
						default_timer() &&
						once(arcade_mode_start()) &&
						never(p1_active_state() == 2) &&
						trigger_when(game_beaten_true_ending())
			)

achievement("Immortality...The Last Refuge of Corruption!", "Beat the game on Expert mode and default settings.", 50,
			trigger = 	p1_only() &&
						settings_difficulty() == 8 &&
						default_timer() &&
						game_beaten_true_ending()
			)

// =========================================
//             Desperation Moves              
// =========================================

function achiev_finish_with_dm(title, char) {
	achievement(title, format("Win a round with a Desperation Move as {0} during Arcade mode.", char), 5,
				trigger = 	p1_only() &&
							p1_character() == characters[char] &&
							__ornext(p1_round_finishing_move() == 2 || p1_round_finishing_move() == 3) &&
							p1_rounds_won() > prev(p1_rounds_won())
				)
}

achiev_finish_with_dm("Power Geyser", "Terry")
achiev_finish_with_dm("Cho Reppa Dan", "Andy")
achiev_finish_with_dm("Screw Upper", "Joe")
achiev_finish_with_dm("Cho Hisatsu Shinobibachi", "Mai")
achiev_finish_with_dm("Raging Storm", "Geese")
achiev_finish_with_dm("Ikazuchi", "Sokaku")
achiev_finish_with_dm("Dangerous Wolf", "Bob Wilson")
achiev_finish_with_dm("Gadenza no Arashi", "Hon-Fu")
achiev_finish_with_dm("Mary Typhoon", "Blue-Mary")
achiev_finish_with_dm("Armageddon Buster", "Franco Bash")
achiev_finish_with_dm("La Guillotine", "Yamazaki")
achiev_finish_with_dm("Teio Rojin Ken", "Chonshu")
achiev_finish_with_dm("Teio Syu Myu Ken", "Chonrei")

function achiev_hit_with_hdm(title, char, points) {
	achievement(title, format("Hit your opponent with a Hidden Desperation Move as {0} during Arcade mode.", char), points,
				trigger = 	p1_only() &&
							p1_character() == characters[char] &&
							(p1_hidden_desp_move_flag() == 0x01 ||
							 p1_can_perform_hidden_desperation_move_0xff() == 0xff) &&
							trigger_when(p1_hit_combo() > prev(p1_hit_combo()) && p1_hidden_desp_move_flag() == 0x01)
				)
}

achiev_hit_with_hdm("Triple Geyser", "Terry", 5)
achiev_hit_with_hdm("Bokosuka Reppadan", "Andy", 5)
achiev_hit_with_hdm("Advancing Screw", "Joe", 5)
achiev_hit_with_hdm("Shiranui Hiohgi", "Mai", 5)
achiev_hit_with_hdm("Shin Raging Storm", "Geese", 5)
achiev_hit_with_hdm("Kishin Shokan", "Sokaku", 10)
achiev_hit_with_hdm("Dangerous Bob", "Bob Wilson", 5)
// achiev_hit_with_hdm("Gadenza no Taifuu", "Hon-Fu", 5)
// achiev_hit_with_hdm("Teio Ryu Sei Ken", "Chonrei", 5)

achievement("Mary Cyclone", "Hit your opponent with a Hidden Desperation Move as Blue-Mary during Arcade mode.", 5,
				trigger = 	p1_only() &&
							p1_character() == characters["Blue-Mary"] &&
							(p1_hidden_desp_move_flag() == 0x01 ||
							 p1_can_perform_hidden_desperation_move_0xff() == 0xff) &&
							trigger_when(p1_animation() == 0x422e && prev(p1_animation()) == 0x422e && p1_hidden_desp_move_flag() == 0x01) 
			)

achievement("Genocide Buster", "Hit your opponent with a Hidden Desperation Move and its finisher as Franco Bash during Arcade mode.", 10,
				trigger = 	p1_only() &&
							p1_character() == characters["Franco Bash"] &&
							(p1_hidden_desp_move_flag() == 0x01 ||
							 p1_can_perform_hidden_desperation_move_0xff() == 0xff) &&
							trigger_when(p1_animation() == 0x7db8 && prev(p1_animation()) == 0x7db8 && p1_hidden_desp_move_flag() == 0x01) 
			)

achievement("Alternate Guillotine", "Hit your opponent with a Hidden Desperation Move as Yamazaki during Arcade mode.", 5,
				trigger = 	p1_only() &&
							p1_character() == characters["Yamazaki"] &&
							(p1_hidden_desp_move_flag() == 0x01 ||
							 p1_can_perform_hidden_desperation_move_0xff() == 0xff) &&
							trigger_when(p1_animation() == 0x63b0 && prev(p1_animation()) == 0x63b0 && p1_hidden_desp_move_flag() == 0x01) 
			)

achievement("Gadenza no Taifuu", "Hit your opponent with a Hidden Desperation Move as Hon-Fu during Arcade mode.", 5,
				trigger = 	p1_only() &&
							p1_character() == characters["Hon-Fu"] &&
							(p1_hidden_desp_move_flag() == 0x01 ||
							 p1_can_perform_hidden_desperation_move_0xff() == 0xff) &&
							trigger_when(p1_animation() == 0x27f8 && prev(p1_animation()) == 0x27f8 && p1_hidden_desp_move_flag() == 0x01) 
			)

achievement("Teio Ryu Sei Ken", "Hit your opponent with a Hidden Desperation Move as Chonrei during Arcade mode.", 5,
				trigger = 	p1_only() &&
							p1_character() == characters["Chonrei"] &&
							(once(p1_hidden_desp_move_flag() == 0x01) ||
							 p1_can_perform_hidden_desperation_move_0xff() == 0xff) &&
							never(p1_projectile_on_screen() < prev(p1_projectile_on_screen())) &&
							trigger_when(p1_hit_combo() > prev(p1_hit_combo()) && once(p1_hidden_desp_move_flag() == 0x01))
			)

// =========================================
//                   Misc              
// =========================================

achievement("The Lone Wolves Are Back!", "Win a round with a perfect against the CPU.", 3,
			trigger = 	p1_only() &&
						p1_won_a_round() &&
						p1_hp() == 0x60			
			)

achievement("Only One Can Be the Strongest!", "Achieve an S rank grade against the CPU.", 10,
			trigger = 	p1_only() &&
						p1_match_grade_score() - prev(p1_match_grade_score()) == 25
			)

achievement("Unleash Your True Potential!", "Enter the Potential mode state.", 1,
			trigger = 	p1_active_state() == 1 &&
						p1_potential_power_0xff() == 0xff && prev(p1_potential_power_0xff()) == 0x00
			)

achievement("Fast Recovery", "Win a round in less than 10 seconds with Turbo mode enabled.", 4,
			trigger = 	p1_only() &&
						game_turbo_enabled_0xff() == 0xff &&
						round_best_time() <= 600 &&
						game_screen() >= 0xca && game_screen() <= 0xcb &&
						trigger_when(p1_won_a_round())
			)

achievement("Here Come New Fighters!", "Unlock the Jin brothers and Yamazaki on AES mode.", 5,
			trigger = 	game_screen_16bits() == 0xdda4 &&
						prev(game_screen_16bits()) == 0xde60
			
			)


// =========================================
//               Stage Cutscenes              
// =========================================

achievement("Pier Pressure", "Knock your opponent off the pier on the Sound Beach stage.", 3,
			trigger = 	p1_active_state() == 1 &&
						game_stage() == STAGE_SOUND_BEACH &&
						p2_out_of_bounds_type1() > prev(p2_out_of_bounds_type1())
			)

achievement("Splash Zone", "Throw your opponent into the pond at the Howard Arena stage.", 3,
			trigger = 	p1_active_state() == 1 &&
						game_stage() == STAGE_HOWARD_ARENA &&
						p2_out_of_bounds_type2() > prev(p2_out_of_bounds_type2())
			)

achievement("Swamped!", "Throw your opponent into the swamp at the National Park stage.", 3,
			trigger = 	p1_active_state() == 1 &&
						game_stage() == STAGE_NATIONAL_PARK &&
						p2_out_of_bounds_type1() > prev(p2_out_of_bounds_type1())
			)

achievement("Geese Was Here", "Make the clothes fall from the tree at the National Park stage.", 3,
			trigger = 	p1_active_state() == 1 &&
						game_stage() == STAGE_NATIONAL_PARK &&
						bit0(0x05f8) > prev(bit0(0x05f8))
			)

achievement("Tank Buster", "Slam your opponent against the aquarium glass on the East Side Park stage.", 3,
			trigger = 	p1_active_state() == 1 &&
						game_stage() == STAGE_EAST_SIDE_PARK &&
						bit2(0x05f8) > prev(bit2(0x05f8))
			)

achievement("Livin’ on the Edge", "Throw your opponent to the edge of the platform on the Port Town stage.", 3,
			trigger = 	p1_active_state() == 1 &&
						game_stage() == STAGE_PORT_TOWN &&
						p2_out_of_bounds_type2() > prev(p2_out_of_bounds_type2())
			)

achievement("Sky's the Limit", "Smash your opponent into the ceiling on the Pioneer Plaza stage.", 3,
			trigger = 	p1_active_state() == 1 &&
						game_stage() == STAGE_PIONEER_PLAZA &&
						p2_animation() == 0x3be8 && prev(p2_animation()) != 0x3be8
			)

achievement("Breaking the Fourth Wall", "Throw your opponent towards the screen.", 3,
			trigger = 	p1_active_state() == 1 &&
						p2_animation() == 0x3ce6 && prev(p2_animation()) != 0x3ce6
			)

achievement("The Cutest Predator", "Witness an alligator wear a cute ribbon.", 3,
			trigger = 	p1_active_state() == 1 &&
						never(game_stage() != STAGE_NATIONAL_PARK) &&
						repeated(60, match_round() == 4) &&
						never(match_round() != 4)
			)

// =========================================
//                Leaderboard              
// =========================================

// Arcade Score
leaderboard("FF3 - Arcade Score (Level-1)", "Highest score in Arcade mode on default settings.",
		   start = p1_only() && 
		   		   game_beaten() &&
				   settings_difficulty() == 0 &&
				   default_timer(),
		   cancel = always_false(),
		   submit = always_true(),
		   value = bcd(p1_score_xxxx0000()) * 10000 + bcd(p1_score_0000xxxx()),
		   format = "VALUE", lower_is_better=false)

leaderboard("FF3 - Arcade Score (Level-3)", "Highest score in Arcade mode on default settings.",
		   start = p1_only() && 
		   		   game_beaten() &&
				   __ornext(settings_difficulty() == 2 || settings_difficulty() == 3) &&
				   default_timer(),
		   cancel = always_false(),
		   submit = always_true(),
		   value = bcd(p1_score_xxxx0000()) * 10000 + bcd(p1_score_0000xxxx()),
		   format = "VALUE", lower_is_better=false)

leaderboard("FF3 - Arcade Score (Level-8)", "Highest score in Arcade mode on default settings.",
		   start = p1_only() && 
		   		   game_beaten() &&
				   settings_difficulty() >= 7 &&
				   default_timer(),
		   cancel = always_false(),
		   submit = always_true(),
		   value = bcd(p1_score_xxxx0000()) * 10000 + bcd(p1_score_0000xxxx()),
		   format = "VALUE", lower_is_better=false)


// Best Time - Normal
leaderboard("FF3 - Best Time (Level-1)", "Fastest time to finish Arcade mode on default settings..",
		   start = p1_only() && 
		   		   game_arcade_match() == 1 && 
				   round_best_time() > 0 && prev(round_best_time()) == 0 &&
				   settings_difficulty() == 0 &&
				   default_timer(),
		   cancel = (game_screen() == GS_INTRODUCTION) ||
		   			(game_arcade_match() == 0) ||
					(__ornext(p1_active_state() == 0 || p2_active_state() > 0)),
		   submit = game_beaten(),
		   value = round_best_time() > prev(round_best_time()),
		   format = "FRAMES", lower_is_better=true)

leaderboard("FF3 - Best Time (Level-3)", "Fastest time to finish Arcade mode on default settings.",
		   start = p1_only() && 
		   		   game_arcade_match() == 1 && 
				   round_best_time() > 0 && prev(round_best_time()) == 0 &&
				   __ornext(settings_difficulty() == 2 || settings_difficulty() == 3) &&
				   default_timer(),
		   cancel = (game_screen() == GS_INTRODUCTION) ||
		   			(game_arcade_match() == 0) ||
					(__ornext(p1_active_state() == 0 || p2_active_state() > 0)),
		   submit = game_beaten(),
		   value = round_best_time() > prev(round_best_time()),
		   format = "FRAMES", lower_is_better=true)

leaderboard("FF3 - Best Time (Level-8)", "Fastest time to finish Arcade mode on default settings.",
		   start = p1_only() && 
		   		   game_arcade_match() == 1 && 
				   round_best_time() > 0 && prev(round_best_time()) == 0 &&
				   settings_difficulty() >= 7 &&
				   default_timer(),
		   cancel = (game_screen() == GS_INTRODUCTION) ||
		   			(game_arcade_match() == 0) ||
					(__ornext(p1_active_state() == 0 || p2_active_state() > 0)),
		   submit = game_beaten(),
		   value = round_best_time() > prev(round_best_time()),
		   format = "FRAMES", lower_is_better=true)


// Grade Score (WON'T USE HERE)
// leaderboard("FF3 - Best Grade Score (Level-1)", "Default settings.",
// 		   start = p1_only() && 
// 		   		   game_arcade_match() == 1 && 
// 				   arcade_total_grade_score() == 0 && 
// 				   game_screen() == GS_FIGHTING && 
// 				   settings_difficulty() == 0 &&
// 				   default_timer(),
// 		   cancel = (game_screen() == GS_INTRODUCTION) ||
// 		   			(game_arcade_match() == 0) ||
// 					(__ornext(p1_active_state() == 0 || p2_active_state() > 0)),
// 		   submit = game_beaten(),
// 		   value = arcade_total_grade_score(),
// 		   format = "VALUE", lower_is_better=false)

// leaderboard("FF3 - Best Grade Score (Level-3)", "Default settings.",
// 		   start = p1_only() && 
// 		   		   game_arcade_match() == 1 && 
// 				   arcade_total_grade_score() == 0 && 
// 				   game_screen() == GS_FIGHTING && 
// 				   __ornext(settings_difficulty() == 2 || settings_difficulty() == 3) &&
// 				   default_timer(),
// 		   cancel = (game_screen() == GS_INTRODUCTION) ||
// 		   			(game_arcade_match() == 0) ||
// 					(__ornext(p1_active_state() == 0 || p2_active_state() > 0)),
// 		   submit = game_beaten(),
// 		   value = arcade_total_grade_score(),
// 		   format = "VALUE", lower_is_better=false)

// leaderboard("FF3 - Best Grade Score (Level-8)", "Default settings.",
// 		   start = p1_only() && 
// 		   		   game_arcade_match() == 1 && 
// 				   arcade_total_grade_score() == 0 && 
// 				   game_screen() == GS_FIGHTING && 
// 				   settings_difficulty() >= 7 &&
// 				   default_timer(),
// 		   cancel = (game_screen() == GS_INTRODUCTION) ||
// 		   			(game_arcade_match() == 0) ||
// 					(__ornext(p1_active_state() == 0 || p2_active_state() > 0)),
// 		   submit = game_beaten(),
// 		   value = arcade_total_grade_score(),
// 		   format = "VALUE", lower_is_better=false)
