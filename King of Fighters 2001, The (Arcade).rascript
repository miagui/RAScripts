// The King of Fighters 2001
// #ID = 12034

// Settings
function option_difficulty_aes() => byte(0x00009F)
function softdip_difficulty() => byte(0x00FD8C)

function default_difficulty() {
    return(
            ((option_difficulty_aes() >= 2 && mvs_flag() == 0) ||
             (softdip_difficulty() >= 2 && mvs_flag() == 1))
    )
}

function aes_or_mvs_indicator() => byte(0x00FD82)
function mvs_flag() => bit7(0x00FD83)

function unibios() => dword(0x00FE30)

// Game
function game_mode() => byte(0x00A7E0)
function game_stage() => byte(0x00a79b)

function battle_flags_match_4_completed() => bit3(0x00A798)
function arcade_match_progression_flags() => byte(0x00A798)
function arcade_match() => byte(0x00A79A)
function match_state() => byte(0xa787)
function round_started() => bit1(0xa787)

function round_timer() => byte(0xa7d3)

// Players
function p2_active_state() => byte(0x00FDB6)
function p1_active_state() => byte(0x00FDB7)

function p1_character_in_game() => byte(0x008170)
function p2_character_in_game() => byte(0x008458)

function p1_hp() => byte(0x008238)
function p2_hp() => byte(0x008438)

function p2_hit_combo() => byte(0x0082B1)
function p1_hit_combo() => byte(0x0084B1)

function p1_striker_used() => sum_of(range(4, 6), b => bit(b,0x821c))
function p1_animation() => word(0x008172)
function p1_maylee_hero() => byte(0x008183)
function p1_last_move() => word(0x0081EE)

function p1_score() => byte(0x0081FC)

function p1_character_slot_1() => byte(0x00A7E7)
function p1_character_slot_2() => byte(0x00A7E6)
function p1_character_slot_3() => byte(0x00A7E9)
function p1_character_slot_4() => byte(0x00A7E8)
function p1_character_order_2() => byte(0x00A800)
function p1_character_order_1() => byte(0x00A801)
function p1_character_order_4() => byte(0x00A802)
function p1_character_order_3() => byte(0x00A803)

function p1_character_slot_striker_32bits() => dword(0xa800)

function p1_rounds_won() => byte(0x00A818)
function p2_rounds_won() => byte(0x00A819)

function cutscene_ending() => byte(0x00E304)
function flag_striker() => byte(0x00E357)

function control_1p_weak_punch() => bit4(0x00FD94)
function control_1p_weak_kick() => bit5(0x00FD94)
function control_1p_strong_punch() => bit6(0x00FD94)
function control_1p_strong_kick() => bit7(0x00FD94)

// Utility
function no_unibios() => never(game_unibios() != 0)
function p1_only() => p1_active_state() > 0 && p2_active_state() == 0
function reset_main_menu() => never(p1_active_state() == 0 && p2_active_state() == 0)
function p1_only_globalreset() => (always_false() || never(p1_active_state() == 0) && never(p2_active_state() > 0))

function p1_team_has_char(char_id) => p1_character_slot_1() == char_id || p1_character_slot_2() == char_id || p1_character_slot_3() == char_id || p1_character_slot_4() == char_id
function p1_dont_have_char(char_id) => p1_character_slot_1() != char_id && p1_character_slot_2() != char_id && p1_character_slot_3() != char_id && p1_character_slot_4() != char_id

function p1_won_a_round() => p1_rounds_won() > prev(p1_rounds_won())

function team_play_beaten() {
    return(
        p2_character_in_game() == 41 &&
        arcade_match() == 7 && 
        game_stage() == 8 && 
        p1_rounds_won() > 0 && 
        cutscene_ending() > 0
    )
}

characters = {
   "K'": 0,
   "Maxima": 1,
   "Whip": 2,
   "Lin": 3,
   "Kyo": 4,
   "Benimaru": 5,
   "Daimon": 6,
   "Shingo": 7,
   "Iori": 8,
   "Vanessa": 9,
   "Seth": 10,
   "Ramon": 11,
   "Leona": 12,
   "Ralf": 13,
   "Clark": 14,
   "Heidern": 15,
   "Terry": 16,
   "Andy": 17,
   "Joe": 18,
   "Blue Mary": 19,
   "Ryo": 20,
   "Robert": 21,
   "Yuri": 22,
   "Takuma": 23,
   "King": 24,
   "Mai": 25,
   "Hinako": 26,
   "Xiangfei": 27,
   "Kula": 28,
   "Foxy": 29,
   "K9999": 30,
   "Angel": 31,
   "Athena": 32,
   "Kensou": 33,
   "Chin": 34,
   "Bao": 35,
   "Kim": 36,
   "Chang": 37,
   "Choi": 38,
   "May Lee": 39,
   "Zero": 40,
   "Igniz": 41,
}

// =========================================
//              Team Progression              
// =========================================

