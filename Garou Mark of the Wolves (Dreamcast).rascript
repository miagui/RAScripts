// Garou: Mark of the Wolves
// #ID = 280

// =========================================
//              Memory Accessors              
// =========================================

// Settings

function settings_difficulty() => byte(0x1C363A)
function settings_round_timer() => byte(0x1C363B)
function settings_rounds() => byte(0x1C363C)

// Game

function game_state() => byte(0x1B64F2)
function game_mode() => byte(0x1B64FA)
function game_active_players() => byte(0x1B2230)

function game_arcade_match() => byte(0x1B9762)
function arcade_total_grade_score() => word(0x1B9848)

function round_timer() => byte(0x1B97C6)
function round_best_time() => word(0x1B97C8)
function survival_timer() => dword(0x1B97F0)

// P1 General

function p1_character() => word(0x1B9754)
function p1_active_state() => byte(0x1B98E2)
function p1_health() => byte(0x1B269E)
function p1_gauge() => byte(0x1B26CE)
function p1_score_bcd() => dword(0x1B987C)
function p1_match_score() => word(0x1B984A)
function p1_fighting_level() => byte(0x1B986A)
function p1_rounds_won() => byte(0x1B97A4)

function p1_moves() => word(0x1B266E)
function p1_just_defense() => byte(0x1B268D)
function p1_guard_cancel() => byte(0x1B269A)

// Usually P-Powers
function p1_special_moves_1() => byte(0x1B26DD)
		 MOVE_PPOWER_HIDDEN = 0x20
		 MOVE_PPOWER_KICK = 0x40
		 MOVE_PPOWER_PUNCH = 0x80

// Usually S-Powers
function p1_special_moves_2() => byte(0x1B26DE)
		 MOVE_SPOWER_KICK = 0x02
		 MOVE_SPOWER_PUNCH = 0x04

// Most Special Moves are here
function p1_special_moves_3() => byte(0x1B26DF)

function p1_feint() => bit0(0x1B26DC)
function p1_top_move() => bit5(0x1B26DC)

function p1_round_finishing_move_type() => byte(0x1B9832)
function p1_hit_combo_bcd() => byte(0x1C4228)

// P2

function p2_character() => word(0x1B9756)
function p2_active_state() => byte(0x1B98E3)
function p2_health() => byte(0x1B279E)
function p2_fighting_level() => byte(0x1B986B)
function p2_rounds_won() => byte(0x1B97A5)

function p2_air_thrown() => bit1(0x1b27e1)
function p2_counter_hit() => bit4(0x1b27e0)

characters = {
    "Terry": 0x00,
    "Rock": 0x01,
    "Dong Hwan": 0x02,
    "Jae Hoon": 0x03,
    "Hotaru": 0x04,
    "Gato": 0x05,
    "B. Jenet": 0x06,
    "Marco": 0x07,
    "Hokutomaru": 0x08,
    "Freeman": 0x09,
    "The Griffon": 0x0A,
    "Kevin": 0x0B,
    "Grant": 0x0C,
    "Kain": 0x0D
}


// =========================================
//             Utility Functions              
// =========================================

function p1_only() => p1_active_state() > 0 && never(p2_active_state() > 0)

function p1_won_a_round() => p1_rounds_won() > prev(p1_rounds_won())
function p1_won_a_match() => p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1

function arcade_start() => once(game_arcade_match() == 1 && game_state() == 8)
function arcade_has_started() => game_arcade_match() == 1 && round_best_time() > 0 && prev(round_best_time()) == 0
function game_beaten() => game_arcade_match() == 8 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1

function p1_landed_a_hit() => p1_hit_combo_bcd() > prev(p1_hit_combo_bcd())

// =========================================
//                  Combos              
// =========================================

achievement("Shinkuu Nage Trial", "Perform a 13-hit combo using Shinkuu Nage (break), Shine Knuckle and Rising Tackle (P-Power) as Rock.", 5,
			trigger = 	p1_only() &&
						never(p1_hit_combo_bcd() == 0) &&
						never(p2_counter_hit() == 1) &&
						p1_character() == characters["Rock"] &&
						p1_hit_combo_bcd() >= 0x13 &&
						once(p1_hit_combo_bcd() > 0 && prev(p1_hit_combo_bcd()) == 0) &&
						once(p1_landed_a_hit() && p1_special_moves_2() == 0x20) &&
						once(p1_landed_a_hit() && p1_special_moves_1() == MOVE_PPOWER_KICK) &&
						once(p1_landed_a_hit() && p1_special_moves_3() == 0x04) &&
						never(repeated(2, p1_gauge() < prev(p1_gauge()))) // Super Move spam protection
			)

