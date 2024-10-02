// King of Fighters, The: Evolution
// #ID = 24052

// Settings
function settings_language() => byte(0x45DD78)

function settings_difficulty() => byte(0x45DD79)
function settings_play_time() => byte(0x45DD7A)
function settings_power_gauge() => byte(0x45DD7B)
function settings_striker() => byte(0x45DD7C)
function settings_single_point_1p() => byte(0x45DD7D)

function default_settings() {
    return(
        settings_difficulty() >= 2 &&
        settings_play_time() == 0 &&
        settings_power_gauge() == 0 &&
        settings_striker() == 3 &&
        settings_single_point_1p() == 2
    )
}

function default_settings_level8() {
    return(
        settings_difficulty() == 7 &&
        settings_play_time() == 0 &&
        settings_power_gauge() == 0 &&
        settings_striker() == 3 &&
        settings_single_point_1p() == 2
    )
}

// Game
function game_state() => byte(0x451BE4)
         GS_CHARACTER_SELECT = 0x0c
         
function game_mode() => byte(0x45DC44)
function game_stage() => byte(0x45DC51)
function game_arcade_matches_won() => bitcount(0x45DC58) + bitcount(0x45DC59)
function game_continue_services() => byte(0x45dc50)

function single_all_survival_remaining() => byte(0x45DD44)
function survival_time_attack_timer() => dword(0x45DE2C)
function match_current_round() => byte(0x45DC52)

// P1
function p1_active_state() => byte(0x451BD0)

function p1_char_ptr() => tbyte(0x458D20)
function p1_moves() =>  word(p1_char_ptr() + 0x11C)
function p1_desp_move_flag() =>  bit0(p1_char_ptr() + 0x187)
function p1_striker_flag() =>  bit0(p1_char_ptr() + 0x18a)
function p1_super_cancel_flag() => bit0(p1_char_ptr() + 0x18d) + bit1(p1_char_ptr() + 0x18d)

function p1_current_character() => byte(0x45DE1B)
function p1_rounds_wins() => byte(0x45E3C4)
function p1_hit_combo() => byte(0x45E9D3)

function p1_wins() => byte(0x45DE30)
function p1_battle_points() => dword(0x45DE28)

function p1_slot_1_character() => byte(0x45DC65)
function p1_slot_2_character() => byte(0x45DC66)
function p1_slot_3_character() => byte(0x45DC67)
function p1_slot_4_character() => byte(0x45DC68)


// P2
function p2_active_state() => byte(0x451BD1)

function p2_char_ptr() => tbyte(0x458D3C)
function p2_moves() =>  word(p2_char_ptr() + 0x11C)
function p2_hp() =>  word(p2_char_ptr() + 0x1B2)

function p2_current_character() => byte(0x45DE1C)
function p2_rounds_wins() => byte(0x45E3C0)
function p2_hit_combo() => byte(0x45E9D2)

function p2_slot_1_character() => byte(0x45DC69)
function p2_slot_2_character() => byte(0x45DC6A)
function p2_slot_3_character() => byte(0x45DC6B)
function p2_slot_4_character() => byte(0x45DC6C)


chars = {
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
   "Kyo": 28,
   "Kyo-1": 29,
   "Iori": 30,
   "Krizalid": 32,
   "Kyo-2": 33,

   "Daimon (Justice)": 34,
   "Daimon (Dark)": 35,
   "Billy (Justice)": 36,
   "Billy (Dark)": 37,
   "Yamazaki (Justice)": 38,
   "Yamazaki (Dark)": 39,
   "Kyo SP (Justice)": 40,
   "Kyo SP (Dark)": 41,
   "Chizuru (Justice)": 42,
   "Chizuru (Dark)": 43,
   "Athena SP (Justice)": 44,
   "Athena SP (Dark)": 45,
   "Alfred (Justice)": 46,
   "Alfred (Dark)": 47,
   "Fio (Justice)": 48,
   "Fio (Dark)": 49,
   "Gai (Justice)": 50,
   "Gai (Dark)": 51,
   "Syo (Justice)": 52,
   "Syo (Dark)": 53,
   "Seth": 54,
   "Vanessa": 55,
}

