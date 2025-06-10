// Street Fighter Alpha Anthology
// #ID = 20609

// =========================================
//           General Memory Functions         
// =========================================

function general_game_bgm_sfa2_gold_sfa3_and_upper() => dword(0x15DB68)
function general_in_game() => bit0(0x19D0824)
function general_current_game() => byte(0x19D084E)
         GAME_SFA1 = 0x00
         GAME_SFA2 = 0x07
         GAME_SFA2GOLD = 0x05
         GAME_SFA3 = 0x02
         GAME_SFA3UPPER = 0x04
         GAME_GEMFIGHTER = 0x06
         GAME_HYPER = 0x08

         // Game Mode Consts
         GM_ARCADE = 0x00
         GM_VERSUS = 0x01
         GM_SURVIVAL = 0x02
         GM_DRAMATIC = 0x03
         GM_TRAINING = 0x04


// =========================================
//           SFA1 Memory Functions         
// =========================================

// Game
function sfa1_game_bgm() => dword(0xF13018)
function sfa1_game_mode() => byte(0x604800)
function sfa1_game_survival_mode_0xff_flag() => byte(0x60AE4F)
function sfa1_game_dramatic_battle_0xff_flag() => byte(0x60AE52)
function sfa1_game_arcade_match() => byte(0x60AE12)

function sfa1_game_players_active_connected_p1() => bit0(0x6081A8)
function sfa1_game_players_active_connected_p2() => bit1(0x6081A8)

function sfa1_round_super_combo_level_finish() => byte(0x602776)
function sfa1_round_timer() => byte(0x60AE09)
function sfa1_round_winner_p1() => bit0(0x60AE0C)
function sfa1_round_winner_p2() => bit1(0x60AE0C)
function sfa1_round_super_combo_finish_background_timer() => byte(0x60AE24)

// P1
function sfa1_p1_hp() => byte(0x608440)
function sfa1_p1_character() => byte(0x6084A2)
function sfa1_p1_special_bar() => byte(0x6084BE)

function sfa1_p1_score() => dword(0x6084B0)
function sfa1_p1_consecutive_wins() => byte(0x6084B8)
function sfa1_p1_hit_combo() => byte(0x608857)
function sfa1_p1_max_combo() => byte(0x6084C4)
function sfa1_p1_rounds_won() => byte(0x6084C6)
function sfa1_p1_move() => byte(0x608533)
function sfa1_p1_round_win_type() => byte(0x608540)
function sfa1_p1_performing_a_super_combo() => byte(0x60861F)

function sfa1_p1_combo_damage_dealth() => byte(0x608961)
function sfa1_p1_super_combo_level_finish() => byte(0x608962)

// P2
function sfa1_p2_hp() => byte(0x608840)
function sfa1_p2_character() => byte(0x6088A2)
function sfa1_p2_special_bar() => byte(0x6088BE)

// Settings
function sfa1_settings_difficulty() => byte(0x19D115C)
function sfa1_settings_damage_level() => byte(0x19D115D)
function sfa1_settings_timer_speed() => byte(0x19D115E)
function sfa1_settings_max_round() => byte(0x19D1160)

function sfa1_default_settings() {
    return(
        sfa1_settings_difficulty() >= 1 &&
        sfa1_settings_damage_level() == 1 &&
        sfa1_settings_timer_speed() == 1 &&
        sfa1_settings_max_round() == 1 &&
        sfa1_extra_option() == 0
    )
}

function sfa1_default_settings_type2() {
    return(
        sfa1_settings_damage_level() == 1 &&
        sfa1_settings_timer_speed() == 1 &&
        sfa1_settings_max_round() == 1 &&
        sfa1_extra_option_vitality_1p_recover() == 0 &&
        sfa1_extra_option_vitality_2p_recover() == 0
    )
}

function sfa1_extra_option_vitality_1p_recover() => bit0(0x19D1166)
function sfa1_extra_option_vitality_2p_recover() => bit1(0x19D1166)
function sfa1_extra_option() => tbyte(0x19D1166) // 24 bits


// =========================================
//           SFA2 Memory Functions         
// =========================================

// Game
function sfa2only_game_bgm() => dword(0x1451418)

function sfa2_game_mode() => byte(0x805600)
function sfa2_game_mode_special() => byte(0x80815E)
function sfa2_game_dramatic_battle() => bit0(0x80816C)
function sfa2_game_arcade_match() => byte(0x808114)
function sfa2_game_ending_trigger() => byte(0x808106)

function sfa2_game_players_active_connected_p1() => bit0(0x8080A8)
function sfa2_game_players_active_connected_p2() => bit1(0x8080A8)

function sfa2_round_timer() => byte(0x808109)

// P1
function sfa2_p1_hp() => byte(0x808450)
function sfa2_p1_character() => byte(0x808482)
function sfa2_p1_score() => byte(0x808490)
function sfa2_p1_special_bar() => byte(0x80849E)
function sfa2_p1_max_combo() => byte(0x8084A4)
function sfa2_p1_rounds_won() => byte(0x8084A6)
function sfa2_p1_move() => byte(0x808533)
function sfa2_p1_round_win_type() => byte(0x808540)
function sfa2_p1_hit_combo() => byte(0x80885E)

// P2
function sfa2_p2_hp() => byte(0x808850)
function sfa2_p2_character() => byte(0x808882)

// Settings
function sfa2_settings_difficulty() => byte(0x8080A0)
function sfa2_settings_damage_level() => byte(0x8080A1)
function sfa2_settings_timer_speed() => byte(0x8080A2)
function sfa2_settings_max_round() => byte(0x8080A4)

function sfa2_extra_option_vitality_1p_recover() => bit0(0x805755)
function sfa2_extra_option_vitality_2p_recover() => bit1(0x805755)
function sfa2_extra_option() => word(0x805755)

function sfa2_default_settings() {
    return(
        sfa2_settings_difficulty() >= 3 &&
        sfa2_settings_damage_level() == 1 &&
        sfa2_settings_timer_speed() == 0 &&
        sfa2_settings_max_round() == 2 &&
        sfa2_extra_option() == 0
    )
}

function sfa2_default_settings_type2() {
    return(
        sfa2_settings_damage_level() == 1 &&
        sfa2_settings_timer_speed() == 0 &&
        sfa2_settings_max_round() == 2 &&
        sfa2_extra_option_vitality_1p_recover() == 0 &&
        sfa2_extra_option_vitality_2p_recover() == 0
    )
}

sfa2_characters = {
   "Ryu": 0,
   "Ken": 1,
   "Akuma": 2,
   "Charlie": 3,
   "Chun-Li": 4,
   "Adon": 5,
   "Sodom": 6,
   "Guy": 7,
   "Birdie": 8,
   "Rose": 9,
   "M. Bison": 10,
   "Sagat": 11,
   "Dan": 12,
   "Sakura": 13,
   "Rolento": 14,
   "Dhalsim": 15,
   "Zangief": 16,
   "Gen": 17,
   "Chun-Li (Classic)": 18,
   "Gen (Crane)": 19,
   "Shin Akuma": 20,
   "SF2-Zangief": 21,
   "SF2-Dhalsim": 22,
   "Evil Ryu": 23,
   "SF2-M.Bison": 24,
   "SF2-Sagat": 25,
   "SF2-Ken": 26,
   "SF2-Ryu": 27,
   "SF2-Chun-Li": 28,
   "Alt Sakura": 29,
   "Cammy": 30,
}