achievement("Deadly Rave Neo Trial", "Perform a 18-hit combo using Deadly Rave Neo as Rock.", 5,
			trigger = 	p1_only() &&
						never(p1_hit_combo_bcd() == 0) &&
						never(p2_counter_hit() == 1) &&
						p1_character() == characters["Rock"] &&
						p1_hit_combo_bcd() >= 0x18 &&
						once(p1_hit_combo_bcd() > 0 && prev(p1_hit_combo_bcd()) == 0) &&
						once(p1_landed_a_hit() && p1_special_moves_1() == MOVE_PPOWER_HIDDEN) &&
						never(repeated(2, p1_gauge() < prev(p1_gauge()))) // Super Move spam protection
			)

achievement("Ore-sama Houou Kyaku Trial", "Perform a 21-hit combo using Ore-sama Houou Kyaku as Dong Hwan.", 5,
			trigger = 	p1_only() &&
						never(p1_hit_combo_bcd() == 0) &&
						never(p2_counter_hit() == 1) &&
						p1_character() == characters["Dong Hwan"] &&
						p1_hit_combo_bcd() >= 0x21 &&
						once(p1_hit_combo_bcd() > 0 && prev(p1_hit_combo_bcd()) == 0) &&
						once(p1_landed_a_hit() && p1_special_moves_1() == MOVE_PPOWER_HIDDEN) &&
						never(repeated(2, p1_gauge() < prev(p1_gauge()))) // Super Move spam protection
			)

achievement("Super Dong Hwan Trial", "Perform a 15-hit combo using Super Dong Hwan (S-Power) two times as Dong Hwan.", 5,
			trigger = 	p1_only() &&
						never(p1_hit_combo_bcd() == 0) &&
						never(p2_counter_hit() == 1) &&
						p1_character() == characters["Dong Hwan"] &&
						p1_hit_combo_bcd() >= 0x15 &&
						once(p1_hit_combo_bcd() > 0 && prev(p1_hit_combo_bcd()) == 0) &&
						once(p1_landed_a_hit() && p1_special_moves_2() == MOVE_SPOWER_PUNCH) &&
						repeated(2, p1_special_moves_2() == MOVE_SPOWER_PUNCH && prev(p1_special_moves_2()) == 0x00) &&
						never(repeated(3, p1_gauge() < prev(p1_gauge()))) // Super Move spam protection
			)

achievement("Rengeki Shuu Trial", "Perform a 18-hit combo using Kobi Kyaku (break), Rengeki Shuu and Tenshou Ranki (P-Power) as Hotaru.", 5,
			trigger = 	p1_only() &&
						never(p1_hit_combo_bcd() == 0) &&
						never(p2_counter_hit() == 1) &&
						p1_character() == characters["Hotaru"] &&
						p1_hit_combo_bcd() >= 0x16 &&
						once(p1_hit_combo_bcd() > 0 && prev(p1_hit_combo_bcd()) == 0) &&
						once(p1_landed_a_hit() && __ornext(p1_special_moves_2() == 0x10 || p1_special_moves_2() == 0x20) ) &&
						once(p1_landed_a_hit() && __ornext(p1_special_moves_3() == 0x10 || p1_special_moves_3() == 0x20) ) &&
						once(p1_landed_a_hit() && p1_special_moves_1() == MOVE_PPOWER_KICK) &&
						never(repeated(2, p1_gauge() < prev(p1_gauge()))) // Super Move spam protection
			)

achievement("Kyokugen Ko Hou Trial", "Perform a 15-hit combo using Ko Hou (break), Hien Shippu Kyaku and Kyokugen Ko Hou (P-Power) as Marco.", 5,
			trigger = 	p1_only() &&
						never(p1_hit_combo_bcd() == 0) &&
						never(p2_counter_hit() == 1) &&
						p1_character() == characters["Marco"] &&
						p1_hit_combo_bcd() >= 0x15 &&
						once(p1_hit_combo_bcd() > 0 && prev(p1_hit_combo_bcd()) == 0) &&
						once(p1_landed_a_hit() && __ornext(p1_special_moves_2() == 0x40 || p1_special_moves_2() == 0x80) ) &&
						once(p1_landed_a_hit() && p1_special_moves_3() == 0x20) &&
						once(p1_landed_a_hit() && p1_special_moves_1() == MOVE_PPOWER_KICK) &&
						never(repeated(2, p1_gauge() < prev(p1_gauge()))) // Super Move spam protection
			)