// NEW
function achiev_beat_the_game_team(title, char1, char2, char3, char4) {
    achievement(title, format("Finish Team Play using only {0}, {1}, {2} and {3} on default difficulty", char1, char2, char3, char4), 10, type="win_condition",
                trigger =   never(unibios() != 0) && 
                            p1_only() &&
                            reset_main_menu() &&
                            never(game_mode() != 1) &&
                            once(arcade_match_progression_flags() == 0 && arcade_match() == 0 && prev(p1_character_slot_1()) == 0xFF && p1_character_slot_1() != prev(p1_character_slot_1())) &&
                            never(p1_dont_have_char(characters[char1]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                            never(p1_dont_have_char(characters[char2]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                            never(p1_dont_have_char(characters[char3]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                            never(p1_dont_have_char(characters[char4]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                            p1_team_has_char(characters[char1]) &&
                            p1_team_has_char(characters[char2]) &&
                            p1_team_has_char(characters[char3]) &&
                            p1_team_has_char(characters[char4]) &&
                            trigger_when(team_play_beaten()) &&
                            default_difficulty()
                )
}

achiev_beat_the_game_team("The Official KOF 2001: Hero Team", "K'", "Maxima", "Whip", "Lin")
achiev_beat_the_game_team("The Official KOF 2001: Fatal Fury Team", "Terry", "Andy", "Joe", "Blue Mary")
achiev_beat_the_game_team("The Official KOF 2001: Psycho Soldier Team", "Athena", "Kensou", "Chin", "Bao")
achiev_beat_the_game_team("The Official KOF 2001: Japan Team", "Kyo", "Benimaru", "Daimon", "Shingo")
achiev_beat_the_game_team("The Official KOF 2001: Art of Fighting Team", "Ryo", "Robert", "Yuri", "Takuma")
achiev_beat_the_game_team("The Official KOF 2001: Korea Team", "Kim", "Chang", "Choi", "May Lee")
achiev_beat_the_game_team("The Official KOF 2001: Discarded Team", "Iori", "Vanessa", "Seth", "Ramon")
achiev_beat_the_game_team("The Official KOF 2001: Women Fighters Team", "King", "Mai", "Hinako", "Xiangfei")
achiev_beat_the_game_team("The Official KOF 2001: Ikari Assassins Team", "Leona", "Ralf", "Clark", "Heidern")
achiev_beat_the_game_team("The Official KOF 2001: Nest Team", "Kula", "Foxy", "K9999", "Angel")


// OLD
// achievement(
//     title = "The Official KOF 2001: Hero Team", points = 10, type="win_condition",
//     description = "Finish Team Play with K'-Maxima-Whip-Lin (choose in the exact sequence) on default difficulty",
//     id = 125327, badge = "137348", published = "13/09/2020 20:30:18", modified = "13/09/2020 20:30:18",
//     trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
//               game_mode() == 1 && once(bit0(0x00A798) > 0) && once(bit1(0x00A798) > 0) && once(bit2(0x00A798) > 0) &&
//               once(battle_flags_match_4_completed() > 0) && once(p2_character_in_game() == 41) &&
//               arcade_match() == 7 && low4(0x00A79B) == 8 && p1_rounds_won() > 0 && cutscene_ending() > 0 &&
//               unless(p1_character_slot_1() != 0) && unless(p1_character_slot_2() != 1) &&
//               unless(p1_character_slot_3() != 2) && unless(p1_character_slot_4() != 3) &&
//               ((option_difficulty_aes() >= 2 && mvs_flag() == 0) ||
//                (softdip_difficulty() >= 2 && mvs_flag() == 1))
// )

// achievement(
//     title = "The Official KOF 2001: Fatal Fury Team", points = 10, type="win_condition",
//     description = "Finish Team Play with Terry-Andy-Joe-Mary (choose in the exact sequence) on default difficulty",
//     id = 125328, badge = "137349", published = "13/09/2020 20:30:20", modified = "13/09/2020 20:30:20",
//     trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
//               game_mode() == 1 && once(bit0(0x00A798) > 0) && once(bit1(0x00A798) > 0) && once(bit2(0x00A798) > 0) &&
//               once(battle_flags_match_4_completed() > 0) && once(p2_character_in_game() == 41) &&
//               arcade_match() == 7 && low4(0x00A79B) == 8 && p1_rounds_won() > 0 && cutscene_ending() > 0 &&
//               never(p1_character_slot_1() != 16) && never(p1_character_slot_2() != 17) &&
//               never(p1_character_slot_3() != 18) && never(p1_character_slot_4() != 19) &&
//               ((option_difficulty_aes() >= 2 && mvs_flag() == 0) ||
//                (softdip_difficulty() >= 2 && mvs_flag() == 1))
// )

// achievement(
//     title = "The Official KOF 2001: Psycho Soldier Team", points = 10, type="win_condition",
//     description = "Finish Team Play with Athena-Kensou-Chin-Bao (choose in the exact sequence) on default difficulty",
//     id = 125329, badge = "137350", published = "13/09/2020 20:30:22", modified = "13/09/2020 20:30:22",
//     trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
//               game_mode() == 1 && once(bit0(0x00A798) > 0) && once(bit1(0x00A798) > 0) && once(bit2(0x00A798) > 0) &&
//               once(battle_flags_match_4_completed() > 0) && once(p2_character_in_game() == 41) &&
//               arcade_match() == 7 && low4(0x00A79B) == 8 && p1_rounds_won() > 0 && cutscene_ending() > 0 &&
//               unless(p1_character_slot_1() != 32) && unless(p1_character_slot_2() != 33) &&
//               unless(p1_character_slot_3() != 34) && unless(p1_character_slot_4() != 35) &&
//               ((option_difficulty_aes() >= 2 && mvs_flag() == 0) ||
//                (softdip_difficulty() >= 2 && mvs_flag() == 1))
// )

// achievement(
//     title = "The Official KOF 2001: Japan Team", points = 10, type="win_condition",
//     description = "Finish Team Play with Kyo-Benimaru-Daimon-Shingo (choose in the exact sequence) on default difficulty",
//     id = 125330, badge = "137351", published = "13/09/2020 20:30:24", modified = "13/09/2020 20:30:24",
//     trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
//               game_mode() == 1 && once(bit0(0x00A798) > 0) && once(bit1(0x00A798) > 0) && once(bit2(0x00A798) > 0) &&
//               once(battle_flags_match_4_completed() > 0) && once(p2_character_in_game() == 41) &&
//               arcade_match() == 7 && low4(0x00A79B) == 8 && p1_rounds_won() > 0 && cutscene_ending() > 0 &&
//               unless(p1_character_slot_1() != 4) && unless(p1_character_slot_2() != 5) &&
//               unless(p1_character_slot_3() != 6) && unless(p1_character_slot_4() != 7) &&
//               ((option_difficulty_aes() >= 2 && mvs_flag() == 0) ||
//                (softdip_difficulty() >= 2 && mvs_flag() == 1))
// )

// achievement(
//     title = "The Official KOF 2001: Art of Fighting Team", points = 10, type="win_condition",
//     description = "Finish Team Play with Ryo-Robert-Yuri-Takuma (choose in the exact sequence) on default difficulty",
//     id = 125331, badge = "137352", published = "13/09/2020 20:30:26", modified = "13/09/2020 20:30:26",
//     trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
//               game_mode() == 1 && once(bit0(0x00A798) > 0) && once(bit1(0x00A798) > 0) && once(bit2(0x00A798) > 0) &&
//               once(battle_flags_match_4_completed() > 0) && once(p2_character_in_game() == 41) &&
//               arcade_match() == 7 && low4(0x00A79B) == 8 && p1_rounds_won() > 0 && cutscene_ending() > 0 &&
//               unless(p1_character_slot_1() != 20) && unless(p1_character_slot_2() != 21) &&
//               unless(p1_character_slot_3() != 22) && unless(p1_character_slot_4() != 23) &&
//               ((option_difficulty_aes() >= 2 && mvs_flag() == 0) ||
//                (softdip_difficulty() >= 2 && mvs_flag() == 1))
// )

// achievement(
//     title = "The Official KOF 2001: Korea Team", points = 10, type="win_condition",
//     description = "Finish Team Play with Kim-Chang-Choi-May Lee (choose in the exact sequence) on default difficulty",
//     id = 125332, badge = "137353", published = "13/09/2020 20:30:28", modified = "13/09/2020 20:30:28",
//     trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
//               game_mode() == 1 && once(bit0(0x00A798) > 0) && once(bit1(0x00A798) > 0) && once(bit2(0x00A798) > 0) &&
//               once(battle_flags_match_4_completed() > 0) && once(p2_character_in_game() == 41) &&
//               arcade_match() == 7 && low4(0x00A79B) == 8 && p1_rounds_won() > 0 && cutscene_ending() > 0 &&
//               unless(p1_character_slot_1() != 36) && unless(p1_character_slot_2() != 37) &&
//               unless(p1_character_slot_3() != 38) && unless(p1_character_slot_4() != 39) &&
//               ((option_difficulty_aes() >= 2 && mvs_flag() == 0) ||
//                (softdip_difficulty() >= 2 && mvs_flag() == 1))
// )

// achievement(
//     title = "The Official KOF 2001: Discarded Team", points = 10, type="win_condition",
//     description = "Finish Team Play with Iori-Vanessa-Seth-Ramon (choose in the exact sequence) on default difficulty",
//     id = 125333, badge = "137354", published = "13/09/2020 20:30:30", modified = "13/09/2020 20:30:30",
//     trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
//               game_mode() == 1 && once(bit0(0x00A798) > 0) && once(bit1(0x00A798) > 0) && once(bit2(0x00A798) > 0) &&
//               once(battle_flags_match_4_completed() > 0) && once(p2_character_in_game() == 41) &&
//               arcade_match() == 7 && low4(0x00A79B) == 8 && p1_rounds_won() > 0 && cutscene_ending() > 0 &&
//               unless(p1_character_slot_1() != 8) && unless(p1_character_slot_2() != 9) &&
//               unless(p1_character_slot_3() != 10) && unless(p1_character_slot_4() != 11) &&
//               ((option_difficulty_aes() >= 2 && mvs_flag() == 0) ||
//                (softdip_difficulty() >= 2 && mvs_flag() == 1))
// )

// achievement(
//     title = "The Official KOF 2001: Women Fighters Team", points = 10, type="win_condition",
//     description = "Finish Team Play with King-Mai-Hinako-Xiangfei (choose in the exact sequence) on default difficulty",
//     id = 125334, badge = "137355", published = "13/09/2020 20:30:33", modified = "13/09/2020 20:30:33",
//     trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
//               game_mode() == 1 && once(bit0(0x00A798) > 0) && once(bit1(0x00A798) > 0) && once(bit2(0x00A798) > 0) &&
//               once(battle_flags_match_4_completed() > 0) && once(p2_character_in_game() == 41) &&
//               arcade_match() == 7 && low4(0x00A79B) == 8 && p1_rounds_won() > 0 && cutscene_ending() > 0 &&
//               unless(p1_character_slot_1() != 24) && unless(p1_character_slot_2() != 25) &&
//               unless(p1_character_slot_3() != 26) && unless(p1_character_slot_4() != 27) &&
//               ((option_difficulty_aes() >= 2 && mvs_flag() == 0) ||
//                (softdip_difficulty() >= 2 && mvs_flag() == 1))
// )

// achievement(
//     title = "The Official KOF 2001: Ikari Assassins Team", points = 10, type="win_condition",
//     description = "Finish Team Play with Leona-Ralf-Clark-Heidern (choose in the exact sequence) on default difficulty",
//     id = 125335, badge = "137356", published = "13/09/2020 20:30:35", modified = "13/09/2020 20:30:35",
//     trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
//               game_mode() == 1 && once(bit0(0x00A798) > 0) && once(bit1(0x00A798) > 0) && once(bit2(0x00A798) > 0) &&
//               once(battle_flags_match_4_completed() > 0) && once(p2_character_in_game() == 41) &&
//               arcade_match() == 7 && low4(0x00A79B) == 8 && p1_rounds_won() > 0 && cutscene_ending() > 0 &&
//               unless(p1_character_slot_1() != 12) && unless(p1_character_slot_2() != 13) &&
//               unless(p1_character_slot_3() != 14) && unless(p1_character_slot_4() != 15) &&
//               ((option_difficulty_aes() >= 2 && mvs_flag() == 0) ||
//                (softdip_difficulty() >= 2 && mvs_flag() == 1))
// )

// achievement(
//     title = "The Official KOF 2001: Nest Team", points = 10, type="win_condition",
//     description = "Finish Team Play with Kula-Foxy-K999-Angel (choose in the exact sequence) on default difficulty",
//     id = 125336, badge = "137357", published = "13/09/2020 20:30:37", modified = "13/09/2020 20:30:37",
//     trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
//               game_mode() == 1 && once(bit0(0x00A798) > 0) && once(bit1(0x00A798) > 0) && once(bit2(0x00A798) > 0) &&
//               once(battle_flags_match_4_completed() > 0) && once(p2_character_in_game() == 41) &&
//               arcade_match() == 7 && low4(0x00A79B) == 8 && p1_rounds_won() > 0 && cutscene_ending() > 0 &&
//               unless(p1_character_slot_1() != 28) && unless(p1_character_slot_2() != 29) &&
//               unless(p1_character_slot_3() != 30) && unless(p1_character_slot_4() != 31) &&
//               ((option_difficulty_aes() >= 2 && mvs_flag() == 0) ||
//                (softdip_difficulty() >= 2 && mvs_flag() == 1))
// )

// WIP: Needs testing 2
// Mixed Teams
achievement(
    title = "The Mix 2001 - Maxima Team", points = 10,
    description = "Finish Team Play using only Maxima as your first choice on default difficulty",
    id = 125347, badge = "137530", published = "13/09/2020 20:32:49", modified = "13/09/2020 20:32:49",
    trigger =   never(unibios() != 0) && 
                p1_only() &&
                reset_main_menu() &&
                never(game_mode() != 1) &&
                once(arcade_match_progression_flags() == 0 && arcade_match() == 0 && prev(p1_character_slot_1()) == 0xFF && p1_character_slot_1() != prev(p1_character_slot_1())) &&
                trigger_when(team_play_beaten()) &&
                never(p1_character_slot_1() != 1 && p1_won_a_round()) &&
                p1_character_slot_1() == 1 &&
                default_difficulty()
)

achievement(
    title = "The Mix 2001 - May Lee Team", points = 10,
    description = "Finish Team Play using only May Lee as your first choice on default difficulty",
    id = 125348, badge = "137603", published = "13/09/2020 20:32:57", modified = "13/09/2020 20:32:57",
    trigger =   never(unibios() != 0) && 
                p1_only() &&
                reset_main_menu() &&
                never(game_mode() != 1) &&
                once(arcade_match_progression_flags() == 0 && arcade_match() == 0 && prev(p1_character_slot_1()) == 0xFF && p1_character_slot_1() != prev(p1_character_slot_1())) &&
                trigger_when(team_play_beaten()) &&
                never(p1_character_slot_1() != 39 && p1_won_a_round()) &&
                p1_character_slot_1() == 39 &&
                default_difficulty()
)

achievement(
    title = "The Mix 2001 - Vanessa Team", points = 10,
    description = "Finish Team Play using only Vanessa as your first choice on default difficulty",
    id = 125350, badge = "137605", published = "13/09/2020 20:33:09", modified = "13/09/2020 20:33:09",
    trigger =   never(unibios() != 0) && 
                p1_only() &&
                reset_main_menu() &&
                never(game_mode() != 1) &&
                once(arcade_match_progression_flags() == 0 && arcade_match() == 0 && prev(p1_character_slot_1()) == 0xFF && p1_character_slot_1() != prev(p1_character_slot_1())) &&
                trigger_when(team_play_beaten()) &&
                never(p1_character_slot_1() != 9 && p1_won_a_round()) &&
                p1_character_slot_1() == 9 &&
                default_difficulty()
)

achievement(
    title = "The Mix 2001 - K9999 Team", points = 10,
    description = "Finish Team Play using only K9999 as your first choice on default difficulty",
    id = 125351, badge = "137606", published = "13/09/2020 20:33:16", modified = "13/09/2020 20:33:16",
    trigger =   never(unibios() != 0) && 
                p1_only() &&
                reset_main_menu() &&
                never(game_mode() != 1) &&
                once(arcade_match_progression_flags() == 0 && arcade_match() == 0 && prev(p1_character_slot_1()) == 0xFF && p1_character_slot_1() != prev(p1_character_slot_1())) &&
                trigger_when(team_play_beaten()) &&
                never(p1_character_slot_1() != 30 && p1_won_a_round()) &&
                p1_character_slot_1() == 30 &&
                default_difficulty()
)

// =========================================
//               Damage Dealer              
// =========================================

// Ticket 89261: If you pause during a hit in training mode, and then quit back to play arcade it will keep counting
//               the measured upwards from order select up until you get in game.
//               
//               Did this by complete accident after finishing a combo trial, quitting while the hitstun was still
//               active and going back to team play mode, I was able to reproduce it with other teams as well.
achievement(
    title = "Damage Counter 1: Hero Team", points = 10,
    description = "Deal 7500 damage with the Hero Team within a single continue on default difficulty",
    id = 125337, badge = "137372", published = "13/09/2020 20:30:39", modified = "02/11/2020 15:10:01",
    trigger =   never(unibios() != 0) && never(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
                measured(repeated(7500, p1_hit_combo() > 0 && round_started() > 0)) && never(p2_rounds_won() == 3) &&
                never(p1_dont_have_char(0)) &&
                never(p1_dont_have_char(1)) &&
                never(p1_dont_have_char(2)) &&
                never(p1_dont_have_char(3)) &&
                never(game_mode() == 6) &&
                default_difficulty()
               
)

achievement(
    title = "Damage Counter 2: Fatal Fury Team", points = 10,
    description = "Deal 7500 damage with the Fatal Fury Team within a single continue on default difficulty",
    id = 125338, badge = "137373", published = "13/09/2020 20:30:41", modified = "02/11/2020 15:09:57",
    trigger =   never(unibios() != 0) && never(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
                measured(repeated(7500, p1_hit_combo() > 0 && round_started() > 0))&& never(p2_rounds_won() == 3) &&
                never(p1_dont_have_char(16)) &&
                never(p1_dont_have_char(17)) &&
                never(p1_dont_have_char(18)) &&
                never(p1_dont_have_char(19)) &&
                never(game_mode() == 6) &&
                default_difficulty()
)

achievement(
    title = "Damage Counter 3: Psycho Soldier Team", points = 10,
    description = "Deal 7500 damage with the Psycho Soldier Team within a single continue on default difficulty",
    id = 125339, badge = "137374", published = "13/09/2020 20:31:29", modified = "02/11/2020 15:09:55",
    trigger =   never(unibios() != 0) && never(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
                measured(repeated(7500, p1_hit_combo() > 0 && round_started() > 0))&& never(p2_rounds_won() == 3) &&
                never(p1_dont_have_char(32)) &&
                never(p1_dont_have_char(33)) &&
                never(p1_dont_have_char(34)) &&
                never(p1_dont_have_char(35)) &&
                never(game_mode() == 6) &&
                default_difficulty()
)

achievement(
    title = "Damage Counter 4: Japan Team", points = 10,
    description = "Deal 7500 damage with the Japan Team within a single continue on default difficulty",
    id = 125340, badge = "137376", published = "13/09/2020 20:31:31", modified = "02/11/2020 15:09:52",
    trigger =   never(unibios() != 0) && never(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
                measured(repeated(7500, p1_hit_combo() > 0 && round_started() > 0))&& never(p2_rounds_won() == 3) &&
                never(p1_dont_have_char(4)) &&
                never(p1_dont_have_char(5)) &&
                never(p1_dont_have_char(6)) &&
                never(p1_dont_have_char(7)) &&
                never(game_mode() == 6) &&
                default_difficulty()
)

achievement(
    title = "Damage Counter 5: Art of Fighting Team", points = 10,
    description = "Deal 7500 damage with the Art of Fighting Team within a single continue on default difficulty",
    id = 125341, badge = "137378", published = "13/09/2020 20:31:34", modified = "02/11/2020 15:09:49",
    trigger =   never(unibios() != 0) && never(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
                measured(repeated(7500, p1_hit_combo() > 0 && round_started() > 0))&& never(p2_rounds_won() == 3) &&
                never(p1_dont_have_char(20)) &&
                never(p1_dont_have_char(21)) &&
                never(p1_dont_have_char(22)) &&
                never(p1_dont_have_char(23)) &&
                never(game_mode() == 6) &&
                default_difficulty()
)

achievement(
    title = "Damage Counter 6: Discarded Team", points = 10,
    description = "Deal 7500 damage with the Discarded Team within a single continue on default difficulty",
    id = 125342, badge = "137379", published = "13/09/2020 20:31:36", modified = "02/11/2020 15:09:46",
    trigger =   never(unibios() != 0) && never(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
                measured(repeated(7500, p1_hit_combo() > 0 && round_started() > 0))&& never(p2_rounds_won() == 3) &&
                never(p1_dont_have_char(8)) &&
                never(p1_dont_have_char(9)) &&
                never(p1_dont_have_char(10)) &&
                never(p1_dont_have_char(11)) &&
                never(game_mode() == 6) &&
                default_difficulty()
)

achievement(
    title = "Damage Counter 7: Women Fighters Team", points = 10,
    description = "Deal 7500 damage with the Women Fighters Team within a single continue on default difficulty",
    id = 125343, badge = "137382", published = "13/09/2020 20:31:38", modified = "02/11/2020 15:09:44",
    trigger =   never(unibios() != 0) && never(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
                measured(repeated(7500, p1_hit_combo() > 0 && round_started() > 0))&& never(p2_rounds_won() == 3) &&
                never(p1_dont_have_char(24)) &&
                never(p1_dont_have_char(25)) &&
                never(p1_dont_have_char(26)) &&
                never(p1_dont_have_char(27)) &&
                never(game_mode() == 6) &&
                default_difficulty()
)

achievement(
    title = "Damage Counter 8: Ikari Assassins Team", points = 10,
    description = "Deal 7500 damage with the Ikari Assassins  Team within a single continue on default difficulty",
    id = 125344, badge = "137383", published = "13/09/2020 20:31:41", modified = "02/11/2020 15:09:41",
    trigger =   never(unibios() != 0) && never(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
                measured(repeated(7500, p1_hit_combo() > 0 && round_started() > 0))&& never(p2_rounds_won() == 3) &&
                never(p1_dont_have_char(12)) &&
                never(p1_dont_have_char(13)) &&
                never(p1_dont_have_char(14)) &&
                never(p1_dont_have_char(15)) &&
                never(game_mode() == 6) &&
                default_difficulty()
)

achievement(
    title = "Damage Counter 9: Korea Team", points = 10,
    description = "Deal 7500 damage with the Korea Team within a single continue on default difficulty",
    id = 125345, badge = "137386", published = "13/09/2020 20:31:44", modified = "02/11/2020 15:09:39",
    trigger =   never(unibios() != 0) && never(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
                measured(repeated(7500, p1_hit_combo() > 0 && round_started() > 0))&& never(p2_rounds_won() == 3) &&
                never(p1_dont_have_char(36)) &&
                never(p1_dont_have_char(37)) &&
                never(p1_dont_have_char(38)) &&
                never(p1_dont_have_char(39)) &&
                never(game_mode() == 6) &&
                default_difficulty()
)

achievement(
    title = "Damage Counter 10: Nest Team", points = 10,
    description = "Deal 7500 damage with the NESTS Team within a single continue on default difficulty",
    id = 125346, badge = "137385", published = "13/09/2020 20:31:46", modified = "02/11/2020 15:09:37",
    trigger =   never(unibios() != 0) && never(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
                measured(repeated(7500, p1_hit_combo() > 0 && round_started() > 0))&& never(p2_rounds_won() == 3) &&
                never(p1_dont_have_char(28)) &&
                never(p1_dont_have_char(29)) &&
                never(p1_dont_have_char(30)) &&
                never(p1_dont_have_char(31)) &&
                never(game_mode() == 6) &&
                default_difficulty()
)

// =========================================
//             Desperation Moves               
// =========================================

achievement(
    title = "You Make Me Cry", points = 5,
    description = "Hit your opponent with all K' Desperation Moves",
    id = 125352, badge = "137401", published = "13/09/2020 20:34:15", modified = "13/09/2020 20:34:15",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 0) && once(p1_animation() == 178 || p1_animation() == 177) &&
              once(p1_animation() == 205 || p1_animation() == 204 || p1_animation() == 216) &&
              never(game_mode() == 6)
)

achievement(
    title = "No Need to Die Over This", points = 5,
    description = "Hit your opponent with all Maxima Desperation Moves",
    id = 125353, badge = "137408", published = "13/09/2020 20:34:18", modified = "13/09/2020 20:34:18",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 1) && once(p1_animation() == 166 || p1_animation() == 165) &&
              once(p1_animation() == 180 || p1_animation() == 187) && never(game_mode() == 6)
)

achievement(
    title = "I Believe in My Weapon", points = 5,
    description = "Hit your opponent with Whip Desperation Move",
    id = 125354, badge = "137411", published = "13/09/2020 20:34:21", modified = "13/09/2020 20:34:21",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 2) &&
              once(p1_animation() == 191 || p1_animation() == 190 || p1_animation() == 200) &&
              never(game_mode() == 6)
)

achievement(
    title = "My Venom Works Slow... Real... Slow...", points = 5,
    description = "Hit your opponent with all Lin Desperation Moves and a Super Desperation Move",
    id = 125355, badge = "137412", published = "13/09/2020 20:34:23", modified = "13/09/2020 20:34:23",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 3) && once(p1_animation() == 199 || p1_animation() == 230) &&
              once(p1_animation() == 242) && never(game_mode() == 6)
)

achievement(
    title = "But Tough to Keep Winning!", points = 5,
    description = "Hit your opponent with all Terry Desperation Moves",
    id = 125356, badge = "137414", published = "13/09/2020 20:34:26", modified = "13/09/2020 20:34:26",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 16) && once(p1_animation() == 183 || p1_animation() == 184) &&
              once(p1_animation() == 165 || p1_animation() == 166 || p1_animation() == 170) &&
              never(game_mode() == 6)
)

achievement(
    title = "Your Eagerness to Fight Really Moved Me", points = 5,
    description = "Hit your opponent with all Andy Desperation Moves",
    id = 125357, badge = "137417", published = "13/09/2020 20:34:30", modified = "13/09/2020 20:34:30",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 17) && once(p1_animation() == 190 || p1_animation() == 189) &&
              once(p1_animation() == 173 || p1_animation() == 172 || p1_animation() == 175) &&
              never(game_mode() == 6)
)

achievement(
    title = "Hmph! All Losers Say That!", points = 5,
    description = "Hit your opponent with all Joe Desperation Moves",
    id = 125358, badge = "137419", published = "13/09/2020 20:34:33", modified = "13/09/2020 20:34:33",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 18) && once(p1_animation() == 244) &&
              once(p1_animation() == 200 || p1_animation() == 199) && once(p1_animation() == 503) &&
              once(p1_animation() == 181 || p1_animation() == 180 || p1_animation() == 189) &&
              never(game_mode() == 6)
)

achievement(
    title = "I Have No Pity for You", points = 5,
    description = "Hit your opponent with all Blue Mary Desperation Moves",
    id = 125359, badge = "137420", published = "13/09/2020 20:34:35", modified = "13/09/2020 20:34:35",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 19) && once(p1_animation() == 223) && once(p1_animation() == 208) &&
              never(game_mode() == 6)
)

achievement(
    title = "A Fighting Idol's Life's Tough", points = 5,
    description = "Hit your opponent with all Athena Desperation Moves",
    id = 125360, badge = "137432", published = "13/09/2020 20:34:41", modified = "13/09/2020 20:34:41",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 32) &&
              once(p1_last_move() == 548 || p1_last_move() == 550 || p1_last_move() == 554 || p1_last_move() == 552) &&
              once(p1_last_move() == 549 || p1_last_move() == 551 || p1_last_move() == 555 || p1_last_move() == 553) &&
              never(game_mode() == 6)
)

achievement(
    title = "My Moves Aren't Magic. They're Pure Skill!", points = 5,
    description = "Hit your opponent with all Kensou Desperation Moves and a Super Desperation Move",
    id = 125361, badge = "137435", published = "13/09/2020 20:34:45", modified = "13/09/2020 20:34:45",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 33) && once(p1_last_move() == 549) && once(p1_last_move() == 560) &&
              never(game_mode() == 6)
)

achievement(
    title = "Life's a Wild Mare", points = 5,
    description = "Hit your opponent with all Chin Desperation Moves",
    id = 125362, badge = "137436", published = "13/09/2020 20:34:47", modified = "13/09/2020 20:34:47",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 34) && once(p1_last_move() == 562) &&
              once(p1_last_move() == 551 || p1_last_move() == 552) && never(game_mode() == 6)
)

achievement(
    title = "I May Be a Kid, but I'm No Child", points = 5,
    description = "Hit your opponent with all Bao Desperation Moves and a Super Desperation Move",
    id = 125363, badge = "137437", published = "13/09/2020 20:34:50", modified = "13/09/2020 20:34:50",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 35) && once(p1_last_move() == 552 && p1_animation() == 218) &&
              once(p1_last_move() == 554) && never(game_mode() == 6)
)

achievement(
    title = "I'm Not in Your Bush League", points = 5,
    description = "Hit your opponent with all Kim Desperation Moves",
    id = 125364, badge = "137446", published = "13/09/2020 20:34:52", modified = "13/09/2020 20:34:52",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 36) && once(p1_last_move() == 553 || p1_last_move() == 562) &&
              once(p1_last_move() == 555) && once(p1_last_move() == 564) && never(game_mode() == 6)
)

achievement(
    title = "Left It to Your Strength? What a Bonehead", points = 5,
    description = "Hit your opponent with all Chang Desperation Moves",
    id = 125365, badge = "137448", published = "13/09/2020 20:34:55", modified = "13/09/2020 20:34:55",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 37) && once(p1_last_move() == 549) &&
              once(p1_last_move() == 552 || p1_last_move() == 558) && never(game_mode() == 6)
)

achievement(
    title = "Too Fast for the Human Eye Am I!", points = 5,
    description = "Hit your opponent with all Choi Desperation Moves and a Super Desperation Move[1-P]",
    id = 125366, badge = "137449", published = "13/09/2020 20:34:57", modified = "13/09/2020 20:34:57",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 38) && once(p1_last_move() == 550) && once(p1_animation() == 177) &&
              once(p1_last_move() == 558 && p1_animation() == 198) && never(game_mode() == 6)
)

achievement(
    title = "As I Live and Breathe, Evil Will Not Prosper", points = 5,
    description = "Hit your opponent with all May Lee Desperation Moves and a Super Desperation Move",
    id = 125367, badge = "137450", published = "13/09/2020 20:35:00", modified = "13/09/2020 20:35:00",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 39) && once(p1_last_move() == 547) && once(p1_last_move() == 548) &&
              once(p1_last_move() == 562 && p1_animation() == 229) && once(p1_last_move() == 564) &&
              never(game_mode() == 6)
)

achievement(
    title = "Thought You'd Beat Kyokugen?", points = 5,
    description = "Hit your opponent with all Ryo Desperation Moves",
    id = 125368, badge = "137451", published = "13/09/2020 20:35:02", modified = "13/09/2020 20:35:02",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 20) && once(p1_last_move() == 557) && once(p1_last_move() == 551) &&
              once(p1_last_move() == 546) && never(game_mode() == 6)
)

achievement(
    title = "Totally Conceited, You Say?", points = 5,
    description = "Hit your opponent with all Robert Desperation Moves",
    id = 125369, badge = "137452", published = "13/09/2020 20:35:05", modified = "13/09/2020 20:35:05",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 21) && once(p1_last_move() == 566) && once(p1_last_move() == 551) &&
              once(p1_last_move() == 555 || p1_last_move() == 556) && never(game_mode() == 6)
)

