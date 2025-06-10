// X-Men vs. Street Fighter
// #ID = 11942

// =========================================
//                Memory Access              
// =========================================


function settings_difficulty() => byte(0x00FCF3)
function settings_damage_level() => byte(0x00FCFB)
function settings_timer() => byte(0xfcf8)

function default_settings() {
    return(
        settings_difficulty() >= 1 &&
        settings_damage_level() == 1 &&
        settings_timer() == 1
    )
}

function default_diff_and_timer() {
    return(
        settings_difficulty() >= 1 &&
        settings_timer() == 1
    )
}

// Game
function game_players_active() => byte(0x005100)
function game_p1_active() => bit0(0x005100)
function game_p2_active() => bit1(0x005100)
function game_playing() => bit0(0x005101)

function game_match_state() => byte(0x005001)
function game_state() => dword(0x005144)

function game_arcade_match() => byte(0x005080)
function game_stage() => byte(0x005112)
function game_viewing_ending() => byte(0x5104) // 0x1c

function game_background_effect() => byte(0x00540C)
function game_hyper_background() => byte(0x005412)

// Round and match
function round_winner_flag() => byte(0x005004)
function round_timer_bcd() => byte(0x005009)
function round_state() => byte(0x00500E)
function round_first_attack_flag() => byte(0x005010)
function match_overkill() => bit1(0x00501F)

// Players
function p1_slot1_hp() => word(0x004210)
function p1_slot2_hp() => word(0x004A10)
function p2_slot1_hp() => word(0x004610)
function p2_slot2_hp() => word(0x004E10)

function p1_rounds_won() => byte(0x005003)
function p2_rounds_won() => byte(0x005002)

function p1_slot1_character() => byte(0x0050B0)
function p1_slot2_character() => byte(0x0050B2)
function p2_slot1_character() => byte(0x0050B4)
function p2_slot2_character() => byte(0x0050B6)

function p1_human_controlled() => byte(0x004002)
function p2_human_controlled() => byte(0x004402)

function p1_active_character() => byte(0x004052)

function p1_hit_combo() => byte(0x004111)
function p1_action_state() => byte(0x004061)
function p1_moves() => byte(0x0040D7)
function p1_move_type_confirmed() => byte(0x004113)
function p1_combo_type() => byte(0x004114)
function p1_sent_opponent_flying() => bit1(0x00411C)

function p1_special_gauge() => byte(0x004212)
function p1_gauge_level() => byte(0x004215)
function p1_consecutives_wins() => byte(0x004245)
function p1_variable_combination() => byte(0x004801)

// TODO: Look for P2 Active Character, just in-case

characters = {
   "Wolverine": 0,
   "Cyclops": 2,
   "Storm": 4,
   "Rogue": 6,
   "Gambit": 8,
   "Sabretooth": 10,
   "Juggernaut": 12,
   "Magneto": 14,
   "Apocalypse": 16,
   "Ryu": 18,
   "Ken": 20,
   "Classic Chun-Li": 22,
   "Dhalsim": 24,
   "Zangief": 26,
   "M. Bison": 28,
   "Akuma": 30,
   "Charlie": 32,
   "Cammy": 34,
   "Alpha Chun-Li": 36,
}

// =========================================
//                  Utility              
// =========================================

function p1_only() => game_p1_active() == 1 && never(game_p2_active() == 1)
function p1_active() => game_p1_active() == 1
function in_game() => never(game_playing() == 0)
function in_char_select() => game_state() == 0x00000002 

function p1_team_has_char(char_id) => p1_slot1_character() == char_id || p1_slot2_character() == char_id
function p1_dont_have_char(char_id) => p1_slot1_character() != char_id && p1_slot2_character() != char_id

// =========================================
//                  Endings              
// =========================================

achievement(
    title = "Let's Go, Bub", points = 5, type="win_condition",
    description = "Finish the game and get Wolverine's ending during Arcade mode.",
    id = 59161, published = "13/04/2018 23:27:29", modified = "21/09/2020 23:51:13",
    trigger = p1_only() &&
              in_game() &&
              game_arcade_match() == 8 &&
              game_viewing_ending() == 0x1c && prev(game_viewing_ending() != 0x1c) &&
              p1_active_character() == 0
)

achievement(
    title = "Optic Flash", points = 5, type="win_condition",
    description = "Finish the game and get Cyclops's ending during Arcade mode.",
    id = 59162, published = "13/04/2018 23:27:31", modified = "21/09/2020 23:51:14",
    trigger = p1_only() &&
              in_game() &&
              game_arcade_match() == 8 &&
              game_viewing_ending() == 0x1c && prev(game_viewing_ending() != 0x1c) &&
              p1_active_character() == 2
)

