// Capcom vs. SNK 2: Millionaire Fighting 2001
// #ID = 347

// =========================================
//              Memory Accessors              
// =========================================

// Settings
function settings_difficulty() => byte(0x2E11DC)
function settings_difficulty_3stars() => byte(0x2E11DC) >= 2
function settings_difficulty_4stars() => byte(0x2E11DC) >= 3
function settings_damage() => byte(0x2E11DE)
function settings_damage_default() => byte(0x2E11DE) == 1
function settings_damage_training_default() => byte(0x2e126f) == 1
function settings_rounds_1p() => byte(0x2E121C)
function settings_rounds_1p_default() => byte(0x2E121C) == 1


// Game
function game_state() => byte(0x3329EC)
         gs_player_select = 0x01010102
         gs_fighting = 0x02020102

function game_state_32bits() => dword(0x3329ec)
         gs_intro = 0x01
         gs_game = 0x02
         gs_menu = 0x03

function game_mode() => byte(0x332A32)
         gm_arcade = 0x00
         gm_survival = 0x01

function game_sub_mode() => byte(0x332A3A)
function players_active() => byte(0x332A18)

function match_state() => word(0x3329F0)
function match_current_round() => byte(0x332AED)
function match_victory_type() => byte(0x332AF2)

// Arcade
function arcade_match() => byte(0x332AEC)
function arcade_game_beaten_flag() => bit0(0x332AF4)
function arcade_last_boss() => byte(0x332B0B)
function arcade_sc_finishes() => byte(0x332B36)
function arcade_finest_kos() => byte(0x332B38)

function arcade_boss_battle_mode() => bit0(0x34eebe)

function survival_timer() => dword(0x332B48)

// P1
function p1_current_char() => byte(0x34E9A1)
function p1_current_ratio() => byte(0x34eb00)
function p1_state() => byte(0x34E9A6)
function p1_state_16bits() => word(0x34E9A6)
         move_type_special = 0x07
         move_type_sc = 0x08

function p1_move() => byte(0x34EBA4)
function p1_sprite() => word(0x34EA56)
function p1_hit_combo() => byte(0x34F0FC)

function p1_hp() => word(0x34EAE8)
function p1_hp_max() => word(0x34EAEC)

function p1_custom_combo_timer() => word(0x34EAFE)
function p1_parry_recovery() => byte(0x34EBA0)

function p1_char1() => byte(0x34EEC0)
function p1_char2() => byte(0x34EEC1)
function p1_char3() => byte(0x34EEC2)

function p1_char1_color() => byte(0x34EEC4)
function p1_char2_color() => byte(0x34EEC5)
function p1_char3_color() => byte(0x34EEC6)

function p1_char1_ratio() => byte(0x34EECC)
function p1_char2_ratio() => byte(0x34EECD)
function p1_char3_ratio() => byte(0x34EECE)

function p1_groove() => byte(0x34EED0)
         groove_c = 0x00
         groove_a = 0x01
         groove_p = 0x02
         groove_s = 0x03
         groove_n = 0x04
         groove_k = 0x05

function p1_team_size() => byte(0x34EED1)
function p1_groove_points() => dword(0x34EED4)
function p1_first_attacks_received() => byte(0x34EEE7)
function p1_survival_wins() => byte(0x34EEEA)
function p1_combo_damage() => word(0x36B420)

// P2
function p2_current_char() => byte(0x34EF75)
function p2_state() => word(0x34EF7A)
function p2_move() => byte(0x34F178)
function p2_hit_combo() => byte(0x34EB28)
function p2_stun_sizzy() => byte(0x34f116)

function p2_hp() => word(0x34F0BC)
function p2_hp_max() => word(0x34F0C0)

function p2_char1() => byte(0x34F494)
function p2_char2() => byte(0x34F495)
function p2_char3() => byte(0x34F496)

function p2_char1_ratio() => byte(0x34F4A0)
function p2_char2_ratio() => byte(0x34F4A1)
function p2_char3_ratio() => byte(0x34F4A2)

