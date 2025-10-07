// Capcom Fighting Evolution
// #ID = 19496

// Settings
function settings_difficulty() => byte(0x35C4E0)
function settings_difficulty_3stars() => byte(0x35C4E0) >= 0x02
function settings_difficulty_8stars() => byte(0x35C4E0) == 0x07
function settings_damage_level() => byte(0x35C4E2)
function settings_damage_level_default() => byte(0x35C4E2) == 0x01
function settings_game_speed() => byte(0x35C4E3)
function settings_rounds_1p() => byte(0x35C520)
function settings_rounds_1p_default() => byte(0x35C520) == 0x01

// Game
function game_state() => byte(0x35C180)
function game_mode() => byte(0x35C1C6)
function game_current_bgm() => byte(0x35C2B7)
         BGM_MAIN_MENU = 0x1a
         BGM_PLAYER_SELECT = 0x02

function game_players_active() => byte(0x35C1AC)
function game_arcade_match() => byte(0x341167)
function game_score() => dword(0x341118)

// PI
function p1_character_1() => byte(0x364C68)
function p1_character_2() => byte(0x364C69)
function p1_characters_count() => byte(0x364C6C)
function p1_current_character_battle() => byte(0x34118C)
function p1_hp() => word(0x340D94)
function p1_action_state() => byte(0x340C56)
function p1_custom_combo_timer() => word(0x340daa)
function p1_hit_combo() => byte(0x341394)

function p1_rounds_wins() => byte(0x341726)
function p1_consecutive_wins() => byte(0x341178)
function p1_perfects() => byte(0x341168)
function p1_super_moves_finishes() => byte(0x35c2ca)

function p2_character_1() => byte(0x364C78)
function p2_character_2() => byte(0x364C79)
function p2_current_character_battle() => byte(0x34174C)
function p2_hp() => word(0x341354)

function training_groove_gauge_human() => byte(0x35C4A0)
function training_damage_dealt() => word(0x35C4C6)


characters = {
   "Ryu": 0,
   "Chun-Li": 1,
   "Guile": 2,
   "Zangief": 3,
   "M. Bison": 4,
   "Sakura": 5,
   "Hauzer": 6,
   "Hydron": 7,
   "Guy": 8,
   "Rose": 9,
   "Karin": 10,
   "Pyron": 11,
   "Demitri": 12,
   "Felicia": 13,
   "Anakaris": 14,
   "Jedah": 15,
   "Alex": 16,
   "Urien": 17,
   "Leo": 18,
   "Kenji": 19,
   "Yun": 20,
   "Shin Akuma": 21,
   "Ingrid": 22,
}

// =========================================
//              Utility Function              
// =========================================

function is_arcade() => never(game_mode() != 0) && never(game_state() != 2)
function p1_only() => game_players_active() == 1
function p1_only_reset() => never(game_players_active() != 1)

function p1_won_2_rounds() => p1_rounds_wins() == 2 && prev(p1_rounds_wins()) == 1

function p1_team_has_char(char_id) => p1_character_1() == char_id || p1_character_2() == char_id
function p1_dont_have_char(char_id) => p1_character_1() != char_id && p1_character_2() != char_id

function game_beaten() => __ornext(p2_current_character_battle() == characters["Pyron"] || p2_current_character_battle() == characters["Shin Akuma"]) && p1_won_2_rounds() && game_arcade_match() >= 6

// =========================================
//                Achievements              
// =========================================

function achiev_finish_arcade(title, char1, char2) {
    achievement(title, format("Complete Arcade Mode using only {0} and {1} on default settings.", char1, char2), 10,
                trigger =   is_arcade() &&
                            p1_only() &&
                            once(game_arcade_match() == 0 && game_current_bgm() == BGM_PLAYER_SELECT) &&
                            never(p1_dont_have_char(characters[char1]) && p1_rounds_wins() > prev(p1_rounds_wins())) &&
                            never(p1_dont_have_char(characters[char2]) && p1_rounds_wins() > prev(p1_rounds_wins())) &&
                            p1_team_has_char(characters[char1]) &&
                            p1_team_has_char(characters[char2]) &&
                            trigger_when(game_beaten()) &&
                            settings_difficulty_3stars() &&
                            settings_rounds_1p_default() &&
                            settings_damage_level_default()
                
                
                )
}

