// The King of Fighters '99: Millennium Battle
// #ID = 12032

// Settings
function settings_difficulty_aes() => byte(0x0000CE)
function settings_difficulty_mvs() => byte(0x00FD8C)

function default_difficulty() {
    return(
            ((settings_difficulty_aes() >= 2 && mvs_flag() == 0) ||
             (settings_difficulty_mvs() >= 3 && mvs_flag() == 1))
    )
}

function mvs_flag() => bit7(0x00FD83)

function unibios() => dword(0x00FE30)

// Game
function game_mode_transacion() => byte(0x0085D3)
function game_stage() => byte(0x00A7AF)
function game_mode() => low4(0x00A7F4)
function game_cutscene() => low4(0x00B831)
function game_striker_active() => low4(0x00EC26)
function game_p1_striker_active() => bit0(0x00EC26)

function round_timer() => byte(0x00A7E7)

function arcade_match_progression_flags() => bitcount(0x00A798)
function arcade_ba_points_00xx_l4() => low4(0x00EC78)
function arcade_ba_points_00xx_h4() => high4(0x00EC78)
function arcade_ba_points() => word(0x00EC78)
function arcade_ba_points_xx00_l4() => low4(0x00EC79)
function arcade_ba_points_xx00_h4() => high4(0x00EC79)

// P1
function p1_hp() => byte(0x008238)

function p1_active_character_in_game() => byte(0x008170)
function p1_player_char_in_game() => byte(0x008258)

function p1_moves() => word(0x008102)
function p1_last_move() => word(0x0081EE)

function p1_bar_mode() => low4(0x0082EE)
function p1_hit_combo() => byte(0x0084B1)

function p1_character_slot_1() => byte(0x00A7FB)
function p1_character_slot_2() => byte(0x00A7FA)
function p1_character_slot_3() => byte(0x00A7FD)
function p1_character_slot_4() => byte(0x00A7FC)

function p1_rounds_won() => byte(0x00A807)
function p1_active_state() => byte(0x00FDB7)

// P2
function p2_hit_combo() => byte(0x0082B1)
function p2_player_char_in_game() => byte(0x008458)

function p2_rounds_won() => byte(0x00A806)
function p2_active_state() => byte(0x00FDB6)

characters = {
   "K'": 0,
   "Maxima": 1,
   "Benimaru": 2,
   "Shingo": 3,
   "Terry": 4,
   "Andy": 5,
   "Joe": 6,
   "Mai": 7,
   "Ryo": 8,
   "Robert": 9,
   "Yuri": 10,
   "Takuma": 11,
   "Kyo-1": 29,
   "Kyo-2": 33,
   "Kyo": 28,
   "Iori": 30,
   "Leona": 12,
   "Ralf": 13,
   "Clark": 14,
   "Whip": 15,
   "Athena": 16,
   "Kensou": 17,
   "Chin": 18,
   "Bao": 19,
   "King": 20,
   "Blue Mary": 21,
   "Kasumi": 22,
   "Xiangfei": 23,
   "Kim": 24,
   "Chang": 25,
   "Choi": 26,
   "Jhun": 27,
   "Krizalid 1st form": 31,
   "Krizalid": 32,
}

// Utility Functions
function no_game_unibios() => never(unibios() != 0)
function p1_only() => p1_active_state() > 0 && p2_active_state() == 0
function reset_main_menu() => never(p1_active_state() == 0 && p2_active_state() == 0)
function p1_only_globalreset() => (always_false() || never(p1_active_state() == 0) && never(p2_active_state() > 0))

function p1_team_has_char(char_id) => p1_character_slot_1() == char_id || p1_character_slot_2() == char_id || p1_character_slot_3() == char_id || p1_character_slot_4() == char_id
function p1_dont_have_char(char_id) => p1_character_slot_1() != char_id && p1_character_slot_2() != char_id && p1_character_slot_3() != char_id && p1_character_slot_4() != char_id

function p1_won_a_round() => p1_rounds_won() > prev(p1_rounds_won())