function p2_groove() => byte(0x34F4A4)
function p2_team_size() => byte(0x34F4A5)
function p2_partner() => byte(0x34F4A6)
function p2_groove_points() => dword(0x34F4A8)

characters = {
   "Ryu": 0,
   "Ken": 1,
   "Chun-Li": 2,
   "Guile": 3,
   "Zangief": 4,
   "Dhalsim": 5,
   "E. Honda": 6,
   "Blanka": 7,
   "Balrog (Claw)": 8,
   "Sagat": 9,
   "Vega (Dictator)": 10,
   "Sakura": 11,
   "Cammy": 12,
   "Gouki": 13,
   "Morrigan": 14,
   "Evil Ryu": 15,
   "Kyo": 16,
   "Iori": 17,
   "Terry": 18,
   "Ryo": 19,
   "Mai": 20,
   "Kim": 21,
   "Geese": 22,
   "Yamazaki": 23,
   "Raiden": 24,
   "Rugal": 25,
   "Vice": 26,
   "Benimaru": 27,
   "Yuri": 28,
   "King": 29,
   "Nakoruru": 30,
   "Orochi Iori": 31,
   "M. Bison (Boxer)": 32,
   "Dan": 33,
   "Joe": 34,
   "Eagle": 35,
   "Maki": 36,
   "Kyosuke": 37,
   "Athena": 38,
   "Chang": 39,
   "Todoh": 40,
   "Rock": 41,
   "Hibiki": 42,
   "Haohmaru": 43,
   "Yun": 44,
   "Shin Gouki": 45,
   "God Rugal": 46,
   "Rolento": 47
}

// =========================================
//             Utility Functions             
// =========================================

function arcade_finished() => arcade_game_beaten_flag() == true && prev(arcade_game_beaten_flag()) == false
function arcade_finished_final_boss() {
    return (
        (p2_char1() == characters["Rugal"] || p2_char1() == characters["Gouki"] ||
        p2_char1() == characters["God Rugal"] || p2_char1() == characters["Shin Gouki"]) &&
        arcade_finished()
    )
}

function arcade_game_beaten_no_boss() {
    return (
        p2_char1() != characters["Rugal"] && p2_char1() != characters["Gouki"] &&
        p2_char1() != characters["God Rugal"] && p2_char1() != characters["Shin Gouki"] &&
        arcade_finished()
    )
}
function is_arcade() => never(game_mode() != gm_arcade) && never(game_state() != gs_game) && arcade_boss_battle_mode() == false

function no_ex_options() => all_of(range(0, 9), b => byte(0x2e1220 + b) == 0) 

function super_combo_finished() => (arcade_sc_finishes() > prev(arcade_sc_finishes()) ||
                                    arcade_finest_kos() > prev(arcade_finest_kos()))

function p1_only() => never(players_active() != 1)
function p1_human() => bit0(0x332A18) == true

function p1_has_won() => match_victory_type() == 1 && prev(match_victory_type()) == 0
function p2_has_won() => match_victory_type() == 2 && prev(match_victory_type()) == 0

function p1_team_has_char(char_id) => p1_char1() == char_id || p1_char2() == char_id || p1_char3() == char_id
function p1_dont_have_char(char_id) => p1_char1() != char_id && p1_char2() != char_id && p1_char3() != char_id


// =========================================
//                Arcade Mode              
// =========================================

achievement("Mark of the Millennium 2001", "Finish Arcade Mode [Ratio/3 on 3] on 8 stars difficulty (no EX options).", 10,
            trigger =   is_arcade() &&
                        never(game_sub_mode() == 0x01) &&
                        p1_only() &&
                        settings_difficulty() == 7 &&
                        no_ex_options() &&
                        trigger_when(arcade_finished())
           )