// =========================================
//           SFA3 Memory Functions         
// =========================================

// Game
function sfa3_game_mode() => byte(0x904000)
function sfa3_game_survival_mode_flag_0xff() => byte(0x90854b)
function sfa3_game_arcade_match() => byte(0x908114)
function sfa3_game_rival_dialogue() => byte(0x90813F)
function sfa3_game_opponents_defeated_ladder() => dword(0x908540)
function sfa3_game_ending_trigger() => byte(0x908106)

function sfa3_game_players_active_connected_p1() => bit0(0x9080A8)
function sfa3_game_players_active_connected_p2() => bit1(0x9080A8)

function sfa3_round_timer() => byte(0x908109)
function sfa3_round_winner() => byte(0x90810c)
function sfa3_match_super_combo_finisher_timer() => byte(0x908124)

// P1
function sfa3_p1_consecutive_wins() => byte(0x908137)
function sfa3_p1_dramatic_mode() => bit0(0x908168)
function sfa3_p1_move_type() => byte(0x908406)
function sfa3_p1_hp() => byte(0x908450)
function sfa3_p1_performing_a_move() => bit0(0x9084A9)
function sfa3_p1_move() => byte(0x9084AA)
function sfa3_p1_round_win_type() => low4(0x9084B4)
function sfa3_p1_character() => byte(0x908502)
function sfa3_p1_score() => dword(0x908510)
function sfa3_p1_special_bar() => byte(0x90851E)
function sfa3_p1_fighting_style() => byte(0x908523)
function sfa3_p1_rounds_won() => byte(0x908526)

function sfa3_p1_mazi_mode() => byte(0x90855A)
function sfa3_p1_classic_mode() => byte(0x90855E)
function sfa3_p1_saikyou_mode() => byte(0x908531)

// P2
function sfa3_p2_hp() => byte(0x908850)
function sfa3_p2_character() => byte(0x908902)

// Settings
function sfa3_settings_difficulty() => byte(0x19D133C)
function sfa3_settings_damage_level() => byte(0x19D133D)
function sfa3_settings_timer_speed() => byte(0x19D133E)
function sfa3_settings_max_round_1p() => byte(0x19D1340)

function sfa3_extra_option_vitality_1p_recover() => bit0(0x19D1346)
function sfa3_extra_option_vitality_2p_recover() => bit1(0x19D1346)
function sfa3_extra_option() => tbyte(0x19D1346)

function sfa3_default_settings() {
    return(
        sfa3_settings_difficulty() >= 4 &&
        sfa3_settings_damage_level() == 1 &&
        sfa3_settings_timer_speed() == 1 &&
        sfa3_settings_max_round_1p() == 1 &&
        sfa3_extra_option() == 0
    )
}

function sfa3_default_settings_type2() {
    return(
        sfa3_settings_damage_level() == 1 &&
        sfa3_settings_timer_speed() == 1 &&
        sfa3_extra_option_vitality_1p_recover() == 0 &&
        sfa3_extra_option_vitality_2p_recover() == 0
    )
}

// =========================================
//        SFA3 Upper Memory Functions       
// =========================================

// Game
function sfa3_upper_game_mode() => byte(0xa04000)
function sfa3_upper_game_survival_mode_flag_0xff() => byte(0xa0854b)
function sfa3_upper_game_arcade_match() => byte(0xa08114)
function sfa3_upper_game_rival_dialogue() => byte(0xa0813F)
function sfa3_upper_game_opponents_defeated_ladder() => dword(0xa08540)
function sfa3_upper_game_ending_trigger() => byte(0xa08106)

function sfa3_upper_game_players_active_connected_p1() => bit0(0xa080A8)
function sfa3_upper_game_players_active_connected_p2() => bit1(0xa080A8)

function sfa3_upper_round_timer() => byte(0xa08109)
function sfa3_upper_round_winner() => byte(0xa0810c)
function sfa3_upper_match_super_combo_finisher_timer() => byte(0xa08124)

// P1
function sfa3_upper_p1_consecutive_wins() => byte(0xa08137)
function sfa3_upper_p1_dramatic_mode() => bit0(0xa08168)
function sfa3_upper_p1_move_type() => byte(0xa08406)
function sfa3_upper_p1_hp() => byte(0xa08450)
function sfa3_upper_p1_performing_a_move() => bit0(0xa084A9)
function sfa3_upper_p1_move() => byte(0xa084AA)
function sfa3_upper_p1_round_win_type() => low4(0xa084B4)
function sfa3_upper_p1_character() => byte(0xa08502)
function sfa3_upper_p1_score() => dword(0xa08510)
function sfa3_upper_p1_special_bar() => byte(0xa0851E)
function sfa3_upper_p1_fighting_style() => byte(0xa08523)
function sfa3_upper_p1_rounds_won() => byte(0xa08526)

function sfa3_upper_p1_mazi_mode() => byte(0xa0855A)
function sfa3_upper_p1_classic_mode() => byte(0xa0855E)
function sfa3_upper_p1_saikyou_mode() => byte(0xa08531)

// P2
function sfa3_upper_p2_hp() => byte(0xa08850)
function sfa3_upper_p2_character() => byte(0xa08902)

// Settings
function sfa3_upper_settings_difficulty() => byte(0x19D1F5C)
function sfa3_upper_settings_damage_level() => byte(0x19D1F5D)
function sfa3_upper_settings_timer_speed() => byte(0x19D1F5E)
function sfa3_upper_settings_max_round_1p() => byte(0x19D1F60)

function sfa3_upper_extra_option_vitality_1p_recover() => bit0(0x19D1F66)
function sfa3_upper_extra_option_vitality_2p_recover() => bit1(0x19D1F66)
function sfa3_upper_extra_option() => tbyte(0x19D1F66)

function sfa3_upper_default_settings() {
    return(
        sfa3_upper_settings_difficulty() >= 4 &&
        sfa3_upper_settings_damage_level() == 1 &&
        sfa3_upper_settings_timer_speed() == 1 &&
        sfa3_upper_settings_max_round_1p() == 1 &&
        sfa3_upper_extra_option() == 0
    )
}

function sfa3_upper_default_settings_type2() {
    return(
        sfa3_upper_settings_damage_level() == 1 &&
        sfa3_upper_settings_timer_speed() == 1 &&
        sfa3_upper_extra_option_vitality_1p_recover() == 0 &&
        sfa3_upper_extra_option_vitality_2p_recover() == 0
    )
}