achievement("Ryuuko Ranbu Trial", "Perform a 23-hit combo using Ko Hou (break), Zanretsuken and Ryuuko Ranbu as Marco.", 5,
			trigger = 	p1_only() &&
						never(p1_hit_combo_bcd() == 0) &&
						never(p2_counter_hit() == 1) &&
						p1_character() == characters["Marco"] &&
						p1_hit_combo_bcd() >= 0x23 &&
						once(p1_hit_combo_bcd() > 0 && prev(p1_hit_combo_bcd()) == 0) &&
						once(p1_landed_a_hit() && __ornext(p1_special_moves_2() == 0x40 || p1_special_moves_2() == 0x80) ) &&
						once(p1_landed_a_hit() && p1_top_move() == 0x01) &&
						once(p1_landed_a_hit() && p1_special_moves_1() == MOVE_PPOWER_HIDDEN) &&
						never(repeated(2, p1_gauge() < prev(p1_gauge()))) // Super Move spam protection
			)

achievement("Kuuha Dan Trial", "Perform a 15-hit combo using Kuuha Dan (break), Kuuten Kyaku and Kyuukyoku Ougi (P-Power) as Hokutomaru.", 5,
			trigger = 	p1_only() &&
						never(p1_hit_combo_bcd() == 0) &&
						never(p2_counter_hit() == 1) &&
						p1_character() == characters["Hokutomaru"] &&
						p1_hit_combo_bcd() >= 0x15 &&
						once(p1_hit_combo_bcd() > 0 && prev(p1_hit_combo_bcd()) == 0) &&
						once(p1_landed_a_hit() && __ornext(p1_special_moves_3() == 0x04 || p1_special_moves_3() == 0x08) ) &&
						once(p1_landed_a_hit() && p1_special_moves_1() == MOVE_PPOWER_KICK) &&
						never(repeated(2, p1_gauge() < prev(p1_gauge()))) // Super Move spam protection
			)

achievement("Hell Rotor Trial", "Perform a 4-hit combo using Hell Trap (break), Gatling Freezer (S-Power) and Hell Rotor as Kevin.", 5,
			trigger = 	p1_only() &&
						never(p1_hit_combo_bcd() == 0) &&
						never(p2_counter_hit() == 1) &&
						p1_character() == characters["Kevin"] &&
						p1_hit_combo_bcd() >=0x04 &&
						once(p1_hit_combo_bcd() > 0 && prev(p1_hit_combo_bcd()) == 0) &&
						once(p1_landed_a_hit() && __ornext(p1_special_moves_3() == 0x04 || p1_special_moves_3() == 0x08) ) &&
						once(p1_landed_a_hit() && p1_special_moves_2() == MOVE_SPOWER_KICK) &&
						once(p1_landed_a_hit() && __ornext(p1_special_moves_3() == 0x40 || p1_special_moves_3() == 0x80) ) &&
						never(repeated(2, p1_gauge() < prev(p1_gauge()))) // Super Move spam protection
			)

achievement("Double Gatling Freezer Trial", "Perform a 10-hit combo using Gatling Freezer (S-Power) two times as Kevin.", 10,
			trigger = 	p1_only() &&
						never(p1_hit_combo_bcd() == 0) &&
						never(p2_counter_hit() == 1) &&
						p1_character() == characters["Kevin"] &&
						p1_hit_combo_bcd() >= 0x10 &&
						once(p1_hit_combo_bcd() > 0 && prev(p1_hit_combo_bcd()) == 0) &&
						once(p1_landed_a_hit() && p1_special_moves_2() == MOVE_SPOWER_KICK) &&
						repeated(2, p1_special_moves_2() == MOVE_SPOWER_KICK && prev(p1_special_moves_2()) == 0x00) &&
						never(repeated(3, p1_gauge() < prev(p1_gauge()))) // Super Move spam protection
			)