achievement(
    title = "No One Can Imitate My Super Special Moves!", points = 5,
    description = "Hit your opponent with all Yuri Desperation Moves and a Super Desperation Move",
    id = 125370, badge = "137453", published = "13/09/2020 20:35:07", modified = "13/09/2020 20:35:07",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 22) && once(p1_last_move() == 572) && once(p1_last_move() == 554) &&
              once(p1_last_move() == 544) && never(game_mode() == 6)
)

achievement(
    title = "Kyokugen Once Proves It's the Ultimate Art of Fighting", points = 5,
    description = "Hit your opponent with all Takuma Desperation Moves",
    id = 125372, badge = "137454", published = "13/09/2020 20:35:12", modified = "13/09/2020 20:35:12",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 23) && once(p1_last_move() == 556) && once(p1_last_move() == 546) &&
              once(p1_last_move() == 553 || p1_last_move() == 555) && never(game_mode() == 6)
)

achievement(
    title = "Victory Was Predestined", points = 5,
    description = "Hit your opponent with all Kyo Desperation Moves and a Super Desperation Move",
    id = 125371, badge = "137487", published = "13/09/2020 20:35:10", modified = "13/09/2020 20:35:10",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 4) && once(p1_last_move() == 566 || p1_last_move() == 568) &&
              once(p1_last_move() == 560) && never(game_mode() == 6)
)