// function sfa3_upper_game_mode() => byte(0xA04200)
// function sfa3_upper_game_players_active_connected_p1() => bit0(0xA080A8)
// function sfa3_upper_game_players_active_connected_p2() => bit1(0xA080A8)
// function sfa3_upper_round_timer() => byte(0xA08109)
// function sfa3_upper_game_arcade_match() => byte(0xA08114)
// function sfa3_upper_match_super_combo_finisher_timer() => byte(0xA08124)
// function sfa3_upper_p1_consecutive_wins() => byte(0xA08137)
// function sfa3_upper_game_rival_dialogue() => byte(0xA0813F)
// function sfa3_upper_p1_dramatic_mode() => bit0(0xA08168)
// function sfa3_upper_p1_hp() => byte(0xA08450)
// function sfa3_upper_p1_performing_a_move() => bit0(0xA084A9)
// function sfa3_upper_p1_move() => byte(0xA084AA)
// function sfa3_upper_p1_round_win_type() => byte(0xA084B4)
// function sfa3_upper_p1_character() => byte(0xA08502)
// function sfa3_upper_p1_special_bar() => byte(0xA0851E)
// function sfa3_upper_p1_fighting_style() => byte(0xA08523)
// function sfa3_upper_p1_rounds_won() => byte(0xA08526)
// function sfa3_upper_p1_saikyou_mode() => byte(0xA08531)
// function sfa3_upper_game_opponents_defeated_ladder() => dword(0xA08540)
// function sfa3_upper_p1_survival_mode_flag_0x00_0xff() => byte(0xA08549)
// function sfa3_upper_p1_mazi_mode() => byte(0xA0855A)
// function sfa3_upper_p1_classic_mode() => byte(0xA0855E)
// function sfa3_upper_p2_hp() => byte(0xA08850)
// function sfa3_upper_p2_character() => byte(0xA08902)

sfa3_characters = {
   "Ryu": 0,
   "Ken": 1,
   "Akuma": 2,
   "Charlie": 3,
   "Chun-Li": 4,
   "Adon": 5,
   "Sodom": 6,
   "Guy": 7,
   "Birdie": 8,
   "Rose": 9,
   "M. Bison": 10,
   "Sagat": 11,
   "Dan": 12,
   "Sakura": 13,
   "Rolento": 14,
   "Dhalsim": 15,
   "Zangief": 16,
   "Gen": 17,
   "Classic Chun-Li": 18,
   "Gen (Crane)": 19,
   "Katana": 20,
   "Balrog": 21,
   "Cammy": 22,
   "Evil Ryu": 23,
   "E. Honda": 24,
   "Blanka": 25,
   "R. Mika": 26,
   "Cody": 27,
   "Vega": 28,
   "Karin": 29,
   "Juli": 30,
   "Juni": 31,
   "Guile": 32,
   "Fei-Long": 33,
   "Dee Jay": 34,
   "T. Hawk": 35,
   "Shin Akuma": 36,
   "EX Balrog": 37
}

// =========================================
//           Hyper Memory Functions         
// =========================================

function hyper_game_mode() => byte(0xB84200)
function hyper_game_players_active_connected_p1() => bit0(0xB880A8)
function hyper_game_players_active_connected_p2() => bit1(0xB880A8)

function hyper_p1_move() => byte(0xB884AA)
function hyper_p1_character() => byte(0xB88502)
function hyper_p1_fighting_style() => byte(0xB88532)
function hyper_p2_character() => byte(0xB88902)

// =========================================
//        GemFighter Memory Functions         
// =========================================

// Game
function gem_fighter_game_mode() => byte(0x665330)
function gem_fighter_game_arcade_match() => byte(0x668192)
function gem_fighter_game_ending_trigger() => byte(0x668186)

function gem_fighter_game_players_active_connected_p1() => bit0(0x668128)
function gem_fighter_game_players_active_connected_p2() => bit1(0x668128)

function gem_fighter_round_timer() => byte(0x668188)

// P1
function gem_fighter_p1_hp() => byte(0x668440)
function gem_fighter_p1_last_move() => byte(0x668506)
function gem_fighter_p1_red_bar_level() => byte(0x66858A)
function gem_fighter_p1_yellow_bar_level() => byte(0x66858B)
function gem_fighter_p1_blue_bar_level() => byte(0x66858C)
function gem_fighter_p1_super_move_bar() => byte(0x668594)
function gem_fighter_p1_character() => byte(0x668781)
function gem_fighter_p1_score() => dword(0x668790)
function gem_fighter_p1_consecutive_wins() => byte(0x6687AE)

// P2
function gem_fighter_p2_hp() => byte(0x668840)
function gem_fighter_p2_character() => byte(0x668B81)

// Settings
function gem_fighter_settings_difficulty() => byte(0x19D2DBC)
function gem_fighter_settings_damage_level() => byte(0x19D2DBD)
function gem_fighter_settings_timer_speed() => byte(0x19D2DBE)
function gem_fighter_settings_max_round() => byte(0x19D2DC0)

function gem_fighter_extra_option() => byte(0x19D2DC6)
function gem_fighter_extra_option_vitality_1p_recover() => bit0(0x19D2DC6)
function gem_fighter_extra_option_vitality_2p_recover() => bit1(0x19D2DC6)

function gem_fighter_default_settings() {
    return(
        gem_fighter_settings_difficulty() >= 1 &&
        gem_fighter_settings_damage_level() == 1 &&
        gem_fighter_settings_timer_speed() == 0 &&
        gem_fighter_settings_max_round() == 1 &&
        gem_fighter_extra_option() == 0
    )
}

function gem_fighter_default_settings_type2() {
    return(
        gem_fighter_settings_damage_level() == 1 &&
        gem_fighter_settings_timer_speed() == 0 &&
        gem_fighter_settings_max_round() == 1 &&
        gem_fighter_extra_option_vitality_1p_recover() == 0 &&
        gem_fighter_extra_option_vitality_2p_recover() == 0
    )
}

gem_characters = {
   "Ryu": 0,
   "Ken": 1,
   "Chun-Li": 2,
   "Sakura": 3,
   "Morrigan": 4,
   "Hsien-Ko": 5,
   "Felicia": 6,
   "Tessa": 7,
   "Ibuki": 8,
   "Zangief": 9,
   "Dan": 10,
   "Akuma": 11
}


// =========================================
//             SFA1 Achievements              
// =========================================

function sfa1_achievement_finish_arcade_char(title, char, id) {
    achievement(title, format("[Alpha] Finish Arcade mode as {0} on any difficulty (default Game Options).", char), 10,
                trigger = never(general_current_game() != GAME_SFA1) &&
                          never(general_in_game() == 0) &&
                          never(sfa1_game_players_active_connected_p1() != 1) &&
                          never(sfa1_game_players_active_connected_p2() != 0) &&
                          sfa1_game_mode() == GM_ARCADE &&
                          once(sfa1_game_arcade_match() == 0 && sfa1_p1_character() == sfa3_characters[char]) &&
                          never(sfa1_p1_rounds_won() > prev(sfa1_p1_rounds_won()) && sfa1_p1_character() != sfa3_characters[char]) &&
                          sfa1_p1_character() == sfa3_characters[char] && 
                          trigger_when(sfa1_game_arcade_match() == 8 && prev(sfa1_game_arcade_match()) == 7) &&
                          sfa1_default_settings_type2()
                )
}

achievement("Street Fighter Alpha", "[Alpha] Finish Arcade mode (default settings).", 10, type="progression",
                trigger = never(general_current_game() != GAME_SFA1) &&
                          never(general_in_game() == 0) &&
                          never(sfa1_game_players_active_connected_p1() != 1) &&
                          never(sfa1_game_players_active_connected_p2() != 0) &&
                          sfa1_game_mode() == GM_ARCADE &&
                          sfa1_game_arcade_match() == 8 && prev(sfa1_game_arcade_match()) == 7 &&
                          sfa1_default_settings()
            )

