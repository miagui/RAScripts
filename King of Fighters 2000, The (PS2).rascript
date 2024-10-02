// King of Fighters 2000, The
// #ID = 21018

function settings_difficulty() => byte(0xE8437F)
function settings_round_time() => byte(0xE84380)
function settings_1p_power_gauge() => byte(0xE84383)
function settings_2p_power_gauge() => byte(0xE84384)
function settings_1p_strikers() => byte(0xE84388)
function settings_2p_strikers() => byte(0xE84389)


function default_settings() {
    return(
        settings_difficulty() >= 2 &&
        settings_round_time() == 2 &&
        settings_1p_power_gauge() == 0x00 &&
        settings_2p_power_gauge() == 0x00 &&
        settings_1p_strikers() == 3 &&
        settings_2p_strikers() == 3
    )
}

function default_settings_lv8() {
    return(
        settings_difficulty() == 7 &&
        settings_round_time() == 2 &&
        settings_1p_power_gauge() == 0x00 &&
        settings_2p_power_gauge() == 0x00 &&
        settings_1p_strikers() == 3 &&
        settings_2p_strikers() == 3
    )
}


function game_context() => byte(0xE86EC0)
function game_state() => byte(0xe849b2)
         GS_CHAR_SELECT = 0x17
         GS_FIGHTING = 0x19

function game_mode() => byte(0xE86F27)
         GM_SINGLE_PLAY = 0x00
         GM_TEAM_PLAY = 0x01
         GM_SINGLE_VS = 0x02
         GM_TEAM_VS = 0x03
         GM_PRACTICE = 0x06

function game_continue_services() => byte(0xE83177)

function save_game_timer() => dword(0x5C35D4)

function game_arcade_matches_won() => bitcount(0xE86EC8) + bitcount(0xE86EC9)
function match_is_fighting() => bit0(0xE86EB6)
function match_current_round() => byte(0xE86EE8)
function match_timer() => byte(0xE86F18)

function p1_active_state() => byte(0x5CEA24)
function p2_active_state() => byte(0x5CEA25)

// P1
function p1_character_1() => byte(0xE86F2C)
function p1_character_2() => byte(0xE86F2D)
function p1_character_3() => byte(0xE86F2E)
function p1_character_4() => byte(0xE86F2F)

function p1_order_1() => byte(0xE86F34)
function p1_order_2() => byte(0xE86F35)
function p1_order_3() => byte(0xE86F36)

function p1_hp() => word(0xE844E8)
function p1_current_character() => byte(0xe84426)
function p1_hit_combo() => byte(0xe84960)
function p1_strikers() => byte(0xE84693)
function p1_current_striker() => byte(0x168105E)
function p1_striker_version() => byte(0x1681060)
function p1_ability_points() => word(0xE84280)
function p1_rounds_won() => byte(0xE86F40)

function p1_mode() => byte(0xe8469f)
function p1_move() => word(0xE84422)
function p1_state1() => byte(0xE84491)
function p1_state2() => byte(0xE84492)
function p1_desperation_move() => bit0(0xE84493)
function p1_max_dm() => bit0(0xE84495)
function p1_striker_active() => bit0(0xE84496)
function p1_power_gauge() => word(0xE84498)
function p1_super_cancel_flag() => bit0(0xE844CD) + bit1(0xE844CD)

// P2
function p2_character_1() => byte(0xE86F41)
function p2_character_2() => byte(0xE86F42)
function p2_character_3() => byte(0xE86F43)
function p2_character_4() => byte(0xE86F44)

function p2_hp() => word(0xe847e8)
function p2_rounds_won() => byte(0x00e86f2b)

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
   "Hinako": 23,
   "Kim": 24,
   "Chang": 25,
   "Choi": 26,
   "Jhun": 27,
   "Kyo": 28,
   "Ramon": 29,
   "Iori": 30,
   "Vanessa": 31,
   "Lin": 32,
   "Seth": 33,
   "Kula": 34,
   "Clone Zero": 35
}

// =========================================
//                  Utility              
// =========================================

function p1_only() => never(p1_active_state() == 0) && never(p2_active_state() > 0)
function in_char_select() => game_state() == GS_CHAR_SELECT
function is_fighting() => game_state() == GS_FIGHTING
function reset_main_menu() => never(game_context() == 1)