achievement(
    title = "Ororo Monroe", points = 5, type="win_condition",
    description = "Finish the game and get Storm's ending during Arcade mode.",
    id = 59163, published = "13/04/2018 23:27:32", modified = "21/09/2020 23:51:16",
    trigger = p1_only() &&
              in_game() &&
              game_arcade_match() == 8 &&
              game_viewing_ending() == 0x1c && prev(game_viewing_ending() != 0x1c) &&
              p1_active_character() == 4
)

achievement(
    title = "Southern Belle", points = 5, type="win_condition",
    description = "Finish the game and get Rogue's ending during Arcade mode.",
    id = 59164, published = "13/04/2018 23:27:34", modified = "21/09/2020 23:51:17",
    trigger = p1_only() &&
              in_game() &&
              game_arcade_match() == 8 &&
              game_viewing_ending() == 0x1c && prev(game_viewing_ending() != 0x1c) &&
              p1_active_character() == 6
)

achievement(
    title = "Come' on, Mon Ami", points = 5, type="win_condition",
    description = "Finish the game and get Gambit's ending during Arcade mode.",
    id = 59165, published = "13/04/2018 23:27:35", modified = "21/09/2020 23:51:18",
    trigger = p1_only() &&
              in_game() &&
              game_arcade_match() == 8 &&
              game_viewing_ending() == 0x1c && prev(game_viewing_ending() != 0x1c) &&
              p1_active_character() == 8
)

achievement(
    title = "Birdie!", points = 5, type="win_condition",
    description = "Finish the game and get Sabretooth's ending during Arcade mode.",
    id = 59166, published = "13/04/2018 23:27:36", modified = "21/09/2020 23:51:19",
    trigger = p1_only() &&
              in_game() &&
              game_arcade_match() == 8 &&
              game_viewing_ending() == 0x1c && prev(game_viewing_ending() != 0x1c) &&
              p1_active_character() == 10
)

achievement(
    title = "Don't Finish the game and get In My Way!!", points = 5, type="win_condition",
    description = "Finish the game and get Juggernaut's ending during Arcade mode.",
    id = 59167, published = "13/04/2018 23:27:38", modified = "21/09/2020 23:51:20",
    trigger = p1_only() &&
              in_game() &&
              game_arcade_match() == 8 &&
              game_viewing_ending() == 0x1c && prev(game_viewing_ending() != 0x1c) &&
              p1_active_character() == 12
)

achievement(
    title = "Magnetic Tempest", points = 5, type="win_condition",
    description = "Finish the game and get Magneto's ending during Arcade mode.",
    id = 59168, published = "13/04/2018 23:27:40", modified = "21/09/2020 23:51:21",
    trigger = p1_only() &&
              in_game() &&
              game_arcade_match() == 8 &&
              game_viewing_ending() == 0x1c && prev(game_viewing_ending() != 0x1c) &&
              p1_active_character() == 14
)

achievement(
    title = "The World Warrior", points = 5, type="win_condition",
    description = "Finish the game and get Ryu's ending during Arcade mode.",
    id = 59169, published = "13/04/2018 23:27:42", modified = "21/09/2020 23:51:22",
    trigger = p1_only() &&
              in_game() &&
              game_arcade_match() == 8 &&
              game_viewing_ending() == 0x1c && prev(game_viewing_ending() != 0x1c) &&
              p1_active_character() == 18
)

achievement(
    title = "Shinryuken", points = 5, type="win_condition",
    description = "Finish the game and get Ken's ending during Arcade mode.",
    id = 59170, published = "13/04/2018 23:27:43", modified = "21/09/2020 23:51:24",
    trigger = p1_only() &&
              in_game() &&
              game_arcade_match() == 8 &&
              game_viewing_ending() == 0x1c && prev(game_viewing_ending() != 0x1c) &&
              p1_active_character() == 20
)

achievement(
    title = "Interpol Agent", points = 5, type="win_condition",
    description = "Finish the game and get Chun-Li's ending during Arcade mode.",
    id = 59171, published = "13/04/2018 23:27:46", modified = "26/04/2024 01:45:39",
    trigger = p1_only() &&
              in_game() &&
              game_arcade_match() == 8 &&
              game_viewing_ending() == 0x1c && prev(game_viewing_ending() != 0x1c) &&
              p1_active_character() == 22
)

achievement(
    title = "Yoga Fire!", points = 5, type="win_condition",
    description = "Finish the game and get Dhalsim's ending during Arcade mode.",
    id = 59172, published = "13/04/2018 23:27:48", modified = "21/09/2020 23:51:26",
    trigger = p1_only() &&
              in_game() &&
              game_arcade_match() == 8 &&
              game_viewing_ending() == 0x1c && prev(game_viewing_ending() != 0x1c) &&
              p1_active_character() == 24
)

