// Fighter's History
// #ID = 13284

// =========================================
//              Memory Accessors              
// =========================================

// Settings

function settings_difficulty() => byte(0x002233)

// Game

function game_state() => byte(0x0018AC)
function game_state_complement() => byte(0x0018B4)
function game_arcade_match() => low4(0x002220)
function game_bgm() => byte(0x02031F)

function round_timer() => byte(0x0009E5)
function match_round() => byte(0x001a00)

// P1 Data

function p1_score() => dword(0x0005E0)
function p1_character() => byte(0x0005E4)
function p1_continues_used() => byte(0x0006B4)
function p1_controlled_state() => byte(0x0009EC)
function p1_active_state() => byte(0x00064c)
function p1_hp() => byte(0x000A00)
function p1_rounds_won() => byte(0x000A02)

function p1_moves() => word(0x000A08)
function p1_move_strength() => byte(0x000A0C)
function p1_hits_dealt_on_current_round() => byte(0x000A94)

function p1_action_flags() => byte(0x000A20)
function p1_airborne() => bit0(0x0a20)
function p1_weak_point_intact() => bit1(0x0a20)

// P2 Data

function p2_score() => dword(0x0006E0)
function p2_character() => byte(0x0006E4)
function p2_controlled_state() => byte(0x000AEC)
function p2_active_state() => byte(0x00074c)
function p2_hp() => byte(0x000B00)
function p2_rounds_won() => byte(0x000B02)

function p2_moves() => word(0x000B08)
function p2_can_block() => byte(0x000B16)
function p2_last_move_hit_by() => word(0x000B64)

function p2_action_flags() => byte(0x000B20)
function p2_airborne() => bit0(0x0b20)
function p2_weak_point_intact() => bit1(0x0b20)

characters = {
    "Ray": 0x01,
    "Feilin": 0x02,
    "Ryoko": 0x03,
    "Matlok": 0x04,
    "Samchay": 0x05,
    "Lee": 0x06,
    "Mizoguchi": 0x07,
    "Jean": 0x08,
    "Marstorius": 0x09,
    "Clown": 0x0a,
    "Karnov": 0x0b
}


// =========================================
//             Utility Functions              
// =========================================

function p1_only() => p1_active_state() > 0 && p1_active_state() < 5 && never(p2_active_state() != 5)
function p1_only_reset() => never(p1_active_state() == 0 || p1_active_state() == 5) && never(p2_active_state() != 5)
function in_character_select() => game_state() == 0 && game_state_complement() == 2

function arcade_beaten() => game_arcade_match() == 10 && game_state() == 0x07 && prev(game_state()) != 0x07
function arcade_start() => game_arcade_match() == 0 && in_character_select()

function p1_won_a_round() => p1_rounds_won() > prev(p1_rounds_won())
function p1_won_a_match() => p1_rounds_won() == 2 && prev(p1_rounds_won()) != 2

function p2_hit_by_moves_range(move1, move2) {
	return(
		p2_last_move_hit_by() >= move1 && p2_last_move_hit_by() <= move2
	)
}

function p1_landed_a_hit() => p1_hits_dealt_on_current_round() > prev(p1_hits_dealt_on_current_round())

// =========================================
//              Beat the game              
// =========================================

achievement("Fighter's History", "Beat the game", 5, type="win_condition",
				trigger = 	p1_only() &&
							arcade_beaten()
				)

function achiev_beat_the_game(title, char) {
	achievement(title, format("Beat the game using only {0}.", char), 10,
				trigger = 	p1_only() &&
							once(arcade_start() && p1_character() == characters[char]) &&
							never(p1_character() != characters[char] && p1_won_a_round()) &&
							p1_character() == characters[char] &&
							trigger_when(arcade_beaten())
				)
}

achiev_beat_the_game("In Search of a Worth Challenger", "Ray")
achiev_beat_the_game("Proud Beauty", "Feilin")
achiev_beat_the_game("Judo Prodigy", "Ryoko")
achiev_beat_the_game("Legendary Guitar", "Matlok")
achiev_beat_the_game("A New Life Begins", "Samchay")
achiev_beat_the_game("Vengeance Never Satisfies...", "Lee")
achiev_beat_the_game("Momotaro Tsurugi", "Mizoguchi")
achiev_beat_the_game("The Perfectionist", "Jean")
achiev_beat_the_game("Wrestling in the Wild", "Marstorius")

