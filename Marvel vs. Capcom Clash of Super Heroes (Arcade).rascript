// Marvel vs. Capcom: Clash of Super Heroes
// #ID = 11806

// Settings
function settings_difficulty() => byte(0x00F957)
function settings_timer_speed() => byte(0x00F95C)
function settings_damage_level() => byte(0x00F95F)
function settings_game_speed() => byte(0x00F961)
function settings_mode_select() => byte(0x00F962)

function default_settings() => settings_damage_level() == 1 && settings_difficulty() >= 1 && settings_timer_speed() == 1

// Game
function game_state() => dword(0x004144)
function game_arcade_match() => byte(0x004080)
function game_playing() => bit0(0x004101)
function game_stages() => byte(0x004112)
function game_versus_flag() => bit0(0x00411D)
function game_ending() => byte(0x004123)

function game_screen() => byte(0x0032B1)
function game_character_screen_flag() => byte(0x0032B3)

function round_win_flag_p1_win() => bit0(0x004004)
function round_win_flag_p2_win() => bit1(0x004004)
function round_win_flag() => byte(0x004004)
function round_timer() => byte(0x004009)
function match_round_state() => byte(0x00400E)

function game_overkill_flag() => bit1(0x00401F)
function game_animation_screen_hyper_combo() => word(0x004444)
function game_flashing_hyper_move_bg() => byte(0x004445)

// P1
function p1_assist_character() => byte(0x00309C)
function p1_max_hit_combo() => byte(0x003120)
function p1_hit_combo_low4() => low4(0x003121)
function p1_hit_combo() => byte(0x003121)
function p1_combo_type() => byte(0x003125)
function p1_assist_remaining_uses() => byte(0x0032C7)

function p1_stats_total_damage_dealt() => word(0x003374)
function p1_stats_normal_damage_dealt() => word(0x003376)
function p1_stats_special_move_damage_dealt() => word(0x003378)
function p1_stats_hyper_combo_damage_dealt() => word(0x00337A)

function p1_1st_active_character() => byte(0x0034C4)
function p1_2nd_active_character() => byte(0x003CC4)
function p1_human_controlled() => byte(0x003802)
function p1_1st_character() => byte(0x003052)
function p1_1st_animation() => word(0x003060)
function p1_2nd_character() => byte(0x003852)
function p1_2nd_animation() => word(0x003860)
function p1_1st_crossover_indicator() => byte(0x003268)
function p1_1st_hp() => byte(0x003270)
function p1_1st_gauge_level() => byte(0x003275)

function p1_hyper_combo_flag() => byte(0x004439)

function p1_arcade_super_finishes_counter() => byte(0x004089)
function p1_arcade_first_attack_counter() => byte(0x00408A)
function p1_amount_of_hyper_combos_used() => byte(0x004442)

// P2
function p2_active_character() => byte(0x0038C4)
function p2_human_controlled() => bit0(0x003C02)
function p2_1st_character() => byte(0x003452)
function p2_2nd_character() => byte(0x003C52)
function p2_1st_hp() => byte(0x003670)
function p2_2nd_hp() => byte(0x003E70)

function p2_stats_total_damage_dealt() => word(0x003774)
function p2_stats_normal_damage_dealt() => word(0x003776)
function p2_stats_special_move_damage_dealt() => word(0x003778)
function p2_stats_hyper_combo_damage_dealt() => word(0x00377A)

function p2_hyper_combo_flag() => byte(0x004436)

// =========================================
//             Utility Functions              
// =========================================

function game_beaten() => game_arcade_match() == 8 && round_win_flag_p1_win() > 0 && game_ending() == 255

function p1_team_has_char(char_id) => p1_1st_character() == char_id || p1_2nd_character() == char_id

// =========================================
//                   Arcade              
// =========================================

achievement(
    title = "The Legendary Street Fighter", points = 10, type="progression",
    description = "Finish the game and get Ryu's ending (default settings).",
    id = 120956, badge = "131466", published = "07/08/2020 15:24:01", modified = "05/12/2021 02:23:45",
    trigger = never(p1_2nd_active_character() != 18) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)

achievement(
    title = "An Inspector From Interpol", points = 10, type="progression",
    description = "Finish the game and get Chun-Li's ending (default settings).",
    id = 120957, badge = "131467", published = "07/08/2020 15:24:03", modified = "05/12/2021 02:23:46",
    trigger = never(p1_2nd_active_character() != 22) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)

