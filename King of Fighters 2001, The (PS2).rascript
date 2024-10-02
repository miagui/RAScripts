// King of Fighters 2001, The
// #ID = 21019


// Settings
function settings_difficulty() => byte(0x1047BDE)
function settings_power_gauge_1p() => byte(0x1047BE2)
function settings_power_gauge_2p() => byte(0x1047BE3)
function settings_single_point() => byte(0x1047BE6)

function default_settings() {
    return (
        settings_difficulty() >= 2 &&
        settings_power_gauge_1p() == 0 &&
        settings_power_gauge_2p() == 0 &&
        settings_single_point() == 1
    )
}

function default_settings_lv8() {
    return (
        settings_difficulty() == 7 &&
        settings_power_gauge_1p() == 0 &&
        settings_power_gauge_2p() == 0 &&
        settings_single_point() == 1
    )
}

// Game
function game_state_bigger_part() => dword(0x1050040)
function game_state() => byte(0x1050042)
function game_state_previous() => byte(0x1050078)
         GS_CHAR_SELECT = 0x19
         GS_CHAR_SELECT_2 = 0x1a
         GS_FIGHTING = 0x1b
         GS_CONTINUE = 0x20
         
function game_context() => byte(0x10522D0)
function game_mode() => byte(0x1052321)
         MODE_SINGLE_PLAY = 0x00
         MODE_TEAM_PLAY = 0x01
         MODE_SINGLE_VS = 0x02
         MODE_TEAM_VS = 0x03
         MODE_PRACTICE = 0x06
         MODE_PARTY = 0x08

function game_stage() => byte(0x10522DA)
function save_game_time() => dword(0x1047BC8)

function arcade_match() => bitcount(0x10522D6)
function match_current_round() => byte(0x10522E2)
function party_mode_wins() => byte(0x558930)

// Players
function p1_active_state() => byte(0x5E4AFD)
function p2_active_state() => byte(0x5E4AFE)

function p1_current_character() => byte(0x0104fcb0)
function p2_current_character() => byte(0x0104feb0)

// P1
function p1_character_1() => byte(0x1052326)
function p1_character_2() => byte(0x1052327)
function p1_character_3() => byte(0x1052328)
function p1_character_4() => byte(0x1052329)
function p1_strikers() => byte(0x1052337)
function p1_character_1_color() => byte(0x105232A)
function p1_character_2_color() => byte(0x105232B)
function p1_character_3_color() => byte(0x105232C)
function p1_character_4_color() => byte(0x105232D)
function p1_character_1_fighter_ff_flag() => byte(0x105232E)
function p1_character_2_fighter_ff_flag() => byte(0x105232F)
function p1_character_3_fighter_ff_flag() => byte(0x1052330)
function p1_character_4_fighter_ff_flag() => byte(0x1052331)
function p1_character_1_striker_ff_flag() => byte(0x1052338)
function p1_character_2_striker_ff_flag() => byte(0x1052339)
function p1_character_3_striker_ff_flag() => byte(0x105233A)
function p1_character_4_striker_ff_flag() => byte(0x105233B)

function p1_wins() => byte(0x10522DB)
function p1_rounds_won() => byte(0x105234B)
function p1_continue_services() => byte(0x10563B6)

function p1_hit_combo() => byte(0x104FFF0)
function p1_last_hit_damage_dealt() => word(0x1050018)
function p1_move() => word(0x104FCB2)
function p1_move_secondary() => word(0x104FD08)
function p1_1st_striker_active() => bit4(0x0104fd5c)
function p1_2nd_striker_active() => bit5(0x0104fd5c)
function p1_3rd_striker_active() => bit6(0x0104fd5c)
function p1_special_move() => bit3(0x104fd22) 
function p1_desperation_move() => bit0(0x104FD23)
function p1_max_dm() => bit0(0x104FD25)
function p1_throw() => bit6(0x0104fd22)
function p1_score() => dword(0x104FD3C)
function p1_super_cancel_flag() => bit0(0x104FD5D) + bit1(0x104FD5D)
function p1_hp() => word(0x104FD78)

// P2
function p2_character_1() => byte(0x105234C)
function p2_character_2() => byte(0x105234D)
function p2_character_3() => byte(0x105234E)
function p2_character_4() => byte(0x105234F)