// =========================================
//                  Utility              
// =========================================

function p1_only() => never(p1_active_state() == 0) && never(p2_active_state() > 0)
function in_char_select() => game_state() == GS_CHARACTER_SELECT
function is_fighting() => game_state() >= 0x0f && game_state() <= 0x12
function reset_main_menu() => never(game_state() == 8) 

function mode_team_play() => never(game_mode() != 0)
function mode_single_play() => never(game_mode() != 2)

function game_beaten() {
    return(
        game_arcade_matches_won() >= 7 &&
        game_state() == 0x1a && prev(game_state()) != 0x1a
    )
}

function no_continue_services() => never(game_continue_services() > 0)

function p1_team_has_char(char_id) => p1_slot_1_character() == char_id || p1_slot_2_character() == char_id || p1_slot_3_character() == char_id || p1_slot_4_character() == char_id
function p1_dont_have_char(char_id) => p1_slot_1_character() != char_id && p1_slot_2_character() != char_id && p1_slot_3_character() != char_id && p1_slot_4_character() != char_id

// =========================================
//                Arcade Mode               
// =========================================

function achiev_beat_game_team(title, char1, char2, char3, char4) {
    achievement(title, format("Finish Team Play using only {0}, {1}, {2} and {3} (default settings).", char1, char2, char3, char4), 10,
                trigger = p1_only() &&
                          mode_team_play() &&
                          reset_main_menu() &&
                          once(game_arcade_matches_won() == 1 && game_state() == 0x0e && p1_active_state() > 0) &&
                          never(p1_dont_have_char(chars[char1]) && p1_rounds_wins() > prev(p1_rounds_wins())) &&
                          never(p1_dont_have_char(chars[char2]) && p1_rounds_wins() > prev(p1_rounds_wins())) &&
                          never(p1_dont_have_char(chars[char3]) && p1_rounds_wins() > prev(p1_rounds_wins())) &&
                          never(p1_dont_have_char(chars[char4]) && p1_rounds_wins() > prev(p1_rounds_wins())) &&
                          p1_team_has_char(chars[char1]) &&
                          p1_team_has_char(chars[char2]) &&
                          p1_team_has_char(chars[char3]) &&
                          p1_team_has_char(chars[char4]) &&
                          trigger_when(game_beaten()) &&
                          default_settings()
                )
}

function achiev_beat_game_team_both_strikers(title, char1, char2, char3, char4) {
    achievement(title, format("Finish Team Play using only {0}, {1}, {2} and {3} (default settings).", char1, char2, char3, char4), 10,
                trigger = p1_only() &&
                          mode_team_play() &&
                          reset_main_menu() &&
                          once(game_arcade_matches_won() == 1 && game_state() == 0x0e && p1_active_state() > 0) &&
                          never(p1_dont_have_char(chars[char1]) && p1_rounds_wins() > prev(p1_rounds_wins())) &&
                          never(p1_dont_have_char(chars[char2]) && p1_rounds_wins() > prev(p1_rounds_wins())) &&
                          never(p1_dont_have_char(chars[char3]) && p1_rounds_wins() > prev(p1_rounds_wins())) &&
                          never(p1_dont_have_char(chars[char4]) && p1_dont_have_char(chars[char4] + 1) && p1_rounds_wins() > prev(p1_rounds_wins())) &&
                          p1_team_has_char(chars[char1]) &&
                          p1_team_has_char(chars[char2]) &&
                          p1_team_has_char(chars[char3]) &&
                          (p1_team_has_char(chars[char4]) || p1_team_has_char(chars[char4] + 1)) &&
                          trigger_when(game_beaten()) &&
                          default_settings()
                )
}