achievement("Warriors' Dreams", "[Alpha] Finish Arcade mode on the hardest difficulty (default settings).", 25,
                trigger = never(general_current_game() != GAME_SFA1) &&
                          never(general_in_game() == 0) &&
                          never(sfa1_game_players_active_connected_p1() != 1) &&
                          never(sfa1_game_players_active_connected_p2() != 0) &&
                          sfa1_game_mode() == GM_ARCADE &&
                          trigger_when(sfa1_game_arcade_match() == 8 && prev(sfa1_game_arcade_match()) == 7) &&
                          sfa1_settings_difficulty() == 7 &&
                          sfa1_default_settings()
            )

sfa1_achievement_finish_arcade_char("You Fought Well. I Was Honored.", "Ryu", 0)
sfa1_achievement_finish_arcade_char("You're Better Than You Look. Try Harder.", "Ken", 0)
sfa1_achievement_finish_arcade_char("This Grows Boring!", "Akuma", 0)
sfa1_achievement_finish_arcade_char("One More Down. On With the War.", "Charlie", 0)
sfa1_achievement_finish_arcade_char("I Don't Have Time for Amateurs!", "Chun-Li", 0)
sfa1_achievement_finish_arcade_char("I Am a Muay Thai Master. You Are Sucking Gravel.", "Adon", 0)
sfa1_achievement_finish_arcade_char("Not Bad. Maybe You Should Work For Me.", "Sodom", 0)
sfa1_achievement_finish_arcade_char("You Can't Beat What You Can't Touch!", "Guy", 0)
sfa1_achievement_finish_arcade_char("Still the Best!", "Birdie", 0)
sfa1_achievement_finish_arcade_char("Power is Nothing Without Skill.", "Rose", 0)
sfa1_achievement_finish_arcade_char("The World Will be Mine!", "M. Bison", 0)
sfa1_achievement_finish_arcade_char("Now Who is the Strongest?", "Sagat", 0)
sfa1_achievement_finish_arcade_char("Keep Your Day Job!", "Dan", 0)


// =========================================
//             SFA2 Achievements              
// =========================================

function sfa2_achievement_finish_arcade_char(title, char, id) {
    achievement(title, format("[Alpha 2] Finish Arcade mode as {0} on any difficulty (default Game Options).", char), 10,
                trigger = never(general_current_game() != GAME_SFA2 && general_current_game() != GAME_SFA2GOLD) &&
                          never(general_in_game() == 0) &&
                          never(sfa2_game_players_active_connected_p1() != 1) &&
                          never(sfa2_game_players_active_connected_p2() != 0) &&
                          sfa2_game_mode() == GM_ARCADE &&
                          once(sfa2_game_arcade_match() == 0 && sfa2_p1_character() == sfa2_characters[char]) &&
                          never(sfa2_p1_rounds_won() > prev(sfa2_p1_rounds_won()) && sfa2_p1_character() != sfa2_characters[char]) &&
                          sfa2_p1_character() == sfa2_characters[char] && 
                          trigger_when(sfa2_game_arcade_match() == 7 && sfa2_game_ending_trigger() > prev(sfa2_game_ending_trigger())) &&
                          sfa2_default_settings_type2()
                )
}


function sfa2_achievement_finish_arcade_char_altversion(title, char1, char2, id) {
    achievement(title, format("[Alpha 2] Finish Arcade mode as {0} on any difficulty (default Game Options).", char1), 10,
                trigger = never(general_current_game() != GAME_SFA2 && general_current_game() != GAME_SFA2GOLD) &&
                          never(general_in_game() == 0) &&
                          never(sfa2_game_players_active_connected_p1() != 1) &&
                          never(sfa2_game_players_active_connected_p2() != 0) &&
                          sfa2_game_mode() == GM_ARCADE &&
                          once(sfa2_game_arcade_match() == 0 && __ornext(sfa2_p1_character() == sfa2_characters[char1] || sfa2_p1_character() == sfa2_characters[char2])) &&
                          never(sfa2_p1_rounds_won() > prev(sfa2_p1_rounds_won()) && sfa2_p1_character() != sfa2_characters[char1] && sfa2_p1_character() != sfa2_characters[char2]) &&
                          __ornext(sfa2_p1_character() == sfa2_characters[char1] || sfa2_p1_character() == sfa2_characters[char2]) && 
                          trigger_when(sfa2_game_arcade_match() == 7 && sfa2_game_ending_trigger() > prev(sfa2_game_ending_trigger())) &&
                          sfa2_default_settings_type2()
                )
}

function sfa2_achievement_finish_arcade_char_altversion2(title, char1, char2, char3, id) {
    achievement(title, format("[Alpha 2] Finish Arcade mode as {0} on any difficulty (default Game Options).", char1), 10,
                trigger = never(general_current_game() != GAME_SFA2 && general_current_game() != GAME_SFA2GOLD) &&
                          never(general_in_game() == 0) &&
                          never(sfa2_game_players_active_connected_p1() != 1) &&
                          never(sfa2_game_players_active_connected_p2() != 0) &&
                          sfa2_game_mode() == GM_ARCADE &&
                          once(sfa2_game_arcade_match() == 0 && __ornext(sfa2_p1_character() == sfa2_characters[char1] || sfa2_p1_character() == sfa2_characters[char2] || sfa2_p1_character() == sfa2_characters[char3])) &&
                          never(sfa2_p1_rounds_won() > prev(sfa2_p1_rounds_won()) && sfa2_p1_character() != sfa2_characters[char1] && sfa2_p1_character() != sfa2_characters[char2] && sfa2_p1_character() != sfa2_characters[char3]) &&
                          __ornext(sfa2_p1_character() == sfa2_characters[char1] || sfa2_p1_character() == sfa2_characters[char2] || sfa2_p1_character() == sfa2_characters[char3]) && 
                          trigger_when(sfa2_game_arcade_match() == 7 && sfa2_game_ending_trigger() > prev(sfa2_game_ending_trigger())) &&
                          sfa2_default_settings_type2()
                )
}


achievement("Street Fighter Alpha 2", "[Alpha 2] Finish Arcade mode (default settings).", 10, type="progression",
                trigger = never(general_current_game() != GAME_SFA2) &&
                          never(general_in_game() == 0) &&
                          never(sfa2_game_players_active_connected_p1() != 1) &&
                          never(sfa2_game_players_active_connected_p2() != 0) &&
                          sfa2_game_mode() == GM_ARCADE &&
                          sfa2_game_arcade_match() == 7 && sfa2_game_ending_trigger() > prev(sfa2_game_ending_trigger()) &&
                          sfa2_default_settings()
            )

achievement("Golden Zero", "[Alpha 2] Finish Arcade mode on the hardest difficulty (default settings).", 25,
                trigger = never(general_current_game() != GAME_SFA2 && general_current_game() != GAME_SFA2GOLD) &&
                          never(general_in_game() == 0) &&
                          never(sfa2_game_players_active_connected_p1() != 1) &&
                          never(sfa2_game_players_active_connected_p2() != 0) &&
                          sfa2_game_mode() == GM_ARCADE &&
                          trigger_when(sfa2_game_arcade_match() == 7 && sfa2_game_ending_trigger() > prev(sfa2_game_ending_trigger())) &&
                          sfa2_settings_difficulty() == 7 &&
                          sfa2_default_settings()
            )


