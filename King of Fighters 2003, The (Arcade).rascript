// King of Fighters 2003, The
// #ID = 11754

// Settings

function settings_difficulty_aes() => byte(0x00785D)
function settings_power_gauge_1p() => byte(0x785f)
function settings_time() => byte(0x785c)

function soft_dip_setup_level_difficulty() => byte(0x00FD8C)
function soft_dip_setup_time() => byte(0x00FD8B)
function soft_dip_setup_continue_service() => byte(0x00FD8E)
function soft_dip_setup_versus_limit() => byte(0x00FD8F)

// Game
function mvs_mode_flag() => bit7(0x00FD83)
function is_aes() => mvs_mode_flag() == 0
function is_mvs() => mvs_mode_flag() == 1

function game_mode() => byte(0x007861)
         MODE_SINGLE_ARCADE = 0x00
         MODE_TEAM_ARCADE = 0x01
         MODE_SINGLE_VERSUS = 0x02
         MODE_TEAM_VERSUS = 0x03
         MODE_SINGLE_PRACTICE = 0x04
         MODE_TEAM_PRACTICE = 0x05

function game_continue_service() => byte(0x007CB4)
function game_arcade_match() => byte(0x007D64)
function game_bgm() => byte(0x008D34)
         BGM_CHAR_SELECT = 0x36
         BGM_FIGHT_INTRO = 0x37 
         BGM_FIGHT_INTRO_ADEL = 0x30
         BGM_FIGHT_INTRO_MUKAI = 0x3d
         BGM_FIGHT_ENDED = 0x4B
         BGM_POST_FIGHT_DIALOGUE = 0x38
         BGM_ENDING_MUKAI = 0x3E
         BGM_ENDING_ADEL = 0x41

function game_score_bcd_xxxx_0000() => word(0x007808)
function game_score_bcd_0000_xxxx() => word(0x00780A)

function round_timer_milliseconds() => byte(0x007D62)
function round_timer_seconds() => byte(0x007D63)

function p2_active_state() => byte(0x00FDB6)
function p1_active_state() => byte(0x00FDB7)
function players_active_combo() => word(0x00FDB6)

// OLD
// function p1_character_slot_1() => byte(0x007D0D)
// function p1_character_slot_2() => byte(0x007D0C)
// function p1_character_slot_3() => byte(0x007D0F)
// function p2_character_slot_1() => byte(0x007D0E)
// function p2_character_slot_2() => byte(0x007D11)
// function p2_character_slot_3() => byte(0x007D10)

function p1_character_slot_1() {
    return(
        bit0(0x007D0D) * 1 + 
        bit1(0x007D0D) * 2 + 
        bit2(0x007D0D) * 4 +
        bit3(0x007D0D) * 8 +
        bit4(0x007D0D) * 16 +
        bit5(0x007D0D) * 32
    )
}

function p1_character_slot_2() {
    return(
        bit0(0x007D0C) * 1 + 
        bit1(0x007D0C) * 2 + 
        bit2(0x007D0C) * 4 +
        bit3(0x007D0C) * 8 +
        bit4(0x007D0C) * 16 +
        bit5(0x007D0C) * 32
    )
}

function p1_character_slot_3() {
    return(
        bit0(0x007D0F) * 1 + 
        bit1(0x007D0F) * 2 + 
        bit2(0x007D0F) * 4 +
        bit3(0x007D0F) * 8 +
        bit4(0x007D0F) * 16 +
        bit5(0x007D0F) * 32
    )
}

function p2_character_slot_1() {
    return(
        bit0(0x007D0E) * 1 + 
        bit1(0x007D0E) * 2 + 
        bit2(0x007D0E) * 4 +
        bit3(0x007D0E) * 8 +
        bit4(0x007D0E) * 16 +
        bit5(0x007D0E) * 32
    )
}

function p2_character_slot_2() {
    return(
        bit0(0x007D11) * 1 + 
        bit1(0x007D11) * 2 + 
        bit2(0x007D11) * 4 +
        bit3(0x007D11) * 8 +
        bit4(0x007D11) * 16 +
        bit5(0x007D11) * 32
    )
}

function p2_character_slot_3() {
    return(
        bit0(0x007D10) * 1 + 
        bit1(0x007D10) * 2 + 
        bit2(0x007D10) * 4 +
        bit3(0x007D10) * 8 +
        bit4(0x007D10) * 16 +
        bit5(0x007D10) * 32
    )
}