achiev_beat_game_team("Hero Team", "K'", "Maxima", "Benimaru", "Shingo")
achiev_beat_game_team("Fatal Fury Team", "Terry", "Andy", "Joe", "Mai")
achiev_beat_game_team("Art of Fighting Team", "Ryo", "Robert", "Yuri", "Takuma")
achiev_beat_game_team("Ikari Warriors Team", "Leona", "Ralf", "Clark", "Whip")
achiev_beat_game_team("Psycho Soldier Team", "Athena", "Kensou", "Chin", "Bao")
achiev_beat_game_team("Women Fighters Team", "King", "Blue Mary", "Kasumi", "Xiangfei")
achiev_beat_game_team("Korea Justice Team", "Kim", "Chang", "Choi", "Jhun")
achiev_beat_game_team_both_strikers("All Kyo Team", "Kyo", "Kyo-1", "Kyo-2", "Kyo SP (Justice)")
achiev_beat_game_team_both_strikers("Japan Team", "Kyo", "Benimaru", "Shingo", "Daimon (Justice)")
achiev_beat_game_team_both_strikers("Sacred Treasures Team", "Kyo", "Iori", "Shingo", "Chizuru (Justice)")
achiev_beat_game_team("NESTS Experiments Team", "Krizalid", "K'", "Kyo-1", "Kyo-2")

achievement("Single Hero", "Finish Single Play (default settings).", 10,
                trigger = p1_only() &&
                          mode_single_play() &&
                          trigger_when(game_beaten()) &&
                          default_settings()
            )

achievement("Dear Falling Angel", "Beat the game on Level-8 difficulty (default settings).", 25,
                trigger = p1_only() &&
                          __ornext(game_mode() == 0 || game_mode() == 2) &&
                          game_beaten() &&
                          default_settings_level8()
            )

achievement("Mechanical Bliss", "Finish Team Play without using continues (default settings).", 25,
                trigger = p1_only() &&
                          mode_team_play() &&
                          reset_main_menu() &&
                          once(game_arcade_matches_won() == 1 && game_state() == 0x0e && p1_active_state() > 0) &&
                          never(p2_rounds_wins() == 3 && prev(p2_rounds_wins()) == 2) &&
                          trigger_when(game_beaten()) &&
                          default_settings()
            )

achievement("Unexpected Appearence", "Defeat Kyo or Iori during Team Play (default settings).", 25,
                trigger = p1_only() &&
                          game_mode() == 0 &&
                          __ornext(p2_current_character() == chars["Kyo"] || p2_current_character() == chars["Iori"])  &&
                          p1_rounds_wins() > prev(p1_rounds_wins()) &&
                          default_settings()
            )

achievement("Shin Kensou", "Get Kensou's special team ending.", 3,
                trigger = p1_only() &&
                          mode_team_play() &&
                          game_arcade_matches_won() >= 7 &&
                          p1_current_character() == chars["Kensou"] &&
                          p1_team_has_char(chars["Athena"]) &&
                          p1_team_has_char(chars["Kensou"]) &&
                          p1_team_has_char(chars["Bao"]) &&
                          p1_team_has_char(chars["Chin"]) &&
                          trigger_when(game_state() == 0x1b) && // team ending
                          default_settings()
            )

achievement("Andy's Promise", "Get Mai's special team ending.", 3,
                trigger = p1_only() &&
                          mode_team_play() &&
                          game_arcade_matches_won() >= 7 &&
                          p1_current_character() == chars["Mai"] &&
                          p1_team_has_char(chars["Terry"]) &&
                          p1_team_has_char(chars["Andy"]) &&
                          p1_team_has_char(chars["Joe"]) &&
                          p1_team_has_char(chars["Mai"]) &&
                          trigger_when(game_state() == 0x1b) && // team ending
                          default_settings()
            )

// =========================================
//               Super Cancels              
// =========================================

function achiev_super_cancel_combo(title, char, points) {
    achievement(title, format("Chain a Special Move into a Desperation Move through Super Cancel as {0} (no strikers).", char), points,
                trigger =   p1_active_state() > 0 &&
                            p1_current_character() == chars[char] &&
                            never(p1_hit_combo() == 0) &&
                            once(p1_hit_combo() > prev(p1_hit_combo()) && p1_super_cancel_flag() != 2) &&
                            __ornext(p2_hp() < prev(p2_hp()) || p1_hit_combo() > prev(p1_hit_combo())) && p1_super_cancel_flag() == 2
                )
}