achievement(
    title = "The Invincible Champion of Russian", points = 10, type="progression",
    description = "Finish the game and get Zangief's ending (default settings).",
    id = 120958, badge = "131468", published = "07/08/2020 15:24:07", modified = "05/12/2021 02:23:46",
    trigger = never(p1_2nd_active_character() != 26) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)

achievement(
    title = "A Seductive Succubus", points = 10, type="progression",
    description = "Finish the game and get Morrigan's ending (default settings).",
    id = 120959, badge = "131469", published = "07/08/2020 15:24:11", modified = "05/12/2021 02:23:46",
    trigger = never(p1_2nd_active_character() != 30) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)

achievement(
    title = "The Greatest Hero of Capcom", points = 10, type="progression",
    description = "Finish the game and get Captain Commando's ending (default settings).",
    id = 120960, badge = "131470", published = "07/08/2020 15:24:13", modified = "05/12/2021 02:23:47",
    trigger = never(p1_2nd_active_character() != 20) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)

achievement(
    title = "A Robot With a Heart of Steel", points = 10, type="progression",
    description = "Finish the game and get Mega Man's ending (default settings).",
    id = 120961, badge = "131471", published = "07/08/2020 15:24:16", modified = "05/12/2021 02:23:47",
    trigger = never(p1_2nd_active_character() != 32) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)

achievement(
    title = "The Striders Are a Modern Day Ninja Force", points = 10, type="progression",
    description = "Finish the game and get Strider's ending (default settings).",
    id = 120962, badge = "132197", published = "07/08/2020 15:24:23", modified = "05/12/2021 02:23:48",
    trigger = never(p1_2nd_active_character() != 28) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)

achievement(
    title = "A Pilot of Variant Armor Blodia", points = 10, type="progression",
    description = "Finish the game and get Jin's ending (default settings).",
    id = 120964, badge = "132196", published = "07/08/2020 15:24:30", modified = "05/12/2021 02:23:48",
    trigger = never(p1_2nd_active_character() != 24) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)

achievement(
    title = "Your Friendly Neighborhood Spider-Man", points = 10, type="progression",
    description = "Finish the game and get Spider-Man's ending (default settings).",
    id = 120963, badge = "131473", published = "07/08/2020 15:24:26", modified = "05/12/2021 02:23:49",
    trigger = never(p1_2nd_active_character() != 14) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)

achievement(
    title = "The Living Legend Struggles for Justice", points = 10, type="progression",
    description = "Finish the game and get Captain America's ending (default settings).",
    id = 120965, badge = "131475", published = "07/08/2020 15:26:00", modified = "05/12/2021 02:23:49",
    trigger = never(p1_2nd_active_character() != 4) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)

achievement(
    title = "Cruel Hunter for Everyone", points = 10, type="progression",
    description = "Finish the game and get Venom's ending (default settings).",
    id = 120966, badge = "131476", published = "07/08/2020 15:26:02", modified = "05/12/2021 02:23:49",
    trigger = never(p1_2nd_active_character() != 12) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)

achievement(
    title = "This Green Goliath Is the Strongest There Is", points = 10, type="progression",
    description = "Finish the game and get Hulk's ending (default settings).",
    id = 120967, badge = "131477", published = "07/08/2020 15:26:05", modified = "05/12/2021 02:23:50",
    trigger = never(p1_2nd_active_character() != 6) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)

achievement(
    title = "Stylish Cajun With a Hideous History", points = 10, type="progression",
    description = "Finish the game and get Gambit's ending (default settings).",
    id = 120968, badge = "131478", published = "07/08/2020 15:26:08", modified = "05/12/2021 02:23:50",
    trigger = never(p1_2nd_active_character() != 10) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)

achievement(
    title = "Tough Soldier in Splendid Armor", points = 10, type="progression",
    description = "Finish the game and get War Machine's ending (default settings).",
    id = 120969, badge = "131479", published = "07/08/2020 15:26:10", modified = "05/12/2021 02:23:51",
    trigger = never(p1_2nd_active_character() != 2) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)

achievement(
    title = "Unbreakable Adamantium", points = 10, type="progression",
    description = "Finish the game and get Wolverine's ending (default settings).",
    id = 120970, badge = "131480", published = "07/08/2020 15:26:13", modified = "05/12/2021 02:23:51",
    trigger = never(p1_2nd_active_character() != 8) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)

achievement(
    title = "Damn Parasite", points = 10,
    description = "Finish the game and get Red Venom's ending (default settings).",
    id = 120971, badge = "131481", published = "07/08/2020 15:26:16", modified = "05/12/2021 02:23:52",
    trigger = never(p1_2nd_active_character() != 36) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)

