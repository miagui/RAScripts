// Street Fighter III: 3rd Strike - Fight for the Future
// #ID = 11795

// =========================================
//              Memory Accessors              
// =========================================

// Settings
function settings_damage_level() => byte(0x06AC01)
function settings_difficulty() => byte(0x06AC02)
function settings_bonus_game_enabled() => byte(0x06AC04)
function settings_max_rounds_1p_2p() => byte(0x06AC07)

// Game
function game_versus_flag() => byte(0x0113B6)
function game_state() => dword(0x015438)
function game_screen() => word(0x015468)
function game_arcade_match() => byte(0x015504)
function game_arcade_match() => word(0x015504)

function game_ending() => byte(0x028244)
function game_timer_frames() => byte(0x0331B0)

function arcade_perfects() => byte(0x016B4B)

function round_timer() => byte(0x011374)

// P1
function p1_character_match() => byte(0x011384)
function p1_human_controlled() => byte(0x0156E1)
function p1_rounds_won() => word(0x011380)

function p1_score_decimal_value() => dword(0x01139C)
function p1_continues_used() => byte(0x015666)

function p1_hp() => word(0x068D08)
function p1_move() => dword(0x068D18)
function p1_gauge_level() => byte(0x0695BC)

// P2
function p2_character_match() => byte(0x01138B)
function p2_human_controlled() => byte(0x0156E0)

function p2_hp() => word(0x0691A0)
function p2_state() => dword(0x0691B2)


// =========================================
//             Utility Functions              
// =========================================

function p1_only() => never(game_versus_flag() == 1) && never(p2_human_controlled() == 1)

// =========================================
//                Progression              
// =========================================

achievement(
    title = "Pro Wrestler", points = 10, type="progression",
    description = "Finish the entire Arcade mode using only Alex (default difficulty and rounds)",
    id = 58897, badge = "61460", published = "30/03/2018 01:29:53", modified = "21/01/2020 14:26:40",
    trigger = never(game_state() == 0x00000000) &&
              never(game_state() == 0x00000001) &&
              p1_only() &&
              p1_character_match() == 1 && 
              trigger_when(game_arcade_match() == 10 && prev(game_arcade_match()) == 9) &&
              once(game_arcade_match() == 0 && game_state() == 0x00010001 && game_screen() == 0x03) &&
              never(p1_character_match() != 1 && p1_rounds_won() > prev(p1_rounds_won())) &&
              settings_difficulty() >= 2 && 
              settings_max_rounds_1p_2p() == 17
)

achievement(
    title = "Prosperous Fighter", points = 10, type="progression",
    description = "Finish the entire Arcade mode using only Ryu (default difficulty and rounds)",
    id = 58898, badge = "61461", published = "30/03/2018 01:29:54", modified = "21/01/2020 14:26:42",
    trigger = never(game_state() == 0x00000000) &&
              never(game_state() == 0x00000001) &&
              p1_only() &&
              p1_character_match() == 2 && 
              trigger_when(game_arcade_match() == 10 && prev(game_arcade_match()) == 9) &&
              once(game_arcade_match() == 0 && game_state() == 0x00010001 && game_screen() == 0x03) &&
              never(p1_character_match() != 2 && p1_rounds_won() > prev(p1_rounds_won())) &&
              settings_difficulty() >= 2 && 
              settings_max_rounds_1p_2p() == 17
)

achievement(
    title = "The Owner of The Streets", points = 10, type="progression",
    description = "Finish the entire Arcade mode using only Yun (default difficulty and rounds)",
    id = 58899, badge = "61462", published = "30/03/2018 01:29:56", modified = "21/01/2020 14:26:44",
    trigger = never(game_state() == 0x00000000) &&
              never(game_state() == 0x00000001) &&
              p1_only() &&
              p1_character_match() == 3 && 
              trigger_when(game_arcade_match() == 10 && prev(game_arcade_match()) == 9) &&
              once(game_arcade_match() == 0 && game_state() == 0x00010001 && game_screen() == 0x03) &&
              never(p1_character_match() != 3 && p1_rounds_won() > prev(p1_rounds_won())) &&
              settings_difficulty() >= 2 && 
              settings_max_rounds_1p_2p() == 17
)