achievement("Street Fighter Alpha: Champion Edition", "[Alpha 2] Finish Arcade Mode using only Champion Edition version of characters on any difficulty (default Game Options).", 10,
                trigger = never(general_current_game() != GAME_SFA2 && general_current_game() != GAME_SFA2GOLD) &&
                          never(general_in_game() == 0) &&
                          never(sfa2_game_players_active_connected_p1() != 1) &&
                          never(sfa2_game_players_active_connected_p2() != 0) &&
                          sfa2_game_mode() == GM_ARCADE &&
                          once(sfa2_game_arcade_match() == 0 && __ornext(
                            sfa2_p1_character() == sfa2_characters["SF2-Zangief"] ||
                            sfa2_p1_character() == sfa2_characters["SF2-Dhalsim"] ||
                            sfa2_p1_character() == sfa2_characters["SF2-M.Bison"] ||
                            sfa2_p1_character() == sfa2_characters["SF2-Sagat"] ||
                            sfa2_p1_character() == sfa2_characters["SF2-Ken"] ||
                            sfa2_p1_character() == sfa2_characters["SF2-Ryu"] ||
                            sfa2_p1_character() == sfa2_characters["SF2-Chun-Li"]
                          )) &&
                          never(sfa2_p1_rounds_won() > prev(sfa2_p1_rounds_won()) && 
                            sfa2_p1_character() == sfa2_characters["SF2-Zangief"] &&
                            sfa2_p1_character() == sfa2_characters["SF2-Dhalsim"] &&
                            sfa2_p1_character() == sfa2_characters["SF2-M.Bison"] &&
                            sfa2_p1_character() == sfa2_characters["SF2-Sagat"] &&
                            sfa2_p1_character() == sfa2_characters["SF2-Ken"] &&
                            sfa2_p1_character() == sfa2_characters["SF2-Ryu"] &&
                            sfa2_p1_character() == sfa2_characters["SF2-Chun-Li"]
                            ) &&
                          __ornext(
                            sfa2_p1_character() == sfa2_characters["SF2-Zangief"] ||
                            sfa2_p1_character() == sfa2_characters["SF2-Dhalsim"] ||
                            sfa2_p1_character() == sfa2_characters["SF2-M.Bison"] ||
                            sfa2_p1_character() == sfa2_characters["SF2-Sagat"] ||
                            sfa2_p1_character() == sfa2_characters["SF2-Ken"] ||
                            sfa2_p1_character() == sfa2_characters["SF2-Ryu"] ||
                            sfa2_p1_character() == sfa2_characters["SF2-Chun-Li"]
                          ) &&
                          trigger_when(sfa2_game_arcade_match() == 7 && sfa2_game_ending_trigger() > prev(sfa2_game_ending_trigger())) &&
                          sfa2_default_settings_type2()
                )


sfa2_achievement_finish_arcade_char_altversion("Now I’ll Find a Better Challenge!", "Ryu", "SF2-Ryu", 0)
sfa2_achievement_finish_arcade_char_altversion("Now You See the Difference between Us!", "Ken", "SF2-Ken", 0)
sfa2_achievement_finish_arcade_char("Now Stay Down!", "Akuma", 0)
sfa2_achievement_finish_arcade_char("Are You Always So Slow?", "Charlie", 0)
sfa2_achievement_finish_arcade_char_altversion2("I Expected Better.", "Chun-Li", "Chun-Li (Classic)", "SF2-Chun-Li", 0)
sfa2_achievement_finish_arcade_char("My Legend Starts Now!", "Adon", 0)
sfa2_achievement_finish_arcade_char("You Will Not Interfere with My Plans!", "Sodom", 0)
sfa2_achievement_finish_arcade_char("Don’t Worry, Everyone Loses to Me!", "Guy", 0)
sfa2_achievement_finish_arcade_char("It’s Good to Be Back!", "Birdie", 0)
sfa2_achievement_finish_arcade_char("Are You Done?", "Rose", 0)
sfa2_achievement_finish_arcade_char_altversion("You Are a Fool to Challenge Me!", "M. Bison", "SF2-M.Bison", 0)
sfa2_achievement_finish_arcade_char_altversion("Do Not Challenge What You Cannot Defeat!", "Sagat", "SF2-Sagat", 0)
sfa2_achievement_finish_arcade_char("For a Loser, You Did Pretty Well.", "Dan", 0)
sfa2_achievement_finish_arcade_char_altversion("Do You Have Time for Another Beating before My Next Class?", "Sakura", "Alt Sakura", 0)
sfa2_achievement_finish_arcade_char("Fear Prevents Learning and You’ve Failed.", "Rolento", 0)
sfa2_achievement_finish_arcade_char_altversion("Action Brings Reaction. Your Fate Has Followed You.", "Dhalsim", "SF2-Dhalsim", 0)
sfa2_achievement_finish_arcade_char_altversion("Hit Me again...please?", "Zangief", "SF2-Zangief", 0)
sfa2_achievement_finish_arcade_char_altversion("Ancient Words of Wisdom...”You Suck”.", "Gen", "Gen (Crane)", 0)
sfa2_achievement_finish_arcade_char("Fell How Weak You Truly Are!", "Shin Akuma", 0)
sfa2_achievement_finish_arcade_char("I Will Show No Mercy!", "Evil Ryu", 0)
sfa2_achievement_finish_arcade_char("Mission Complete! Standing by for the Next Command!", "Cammy", 0)



// =========================================
//             SFA3 Achievements              
// =========================================

function sfa3_achievement_finish_arcade_char(title, char, id) {
    achievement(title, format("[Alpha 3] Finish Arcade mode as {0} on any difficulty and round settings (default Game Options).", char), 5,
                trigger = never(general_in_game() == 0) &&
                          (
                            general_current_game() == GAME_SFA3 &&
                            never(general_current_game() == GAME_SFA3 && sfa3_game_players_active_connected_p1() != 1) &&
                            never(general_current_game() == GAME_SFA3 && sfa3_game_players_active_connected_p2() != 0) &&
                            sfa3_game_mode() == GM_ARCADE &&
                            sfa3_game_survival_mode_flag_0xff() == 0x00 &&
                            sfa3_p1_dramatic_mode() == 0x00 &&
                            sfa3_p1_character() == sfa3_characters[char] && 
                            trigger_when(prior(sfa3_game_opponents_defeated_ladder()) != 0 ) &&
                            trigger_when(sfa3_game_arcade_match() == 9 && sfa3_game_ending_trigger() > prev(sfa3_game_ending_trigger()) && sfa3_round_winner() == 1) &&
                            sfa3_default_settings_type2()
                          ) ||
                          (
                            general_current_game() == GAME_SFA3UPPER &&
                            never(general_current_game() == GAME_SFA3UPPER && sfa3_upper_game_players_active_connected_p1() != 1) &&
                            never(general_current_game() == GAME_SFA3UPPER && sfa3_upper_game_players_active_connected_p2() != 0) &&
                            sfa3_upper_game_mode() == GM_ARCADE &&
                            sfa3_upper_game_survival_mode_flag_0xff() == 0x00 &&
                            sfa3_upper_p1_dramatic_mode() == 0x00 &&
                            sfa3_upper_p1_character() == sfa3_characters[char] && 
                            trigger_when(prior(sfa3_upper_game_opponents_defeated_ladder()) != 0 ) &&
                            trigger_when(sfa3_upper_game_arcade_match() == 9 && sfa3_upper_game_ending_trigger() > prev(sfa3_upper_game_ending_trigger()) && sfa3_upper_round_winner() == 1 ) &&
                            sfa3_upper_default_settings_type2()
                          )
                )
}