achievement(
    title = "Raw Power Is My Dilemma", points = 10,
    description = "Finish the game and get Orange Hulk's ending (default settings).",
    id = 120972, badge = "131482", published = "07/08/2020 15:26:19", modified = "05/12/2021 02:23:52",
    trigger = never(p1_2nd_active_character() != 38) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)

achievement(
    title = "Poisonous Kiss", points = 10,
    description = "Finish the game and get Lilith's ending (default settings).",
    id = 120973, badge = "131484", published = "07/08/2020 15:26:22", modified = "05/12/2021 02:23:53",
    trigger = never(p1_2nd_active_character() != 44) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)

achievement(
    title = "100% Armored Armor", points = 10,
    description = "Finish the game and get Gold War Machine's ending (default settings).",
    id = 120974, badge = "131486", published = "07/08/2020 15:26:24", modified = "05/12/2021 02:23:53",
    trigger = never(p1_2nd_active_character() != 40) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)

achievement(
    title = "I Wasn't Created Just to Help", points = 10,
    description = "Finish the game and get Roll's ending (default settings).",
    id = 120975, badge = "131487", published = "07/08/2020 15:26:30", modified = "05/12/2021 02:23:53",
    trigger = never(p1_2nd_active_character() != 16) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)

achievement(
    title = "Obscure or a Machine?", points = 10,
    description = "Finish the game and get Shadow Lady's ending (default settings).",
    id = 120976, badge = "131488", published = "07/08/2020 15:26:33", modified = "05/12/2021 02:23:54",
    trigger = never(p1_2nd_active_character() != 42) && default_settings() &&
              once(game_screen() == 6) && once(low4(0x004112) == 9) && game_arcade_match() == 8 &&
              round_win_flag_p1_win() > 0 && game_ending() == 255 && never(p2_active_character() != 34) &&
              never(game_screen() == 0) && never(game_screen() == 12)
)


// =========================================
//                  Teams              
// =========================================

achievement(
    title = "Symbiote Spider", points = 10,
    description = "Complete the entire Arcade mode using only Spider-Man and Venom (default settings).",
    id = 121012, badge = "131998", published = "07/08/2020 16:37:39", modified = "05/12/2021 02:23:54",
    trigger = never(game_playing() == 0) &&
              game_versus_flag() == 0 && default_settings() &&
              once(game_arcade_match() == 0 && game_state() == 0x00000002) && 
              trigger_when(game_beaten()) &&
              p1_team_has_char(12) &&
              p1_team_has_char(14) &&
              never((p1_1st_character() != 12 && round_win_flag_p1_win() > prev(round_win_flag_p1_win()) &&
                  p1_1st_character() != 14)
              ) &&
              never((p1_2nd_character() != 12 && round_win_flag_p1_win() > prev(round_win_flag_p1_win()) &&
                  p1_2nd_character() != 14)
              )
)

achievement(
    title = "Rock & Roll", points = 10,
    description = "Complete the entire Arcade mode using only Mega Man and Roll (default settings).",
    id = 121013, badge = "131999", published = "07/08/2020 16:37:43", modified = "05/12/2021 02:23:55",
    trigger = never(game_playing() == 0) &&
              game_versus_flag() == 0 && default_settings() &&
              once(game_arcade_match() == 0 && game_state() == 0x00000002) && 
              trigger_when(game_beaten()) &&
              p1_team_has_char(16) &&
              p1_team_has_char(32) &&
              never((p1_1st_character() != 16 && round_win_flag_p1_win() > prev(round_win_flag_p1_win()) &&
                  p1_1st_character() != 32)
              ) &&
              never((p1_2nd_character() != 16 && round_win_flag_p1_win() > prev(round_win_flag_p1_win()) &&
                  p1_2nd_character() != 32)
              )
)

achievement(
    title = "Lust For Life", points = 10,
    description = "Complete the entire Arcade mode using only Lilith and Morrigan (default settings).",
    id = 121014, badge = "132000", published = "07/08/2020 16:37:44", modified = "05/12/2021 02:23:55",
    trigger = never(game_playing() == 0) &&
              game_versus_flag() == 0 && default_settings() &&
              once(game_arcade_match() == 0 && game_state() == 0x00000002) && 
              trigger_when(game_beaten()) &&
              p1_team_has_char(30) &&
              p1_team_has_char(44) &&
              never((p1_1st_character() != 30 && round_win_flag_p1_win() > prev(round_win_flag_p1_win()) &&
                  p1_1st_character() != 44)
              ) &&
              never((p1_2nd_character() != 30 && round_win_flag_p1_win() > prev(round_win_flag_p1_win()) &&
                  p1_2nd_character() != 44)
              )
)