achievement(
    title = "Gentleman", points = 10, type="progression",
    description = "Finish the entire Arcade mode using only Dudley (default difficulty and rounds)",
    id = 58900, badge = "61463", published = "30/03/2018 01:29:58", modified = "21/01/2020 14:26:45",
    trigger = never(game_state() == 0x00000000) &&
              never(game_state() == 0x00000001) &&
              p1_only() &&
              p1_character_match() == 4 && 
              trigger_when(game_arcade_match() == 10 && prev(game_arcade_match()) == 9) &&
              once(game_arcade_match() == 0 && game_state() == 0x00010001 && game_screen() == 0x03) &&
              never(p1_character_match() != 4 && p1_rounds_won() > prev(p1_rounds_won())) &&
              settings_difficulty() >= 2 && 
              settings_max_rounds_1p_2p() == 17
)

achievement(
    title = "G-Project Experiment", points = 10, type="progression",
    description = "Finish the entire Arcade mode using only Necro (default difficulty and rounds)",
    id = 58901, badge = "61464", published = "30/03/2018 01:29:59", modified = "21/01/2020 14:26:46",
    trigger = never(game_state() == 0x00000000) &&
              never(game_state() == 0x00000001) &&
              p1_only() &&
              p1_character_match() == 5 && 
              trigger_when(game_arcade_match() == 10 && prev(game_arcade_match()) == 9) &&
              once(game_arcade_match() == 0 && game_state() == 0x00010001 && game_screen() == 0x03) &&
              never(p1_character_match() != 5 && p1_rounds_won() > prev(p1_rounds_won())) &&
              settings_difficulty() >= 2 && 
              settings_max_rounds_1p_2p() == 17
)

achievement(
    title = "I AM NUMBER ONE!", points = 10, type="progression",
    description = "Finish the entire Arcade mode using only Hugo (default difficulty and rounds)",
    id = 58902, badge = "61465", published = "30/03/2018 01:30:02", modified = "03/09/2022 21:28:39",
    trigger = never(game_state() == 0x00000000) &&
              never(game_state() == 0x00000001) &&
              p1_only() &&
              p1_character_match() == 6 && 
              trigger_when(game_arcade_match() == 10 && prev(game_arcade_match()) == 9) &&
              once(game_arcade_match() == 0 && game_state() == 0x00010001 && game_screen() == 0x03) &&
              never(p1_character_match() != 6 && p1_rounds_won() > prev(p1_rounds_won())) &&
              settings_difficulty() >= 2 && 
              settings_max_rounds_1p_2p() == 17
)

achievement(
    title = "Mezame na Kage", points = 10, type="progression",
    description = "Finish the entire Arcade mode using only Ibuki (default difficulty and rounds)",
    id = 58944, badge = "61534", published = "31/03/2018 03:15:22", modified = "21/01/2020 14:26:48",
    trigger = never(game_state() == 0x00000000) &&
              never(game_state() == 0x00000001) &&
              p1_only() &&
              p1_character_match() == 7 && 
              trigger_when(game_arcade_match() == 10 && prev(game_arcade_match()) == 9) &&
              once(game_arcade_match() == 0 && game_state() == 0x00010001 && game_screen() == 0x03) &&
              never(p1_character_match() != 7 && p1_rounds_won() > prev(p1_rounds_won())) &&
              settings_difficulty() >= 2 && 
              settings_max_rounds_1p_2p() == 17
)

achievement(
    title = "Kenyan Princess", points = 10, type="progression",
    description = "Finish the entire Arcade mode using only Elena (default difficulty and rounds)",
    id = 58903, badge = "61466", published = "30/03/2018 01:30:04", modified = "21/01/2020 14:26:49",
    trigger = never(game_state() == 0x00000000) &&
              never(game_state() == 0x00000001) &&
              p1_only() &&
              p1_character_match() == 8 && 
              trigger_when(game_arcade_match() == 10 && prev(game_arcade_match()) == 9) &&
              once(game_arcade_match() == 0 && game_state() == 0x00010001 && game_screen() == 0x03) &&
              never(p1_character_match() != 8 && p1_rounds_won() > prev(p1_rounds_won())) &&
              settings_difficulty() >= 2 && 
              settings_max_rounds_1p_2p() == 17
)

achievement(
    title = "Old Hermit", points = 10, type="progression",
    description = "Finish the entire Arcade mode using only Oro (default difficulty and rounds)",
    id = 58904, badge = "61467", published = "30/03/2018 01:30:06", modified = "21/01/2020 14:26:50",
    trigger = never(game_state() == 0x00000000) &&
              never(game_state() == 0x00000001) &&
              p1_only() &&
              p1_character_match() == 9 && 
              trigger_when(game_arcade_match() == 10 && prev(game_arcade_match()) == 9) &&
              once(game_arcade_match() == 0 && game_state() == 0x00010001 && game_screen() == 0x03) &&
              never(p1_character_match() != 9 && p1_rounds_won() > prev(p1_rounds_won())) &&
              settings_difficulty() >= 2 && 
              settings_max_rounds_1p_2p() == 17
)