achievement("Millionaire Fighting 2001", "Finish Arcade Mode [Ratio/3 on 3] by defeating any last boss without using a continue (3 stars difficulty, no EX options).", 10,
            trigger =   is_arcade() &&
                        never(game_sub_mode() == 0x01) &&
                        p1_only() &&
                        settings_difficulty_3stars() &&
                        no_ex_options() &&
                        once(arcade_match() == 0 && game_state_32bits() == gs_player_select) &&
                        never(p2_has_won()) &&
                        never(arcade_game_beaten_no_boss()) &&
                        trigger_when(arcade_finished_final_boss())
           )

achievement("Single Champion", "Finish Arcade Mode [Single Match] without using a continue (3 stars difficulty, 3 rounds, no EX options).", 10,
            trigger =   is_arcade() &&
                        never(game_sub_mode() != 0x01) &&
                        p1_only() &&
                        settings_difficulty_3stars() &&
                        settings_rounds_1p_default() &&
                        no_ex_options() &&
                        once(arcade_match() == 0 && game_state_32bits() == gs_player_select) &&
                        never(p2_has_won()) &&
                        trigger_when(arcade_finished())
           )

// =========================================
//              Arcade Grooves              
// =========================================

function finish_arcade_groove(title, groove_name, groove_id, cheevo_id) {
    achievement(title, format("Finish Arcade Mode using only {0} (3 stars difficulty, no EX options).", groove_name), 5,
            trigger =   is_arcade() &&
                        p1_only() &&
                        settings_difficulty_3stars() &&
                        no_ex_options() &&
                        once(arcade_match() == 0 && game_state_32bits() == gs_player_select && p1_groove() == groove_id) &&
                        p1_groove() == groove_id &&
                        never(p1_has_won() && p1_groove() != groove_id) &&
                        trigger_when(arcade_finished())
           )
}

finish_arcade_groove("Alpha Style", "C-Groove", 0, 0)
finish_arcade_groove("Variable Combo", "A-Groove", 1, 0)
finish_arcade_groove("Parry Groove", "P-Groove", 2, 0)
finish_arcade_groove("Extra Mode", "S-Groove", 3, 0)
finish_arcade_groove("Advanced Mode", "N-Groove", 4, 0)
finish_arcade_groove("Samurai Way of Fight", "K-Groove", 5, 0)

// =========================================
//                Arcade Bosses              
// =========================================

function defeat_boss_arcade(title, boss, points, cheevo_id) {
    achievement(title, format("Defeat {0} boss during Arcade Mode (3 stars difficulty, no EX options).", boss), points,
                trigger =   is_arcade() &&
                            p1_only() &&
                            settings_difficulty_3stars() &&
                            no_ex_options() &&
                            p2_char1() == characters[boss] && p2_char2() == 0xFF && p2_char3() == 0xFF &&
                            p1_has_won()
                )
}

defeat_boss_arcade("I Will Kill You!", "Vega (Dictator)", 5, 0)
defeat_boss_arcade("Ayi Stain Mah Hanndz... Weed Yu Bra.", "Geese", 5, 0)
defeat_boss_arcade("Shoushi!", "Gouki", 5, 0)
defeat_boss_arcade("This Has Ended!", "Rugal", 5, 0)

// =========================================
//                Arcade Teams              
// =========================================

function beat_arcade_team(char1, char2, char3, title, cheevo_id) {
    achievement(title, format("Finish Arcade Mode by defeating any last boss using only {0}, {1}, and {2} (3 stars difficulty, no EX options).", char1, char2, char3), 10,
            trigger =   is_arcade() &&
                        p1_only() &&
                        settings_difficulty_3stars() &&
                        no_ex_options() &&
                        once(arcade_match() == 0 && game_state_32bits() == gs_player_select) &&
                        p1_team_size() == 3 &&
                        never(p1_dont_have_char(characters[char1]) && p1_has_won()) &&
                        never(p1_dont_have_char(characters[char2]) && p1_has_won()) &&
                        never(p1_dont_have_char(characters[char3]) && p1_has_won()) &&
                        p1_team_has_char(characters[char1]) &&
                        p1_team_has_char(characters[char2]) &&
                        p1_team_has_char(characters[char3]) &&
                        never(arcade_game_beaten_no_boss()) &&
                        trigger_when(arcade_finished_final_boss())
           )
}