function p1_current_character_slot() => byte(0x007D1B)
function p1_current_leader_slot() => byte(0x007D19)

function p1_order_select_slot_1() => byte(0x007D13)
function p1_order_select_slot_2() => byte(0x007D12)
function p1_order_select_slot_3() => byte(0x007D15)

function p1_order_select_slot_1() {
    return(
        bit0(0x007D13) * 1 + 
        bit1(0x007D13) * 2 + 
        bit2(0x007D13) * 4 +
        bit3(0x007D13) * 8 +
        bit4(0x007D13) * 16 +
        bit5(0x007D13) * 32
    )
}

function p1_order_select_slot_2() {
    return(
        bit0(0x007D12) * 1 + 
        bit1(0x007D12) * 2 + 
        bit2(0x007D12) * 4 +
        bit3(0x007D12) * 8 +
        bit4(0x007D12) * 16 +
        bit5(0x007D12) * 32
    )
}

function p1_order_select_slot_3() {
    return(
        bit0(0x007D15) * 1 + 
        bit1(0x007D15) * 2 + 
        bit2(0x007D15) * 4 +
        bit3(0x007D15) * 8 +
        bit4(0x007D15) * 16 +
        bit5(0x007D15) * 32
    )
}

function p2_current_character_slot() => byte(0x007D1A)

// P1 Char 1
function p1_current_move() => word(word(0x7d1e) + 0x48)
function p1_move_type() => byte(word(0x7d1e) + 0xd7)
function p1_special() => bit5(word(0x7d1e) + 0xd7)
function p1_shift() => bit6(word(0x7d1e) + 0xd7)
function p1_leader_dm() => bit7(word(0x7d1e) + 0xd7)
function p1_target_damaged() => bit3(word(0x7d1e) + 0xd8)
function p1_target_grabbed() => bit7(word(0x7d1e) + 0xd8)
function p1_target_state() => byte(word(0x7d1e) + 0xd8)

// P2
function p2_player_hit() => bit0(word(0x7d3e) + 0xda)
function p2_player_hit_2() => bit3(word(0x7d3e) + 0xd9)

characters = {
   "Ash": 0,
   "Duo Lon": 1,
   "Shen Woo": 2,
   "Terry": 3,
   "Joe": 4,
   "Tizoc": 5,
   "Ryo": 6,
   "Robert": 7,
   "Yuri": 8,
   "Kim": 9,
   "Chang": 10,
   "Jhun": 11,
   "Leona": 12,
   "Ralf": 13,
   "Clark": 14,
   "Gato": 15,
   "Billy": 16,
   "Yamazaki": 17,
   "King": 18,
   "Mai": 19,
   "Blue Mary": 20,
   "Benimaru": 21,
   "Shingo": 22,
   "Daimon": 23,
   "Athena": 24,
   "Hinako": 25,
   "Malin": 26,
   "K'": 27,
   "Maxima": 28,
   "Whip": 29,
   "Kyo": 30,
   "Iori": 31,
   "Chizuru": 32,
   "Kusanagi": 33,
   "Adel": 34, 
   "Mukai": 35,
   "Maki": 36
}

// =========================================
//                  Utility              
// =========================================

function default_settings_level3() {
    return (
                settings_power_gauge_1p() == 0 &&
                settings_time() == 2 &&
                (
                    settings_difficulty_aes() >= 2 && is_aes() || 
                    soft_dip_setup_level_difficulty() >= 2 && is_mvs()
                )
    )
}

function default_settings_level8() {
    return (
                settings_power_gauge_1p() == 0 &&
                settings_time() == 2 &&
                (
                    settings_difficulty_aes() == 7 && is_aes() || 
                    soft_dip_setup_level_difficulty() == 7 && is_mvs()
                )
    )
}


function is_arcade() => game_mode() <= MODE_TEAM_ARCADE
function p1_only() => p1_active_state() >= 1 && p2_active_state() == 0

function p1_team_has_char(char_id) => p1_character_slot_1() == char_id || p1_character_slot_2() == char_id || p1_character_slot_3() == char_id
function p1_dont_have_char(char_id) => p1_character_slot_1() != char_id && p1_character_slot_2() != char_id && p1_character_slot_3() != char_id