achievement(
    title = "Hong Kong Skater", points = 10, type="progression",
    description = "Finish the entire Arcade mode using only Yang (default difficulty and rounds)",
    id = 58905, badge = "61469", published = "30/03/2018 01:30:07", modified = "21/01/2020 14:26:52",
    trigger = never(game_state() == 0x00000000) &&
              never(game_state() == 0x00000001) &&
              p1_only() &&
              p1_character_match() == 10 && 
              trigger_when(game_arcade_match() == 10 && prev(game_arcade_match()) == 9) &&
              once(game_arcade_match() == 0 && game_state() == 0x00010001 && game_screen() == 0x03) &&
              never(p1_character_match() != 10 && p1_rounds_won() > prev(p1_rounds_won())) &&
              settings_difficulty() >= 2 && 
              settings_max_rounds_1p_2p() == 17
)

achievement(
    title = "Sho... Ryuuu... Kennn!", points = 10, type="progression",
    description = "Finish the entire Arcade mode using only Ken (default difficulty and rounds)",
    id = 58906, badge = "61470", published = "30/03/2018 01:30:08", modified = "21/01/2020 14:26:52",
    trigger = never(game_state() == 0x00000000) &&
              never(game_state() == 0x00000001) &&
              p1_only() &&
              p1_character_match() == 11 && 
              trigger_when(game_arcade_match() == 10 && prev(game_arcade_match()) == 9) &&
              once(game_arcade_match() == 0 && game_state() == 0x00010001 && game_screen() == 0x03) &&
              never(p1_character_match() != 11 && p1_rounds_won() > prev(p1_rounds_won())) &&
              settings_difficulty() >= 2 && 
              settings_max_rounds_1p_2p() == 17
)

achievement(
    title = "Capoeirista", points = 10, type="progression",
    description = "Finish the entire Arcade mode using only Sean (default difficulty and rounds)",
    id = 58907, badge = "61471", published = "30/03/2018 01:30:10", modified = "21/01/2020 14:26:53",
    trigger = never(game_state() == 0x00000000) &&
              never(game_state() == 0x00000001) &&
              p1_only() &&
              p1_character_match() == 12 && 
              trigger_when(game_arcade_match() == 10 && prev(game_arcade_match()) == 9) &&
              once(game_arcade_match() == 0 && game_state() == 0x00010001 && game_screen() == 0x03) &&
              never(p1_character_match() != 12 && p1_rounds_won() > prev(p1_rounds_won())) &&
              settings_difficulty() >= 2 && 
              settings_max_rounds_1p_2p() == 17
)

achievement(
    title = "The Treacherous Disciple", points = 10, type="progression",
    description = "Finish the entire Arcade mode using only Urien (default difficulty and rounds)",
    id = 58908, badge = "61472", published = "30/03/2018 01:30:11", modified = "21/01/2020 14:26:54",
    trigger = never(game_state() == 0x00000000) &&
              never(game_state() == 0x00000001) &&
              p1_only() &&
              p1_character_match() == 13 && 
              trigger_when(game_arcade_match() == 10 && prev(game_arcade_match()) == 9) &&
              once(game_arcade_match() == 0 && game_state() == 0x00010001 && game_screen() == 0x03) &&
              never(p1_character_match() != 13 && p1_rounds_won() > prev(p1_rounds_won())) &&
              settings_difficulty() >= 2 && 
              settings_max_rounds_1p_2p() == 17
)

achievement(
    title = "Tenshou Kareiki Jin!!", points = 10, type="progression",
    description = "Finish the entire Arcade mode using only Akuma (default difficulty and rounds)",
    id = 58909, badge = "61473", published = "30/03/2018 01:30:13", modified = "21/01/2020 14:26:56",
    trigger = never(game_state() == 0x00000000) &&
              never(game_state() == 0x00000001) &&
              p1_only() &&
              p1_character_match() == 14 && 
              trigger_when(game_arcade_match() == 10 && prev(game_arcade_match()) == 9) &&
              once(game_arcade_match() == 0 && game_state() == 0x00010001 && game_screen() == 0x03) &&
              never(p1_character_match() != 14 && p1_rounds_won() > prev(p1_rounds_won())) &&
              settings_difficulty() >= 2 && 
              settings_max_rounds_1p_2p() == 17
)