function beat_arcade_tag(char1, char2, title, cheevo_id) {
    achievement(title, format("Finish Arcade Mode by defeating any last boss using only {0} and {1} (3 stars difficulty, no EX options).", char1, char2), 10,
            trigger =   is_arcade() &&
                        p1_only() &&
                        settings_difficulty_3stars() &&
                        no_ex_options() &&
                        once(arcade_match() == 0 && game_state_32bits() == gs_player_select) &&
                        p1_team_size() == 2 &&
                        never(p1_dont_have_char(characters[char1]) && p1_has_won()) &&
                        never(p1_dont_have_char(characters[char2]) && p1_has_won()) &&
                        p1_team_has_char(characters[char1]) &&
                        p1_team_has_char(characters[char2]) &&
                        never(arcade_game_beaten_no_boss()) &&
                        trigger_when(arcade_finished_final_boss())
           )
}

// Teams
beat_arcade_team("Kyo", "Terry", "Ryo", "SNK Heroes", 0)
beat_arcade_team("Mai", "Yuri", "Athena", "SNK Heroines", 0)
beat_arcade_team("Ken", "Terry", "Guile", "USA Dream Team", 0)
beat_arcade_team("Terry", "Geese", "Rock", "The Good, The Evil and The Rock", 0)
beat_arcade_team("Kyo", "Athena", "Sakura", "The Students", 0)
beat_arcade_team("Vega (Dictator)", "Geese", "Rugal", "Crime Bosses", 0)
beat_arcade_team("Rugal", "Yamazaki", "Vice", "Sadistic Intent", 0)
beat_arcade_team("Sagat", "King", "Joe", "Muay Thai", 0)
beat_arcade_team("Zangief", "Raiden", "Chang", "Dumb Muscles", 0)
beat_arcade_team("Haohmaru", "Nakoruru", "Hibiki", "Samurai Shodown", 0)
beat_arcade_team("Ryo", "Yuri", "Todoh", "Art of Fighting", 0)
beat_arcade_team("Kyosuke", "Blanka", "Benimaru", "Electric Feel", 0)
beat_arcade_team("Ryu", "Ken", "Gouki", "Shotokan Practicers", 0)
beat_arcade_team("Dan", "Sakura", "Blanka", "Saikyo Friendship", 0)
beat_arcade_team("E. Honda", "Dhalsim", "Zangief", "World Warriors", 0)
beat_arcade_team("M. Bison (Boxer)", "Balrog (Claw)", "Sagat", "Grand Masters", 0)
beat_arcade_team("Ryu", "Sagat", "Eagle", "Street Fighter One", 0)
beat_arcade_team("Chun-Li", "Cammy", "Sakura", "Capcom Heroines", 0)
beat_arcade_team("Chun-Li", "Mai", "Morrigan", "Fighting Game Waifus", 0)
beat_arcade_team("Ryu", "Chun-Li", "Yun", "Street Fighter III", 0)

// Tags
beat_arcade_tag("Evil Ryu", "Orochi Iori", "Evil Incarnation", 0)
beat_arcade_tag("Shin Gouki", "God Rugal", "Ultimate Beings", 0)
beat_arcade_tag("Kim", "Chang", "Korea Justice", 0)
beat_arcade_tag("Maki", "Rolento", "Final Fight", 0)
beat_arcade_tag("Iori", "Gouki", "Anti-Heroes", 0)

// =========================================
//                  Combos              
// =========================================

// achievement("Double Lariat", "Zangief: Perform a 12-hit combo using Custom Combo (no Infinity Gauge).", 3,
//             trigger =   p1_human() &&
//                         game_state() == gs_game &&
//                         p1_current_char() == characters["Zangief"] &&
//                         p1_hit_combo() >= 12 && prev(p1_hit_combo()) < 12 &&
//                         p1_custom_combo_timer() > 0x00 && p1_custom_combo_timer() < 0x90 &&
//                         p1_groove() == groove_a &&
//                         byte(0x2e1265) != 3
//            )

