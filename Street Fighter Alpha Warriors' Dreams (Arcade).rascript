// Street Fighter Alpha: Warriors' Dreams
// #ID = 11805

// =========================================
//              Memory Accessors              
// =========================================

// Settings
function settings_damage_level() => byte(0x81a0)
function settings_difficulty() => byte(0x0081A1)
function settings_timer_speed() => byte(0x81a3)
function settings_max_round() => byte(0x0081A5)

function settings_game_speed() => byte(0x81a2)

function default_settings() {
    return(
        settings_damage_level() == 1 &&
        settings_difficulty() >= 1 &&
        settings_timer_speed() == 1 &&
        settings_max_round() == 2
    )
}

// Game
function game_players_active_connected() => byte(0x0081A9)
function game_players_active_ingame() => byte(0x81ad)
function game_versus_flag() => bit0(0x81ac)

function game_arcade_match() => byte(0x00AE12)
function game_arcade_opponents_defeated() => word(0xae10)
function game_ending() => byte(0x00AE31)

function round_running() => bit0(0x00AE2C)

// Score
function p1_score_0_xx0_000_dword() => dword(0x0084B0)

function p1_score_0_xx0_000_low4() => low4(0x0084B0)
function p1_score_0_xx0_000_high4() => high4(0x0084B0)
function p1_score_x_000_000_low4() => low4(0x0084B1)
function p1_score_x_000_000_high4() => high4(0x0084B1)

function p1_score_0_000_0xx_low4() => low4(0x0084B2)
function p1_score_0_000_0xx_high4() => high4(0x0084B2)

function p1_score_0_00x_x00_low4() => low4(0x0084B3)
function p1_score_0_00x_x00_high4() => high4(0x0084B3)

function p1_score_x_000_000() => byte(0x0084B1)
function p2_score_x_000_000() => byte(0x0088B1)

// P1
function p1_character() => byte(0x0084A3)
function p1_hp() => byte(0x8440)
function p1_hit_combo() => byte(0x8856)
function p1_max_combo() => byte(0x0084C5)
function p1_rounds_won() => byte(0x0084C7)

function p1_move() => byte(0x8532)
function p1_attacking() => byte(0x8533)
function p1_action_state2() => byte(0x8407)

function p1_credits_used() => byte(0x0084B2)

// P2
function p2_character() => byte(0x0088A3)
function p2_hp() => byte(0x8840)
function p2_rounds_won() => byte(0x88c7)



// =========================================
//             Utility Functions              
// =========================================

function in_game() => never(game_players_active_connected() == 0x00)
function p1_only() => in_game() && never(game_players_active_ingame() >= 2)
function game_beaten() => game_arcade_match() == 8 && prev(game_arcade_match()) == 7

// =========================================
//                  Notes              
// =========================================

// DONE: Fix ponctuation and grammar
// DONE: Add proper check for in-game and maybe P1/P2 connected
// DONE: Rewrite "Beat the game" achievements to have trigger and reset on round win with wrong character
// DONE: Make sure to properly add all settings requirements on achievements that has them (Hidden Fights)
// DONE: Add memory accessor for Turbo settings

// =========================================
//               Beat the game              
// =========================================

achievement(
    title = "Sayonara!", points = 10, type="progression",
    description = "Beat the game using only Ryu (default settings).",
    id = 58743, badge = "61245", published = "25/03/2018 23:45:03", modified = "30/06/2020 13:42:00",
    trigger = in_game() &&
              p1_only() &&
              once(game_arcade_opponents_defeated() == 0 && p1_character() == 0) &&
              never(p1_rounds_won() > prev(p1_rounds_won()) && p1_character() != 0) &&
              p1_character() == 0 && 
              trigger_when(game_beaten()) &&
              default_settings()
)

achievement(
    title = "Father!", points = 10, type="progression",
    description = "Beat the game using only Chun Li (default settings).",
    id = 58744, badge = "61246", published = "25/03/2018 23:45:04", modified = "30/06/2020 13:42:12",
    trigger = in_game() &&
              p1_only() &&
              once(game_arcade_opponents_defeated() == 0 && p1_character() == 4) &&
              never(p1_rounds_won() > prev(p1_rounds_won()) && p1_character() != 4) &&
              p1_character() == 4 &&
              trigger_when(game_beaten()) &&
              default_settings()
)

achievement(
    title = "Say Again. Over.", points = 10, type="progression",
    description = "Beat the game using only Nash (default settings).",
    id = 58745, badge = "61247", published = "25/03/2018 23:45:08", modified = "29/03/2024 13:48:05",
    trigger = in_game() &&
              p1_only() &&
              once(game_arcade_opponents_defeated() == 0 && p1_character() == 3) &&
              never(p1_rounds_won() > prev(p1_rounds_won()) && p1_character() != 3) &&
              p1_character() == 3 &&
              trigger_when(game_beaten()) &&
              default_settings()
)