achievement("The Great Grapple Champion", "Beat the game on the Hardest difficulty.", 25,
				trigger = 	p1_only() &&
							settings_difficulty() == 7 &&
							arcade_beaten()
				)

achievement("History in the Making", "Beat the game without using a continue on Medium difficulty.", 50,
				trigger = 	p1_only() &&
							settings_difficulty() >= 3 &&
							once(arcade_start()) &&
							never(p1_continues_used() > prev(p1_continues_used())) &&
							trigger_when(arcade_beaten())
				)

// =========================================
//             Dizzy Weak Point              
// =========================================

function achiev_dizzy_char(title, char, pronoun, points) {
	achievement(title, format("Stun {0} by targeting {1} weak spot.", char, pronoun), points,
				trigger = 	p1_only() &&
							game_state() == 0x01 &&
							p2_character() == characters[char] &&
							p2_weak_point_intact() == 0 && prev(p2_weak_point_intact()) == 1
				)
}

achiev_dizzy_char("Lighting Struck", "Ray", "his", 4)
achiev_dizzy_char("Chest Pain", "Feilin", "her", 4)
achiev_dizzy_char("Judoka’s Headache", "Ryoko", "her", 4)
achiev_dizzy_char("Cracked Sunglasses", "Matlok", "his", 4)
achiev_dizzy_char("Broken Honor", "Samchay", "his", 4)
achiev_dizzy_char("Weak Knees", "Lee", "his", 5)
achiev_dizzy_char("Band Breaker", "Mizoguchi", "his", 4)
achiev_dizzy_char("Snap the Strap", "Jean", "his", 4)
achiev_dizzy_char("Cold Legs", "Marstorius", "his", 4)
achiev_dizzy_char("Unmasked", "Clown", "his", 4)
achiev_dizzy_char("Torn Ghutrah", "Karnov", "his", 4)



// =========================================
//              	 Misc              
// =========================================

achievement("Perfect History", "Win a round without taking any damage.", 5,
			trigger = 	p1_only() &&
						p1_hp() == 0xff &&
						p1_won_a_round()
			)

achievement("Quick History", "Win a round with at least 85 seconds left.", 5,
			trigger = 	p1_only() &&
						round_timer() >= 85 &&
						p1_won_a_round()
			)

achievement("Wheel of Pain", "As Ray, land 5 Wheel Kicks on your opponent in a single round.", 5,
			trigger = 	p1_only_reset() &&
						never(game_state() == 0x00) &&
						never(p1_character() != characters["Ray"]) &&
						measured(repeated(5, p2_hit_by_moves_range(0x5a, 0x5c) && 
											 p1_landed_a_hit() 
										 )) &&
						never(match_round() != prev(match_round()))
			)

achievement("No Jumping Allowed", "As Feilin, anti-air your opponent 4 times with Hakkaku Souhiken in a single round.", 5,
			trigger = 	p1_only_reset() &&
						never(game_state() == 0x00) &&
						never(p1_character() != characters["Feilin"]) &&
						measured(repeated(4, p2_last_move_hit_by() == 0x8a && 
											 p1_landed_a_hit() &&
											 p2_airborne() == 1
										  )) &&
						never(match_round() != prev(match_round())) &&
						disable_when(repeated(2, p2_last_move_hit_by() == 0x8a && 
											     p1_landed_a_hit()
											 ),
									 p2_can_block() == 1
									 )
			)

achievement("Glacier Waif", "As Ryoko, grab your opponent 3 times with Chou Yama Arashi in a single round.", 5,
			trigger = 	p1_only_reset() &&
						never(game_state() == 0x00) &&
						never(p1_character() != characters["Ryoko"]) &&
						measured(repeated(3, p2_last_move_hit_by() == 0xb4 && 
											 p1_landed_a_hit() 
										 )) &&
						never(match_round() != prev(match_round()))
			)

achievement("Head Buster", "As Matlok, land 4 Overhead Kicks in a single round.", 5,
			trigger = 	p1_only_reset() &&
						never(game_state() == 0x00) &&
						never(p1_character() != characters["Matlok"]) &&
						measured(repeated(4, p2_last_move_hit_by() == 0xea && 
											 p1_landed_a_hit() 
										 )) &&
						never(match_round() != prev(match_round()))
			)