function achiev_super_cancel_combo_projectile(title, char, move_condition, points) {
    achievement(title, format("Chain a Special Move into a Desperation Move through Super Cancel as {0} (no strikers).", char), points,
                trigger =   p1_active_state() > 0 &&
                            p1_current_character() == chars[char] &&
                            never(p1_hit_combo() == 0) &&
                            p1_super_cancel_flag() == 2 &&
                            prev(p1_hit_combo()) >= 1 &&
                            p1_hit_combo() > prev(p1_hit_combo()) &&
                            move_condition
                )
}


achievement("Gatling Attack II", "Chain a Special Move into a Desperation Move through Super Cancel as Clark (no strikers).", 4,
                trigger =   p1_active_state() > 0 &&
                            p1_current_character() == chars["Clark"] &&
                            never(game_state() == 0x0c) &&
                            never(p1_hit_combo() == 0 && p2_moves() != 0x1A0) &&
                            once(p1_hit_combo() > prev(p1_hit_combo()) && p1_super_cancel_flag() != 2) &&
                            p2_moves() == 0x1A0 && p1_super_cancel_flag() == 2
                )


// achiev_super_cancel_combo("", "K'", 4)
achiev_super_cancel_combo("M-4 Type Vapor Cannon", "Maxima", 4)
achiev_super_cancel_combo("Handou San Dan Geri", "Benimaru", 4)
achiev_super_cancel_combo("114 Shiki: Ara Gami Mikansei", "Shingo", 4)
achiev_super_cancel_combo("Power Wave", "Terry", 4)
achiev_super_cancel_combo("Zan Ei Ken", "Andy", 4)
// achiev_super_cancel_combo("", "Joe", 4)
achiev_super_cancel_combo("Ryuu Enbu", "Mai", 4)
achiev_super_cancel_combo("Kohou", "Ryo", 4)
achiev_super_cancel_combo("Sujin Ranbu Kyaku", "Robert", 4)
achiev_super_cancel_combo("Kuuga", "Yuri", 4)
achiev_super_cancel_combo("Ko-ou Ken", "Takuma", 4)
achiev_super_cancel_combo("Grand Sabre", "Leona", 4)
achiev_super_cancel_combo("Gatling Attack I", "Ralf", 4)
// achiev_super_cancel_combo("Gatling Attack II", "Clark", 4)
achiev_super_cancel_combo("Boomerang Shot Code~SC", "Whip", 4)
achiev_super_cancel_combo("Phoenix Arrow", "Athena", 4)
achiev_super_cancel_combo("Ryuu Gaku Sai", "Kensou", 4)
// achiev_super_cancel_combo("", "Chin", 4)
achiev_super_cancel_combo("Psycho Ball", "Bao", 4)
achiev_super_cancel_combo("Venom Strike", "King", 4)
achiev_super_cancel_combo("Vertical Arrow", "Blue Mary", 4)
achiev_super_cancel_combo("Tatsumaki Souda", "Kasumi", 4)
achiev_super_cancel_combo("Nanpa", "Xiangfei", 4)
achiev_super_cancel_combo("Han Getzu San", "Kim", 4)
// achiev_super_cancel_combo("", "Chang", 4)
achiev_super_cancel_combo("Tatsumaki Shippuu Zan", "Choi", 4)
achiev_super_cancel_combo("Hangetsu Zan", "Jhun", 4)
achiev_super_cancel_combo("427 Shiki: Hikigane", "Kyo", 4)
achiev_super_cancel_combo_projectile("108 Shiki: Yami Barai I", "Kyo-1", p1_moves() >= 0xa5 && p1_moves() <= 0xa6, 4)
achiev_super_cancel_combo_projectile("108 Shiki: Yami Barai II", "Iori", __ornext(p1_moves() == 0xa2 || ((p1_moves() >= 0xcd && p1_moves() <= 0xce))), 4)
achiev_super_cancel_combo("Rising Dark Moon", "Krizalid", 4)
achiev_super_cancel_combo("212 Shiki: Kototsuki Yo", "Kyo-2", 4)