achievement(
    title = "You Know My Style: Win Beautifully. Got It!?", points = 5,
    description = "Hit your opponent with all Benimaru Desperation Moves",
    id = 125373, badge = "137488", published = "13/09/2020 20:37:34", modified = "13/09/2020 20:37:34",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 5) && once(p1_last_move() == 561) &&
              once(p1_last_move() == 552 || p1_last_move() == 551) && never(game_mode() == 6)
)

achievement(
    title = "Whooo. Haven't Been This Pumped Up", points = 5,
    description = "Hit your opponent with all Daimon Desperation Moves",
    id = 125374, badge = "137489", published = "13/09/2020 20:37:36", modified = "13/09/2020 20:37:36",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 6) && once(p1_last_move() == 548 || p1_last_move() == 550) &&
              once(p1_last_move() == 555) && once(p1_last_move() == 556) &&
              once(p1_last_move() == 558 || p1_last_move() == 557) && never(game_mode() == 6)
)

achievement(
    title = "I Don't Hold Back!", points = 5,
    description = "Hit your opponent with all Shingo Desperation Moves",
    id = 125375, badge = "137490", published = "13/09/2020 20:37:39", modified = "13/09/2020 20:37:39",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 7) && once(p1_last_move() == 560) &&
              once((p1_last_move() == 547 && p1_animation() == 163) || p1_animation() == 164 || p1_animation() == 169) &&
              never(game_mode() == 6)
)