achievement(
    title = "Don't Call Me Cheap, Call Me Champ!", points = 5, type="win_condition",
    description = "Finish the game and get Zangief's ending during Arcade mode.",
    id = 59173, published = "13/04/2018 23:27:50", modified = "21/09/2020 23:51:27",
    trigger = p1_only() &&
              in_game() &&
              game_arcade_match() == 8 &&
              game_viewing_ending() == 0x1c && prev(game_viewing_ending() != 0x1c) &&
              p1_active_character() == 26
)

achievement(
    title = "Psycho Crusher", points = 5, type="win_condition",
    description = "Finish the game and get M. Bison's ending during Arcade mode.",
    id = 59174, published = "13/04/2018 23:27:53", modified = "21/09/2020 23:51:28",
    trigger = p1_only() &&
              in_game() &&
              game_arcade_match() == 8 &&
              game_viewing_ending() == 0x1c && prev(game_viewing_ending() != 0x1c) &&
              p1_active_character() == 28
)

achievement(
    title = "I'm Bored. What Else Is New?", points = 5, type="win_condition",
    description = "Finish the game and get Akuma's ending during Arcade mode.",
    id = 59175, published = "13/04/2018 23:27:59", modified = "21/09/2020 23:51:29",
    trigger = p1_only() &&
              in_game() &&
              game_arcade_match() == 8 &&
              game_viewing_ending() == 0x1c && prev(game_viewing_ending() != 0x1c) &&
              p1_active_character() == 30
)

achievement(
    title = "I Do It For My Country.", points = 5, type="win_condition",
    description = "Finish the game and get Charlie's ending during Arcade mode.",
    id = 59176, published = "13/04/2018 23:28:01", modified = "21/09/2020 23:51:30",
    trigger = p1_only() &&
              in_game() &&
              game_arcade_match() == 8 &&
              game_viewing_ending() == 0x1c && prev(game_viewing_ending() != 0x1c) &&
              p1_active_character() == 32
)

achievement(
    title = "Shadaloo Doll", points = 5, type="win_condition",
    description = "Finish the game and get Cammy's ending during Arcade mode.",
    id = 59177, published = "13/04/2018 23:28:03", modified = "21/09/2020 23:51:31",
    trigger = p1_only() &&
              in_game() &&
              game_arcade_match() == 8 &&
              game_viewing_ending() == 0x1c && prev(game_viewing_ending() != 0x1c) &&
              p1_active_character() == 34
)

// =========================================
//             Team Progression              
// =========================================

achievement(
    title = "The Protagonists", points = 10,
    description = "Get through the Arcade mode and defeat Apocalypse with Cyclops and Ryu (default difficulty and time).",
    id = 59178, published = "13/04/2018 23:28:05", modified = "21/09/2020 23:51:51",
    trigger = p1_only() &&
              in_game() &&
              once(game_arcade_match() == 0 && in_char_select()) &&
              never(p1_dont_have_char(2) && p1_rounds_won() > prev(p1_rounds_won())) &&
              never(p1_dont_have_char(18) && p1_rounds_won() > prev(p1_rounds_won())) &&
              p1_team_has_char(2) &&
              p1_team_has_char(18) &&
              trigger_when(game_arcade_match() == 7 && prev(game_arcade_match()) == 6) &&
              default_diff_and_timer()
)

achievement(
    title = "Street Fighter Alpha", points = 10,
    description = "Get through the Arcade mode and defeat Apocalypse with Cammy and Alpha Chun-Li (default difficulty and time).",
    id = 59196, published = "14/04/2018 18:59:36", modified = "21/09/2020 23:55:27",
    trigger = p1_only() &&
              in_game() &&
              once(game_arcade_match() == 0 && in_char_select()) &&
              never(p1_dont_have_char(34) && p1_rounds_won() > prev(p1_rounds_won())) &&
              never(p1_dont_have_char(36) && p1_rounds_won() > prev(p1_rounds_won())) &&
              p1_team_has_char(34) &&
              p1_team_has_char(36) &&
              trigger_when(game_arcade_match() == 7 && prev(game_arcade_match()) == 6) &&
              default_diff_and_timer()
)

achievement(
    title = "Street Fighter II", points = 10,
    description = "Get through the Arcade mode and defeat Apocalypse with Dhalsim and Zangief (default difficulty and time).",
    id = 59197, published = "14/04/2018 18:59:40", modified = "21/09/2020 23:52:02",
    trigger = p1_only() &&
              in_game() &&
              once(game_arcade_match() == 0 && in_char_select()) &&
              never(p1_dont_have_char(24) && p1_rounds_won() > prev(p1_rounds_won())) &&
              never(p1_dont_have_char(26) && p1_rounds_won() > prev(p1_rounds_won())) &&
              p1_team_has_char(24) &&
              p1_team_has_char(26) &&
              trigger_when(game_arcade_match() == 7 && prev(game_arcade_match()) == 6) &&
              default_diff_and_timer()
              
)