achievement("Easy Dizzy", "As Samchay, dizzy your opponent with a throw 2 times during a match.", 5,
			trigger = 	p1_only_reset() &&
						never(game_state() == 0x00) &&
						never(p1_character() != characters["Samchay"]) &&
						measured(repeated(2, __ornext(p1_moves() == 0x10f || p1_moves() == 0x112) && 
											 p2_weak_point_intact() < prev(p2_weak_point_intact())
										 )) &&
						never(match_round() < prev(match_round()))
			)

achievement("Gorilla Offense", "As Lee, perform a 4-hit combo using Super Zesshouhohou.", 5,
			trigger = 	p1_controlled_state() == 0 &&
						never(game_state() == 0x00) &&
						never(p1_character() != characters["Lee"]) &&
						never(p2_can_block() == 1) &&
						repeated(4, p1_landed_a_hit()) &&
						p1_landed_a_hit() && p1_moves() == 0x14a
			)

achievement("Dashing Shoryuken", "As Mizoguchi, land 4 Koryuusais in a single round.", 5,
			trigger = 	p1_only_reset() &&
						never(game_state() == 0x00) &&
						never(p1_character() != characters["Mizoguchi"]) &&
						measured(repeated(4, p2_hit_by_moves_range(0x177, 0x179) && 
											 p1_landed_a_hit()
										  )) &&
						never(match_round() != prev(match_round())) &&
						disable_when(repeated(2, p2_hit_by_moves_range(0x177, 0x179) && 
											     p1_landed_a_hit()
											 ),
									 p2_can_block() == 1
									 )
			)

achievement("Please Jump Into Me", "As Jean, throw Bal Rose 12 times and win the round.", 5,
			trigger = 	p1_controlled_state() == 0 &&
						never(game_state() == 0x00) &&
						never(p1_character() != characters["Jean"]) &&
						measured(repeated(12, p1_moves() == 0x1a4 && p1_moves() != prev(p1_moves()))) &&
						p1_won_a_round() &&
						never(match_round() != prev(match_round()))
			)

achievement("DOUBLE GERMAN", "As Marstorius, grab your opponent 3 times with Double German in a single round.", 5,
			trigger = 	p1_only_reset() &&
						never(game_state() == 0x00) &&
						never(p1_character() != characters["Marstorius"]) &&
						measured(repeated(3, p2_last_move_hit_by() == 0x1d7 && 
											 p1_landed_a_hit() 
										 )) &&
						never(match_round() != prev(match_round()))
			)


// =========================================
//                Leaderboard              
// =========================================

leaderboard("Fighter's High Score - Easiest", "Highest score during an Arcade run on Easiest difficulty (1CC).",
		   start = 	p1_only() &&
					settings_difficulty() == 0x00 &&
					game_arcade_match() == 0x00 &&
					p1_score() == 0 &&
					game_state() == 0x01,
		   cancel = p1_active_state() == 5 ||
		   			p2_active_state() != 5 ||
					p1_continues_used() > prev(p1_continues_used()),
		   submit = arcade_beaten(),
		   value = p1_score(),
		   format = "VALUE", lower_is_better=false
		   )

leaderboard("Fighter's High Score - Medium", "Highest score during an Arcade run on Medium difficulty (1CC).",
		   start = 	p1_only() &&
					settings_difficulty() == 0x03 &&
					game_arcade_match() == 0x00 &&
					p1_score() == 0 &&
					game_state() == 0x01,
		   cancel = p1_active_state() == 5 ||
		   			p2_active_state() != 5 ||
					p1_continues_used() > prev(p1_continues_used()),
		   submit = arcade_beaten(),
		   value = p1_score(),
		   format = "VALUE", lower_is_better=false
		   )

leaderboard("Fighter's High Score - Hardest", "Highest score during an Arcade run on Hardest difficulty (1CC).",
		   start = 	p1_only() &&
					settings_difficulty() == 0x07 &&
					game_arcade_match() == 0x00 &&
					p1_score() == 0 &&
					game_state() == 0x01,
		   cancel = p1_active_state() == 5 ||
		   			p2_active_state() != 5 ||
					p1_continues_used() > prev(p1_continues_used()),
		   submit = arcade_beaten(),
		   value = p1_score(),
		   format = "VALUE", lower_is_better=false
		   )