achievement(
    title = "Goodbye!", points = 10, type="progression",
    description = "Beat the game using only Ken (default settings).",
    id = 58746, badge = "61248", published = "25/03/2018 23:45:09", modified = "30/06/2020 13:42:10",
    trigger = in_game() &&
              p1_only() &&
              once(game_arcade_opponents_defeated() == 0 && p1_character() == 1) &&
              never(p1_rounds_won() > prev(p1_rounds_won()) && p1_character() != 1) &&
              p1_character() == 1 &&
              trigger_when(game_beaten()) &&
              default_settings()
)

achievement(
    title = "Bushinryu", points = 10, type="progression",
    description = "Beat the game using only Guy (default settings).",
    id = 58747, badge = "61249", published = "25/03/2018 23:45:12", modified = "30/06/2020 13:42:09",
    trigger = in_game() &&
              p1_only() &&
              once(game_arcade_opponents_defeated() == 0 && p1_character() == 7) &&
              never(p1_rounds_won() > prev(p1_rounds_won()) && p1_character() != 7) &&
              p1_character() == 7 &&
              trigger_when(game_beaten()) &&
              default_settings()
)

achievement(
    title = "Notorius Thug", points = 10, type="progression",
    description = "Beat the game using only Birdie (default settings).",
    id = 58748, badge = "61250", published = "25/03/2018 23:45:13", modified = "30/06/2020 13:42:07",
    trigger = in_game() &&
              p1_only() &&
              once(game_arcade_opponents_defeated() == 0 && p1_character() == 8) &&
              never(p1_rounds_won() > prev(p1_rounds_won()) && p1_character() != 8) &&
              p1_character() == 8 &&
              trigger_when(game_beaten()) &&
              default_settings()
)

achievement(
    title = "Fake Japanese", points = 10, type="progression",
    description = "Beat the game using only Sodom (default settings).",
    id = 58749, badge = "61251", published = "25/03/2018 23:45:15", modified = "30/06/2020 13:42:06",
    trigger = in_game() &&
              p1_only() &&
              once(game_arcade_opponents_defeated() == 0 && p1_character() == 6) &&
              never(p1_rounds_won() > prev(p1_rounds_won()) && p1_character() != 6) &&
              p1_character() == 6 &&
              trigger_when(game_beaten()) &&
              default_settings()
)

achievement(
    title = "The New God of Muay Thai", points = 10, type="progression",
    description = "Beat the game using only Adon (default settings).",
    id = 58750, badge = "61252", published = "25/03/2018 23:45:17", modified = "29/03/2024 13:46:03",
    trigger = in_game() &&
              p1_only() &&
              once(game_arcade_opponents_defeated() == 0 && p1_character() == 5) &&
              never(p1_rounds_won() > prev(p1_rounds_won()) && p1_character() != 5) &&
              p1_character() == 5 &&
              trigger_when(game_beaten()) &&
              default_settings()
)

achievement(
    title = "Soul Power", points = 10, type="progression",
    description = "Beat the game using only Rose (default settings).",
    id = 58751, badge = "61253", published = "25/03/2018 23:45:19", modified = "30/06/2020 13:42:03",
    trigger = in_game() &&
              p1_only() &&
              once(game_arcade_opponents_defeated() == 0 && p1_character() == 9) &&
              never(p1_rounds_won() > prev(p1_rounds_won()) && p1_character() != 9) &&
              p1_character() == 9 &&
              trigger_when(game_beaten()) &&
              default_settings()
)

achievement(
    title = "Vendetta", points = 10, type="progression",
    description = "Beat the game using only Sagat (default settings).",
    id = 58752, badge = "61254", published = "25/03/2018 23:45:21", modified = "30/06/2020 13:42:02",
    trigger = in_game() &&
              p1_only() &&
              once(game_arcade_opponents_defeated() == 0 && p1_character() == 11) &&
              never(p1_rounds_won() > prev(p1_rounds_won()) && p1_character() != 11) &&
              p1_character() == 11 &&
              trigger_when(game_beaten()) &&
              default_settings()
)

achievement(
    title = "Demon Warrior", points = 10, type="progression",
    description = "Beat the game using only Akuma (default settings).",
    id = 58753, badge = "61255", published = "25/03/2018 23:45:23", modified = "30/06/2020 13:42:01",
    trigger = in_game() &&
              p1_only() &&
              once(game_arcade_opponents_defeated() == 0 && p1_character() == 2) &&
              never(p1_rounds_won() > prev(p1_rounds_won()) && p1_character() != 2) &&
              p1_character() == 2 &&
              trigger_when(game_beaten()) &&
              default_settings()
)