function team_play_beaten() {
    return(
        game_stage() == 6 && 
        arcade_match_progression_flags() == 6 && // final
        p2_player_char_in_game() == 32 && 
        p1_rounds_won() == 1 &&
        game_cutscene() > 0
    )
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
                            once(arcade_match_progression_flags() == 0 && prev(p1_character_slot_1()) == 0xFF && p1_character_slot_1() != prev(p1_character_slot_1())) &&
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

achiev_beat_the_game_team("Official Team 99: New Hero's", "K'", "Maxima", "Benimaru", "Shingo")
achiev_beat_the_game_team("Official Team 99: Fatal Fury", "Terry", "Andy", "Joe", "Mai")
achiev_beat_the_game_team("Official Team 99: Art of Fighting", "Ryo", "Robert", "Yuri", "Takuma")
achiev_beat_the_game_team("Official Team 99: Ikari Assassins", "Leona", "Ralf", "Clark", "Whip")
achiev_beat_the_game_team("Official Team 99: Psycho Soldier", "Athena", "Kensou", "Chin", "Bao")
achiev_beat_the_game_team("Official Team 99: Gals Fighters", "King", "Blue Mary", "Kasumi", "Xiangfei")
achiev_beat_the_game_team("Official Team 99: Korea Justice", "Kim", "Chang", "Choi", "Jhun")

achiev_beat_the_game_team("Ex Team 99: Bleach on Fire", "K'", "Iori", "Kyo", "Mai")
achiev_beat_the_game_team("Ex Team 99: Destruiction Force", "Ralf", "Jhun", "Ryo", "Terry")
achiev_beat_the_game_team("Ex Team 99: Blond Hair", "Andy", "Benimaru", "King", "Blue Mary")
achiev_beat_the_game_team("Ex Team 99: Headband", "Kasumi", "Shingo", "Joe", "Yuri")
achiev_beat_the_game_team("Ex Team 99: Super Stars", "Xiangfei", "Ryo", "Leona", "Athena")
achiev_beat_the_game_team("Ex Team 99: Prisoner Guards", "Chang", "Robert", "Maxima", "Clark")

// OLD
// achievement(
//     title = "Official Team 99: New Hero's", points = 10, type="win_condition",
//     description = "Finish Team Play with K'-Maxima-Benimaru-Shingo (choose in the exact sequence) on default difficulty",
//     id = 116866, badge = "124421", published = "07/07/2020 23:07:55", modified = "07/07/2020 23:07:55",
//     trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
//               never(game_mode() != 1) && 
//               game_stage() >= 6 && 
//               p2_player_char_in_game() == 32 && 
//               p1_rounds_won() == 1 &&
//               game_cutscene() > 0 && 
//               never(p1_character_slot_1() != 0) && never(p1_character_slot_2() != 1) &&
//               never(p1_character_slot_3() != 2) && never(p1_character_slot_4() != 3) &&
//               ((settings_difficulty_mvs() >= 2) ||
//                (settings_difficulty_aes() >= 3))
// )

// achievement(
//     title = "Official Team 99: Fatal Fury", points = 10, type="win_condition",
//     description = "Finish Team Play with Terry-Andy-Joe-Mai (choose in the exact sequence) on default difficulty",
//     id = 116867, badge = "124422", published = "07/07/2020 23:07:57", modified = "07/07/2020 23:07:57",
//     trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
//               never(game_mode() != 1) && game_stage() >= 6 && p2_player_char_in_game() == 32 && p1_rounds_won() == 1 &&
//               game_cutscene() > 0 && never(p1_character_slot_1() != 4) && never(p1_character_slot_2() != 5) &&
//               never(p1_character_slot_3() != 6) && never(p1_character_slot_4() != 7) &&
//               ((settings_difficulty_mvs() >= 2) ||
//                (settings_difficulty_aes() >= 3))
// )

// achievement(
//     title = "Official Team 99: Art of Fighting", points = 10, type="win_condition",
//     description = "Finish Team Play with Ryo-Robert-Yuri-Takuma (choose in the exact sequence) on default difficulty",
//     id = 116868, badge = "124423", published = "07/07/2020 23:07:59", modified = "07/07/2020 23:07:59",
//     trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
//               never(game_mode() != 1) && game_stage() >= 6 && p2_player_char_in_game() == 32 && p1_rounds_won() == 1 &&
//               game_cutscene() > 0 && never(p1_character_slot_1() != 8) && never(p1_character_slot_2() != 9) &&
//               never(p1_character_slot_3() != 10) && never(p1_character_slot_4() != 11) &&
//               ((settings_difficulty_mvs() >= 2) ||
//                (settings_difficulty_aes() >= 3))
// )

// achievement(
//     title = "Official Team 99: Ikari Assassins", points = 10, type="win_condition",
//     description = "Finish Team Play with Leona-Ralf-Clark-Whip (choose in the exact sequence) on default difficulty",
//     id = 116869, badge = "126801", published = "07/07/2020 23:08:01", modified = "07/07/2020 23:08:01",
//     trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
//               never(game_mode() != 1) && game_stage() >= 6 && p2_player_char_in_game() == 32 && p1_rounds_won() == 1 &&
//               game_cutscene() > 0 && never(p1_character_slot_1() != 12) && never(p1_character_slot_2() != 13) &&
//               never(p1_character_slot_3() != 14) && never(p1_character_slot_4() != 15) &&
//               ((settings_difficulty_mvs() >= 2) ||
//                (settings_difficulty_aes() >= 3))
// )

// achievement(
//     title = "Official Team 99: Psycho Soldier", points = 10, type="win_condition",
//     description = "Finish Team Play with Athena-Kensou-Chin-Bao (choose in the exact sequence) on default difficulty",
//     id = 116870, badge = "126803", published = "07/07/2020 23:08:03", modified = "07/07/2020 23:08:03",
//     trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
//               never(game_mode() != 1) && game_stage() >= 6 && p2_player_char_in_game() == 32 && p1_rounds_won() == 1 &&
//               game_cutscene() > 0 && never(p1_character_slot_1() != 16) && never(p1_character_slot_2() != 17) &&
//               never(p1_character_slot_3() != 18) && never(p1_character_slot_4() != 19) &&
//               ((settings_difficulty_mvs() >= 2) ||
//                (settings_difficulty_aes() >= 3))
// )

// achievement(
//     title = "Official Team 99: Gals Fighters", points = 10, type="win_condition",
//     description = "Finish Team Play with King-Blue Mary-Kasumi-Xiangfei (choose in the exact sequence) on default difficulty",
//     id = 116871, badge = "126804", published = "07/07/2020 23:08:05", modified = "08/07/2020 05:21:15",
//     trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
//               never(game_mode() != 1) && game_stage() >= 6 && p2_player_char_in_game() == 32 && p1_rounds_won() == 1 &&
//               game_cutscene() > 0 && never(p1_character_slot_1() != 20) && never(p1_character_slot_2() != 21) &&
//               never(p1_character_slot_3() != 22) && never(p1_character_slot_4() != 23) &&
//               ((settings_difficulty_mvs() >= 2) ||
//                (settings_difficulty_aes() >= 3))
// )

// achievement(
//     title = "Official Team 99: Korea Justice", points = 10, type="win_condition",
//     description = "Finish Team Play with Kim-Chang-Choi-Jhun (choose in the exact sequence) on default difficulty",
//     id = 116872, badge = "126802", published = "07/07/2020 23:08:08", modified = "07/07/2020 23:08:08",
//     trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
//               never(game_mode() != 1) && game_stage() >= 6 && p2_player_char_in_game() == 32 && p1_rounds_won() == 1 &&
//               game_cutscene() > 0 && never(p1_character_slot_1() != 24) && never(p1_character_slot_2() != 25) &&
//               never(p1_character_slot_3() != 26) && never(p1_character_slot_4() != 27) &&
//               ((settings_difficulty_mvs() >= 2) ||
//                (settings_difficulty_aes() >= 3))
// )

// // Mixed Teams
// achievement(
//     title = "Ex Team 99: Bleach on Fire", points = 10,
//     description = "Finish Team Play with K'-Iori-Kyo-Mai (choose in the exact sequence) on default difficulty",
//     id = 116876, badge = "126820", published = "07/07/2020 23:08:18", modified = "07/07/2020 23:08:18",
//     trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
//               game_mode() == 1 && game_stage() >= 6 && p2_player_char_in_game() == 32 && p1_rounds_won() == 1 &&
//               game_cutscene() > 0 && never(p1_character_slot_1() != 0) && never(p1_character_slot_2() != 30) &&
//               never(p1_character_slot_3() != 28) && never(p1_character_slot_4() != 7) &&
//               ((settings_difficulty_mvs() >= 2) ||
//                (settings_difficulty_aes() >= 3))
// )

// achievement(
//     title = "Ex Team 99: Destruiction Force", points = 10,
//     description = "Finish Team Play with Ralf-Jhun-Ryo-Terry (choose in the exact sequence) on default difficulty",
//     id = 116878, badge = "126821", published = "07/07/2020 23:09:08", modified = "07/07/2020 23:09:08",
//     trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
//               game_mode() == 1 && game_stage() >= 6 && p2_player_char_in_game() == 32 && p1_rounds_won() == 1 &&
//               game_cutscene() > 0 && never(p1_character_slot_1() != 13) && never(p1_character_slot_2() != 27) &&
//               never(p1_character_slot_3() != 8) && never(p1_character_slot_4() != 4) &&
//               ((settings_difficulty_mvs() >= 2) ||
//                (settings_difficulty_aes() >= 3))
// )

// achievement(
//     title = "Ex Team 99: Blond Hair", points = 10,
//     description = "Finish Team Play with Andy-Benimaru-King-Blue Mary (choose in the exact sequence) on default difficulty",
//     id = 116879, badge = "126838", published = "07/07/2020 23:09:10", modified = "07/07/2020 23:09:10",
//     trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
//               game_mode() == 1 && game_stage() >= 6 && p2_player_char_in_game() == 32 && p1_rounds_won() == 1 &&
//               game_cutscene() > 0 && never(p1_character_slot_1() != 5) && never(p1_character_slot_2() != 2) &&
//               never(p1_character_slot_3() != 20) && never(p1_character_slot_4() != 21) &&
//               ((settings_difficulty_mvs() >= 2) ||
//                (settings_difficulty_aes() >= 3))
// )

// achievement(
//     title = "Ex Team 99: Headband", points = 10,
//     description = "Finish Team Play with Kasumi-Shingo-Joe-Yuri (choose in the exact sequence) on default difficulty",
//     id = 116880, badge = "126831", published = "07/07/2020 23:09:13", modified = "07/07/2020 23:09:13",
//     trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
//               game_mode() == 1 && game_stage() >= 6 && p2_player_char_in_game() == 32 && p1_rounds_won() == 1 &&
//               game_cutscene() > 0 && never(p1_character_slot_1() != 22) && never(p1_character_slot_2() != 3) &&
//               never(p1_character_slot_3() != 6) && never(p1_character_slot_4() != 10) &&
//               ((settings_difficulty_mvs() >= 2) ||
//                (settings_difficulty_aes() >= 3))
// )

// achievement(
//     title = "Ex Team 99: Super Stars", points = 10,
//     description = "Finish Team Play with Xiangfei-Ryo-Leona-Athena (choose in the exact sequence) on default difficulty",
//     id = 116881, badge = "126872", published = "07/07/2020 23:09:15", modified = "07/07/2020 23:09:15",
//     trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
//               game_mode() == 1 && game_stage() >= 6 && p2_player_char_in_game() == 32 && p1_rounds_won() == 1 &&
//               game_cutscene() > 0 && never(p1_character_slot_1() != 23) && never(p1_character_slot_2() != 8) &&
//               never(p1_character_slot_3() != 12) && never(p1_character_slot_4() != 16) &&
//               ((settings_difficulty_mvs() >= 2) ||
//                (settings_difficulty_aes() >= 3))
// )

// achievement(
//     title = "Ex Team 99: Prisoner Guards", points = 10,
//     description = "Finish Team Play with Chang-Robert-Maxima-Clark (choose in the exact sequence) on default difficulty",
//     id = 116882, badge = "126873", published = "07/07/2020 23:09:20", modified = "07/07/2020 23:09:20",
//     trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
//               game_mode() == 1 && game_stage() >= 6 && p2_player_char_in_game() == 32 && p1_rounds_won() == 1 &&
//               game_cutscene() > 0 && never(p1_character_slot_1() != 25) && never(p1_character_slot_2() != 9) &&
//               never(p1_character_slot_3() != 1) && never(p1_character_slot_4() != 14) &&
//               ((settings_difficulty_mvs() >= 2) ||
//                (settings_difficulty_aes() >= 3))
// )

// =========================================
//               Single Teams             
// =========================================

achievement(
    title = "Cross Team 99:  Revenge on fire", points = 10,
    description = "Finish Team Play using only Iori as your first choice on default difficulty",
    id = 116873, badge = "126816", published = "07/07/2020 23:08:10", modified = "07/07/2020 23:08:10",
    trigger =   never(unibios() != 0) && 
                p1_only() &&
                reset_main_menu() &&
                never(game_mode() != 1) &&
                once(arcade_match_progression_flags() == 0 && prev(p1_character_slot_1()) == 0xFF && p1_character_slot_1() != prev(p1_character_slot_1())) &&
                trigger_when(team_play_beaten()) &&
                never(p1_character_slot_1() != 30 && p1_won_a_round()) &&
                p1_character_slot_1() == 30 &&
                default_difficulty()
)

achievement(
    title = "Cross Team 99: The Original", points = 10,
    description = "Finish Team Play using only Kyo as your first choice on default difficulty",
    id = 116875, badge = "126817", published = "07/07/2020 23:08:16", modified = "07/07/2020 23:08:16",
    trigger =   never(unibios() != 0) && 
                p1_only() &&
                reset_main_menu() &&
                never(game_mode() != 1) &&
                once(arcade_match_progression_flags() == 0 && prev(p1_character_slot_1()) == 0xFF && p1_character_slot_1() != prev(p1_character_slot_1())) &&
                trigger_when(team_play_beaten()) && 
                never(p1_character_slot_1() != 28 && p1_won_a_round()) &&
                p1_character_slot_1() == 28 &&
                default_difficulty()
)

achievement(
    title = "Cross Team 99: The Clone", points = 10, type="win_condition",
    description = "Finish Team Play using only Kyo-1 as your first choice on default difficulty",
    id = 116874, badge = "126818", published = "07/07/2020 23:08:13", modified = "07/07/2020 23:08:13",
    trigger =   never(unibios() != 0) && 
                p1_only() &&
                reset_main_menu() &&
                never(game_mode() != 1) &&
                once(arcade_match_progression_flags() == 0 && prev(p1_character_slot_1()) == 0xFF && p1_character_slot_1() != prev(p1_character_slot_1())) &&
                trigger_when(team_play_beaten()) && 
                never(p1_character_slot_1() != 29 && p1_won_a_round()) &&
                p1_character_slot_1() == 29 &&
                default_difficulty()
)

achievement(
    title = "Cross Team 99: The Clone 2", points = 10, type="win_condition",
    description = "Finish Team Play using only Kyo-2 as your first choice on default difficulty",
    id = 116877, badge = "126819", published = "07/07/2020 23:09:06", modified = "07/07/2020 23:09:06",
    trigger =   never(unibios() != 0) && 
                p1_only() &&
                reset_main_menu() &&
                never(game_mode() != 1) &&
                once(arcade_match_progression_flags() == 0 && prev(p1_character_slot_1()) == 0xFF && p1_character_slot_1() != prev(p1_character_slot_1())) &&
                trigger_when(team_play_beaten()) && 
                never(p1_character_slot_1() != 33 && p1_won_a_round()) &&
                p1_character_slot_1() == 33 &&
                default_difficulty()
)

// =========================================
//             Desperation Moves              
// =========================================

achievement(
    title = "Now, the Finish. Get Up, Fool!", points = 5,
    description = "Perform all K' Desperation Moves",
    id = 116885, badge = "126987", published = "07/07/2020 23:15:00", modified = "07/07/2020 23:15:00",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 0) &&
              once(p1_last_move() == 558 || p1_last_move() == 559) &&
              once(p1_last_move() == 553 || p1_last_move() == 556) && unless(game_mode() == 6)
)