achievement(
    title = "Fighting's a Test of Intellect", points = 5,
    description = "Hit your opponent with all King Desperation Moves",
    id = 125378, badge = "137493", published = "13/09/2020 20:37:50", modified = "13/09/2020 20:37:50",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 24) && once(p1_last_move() == 541) && once(p1_last_move() == 559) &&
              never(game_mode() == 6)
)

achievement(
    title = "You Really Can't Complain About My Shape", points = 5,
    description = "Hit your opponent with all Mai Desperation Moves",
    id = 125376, badge = "137491", published = "13/09/2020 20:37:41", modified = "13/09/2020 20:37:41",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 25) && once(p1_last_move() == 562 && p1_animation() == 196) &&
              once(p1_last_move() == 552 && p1_animation() == 181) &&
              once(p1_last_move() == 550 || p1_last_move() == 551) && never(game_mode() == 6)
)

achievement(
    title = "Oh, This Weight...", points = 5,
    description = "Hit your opponent with all Hinako Desperation Moves",
    id = 125377, badge = "137492", published = "13/09/2020 20:37:46", modified = "13/09/2020 20:37:46",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 26) && once(p1_last_move() == 560) &&
              once(p1_last_move() == 554 || p1_last_move() == 555) && never(game_mode() == 6)
)

