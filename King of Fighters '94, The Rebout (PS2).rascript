// King of Fighters '94, The: Rebout
// #ID = 24059

function settings_1p_defense_level() => byte(0x510044)
function settings_2p_defense_level() => byte(0x510045)
function settings_1p_power_gauge() => byte(0x510046)
function settings_2p_power_gauge() => byte(0x510047)
function settings_difficulty() => byte(0x51004A)
function settings_play_time() => byte(0x51004B)

function settings_default_any_diff() {
    return(
        settings_play_time() == 1 &&
        settings_1p_defense_level() == 3 &&
        settings_2p_defense_level() == 3 &&
        settings_1p_power_gauge() == 0 &&
        settings_2p_power_gauge() == 0
    )
}

function settings_default() {
    return(
        settings_difficulty() >= 3 &&
        settings_play_time() == 1 &&
        settings_1p_defense_level() == 3 &&
        settings_2p_defense_level() == 3 &&
        settings_1p_power_gauge() == 0 &&
        settings_2p_power_gauge() == 0
    )
}

function settings_default_and_level8() {
    return(
        settings_difficulty() == 7 &&
        settings_play_time() == 1 &&
        settings_1p_defense_level() == 3 &&
        settings_2p_defense_level() == 3 &&
        settings_1p_power_gauge() == 0 &&
        settings_2p_power_gauge() == 0
    )
}

function game_bgm() => byte(0x54CDF0)
function game_team_mode() => byte(0x54CE08)
function game_context() => byte(0x54CF50)
function game_mode() => byte(0x15233B8)
function arcade_teams_defeated() => bitcount(0x54CEF0)

function p1_active_state() => byte(0x53CD68)
function p2_active_state() => byte(0x53CD69)
function p1_score() => byte(0x549450) // also used as endless wins 

function p1_current_char() => byte(0x557aa0)
function p1_hp() => byte(0x557B50)
function p1_gauge() => byte(0x557B48)
function p1_team() => byte(0x557B61)
function p1_character_1() => byte(0x557B65)
function p1_character_2() => byte(0x557B66)
function p1_character_3() => byte(0x557B67)
function p1_remaining_fighters() => byte(0x557B68)
function p1_lost_round() => bit7(0x557B68)
function p1_rounds_wins_single() => byte(0x557b86)

function p1_hit_combo() => byte(0x525CB8)
function p1_move_type_action() => byte(0x557BE1)
function p1_move_type_hit() => byte(0x549429)

function p2_hp() => byte(0x557D70)
function p2_character_1() => byte(0x557D85)
function p2_character_2() => byte(0x557D86)
function p2_character_3() => byte(0x557D87)
function p2_remaining_fighters() => byte(0x557D88)
function p2_lost_round() => bit7(0x557D88)

characters = {
   "Heidern": 0,
   "Ralf": 1,
   "Clark": 2,
   "Athena": 3,
   "Kensou": 4,
   "Chin": 5,
   "Kyo": 6,
   "Benimaru": 7,
   "Daimon": 8,
   "Heavy-D!": 9,
   "Lucky Glauber": 10,
   "Brian": 11,
   "Kim": 12,
   "Chang": 13,
   "Choi": 14,
   "Terry": 15,
   "Andy": 16,
   "Joe": 17,
   "Ryo": 18,
   "Robert": 19,
   "Takuma": 20,
   "Yuri": 21,
   "Mai": 22,
   "King": 23,
   "Rugal Normal": 24,
   "Rugal": 25,
   "Saisyu": 30
}

// =========================================
//                 Utility              
// =========================================

function p1_only() => never(p1_active_state() == 0) && never(p2_active_state() > 0)
function in_game() => game_context() == 0x02
function in_char_select() => game_bgm() == 0x32

function is_any_arcade() => never(game_mode() > 2)
function is_any_arcade_or_neogeo() => never(game_mode() > 2 && game_mode() < 10)
function is_any_team_play() => never(game_mode() > 1)

function p1_has_won_round() => p2_lost_round() > prev(p2_lost_round()) && p1_hp() > 0 && p2_hp() == 0
function p1_won_match_team() => p2_remaining_fighters() == 0x80 && prev(p2_remaining_fighters()) == 0x00
function p1_won_match_single() => p1_rounds_wins_single() == 1 && p2_lost_round() > prev(p2_lost_round())

function game_beaten() => arcade_teams_defeated() == 8 && p2_remaining_fighters() == 0x80 && prev(p2_remaining_fighters()) == 0x00