function link_super_combo_character(title, char, points, cheevo_id) {
    achievement(title, format("{0}: Link a normal hit into a Super Combo.", char), points,
                trigger =   p1_human() &&
                            game_state() == gs_game &&
                            p1_current_char() == characters[char] &&
                            once(p1_state() != 7 && p1_state() != 8 && p1_hit_combo() > prev(p1_hit_combo())) &&
                            p1_state() == 8 && p1_hit_combo() > prev(p1_hit_combo()) &&
                            never(p2_stun_sizzy() < prev(p2_stun_sizzy())) &&
                            never(p1_hit_combo() == 0)
               )
}

function link_special_move_character(title, char, points, cheevo_id) {
    achievement(title, format("{0}: Link a normal hit into a Special Move.", char), points,
                trigger =   p1_human() &&
                            game_state() == gs_game &&
                            p1_current_char() == characters[char] &&
                            once(p1_state() != 7 && p1_state() != 8 && p1_hit_combo() > prev(p1_hit_combo())) &&
                            p1_state() == 7 && p1_hit_combo() > prev(p1_hit_combo()) &&
                            never(p2_stun_sizzy() < prev(p2_stun_sizzy())) &&
                            never(p1_hit_combo() == 0)
               )
}

function custom_combo_sc_character(title, char, points, damage, cheevo_id) {
    achievement(title, format("{0} [Ratio 2]: Perform a {1} damage combo using Custom Combo, ending with a Super Combo (no Infinite Gauge, Damage 2).", char, damage), points,
                trigger =   p1_human() &&
                            game_state() == gs_game &&
                            p1_current_char() == characters[char] &&
                            p1_current_ratio() <= 1 &&
                            p1_combo_damage() >= damage &&
                            p1_state() == move_type_sc && 
                            p1_hit_combo() > prev(p1_hit_combo()) &&
                            p1_custom_combo_timer() > 0x00 && p1_custom_combo_timer() < 0x90 &&
                            p1_groove() == groove_a &&
                            byte(0x2e1265) != 3 && // Block Infinite Gauge
                            settings_damage_training_default()
               )
}

function custom_combo_special_character(title, char, points, damage, cheevo_id) {
    achievement(title, format("{0} [Ratio 2]: Perform a {1} damage combo using Custom Combo, ending with a Special Move (no Infinite Gauge, Damage 2).", char, damage), points,
                trigger =   p1_human() &&
                            game_state() == gs_game &&
                            p1_current_char() == characters[char] &&
                            p1_current_ratio() <= 1 &&
                            p1_combo_damage() >= damage &&
                            p1_state() == move_type_special && 
                            p1_hit_combo() > prev(p1_hit_combo()) &&
                            p1_custom_combo_timer() > 0x00 && p1_custom_combo_timer() < 0x90 &&
                            p1_groove() == groove_a &&
                            byte(0x2e1265) != 3 && // Block Infinite Gauge
                            settings_damage_training_default()
               )
}