achievement("Double Lucky Strike Trial", "Perform a 12-hit combo using Lucky Strike (S-Power) two times and Hell Rotor three times as Kevin.", 10,
			trigger = 	p1_only() &&
						never(p1_hit_combo_bcd() == 0) &&
						never(p2_counter_hit() == 1) &&
						p1_character() == characters["Kevin"] &&
						p1_hit_combo_bcd() >= 0x12 &&
						once(p1_hit_combo_bcd() > 0 && prev(p1_hit_combo_bcd()) == 0) &&
						once(p1_landed_a_hit() && p1_special_moves_2() == MOVE_SPOWER_PUNCH) &&
						repeated(2, p1_special_moves_2() == MOVE_SPOWER_PUNCH && prev(p1_special_moves_2()) == 0x00) &&
						repeated(3, p1_special_moves_3() == 0x80 && prev(p1_special_moves_3()) != 0x80) &&
						never(repeated(3, p1_gauge() < prev(p1_gauge()))) // Super Move spam protection
			)

achievement("Full Blast Trial", "Perform a 5-hit combo using Full Blast as Freeman.", 5,
			trigger = 	p1_only() &&
						never(p1_hit_combo_bcd() == 0) &&
						never(p2_counter_hit() == 1) &&
						p1_character() == characters["Freeman"] &&
						p1_hit_combo_bcd() >= 0x05 &&
						once(p1_hit_combo_bcd() > 0 && prev(p1_hit_combo_bcd()) == 0) &&
						once(p1_landed_a_hit() && p1_special_moves_1() == MOVE_PPOWER_PUNCH) &&
						never(repeated(2, p1_gauge() < prev(p1_gauge()))) // Super Move spam protection
			)

achievement("Hercules Throw Trial", "Perform a 2-hit combo using Hercules Throw into Icarus Crash as The Griffon.", 4,
			trigger = 	p1_only() &&
						p1_character() == characters["The Griffon"] &&
						never(p2_air_thrown() == 0x00) &&
						repeated(2, p2_health() < prev(p2_health())) &&
						once(p2_health() < prev(p2_health()) && p1_special_moves_2() == 0x80) &&
						once(p2_health() < prev(p2_health()) && p1_special_moves_2() == 0x40)
			)

achievement("Aurora Trial", "Perform a 20-hit combo using The Hind (break) and Aurora (P-Power) as B. Jenet.", 5,
			trigger = 	p1_only() &&
						never(p1_hit_combo_bcd() == 0) &&
						never(p2_counter_hit() == 1) &&
						p1_character() == characters["B. Jenet"] &&
						p1_hit_combo_bcd() >= 0x20 &&
						once(p1_hit_combo_bcd() > 0 && prev(p1_hit_combo_bcd()) == 0) &&
						once(p1_landed_a_hit() && __ornext(p1_special_moves_3() == 0x04 || p1_special_moves_3() == 0x08) ) &&
						once(p1_landed_a_hit() && p1_special_moves_1() == MOVE_PPOWER_KICK) &&
						never(repeated(2, p1_gauge() < prev(p1_gauge()))) // Super Move spam protection
			)

achievement("Sen-Ga Trial", "Perform a 12-hit combo using Sen-Ga two times, Rai-Ga and Rei-Ga (P-Power) as Gato.", 5,
			trigger = 	p1_only() &&
						never(p1_hit_combo_bcd() == 0) &&
						never(p2_counter_hit() == 1) &&
						p1_character() == characters["Gato"] &&
						p1_hit_combo_bcd() >= 0x12 &&
						once(p1_hit_combo_bcd() > 0 && prev(p1_hit_combo_bcd()) == 0) &&
						once(p1_landed_a_hit() && __ornext(p1_special_moves_3() == 0x04 || p1_special_moves_3() == 0x08) ) &&
						once(p1_landed_a_hit() && p1_special_moves_3() == 0x20) &&
						once(p1_landed_a_hit() && p1_special_moves_1() == MOVE_PPOWER_PUNCH) &&
						repeated(2, __ornext(p1_special_moves_3() == 0x04 || p1_special_moves_3() == 0x08) && prev(p1_special_moves_3()) != p1_special_moves_3()) &&
						never(repeated(2, p1_gauge() < prev(p1_gauge()))) // Super Move spam protection
			)