function p2_move() => word(0x104FEB2)
function p2_hp() => word(0x104FF78)

chars = {
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
   "Glugan": 50,
   "Ron": 51,
   "Krizalid": 52,
}


// =========================================
//                  Utility              
// =========================================

function p1_only() => never(p1_active_state() == 0) && never(p2_active_state() > 0)
function in_char_select() => game_state() == GS_CHAR_SELECT
function is_fighting() => game_state() == GS_FIGHTING
function reset_main_menu() => never(game_context() == 1)
function reset_striker_used() => never(p1_1st_striker_active() == 1) && never(p1_2nd_striker_active() == 1) && never(p1_3rd_striker_active() == 1)

function game_beaten_team_play() {
    return(
        arcade_match() == 7 &&
        p1_rounds_won() == 1 &&
        prev(p1_rounds_won()) == 0
    )
}

function no_continue_services() => never(p1_continue_services() > 0)

function p1_team_has_char(char_id) => p1_character_1() == char_id || p1_character_2() == char_id || p1_character_3() == char_id || p1_character_4() == char_id
function p1_dont_have_char(char_id) => p1_character_1() != char_id && p1_character_2() != char_id && p1_character_3() != char_id && p1_character_4() != char_id



// =========================================
//                Arcade Mode               
// =========================================