custom_combo_sc_character("Shinkuu Tatsumaki Senpuukyaku", "Ryu", 3, 5500, 0)
custom_combo_sc_character("Shouryu Reppa", "Ken", 3, 5500, 0)
custom_combo_sc_character("Kikoushou", "Chun-Li", 3, 5500, 0)
custom_combo_sc_character("Total Wipeout", "Guile", 5, 5500, 0)
custom_combo_sc_character("Aerial Russian Slam", "Zangief", 5, 5500, 0)
custom_combo_sc_character("Yoga Stream", "Dhalsim", 5, 5500, 0)
custom_combo_sc_character("Onimusou", "E. Honda", 5, 5500, 0)
custom_combo_sc_character("Direct Lightning", "Blanka", 5, 5500, 0)
custom_combo_sc_character("Scarlet Mirage", "Balrog (Claw)", 5, 5500, 0)
custom_combo_sc_character("Tiger Genocide", "Sagat", 5, 5500, 0)
custom_combo_sc_character("Knee Press Nightmare", "Vega (Dictator)", 5, 5500, 0)
custom_combo_sc_character("Haru Ichiban", "Sakura", 5, 5500, 0)
custom_combo_sc_character("Spin Drive Smasher", "Cammy", 5, 5500, 0)
custom_combo_sc_character("Messatsu Gou Hadou", "Gouki", 5, 5500, 0)
custom_combo_sc_character("Cardinal Blade", "Morrigan", 5, 5500, 0)
custom_combo_sc_character("Messatsu Goushouryu", "Evil Ryu", 5, 5500, 0)
custom_combo_sc_character("Ura 108 Shiki:Orochi Nagi", "Kyo", 5, 5500, 0)
custom_combo_sc_character("Kin 1211 Shiki: Ya Otome", "Iori", 5, 5500, 0)
custom_combo_sc_character("Power Geyser", "Terry", 5, 5500, 0)
custom_combo_sc_character("Ryuuko Ranbu", "Ryo", 5, 5500, 0)
custom_combo_sc_character("Chou Hissatsu Shinobi Bachi", "Mai", 5, 5500, 0)
custom_combo_sc_character("Hou'ou Tenbu Kyaku", "Kim", 5, 5500, 0)
custom_combo_sc_character("Raising Storm", "Geese", 5, 5500, 0)
custom_combo_sc_character("Guillotine", "Yamazaki", 5, 5500, 0)
custom_combo_sc_character("Crazy Train", "Raiden", 5, 5500, 0)
custom_combo_sc_character("Gigantic Pressure", "Rugal", 5, 5500, 0)
custom_combo_special_character("Ravenous", "Vice", 10, 5000, 0)
custom_combo_sc_character("Raikou Ken", "Benimaru", 5, 5500, 0)
custom_combo_sc_character("Haou Shoukou Ken", "Yuri", 5, 5500, 0)
custom_combo_sc_character("Illusion Dance", "King", 5, 5500, 0)
custom_combo_sc_character("Shichikapu Kamui Irushika", "Nakoruru", 10, 5000, 0)
custom_combo_sc_character("Ura 100 Shiki: Oni Honou ", "Orochi Iori", 5, 5500, 0)
custom_combo_sc_character("Crazy Buffalo", "M. Bison (Boxer)", 5, 5500, 0)
custom_combo_sc_character("Shinku Gadouken", "Dan", 5, 5500, 0)
custom_combo_sc_character("Screw Upper", "Joe", 5, 5500, 0)
custom_combo_sc_character("Manchester Gold", "Eagle", 5, 5500, 0)
custom_combo_sc_character("Bushin Gou Raiha", "Maki", 5, 5500, 0)
custom_combo_sc_character("Kakusan Cross Cutter", "Kyosuke", 5, 5500, 0)
custom_combo_sc_character("Psycho Sword", "Athena", 10, 5000, 0)
custom_combo_sc_character("Tekkyuu Dai Bousou", "Chang", 5, 5500, 0)
custom_combo_sc_character("Chou Kasane Ate", "Todoh", 5, 5500, 0)
custom_combo_sc_character("Shining Knuckles", "Rock", 5, 5500, 0)
custom_combo_sc_character("Hasshou Suru Shinki Nari", "Hibiki", 5, 5500, 0)
custom_combo_sc_character("Hiougi Tenha Fujin Zan", "Haohmaru", 5, 5500, 0)
custom_combo_sc_character("Sourai Rengeki", "Yun", 5, 5500, 0)
custom_combo_sc_character("Messatsu Gou Shouryuu", "Shin Gouki", 5, 5500, 0)
custom_combo_sc_character("Genocide Heaven", "God Rugal", 5, 5500, 0)
custom_combo_sc_character("Take No Prisoner", "Rolento", 5, 5500, 0)