achiev_finish_arcade("Schoolgirls Team", "Ingrid", "Karin")
achiev_finish_arcade("Red Earth Bosses Team", "Hauzer", "Hydron")
achiev_finish_arcade("Warriors Team", "Leo", "Kenji")
achiev_finish_arcade("Egypt Team", "Anakaris", "Felicia")
achiev_finish_arcade("Evil Darkstalkers Team", "Demitri", "Jedah")
achiev_finish_arcade("Street Fighting Team", "Guy", "Yun")
achiev_finish_arcade("Psycho Power Team", "Rose", "M. Bison")
achiev_finish_arcade("SF Protagonists Team", "Ryu", "Alex")
achiev_finish_arcade("Justice Team", "Chun-Li", "Guile")
achiev_finish_arcade("Naked Team", "Zangief", "Urien")
achiev_finish_arcade("Girls Rivalry Team", "Karin", "Sakura")
achiev_finish_arcade("Bosses Team", "Shin Akuma", "Pyron")

achievement("Capcom Fighting Evolution", "Finish Arcade Mode on 8-star difficulty and default settings.", 10,
            trigger =   is_arcade() &&
                        p1_only() &&
                        trigger_when(game_beaten()) &&
                        settings_difficulty_8stars() &&
                        settings_rounds_1p_default() &&
                        settings_damage_level_default()
            )

achievement("Eternal Goddess", "Defeat Ingrid during Arcade Mode on default settings.", 10,
            trigger =   is_arcade() &&
                        p1_only() &&
                        p2_current_character_battle() == characters["Ingrid"] &&
                        p1_won_2_rounds() &&
                        settings_difficulty_3stars() &&
                        settings_rounds_1p_default() &&
                        settings_damage_level_default()
            )

achievement("The Lord of the Living Flames", "Defeat Pyron during Arcade Mode on default settings.", 5, type="win_condition",
            trigger =   is_arcade() &&
                        p1_only() &&
                        p2_current_character_battle() == characters["Pyron"] &&
                        p1_won_2_rounds() &&
                        settings_difficulty_3stars() &&
                        settings_rounds_1p_default() &&
                        settings_damage_level_default()
            )

achievement("True Great Devil", "Defeat Shin Akuma during Arcade Mode on default settings.", 25,
            trigger =   is_arcade() &&
                        p1_only() &&
                        p2_current_character_battle() == characters["Shin Akuma"] &&
                        p1_won_2_rounds() &&
                        settings_difficulty_3stars() &&
                        settings_rounds_1p_default() &&
                        settings_damage_level_default()
            )

function achiev_super_finish(title, char) {
    achievement(title, format("Finish a round with a Super Move as {0} during Arcade Mode on default difficulty.", char), 5,
                trigger =   is_arcade() &&
                            p1_only() &&
                            p1_current_character_battle() == characters[char] &&
                            p1_super_moves_finishes() > prev(p1_super_moves_finishes()) &&
                            p1_custom_combo_timer() == 0 &&
                            settings_difficulty_3stars()
                )
}

achiev_super_finish("Shinkuu Hadouken", "Ryu")
achiev_super_finish("Kikou Shou", "Chun-Li")
achiev_super_finish("Total Wipeout", "Guile")
achiev_super_finish("Final Atomic Buster", "Zangief")
achiev_super_finish("Mega Psycho Crusher", "M. Bison")
achiev_super_finish("Shinkuu Hadou Ken", "Sakura")
achiev_super_finish("Deluge Crisis", "Hauzer")
achiev_super_finish("Lightning Mast", "Hydron")
achiev_super_finish("Bushin Hassou Ken", "Guy")
achiev_super_finish("Aura Soul Spark", "Rose")
achiev_super_finish("Kanzuki-ryuu Shinpikaibyaku", "Karin")
achiev_super_finish("Cosmo Disruption", "Pyron")
achiev_super_finish("Demon Blast", "Demitri")
achiev_super_finish("Dancing Flash", "Felicia")
achiev_super_finish("Pharaoh Magic", "Anakaris")
achiev_super_finish("Finale=Rosso", "Jedah")
achiev_super_finish("Boomerang Raid", "Alex")
achiev_super_finish("Tyrant Punish", "Urien")
achiev_super_finish("Hercules Rush", "Leo")
achiev_super_finish("Jumonji", "Kenji")
achiev_super_finish("Youhou", "Yun")
achiev_super_finish("Messatsu Gou Hadou", "Shin Akuma")
achiev_super_finish("Sunburst", "Ingrid")