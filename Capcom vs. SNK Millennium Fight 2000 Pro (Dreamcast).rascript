// Capcom vs. SNK: Millennium Fight 2000 Pro
// #ID = 18598

// =========================================
//              Memory Functions              
// =========================================

// Settings
function settings_difficulty() => byte(0x30B284)
function settings_time() => byte(0x30B285)
function settings_damage() => byte(0x30B286)
function settings_speed() => byte(0x30B287)
function settings_gauge() => byte(0x30B288)
function settings_run_enabled() => bit0(0x30B28D)
function settings_dash_enabled() => bit0(0x30B28E)
function settings_turbo_speed() => byte(0x30B290)

function default_settings() {
    return (
        settings_difficulty() >= 1 &&
        settings_time() == 1 &&
        settings_damage() == 1 &&
        settings_gauge() == 0
    )
}

function default_settings_lv8() {
    return (
        settings_difficulty() == 7 &&
        settings_time() == 1 &&
        settings_damage() == 1 &&
        settings_gauge() == 0
    )
}

// Game
function game_bgm() => dword(0x2533F8)
         BGM_CHAR_SELECT = 0x26

function game_context() => byte(0x362818)
         CTX_INTRO = 1
         CTX_GAME = 2
         CTX_MENU = 3

function game_state() => dword(0x362818)
         GS_FIGHTING = 0x02020102

function game_mode() => byte(0x362860)
         MODE_ARCADE = 0
         MODE_PAIR_MATCH = 2
         MODE_TRAINING = 4

function game_players_active() => byte(0x362830)
function game_players_active_fighting() => byte(0x36287C)

function arcade_match() => byte(0x362879)

function match_round() => byte(0x36287A)
function match_finished() => bit0(0x36287E)
function match_timer() => byte(0x362884)
function match_round_winner() => byte(0x36288C)

// P1
function p1_groove() => byte(0x36288E)
function p1_speed_select() => byte(0x3628DF)
function p1_char_1() => byte(0x362890)
function p1_char_2() => byte(0x362891)
function p1_char_3() => byte(0x362892)
function p1_char_4() => byte(0x362893)
function p1_team_size_char_select() => byte(0x3628B8)
function p1_team_size_ingame() => byte(0x362ECA)
function p1_char_1_ex() => bit0(0x362EC0)
function p1_char_2_ex() => bit0(0x362EC1)
function p1_char_3_ex() => bit0(0x362EC2)
function p1_char_4_ex() => bit0(0x362EC3)

function p1_current_character() => byte(0x362981)
function p1_hp() => word(0x362B18)
function p1_total_hp() => word(0x362B1C)
function p1_moves() => byte(0x362BD0)

function p1_super_combo_finishes() => byte(0x362ECB)
function p1_finishing_type() => byte(0x362EDC)
function p1_last_move_strength() => byte(0x362B16)

function p1_groove_score() => dword(0x362ECC)
function p1_rank_s_grades() => byte(0x362ED0)
function p1_rank_a_grades() => byte(0x362ED1)

// P2
function p2_groove() => byte(0x36288F)
function p2_char_1() => byte(0x362894)
function p2_char_2() => byte(0x362895)
function p2_char_3() => byte(0x362896)
function p2_char_4() => byte(0x362897)

function p2_current_character() => byte(0x362F95)
function p2_hp() => word(0x36312C)
function p2_total_hp() => word(0x363130)

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
   "Joe": 34
}

characters_capcom = {
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
   "M. Bison (Boxer)": 32,
   "Dan": 33,
}

characters_snk = {
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
   "Joe": 34
}

// =========================================
//                 Utility              
// =========================================

function p1_won_match() => match_finished() > prev(match_finished()) && match_round_winner() == 0
function p2_won_match() => match_finished() > prev(match_finished()) && match_round_winner() == 1
function game_beaten() => arcade_match() == 5 && p1_won_match()

function p1_only() => never(game_players_active() != 1)