function p1_team_has_char(char_id) => p1_character_1() == char_id || p1_character_2() == char_id || p1_character_3() == char_id
function p1_dont_have_char(char_id) => p1_character_1() != char_id && p1_character_2() != char_id && p1_character_3() != char_id


// =========================================
//                Arcade Mode               
// =========================================

function achiev_beat_game_team(title, char1, char2, char3) {
    achievement(title, format("Beat the game using only {0}, {1} and {2} in any difficulty (default settings).", char1, char2, char3), 10,
                trigger = p1_only() &&
                          in_game() &&
                          is_any_team_play() &&
                          once(arcade_teams_defeated() == 0 && in_char_select() && p1_active_state() > 0) &&
                          never(p1_dont_have_char(characters[char1]) && p1_has_won_round()) &&
                          never(p1_dont_have_char(characters[char2]) && p1_has_won_round()) &&
                          never(p1_dont_have_char(characters[char3]) && p1_has_won_round()) &&
                          p1_team_has_char(characters[char1]) &&
                          p1_team_has_char(characters[char2]) &&
                          p1_team_has_char(characters[char3]) &&
                          settings_default_any_diff() &&
                          trigger_when(game_beaten())
                )
}

achiev_beat_game_team("Japan Team", "Kyo", "Benimaru", "Daimon")
achiev_beat_game_team("Italy Team", "Terry", "Andy", "Joe")
achiev_beat_game_team("Mexico Team", "Ryo", "Robert", "Takuma")
achiev_beat_game_team("Brazil Team", "Heidern", "Ralf", "Clark")
achiev_beat_game_team("China Team", "Athena", "Kensou", "Chin")
achiev_beat_game_team("England Team", "King", "Mai", "Yuri")
achiev_beat_game_team("Korea Team", "Kim", "Chang", "Choi")
achiev_beat_game_team("USA Team", "Heavy-D!", "Lucky Glauber", "Brian")
// achiev_beat_edit_team("Bosses Team", "Rugal", "Saisyu", "")
achiev_beat_game_team("Stars Team", "Kyo", "Ryo", "Terry")
achiev_beat_game_team("Masters Team", "Takuma", "Chin", "Heidern")
achiev_beat_game_team("Nippon Team", "Daimon", "Joe", "Mai")


achievement("Rugal Team", "Beat the game using only Rugal, Saisyu and other in any difficulty (default settings).", 10,
                trigger = p1_only() &&
                          in_game() &&
                          is_any_team_play() &&
                          once(arcade_teams_defeated() == 0 && in_char_select() && p1_active_state() > 0) &&
                          never(p1_dont_have_char(characters["Rugal"]) && p1_has_won_round()) &&
                          never(p1_dont_have_char(characters["Saisyu"]) && p1_has_won_round()) &&
                          p1_team_has_char(characters["Rugal"]) &&
                          p1_team_has_char(characters["Saisyu"]) &&
                          settings_default_any_diff() &&
                          trigger_when(game_beaten())
                )

achievement("Showdown R&D", "Beat the game in Level-8 difficulty (default settings).", 25,
                trigger = p1_only() &&
                          in_game() &&
                          is_any_arcade() &&
                          settings_default_and_level8() &&
                          trigger_when(game_beaten())
                )

achievement("Single Rebout", "Beat the game on Single Play in any difficulty (default settings).", 10,
                trigger = p1_only() &&
                          in_game() &&
                          never(game_mode() != 2) &&
                          settings_default_any_diff() &&
                          trigger_when(game_beaten())
                )

achievement("Original '94", "Beat the game on Neo-Geo mode.", 10,
                trigger = p1_only() &&
                          in_game() &&
                          never(game_mode() != 10) &&
                          trigger_when(game_beaten())
                )

// =========================================
//                    Misc              
// =========================================

achievement("Maximum Power", "Fill the gauge to the MAX during Arcade mode (default settings).", 2,
            trigger = p1_only() &&
                      in_game() &&
                      is_any_arcade_or_neogeo() &&
                      p1_gauge() == 0x7f &&
                      prev(p1_gauge()) < 0x7f &&
                      prev(p1_gauge()) > 0x00 &&
                      settings_default_any_diff()
            )

achievement("Choice of Death or Humilliation", "Finish a round with a Desperation Move in any difficulty (default settings).", 4,
            trigger = p1_only() &&
                      in_game() &&
                      is_any_arcade_or_neogeo() &&
                      __ornext(p1_move_type_action() == 0x25 || p1_move_type_hit() == 0x25) &&
                      p1_has_won_round() &&
                      settings_default_any_diff()
            )