// Ticket 87869: Using MVS Europe/Asia, triggered when doing a simple A jab after having done Maxima Revenger.
achievement(
    title = "I Read Your Moves Like the Funny Papers!", points = 5,
    description = "Perform all Maxima Desperation Moves",
    id = 116888, badge = "126998", published = "07/07/2020 23:15:08", modified = "07/07/2020 23:15:08",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 1) &&
              once(p1_last_move() == 544) && once(p1_last_move() == 553 || p1_last_move() == 556) &&
              unless(game_mode() == 6)
)

achievement(
    title = "A Flower's Life's Brief", points = 5,
    description = "Perform all Benimaru's Desperation Moves",
    id = 116883, badge = "126874", published = "07/07/2020 23:14:55", modified = "07/07/2020 23:14:55",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 2) &&
              once(p1_last_move() == 551 || p1_last_move() == 552) &&
              once(p1_last_move() == 560 || p1_last_move() == 562) && unless(game_mode() == 6)
)

achievement(
    title = "I Just Get Tougher! Kyo", points = 5,
    description = "Perform all Shingo Desperation Moves",
    id = 116889, badge = "127659", published = "07/07/2020 23:15:10", modified = "07/07/2020 23:15:10",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 3) &&
              once(p1_last_move() == 547 || p1_last_move() == 548) &&
              once(p1_last_move() == 549 || p1_last_move() == 550) && unless(game_mode() == 6)
)