function p1_team_has_char(char_id) => p1_char_1() == char_id || p1_char_2() == char_id || p1_char_3() == char_id || p1_char_4() == char_id
function p1_dont_have_char(char_id) => p1_char_1() != char_id && p1_char_2() != char_id && p1_char_3() != char_id && p1_char_4() != char_id

function is_arcade() => never(game_mode() != MODE_ARCADE && game_mode() != MODE_PAIR_MATCH) && never(game_context() != CTX_GAME)

function never_has_snk_chars() {
    trigger = always_false()
    for char in characters_snk {
        trigger =   trigger || 
                    never(p1_team_has_char(characters[char]) && game_state() == GS_FIGHTING)
    }
    return trigger
}

function never_has_capcom_chars() {
    trigger = always_false()
    for char in characters_capcom {
        trigger =   trigger || 
                    never(p1_team_has_char(characters[char]) && game_state() == GS_FIGHTING)
    }
    return trigger
}

// =========================================
//                Arcade Mode              
// =========================================

achievement("Millenium Fight 2000", "Finish the game (default settings).", 3,
            trigger =   is_arcade() &&
                        p1_only() &&
                        default_settings() &&
                        game_beaten()
           )

achievement("One Man Army", "Finish Arcade Mode using only Ratio 4 characters on Level-8 difficulty (default settings).", 10,
            trigger =   is_arcade() &&
                        game_mode() == MODE_ARCADE &&
                        once(arcade_match() == 0 && game_bgm() == BGM_CHAR_SELECT) &&
                        never(p1_team_size_char_select() != 1 && p1_won_match()) &&
                        p1_team_size_char_select() == 1 &&
                        p1_only() &&
                        default_settings_lv8() &&
                        trigger_when(game_beaten())
           )

achievement("Doppelganger", "Finish Pair Match Mode with both characters being the same and using the normal and EX version (default settings).", 10,
            trigger =   is_arcade() &&
                        game_mode() == MODE_PAIR_MATCH &&
                        once(arcade_match() == 0 && game_bgm() == BGM_CHAR_SELECT) &&
                        never(p1_char_1() != p1_char_2() && game_state() == GS_FIGHTING) &&
                        never(p1_char_1_ex() == p1_char_2_ex() && game_state() == GS_FIGHTING) &&
                        p1_char_1() == p1_char_2() && 
                        p1_char_1_ex() != p1_char_2_ex() &&
                        p1_team_size_char_select() == 2 &&
                        p1_only() &&
                        default_settings() &&
                        trigger_when(game_beaten())
           )

achievement("The Best of the Best", "Finish Pair Match Mode with Dan and Joe without using a continue (default settings).", 25,
            trigger =   is_arcade() &&
                        game_mode() == MODE_PAIR_MATCH &&
                        once(arcade_match() == 0 && game_bgm() == BGM_CHAR_SELECT) &&
                        never(p1_dont_have_char(characters["Dan"]) && p1_won_match()) &&
                        never(p1_dont_have_char(characters["Joe"]) && p1_won_match()) &&
                        p1_team_has_char(characters["Dan"]) &&
                        p1_team_has_char(characters["Joe"]) &&
                        never(p2_won_match()) &&
                        p1_only() &&
                        default_settings() &&
                        trigger_when(game_beaten())
           )

achievement("Street Fighter Mode", "Finish the game using only Capcom characters while on Capcom groove and on Dash mode (default settings).", 5,
            trigger =   is_arcade() &&
                        once(arcade_match() == 0 && game_state() == GS_FIGHTING) &&
                        never_has_snk_chars() &&
                        p1_groove() == 0 &&
                        never(p1_groove() != 0 && p1_won_match()) &&
                        settings_dash_enabled() == 1 &&
                        p1_only() &&
                        default_settings() &&
                        trigger_when(game_beaten())
           )

achievement("KoF Mode", "Finish the game using only SNK characters while on SNK groove and on Run mode (default settings).", 5,
            trigger =   is_arcade() &&
                        once(arcade_match() == 0 && game_state() == GS_FIGHTING) &&
                        never_has_capcom_chars() &&
                        p1_groove() == 1 &&
                        never(p1_groove() != 1 && p1_won_match()) &&
                        settings_run_enabled() == 1 &&
                        p1_only() &&
                        default_settings() &&
                        trigger_when(game_beaten())
           )