achievement(
    title = "Children of The Atom", points = 10,
    description = "Get through the Arcade mode and defeat Apocalypse with Storm and Juggernaut (default difficulty and time).",
    id = 59199, published = "14/04/2018 18:59:46", modified = "15/04/2018 20:44:42",
    trigger = p1_only() &&
              in_game() &&
              once(game_arcade_match() == 0 && in_char_select()) &&
              never(p1_dont_have_char(4) && p1_rounds_won() > prev(p1_rounds_won())) &&
              never(p1_dont_have_char(12) && p1_rounds_won() > prev(p1_rounds_won())) &&
              p1_team_has_char(4) &&
              p1_team_has_char(12) &&
              trigger_when(game_arcade_match() == 7 && prev(game_arcade_match()) == 6) &&
              default_diff_and_timer()

)

achievement(
    title = "Mutant Love", points = 10,
    description = "Get through the Arcade mode and defeat Apocalypse with Gambit and Rogue (default difficulty and time).",
    id = 59180, published = "13/04/2018 23:28:14", modified = "21/09/2020 23:52:34",
    trigger = p1_only() &&
              in_game() &&
              once(game_arcade_match() == 0 && in_char_select()) &&
              never(p1_dont_have_char(6) && p1_rounds_won() > prev(p1_rounds_won())) &&
              never(p1_dont_have_char(8) && p1_rounds_won() > prev(p1_rounds_won())) &&
              p1_team_has_char(6) &&
              p1_team_has_char(8) &&
              trigger_when(game_arcade_match() == 7 && prev(game_arcade_match()) == 6) &&
              default_diff_and_timer()
)

achievement(
    title = "Shadaloo", points = 10,
    description = "Get through the Arcade mode and defeat Apocalypse with Cammy and M. Bison (default difficulty and time).",
    id = 59203, published = "14/04/2018 18:59:53", modified = "14/04/2018 19:01:56",
    trigger = p1_only() &&
              in_game() &&
              once(game_arcade_match() == 0 && in_char_select()) &&
              never(p1_dont_have_char(34) && p1_rounds_won() > prev(p1_rounds_won())) &&
              never(p1_dont_have_char(28) && p1_rounds_won() > prev(p1_rounds_won())) &&
              p1_team_has_char(34) &&
              p1_team_has_char(28) &&
              trigger_when(game_arcade_match() == 7 && prev(game_arcade_match()) == 6) &&
              default_diff_and_timer()
)

achievement(
    title = "American Dream", points = 10,
    description = "Get through the Arcade mode and defeat Apocalypse with Ken and Cyclops (default difficulty and time).",
    id = 59205, published = "14/04/2018 20:14:18", modified = "25/09/2019 17:51:01",
    trigger = p1_only() &&
              in_game() &&
              once(game_arcade_match() == 0 && in_char_select()) &&
              never(p1_dont_have_char(20) && p1_rounds_won() > prev(p1_rounds_won())) &&
              never(p1_dont_have_char(2) && p1_rounds_won() > prev(p1_rounds_won())) &&
              p1_team_has_char(20) &&
              p1_team_has_char(2) &&
              trigger_when(game_arcade_match() == 7 && prev(game_arcade_match()) == 6) &&
              default_diff_and_timer()
)

// TODO: Needs rework
// achievement(
//     title = "Team Wrestling", points = 10,
//     description = "Get through the Arcade mode and defeat Apocalypse with Zangief and Sabretooth (default difficulty and time).",
//     id = 59201, published = "14/04/2018 18:59:49", modified = "07/10/2019 19:38:01",
//     trigger = p1_only() &&
//               in_game() &&
//               once(game_arcade_match() == 0 && in_char_select()) &&
//               never(p1_dont_have_char(10) && p1_rounds_won() > prev(p1_rounds_won())) &&
//               never(p1_dont_have_char(26) && p1_rounds_won() > prev(p1_rounds_won())) &&
//               p1_team_has_char(10) &&
//               p1_team_has_char(26) &&
//               trigger_when(game_arcade_match() == 7 && prev(game_arcade_match()) == 6) &&
//               default_diff_and_timer()
// )

achievement(
    title = "Satsui no Hado", points = 10,
    description = "Get through the Arcade mode and defeat Apocalypse with Ryu and Akuma (default difficulty and time).",
    id = 59187, published = "13/04/2018 23:28:30", modified = "14/04/2018 19:06:27",
    trigger = p1_only() &&
              in_game() &&
              once(game_arcade_match() == 0 && in_char_select()) &&
              never(p1_dont_have_char(18) && p1_rounds_won() > prev(p1_rounds_won())) &&
              never(p1_dont_have_char(30) && p1_rounds_won() > prev(p1_rounds_won())) &&
              p1_team_has_char(18) &&
              p1_team_has_char(30) &&
              trigger_when(game_arcade_match() == 7 && prev(game_arcade_match()) == 6) &&
              default_diff_and_timer()
)