achievement(
    title = "Psycho Power", points = 10, type="progression",
    description = "Beat the game using only Bison (default settings).",
    id = 58754, badge = "61256", published = "25/03/2018 23:45:24", modified = "30/06/2020 13:42:20",
    trigger = in_game() &&
              p1_only() &&
              once(game_arcade_opponents_defeated() == 0 && p1_character() == 10) &&
              never(p1_rounds_won() > prev(p1_rounds_won()) && p1_character() != 10) &&
              p1_character() == 10 &&
              trigger_when(game_beaten()) &&
              default_settings()
)

achievement(
    title = "Saikyo Ryuu", points = 10, type="progression",
    description = "Beat the game using only Dan (default settings).",
    id = 58755, badge = "61257", published = "25/03/2018 23:45:26", modified = "29/03/2024 13:46:03",
    trigger = in_game() &&
              p1_only() &&
              once(game_arcade_opponents_defeated() == 0 && p1_character() == 12) &&
              never(p1_rounds_won() > prev(p1_rounds_won()) && p1_character() != 12) &&
              p1_character() == 12 &&
              trigger_when(game_beaten()) &&
              default_settings()
)

// Challenges
achievement(
    title = "Harder, Better, Faster...", points = 25,
    description = "Beat the game on the hardest difficulty and on Turbo 2 setting (default settings).",
    trigger = in_game() &&
              p1_only() &&
              trigger_when(game_beaten()) &&
              settings_difficulty() == 7 &&
              settings_game_speed() == 2 &&
              default_settings()
)

achievement(
    title = "Alpha Credit", points = 25,
    description = "Beat the game without using a continue (default settings).",
    trigger = in_game() &&
              p1_only() &&
              once(game_arcade_opponents_defeated() == 0) &&
              never(p1_credits_used() > prev(p1_credits_used())) &&
              trigger_when(game_beaten()) &&
              default_settings()
)

// =========================================
//                  Miscs              
// =========================================

achievement(
    title = "Akuma Alpha", points = 1,
    description = "Play as Akuma.",
    id = 58756, badge = "61258", published = "25/03/2018 23:45:28", modified = "29/03/2024 13:46:04",
    trigger = in_game() &&
              repeated(15, byte(0x00A2B1) == 2) && never(byte(0x00A2B1) != 2) && p1_character() == 2
)

achievement(
    title = "Bison Alpha", points = 1,
    description = "Play as M. Bison.",
    id = 58757, badge = "61259", published = "25/03/2018 23:45:30", modified = "29/03/2024 13:46:05",
    trigger = in_game() &&
              repeated(15, byte(0x00A2B1) == 10) && never(byte(0x00A2B1) != 10) && p1_character() == 10
)

achievement(
    title = "Dan Alpha", points = 1,
    description = "Play as Dan.",
    id = 58758, badge = "61260", published = "25/03/2018 23:45:32", modified = "29/03/2024 13:46:05",
    trigger = in_game() &&
              repeated(15, byte(0x00A2B1) == 12) && never(byte(0x00A2B1) != 12) && p1_character() == 12
)

achievement(
    title = "Shun Goku Satsu", points = 3,
    description = "Perform Akuma's secret special art during Arcade mode.",
    id = 58764, badge = "61266", published = "25/03/2018 23:45:42", modified = "08/08/2018 19:04:46",
    trigger = in_game() &&
              p1_character() == 2 && 
              p1_only() &&
              p1_move() == 0x16 &&
              p1_action_state2() == 0x10 &&
              p1_hit_combo() > prev(p1_hit_combo())
)


achievement(
    title = "Almost Taekwondo", points = 10,
    description = "Reach the 5th match of Arcade mode without using punch buttons on a fight (default settings).",
    id = 58760, badge = "61262", published = "25/03/2018 23:45:35", modified = "29/03/2024 14:08:34",
    trigger = in_game() &&
              p1_only() &&
              once(prev(round_running()) == 0 && round_running() == 1 && p1_score_0_xx0_000_dword() == 0 && game_arcade_match() == 0) &&
              trigger_when(game_arcade_match() == 4) && 
              trigger_when(prev(game_arcade_match()) == 3) &&
              default_settings() &&
              ((never((round_running() == 1 && bit0(0x008527) == 1)) &&
                never((round_running() == 1 && bit1(0x008527) == 1)) &&
                never((round_running() == 1 && bit2(0x008527) == 1))) ||
               (never((round_running() == 1 && bit0(0x008927) == 1)) &&
                never((round_running() == 1 && bit1(0x008927) == 1)) &&
                never((round_running() == 1 && bit2(0x008927) == 1))))
)