achievement("Perfect Rebout", "Win a round with a perfect in any difficulty (default settings).", 4,
            trigger = p1_only() &&
                      in_game() &&
                      is_any_arcade_or_neogeo() &&
                      p1_hp() == 0xcf &&
                      p1_has_won_round() &&
                      settings_default_any_diff()
            )


achievement("Single Survival", "Defeat 26 opponents on Single Endless.", 25,
            trigger = p1_only() &&
                      in_game() &&
                      game_mode() == 9 &&
                      game_team_mode() == 0 &&
                      p1_score() == 0x26 &&
                      prev(p1_score()) == 0x25
            )

achievement("Team Survival", "Defeat 10 opponents on Team Endless.", 25,
            trigger = p1_only() &&
                      in_game() &&
                      game_mode() == 9 &&
                      game_team_mode() == 1 &&
                      p1_score() == 0x10 &&
                      prev(p1_score()) == 0x09
            )

// =========================================
//             Desperation Moves              
// =========================================

function achiev_desp_move_char(char_name, title) {
    achievement(title, format("Hit your opponent with a Desperation Move as {0} during Arcade mode.", char_name), 5,
            trigger = p1_only() &&
                      in_game() &&
                      is_any_arcade_or_neogeo() &&
                      p1_current_char() == characters[char_name] &&
                      (
                        (p1_move_type_hit() == 0x25 && prev(p1_move_type_hit()) != 0x25) || 
                        (p1_move_type_action() == 0x25 && p1_has_won_round()) || 
                        (p1_move_type_hit() == 0x25 && p1_hit_combo() > prev(p1_hit_combo()))
                      )
            )
}

function achiev_desp_move_char_grab(char_name, title) {
    achievement(title, format("Hit your opponent with a Desperation Move as {0} during Arcade mode.", char_name), 5,
            trigger = p1_only() &&
                      in_game() &&
                      is_any_arcade_or_neogeo() &&
                      p1_current_char() == characters[char_name] &&
                      (
                        (p1_move_type_hit() == 0x25 && prev(p1_move_type_hit()) != 0x25) || 
                        (p1_move_type_action() == 0x25 && p1_has_won_round()) || 
                        (p1_move_type_hit() == 0x25 && p2_hp() < prev(p2_hp()))
                      )
            )
}

achiev_desp_move_char_grab("Heidern", "Final Bringer")
achiev_desp_move_char("Ralf", "Bari Bari Vulcan Punch")
achiev_desp_move_char_grab("Clark", "Ultra Argentine Back Breaker")
achiev_desp_move_char("Athena", "Shining Crystal")
achiev_desp_move_char("Kensou", "Shin Ryuu Tenbu Kyaku")
achiev_desp_move_char("Chin", "Gou Ran Enpou")
achiev_desp_move_char("Kyo", "Ura 108 Shiki Orochi Nagi")
achiev_desp_move_char("Benimaru", "Raiko Ken")
achiev_desp_move_char_grab("Daimon", "Jigoku Gokuraku Otoshi")
achiev_desp_move_char("Heavy-D!", "D.Crazy")
achiev_desp_move_char("Lucky Glauber", "Hell Bound")
achiev_desp_move_char("Brian", "Big Bang Tackle")
achiev_desp_move_char("Kim", "Houou Kyaku")
achiev_desp_move_char("Chang", "Tekkyu Dai Bou Sou")
achiev_desp_move_char("Choi", "Shin! Chouzetsu Tatsumaki Shinkuu Zan")
achiev_desp_move_char("Terry", "Power Geyser")
achiev_desp_move_char("Andy", "Cho Reppa Dan")
achiev_desp_move_char("Joe", "Screw Upper")
achiev_desp_move_char("Ryo", "Ryuko Ranbu I")
achiev_desp_move_char("Robert", "Ryuko Ranbu II")
achiev_desp_move_char("Takuma", "Ryuko Ranbu III")
achiev_desp_move_char("Yuri", "Hien Houou Kyaku")
achiev_desp_move_char("Mai", "Cho Hissatsu Shinobibachi")
achiev_desp_move_char("King", "Illusion Dance")
achiev_desp_move_char("Rugal", "God Press")
achiev_desp_move_char("Saisyu", "Ura 108 Shiki: Orochinagi")