achievement("Hou-ou Kyaku Trial", "Perform a 18-hit combo using Hi En Zan (break), Hou-yoku Tenshou Kyaku (S-Power) and Hou-ou Kyaku (S-Power) as Jae Hoon.", 5,
			trigger = 	p1_only() &&
						never(p1_hit_combo_bcd() == 0) &&
						never(p2_counter_hit() == 1) &&
						p1_character() == characters["Jae Hoon"] &&
						p1_hit_combo_bcd() >= 0x18 &&
						once(p1_hit_combo_bcd() > 0 && prev(p1_hit_combo_bcd()) == 0) &&
						once(p1_landed_a_hit() && __ornext(p1_special_moves_3() == 0x40 || p1_special_moves_3() == 0x80) ) &&
						once(p1_landed_a_hit() && p1_special_moves_2() == MOVE_SPOWER_KICK) &&
						once(p1_landed_a_hit() && p1_special_moves_2() == MOVE_SPOWER_PUNCH) &&
						never(repeated(3, p1_gauge() < prev(p1_gauge()))) // Super Move spam protection
			)

achievement("Buster Wolf Trial", "Perform a 8-hit combo using Power Dunk (break) and Buster Wolf (P-Power) as Terry.", 4,
			trigger = 	p1_only() &&
						never(p1_hit_combo_bcd() == 0) &&
						never(p2_counter_hit() == 1) &&
						p1_character() == characters["Terry"] &&
						p1_hit_combo_bcd() >= 0x08 &&
						once(p1_hit_combo_bcd() > 0 && prev(p1_hit_combo_bcd()) == 0) &&
						once(p1_landed_a_hit() && __ornext(p1_special_moves_3() == 0x04 || p1_special_moves_3() == 0x08) ) &&
						once(p1_landed_a_hit() && p1_special_moves_1() == MOVE_PPOWER_KICK) &&
						never(repeated(2, p1_gauge() < prev(p1_gauge()))) // Super Move spam protection
			)

achievement("Feint Cancel Trial", "Perform a 6-hit combo using feint cancel two times and Power Charge 3x as Terry.", 10,
			trigger = 	p1_only() &&
						never(p1_hit_combo_bcd() == 0) &&
						never(p2_counter_hit() == 1) &&
						p1_character() == characters["Terry"] &&
						p1_hit_combo_bcd() >= 0x06 &&
						once(p1_hit_combo_bcd() > 0 && prev(p1_hit_combo_bcd()) == 0) &&
						once(p1_landed_a_hit() && p1_special_moves_3() == 0x80) &&
						repeated(2, p1_feint() > prev(p1_feint())) &&
						never(repeated(2, p1_gauge() < prev(p1_gauge()))) // Super Move spam protection
			)

achievement("Himmlische Seele Trial", "Perform a 12-hit combo using crouching AB into C (target combo), Himmlische Atem (S-Power), Himmlische Seele (S-Power) and T.O.P attack as Kain.", 5,
			trigger = 	p1_only() &&
						never(p1_hit_combo_bcd() == 0) &&
						never(p2_counter_hit() == 1) &&
						p1_character() == characters["Kain"] &&
						p1_hit_combo_bcd() >= 0x12 &&
						once(p1_hit_combo_bcd() > 0 && prev(p1_hit_combo_bcd()) == 0) &&
						once(p1_landed_a_hit() && p1_special_moves_2() == MOVE_SPOWER_KICK) &&
						once(p1_landed_a_hit() && p1_special_moves_2() == MOVE_SPOWER_PUNCH) &&
						once(p1_landed_a_hit() && p1_top_move() == 0x01) &&
						never(repeated(3, p1_gauge() < prev(p1_gauge()))) // Super Move spam protection
			)

achievement("Ma-Heki Trial", "Perform a 8-hit combo using Ma-Heki four times and Majin Haten Dan (P-Power) as Grant.", 5,
			trigger = 	p1_only() &&
						never(p1_hit_combo_bcd() == 0) &&
						never(p2_counter_hit() == 1) &&
						p1_character() == characters["Grant"] &&
						p1_hit_combo_bcd() >= 0x08 &&
						once(p1_hit_combo_bcd() > 0 && prev(p1_hit_combo_bcd()) == 0) &&
						repeated(4, p1_landed_a_hit() && p1_special_moves_1() == 0x10 ) &&
						once(p1_landed_a_hit() && p1_special_moves_1() == MOVE_PPOWER_PUNCH) &&
						never(repeated(2, p1_gauge() < prev(p1_gauge()))) // Super Move spam protection
			)