achievement(
    title = "This Is What Makes a Legend!", points = 5,
    description = "Perform all Terry Desperation Moves",
    id = 116890, badge = "127660", published = "07/07/2020 23:15:13", modified = "07/07/2020 23:15:13",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 4) &&
              once(p1_last_move() == 550 || p1_last_move() == 551) &&
              once(p1_last_move() == 556 || p1_last_move() == 557) && unless(game_mode() == 6)
)

achievement(
    title = "On the Whole, You're Tough", points = 5,
    description = "Perform all Andy Desperation Moves",
    id = 116886, badge = "126989", published = "07/07/2020 23:15:02", modified = "07/07/2020 23:15:02",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 5) &&
              once(p1_last_move() == 556 || p1_last_move() == 558) &&
              once(p1_last_move() == 554 || p1_last_move() == 561) && unless(game_mode() == 6)
)

achievement(
    title = "We're Too Easy, You Ask?", points = 5,
    description = "Perform all Mai Desperation Moves",
    id = 116887, badge = "126994", published = "07/07/2020 23:15:05", modified = "07/07/2020 23:15:05",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 7) &&
              once(p1_last_move() == 554 || p1_last_move() == 555) &&
              once(p1_last_move() == 552 || p1_last_move() == 553) &&
              once(p1_last_move() == 550 || p1_last_move() == 551) && unless(game_mode() == 6)
)

achievement(
    title = "You Bring a Song to Mind", points = 5,
    description = "Perform all Joe Desperation Moves",
    id = 116884, badge = "126875", published = "07/07/2020 23:14:58", modified = "07/07/2020 23:14:58",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 6) &&
              once(p1_last_move() == 551 || p1_last_move() == 552) &&
              once(p1_last_move() == 560 || p1_last_move() == 561) &&
              once(p1_last_move() == 554 || p1_last_move() == 555) && unless(game_mode() == 6)
)