achievement(
    title = "Next Time an Eating Contest?", points = 5,
    description = "Hit your opponent with all Xingfei Desperation Moves",
    id = 125379, badge = "137494", published = "13/09/2020 20:37:54", modified = "13/09/2020 21:26:29",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 27) && once(p1_last_move() == 553) &&
              once(p1_last_move() == 550 || p1_last_move() == 549) &&
              once(p1_last_move() == 559 || p1_last_move() == 557) && never(game_mode() == 6)
)

achievement(
    title = "If You Butch up a Bit, That Is!", points = 5,
    description = "Hit your opponent with all Vanessa Desperation Moves",
    id = 125380, badge = "137495", published = "13/09/2020 20:37:57", modified = "13/09/2020 20:37:57",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 9) && once(p1_last_move() == 551) &&
              once(p1_last_move() == 553 || p1_last_move() == 554) && never(game_mode() == 6)
)

achievement(
    title = "Never Come Near Me Again, Maggot...!", points = 5,
    description = "Hit your opponent with Iori Desperation Moves and a Super Desperation Move",
    id = 125381, badge = "137496", published = "13/09/2020 20:38:56", modified = "13/09/2020 20:38:56",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 8) && once(p1_last_move() == 550) && once(p1_last_move() == 552) &&
              never(game_mode() == 6)
)

achievement(
    title = "Call My Style Self-Defense", points = 5,
    description = "Hit your opponent with all Seth Desperation Moves",
    id = 125382, badge = "137497", published = "13/09/2020 20:38:58", modified = "16/09/2020 20:36:26",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 10) && once(p1_last_move() == 557) &&
              once(p1_last_move() == 555 && p1_animation() == 200) && never(game_mode() == 6)
)

achievement(
    title = "Yeah, I Didn't Think So!", points = 5,
    description = "Hit your opponent with all Ramon Desperation Moves",
    id = 125383, badge = "137498", published = "13/09/2020 20:39:01", modified = "16/09/2020 20:36:22",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 11) && once(p1_last_move() == 550) &&
              once(p1_last_move() == 551 || p1_last_move() == 552) && never(game_mode() == 6)
)

achievement(
    title = "Now, Get Out of Here...", points = 5,
    description = "Hit your opponent with all Leona Desperation Moves",
    id = 125384, badge = "137500", published = "13/09/2020 20:39:03", modified = "16/09/2020 20:36:19",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 12) && once(p1_last_move() == 560) && once(p1_last_move() == 555) &&
              once(p1_last_move() == 550 || p1_last_move() == 548) && never(game_mode() == 6)
)

achievement(
    title = "Get Serious, Cheesehead!", points = 5,
    description = "Hit your opponent with all Ralf Desperation Moves",
    id = 125385, badge = "137501", published = "13/09/2020 20:39:05", modified = "13/09/2020 20:39:05",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 13) && once(p1_last_move() == 557) &&
              once(p1_last_move() == 553 || p1_last_move() == 555) && never(game_mode() == 6)
)

achievement(
    title = "Then Get Out of the Battle Biz!", points = 5,
    description = "Hit your opponent with all Clark Desperation Moves",
    id = 125386, badge = "137502", published = "13/09/2020 20:39:07", modified = "13/09/2020 20:39:07",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 14) && once(p1_last_move() == 551) &&
              once(p1_last_move() == 548 || p1_last_move() == 549) && never(game_mode() == 6)
)

achievement(
    title = "Lost Concentration Means Death", points = 5,
    description = "Hit your opponent with all Heidern Desperation Moves",
    id = 125387, badge = "137507", published = "13/09/2020 20:39:09", modified = "13/09/2020 20:39:09",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 15) && once(p1_last_move() == 547) &&
              once(p1_last_move() == 550 || p1_last_move() == 551) && never(game_mode() == 6)
)

achievement(
    title = "Hello? I Won! Who's Next?", points = 5,
    description = "Hit your opponent with all Kula Desperation Moves and a Super Desperation Move",
    id = 125388, badge = "137508", published = "13/09/2020 20:39:11", modified = "13/09/2020 20:39:11",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 28) && once(p1_last_move() == 548 || p1_last_move() == 547) &&
              once(p1_last_move() == 549 && p1_animation() == 211) && never(game_mode() == 6)
)

achievement(
    title = "One Shot to the Chest and It's Nightey-Night...", points = 5,
    description = "Hit your opponent with Foxy Desperation Move and a Super Desperation Move",
    id = 125389, badge = "137509", published = "13/09/2020 20:39:14", modified = "13/09/2020 20:39:14",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 29) && once(p1_last_move() == 545) && once(p1_last_move() == 551) &&
              never(game_mode() == 6)
)

achievement(
    title = "Ho, Ho, Ho. No One Can Contain My Awesome Power", points = 5,
    description = "Hit your opponent with all K9999 Desperation Moves and a Super Desperation Move",
    id = 125390, badge = "137510", published = "13/09/2020 20:39:16", modified = "13/09/2020 20:39:16",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 30) && once(p1_last_move() == 542) && once(p1_last_move() == 543) &&
              once(p1_last_move() == 545) && never(game_mode() == 6)
)

achievement(
    title = "It's a Sin to Be Mighty?", points = 5,
    description = "Hit your opponent with Angel Desperation Move (Counter)",
    id = 125391, badge = "137511", published = "13/09/2020 20:40:11", modified = "15/09/2020 16:57:23",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 31) && once(p1_last_move() == 563 || p1_last_move() == 565) &&
              never(game_mode() == 6)
)

// =========================================
//                   Combos              
// =========================================

achievement(
    title = "C.Wave I - Slap's Balance", points = 5,
    description = "Perform a 28-hit combo with Whip",
    id = 125392, badge = "137514", published = "13/09/2020 20:40:14", modified = "13/09/2020 20:40:14",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 2) && p1_hit_combo() >= 40 &&
              ((mvs_flag() == 0) ||
               (mvs_flag() == 1))
)

achievement(
    title = "C.Wave II - Making Dizzy", points = 5,
    description = "Perform a 11-hit combo with Blue Mary",
    id = 125393, badge = "137516", published = "13/09/2020 20:40:16", modified = "13/09/2020 20:40:16",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 19) && p1_hit_combo() >= 17 &&
              ((mvs_flag() == 0) ||
               (mvs_flag() == 1))
)

achievement(
    title = "C.Wave III - Head Down", points = 5,
    description = "Perform a 13-hit combo with Kensou",
    id = 125394, badge = "137520", published = "13/09/2020 20:40:17", modified = "13/09/2020 20:40:17",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 33) && p1_hit_combo() >= 19 &&
              ((mvs_flag() == 0) ||
               (mvs_flag() == 1))
)