function game_beaten_team_play() {
    return(
        game_arcade_matches_won() == 6 &&
        p1_rounds_won() == 3 &&
        prev(p1_rounds_won()) != 3
    )
}

function no_continue_services() => never(game_continue_services() > 0)

function p1_team_has_char(char_id) => p1_character_1() == char_id || p1_character_2() == char_id || p1_character_3() == char_id || p1_character_4() == char_id
function p1_dont_have_char(char_id) => p1_character_1() != char_id && p1_character_2() != char_id && p1_character_3() != char_id && p1_character_4() != char_id


// =========================================
//                Arcade Mode               
// =========================================

function achiev_beat_game_team(title, char1, char2, char3, char4) {
    achievement(title, format("Finish Team Play using only {0}, {1}, {2} and {3} (default settings).", char1, char2, char3, char4), 10, type="progression",
                trigger = p1_only() &&
                          game_mode() == GM_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(game_arcade_matches_won() == 0 && in_char_select() && p1_active_state() > 0) &&
                          never(p1_dont_have_char(chars[char1]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_dont_have_char(chars[char2]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_dont_have_char(chars[char3]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_dont_have_char(chars[char4]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          p1_team_has_char(chars[char1]) &&
                          p1_team_has_char(chars[char2]) &&
                          p1_team_has_char(chars[char3]) &&
                          p1_team_has_char(chars[char4]) &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings()
                )
}

achiev_beat_game_team("KD-0084", "K'", "Maxima", "Ramon", "Vanessa")
achiev_beat_game_team("Inner Shade", "Benimaru", "Shingo", "Lin", "Seth")
achiev_beat_game_team("Terry 115", "Terry", "Andy", "Joe", "Blue Mary")
achiev_beat_game_team("Beauty and the Beast", "Ryo", "Robert", "King", "Takuma")
achiev_beat_game_team("The Trooper", "Leona", "Ralf", "Clark", "Whip")
achiev_beat_game_team("Will", "Athena", "Kensou", "Chin", "Bao")
achiev_beat_game_team("Come Up Smiling", "Mai", "Yuri", "Kasumi", "Hinako")
achiev_beat_game_team("Wild Party", "Kim", "Chang", "Choi", "Jhun")
achiev_beat_game_team("The Band of Fighters", "Kyo", "Iori", "Athena", "Terry")
achiev_beat_game_team("Pretty Girls Fighters", "Kula", "Athena", "Yuri", "Hinako")


achievement("Dream Eater", "Finish Team Play without using continue services on Level-8 difficulty (default settings).", 25,
                trigger = p1_only() &&
                          game_mode() == GM_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(game_arcade_matches_won() == 0 && in_char_select() && p1_active_state() > 0) &&
                          no_continue_services() &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings_lv8()
            )

achievement("Slasher Zero", "Finish Team Play without using a continue (default settings).", 10,
                trigger = p1_only() &&
                          game_mode() == GM_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(game_arcade_matches_won() == 0 && in_char_select() && p1_active_state() > 0) &&
                          never(p2_rounds_won() == 3 && prev(p2_rounds_won()) == 2 && is_fighting()) &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings()
            )


// =========================================
//               Super Cancels              
// =========================================

function achiev_super_cancel_combo(title, char, points) {
    achievement(title, format("Chain a Special Move into a Desperation Move through Super Cancel as {0} (no strikers).", char), points,
                trigger =   p1_active_state() > 0 &&
                            p1_current_character() == chars[char] &&
                            p1_mode() == 1 &&
                            never(p1_hit_combo() == 0) &&
                            never(p1_striker_active() == 1) &&
                            once(p1_hit_combo() > prev(p1_hit_combo()) && p1_super_cancel_flag() != 2) &&
                            trigger_when(p1_hit_combo() > prev(p1_hit_combo()) && p1_super_cancel_flag() == 2)
                )
}

achievement("Diamond Breath", "Chain a Special Move into a Desperation Move through Super Cancel as Kula (no strikers).", 3,
                trigger =   p1_active_state() > 0 &&
                            p1_current_character() == chars["Kula"] &&
                            p1_mode() == 1 &&
                            never(p1_hit_combo() == 0) &&
                            never(p1_striker_active() == 1) &&
                            p1_hit_combo() > prev(p1_hit_combo()) && p1_super_cancel_flag() == 2
                )

achievement("Gatling Attack II", "Chain a Special Move into a Desperation Move through Super Cancel as Clark (no strikers).", 5,
                trigger =   p1_active_state() > 0 &&
                            p1_current_character() == chars["Clark"] &&
                            p1_mode() == 1 &&
                            never(p1_striker_active() == 1) &&
                            p2_hp() < prev(p2_hp()) && p1_super_cancel_flag() == 2
                )

achievement("Straight Slicer", "Chain a Special Move into a Desperation Move through Super Cancel as Blue Mary (no strikers).", 3,
                trigger =   p1_active_state() > 0 &&
                            p1_current_character() == chars["Blue Mary"] &&
                            p1_mode() == 1 &&
                            never(p1_striker_active() == 1) &&
                            (
                                (p2_hp() < prev(p2_hp()) && p1_super_cancel_flag() == 2 && p1_move() == 0xb1) ||
                                (
                                    disable_when(p1_hit_combo() == 0, until=p1_hit_combo() > prev(p1_hit_combo()) && p1_super_cancel_flag() != 2) &&
                                    p1_hit_combo() > prev(p1_hit_combo()) && p1_super_cancel_flag() == 2
                                )
                            )
                            
                )

achiev_super_cancel_combo("Second Shoot", "K'", 3)
achiev_super_cancel_combo("M4 Vapor Cannon", "Maxima", 3)
achiev_super_cancel_combo("Raijin Ken", "Benimaru", 3)
achiev_super_cancel_combo("Kototsuki Mikansei 212", "Shingo", 3)
achiev_super_cancel_combo("Power Wave", "Terry", 3)
achiev_super_cancel_combo("Geki Hisho Ken", "Andy", 3)
achiev_super_cancel_combo("Hurricane Upper", "Joe", 3)
achiev_super_cancel_combo("Ryu Enbu", "Mai", 3)
achiev_super_cancel_combo("Kohou", "Ryo", 3)
achiev_super_cancel_combo("Sen'en Renbu Kyaku", "Robert", 3)
achiev_super_cancel_combo("Kuga-Yuri Cho Upper", "Yuri", 3)
achiev_super_cancel_combo("Ko'oh Ken", "Takuma", 5)
achiev_super_cancel_combo("Ground Saber", "Leona", 3)
achiev_super_cancel_combo("Gatling Attack I", "Ralf", 3)
// achiev_super_cancel_combo("Gatling Attack II", "Clark", 5)
achiev_super_cancel_combo("Boomerang Shot \"CODE: SC\"", "Whip", 3)
achiev_super_cancel_combo("Phoenix Arrow", "Athena", 3)
achiev_super_cancel_combo("Ryu Gakusai", "Kensou", 3)
achiev_super_cancel_combo("Hyotan Geki", "Chin", 3)
achiev_super_cancel_combo("Frontal Psycho Ball Attack", "Bao", 3)
achiev_super_cancel_combo("Venom Strike", "King", 3)
// achiev_super_cancel_combo("Straight Slicer", "Blue Mary", 3)
achiev_super_cancel_combo("Hakusantou", "Kasumi", 3)
achiev_super_cancel_combo("Tsuki Otoshi", "Hinako", 5)
achiev_super_cancel_combo("Hangetsu Zan", "Kim", 3)
// achiev_super_cancel_combo("", "Chang", 3)
achiev_super_cancel_combo("Tatsumaki Shoppuu Zan", "Choi", 3)
achiev_super_cancel_combo("Mangetsu Zan", "Jhun", 3)
achiev_super_cancel_combo("427 Shiki Hikigane", "Kyo", 3)
// achiev_super_cancel_combo("", "Ramon", 3)
achiev_super_cancel_combo("108 Shiki: Yami Barai", "Iori", 3)
// achiev_super_cancel_combo("", "Vanessa", 3)
achiev_super_cancel_combo("Kasumi", "Lin", 3)
achiev_super_cancel_combo("Sho-Yoh", "Seth", 3)
// achiev_super_cancel_combo("Diamond Breath", "Kula", 3)
achiev_super_cancel_combo("Zanpuu Enpa: Satsuma", "Clone Zero", 3)