achievement(
    title = "Dis Kyokugen Karate", points = 5,
    description = "Perform all Ryo Desperation Moves",
    id = 116892, badge = "127661", published = "07/07/2020 23:18:02", modified = "07/07/2020 23:18:02",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 8) &&
              once(p1_last_move() == 557 || p1_last_move() == 558) &&
              once(p1_last_move() == 551 || p1_last_move() == 552) &&
              once(p1_last_move() == 549 || p1_last_move() == 550) && unless(game_mode() == 6)
)

achievement(
    title = "I Am Freakin' Irresistible!", points = 5,
    description = "Perform all Robert Desperation Moves",
    id = 116893, badge = "127006", published = "07/07/2020 23:18:04", modified = "07/07/2020 23:18:04",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 9) &&
              once(p1_last_move() == 551 || p1_last_move() == 552) &&
              once(p1_last_move() == 549 || p1_last_move() == 550) &&
              once(p1_last_move() == 563 || p1_last_move() == 565) && unless(game_mode() == 6)
)

achievement(
    title = "Spirit Over Skill!", points = 5,
    description = "Perform all Yuri Desperation Moves",
    id = 116894, badge = "127662", published = "07/07/2020 23:18:06", modified = "07/07/2020 23:18:06",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 10) &&
              once(p1_last_move() == 558 || p1_last_move() == 560) &&
              once(p1_last_move() == 568 || p1_last_move() == 572) &&
              once(p1_last_move() == 552 || p1_last_move() == 553) && unless(game_mode() == 6)
)

achievement(
    title = "The True Way of Battle", points = 5,
    description = "Perform all Takuma Desperation Moves",
    id = 116895, badge = "127663", published = "07/07/2020 23:18:09", modified = "07/07/2020 23:18:09",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 11) &&
              once(p1_last_move() == 546 || p1_last_move() == 548) &&
              once(p1_last_move() == 552 || p1_last_move() == 554) &&
              once(p1_last_move() == 556 || p1_last_move() == 557) && unless(game_mode() == 6)
)

achievement(
    title = "You Never Had a Chance", points = 5,
    description = "Perform all Leona Desperation Moves",
    id = 116896, badge = "127664", published = "07/07/2020 23:18:11", modified = "07/07/2020 23:18:11",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 12) &&
              once(p1_last_move() == 560 || p1_last_move() == 561) &&
              once(p1_last_move() == 555 || p1_last_move() == 556) &&
              once(p1_last_move() == 548 || p1_last_move() == 550) && unless(game_mode() == 6)
)

achievement(
    title = "Even Nukes", points = 5,
    description = "Perform all Ralf Desperation Moves",
    id = 116897, badge = "127665", published = "07/07/2020 23:18:13", modified = "07/07/2020 23:18:13",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 13) &&
              once(p1_last_move() == 560 || p1_last_move() == 561) &&
              once(p1_last_move() == 553 || p1_last_move() == 555) &&
              once(p1_last_move() == 556 || p1_last_move() == 558) && unless(game_mode() == 6)
)

achievement(
    title = "For About 5 Seconds", points = 5,
    description = "Perform all Clark Desperation Moves",
    id = 116898, badge = "127666", published = "07/07/2020 23:18:15", modified = "07/07/2020 23:18:15",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 14) &&
              once(p1_last_move() == 550 || p1_last_move() == 551) &&
              once(p1_last_move() == 548 || p1_last_move() == 549) && unless(game_mode() == 6)
)

achievement(
    title = "All Show, No Substance", points = 3,
    description = "Perform Whip Desperation Move",
    id = 116899, badge = "127667", published = "07/07/2020 23:18:17", modified = "07/07/2020 23:18:17",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 15) &&
              once(p1_last_move() == 552 || p1_last_move() == 553) && unless(game_mode() == 6)
)

achievement(
    title = "Everyone Got So Strong!", points = 5,
    description = "Perform all Athena Desperation Moves",
    id = 116900, badge = "127668", published = "07/07/2020 23:18:20", modified = "30/10/2020 14:20:09",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 16) &&
              unless(game_mode() == 6) &&
              once(p1_last_move() == 548 || p1_last_move() == 552 || p1_last_move() == 564 || p1_last_move() == 550 ||
                  p1_last_move() == 554
              ) &&
              once(p1_last_move() == 549 || p1_last_move() == 553 || p1_last_move() == 551 || p1_last_move() == 555) &&
              once(p1_last_move() == 557 || p1_last_move() == 559)
)

achievement(
    title = "I'm No Psychic", points = 5,
    description = "Perform all Kensou Desperation Moves",
    id = 116901, badge = "127669", published = "07/07/2020 23:18:22", modified = "07/07/2020 23:18:22",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 17) &&
              once(p1_last_move() == 563 || p1_last_move() == 565) &&
              once(p1_last_move() == 549 || p1_last_move() == 554) && unless(game_mode() == 6)
)

achievement(
    title = "How About That, Kid", points = 5,
    description = "Perform all Chin Desperation Moves",
    id = 116902, badge = "127670", published = "07/07/2020 23:18:25", modified = "07/07/2020 23:18:25",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 18) &&
              once(p1_last_move() == 551 || p1_last_move() == 552) && once(p1_last_move() == 562) &&
              unless(game_mode() == 6)
)

achievement(
    title = "Happy as an Oyster", points = 5,
    description = "Perform all Bao Desperation Moves",
    id = 116903, badge = "127671", published = "07/07/2020 23:18:28", modified = "07/07/2020 23:18:28",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 19) &&
              once(p1_last_move() == 550 || p1_last_move() == 551) &&
              once(p1_last_move() == 552 || p1_last_move() == 553) &&
              once(p1_last_move() == 554 || p1_last_move() == 555) && unless(game_mode() == 6)
)