achievement(
    title = "C.Wave IV - Almost Imitation", points = 5,
    description = "Perform a 10-hit combo with Shingo",
    id = 125395, badge = "137522", published = "13/09/2020 20:40:19", modified = "13/09/2020 20:40:19",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 7) && p1_hit_combo() >= 16 &&
              ((mvs_flag() == 0) ||
               (mvs_flag() == 1))
)

achievement(
    title = "C.Wave V - Furious Fandango", points = 5,
    description = "Perform a 29-hit combo with Robert",
    id = 125396, badge = "137523", published = "13/09/2020 20:40:21", modified = "13/09/2020 20:40:21",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 21) && p1_hit_combo() >= 41 &&
              ((mvs_flag() == 0) ||
               (mvs_flag() == 1))
)

achievement(
    title = "C.Wave VI - Scream of Flames", points = 5,
    description = "Perform a 17-hit combo with Iori",
    id = 125397, badge = "137524", published = "13/09/2020 20:40:23", modified = "13/09/2020 20:40:23",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 8) && p1_hit_combo() >= 23 &&
              ((mvs_flag() == 0) ||
               (mvs_flag() == 1))
)

achievement(
    title = "C.Wave VII - Sprinter Legs", points = 5,
    description = "Perform a 24-hit combo with Kim",
    id = 125398, badge = "137525", published = "13/09/2020 20:40:25", modified = "13/09/2020 20:40:25",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 36) && p1_hit_combo() >= 36 &&
              ((mvs_flag() == 0) ||
               (mvs_flag() == 1))
)

achievement(
    title = "C.Wave IX - Eternal Freeze", points = 5,
    description = "Perform a 10-hit combo with Kula",
    id = 125399, badge = "137527", published = "13/09/2020 20:40:27", modified = "13/09/2020 20:40:27",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 28) && p1_hit_combo() >= 16 &&
              ((mvs_flag() == 0) ||
               (mvs_flag() == 1))
)

achievement(
    title = "C.Wave VIII - Explosion of Fists", points = 5,
    description = "Perform a 30-hit combo with Ralf",
    id = 125400, badge = "137526", published = "13/09/2020 20:40:28", modified = "13/09/2020 20:40:28",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 13) && p1_hit_combo() >= 48 &&
              ((mvs_flag() == 0) ||
               (mvs_flag() == 1))
)

achievement(
    title = "C.Wave X - Creating Fire", points = 5,
    description = "Perform a 13-hit combo with Mai",
    id = 125401, badge = "137529", published = "13/09/2020 20:40:30", modified = "13/09/2020 20:40:30",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 25) && p1_hit_combo() >= 19 &&
              ((mvs_flag() == 0) ||
               (mvs_flag() == 1))
)

achievement(
    title = "C.Wave XI - Monster Arm", points = 5,
    description = "Perform a 22-hit combo with K9999",
    id = 125457, badge = "137706", published = "14/09/2020 03:26:15", modified = "14/09/2020 03:26:15",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 30) && p1_hit_combo() >= 34 &&
              ((mvs_flag() == 0) ||
               (mvs_flag() == 1))
)

achievement(
    title = "C.Wave XII - Super Electrocuted", points = 5,
    description = "Perform a 12-hit combo with Benimaru",
    id = 125458, badge = "137707", published = "14/09/2020 03:26:19", modified = "14/09/2020 03:26:19",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 5) && p1_hit_combo() >= 18 &&
              ((mvs_flag() == 0) ||
               (mvs_flag() == 1))
)

achievement(
    title = "C.Wave XIV - Full Karateka", points = 5,
    description = "Perform a 16-hit combo with Takuma",
    id = 125459, badge = "137709", published = "14/09/2020 03:26:23", modified = "14/09/2020 03:26:23",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 23) && p1_hit_combo() >= 22 &&
              ((mvs_flag() == 0) ||
               (mvs_flag() == 1))
)

achievement(
    title = "C.Wave XIII - Quick Punches", points = 5,
    description = "Perform a 16-hit combo with Vanessa",
    id = 125460, badge = "137708", published = "14/09/2020 03:26:27", modified = "14/09/2020 03:26:27",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 9) && p1_hit_combo() >= 22 &&
              ((mvs_flag() == 0) ||
               (mvs_flag() == 1))
)

achievement(
    title = "C.Wave XV - Muay Thai", points = 5,
    description = "Perform a 13-hit combo with Joe",
    id = 125461, badge = "137711", published = "14/09/2020 03:44:13", modified = "14/09/2020 03:44:13",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              unless(p1_character_in_game() != 18) && p1_hit_combo() >= 19 &&
              ((mvs_flag() == 0) ||
               (mvs_flag() == 1))
)

// =========================================
//                    Misc              
// =========================================

// Ticket 71999: it\'s doesn\'t work for that achievement. what\'s the point, whyyyy?! l have no idea, how am l
//               supposed to do for that achievement?
achievement(
    title = "Cross Slot's I - 4x0", points = 2,
    description = "Finish Team Play using: Char Slot 4x | Striker Slot 0x on default difficulty",
    id = 125402, badge = "137631", published = "13/09/2020 20:40:32", modified = "13/09/2020 20:40:32",
    trigger =   never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
                game_mode() == 1 && 
                once(arcade_match_progression_flags() == 0 && arcade_match() == 0 && round_timer() == 0x59 && prev(round_timer()) == 0x60) &&
                trigger_when(team_play_beaten()) &&
                p1_character_slot_striker_32bits() == 0x00000000 &&
                never(p1_character_slot_striker_32bits() != 0x00000000 && p1_won_a_round()) &&
                default_difficulty()
)

achievement(
    title = "Cross Slot's II - 3x1", points = 3,
    description = "Finish Team Play using: Char Slot 3x | Striker Slot 1x on default difficulty",
    id = 125403, badge = "137632", published = "13/09/2020 20:40:35", modified = "13/09/2020 20:40:35",
    trigger =   never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
                game_mode() == 1 &&
                once(arcade_match_progression_flags() == 0 && arcade_match() == 0 && round_timer() == 0x59 && prev(round_timer()) == 0x60) &&
                trigger_when(team_play_beaten()) &&
                p1_character_slot_striker_32bits() == 0x00ff0000 &&
                never(p1_character_slot_striker_32bits() != 0x00ff0000 && p1_won_a_round()) &&
                default_difficulty()
)

achievement(
    title = "Cross Slot's III - 2x2", points = 4,
    description = "Finish Team Play using: Char Slot 2x | Striker Slot 2x on default difficulty",
    id = 125404, badge = "137633", published = "13/09/2020 20:40:36", modified = "13/09/2020 20:40:36",
    trigger =   never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
                game_mode() == 1 && 
                once(arcade_match_progression_flags() == 0 && arcade_match() == 0 && round_timer() == 0x59 && prev(round_timer()) == 0x60) &&
                trigger_when(team_play_beaten()) &&
                p1_character_slot_striker_32bits() == 0xffff0000 &&
                never(p1_character_slot_striker_32bits() != 0xffff0000 && p1_won_a_round()) &&
                default_difficulty()
)

achievement(
    title = "Cross Slot's IV - 1x3", points = 5,
    description = "Finish Team Play using: Char Slot 1x | Striker Slot 3x on default difficulty",
    id = 125405, badge = "137634", published = "13/09/2020 20:40:38", modified = "13/09/2020 20:40:38",
    trigger =   never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
                game_mode() == 1 && 
                once(arcade_match_progression_flags() == 0 && arcade_match() == 0 && round_timer() == 0x59 && prev(round_timer()) == 0x60) &&
                trigger_when(team_play_beaten()) &&
                p1_character_slot_striker_32bits() == 0xffff00ff &&
                never(p1_character_slot_striker_32bits() != 0xffff00ff && p1_won_a_round()) &&
                default_difficulty()
)

achievement(
    title = "I-Basic KOF Move 2001 - Recovery", points = 1,
    description = "Perform a Recovery Roll",
    id = 125406, badge = "137637", published = "13/09/2020 20:40:40", modified = "13/09/2020 20:40:40",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              never(game_mode() == 6) && p1_animation() == 69
)