function sfa3_achievement_finish_arcade_char_altversion(title, char1, char2, id) {
    achievement(title, format("[Alpha 3] Finish Arcade mode as {0} on any difficulty and round settings (default Game Options).", char1), 5,
                trigger = never(general_in_game() == 0) &&
                          (
                            general_current_game() == GAME_SFA3 &&
                            never(general_current_game() == GAME_SFA3 && sfa3_game_players_active_connected_p1() != 1) &&
                            never(general_current_game() == GAME_SFA3 && sfa3_game_players_active_connected_p2() != 0) &&
                            sfa3_game_mode() == GM_ARCADE &&
                            sfa3_game_survival_mode_flag_0xff() == 0x00 &&
                            sfa3_p1_dramatic_mode() == 0x00 &&
                            __ornext(sfa3_p1_character() == sfa3_characters[char1] || sfa3_p1_character() == sfa3_characters[char2]) &&
                            trigger_when(prior(sfa3_game_opponents_defeated_ladder()) != 0 ) &&
                            trigger_when(sfa3_game_arcade_match() == 9 && sfa3_game_ending_trigger() > prev(sfa3_game_ending_trigger()) && sfa3_round_winner() == 1) &&
                            sfa3_default_settings_type2()
                          ) ||
                          (
                            general_current_game() == GAME_SFA3UPPER &&
                            never(general_current_game() == GAME_SFA3UPPER && sfa3_upper_game_players_active_connected_p1() != 1) &&
                            never(general_current_game() == GAME_SFA3UPPER && sfa3_upper_game_players_active_connected_p2() != 0) &&
                            sfa3_upper_game_mode() == GM_ARCADE &&
                            sfa3_upper_game_survival_mode_flag_0xff() == 0x00 &&
                            sfa3_upper_p1_dramatic_mode() == 0x00 &&
                            __ornext(sfa3_upper_p1_character() == sfa3_characters[char1] || sfa3_upper_p1_character() == sfa3_characters[char2]) && 
                            trigger_when(prior(sfa3_upper_game_opponents_defeated_ladder()) != 0 ) &&
                            trigger_when(sfa3_upper_game_arcade_match() == 9 && sfa3_upper_game_ending_trigger() > prev(sfa3_upper_game_ending_trigger()) && sfa3_upper_round_winner() == 1) &&
                            sfa3_upper_default_settings_type2()
                          )
                )
}

achievement("Street Fighter Alpha 3", "[Alpha 3] Finish Arcade mode (default settings).", 10, type="progression",
                trigger = never(general_in_game() == 0) &&
                          (
                            general_current_game() == GAME_SFA3 &&
                            sfa3_game_players_active_connected_p1() == 1 &&
                            sfa3_game_players_active_connected_p2() == 0 &&
                            sfa3_game_mode() == GM_ARCADE &&
                            sfa3_game_survival_mode_flag_0xff() == 0x00 &&
                            sfa3_p1_dramatic_mode() == 0x00 &&
                            prior(sfa3_game_opponents_defeated_ladder()) != 0  &&
                            sfa3_game_arcade_match() == 9 && sfa3_game_ending_trigger() > prev(sfa3_game_ending_trigger()) && sfa3_round_winner() == 1 &&
                            sfa3_default_settings()
                          )
            )

achievement("Alpha Upper", "[Alpha 3] Finish Arcade mode on the hardest difficulty (default settings).", 25,
                trigger = never(general_in_game() == 0) &&
                          (
                            general_current_game() == GAME_SFA3 &&
                            sfa3_game_players_active_connected_p1() == 1 &&
                            sfa3_game_players_active_connected_p2() == 0 &&
                            sfa3_game_mode() == GM_ARCADE &&
                            sfa3_game_survival_mode_flag_0xff() == 0x00 &&
                            sfa3_p1_dramatic_mode() == 0x00 &&
                            trigger_when(prior(sfa3_game_opponents_defeated_ladder()) != 0 ) &&
                            trigger_when(sfa3_game_arcade_match() == 9 && sfa3_game_ending_trigger() > prev(sfa3_game_ending_trigger()) && sfa3_round_winner() == 1) &&
                            sfa3_default_settings() &&
                            sfa3_settings_difficulty() == 7
                          ) ||
                          (
                            general_current_game() == GAME_SFA3UPPER &&
                            sfa3_upper_game_players_active_connected_p1() == 1 &&
                            sfa3_upper_game_players_active_connected_p2() == 0 &&
                            sfa3_upper_game_mode() == GM_ARCADE &&
                            sfa3_upper_game_survival_mode_flag_0xff() == 0x00 &&
                            sfa3_upper_p1_dramatic_mode() == 0x00 &&
                            trigger_when(prior(sfa3_upper_game_opponents_defeated_ladder()) != 0 ) &&
                            trigger_when(sfa3_upper_game_arcade_match() == 9 && sfa3_upper_game_ending_trigger() > prev(sfa3_upper_game_ending_trigger()) && sfa3_upper_round_winner() == 1) &&
                            sfa3_upper_default_settings() &&
                            sfa3_upper_settings_difficulty() == 7
                          )
            )


achievement("Very Serious Mode", "[Alpha 3] Finish Arcade Mode using only Mazi Mode on any difficulty and round settings (default Game Options).", 10,
                trigger = never(general_in_game() == 0) &&
                          (
                            general_current_game() == GAME_SFA3 &&
                            sfa3_game_players_active_connected_p1() == 1 &&
                            sfa3_game_players_active_connected_p2() == 0 &&
                            sfa3_game_mode() == GM_ARCADE &&
                            sfa3_game_survival_mode_flag_0xff() == 0x00 &&
                            sfa3_p1_dramatic_mode() == 0x00 &&
                            once(sfa3_game_arcade_match() == 0 && sfa3_p1_mazi_mode() == 1) &&
                            never(sfa3_p1_rounds_won() > prev(sfa3_p1_rounds_won()) && sfa3_p1_mazi_mode() != 1) &&
                            sfa3_p1_mazi_mode() == 1 &&
                            trigger_when(prior(sfa3_game_opponents_defeated_ladder()) != 0 ) &&
                            trigger_when(sfa3_game_arcade_match() == 9 && sfa3_game_ending_trigger() > prev(sfa3_game_ending_trigger()) && sfa3_round_winner() == 1) &&
                            sfa3_default_settings_type2()
                          ) ||
                          (
                            general_current_game() == GAME_SFA3UPPER &&
                            sfa3_upper_game_players_active_connected_p1() == 1 &&
                            sfa3_upper_game_players_active_connected_p2() == 0 &&
                            sfa3_upper_game_mode() == GM_ARCADE &&
                            sfa3_upper_game_survival_mode_flag_0xff() == 0x00 &&
                            sfa3_upper_p1_dramatic_mode() == 0x00 &&
                            once(sfa3_upper_game_arcade_match() == 0 && sfa3_upper_p1_mazi_mode() == 1) &&
                            never(sfa3_upper_p1_rounds_won() > prev(sfa3_upper_p1_rounds_won()) && sfa3_upper_p1_mazi_mode() != 1) &&
                            sfa3_upper_p1_mazi_mode() == 1 &&
                            trigger_when(prior(sfa3_upper_game_opponents_defeated_ladder()) != 0 ) &&
                            trigger_when(sfa3_upper_game_arcade_match() == 9 && sfa3_upper_game_ending_trigger() > prev(sfa3_upper_game_ending_trigger()) && sfa3_upper_round_winner() == 1) &&
                            sfa3_upper_default_settings_type2()
                          )
            )