achievement("Outsider", "Defeat Morrigan or Nakoruru during any arcade mode (default settings).", 5,
            trigger =   is_arcade() &&
                        p1_only() &&
                        __ornext(p2_current_character() == characters["Morrigan"] || p2_current_character() == characters["Nakoruru"]) &&
                        p1_won_match() &&
                        default_settings()
           )

achievement("Dark Energy", "Defeat Gouki during any arcade mode (default settings).", 25,
            trigger =   is_arcade() &&
                        p1_only() &&
                        p2_current_character() == characters["Gouki"] &&
                        p1_won_match() &&
                        default_settings()
           )

function finish_tag_team(title, char1, char2) {
    achievement(title, format("Finish the game using only {0} and {1} (default settings).", char1, char2), 10,
            trigger =   is_arcade() &&
                        p1_only() &&
                        once(arcade_match() == 0 && game_bgm() == BGM_CHAR_SELECT) &&
                        never(p1_dont_have_char(characters[char1]) && p1_won_match()) &&
                        never(p1_dont_have_char(characters[char2]) && p1_won_match()) &&
                        p1_team_has_char(characters[char1]) &&
                        p1_team_has_char(characters[char2]) &&
                        p1_team_size_char_select() == 2 &&
                        default_settings() &&
                        trigger_when(game_beaten())
           )
}

function finish_trio_team(title, char1, char2, char3) {
    achievement(title, format("Finish the game using only {0}, {1} and {2} (default settings).", char1, char2, char3), 10,
            trigger =   is_arcade() &&
                        p1_only() &&
                        once(arcade_match() == 0 && game_bgm() == BGM_CHAR_SELECT) &&
                        never(p1_dont_have_char(characters[char1]) && p1_won_match()) &&
                        never(p1_dont_have_char(characters[char2]) && p1_won_match()) &&
                        never(p1_dont_have_char(characters[char3]) && p1_won_match()) &&
                        p1_team_has_char(characters[char1]) &&
                        p1_team_has_char(characters[char2]) &&
                        p1_team_has_char(characters[char3]) &&
                        p1_team_size_char_select() == 3 &&
                        default_settings() &&
                        trigger_when(game_beaten())
           )
}

function finish_quad_team(title, char1, char2, char3, char4) {
    achievement(title, format("Finish the game using only {0}, {1}, {2} and {3} (default settings).", char1, char2, char3, char4), 10,
            trigger =   is_arcade() &&
                        p1_only() &&
                        once(arcade_match() == 0 && game_bgm() == BGM_CHAR_SELECT) &&
                        never(p1_dont_have_char(characters[char1]) && p1_won_match()) &&
                        never(p1_dont_have_char(characters[char2]) && p1_won_match()) &&
                        never(p1_dont_have_char(characters[char3]) && p1_won_match()) &&
                        never(p1_dont_have_char(characters[char4]) && p1_won_match()) &&
                        p1_team_has_char(characters[char1]) &&
                        p1_team_has_char(characters[char2]) &&
                        p1_team_has_char(characters[char3]) &&
                        p1_team_has_char(characters[char4]) &&
                        p1_team_size_char_select() == 4 &&
                        default_settings() &&
                        trigger_when(game_beaten())
           )
}

finish_tag_team("Mighty Protagonists", "Ryu", "Kyo")
finish_tag_team("USA Heroes", "Ken", "Terry")
finish_tag_team("The Young and The Emperor ", "Sagat", "Joe")
finish_tag_team("The Queen of Fighters", "Chun-Li", "Mai")
finish_tag_team("Wrestling Force", "Zangief", "Raiden")
finish_tag_team("Beauty Admirers", "Balrog (Claw)", "Benimaru")
finish_tag_team("Justice For All", "Guile", "Kim")
finish_tag_team("Crime Lords", "Vega (Dictator)", "Geese")
finish_tag_team("Satsui no Hado", "Evil Ryu", "Gouki")
finish_tag_team("Grandmasters", "M. Bison (Boxer)", "Balrog (Claw)")
finish_tag_team("CvS Outsiders", "Morrigan", "Nakoruru")
finish_tag_team("Wild Flowers", "Sakura", "Yuri")
finish_tag_team("Satsui-Orochi Power", "Gouki", "Rugal")
finish_tag_team("Evil Awakening", "Evil Ryu", "Orochi Iori")
finish_tag_team("Double Hakkeshu", "Vice", "Yamazaki")
finish_tag_team("Treasure Guardians", "Kyo", "Iori")