function achiev_beat_game_team(title, char1, char2, char3, char4) {
    achievement(title, format("Finish Team Play using only {0}, {1}, {2} and {3} (default settings).", char1, char2, char3, char4), 10,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(arcade_match() == 0 && in_char_select() && p1_active_state() > 0) &&
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

achiev_beat_game_team("Big Pain", "K'", "Maxima", "Whip", "Lin")
achiev_beat_game_team("Flame of Invincibility", "Kyo", "Benimaru", "Daimon", "Shingo")
achiev_beat_game_team("The Immortal Mirror of The Sun", "Iori", "Vanessa", "Seth", "Ramon")
achiev_beat_game_team("All OK!", "Terry", "Andy", "Joe", "Blue Mary")
achiev_beat_game_team("Fight to the Limit", "Ryo", "Robert", "Yuri", "Takuma")
achiev_beat_game_team("My Whip", "Leona", "Ralf", "Clark", "Heidern")
achiev_beat_game_team("Psychic Guys", "Athena", "Kensou", "Chin", "Bao")
achiev_beat_game_team("The Queen of Fighters", "King", "Mai", "Hinako", "Xiangfei")
achiev_beat_game_team("Nerichagi", "Kim", "Chang", "Choi", "May Lee")
achiev_beat_game_team("Ruler of the Dark", "Kula", "Foxy", "K9999", "Angel")

achievement("A Beast of Prey", "Finish Team Play using only K', Kula and others (default settings).", 10,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(arcade_match() == 0 && in_char_select() && p1_active_state() > 0) &&
                          never(p1_dont_have_char(chars["K'"]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_dont_have_char(chars["Kula"]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          p1_team_has_char(chars["K'"]) &&
                          p1_team_has_char(chars["Kula"]) &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings()
                )

achievement("NESTS Executive", "Finish Team Play using only Zero (default settings).", 10,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(arcade_match() == 0 && in_char_select() && p1_active_state() > 0) &&
                          never(p1_dont_have_char(chars["Zero"]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          p1_team_has_char(chars["Zero"]) &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings()
                )

achievement("NESTS Traitor", "Finish Team Play using only Igniz (default settings).", 5,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(arcade_match() == 0 && in_char_select() && p1_active_state() > 0) &&
                          never(p1_dont_have_char(chars["Igniz"]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          p1_team_has_char(chars["Igniz"]) &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings()
                )

achievement("I Am The Mightiest", "Finish Team Play without using continue services on Level-8 difficulty (default settings).", 25,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(arcade_match() == 0 && in_char_select() && p1_active_state() > 0) &&
                          no_continue_services() &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings_lv8()
            )

achievement("Collapse of NESTS", "Finish Team Play without using a continue (default settings, no Igniz or Zero).", 50,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          never(p1_current_character() == chars["Igniz"]) &&
                          never(p1_current_character() == chars["Zero"]) &&
                          once(arcade_match() == 0 && in_char_select() && p1_active_state() > 0) &&
                          never(p1_active_state() == 2) &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings()
            )


achievement("No Strikers Needed", "Finish Team Play using only a team of 4 fighters (default settings).", 25,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(arcade_match() == 0 && is_fighting() && p1_active_state() > 0) &&
                          never(p1_strikers() != 0 && is_fighting()) &&
                          p1_strikers() == 0 &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings()
                )

achievement("00 Mode", "Finish Team Play using only a team of 3 fighters and 1 striker (default settings).", 5,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(arcade_match() == 0 && is_fighting() && p1_active_state() > 0) &&
                          never(p1_strikers() != 1 && is_fighting()) &&
                          p1_strikers() == 1 &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings()
                )

achievement("Perfectly Balanced", "Finish Team Play using only a team of 2 fighters and 2 strikers (default settings).", 10,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(arcade_match() == 0 && is_fighting() && p1_active_state() > 0) &&
                          never(p1_strikers() != 2 && is_fighting()) &&
                          p1_strikers() == 2 &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings()
                )

achievement("Am I Alone Here?", "Finish Team Play using only a team of 1 fighter and 3 strikers (default settings).", 10,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(arcade_match() == 0 && is_fighting() && p1_active_state() > 0) &&
                          never(p1_strikers() != 3 && is_fighting()) &&
                          p1_strikers() == 3 &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings()
                )

achievement("Lone Fighter of 2001", "Finish Single Play (default settings).", 10,
                trigger = p1_only() &&
                          game_context() == 2 &&
                          game_mode() == MODE_SINGLE_PLAY &&
                          trigger_when(arcade_match() == 7 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1) &&
                          default_settings()
                )


// =========================================
//                   Combos              
// =========================================

function achiev_super_cancel_combo(title, char, hit_combo, points) {
    achievement(title, format("Perform a {0}-hit combo with Super Cancel as {1} (no Max DM or strikers).", hit_combo, char), points,
                trigger =   p1_active_state() > 0 &&
                            p1_current_character() == chars[char] &&
                            never(p1_hit_combo() == 0) &&
                            once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                            reset_striker_used() &&
                            never(p1_max_dm() == 1) &&
                            p1_hit_combo() > prev(p1_hit_combo()) && bcd(p1_hit_combo()) >= hit_combo && p1_super_cancel_flag() == 2
                
                )
}


achievement("Bulldog Press", "Perform a combo with Super Cancel as Maxima.", 5,
                trigger =   p1_active_state() > 0 &&
                            p1_current_character() == chars["Maxima"] &&
                            p1_hit_combo() > prev(p1_hit_combo()) && p1_super_cancel_flag() == 2 
                
                )

// maybe remove this
// achievement("Tatsumaki Shippuu Zan", "Perform a 30-hit combo with Super Cancel into Max DM as Choi (no strikers).", 5,
//                 trigger =   p1_active_state() > 0 &&
//                             p1_current_character() == chars["Choi"] &&
//                             never(p1_hit_combo() == 0) &&
//                             once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
//                             reset_striker_used() &&
//                             p1_hit_combo() > prev(p1_hit_combo()) && bcd(p1_hit_combo()) >= 0x30 && p1_super_cancel_flag() == 2
                
//                 )

achievement("127 Shiki: Aoi Hana", "Perform a 12-hit combo with Super Cancel as Iori (no Max DM or strikers).", 5,
                trigger =   p1_active_state() > 0 &&
                            p1_current_character() == chars["Iori"] &&
                            never(p1_hit_combo() == 0) &&
                            once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                            reset_striker_used() &&
                            never(p1_max_dm() == 1) &&
                            p1_hit_combo() > prev(p1_hit_combo()) && p1_hit_combo() >= 0x12 && __ornext(p1_super_cancel_flag() == 2 || bit7(0x0104fd0e) == 1)
                
                )

achievement("Psycho Ball Crash: Air Bound", "Perform a 3-hit combo with Super Cancel as Bao (no Max DM or strikers).", 5,
                trigger =   p1_active_state() > 0 &&
                            p1_current_character() == chars["Bao"] &&
                            never(p1_hit_combo() == 0) &&
                            once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                            once(p1_hit_combo() > prev(p1_hit_combo()) && p1_special_move() == 1 && p1_desperation_move() == 0) &&
                            reset_striker_used() &&
                            never(p1_max_dm() == 1) &&
                            p1_hit_combo() > prev(p1_hit_combo()) && p1_hit_combo() >= 0x03 && __ornext(p1_super_cancel_flag() == 2 || p1_desperation_move() == 1)
                
                )

achievement("Chain Blade Trans-Axial Slice", "Perform a 99-hit combo with Super Cancel as Igniz (no strikers).", 5,
                trigger =   p1_active_state() > 0 &&
                            p1_current_character() == chars["Igniz"] &&
                            never(p1_hit_combo() == 0) &&
                            once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                            reset_striker_used() &&
                            p1_hit_combo() >= 0x99 && p1_super_cancel_flag() == 2
                
                )

achiev_super_cancel_combo("Crow Bite", "K'", 17, 5)
// achiev_super_cancel_combo("Bulldog Press", "Maxima", 4, 5) 
achiev_super_cancel_combo("Boomerang Shot \"Code: SC\"", "Whip", 21, 5)
achiev_super_cancel_combo("Tetsuzan-bu: Nagi", "Lin", 16, 5)
achiev_super_cancel_combo("427 Shiki: Hikigane", "Kyo", 6, 5)
achiev_super_cancel_combo("Shinkuu Katategoma", "Benimaru", 10, 5)
// achiev_super_cancel_combo("", "Daimon", , 5)
achiev_super_cancel_combo("212 Shiki: Kototsuki Mikansei", "Shingo", 11, 5)
// achiev_super_cancel_combo("127 Shiki: Aoi Hana", "Iori", 12, 5)  
achiev_super_cancel_combo("Parrying Puncher", "Vanessa", 17, 5)
achiev_super_cancel_combo("Sho-Yoh", "Seth", 10, 5)
achiev_super_cancel_combo("Rolling Sobat", "Ramon", 14, 5)
achiev_super_cancel_combo("Ground Saber", "Leona", 1, 5)
achiev_super_cancel_combo("Gatling Attack", "Ralf", 18, 5)
// achiev_super_cancel_combo("", "Clark", , 5)
achiev_super_cancel_combo("Moon Slasher", "Heidern", 5, 5)
achiev_super_cancel_combo("Round Wave", "Terry", 5, 3)
achiev_super_cancel_combo("Shimo Agito", "Andy", 7, 5)
achiev_super_cancel_combo("Tiger Kick", "Joe", 10, 5)
achiev_super_cancel_combo("Straight Slicer", "Blue Mary", 12, 5)
achiev_super_cancel_combo("Kohou", "Ryo", 17, 5)
achiev_super_cancel_combo("Ryuuga ", "Robert", 17, 5)
achiev_super_cancel_combo("Kuuga ", "Yuri", 15, 5)
// achiev_super_cancel_combo("", "Takuma", 5)
achiev_super_cancel_combo("Mirage Kick", "King", 20, 5)
achiev_super_cancel_combo("Ryuu Enbu", "Mai", 8, 4)
achiev_super_cancel_combo("Kaburi Yori", "Hinako", 16, 5)
achiev_super_cancel_combo("Tenpou Zan", "Xiangfei", 5, 5)
achiev_super_cancel_combo("Crow Bites", "Kula", 5, 5)
achiev_super_cancel_combo("Platinum", "Foxy", 16, 5)
achiev_super_cancel_combo("Get In There!", "K9999", 4, 10)
// achiev_super_cancel_combo("", "Angel", , 5)
achiev_super_cancel_combo("Phoenix Arrow", "Athena", 6, 5)
achiev_super_cancel_combo("Ryuu Gakusai", "Kensou", 12, 5)
achiev_super_cancel_combo("Ryuurin Hourai", "Chin", 3, 5)
// achiev_super_cancel_combo("Psycho Ball Crash: Air Bound", "Bao", 3, 5)
achiev_super_cancel_combo("Haki Kyaku", "Kim", 17, 5)
// achiev_super_cancel_combo("", "Chang", , 5)
// achiev_super_cancel_combo("Tatsumaki Shippuu Zan", "Choi", 30, 5)
achiev_super_cancel_combo("May Lee Chop!", "May Lee", 16, 5)
// achiev_super_cancel_combo("", "Zero", , 5)
// achiev_super_cancel_combo("Chain Blade Trans-Axial Slice", "Igniz", 99, 5)



// =========================================
//                Leaderboards              
// =========================================