achievement(
    title = "Now Get Lost, Limpy!", points = 5,
    description = "Perform all King Desperation Moves",
    id = 116904, badge = "127672", published = "07/07/2020 23:19:29", modified = "07/07/2020 23:19:29",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 20) &&
              once(p1_last_move() == 565 || p1_last_move() == 567) && once(p1_last_move() == 559) &&
              unless(game_mode() == 6)
)

achievement(
    title = "Without Lifting a Finger", points = 5,
    description = "Perform all Blue Mary Desperation Moves",
    id = 116905, badge = "127673", published = "07/07/2020 23:19:31", modified = "07/07/2020 23:19:31",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 21) &&
              once(p1_last_move() == 556 || p1_last_move() == 558) &&
              once(p1_last_move() == 552 || p1_last_move() == 553) &&
              once(p1_last_move() == 550 || p1_last_move() == 551) && unless(game_mode() == 6)
)

achievement(
    title = "The Way of Todoh Prevails!", points = 5,
    description = "Perform all Kasumi Desperation Moves",
    id = 116906, badge = "127674", published = "07/07/2020 23:19:35", modified = "07/07/2020 23:19:35",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 22) &&
              once(p1_last_move() == 552 || p1_last_move() == 553) &&
              once(p1_last_move() == 554 || p1_last_move() == 555) && unless(game_mode() == 6)
)

achievement(
    title = "Since I Win, You Buy Dinner", points = 5,
    description = "Perform all Xiangfei Desperation Moves",
    id = 116907, badge = "127675", published = "07/07/2020 23:19:38", modified = "07/07/2020 23:19:38",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 23) &&
              once(p1_last_move() == 551 || p1_last_move() == 554) &&
              once(p1_last_move() == 549 || p1_last_move() == 550) &&
              once(p1_last_move() == 557 || p1_last_move() == 559) && unless(game_mode() == 6)
)

achievement(
    title = "Too Overconfident...", points = 5,
    description = "Perform all Kim Desperation Moves",
    id = 116908, badge = "127676", published = "07/07/2020 23:19:41", modified = "07/07/2020 23:19:41",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 24) &&
              once(p1_last_move() == 564 || p1_last_move() == 566) &&
              once(p1_last_move() == 553 || p1_last_move() == 562) && unless(game_mode() == 6)
)

achievement(
    title = "His Massive Iron Ball", points = 5,
    description = "Perform all Chang Desperation Moves",
    id = 116909, badge = "127677", published = "07/07/2020 23:19:43", modified = "07/07/2020 23:19:43",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 25) &&
              once(p1_last_move() == 552 || p1_last_move() == 558) &&
              once(p1_last_move() == 544 || p1_last_move() == 545) &&
              once(p1_last_move() == 549 || p1_last_move() == 550) && unless(game_mode() == 6)
)

achievement(
    title = "I'm a Little Monster", points = 5,
    description = "Perform all Choi Desperation Moves",
    id = 116910, badge = "127678", published = "07/07/2020 23:19:46", modified = "07/07/2020 23:19:46",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 26) &&
              once(p1_last_move() == 551 || p1_last_move() == 557) &&
              once(p1_last_move() == 563 || p1_last_move() == 564) &&
              once(p1_last_move() == 550 || p1_last_move() == 554) && unless(game_mode() == 6)
)

achievement(
    title = "Throw in the Towel!", points = 5,
    description = "Perform all Jhun Desperation Moves",
    id = 116911, badge = "127679", published = "07/07/2020 23:19:48", modified = "07/07/2020 23:19:48",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 27) &&
              once(p1_last_move() == 557 || p1_last_move() == 559) &&
              once(p1_last_move() == 553 || p1_last_move() == 555) && unless(game_mode() == 6)
)

achievement(
    title = "It's Not My Job to Kill You", points = 5,
    description = "Perform all Iori Desperation Moves",
    id = 116913, badge = "127681", published = "07/07/2020 23:19:53", modified = "07/07/2020 23:19:53",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 30) &&
              once(p1_last_move() == 560 || p1_last_move() == 561) &&
              once(p1_last_move() == 550 || p1_last_move() == 563) && unless(game_mode() == 6)
)

achievement(
    title = "Huh, Don't Tell Me", points = 5,
    description = "Perform all Kyo Desperation Moves",
    id = 116912, badge = "127680", published = "07/07/2020 23:19:51", modified = "07/07/2020 23:19:51",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 28) &&
              once(p1_last_move() == 569) && once(p1_last_move() == 566 || p1_last_move() == 568) &&
              unless(game_mode() == 6)
)

achievement(
    title = "Was There Any Doubt", points = 3,
    description = "Perform Kyo-1 Desperation Move",
    id = 116914, badge = "127682", published = "07/07/2020 23:19:55", modified = "07/07/2020 23:19:55",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 29) &&
              once(p1_last_move() == 566 || p1_last_move() == 568) && unless(game_mode() == 6)
)

achievement(
    title = "Victory Is Mine...", points = 3,
    description = "Perform Kyo-2 Desperation Move",
    id = 116915, badge = "127683", published = "07/07/2020 23:19:58", modified = "07/07/2020 23:19:58",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_character_in_game() != 33) &&
              once(p1_last_move() == 563 || p1_last_move() == 570) && unless(game_mode() == 6)
)

// =========================================
//                   Miscs              
// =========================================

achievement(
    title = "Reaching With Perfection", points = 2,
    description = "Perform a 10-hit combo",
    id = 116916, badge = "127684", published = "07/07/2020 23:22:48", modified = "07/07/2020 23:22:48",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              p1_hit_combo() >= 16 && unless(game_mode() == 6)
)

achievement(
    title = "Back to the Show", points = 3,
    description = "Perform a 20-hit combo",
    id = 116917, badge = "127936", published = "07/07/2020 23:22:50", modified = "07/07/2020 23:22:50",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              p1_hit_combo() >= 32 && unless(game_mode() == 6)
)