finish_trio_team("World Warriors", "E. Honda", "Dhalsim", "Blanka")
finish_trio_team("Art of Fighting", "Ryo", "Yuri", "King")

finish_quad_team("Sakura and Friends", "Sakura", "Dan", "Blanka", "Cammy")



// =========================================
//            Super Combo Finishes              
// =========================================

function super_combo_lv3_character(title, char, points) {
    achievement(title, format("Finish a round against the CPU with a Level-3 Super Special Move as {0}.", char), points,
                trigger =   is_arcade() &&
                            p1_only() &&
                            p1_current_character() == characters[char] &&
                            p1_super_combo_finishes() > prev(p1_super_combo_finishes()) &&
                            p1_last_move_strength() == 2
                        )
}


super_combo_lv3_character("Shinkuu Hadouken", "Ryu", 4)
super_combo_lv3_character("Shinryuuken", "Ken", 4)
super_combo_lv3_character("Senretsu Kyaku", "Chun-Li", 4)
super_combo_lv3_character("Somersault Strike", "Guile", 4)
super_combo_lv3_character("Final Atomic Buster", "Zangief", 4)
super_combo_lv3_character("Yoga Volcano", "Dhalsim", 4)
super_combo_lv3_character("Oni Musou", "E. Honda", 4)
super_combo_lv3_character("Shout of Earth", "Blanka", 4)
super_combo_lv3_character("Flying Barcelona Special", "Balrog (Claw)", 4)
super_combo_lv3_character("Tiger Raid", "Sagat", 4)
super_combo_lv3_character("Heartbreak Despair", "Vega (Dictator)", 4)
super_combo_lv3_character("Shinkuu Hadou Ken", "Sakura", 4)
super_combo_lv3_character("Spin Drive Smasher", "Cammy", 4)
super_combo_lv3_character("Shun Goku Satsu", "Gouki", 4)
super_combo_lv3_character("Valkyrie Turn", "Morrigan", 4)
super_combo_lv3_character("Messatsu Gou Shouryuu", "Evil Ryu", 4)
super_combo_lv3_character("Saishuu Kessen Ougi \"Mu Shiki\"", "Kyo", 4)
super_combo_lv3_character("Ura 108 Shiki: Ya Sakazuki", "Iori", 4)
super_combo_lv3_character("Buster Wolf", "Terry", 4)
super_combo_lv3_character("Haou Shoukou Ken", "Ryo", 4)
super_combo_lv3_character("Beni Suzaku", "Mai", 4)
super_combo_lv3_character("Hou'ou Kyaku", "Kim", 4)
super_combo_lv3_character("Deadly Rave", "Geese", 4)
super_combo_lv3_character("Drill", "Yamazaki", 4)
super_combo_lv3_character("Destruction Drop", "Raiden", 4)
super_combo_lv3_character("Total Annihilation", "Rugal", 4)
super_combo_lv3_character("Negative Gain", "Vice", 4)
super_combo_lv3_character("Denei Spark", "Benimaru", 4)
super_combo_lv3_character("Hien Rekkou", "Yuri", 4)
super_combo_lv3_character("Silent Flash", "King", 4)
super_combo_lv3_character("Shirikoro Kamui Nomi", "Nakoruru", 4)
super_combo_lv3_character("Kin 1211 Shiki: Ya Otome", "Orochi Iori", 4)
super_combo_lv3_character("Gigaton Blow", "M. Bison (Boxer)", 4)
super_combo_lv3_character("Kouryuu Rekka", "Dan", 4)
super_combo_lv3_character("Screw Upper", "Joe", 4)