function mukai_ending() => game_bgm() == BGM_ENDING_MUKAI && prev(game_bgm()) != BGM_ENDING_MUKAI && __ornext(game_arcade_match() == 9 || game_arcade_match() == 10)
function adel_ending() => game_bgm() == BGM_ENDING_ADEL && prev(game_bgm()) != BGM_ENDING_ADEL && game_arcade_match() == 0x0b

// =========================================
//               Beat the game             
// =========================================

function beat_game_team_progression(title, char1, char2, char3) {
    achievement(title, format("Beat the game by defeating Mukai using only {0}, {1} and {2} (default settings).", char1, char2, char3), 10, type="win_condition",
                trigger =   is_arcade() &&
                            p1_only() &&
                            once(game_arcade_match() == 0 && game_bgm() == BGM_CHAR_SELECT && p1_active_state() > 0) &&
                            never(p2_character_slot_1() == characters["Adel"]) && // reset if find Adel to remove the challenge indicator
                            never(p1_dont_have_char(characters[char1]) && game_bgm() == BGM_FIGHT_INTRO) &&
                            never(p1_dont_have_char(characters[char2]) && game_bgm() == BGM_FIGHT_INTRO) &&
                            never(p1_dont_have_char(characters[char3]) && game_bgm() == BGM_FIGHT_INTRO) &&
                            p1_team_has_char(characters[char1]) &&
                            p1_team_has_char(characters[char2]) &&
                            p1_team_has_char(characters[char3]) &&
                            default_settings_level3() &&
                            trigger_when(mukai_ending())
                
                )
}

function beat_game_team(title, char1, char2, char3) {
    achievement(title, format("Beat the game by defeating Mukai using only {0}, {1} and {2} (default settings).", char1, char2, char3), 10, type="win_condition",
                trigger =   is_arcade() &&
                            p1_only() &&
                            once(game_arcade_match() == 0 && game_bgm() == BGM_CHAR_SELECT && p1_active_state() > 0) &&
                            never(p2_character_slot_1() == characters["Adel"]) && // reset if find Adel to remove the challenge indicator
                            never(p1_dont_have_char(characters[char1]) && game_bgm() == BGM_FIGHT_INTRO) &&
                            never(p1_dont_have_char(characters[char2]) && game_bgm() == BGM_FIGHT_INTRO) &&
                            never(p1_dont_have_char(characters[char3]) && game_bgm() == BGM_FIGHT_INTRO) &&
                            p1_team_has_char(characters[char1]) &&
                            p1_team_has_char(characters[char2]) &&
                            p1_team_has_char(characters[char3]) &&
                            default_settings_level3() &&
                            trigger_when(mukai_ending())
                
                )
}

beat_game_team_progression("Hero Team", "Ash", "Duo Lon", "Shen Woo")
beat_game_team_progression("Fatal Fury Team", "Terry", "Joe", "Tizoc")
beat_game_team_progression("Art of Fighting Team", "Ryo", "Robert", "Yuri")
beat_game_team_progression("Ikari Warriors Team", "Leona", "Ralf", "Clark")
beat_game_team_progression("Women Fighters Team", "King", "Mai", "Blue Mary")
beat_game_team_progression("Korea Justice Team", "Kim", "Chang", "Jhun")
beat_game_team_progression("Outlaw Team", "Yamazaki", "Billy", "Gato")
beat_game_team_progression("Japan Team", "Benimaru", "Daimon", "Shingo")
beat_game_team_progression("High School Girls Team", "Athena", "Hinako", "Malin")
beat_game_team_progression("K' Team", "K'", "Maxima", "Whip")
beat_game_team_progression("Three Sacred Treasures Team", "Kyo", "Iori", "Chizuru")
beat_game_team("Original Japan Team", "Kyo", "Benimaru", "Daimon")
beat_game_team("KOF '94 Women Fighters Team", "King", "Mai", "Yuri")
beat_game_team("Pyrokinesis Team", "Kyo", "K'", "Kusanagi")
beat_game_team("The Giants Team", "Tizoc", "Maxima", "Chang")
beat_game_team("Heavy Lifting Team", "Hinako", "Clark", "Daimon")

achievement("Unbounded", "Beat the game on Single Play (default settings).", 10,
                trigger =   game_mode() == MODE_SINGLE_ARCADE &&
                            p1_only() &&
                            default_settings_level3() &&
                            (mukai_ending() || adel_ending())
            )
            