achievement(
    title = "Kung Li", points = 10, type="progression",
    description = "Finish the entire Arcade mode using only Chun Li (default difficulty and rounds)",
    id = 58910, badge = "61474", published = "30/03/2018 01:30:14", modified = "21/01/2020 14:26:57",
    trigger = never(game_state() == 0x00000000) &&
              never(game_state() == 0x00000001) &&
              p1_only() &&
              p1_character_match() == 16 && 
              trigger_when(game_arcade_match() == 10 && prev(game_arcade_match()) == 9) &&
              once(game_arcade_match() == 0 && game_state() == 0x00010001 && game_screen() == 0x03) &&
              never(p1_character_match() != 16 && p1_rounds_won() > prev(p1_rounds_won())) &&
              settings_difficulty() >= 2 && 
              settings_max_rounds_1p_2p() == 17
)

// Rindoukan Tomboy - Logic Backup
// 0xH011384=17_0xH015504=10_0xH015504=1.1._P:0xH011384!=17_0xH06ac02>=2_0xH06ac07>=17_0xH015504=2.1._0xH015504=3.1._0xH015504=4.1._0xH015504=5.1._0xH015504=6.1._0xH015504=7.1._0xH015504=8.1.
achievement(
    title = "Rindoukan Tomboy", points = 10, type="progression",
    description = "Finish the entire Arcade mode using only Makoto (default difficulty and rounds)",
    id = 58943, badge = "61533", published = "31/03/2018 03:15:19", modified = "31/03/2024 16:46:34",
    trigger = never(game_state() == 0x00000000) &&
              never(game_state() == 0x00000001) &&
              p1_only() &&
              p1_character_match() == 17 && 
              trigger_when(game_arcade_match() == 10 && prev(game_arcade_match()) == 9) &&
              once(game_arcade_match() == 0 && game_state() == 0x00010001 && game_screen() == 0x03) &&
              never(p1_character_match() != 17 && p1_rounds_won() > prev(p1_rounds_won())) &&
              settings_difficulty() >= 2 && 
              settings_max_rounds_1p_2p() == 17
)

achievement(
    title = "Mystery Man", points = 10, type="progression",
    description = "Finish the entire Arcade mode using only Q (default difficulty and rounds)",
    id = 58911, badge = "61475", published = "30/03/2018 01:30:22", modified = "21/01/2020 14:26:59",
    trigger = never(game_state() == 0x00000000) &&
              never(game_state() == 0x00000001) &&
              p1_only() &&
              p1_character_match() == 18 && 
              trigger_when(game_arcade_match() == 10 && prev(game_arcade_match()) == 9) &&
              once(game_arcade_match() == 0 && game_state() == 0x00010001 && game_screen() == 0x03) &&
              never(p1_character_match() != 18 && p1_rounds_won() > prev(p1_rounds_won())) &&
              settings_difficulty() >= 2 && 
              settings_max_rounds_1p_2p() == 17
)

achievement(
    title = "10100.10111.00101.01100.10110.00101", points = 10, type="progression",
    description = "Finish the entire Arcade mode using only Twelve (default difficulty and rounds)",
    id = 58912, badge = "61476", published = "30/03/2018 01:30:24", modified = "21/01/2020 14:27:00",
    trigger = never(game_state() == 0x00000000) &&
              never(game_state() == 0x00000001) &&
              p1_only() &&
              p1_character_match() == 19 && 
              trigger_when(game_arcade_match() == 10 && prev(game_arcade_match()) == 9) &&
              once(game_arcade_match() == 0 && game_state() == 0x00010001 && game_screen() == 0x03) &&
              never(p1_character_match() != 19 && p1_rounds_won() > prev(p1_rounds_won())) &&
              settings_difficulty() >= 2 && 
              settings_max_rounds_1p_2p() == 17
)

achievement(
    title = "Edgy Boy", points = 10, type="progression",
    description = "Finish the entire Arcade mode using only Remy (default difficulty and rounds)",
    id = 58913, badge = "61477", published = "30/03/2018 01:30:26", modified = "21/01/2020 14:27:02",
    trigger = never(game_state() == 0x00000000) &&
              never(game_state() == 0x00000001) &&
              p1_only() &&
              p1_character_match() == 20 && 
              trigger_when(game_arcade_match() == 10 && prev(game_arcade_match()) == 9) &&
              once(game_arcade_match() == 0 && game_state() == 0x00010001 && game_screen() == 0x03) &&
              never(p1_character_match() != 20 && p1_rounds_won() > prev(p1_rounds_won())) &&
              settings_difficulty() >= 2 && 
              settings_max_rounds_1p_2p() == 17
)