achievement(
    title = "Earth's Mightiest Super Heroes!", points = 10,
    description = "Complete the entire Arcade mode using only Hulk and Captain America (default settings).",
    id = 121015, badge = "132002", published = "07/08/2020 16:37:45", modified = "05/12/2021 02:23:55",
    trigger = never(game_playing() == 0) &&
              game_versus_flag() == 0 && default_settings() &&
              once(game_arcade_match() == 0 && game_state() == 0x00000002) && 
              trigger_when(game_beaten()) &&
              p1_team_has_char(4) &&
              p1_team_has_char(6) &&
              never((p1_1st_character() != 4 && round_win_flag_p1_win() > prev(round_win_flag_p1_win()) && p1_1st_character() != 6)) &&
              never((p1_2nd_character() != 4 && round_win_flag_p1_win() > prev(round_win_flag_p1_win()) && p1_2nd_character() != 6))
)

achievement(
    title = "Mon Ami, Bub", points = 10,
    description = "Complete the entire Arcade mode using only Gambit and Wolverine (default settings).",
    id = 121016, badge = "132004", published = "07/08/2020 16:37:47", modified = "05/12/2021 02:23:56",
    trigger = never(game_playing() == 0) &&
              game_versus_flag() == 0 && default_settings() &&
              once(game_arcade_match() == 0 && game_state() == 0x00000002) && 
              trigger_when(game_beaten()) &&
              p1_team_has_char(8) &&
              p1_team_has_char(10) &&
              never((p1_1st_character() != 8 && round_win_flag_p1_win() > prev(round_win_flag_p1_win()) && p1_1st_character() != 10)) &&
              never((p1_2nd_character() != 8 && round_win_flag_p1_win() > prev(round_win_flag_p1_win()) && p1_2nd_character() != 10))
)

achievement(
    title = "Stark Tech Weaponry", points = 10,
    description = "Complete the entire Arcade mode using only Warmachine and Gold War Machine (default settings).",
    id = 121017, badge = "132005", published = "07/08/2020 16:37:48", modified = "05/12/2021 02:23:56",
    trigger = never(game_playing() == 0) &&
              game_versus_flag() == 0 && default_settings() &&
              once(game_arcade_match() == 0 && game_state() == 0x00000002) && 
              trigger_when(game_beaten()) &&
              p1_team_has_char(2) &&
              p1_team_has_char(40) &&
              never((p1_1st_character() != 2 && round_win_flag_p1_win() > prev(round_win_flag_p1_win()) && p1_1st_character() != 40)) &&
              never((p1_2nd_character() != 2 && round_win_flag_p1_win() > prev(round_win_flag_p1_win()) && p1_2nd_character() != 40))
)

achievement(
    title = "Alternative Marvel", points = 10,
    description = "Complete the entire Arcade mode using only Red Venom and Orange Hulk (default settings).",
    id = 121018, badge = "132008", published = "07/08/2020 16:37:50", modified = "05/12/2021 02:23:56",
    trigger = never(game_playing() == 0) &&
              game_versus_flag() == 0 && default_settings() &&
              once(game_arcade_match() == 0 && game_state() == 0x00000002) && 
              trigger_when(game_beaten()) &&
              p1_team_has_char(36) &&
              p1_team_has_char(38) &&
              never((p1_1st_character() != 36 && round_win_flag_p1_win() > prev(round_win_flag_p1_win()) &&
                  p1_1st_character() != 38)
              ) &&
              never((p1_2nd_character() != 36 && round_win_flag_p1_win() > prev(round_win_flag_p1_win()) &&
                  p1_2nd_character() != 38)
              )
)

achievement(
    title = "Arcade Justice", points = 10,
    description = "Complete the entire Arcade mode using only Captain Commando and Strider Hiryu (default settings).",
    id = 121019, badge = "132006", published = "07/08/2020 16:37:51", modified = "05/12/2021 02:23:57",
    trigger = never(game_playing() == 0) &&
              game_versus_flag() == 0 && default_settings() &&
              once(game_arcade_match() == 0 && game_state() == 0x00000002) && 
              trigger_when(game_beaten()) &&
              p1_team_has_char(20) &&
              p1_team_has_char(28) &&
              never((p1_1st_character() != 20 && round_win_flag_p1_win() > prev(round_win_flag_p1_win()) &&
                  p1_1st_character() != 28)
              ) &&
              never((p1_2nd_character() != 20 && round_win_flag_p1_win() > prev(round_win_flag_p1_win()) &&
                  p1_2nd_character() != 28)
              )
)