achievement("Melody of Sorrow", "Defeat Adelheid Bernstein and beat the game on Team Play (default settings).", 10, type="win_condition",
                trigger =   game_mode() == MODE_TEAM_ARCADE &&
                            p1_only() &&
                            default_settings_level3() &&
                            adel_ending()
            )
            
achievement("Son of Evil", "Defeat Adel Bernstein without using continue services on the hardest difficulty (default settings).", 25,
                trigger =   is_arcade() &&
                            p1_only() &&
                            default_settings_level8() &&
                            once(game_bgm() == BGM_FIGHT_INTRO_ADEL) &&
                            never(game_bgm() == BGM_CHAR_SELECT) &&
                            never(game_continue_service() != 0) &&
                            trigger_when(adel_ending())
            )

achievement("Those from the Past", "Defeat Mukai without using continue services on the hardest difficulty (default settings).", 25,
                trigger =   is_arcade() &&
                            p1_only() &&
                            default_settings_level8() &&
                            once(game_bgm() == BGM_FIGHT_INTRO_MUKAI) &&
                            never(game_bgm() == BGM_CHAR_SELECT) &&
                            never(game_continue_service() != 0) &&
                            trigger_when(mukai_ending())
            )

achievement("Tales of Ash I", "Beat the game without using a continue (default settings).", 10,
                trigger =   is_arcade() &&
                            p1_only() &&
                            once(game_arcade_match() == 0 && game_bgm() == BGM_CHAR_SELECT && p1_active_state() > 0) &&
                            never(p1_active_state() == 2) &&
                            default_settings_level3() &&
                            trigger_when(mukai_ending() || adel_ending())
            )


// =========================================
//                Leader Super              
// =========================================

function hit_leader_dm(char, title) {
    achievement(title, format("Hit your opponent with Leader Super Desperation Move as {0} on Arcade Mode.", char), 5,
                trigger =   is_arcade() &&
                            p1_only() &&
                            p1_leader_dm() == 1 && __ornext(p1_target_damaged() == 1 || p1_target_grabbed() == 1 || (p2_player_hit() == 1 && p2_player_hit_2() == 1)) &&
                            (
                                (p1_current_character_slot() == 0 && p1_order_select_slot_1() == characters[char]) ||
                                (p1_current_character_slot() == 1 && p1_order_select_slot_2() == characters[char]) ||
                                (p1_current_character_slot() == 2 && p1_order_select_slot_3() == characters[char])
                            )
                
                )
}

hit_leader_dm("Ash", "Sans-Culottes")
hit_leader_dm("Duo Lon", "Ougi • Tajuu Genmu Ankei")
hit_leader_dm("Shen Woo", "Bakuten")
hit_leader_dm("Terry", "Power Stream")
hit_leader_dm("Joe", "Mightiest Blasting Bash")
hit_leader_dm("Tizoc", "Big Fall Griffon")
hit_leader_dm("Ryo", "Tenchi Haohken")
hit_leader_dm("Robert", "Hiryu Choushuukyaku")
hit_leader_dm("Yuri", "Denjin Haoh Shoukouken")
hit_leader_dm("Kim", "Initiate's Phoenix Flattener")
hit_leader_dm("Chang", "Sphere of Supremacy")
hit_leader_dm("Jhun", "Jhun's Phoenix Talon Tear")
hit_leader_dm("Leona", "Aerial V Slasher")
hit_leader_dm("Ralf", "Galactica Phantom")
hit_leader_dm("Clark", "Ultra Argentine Backbreaker")
// hit_leader_dm("Gato", "Tenryu Retsu Kiba") // needs an exception for the 3rd part of his DM
hit_leader_dm("Billy", "Senkuu Sakkon")
hit_leader_dm("Yamazaki", "Kyouken")
hit_leader_dm("King", "Phantom Strike")
hit_leader_dm("Mai", "Chou Hissatsu Shinobi Bachi")
hit_leader_dm("Blue Mary", "M • Twister Rose")
hit_leader_dm("Benimaru", "Raikouken")
hit_leader_dm("Shingo", "Shingo's My Way Maimer")
hit_leader_dm("Daimon", "Supreme Heaven to Hell Drop")
// hit_leader_dm("Athena", "Kissy, Kissy Psycho Bomber")
hit_leader_dm("Hinako", "Morote Tsuki")
hit_leader_dm("Malin", "Mizuchi")
hit_leader_dm("K'", "Chain Drive")
hit_leader_dm("Maxima", "MX-2 Final Cannon")
hit_leader_dm("Whip", "Sonic Slaughter \"Code:KW\"")
hit_leader_dm("Kyo", "San Shingi no Ichi")
hit_leader_dm("Iori", "San Shingi no Ni")
hit_leader_dm("Chizuru", "San Shingi no San")
hit_leader_dm("Kusanagi", "Ura 108 Shiki • Orochi Nagi")