achievement(
    title = "Sweet Cherry", points = 10,
    description = "Get through the Arcade mode and defeat Apocalypse with Rogue and Cammy (default difficulty and time).",
    id = 59186, published = "13/04/2018 23:28:29", modified = "04/10/2019 18:58:01",
    trigger = p1_only() &&
              in_game() &&
              once(game_arcade_match() == 0 && in_char_select()) &&
              never(p1_dont_have_char(6) && p1_rounds_won() > prev(p1_rounds_won())) &&
              never(p1_dont_have_char(34) && p1_rounds_won() > prev(p1_rounds_won())) &&
              p1_team_has_char(6) &&
              p1_team_has_char(34) &&
              trigger_when(game_arcade_match() == 7 && prev(game_arcade_match()) == 6) &&
              default_diff_and_timer()
)

achievement(
    title = "Anti-Xavier", points = 10,
    description = "Get through the Arcade mode and defeat Apocalypse with Magneto and Juggernaut (default difficulty and time).",
    id = 59204, published = "14/04/2018 20:14:16", modified = "19/10/2019 22:40:01",
    trigger = p1_only() &&
              in_game() &&
              once(game_arcade_match() == 0 && in_char_select()) &&
              never(p1_dont_have_char(12) && p1_rounds_won() > prev(p1_rounds_won())) &&
              never(p1_dont_have_char(14) && p1_rounds_won() > prev(p1_rounds_won())) &&
              p1_team_has_char(12) &&
              p1_team_has_char(14) &&
              trigger_when(game_arcade_match() == 7 && prev(game_arcade_match()) == 6) &&
              default_diff_and_timer()
)

achievement(
    title = "Thundering Justice", points = 10,
    description = "Get through the Arcade mode and defeat Apocalypse with Storm and Classic Chun-Li (default difficulty and time).",
    id = 59185, published = "13/04/2018 23:28:27", modified = "01/10/2019 18:20:01",
    trigger = p1_only() &&
              in_game() &&
              once(game_arcade_match() == 0 && in_char_select()) &&
              never(p1_dont_have_char(characters["Storm"]) && p1_rounds_won() > prev(p1_rounds_won())) &&
              never(p1_dont_have_char(characters["Classic Chun-Li"]) && p1_rounds_won() > prev(p1_rounds_won())) &&
              p1_team_has_char(characters["Storm"]) &&
              p1_team_has_char(characters["Classic Chun-Li"]) &&
              trigger_when(game_arcade_match() == 7 && prev(game_arcade_match()) == 6) &&
              default_diff_and_timer()
)

achievement(
    title = "Hunting Season", points = 10,
    description = "Get through the Arcade mode and defeat Apocalypse with Wolverine and Sabretooth (default difficulty and time).",
    id = 59184, published = "13/04/2018 23:28:25", modified = "22/10/2019 23:33:02",
    trigger = p1_only() &&
              in_game() &&
              once(game_arcade_match() == 0 && in_char_select()) &&
              never(p1_dont_have_char(0) && p1_rounds_won() > prev(p1_rounds_won())) &&
              never(p1_dont_have_char(10) && p1_rounds_won() > prev(p1_rounds_won())) &&
              p1_team_has_char(0) &&
              p1_team_has_char(10) &&
              trigger_when(game_arcade_match() == 7 && prev(game_arcade_match()) == 6) &&
              default_diff_and_timer()
)

achievement(
    title = "\"The Monster is Leaving the Cage! BIRLL\"", points = 10,
    description = "Get through the Arcade mode and defeat Apocalypse with Juggernaut and Zangief (default difficulty and time).",
    id = 59182, published = "13/04/2018 23:28:21", modified = "22/10/2019 23:33:02",
    trigger = p1_only() &&
              in_game() &&
              once(game_arcade_match() == 0 && in_char_select()) &&
              never(p1_dont_have_char(12) && p1_rounds_won() > prev(p1_rounds_won())) &&
              never(p1_dont_have_char(26) && p1_rounds_won() > prev(p1_rounds_won())) &&
              p1_team_has_char(12) &&
              p1_team_has_char(26) &&
              trigger_when(game_arcade_match() == 7 && prev(game_arcade_match()) == 6) &&
              default_diff_and_timer()
)

achievement(
    title = "Elite Task Force", points = 10,
    description = "Get through the Arcade mode and defeat Apocalypse with Classic Chun-Li and Charlie (default difficulty and time).",
    id = 59181, published = "13/04/2018 23:28:16", modified = "10/10/2019 20:20:01",
    trigger = p1_only() &&
              in_game() &&
              once(game_arcade_match() == 0 && in_char_select()) &&
              never(p1_dont_have_char(22) && p1_rounds_won() > prev(p1_rounds_won())) &&
              never(p1_dont_have_char(32) && p1_rounds_won() > prev(p1_rounds_won())) &&
              p1_team_has_char(22) &&
              p1_team_has_char(32) &&
              trigger_when(game_arcade_match() == 7 && prev(game_arcade_match()) == 6) &&
              default_diff_and_timer()
)

