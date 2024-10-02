// King of Fighters, The: NeoWave
// #ID = 23749

// Settings
function settings_difficulty() => byte(0x521630)
function settings_play_time() => byte(0x521631)
function settings_single_point() => byte(0x521632)
function settings_defense_level_1p() => byte(0x521633)
function settings_defense_level_2p() => byte(0x521634)
function settings_power_gauge_1p() => byte(0x521635)
function settings_power_gauge_2p() => byte(0x521636)

function default_settings() {
    return (
        settings_difficulty() >= 3 &&
        settings_power_gauge_1p() == 0 &&
        settings_power_gauge_2p() == 0 &&
        settings_single_point() == 1 &&
        settings_play_time() == 0x01
    )
}

function default_settings_any_diff() {
    return (
        settings_power_gauge_1p() == 0 &&
        settings_power_gauge_2p() == 0 &&
        settings_single_point() == 1 &&
        settings_play_time() == 0x01
    )
}

function default_settings_lv8() {
    return (
        settings_difficulty() == 7 &&
        settings_power_gauge_1p() == 0 &&
        settings_power_gauge_2p() == 0 &&
        settings_single_point() == 1 &&
        settings_play_time() == 0x01
    )
}

// Game
function game_mode() => dword(0x512230)
         MODE_SINGLE_PLAY = 0x00
         MODE_TEAM_PLAY = 0x01
         MODE_SINGLE_VS = 0x02
         MODE_TEAM_VS = 0x03
         MODE_PRACTICE = 0x06
         MODE_ENDLESS = 0x08

function game_context() => byte(0x512338)
function game_state() => byte(0x51e71a)
function game_state_big() => dword(0x51e718)
function game_players_active() => byte(0x5122E0)
function p1_is_active() => bit0(0x5122E0)
function game_bgm() => dword(0x402E54)

function game_continue_service() => byte(0x50DD80)
function game_max2_bg_flag() => byte(0x50DD98)
function arcade_team_defeated() => bitcount(0x512330)
function match_timer() => byte(0x512288)
function match_timer_frames() => byte(0x512280)
function match_round() => byte(0x5122e8)

function endless_wins() => byte(0x50EA51)

// P1
function p1_character_1() => byte(0x512204)
function p1_character_2() => byte(0x512205)
function p1_character_3() => byte(0x512206)
function p1_orochi_flags_slot_1() => bit0(0x512202)
function p1_orochi_flags_slot_2() => bit1(0x512202)
function p1_orochi_flags_slot_3() => bit2(0x512202)
function p1_rounds_won() => byte(0x5121D3)
function p1_mode() => byte(0x5135F0)

function p1_current_character() => word(0x51E358)
function p1_is_orochi() => bit4(0x51e404)
function p1_hp() => word(0x51E420)
function p1_gauge_level() => byte(0x51E4CB)
function p1_hit_combo() => byte(0x51E6B0)
function p1_heat_mode() => byte(0x533792)
function p1_score() => dword_be(0x51E3E4)

function p1_last_move_hit() => word(0x50DD88)
function p1_moves() => word(0x51E35A)
function p1_special_move() => bit3(0x51e3ca)
function p1_desperation_move() => bit0(0x51E3CB)
function p1_max_dm() => bit0(0x51E3CD)
// function p1_super_cancel() => bit1(0x51E405) fake
function p1_cancel_type() => byte(0x51E40E)
function p1_canceled_move() => bit3(0x51E3C8)

function p1_actions1() => byte(0x51E3C9)
function p1_actions2() => byte(0x51E3CA)
function p1_block_stun_distance() => byte(0x51E33F)
function p1_push_distance_flags() => byte(0x51E414)


// P2
function p2_character_1() => byte(0x5121D4)
function p2_character_2() => byte(0x5121D5)
function p2_character_3() => byte(0x5121D6)
function p2_rounds_won() => byte(0x512203)

function p2_hp() => word(0x51E638)
function p2_current_character() => word(0x51E570)
function p2_moves() => word(0x51E572)
function p2_last_move_hit() => word(0x50DD8C)
function p2_hitstun() => bit2(0x51E5E3)