achievement(
    title = "II-Basic KOF Move 2001 - GC Evade", points = 1,
    description = "Perform a Guard Cancel evade",
    id = 125407, badge = "137638", published = "13/09/2020 20:40:42", modified = "13/09/2020 20:40:42",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              never(game_mode() == 6) && (p1_animation() == 61 || p1_animation() == 59)
)

achievement(
    title = "III-Basic KOF Move 2000 - GC Body Blow", points = 1,
    description = "Perform a Guard Cancel in body blow",
    id = 125408, badge = "137639", published = "13/09/2020 20:40:44", modified = "13/09/2020 20:40:44",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              never(game_mode() == 6) && (p1_last_move() == 1083 && p1_animation() == 118)
)

achievement(
    title = "A Little Bit of the Record Truth", points = 5,
    description = "Achieve 400.000 points",
    id = 125413, badge = "137662", published = "13/09/2020 20:40:58", modified = "13/09/2020 20:40:58",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && unless(p2_active_state() != 0) && p1_score() >= 64 &&
              unless(arcade_match() == 0)
)

achievement(
    title = "The Total Humiliation for CPU", points = 3,
    description = "Tease your opponent 10 times without being hit",
    id = 125415, badge = "137671", published = "13/09/2020 20:41:20", modified = "13/09/2020 20:41:20",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              measured(repeated(10, p1_animation() == 70)) && unless(prev(p1_animation()) == 70) && never(p2_hit_combo() > 0) &&
              never(game_mode() == 6)
)

achievement(
    title = "Active Friend Advocate", points = 5,
    description = "Use your the Striker 10 times",
    id = 125416, badge = "137678", published = "13/09/2020 20:41:23", modified = "13/09/2020 21:12:51",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              measured(repeated(10, p1_striker_used() > prev(p1_striker_used()))) && never(game_mode() == 6)
)

achievement(
    title = "Training Fists! Osu...", points = 3,
    description = "Defeat a team using only the punch buttons",
    id = 125420, badge = "137668", published = "13/09/2020 20:44:23", modified = "13/09/2020 20:44:23",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              once(p1_rounds_won() == 0 && p2_rounds_won() == 0 && p2_hp() == 102 && p1_rounds_won() == 0) &&
              p1_rounds_won() == 3 && never(control_1p_weak_kick() > 0) && never(control_1p_strong_kick() > 0)
)

achievement(
    title = "Serious Kicking Fighter Stance", points = 3,
    description = "Defeat a team using only the kick buttons",
    id = 125421, badge = "137669", published = "13/09/2020 20:44:26", modified = "13/09/2020 20:44:26",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              once(p1_rounds_won() == 0 && p2_rounds_won() == 0 && p2_hp() == 102 && p1_rounds_won() == 0) &&
              p1_rounds_won() == 3 && never(control_1p_weak_punch() > 0) && never(control_1p_strong_punch() > 0)
)

achievement(
    title = "Super Strong Student Blow", points = 3,
    description = "Perform Psychic 9 - Athena's Psychic Throw",
    id = 125417, badge = "137681", published = "13/09/2020 20:41:26", modified = "13/09/2020 20:41:26",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              p1_character_in_game() == 32 && once(p1_last_move() == 558 && p1_animation() == 215)
)

achievement(
    title = "Going up in Underwear", points = 3,
    description = "Perform Psychic 9 - Athena's Psycho Sword",
    id = 125418, badge = "137680", published = "13/09/2020 20:41:29", modified = "13/09/2020 20:41:29",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              p1_character_in_game() == 32 && once(p1_last_move() == 559 && p1_animation() == 503)
)

achievement(
    title = "Golden Warrior Athena", points = 3,
    description = "Perform Psychic 9 - Athena's Fire Sword",
    id = 125419, badge = "137682", published = "13/09/2020 20:41:32", modified = "13/09/2020 20:41:32",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              p1_character_in_game() == 32 && once(p1_last_move() == 557 && p1_animation() == 214)
)

achievement(
    title = "Mercy Does Not Prevail", points = 5,
    description = "Defeat any boss while having more than 60% health in Team Play",
    id = 125414, badge = "137667", published = "13/09/2020 20:41:00", modified = "14/09/2020 18:11:54",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              game_mode() == 1 && arcade_match() >= 6 && p1_rounds_won() > 0 && p1_hp() >= 68 &&
              ((low4(0x00A79B) == 7 && once(p2_character_in_game() == 40)) ||
               (low4(0x00A79B) == 8 && once(p2_character_in_game() == 41)))
)

achievement(
    title = "An Adventurer in Search of Glory", points = 10,
    description = "Finish Single Play mode on default difficulty",
    id = 125409, badge = "137666", published = "13/09/2020 20:40:48", modified = "13/09/2020 20:40:48",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              game_mode() == 0 && 
              p2_character_in_game() == 41 &&
              arcade_match() == 7 && low4(0x00A79B) == 8 && 
              p1_rounds_won() == 2 && cutscene_ending() > 0 &&
              default_difficulty()
)

achievement(
    title = "The incredible Hero May Lee", points = 25,
    description = "Finish Single Play by winning each fight while transformed into May Lee's Hero mode on default difficulty (2 rounds)",
    id = 125410, badge = "137663", published = "13/09/2020 20:40:50", modified = "13/09/2020 20:40:50",
    trigger =   never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
                game_mode() == 0 && 
                once(arcade_match_progression_flags() == 0 && arcade_match() == 0 && prev(p1_character_slot_1()) == 0xFF && p1_character_slot_1() != prev(p1_character_slot_1())) &&
                trigger_when(p2_character_in_game() == 41 &&
                             arcade_match() == 7 && low4(0x00A79B) == 8 && 
                             p1_rounds_won() == 2 && cutscene_ending() > 0) &&
                never((p1_rounds_won() == 2 && p1_maylee_hero() == 0)) && 
                never((p1_rounds_won() == 2 && p1_character_in_game() != characters["May Lee"])) && 
                // (p1_maylee_hero() == 4 && cutscene_ending() > 0) && // MAYBE NOT NEEDED?
                default_difficulty()
)

achievement(
    title = "Bruised by the Pleasure of Difficulty", points = 25,
    description = "Finish Team Play mode on the highest difficulty",
    id = 125411, badge = "137664", published = "13/09/2020 20:40:53", modified = "13/09/2020 20:40:53",
    trigger =   never(unibios() != 0) && unless(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
                game_mode() == 1 && 
                once(arcade_match_progression_flags() == 0 && arcade_match() == 0 && prev(p1_character_slot_1()) == 0xFF && p1_character_slot_1() != prev(p1_character_slot_1())) &&
                trigger_when(team_play_beaten()) &&
                ((option_difficulty_aes() == 7 && mvs_flag() == 0) ||
                 (softdip_difficulty() == 7 && mvs_flag() == 1))
)

achievement(
    title = "My Last Game Scheduled", points = 25,
    description = "Finish Team Play mode using only one credit",
    id = 125412, badge = "137665", published = "13/09/2020 20:40:55", modified = "13/09/2020 20:40:55",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && unless(p2_active_state() != 0) &&
              game_mode() == 1 && 
              once(arcade_match_progression_flags() == 0 && arcade_match() == 0 && prev(p1_character_slot_1()) == 0xFF && p1_character_slot_1() != prev(p1_character_slot_1())) &&
              trigger_when(team_play_beaten()) &&
              default_difficulty()
)

// =========================================
//                 Leaderboard      
// =========================================

leaderboard(
    id = 19152, title = "HI-SCORE 2001",
    description = "Table of the best score in Team Play",
    start  = p1_active_state() == 1 && game_mode() == 1 && arcade_match() == 0 && p1_hp() == 102,
    cancel = p1_active_state() == 0,
    submit = game_stage() == 8 && p1_rounds_won() > 0 && cutscene_ending() > 0,
    value  = high4(0x0081FC) * 100000 + low4(0x0081FC) * 10000 + high4(0x0081FF) * 1000 + low4(0x0081FF) * 100 +
                 high4(0x0081FE) * 10 + low4(0x0081FE) * 1
             ,
    format = "SCORE"
)