achievement(
    title = "Fighting-Powered Mecha", points = 10,
    description = "Complete the entire Arcade mode using only Jin and Shadow Lady (default settings).",
    id = 121020, badge = "132028", published = "07/08/2020 16:38:02", modified = "05/12/2021 02:23:57",
    trigger = never(game_playing() == 0) &&
              game_versus_flag() == 0 && default_settings() &&
              once(game_arcade_match() == 0 && game_state() == 0x00000002) && 
              trigger_when(game_beaten()) &&
              p1_team_has_char(24) &&
              p1_team_has_char(42) &&
              never((p1_1st_character() != 24 && round_win_flag_p1_win() > prev(round_win_flag_p1_win()) &&
                  p1_1st_character() != 42)
              ) &&
              never((p1_2nd_character() != 24 && round_win_flag_p1_win() > prev(round_win_flag_p1_win()) &&
                  p1_2nd_character() != 42)
              )
)

// =========================================
//                  Challenges              
// =========================================

achievement(
    title = "Costumer's Choice", points = 10,
    description = "Finish the game while keeping the same Special Partner over battles.",
    id = 121039, badge = "536936", published = "07/08/2020 16:39:31", modified = "24/10/2024 17:58:53",
    trigger = never(game_playing() == 0) &&
              game_versus_flag() == 0 && never(p1_assist_character() != prev(p1_assist_character())) &&
              once(game_arcade_match() == 0) && 
              trigger_when(game_beaten())
)

achievement(
    title = "Legendary Warriors of Ancient Times", points = 25,
    description = "Finish the game on Expert difficulty with a Capcom character (no hidden character).",
    id = 121000, badge = "132034", published = "07/08/2020 15:38:26", modified = "05/12/2021 02:24:19",
    trigger = never(settings_difficulty() != 7) && once(game_screen() == 6) && once(low4(0x004112) == 9) &&
              game_arcade_match() == 8 && round_win_flag_p1_win() > 0 && game_ending() == 255 && p2_active_character() == 34 &&
              never(game_screen() == 0) && never(game_screen() == 12) && unless(p1_2nd_active_character() == 14) &&
              unless(p1_2nd_active_character() == 4) && unless(p1_2nd_active_character() == 12) &&
              unless(p1_2nd_active_character() == 6) && unless(p1_2nd_active_character() == 10) &&
              unless(p1_2nd_active_character() == 2) && unless(p1_2nd_active_character() == 8) &&
              unless(p1_2nd_active_character() == 36) && unless(p1_2nd_active_character() == 38) &&
              unless(p1_2nd_active_character() == 40) && unless(p1_2nd_active_character() == 42) &&
              unless(p1_2nd_active_character() == 44)
)

achievement(
    title = "Medal of Honor for the Super Hero", points = 25,
    description = "Finish the game on Expert difficulty with a Marvel character (no hidden character).",
    id = 120999, badge = "132033", published = "07/08/2020 15:38:24", modified = "05/12/2021 02:24:20",
    trigger = never(settings_difficulty() != 7) && once(game_screen() == 6) && once(low4(0x004112) == 9) &&
              game_arcade_match() == 8 && round_win_flag_p1_win() > 0 && game_ending() == 255 && p2_active_character() == 34 &&
              never(game_screen() == 0) && never(game_screen() == 12) && unless(p1_2nd_active_character() == 18) &&
              unless(p1_2nd_active_character() == 22) && unless(p1_2nd_active_character() == 26) &&
              unless(p1_2nd_active_character() == 30) && unless(p1_2nd_active_character() == 20) &&
              unless(p1_2nd_active_character() == 32) && unless(p1_2nd_active_character() == 24) &&
              unless(p1_2nd_active_character() == 36) && unless(p1_2nd_active_character() == 38) &&
              unless(p1_2nd_active_character() == 40) && unless(p1_2nd_active_character() == 42) &&
              unless(p1_2nd_active_character() == 44) && unless(p1_2nd_active_character() == 28)
)

achievement(
    title = "Limited to Using the Single Plug", points = 25,
    description = "Finish the game using only one credit (default settings).",
    id = 120998, badge = "132030", published = "07/08/2020 15:38:21", modified = "05/12/2021 02:24:20",
    trigger = never(game_playing() == 0) &&
              default_settings() && 
              once(game_arcade_match() == 0 && game_state() == 0x00000002) && 
              never(round_win_flag_p2_win() > 0) &&
              trigger_when(game_beaten())
)