achievement(
    title = "High Hit Partners", points = 4,
    description = "Perform a 28-hit combo",
    id = 116918, badge = "127686", published = "07/07/2020 23:22:53", modified = "07/07/2020 23:22:53",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              p1_hit_combo() >= 40 && unless(game_mode() == 6)
)

achievement(
    title = "Overcoming H.S.P", points = 3,
    description = "Achieve 200 B.A points",
    id = 116919, badge = "127808", published = "07/07/2020 23:23:38", modified = "07/07/2020 23:23:38",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              arcade_ba_points() >= 512 && unless(game_mode() == 6)
)

achievement(
    title = "Auto-Movements", points = 5,
    description = "Defeat your opponent while in Counter Mode",
    id = 116920, badge = "127687", published = "07/07/2020 23:23:42", modified = "07/07/2020 23:23:42",
    trigger =   never(unibios() != 0) && 
                never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
                p1_bar_mode() == 1 && 
                byte(0x008439) == 255 && 
                unless(game_mode() == 6)
)

achievement(
    title = "Impossible to Break Defense", points = 5,
    description = "Defeat your opponent while in Armor Mode",
    id = 116921, badge = "127688", published = "07/07/2020 23:23:45", modified = "07/07/2020 23:23:45",
    trigger =   never(unibios() != 0) && 
                never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
                p1_bar_mode() == 2 && 
                byte(0x008439) == 255 && 
                unless(game_mode() == 6)
)

achievement(
    title = "Go in This Fourth Fighter", points = 3,
    description = "Defeat your opponent with the help of a striker",
    id = 116922, badge = "127689", published = "07/07/2020 23:23:47", modified = "07/07/2020 23:23:47",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              game_striker_active() > 0 && byte(0x008439) == 255 && unless(game_mode() == 6) &&
              unless(game_striker_active() == 2)
)

achievement(
    title = "Come up, Weakling!", points = 5,
    description = "Tease your opponent 10 times without being hit",
    id = 116923, badge = "127690", published = "07/07/2020 23:25:05", modified = "07/07/2020 23:25:05",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              measured(repeated(10, p1_moves() == 61668)) && unless(prev(p1_moves()) == 61668) && never(p2_hit_combo() > 0) &&
              unless(game_mode() == 6)
)

achievement(
    title = "I-Basic KOF Move 99: Recovery", points = 1,
    description = "Perform a Recovery Roll",
    id = 116924, badge = "127812", published = "07/07/2020 23:25:10", modified = "07/07/2020 23:25:10",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              p1_moves() == 38752 && unless(game_mode() == 6)
)

achievement(
    title = "II-Basic KOF Move 99: GC Evade", points = 1,
    description = "Perform a Guard Cancel evade",
    id = 116925, badge = "127813", published = "07/07/2020 23:25:12", modified = "30/10/2020 14:39:13",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              p1_moves() == 64468 && unless(game_mode() == 6)
)

achievement(
    title = "III-Basic KOF Move 99: GC Body Blow", points = 1,
    description = "Perform a Guard Cancel in body blow",
    id = 116926, badge = "127814", published = "07/07/2020 23:25:14", modified = "08/07/2020 02:08:06",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              p1_moves() == 60706 && p1_last_move() == 1083 && unless(game_mode() == 6)
)

achievement(
    title = "Trust in the Leader", points = 5,
    description = "Win a team fight without losing anyone on default difficulty",
    id = 116927, badge = "127934", published = "07/07/2020 23:25:21", modified = "07/07/2020 23:25:21",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              once(game_stage() >= 0 && p2_rounds_won() == 0) && never(p2_rounds_won() >= 1) && p1_rounds_won() == 3 &&
              unless(game_mode() == 6) &&
              default_difficulty()
)

achievement(
    title = "Rolling for the Win", points = 3,
    description = "Win a fight with a time-out",
    id = 116928, badge = "127938", published = "07/07/2020 23:25:28", modified = "07/07/2020 23:25:28",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              ((round_timer() == 0 && p1_rounds_won() == 1) ||
               (round_timer() == 0 && p1_rounds_won() == 2) ||
               (round_timer() == 0 && p1_rounds_won() == 3))
)

achievement(
    title = "Bitter Taste of Victory", points = 5,
    description = "Win a fight with a Perfect",
    id = 116931, badge = "127807", published = "07/07/2020 23:25:43", modified = "08/07/2020 01:23:10",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) && p1_hp() == 101 &&
              unless(game_mode() == 6) &&
              ((byte(0x008439) == 255 && p1_rounds_won() == 1) ||
               (byte(0x008439) == 255 && p1_rounds_won() == 2) ||
               (byte(0x008439) == 255 && p1_rounds_won() == 3))
)

achievement(
    title = "Testing a Boss's Strengths", points = 25,
    description = "Win a fight with a Perfect against any Krizalid's form",
    id = 116932, badge = "127816", published = "07/07/2020 23:27:09", modified = "08/07/2020 01:23:47",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) && p1_hp() == 101 &&
              unless(game_mode() == 6) &&
              ((p2_player_char_in_game() == 31 && byte(0x008439) == 255 && p1_rounds_won() >= 1) ||
               (p2_player_char_in_game() == 32 && byte(0x008439) == 255 && p1_rounds_won() >= 1))
)

// =========================================
//           Counter Mode Finishes              
// =========================================

achievement(
    title = "Fury of the Heidern Clan", points = 5,
    description = "Finish your opponent using V-Slasher from Leona with the Counter Mode on",
    id = 117060, badge = "128011", published = "08/07/2020 07:52:40", modified = "08/07/2020 07:52:40",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(p1_player_char_in_game() != 12) && p1_bar_mode() == 1 && once(p1_last_move() == 807) &&
              never(p1_last_move() != 807) && byte(0x008439) == 255
)