achievement("Kissy, Kissy Psycho Bomber", "Hit your opponent with a Leader Super Desperation Move and finish it with Kissy, Kissy Psycho Bomber as Athena on Arcade Mode.", 5,
                trigger =   is_arcade() &&
                            p1_only() &&
                            p1_leader_dm() == 1 && p1_current_move() == 0x00e1 && prev(p1_current_move()) != 0x00e1 &&
                            (
                                (p1_current_character_slot() == 0 && p1_order_select_slot_1() == characters["Athena"]) ||
                                (p1_current_character_slot() == 1 && p1_order_select_slot_2() == characters["Athena"]) ||
                                (p1_current_character_slot() == 2 && p1_order_select_slot_3() == characters["Athena"])
                            )
                
                )

achievement("Tenryu Retsu Kiba", "Hit your opponent with Leader Super Desperation Move as Gato on Arcade Mode.", 5,
                trigger =   is_arcade() &&
                            p1_only() &&
                            p1_leader_dm() == 1 && p1_current_move() == 0x00cb && 
                            __ornext(p1_target_damaged() == 1 || p1_target_grabbed() == 1 || (p2_player_hit() == 1 && p2_player_hit_2() == 1)) &&
                            (
                                (p1_current_character_slot() == 0 && p1_order_select_slot_1() == characters["Gato"]) ||
                                (p1_current_character_slot() == 1 && p1_order_select_slot_2() == characters["Gato"]) ||
                                (p1_current_character_slot() == 2 && p1_order_select_slot_3() == characters["Gato"])
                            )
                
                )

achievement("Desperation Finish", "Finish a match with a Desperation Move.", 2,
                trigger =   is_arcade() &&
                            p1_only() &&
                            p1_shift() == 1 && p1_special() == 1 && game_bgm() == BGM_FIGHT_ENDED && prev(game_bgm()) != BGM_FIGHT_ENDED
                
                )

achievement("Great Man", "Reach 36000 score on Team Play (default settings).", 10,
            trigger = game_mode() == MODE_TEAM_ARCADE &&
                      p1_only() &&
                      default_settings_level3() &&
                      game_score_bcd_xxxx_0000() == 0x0003 &&
                      prev(game_score_bcd_xxxx_0000()) == 0x0003 &&
                      game_score_bcd_0000_xxxx() == 0x6000 &&
                      prev(game_score_bcd_0000_xxxx()) < 0x6000
            )

// =========================================
//               Leaderboards              
// =========================================

leaderboard("KOF 2003 - Team Play Best Score", "Best score on Team Play (default settings).",
           start = game_mode() == MODE_TEAM_ARCADE && p1_only() && default_settings_level3() && 
                   (
                        mukai_ending() ||
                        adel_ending() 
                   ),
           cancel = p2_active_state() > 0,
           submit =  game_mode() == MODE_TEAM_ARCADE && p1_only() && default_settings_level3() && 
                     (
                        mukai_ending() ||
                        adel_ending() 
                     ),
           value = bcd(game_score_bcd_xxxx_0000()) * 10000 + bcd(game_score_bcd_0000_xxxx()) * 1,
           format = "SCORE", lower_is_better=false
           )
leaderboard("KOF 2003 - Single Play Best Score", "Best score on Single Play (default settings).",
           start = game_mode() == MODE_SINGLE_ARCADE && p1_only() && default_settings_level3() && 
                   (
                        mukai_ending() ||
                        adel_ending() 
                   ),
           cancel = p2_active_state() > 0,
           submit =  game_mode() == MODE_SINGLE_ARCADE && p1_only() && default_settings_level3() && 
                     (
                        mukai_ending() ||
                        adel_ending() 
                     ),
           value = bcd(game_score_bcd_xxxx_0000()) * 10000 + bcd(game_score_bcd_0000_xxxx()) * 1,
           format = "SCORE", lower_is_better=false
           )