chars = {
   "Kyo": 0,
   "Benimaru": 1,
   "Daimon": 2,
   "Terry": 3,
   "Andy": 4,
   "Joe": 5,
   "Kim": 6,
   "Chang": 7,
   "Choi": 8,
   "Athena": 9,
   "Kensou": 10,
   "Chin": 11,
   "Leona": 12,
   "Ralf": 13,
   "Clark": 14,
   "Ryo": 15,
   "Robert": 16,
   "Takuma": 17,
   "Mai": 18,
   "Yuri": 19,
   "May Lee": 20,
   "Iori": 21,
   "Mature": 22,
   "Vice": 23,
   "Yamazaki": 24,
   "Blue Mary": 25,
   "Billy": 26,
   "Yashiro": 27,
   "Shermie": 28,
   "Chris": 29,
   "K'": 30,
   "Maxima": 31,
   "Whip": 32,
   "Vanessa": 33,
   "Seth": 34,
   "Ramon": 35,
   "Kula": 36,
   "K9999": 37,
   "Angel": 38,
   "Rugal": 39,
   "Kusanagi": 40,
   "Shingo": 46,
   "King": 47,
   "Jhun": 48,
   "Saisyu": 49,
   "Geese": 50
}

// =========================================
//                  Utility              
// =========================================

function p1_only() => game_players_active() == 1
function in_char_select() => __ornext(game_bgm() == 0x5a07 || game_bgm() == 0x606b)
function in_game_beaten_bgm() => __ornext(game_bgm() == 0x171b || game_bgm() == 0x1f5d)
function reset_main_menu() => never(game_state_big() == 0x3ea0d0)
function in_main_menu() => game_state_big() == 0x3ea0d0

function game_beaten_team_play() {
    return(
        arcade_team_defeated() == 5 &&
        p1_rounds_won() == 1 &&
        prev(p1_rounds_won()) == 0
    )
}

function game_beaten_single_play() { 
    return(
        arcade_team_defeated() == 5 &&
        p1_rounds_won() == 2 &&
        prev(p1_rounds_won()) == 1
    )
}

function no_continue_services() => never(game_continue_service() > 0)

function p1_team_has_char(char_id) => p1_character_1() == char_id || p1_character_2() == char_id || p1_character_3() == char_id
function p1_dont_have_char(char_id) => p1_character_1() != char_id && p1_character_2() != char_id && p1_character_3() != char_id

// =========================================
//                Arcade Mode               
// =========================================