achievement("The Ultimate Fighting Style", "[Alpha 3] Finish Arcade Mode using only Saikyo Mode on any difficulty and round settings (default Game Options).", 10,
                trigger = never(general_in_game() == 0) &&
                          (
                            general_current_game() == GAME_SFA3 &&
                            sfa3_game_players_active_connected_p1() == 1 &&
                            sfa3_game_players_active_connected_p2() == 0 &&
                            sfa3_game_mode() == GM_ARCADE &&
                            sfa3_game_survival_mode_flag_0xff() == 0x00 &&
                            sfa3_p1_dramatic_mode() == 0x00 &&
                            once(sfa3_game_arcade_match() == 0 && sfa3_p1_saikyou_mode() == 1) &&
                            never(sfa3_p1_rounds_won() > prev(sfa3_p1_rounds_won()) && sfa3_p1_saikyou_mode() != 1) &&
                            sfa3_p1_saikyou_mode() == 1 &&
                            trigger_when(prior(sfa3_game_opponents_defeated_ladder()) != 0 ) &&
                            trigger_when(sfa3_game_arcade_match() == 9 && sfa3_game_ending_trigger() > prev(sfa3_game_ending_trigger()) && sfa3_round_winner() == 1) &&
                            sfa3_default_settings_type2()
                          ) ||
                          (
                            general_current_game() == GAME_SFA3UPPER &&
                            sfa3_upper_game_players_active_connected_p1() == 1 &&
                            sfa3_upper_game_players_active_connected_p2() == 0 &&
                            sfa3_upper_game_mode() == GM_ARCADE &&
                            sfa3_upper_game_survival_mode_flag_0xff() == 0x00 &&
                            sfa3_upper_p1_dramatic_mode() == 0x00 &&
                            once(sfa3_upper_game_arcade_match() == 0 && sfa3_upper_p1_saikyou_mode() == 1) &&
                            never(sfa3_upper_p1_rounds_won() > prev(sfa3_upper_p1_rounds_won()) && sfa3_upper_p1_saikyou_mode() != 1) &&
                            sfa3_upper_p1_saikyou_mode() == 1 &&
                            trigger_when(prior(sfa3_upper_game_opponents_defeated_ladder()) != 0 ) &&
                            trigger_when(sfa3_upper_game_arcade_match() == 9 && sfa3_upper_game_ending_trigger() > prev(sfa3_upper_game_ending_trigger()) && sfa3_upper_round_winner() == 1) &&
                            sfa3_upper_default_settings_type2()
                          )
            )


achievement("SFII Alpha", "[Alpha 3] Finish Arcade Mode using only Classic Mode on any difficulty and round settings (default Game Options).", 10,
                trigger = never(general_in_game() == 0) &&
                          (
                            general_current_game() == GAME_SFA3 &&
                            sfa3_game_players_active_connected_p1() == 1 &&
                            sfa3_game_players_active_connected_p2() == 0 &&
                            sfa3_game_mode() == GM_ARCADE &&
                            sfa3_game_survival_mode_flag_0xff() == 0x00 &&
                            sfa3_p1_dramatic_mode() == 0x00 &&
                            once(sfa3_game_arcade_match() == 0 && sfa3_p1_classic_mode() == 1) &&
                            never(sfa3_p1_rounds_won() > prev(sfa3_p1_rounds_won()) && sfa3_p1_classic_mode() != 1) &&
                            sfa3_p1_classic_mode() == 1 &&
                            trigger_when(prior(sfa3_game_opponents_defeated_ladder()) != 0 ) &&
                            trigger_when(sfa3_game_arcade_match() == 9 && sfa3_game_ending_trigger() > prev(sfa3_game_ending_trigger()) && sfa3_round_winner() == 1) &&
                            sfa3_default_settings_type2()
                          ) ||
                          (
                            general_current_game() == GAME_SFA3UPPER &&
                            sfa3_upper_game_players_active_connected_p1() == 1 &&
                            sfa3_upper_game_players_active_connected_p2() == 0 &&
                            sfa3_upper_game_mode() == GM_ARCADE &&
                            sfa3_upper_game_survival_mode_flag_0xff() == 0x00 &&
                            sfa3_upper_p1_dramatic_mode() == 0x00 &&
                            once(sfa3_upper_game_arcade_match() == 0 && sfa3_upper_p1_classic_mode() == 1) &&
                            never(sfa3_upper_p1_rounds_won() > prev(sfa3_upper_p1_rounds_won()) && sfa3_upper_p1_classic_mode() != 1) &&
                            sfa3_upper_p1_classic_mode() == 1 &&
                            trigger_when(prior(sfa3_upper_game_opponents_defeated_ladder()) != 0 ) &&
                            trigger_when(sfa3_upper_game_arcade_match() == 9 && sfa3_upper_game_ending_trigger() > prev(sfa3_upper_game_ending_trigger()) && sfa3_upper_round_winner() == 1) &&
                            sfa3_upper_default_settings_type2()
                          )
            )