achievement(
    title = "Rulers of the Earth", points = 10,
    description = "Get through the Arcade mode and defeat Apocalypse with Magneto and M.Bison (default difficulty and time).",
    id = 59183, published = "13/04/2018 23:28:23", modified = "14/04/2018 19:06:20",
    trigger = p1_only() &&
              in_game() &&
              once(game_arcade_match() == 0 && in_char_select()) &&
              never(p1_dont_have_char(14) && p1_rounds_won() > prev(p1_rounds_won())) &&
              never(p1_dont_have_char(28) && p1_rounds_won() > prev(p1_rounds_won())) &&
              p1_team_has_char(14) &&
              p1_team_has_char(28) &&
              trigger_when(game_arcade_match() == 7 && prev(game_arcade_match()) == 6) &&
              default_diff_and_timer()
)

// TODO: Needs rework
// achievement(
//     title = "Team Fanatic", points = 10,
//     description = "Get through the Arcade mode and defeat Apocalypse with Sabretooth and Juggernaut (default difficulty and time).",
//     id = 59198, published = "14/04/2018 18:59:44", modified = "14/04/2018 19:02:04",
//     trigger = p1_only() &&
//               in_game() &&
//               once(game_arcade_match() == 0 && in_char_select()) &&
//               never(p1_dont_have_char(10) && p1_rounds_won() > prev(p1_rounds_won())) &&
//               never(p1_dont_have_char(12) && p1_rounds_won() > prev(p1_rounds_won())) &&
//               p1_team_has_char(10) &&
//               p1_team_has_char(12) &&
//               trigger_when(game_arcade_match() == 7 && prev(game_arcade_match()) == 6) &&
//               default_diff_and_timer()
// )

achievement(
    title = "Anti-Heroes", points = 10,
    description = "Get through the Arcade mode and defeat Apocalypse with Akuma and Wolverine (default difficulty and time).",
    id = 59198, published = "14/04/2018 18:59:51", modified = "19/10/2019 22:40:01",
    trigger = p1_only() &&
              in_game() &&
              once(game_arcade_match() == 0 && in_char_select()) &&
              never(p1_dont_have_char(30) && p1_rounds_won() > prev(p1_rounds_won())) &&
              never(p1_dont_have_char(0) && p1_rounds_won() > prev(p1_rounds_won())) &&
              p1_team_has_char(30) &&
              p1_team_has_char(0) &&
              trigger_when(game_arcade_match() == 7 && prev(game_arcade_match()) == 6) &&
              default_diff_and_timer()
)

achievement(
    title = "The Guys", points = 10,
    description = "Get through the Arcade mode and defeat Apocalypse with Charlie and Gambit (default difficulty and time).",
    id = 59201, published = "14/04/2018 18:59:47", modified = "25/09/2019 17:51:01",
    trigger = p1_only() &&
              in_game() &&
              once(game_arcade_match() == 0 && in_char_select()) &&
              never(p1_dont_have_char(8) && p1_rounds_won() > prev(p1_rounds_won())) &&
              never(p1_dont_have_char(32) && p1_rounds_won() > prev(p1_rounds_won())) &&
              p1_team_has_char(8) &&
              p1_team_has_char(32) &&
              trigger_when(game_arcade_match() == 7 && prev(game_arcade_match()) == 6) &&
              default_diff_and_timer()
)

achievement(
    title = "Team Clone", points = 5,
    description = "Select two of the same characters on your team",
    id = 59191, published = "13/04/2018 23:28:38", modified = "14/07/2024 22:56:39",
    trigger = p1_slot1_character() == p1_slot2_character() && byte(0x005181) == 4 && prev(byte(0x005181)) == 3
)

// =========================================
//                   Misc              
// =========================================

achievement(
    title = "X-Perfect Fighter", points = 5,
    description = "Win a match without taking a hit (default difficulty and time).",
    id = 59192, published = "13/04/2018 23:28:40", modified = "22/09/2020 00:13:26",
    trigger = p1_only() &&
              never(byte(0x005040) < 144) && never(byte(0x005042) < 144) &&
              game_arcade_match() > prev(game_arcade_match()) &&
              default_diff_and_timer()
)

achievement(
    title = "We Can't Be Defeated. Forget it!", points = 5,
    description = "Get 5 Variable Combination finishes during an Arcade run.",
    id = 59193, published = "13/04/2018 23:28:42", modified = "22/11/2021 12:37:22",
    trigger = p1_only() &&
              in_game() &&
              measured(repeated(5, p1_variable_combination() == 1 && game_arcade_match() > prev(game_arcade_match())))
)