achievement(
    title = "Boxing Fighter", points = 10,
    description = "Reach the 5th match of Arcade mode without using kick buttons on a fight (default settings).",
    id = 58759, badge = "61261", published = "25/03/2018 23:45:33", modified = "29/03/2024 14:08:35",
    trigger = in_game() &&
              p1_only() &&
              once(prev(round_running()) == 0 && round_running() == 1 && p1_score_0_xx0_000_dword() == 0 && game_arcade_match() == 0) &&
              trigger_when(game_arcade_match() == 4) && 
              trigger_when(prev(game_arcade_match()) == 3) &&
              default_settings() &&
              ((never((round_running() == 1 && bit4(0x008527) == 1)) &&
                never((round_running() == 1 && bit5(0x008527) == 1)) &&
                never((round_running() == 1 && bit6(0x008527) == 1))) ||
               (never((round_running() == 1 && bit4(0x008927) == 1)) &&
                never((round_running() == 1 && bit5(0x008927) == 1)) &&
                never((round_running() == 1 && bit6(0x008927) == 1))))
)

achievement(
    title = "I AM POWER MADE OF FLESH!", points = 10,
    description = "Find me at the last battle!",
    id = 58761, badge = "61263", published = "25/03/2018 23:45:37", modified = "09/09/2020 15:54:59",
    trigger = game_versus_flag() == 0 &&
              game_arcade_match() >= 7 && 
              p2_character() == 2
)

achievement(
    title = "Hidden Fight I", points = 50,
    description = "Defeat Akuma in Arcade mode (3 rounds).",
    id = 58762, badge = "61264", published = "25/03/2018 23:45:38", modified = "09/09/2020 16:23:20",
    trigger = in_game() &&
              p1_only() &&
              p2_character() == 2 && 
              p1_rounds_won() == 2 &&
              settings_max_round() == 2
)

achievement(
    title = "Hidden Fight II", points = 25,
    description = "Defeat Dan in Arcade mode (3 rounds).",
    id = 58763, badge = "61265", published = "25/03/2018 23:45:41", modified = "30/06/2020 13:42:16",
    trigger = in_game() &&
              p1_only() &&
              p2_character() == 12 && 
              p1_rounds_won() == 2 &&
              settings_max_round() == 2
)

achievement(
    title = "Alpha Fighter", points = 25,
    description = "Reach 1 million score without using a credit (default settings).",
    id = 58765, badge = "61268", published = "25/03/2018 23:45:44", modified = "29/03/2024 13:46:06",
    trigger = in_game() &&
              p1_only() &&
              p1_score_x_000_000() == 1 &&
              prev(p1_score_x_000_000()) == 0 &&
              p1_credits_used() == 0 &&
              default_settings()

)

// =========================================
//                Leaderboards              
// =========================================

leaderboard(
    id = 3753, title = "Dream Warriors Score",
    description = "Best score on Arcade mode (default settings).",
    start  = p1_only() && game_arcade_match() == 8 && default_settings(),
    cancel = game_arcade_match() == 0,
    submit = always_true(),
    value  = p1_score_x_000_000_high4() * 10000000 + p1_score_x_000_000_low4() * 1000000 + p1_score_0_xx0_000_high4() *
                 100000 + p1_score_0_xx0_000_low4() * 10000 + p1_score_0_00x_x00_high4() * 1000 + p1_score_0_00x_x00_low4()
                 * 100 + p1_score_0_000_0xx_high4() * 10 + p1_score_0_000_0xx_low4() * 1
             ,
    format = "VALUE"
)

leaderboard(
    title = "Dream Warriors Score (1CC)",
    description = "Best score on Arcade mode with a single credit (default settings).",
    start  = p1_only() && game_arcade_match() == 8 && default_settings() && p1_credits_used() == 0,
    cancel = game_arcade_match() == 0,
    submit = always_true(),
    value  = p1_score_x_000_000_high4() * 10000000 + p1_score_x_000_000_low4() * 1000000 + p1_score_0_xx0_000_high4() *
                 100000 + p1_score_0_xx0_000_low4() * 10000 + p1_score_0_00x_x00_high4() * 1000 + p1_score_0_00x_x00_low4()
                 * 100 + p1_score_0_000_0xx_high4() * 10 + p1_score_0_000_0xx_low4() * 1
             ,
    format = "VALUE"
)