achievement(
    title = "Fury of the Dash Clan", points = 5,
    description = "Finish your opponent using Chain Drive from K' with the Counter Mode on",
    id = 117057, badge = "128010", published = "08/07/2020 07:35:13", modified = "08/07/2020 07:35:13",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(p1_player_char_in_game() != 0) && p1_bar_mode() == 1 && once(p1_last_move() == 818) &&
              never(p1_last_move() != 818) && byte(0x008439) == 255
)

achievement(
    title = "Fury of the Yagami Clan", points = 5,
    description = "Finish your opponent using Prohibited 1201 Maiden Masher from Iori with the Counter Mode on",
    id = 117059, badge = "128008", published = "08/07/2020 07:35:19", modified = "08/07/2020 07:35:19",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(p1_player_char_in_game() != 30) && p1_bar_mode() == 1 && once(p1_last_move() == 811) &&
              never(p1_last_move() != 811) && byte(0x008439) == 255
)

achievement(
    title = "Fury of the Kusanagi Clan", points = 5,
    description = "Finish your opponent using Reverse 108 Serpent Shear from Kyo with the Counter Mode on",
    id = 117058, badge = "128009", published = "08/07/2020 07:35:16", modified = "08/07/2020 07:35:16",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(p1_player_char_in_game() != 28) && p1_bar_mode() == 1 && once(p1_last_move() == 825) &&
              never(p1_last_move() != 825) && byte(0x008439) == 255
)

// =========================================
//               Full Game Runs              
// =========================================

achievement(
    title = "Fourth Fighter for No Reason", points = 10,
    description = "Finish Team Play without using strikers on default difficulty",
    id = 116929, badge = "127935", published = "07/07/2020 23:25:35", modified = "07/07/2020 23:25:35",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) &&
              game_mode() == 1 &&
              once(arcade_match_progression_flags() == 0 && prev(p1_character_slot_1()) == 0xFF && p1_character_slot_1() != prev(p1_character_slot_1())) &&
              never(game_p1_striker_active() == 1) && 
              trigger_when(team_play_beaten()) &&
              default_difficulty()
)

achievement(
    title = "I Just Need One", points = 10,
    description = "Finish Single Play mode on default difficulty",
    id = 116930, badge = "127931", published = "07/07/2020 23:25:41", modified = "07/07/2020 23:25:41",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              game_mode() == 0 && game_stage() >= 6 && p2_player_char_in_game() == 32 && p1_rounds_won() == 2 &&
              game_cutscene() > 0 &&
              default_difficulty()
)

achievement(
    title = "Marking the Name in History", points = 25,
    description = "Finish Team Play with only one credit on default difficulty",
    id = 116933, badge = "127824", published = "07/07/2020 23:27:16", modified = "07/07/2020 23:27:16",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              game_mode() == 1 &&
              once(arcade_match_progression_flags() == 0 && prev(p1_character_slot_1()) == 0xFF && p1_character_slot_1() != prev(p1_character_slot_1())) &&
              never(p2_rounds_won() == 3) &&
              trigger_when(team_play_beaten()) &&
              default_difficulty()
)

achievement(
    title = "Expert Is Serious", points = 25,
    description = "Finish Team Play on the highest difficulty",
    id = 116934, badge = "127825", published = "07/07/2020 23:27:28", modified = "07/07/2020 23:27:28",
    trigger =   never(unibios() != 0) && 
                never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
                game_stage() >= 6 && 
                p2_player_char_in_game() == 32 && 
                p1_rounds_won() == 1 && game_cutscene() > 0 &&
                game_mode() == 1 &&
                ((settings_difficulty_aes() == 7 && mvs_flag() == 0) ||
                 (settings_difficulty_mvs() == 7 && mvs_flag() == 1))
)

achievement(
    title = "All Come to the x1", points = 25,
    description = "Finish Single All mode on default difficulty",
    id = 116935, badge = "127937", published = "07/07/2020 23:27:32", modified = "07/07/2020 23:27:32",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              game_mode() == 4 && p2_player_char_in_game() == 32 && game_stage() >= 6 && p1_rounds_won() == 1 &&
              default_difficulty()
)

achievement(
    title = "Teachings of Master Chin", points = 50,
    description = "Finish Single Play using only Chin without using strikers, Desperation Moves, Counter or Armor Mode mode on default difficulty",
    id = 116936, badge = "127932", published = "07/07/2020 23:27:35", modified = "30/10/2020 17:04:46",
    trigger =   never(unibios() != 0) && never(p2_active_state() != 0) && 
                game_mode() == 0 &&
                once(arcade_match_progression_flags() == 0 && prev(p1_character_slot_1()) == 0xFF && p1_character_slot_1() != prev(p1_character_slot_1())) &&
                never(p1_player_char_in_game() != 18 && p1_won_a_round()) &&
                p1_player_char_in_game() == 18 &&
                trigger_when(game_stage() == 6 &&
                             p2_player_char_in_game() == 32 && 
                             p1_rounds_won() == 2 &&
                             game_cutscene() > 0) &&
                never(game_p1_striker_active() == 1) && 
                never(p1_bar_mode() != 0) && 
                never(p1_last_move() == 551) &&
                never(p1_last_move() == 560) && 
                never(p1_last_move() == 561) && 
                never(p1_last_move() == 552) &&
                default_difficulty()
)

// =========================================
//               Leaderboards              
// =========================================

leaderboard(
    id = 8587, title = "HI-B.A Point [Team Play]",
    description = "Best score table B.A",
    start  = game_mode() == 1 && arcade_match_progression_flags() == 0 && round_timer() == 96,
    cancel = p1_active_state() == 0,
    submit = game_stage() == 6 && p2_player_char_in_game() == 32 && game_cutscene() > 0,
    value  = arcade_ba_points_xx00_h4() * 1000 + arcade_ba_points_xx00_l4() * 100 + arcade_ba_points_00xx_h4() * 10 +
                 arcade_ba_points_00xx_l4() * 1
             ,
    format = "VALUE"
)