achievement(
    title = "Destroying the Apocalypse", points = 5,
    description = "Defeat Apocalypse with a Variable Combination.",
    id = 59188, published = "13/04/2018 23:28:32", modified = "22/11/2021 12:37:22",
    trigger =   p1_only() &&
                p1_variable_combination() == 1 && 
                p2_slot1_character() == 16 && 
                p2_slot1_hp() == 0 && 
                round_state() == 2
)

// =========================================
//               Beat the game              
// =========================================
achievement(
    title = "Two Worlds, One Destiny...", points = 25,
    description = "Beat the game without losing (default difficulty and time).",
    id = 59190, published = "13/04/2018 23:28:34", modified = "22/09/2020 00:12:47",
    trigger = p1_only() &&
              in_game() &&
              once(game_arcade_match() == 0 && in_char_select()) &&
              trigger_when(game_arcade_match() == 8 && once(game_arcade_match() == 7)) && 
              never(p1_consecutives_wins() < prev(p1_consecutives_wins())) &&
              default_diff_and_timer()
)

// achievement(
//     title = "Unbeatable Team", points = 25,
//     description = "Beat the game without losing your partner (default difficulty and time).",
//     id = 59190, published = "13/04/2018 23:28:37", modified = "22/09/2020 00:12:27",
//     trigger = game_arcade_match() == 7 && once(game_arcade_match() == 5) && once(game_arcade_match() == 3) &&
//               once(game_arcade_match() == 1) && unless(settings_difficulty() < 1) && never(byte(0x005040) == 0) &&
//               never(byte(0x005042) == 0)
// )

achievement(
    title = "X-Men Pathway", points = 2,
    description = "Get a Hyper X finishing with a X-Men character during Arcade mode.",
    id = 59194, published = "13/04/2018 23:28:44", modified = "22/09/2020 00:13:28",
    trigger = p1_active_character() <= 14 && 
              never(p1_active_character() > 14) &&
              p1_rounds_won() > prev(p1_rounds_won()) &&
              game_hyper_background() == 0x16
)

achievement(
    title = "Street Fighter Pathway", points = 2,
    description = "Get a Hyper Combo finishing with a Street Fighter character during Arcade mode.",
    id = 59195, published = "13/04/2018 23:28:45", modified = "22/09/2020 00:13:31",
    trigger = never(p1_active_character() <= 14) && 
              p1_active_character() > 14 && 
              p1_rounds_won() > prev(p1_rounds_won()) &&
              game_hyper_background() == 0x10
)

// =========================================
//                   Misc              
// =========================================

achievement("Push Block", "Perform an Advancing Block 5 times.", 5,
            trigger = p1_active() &&
                      in_game() &&
                      measured(repeated(5, p1_action_state() == 0x0e && prev(p1_action_state() != 0x0e)))
            )

achievement("Air Combo", "Perform a 7-hit Air Combo ending with a hard knockdown.", 4,
            trigger = p1_active() &&
                      in_game() &&
                      p1_hit_combo() >= 7 &&
                      p1_sent_opponent_flying() > prev(p1_sent_opponent_flying())
            )

achievement("Hyper Sequence", "Perform a combo going from a normal attack into a Hyper Combo.", 3,
            trigger = p1_active() &&
                      in_game() &&
                      never(p1_hit_combo() == 0) &&
                      once(p1_move_type_confirmed() == 0 && p1_hit_combo() > prev(p1_hit_combo())) &&
                      p1_move_type_confirmed() == 0x20 && p1_hit_combo() > prev(p1_hit_combo())
            )

achievement("Overkill", "Hit your opponent on the ground with a Hyper Combo after the match is over.", 3,
            trigger = p1_active() &&
                      in_game() &&
                      match_overkill() == 1 &&
                      p1_hit_combo() > prev(p1_hit_combo()) &&
                      p1_move_type_confirmed() == 0x20
            )

achievement("Raging Vampire", "Hit your opponent with a Raging Demon as Rogue.", 5,
            trigger = p1_active() &&
                      in_game() &&
                      p1_active_character() == characters["Rogue"] &&
                      p1_moves() == 0x2e &&
                      p1_action_state() == 0x20 &&
                      p1_hit_combo() > prev(p1_hit_combo()) &&
                      p1_hit_combo() == 16
            )