sfa3_achievement_finish_arcade_char("Your Strength Is Equal to That of Your Will to Win!", "Ryu", 0)
sfa3_achievement_finish_arcade_char("I Need a Better Workout Then This! Where’s Eliza?!", "Ken", 0)
sfa3_achievement_finish_arcade_char("Fade to Nothingness! You Weakness Disgust Me!", "Akuma", 0)
sfa3_achievement_finish_arcade_char("Tracking a Target Precisely Is a Basic Skill, Critical to Victory!", "Charlie", 0)
sfa3_achievement_finish_arcade_char_altversion("I Need a Vacation! Being an Inspector Isn’t Easy!", "Chun-Li", "Classic Chun-Li", 0)
sfa3_achievement_finish_arcade_char("By Fighting Me, Your Weakness Will Become Legendary!", "Adon", 0)
sfa3_achievement_finish_arcade_char_altversion("Boku Wa Itchy Bun Desu!!", "Sodom", "Katana", 0)
sfa3_achievement_finish_arcade_char("The Eyes of a Bushin... No Movement Can Escape Them!", "Guy", 0)
sfa3_achievement_finish_arcade_char("Oh, What!? ... Before? I Looked Pale Because I Was Sick!!", "Birdie", 0)
sfa3_achievement_finish_arcade_char("Fate Is Fate, Whether or Not You Choose to Accept It!", "Rose", 0)
sfa3_achievement_finish_arcade_char("I Will Crush You!!!", "M. Bison", 0)
sfa3_achievement_finish_arcade_char("I Promised This Scar That I Would Never Be Defeated Again!", "Sagat", 0)
sfa3_achievement_finish_arcade_char("Yahoo! Don’t You Just Love That Phrase!? Yahoo! Yahoo! Yahoo!", "Dan", 0)
sfa3_achievement_finish_arcade_char("I Like Street Fighting Better than Sparring in Rival Schools!", "Sakura", 0)
sfa3_achievement_finish_arcade_char("In My Ideal Nation, There Would Exist No One as Weak as You!", "Rolento", 0)
sfa3_achievement_finish_arcade_char("Peace and Tranquility... This Is the Way of Yoga!", "Dhalsim", 0)
sfa3_achievement_finish_arcade_char("I’m Like a Cyclone... If You Get Too Close You’ll Be Sucked In!", "Zangief", 0)
sfa3_achievement_finish_arcade_char_altversion("The Most Deadly Poison... It Comes from Within!", "Gen", "Gen (Crane)", 0)
sfa3_achievement_finish_arcade_char_altversion("I’ve Met Punching Bags More Fun and Interesting than You!", "Balrog", "EX Balrog", 0)
sfa3_achievement_finish_arcade_char("Target Destroyed! Remaining in Secondary Combat Mode!", "Cammy", 0)
sfa3_achievement_finish_arcade_char("The Darkness Seeks Out Those Who Need It the Most!", "Evil Ryu", 0)
sfa3_achievement_finish_arcade_char("Now You Have Learned the Meaning of Sumo! Dosukoi!", "E. Honda", 0)
sfa3_achievement_finish_arcade_char("Woo! Woow! Wow! Woooow! Wow!", "Blanka", 0)
sfa3_achievement_finish_arcade_char("The Superstar of the Ring... That’s What I Wanna Be!", "R. Mika", 0)
sfa3_achievement_finish_arcade_char("After Waiting So Long, It Feels Good to Do More than Two Moves!", "Cody", 0)
sfa3_achievement_finish_arcade_char("MMMM... That’s Tasty... Just like Red Wine...", "Vega", 0)
sfa3_achievement_finish_arcade_char("“All You Need Is Victory!” That Is the Motto of My Family!", "Karin", 0)
sfa3_achievement_finish_arcade_char("Code Red Aborted.", "Juli", 0)
sfa3_achievement_finish_arcade_char("BP Increased by 200. Updating the Data.", "Juni", 0)
sfa3_achievement_finish_arcade_char("That Was a Sonic Boom That Hit You, Not a Tank!", "Guile", 0)
sfa3_achievement_finish_arcade_char("...? Waa Chaaaaaaaaa!!!", "Fei-Long", 0)
sfa3_achievement_finish_arcade_char("Max out the Music within Your Soul!", "Dee Jay", 0)
sfa3_achievement_finish_arcade_char("Never Defy the Elements of Nature!", "T. Hawk", 0)
sfa3_achievement_finish_arcade_char("To Challenge Me Is to Respect Chaos, and to Respect Death!", "Shin Akuma", 0)




// =========================================
//          GemFighters Achievements              
// =========================================

function gem_achievement_finish_arcade_char(title, char, id) {
    achievement(title, format("[Gem Fighter] Finish Arcade mode as {0} on any difficulty (default Game Options).", char), 10,
                trigger = never(general_current_game() != GAME_GEMFIGHTER) &&
                          never(general_in_game() == 0) &&
                          never(gem_fighter_game_players_active_connected_p1() != 1) &&
                          never(gem_fighter_game_players_active_connected_p2() != 0) &&
                          gem_fighter_game_mode() == GM_ARCADE &&
                          gem_fighter_p1_character() == gem_characters[char] && 
                          trigger_when(gem_fighter_game_arcade_match() == 7 && gem_fighter_game_ending_trigger() > prev(gem_fighter_game_ending_trigger())) &&
                          gem_fighter_default_settings_type2()
                )
}

achievement("Super Gem Fighter", "[Gem Fighter] Finish Arcade mode (default settings).", 10, type="progression",
                trigger = never(general_current_game() != GAME_GEMFIGHTER) &&
                          never(general_in_game() == 0) &&
                          never(gem_fighter_game_players_active_connected_p1() != 1) &&
                          never(gem_fighter_game_players_active_connected_p2() != 0) &&
                          gem_fighter_game_mode() == GM_ARCADE &&
                          gem_fighter_game_arcade_match() == 7 && gem_fighter_game_ending_trigger() > prev(gem_fighter_game_ending_trigger()) &&
                          gem_fighter_default_settings()
            )

achievement("Mini Max Mix", "[Gem Fighter] Finish Arcade mode on the hardest difficulty (default settings).", 25,
                trigger = never(general_current_game() != GAME_GEMFIGHTER) &&
                          never(general_in_game() == 0) &&
                          never(gem_fighter_game_players_active_connected_p1() != 1) &&
                          never(gem_fighter_game_players_active_connected_p2() != 0) &&
                          gem_fighter_game_mode() == GM_ARCADE &&
                          trigger_when(gem_fighter_game_arcade_match() == 7 && gem_fighter_game_ending_trigger() > prev(gem_fighter_game_ending_trigger())) &&
                          gem_fighter_settings_difficulty() == 7 &&
                          gem_fighter_default_settings()
            )

gem_achievement_finish_arcade_char("I Must Keep Searching for Someone Stronger than I!", "Ryu", 10)
gem_achievement_finish_arcade_char("You’ll Never Win with Tiny Kicks Like Yours!", "Ken", 10)
gem_achievement_finish_arcade_char("Nothing Satisfies Me More than Handcuffing the Criminals!", "Chun-Li", 10)
gem_achievement_finish_arcade_char("Don’t Understimate Me Just Because I’m a School Girl!", "Sakura", 10)
gem_achievement_finish_arcade_char("Those Bats around Me? They Hold My Stuff When I Go Shopping!", "Morrigan", 10)
gem_achievement_finish_arcade_char("I Think I Lost an Iron Ball... Can You Help Me Find It?", "Hsien-Ko", 10)
gem_achievement_finish_arcade_char("Hey, That’s So Mean, Stepping on My Tail as a Revenge!", "Felicia", 10)
gem_achievement_finish_arcade_char("Sorry, but I Had to Do This for My Research! Nothing Personal!", "Tessa", 10)
gem_achievement_finish_arcade_char("Train Harder If You Wish to Overcome My Ninja Skills!", "Ibuki", 10)
gem_achievement_finish_arcade_char("Whew! I Had Some Good Exercise! I Think I Have “Borscht” Now!", "Zangief", 10)
gem_achievement_finish_arcade_char("Yahoo! My Saikyo Style Really Rocks!", "Dan", 10)
gem_achievement_finish_arcade_char("You Weren’t Enough Even for a Warm Up!", "Akuma", 10)