function achiev_beat_game_team(title, char1, char2, char3) {
    achievement(title, format("Finish Team Play using only {0}, {1} and {2} in any difficulty (default settings).", char1, char2, char3), 10,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(arcade_team_defeated() == 0 && in_char_select()) &&
                          never(p1_dont_have_char(chars[char1]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_dont_have_char(chars[char2]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_dont_have_char(chars[char3]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          p1_team_has_char(chars[char1]) &&
                          p1_team_has_char(chars[char2]) &&
                          p1_team_has_char(chars[char3]) &&
                          never(p1_orochi_flags_slot_1() == 1) &&
                          never(p1_orochi_flags_slot_2() == 1) &&
                          never(p1_orochi_flags_slot_3() == 1) &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings_any_diff()
                )
}

achiev_beat_game_team("Japan Team", "Kyo", "Benimaru", "Daimon")
achiev_beat_game_team("Fatal Fury Team", "Terry", "Andy", "Joe")
achiev_beat_game_team("Art of Fighting Team", "Ryo", "Robert", "Takuma")
achiev_beat_game_team("Ikari Warriors Team", "Leona", "Ralf", "Clark")
achiev_beat_game_team("Psycho Soldiers Team", "Athena", "Kensou", "Chin")
achiev_beat_game_team("Women Fighters Team", "King", "Mai", "Yuri")
achiev_beat_game_team("Korea Justice Team", "Jhun", "Chang", "Choi")
achiev_beat_game_team("Yagami Team", "Iori", "Mature", "Vice")
achiev_beat_game_team("Outlaw Team", "Yamazaki", "Blue Mary", "Billy")
achiev_beat_game_team("'97 New Faces Team", "Yashiro", "Shermie", "Chris")
achiev_beat_game_team("K' Team", "K'", "Maxima", "Whip")
achiev_beat_game_team("Dream Team", "Saisyu", "Kula", "Shingo")
achiev_beat_game_team("Agents Team", "Vanessa", "Seth", "Ramon")
achiev_beat_game_team("Taekwondo Team", "Kim", "Jhun", "May Lee")
achiev_beat_game_team("Flirtatious Team", "Angel", "Shermie", "Mai")
achiev_beat_game_team("NeoWave Boss Team", "Geese", "Rugal", "Kusanagi")

achievement("Orochi Team", "Finish Team Play using only Orochi Yashiro, Orochi Shermie and Orochi Chris in any difficulty (default settings).", 10,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(arcade_team_defeated() == 0 && in_char_select()) &&
                          never(p1_dont_have_char(chars["Yashiro"]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_dont_have_char(chars["Shermie"]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_dont_have_char(chars["Chris"]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          p1_team_has_char(chars["Yashiro"]) &&
                          p1_team_has_char(chars["Shermie"]) &&
                          p1_team_has_char(chars["Chris"]) &&
                          never(p1_orochi_flags_slot_1() == 0 && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_orochi_flags_slot_2() == 0 && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_orochi_flags_slot_3() == 0 && p1_rounds_won() > prev(p1_rounds_won())) &&
                          p1_orochi_flags_slot_1() == 1 &&
                          p1_orochi_flags_slot_2() == 1 &&
                          p1_orochi_flags_slot_3() == 1 &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings_any_diff()
                )

achievement("Cool Killers", "Finish Team Play without using a continue (default settings).", 25,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(arcade_team_defeated() == 0 && in_char_select()) &&
                          never(p2_rounds_won() == 3) &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings()
            )

achievement("The Sun God", "Finish Team Play without using continue services on Level-8 difficulty (default settings).", 25,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(arcade_team_defeated() == 0 && in_char_select()) &&
                          no_continue_services() &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings_lv8()
            )

achievement("Techno Runner", "Finish Single Play within 12 minutes (default settings)", 25,
                trigger = p1_only() &&
                          game_mode() == MODE_SINGLE_PLAY &&
                          reset_main_menu() &&
                          once(arcade_team_defeated() == 0 && in_char_select()) &&
                          never(tally(43200, once(match_timer_frames() < prev(match_timer_frames()) && arcade_team_defeated() == 0 && match_round() == 0) && always_true())) &&
                          trigger_when(game_beaten_single_play()) &&
                          default_settings()
            )

achievement("SC Mode", "Finish Team Play using only Super Cancel mode in any difficulty (default settings).", 5,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(match_timer_frames() < prev(match_timer_frames()) && arcade_team_defeated() == 0 && match_round() == 0 && match_timer() == 0x60) &&
                          p1_mode() == 0x00 &&
                          never(p1_mode() != 0x00 && game_state_big() == 0x3484a0) &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings_any_diff()
            )

achievement("GB Mode", "Finish Team Play using only the Guard Break mode in any difficulty (default settings).", 5,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(match_timer_frames() < prev(match_timer_frames()) && arcade_team_defeated() == 0 && match_round() == 0 && match_timer() == 0x60) &&
                          p1_mode() == 0x01 &&
                          never(p1_mode() != 0x01 && game_state_big() == 0x3484a0) &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings_any_diff()
            )

achievement("MAX2 Mode", "Finish Team Play using only the MAX2 mode in any difficulty (default settings).", 5,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(match_timer_frames() < prev(match_timer_frames()) && arcade_team_defeated() == 0 && match_round() == 0 && match_timer() == 0x60) &&
                          p1_mode() == 0x02 &&
                          never(p1_mode() != 0x02 && game_state_big() == 0x3484a0) &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings_any_diff()
            )


// =========================================
//                Super Cancel              
// =========================================

function achiev_any_sc_combo(title, char, points) {
    achievement(title, format("{0}: Perform a Super Cancel during a combo.", char), points,
                trigger =   p1_is_active() == 1 &&
                            p1_current_character() == chars[char] &&
                            p1_is_orochi() == 0 &&
                            never(p1_hit_combo() == 0) &&
                            once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0 && p1_canceled_move() == 0) &&
                            p1_hit_combo() > prev(p1_hit_combo()) && prev(p1_canceled_move()) == 1 && prev(p1_desperation_move()) == 1 && prev(p1_cancel_type()) == 0x02
                )
}

function achiev_double_sc(title, char, points) {
    achievement(title, format("{0}: Perform two Super Cancels during a combo.", char), points,
                trigger =   p1_is_active() == 1 &&
                            p1_current_character() == chars[char] &&
                            p1_is_orochi() == 0 &&
                            never(p1_hit_combo() == 0) &&
                            once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                            repeated(2, p1_cancel_type() == 0x02 && p1_canceled_move() > prev(p1_canceled_move()) && p1_desperation_move() == 1) // not really checking whether it hits or not
                )
}

function achiev_sc_only(title, char, points) {
    achievement(title, format("{0}: Perform a Super Cancel.", char), points,
                trigger =   p1_is_active() == 1 &&
                            p1_current_character() == chars[char] &&
                            p1_is_orochi() == 0 &&
                            p1_cancel_type() == 0x02 && p1_canceled_move() == 1 && p1_desperation_move() > prev(p1_desperation_move())
                )
}

function achiev_double_sc_ryo(title, char, points) { // ryo exception
    achievement(title, format("{0}: Perform two Super Cancels during a combo.", char), points,
                trigger =   p1_is_active() == 1 &&
                            p1_current_character() == chars[char] &&
                            p1_is_orochi() == 0 &&
                            p1_cancel_type() == 0x02 && p1_canceled_move() == 1 && p1_desperation_move() == 1
                )
}

function achiev_special_into_sc(title, char, points) {
    achievement(title, format("{0}: Perform a Special Move Cancel and a Super Cancel during a combo.", char), points,
                trigger =   p1_is_active() == 1 &&
                            p1_current_character() == chars[char] &&
                            p1_is_orochi() == 0 &&
                            never(p1_hit_combo() == 0) &&
                            once(p1_hit_combo() > prev(p1_hit_combo()) && prev(p1_canceled_move()) == 1 && prev(p1_special_move()) == 1 && prev(p1_desperation_move()) == 0 && prev(p1_cancel_type()) == 0x02) &&
                            once(p1_hit_combo() > prev(p1_hit_combo()) && prev(p1_canceled_move()) == 1 && prev(p1_special_move()) == 1 && prev(p1_desperation_move()) == 1 && prev(p1_cancel_type()) == 0x02)
                )
}

// orochi exception
function achiev_sc_only_orochi(title, char, points) {
    achievement(title, format("Orochi {0}: Perform a Super Cancel.", char), points,
                trigger =   p1_is_active() == 1 &&
                            p1_current_character() == chars[char] &&
                            p1_is_orochi() == 1 &&
                            p1_cancel_type() == 0x02 && p1_canceled_move() > prev(p1_canceled_move()) && p1_desperation_move() == 1
                )
}


function achiev_special_into_sc_orochi(title, char, points) {
    achievement(title, format("Orochi {0}: Perform a Special Move Cancel and a Super Combo Cancel during a combo.", char), points,
                trigger =   p1_is_active() == 1 &&
                            p1_current_character() == chars[char] &&
                            p1_is_orochi() == 1 &&
                            never(p1_hit_combo() == 0) &&
                            once(p1_hit_combo() > prev(p1_hit_combo()) && prev(p1_canceled_move()) == 1 && prev(p1_special_move()) == 1 && prev(p1_desperation_move()) == 0 && prev(p1_cancel_type()) == 0x02) &&
                            once(p1_hit_combo() > prev(p1_hit_combo()) && prev(p1_canceled_move()) == 1 && prev(p1_special_move()) == 1 && prev(p1_desperation_move()) == 1 && prev(p1_cancel_type()) == 0x02)
                )
}

achiev_any_sc_combo("100 Demon Burner", "Kusanagi", 3)
achiev_any_sc_combo("Crow Bite", "K'", 3)
achiev_any_sc_combo("Death Row", "Mature", 3)
achiev_any_sc_combo("Double Bomber", "Maxima", 3)
achiev_any_sc_combo("Drag Up", "Ramon", 3)
achiev_any_sc_combo("Emperor Kick", "Chang", 3)
achiev_any_sc_combo("Genoside Cutter", "Rugal", 3)
achiev_any_sc_combo("Girding Buster", "Leona", 3)
achiev_any_sc_combo("Punishment", "Yamazaki", 3)
achiev_any_sc_combo("Ray Spin", "Kula", 3)
achiev_any_sc_combo("Rising Sun", "Seth", 3)
achiev_any_sc_combo("Rolling Thrust", "Chin", 3)
achiev_any_sc_combo("Sad Monkey Slash", "Choi", 3)
achiev_any_sc_combo("Shooting Dancer", "Chris", 3)
achiev_any_sc_combo("Sky Fang", "Yuri", 3)
achiev_any_sc_combo("Straight Slicer", "Blue Mary", 3)
achiev_any_sc_combo("String Shot", "Whip", 3)
achiev_double_sc("Back Fang Dragon", "Robert", 3)
achiev_double_sc("High Angle Geyser", "Terry", 3)
achiev_sc_only_orochi("Dancing Earth", "Yashiro", 3)
achiev_any_sc_combo("Dragon Tiger Dance", "Ryo", 3)
achiev_sc_only("Diamond Bust", "Shermie", 3)
achiev_sc_only("Earth Shaker", "Daimon", 3)
achiev_sc_only("Outrage", "Vice", 3)
achiev_sc_only("Shining Wizard", "Clark", 3)
achiev_special_into_sc("105 Poison Bite", "Kyo", 5)
achiev_special_into_sc("212 Crescent Moon Crunch", "Iori", 5)
achiev_special_into_sc("437 God Sigh", "Saisyu", 5)
achiev_special_into_sc("Deadly Ninja Bees", "Mai", 5)
achiev_special_into_sc("Full Moon Slice", "Jhun", 5)
achiev_special_into_sc("Full Swing Chop", "May Lee", 5)
achiev_special_into_sc("Gale Pole", "Billy", 5)
achiev_special_into_sc("Gattling Attack", "Ralf", 5)
achiev_special_into_sc("Half Moon Slice", "Kim", 5)
achiev_special_into_sc("Imperfect 114 Manic Masticator", "Shingo", 5)
achiev_special_into_sc("Jet Counter", "Yashiro", 5)
achiev_special_into_sc_orochi("Lion Fire", "Chris", 5)
achiev_special_into_sc("Machine Gun Puncher", "Vanessa", 5)
achiev_special_into_sc("Phoenix Arrow", "Athena", 5)
achiev_special_into_sc("Sky Breaking Bullet", "Andy", 5)
achiev_special_into_sc("Super Bullet", "Kensou", 5)
achiev_special_into_sc("Violent Finish", "Joe", 5)
achiev_special_into_sc("Whip Kick", "Benimaru", 5)

// =========================================
//               Leaderboards              
// =========================================

leaderboard("Team Play - Highest Score", "Default settings.",
           start = p1_only() && game_mode() == MODE_TEAM_PLAY && game_beaten_team_play() && default_settings(),
           cancel = in_main_menu() || game_players_active() >= 2,
           submit = always_true(),
           value = bcd(p1_score()),
           format = "VALUE", lower_is_better=false
           )

leaderboard("Single Play - Highest Score", "Default settings.",
           start = p1_only() && game_mode() == MODE_SINGLE_PLAY && game_beaten_single_play() && default_settings(),
           cancel = in_main_menu() || game_players_active() >= 2,
           submit = always_true(),
           value = bcd(p1_score()),
           format = "VALUE", lower_is_better=false
           )

leaderboard("Team Play - Best Time", "Default settings.",
           start = p1_only() && game_mode() == MODE_TEAM_PLAY && match_timer_frames() < prev(match_timer_frames()) && arcade_team_defeated() == 0 && match_round() == 0 && default_settings(),
           cancel = in_main_menu() || game_players_active() >= 2,
           submit = game_beaten_team_play(),
           value = always_true(),
           format = "FRAMES", lower_is_better=true
           )

leaderboard("Single Play - Best Time", "Default settings.",
           start = p1_only() && game_mode() == MODE_SINGLE_PLAY && match_timer_frames() < prev(match_timer_frames()) && arcade_team_defeated() == 0 && match_round() == 0 && default_settings(),
           cancel = in_main_menu() || game_players_active() >= 2,
           submit = game_beaten_single_play(),
           value = always_true(),
           format = "FRAMES", lower_is_better=true
           )