achievement("Good Night Sugah", "Perform 8 different stealed Special Moves as Rogue during Arcade mode.", 10,
            trigger = p1_only() &&
                      in_game() &&
                      never(p1_slot1_character() != characters["Rogue"] && p1_slot2_character() != characters["Rogue"]) &&
                      unless(p1_active_character() != characters["Rogue"]) &&
                      measured(
                        tally(8,
                        once(p1_moves() == 0x02 && p1_action_state() == 0x2c && prev(p1_action_state()) != p1_action_state()), 
                        once(p1_moves() == 0x04 && p1_action_state() == 0x2c && prev(p1_action_state()) != p1_action_state()), 
                        once(p1_moves() == 0x08 && p1_action_state() == 0x2c && prev(p1_action_state()) != p1_action_state()), 
                        once(p1_moves() == 0x0a && p1_action_state() == 0x2c && prev(p1_action_state()) != p1_action_state()), 
                        once(p1_moves() == 0x0c && p1_action_state() == 0x2c && prev(p1_action_state()) != p1_action_state()), 
                        once(p1_moves() == 0x0e && p1_action_state() == 0x2c && prev(p1_action_state()) != p1_action_state()), 
                        once(p1_moves() == 0x10 && p1_action_state() == 0x2c && prev(p1_action_state()) != p1_action_state()), 
                        once(p1_moves() == 0x12 && p1_action_state() == 0x2c && prev(p1_action_state()) != p1_action_state()), 
                        once(p1_moves() == 0x18 && p1_hit_combo() > prev(p1_hit_combo()) && prev(p1_action_state()) == 0x2c && p1_action_state() == 0x20), 
                        once(p1_moves() == 0x1c && p1_action_state() == 0x2c && prev(p1_action_state()) != p1_action_state()), 
                        once(p1_moves() == 0x1e && p1_action_state() == 0x2c && prev(p1_action_state()) != p1_action_state()), 
                        once(p1_moves() == 0x20 && p1_action_state() == 0x2c && prev(p1_action_state()) != p1_action_state()), 
                        once(p1_moves() == 0x22 && p1_action_state() == 0x2c && prev(p1_action_state()) != p1_action_state()), 
                        once(p1_moves() == 0x24 && p1_action_state() == 0x2c && prev(p1_action_state()) != p1_action_state()), 
                        once(p1_moves() == 0x2a && p1_action_state() == 0x2c && prev(p1_action_state()) != p1_action_state()), 
                        once(p1_moves() == 0x2e && p1_action_state() == 0x2e && prev(p1_action_state()) != p1_action_state())
                        )
                      )
            )

achievement("Elemental Combination", "Finish a match with a Variable Combination consisting of only flame or electric attacks during Arcade mode.", 5,
            trigger = p1_active() &&
                      in_game() &&
                      p1_rounds_won() > prev(p1_rounds_won()) &&
                      p1_variable_combination() == 1 &&
                      __ornext(
                                p1_slot1_character() == characters["Akuma"]||
                                p1_slot1_character() == characters["Storm"] ||
                                p1_slot1_character() == characters["Ken"] ||
                                p1_slot1_character() == characters["Cammy"]||
                                p1_slot1_character() == characters["Dhalsim"]
                             ) &&
                      __ornext(
                                p1_slot2_character() == characters["Akuma"]||
                                p1_slot2_character() == characters["Storm"] ||
                                p1_slot2_character() == characters["Ken"] ||
                                p1_slot2_character() == characters["Cammy"]||
                                p1_slot2_character() == characters["Dhalsim"]
                             )
            )

function achiev_tag_finish(title, char1, char2, points) {

    achievement(title, format("Finish a match with a Variable Combination as {0} and {1} during Arcade mode.", char1, char2), points,
                trigger = p1_only() &&
                            in_game() &&
                            p1_team_has_char(characters[char1]) &&
                            p1_team_has_char(characters[char2]) &&
                            p1_variable_combination() == 1 &&
                            p1_rounds_won() > prev(p1_rounds_won())
                )
}

achiev_tag_finish("No More X-Men", "Magneto", "Juggernaut", 3)
achiev_tag_finish("From the Streets of 1991", "Zangief", "Dhalsim", 3)
achiev_tag_finish("The Shadow Reigns", "M. Bison", "Cammy", 3)
achiev_tag_finish("Fatal Claw", "Wolverine", "Sabretooth", 3)
achiev_tag_finish("Justice Knows No Borders", "Classic Chun-Li", "Charlie", 3)
achiev_tag_finish("Love and War", "Gambit", "Rogue", 3)
achiev_tag_finish("Energy Overdrive", "Ryu", "Cyclops", 3)

// =========================================
//             Deprecated teams              
// =========================================
// achievement(
//     title = "Team Combo", points = 10,
//     description = "Get through the Arcade mode and defeat Apocalypse with Wolverine and Ken (default difficulty and time).",
//     id = 59179, published = "13/04/2018 23:28:07", modified = "14/04/2018 22:51:55",
//     trigger = p1_only() &&
//               in_game() &&
//               once(game_arcade_match() == 0 && in_char_select()) &&
//               never(p1_dont_have_char(0) && p1_rounds_won() > prev(p1_rounds_won())) &&
//               never(p1_dont_have_char(20) && p1_rounds_won() > prev(p1_rounds_won())) &&
//               p1_team_has_char(0) &&
//               p1_team_has_char(20) &&
//               trigger_when(game_arcade_match() == 7 && prev(game_arcade_match()) == 6) &&
//               default_diff_and_timer()
// )


