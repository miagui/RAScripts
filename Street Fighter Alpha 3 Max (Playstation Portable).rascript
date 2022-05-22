// Street Fighter Alpha 3 Max
// #ID = 2970

// =========================================
//               Memory Acessors              
// =========================================

// Settings
function settings_difficulty() => byte(0xe7593d)
function settings_time() => byte(0xA058DD)
function settings_round() => byte(0xe7595c)
function settings_damage() => byte(0xe7593e)
function settings_speed() => word(0xe75940)
function settings_player_side() => byte(0xAD8FE4)

// Game
function game_igt() => dword(0xA05908)
function game_state() => dword(0xE75910)
         gs_playing = 0x00020001
function game_state_complementary() => word(0xE75914)
function game_players_active() => byte(0xE75945)

function game_bgm() => byte(0x12E128C)
function game_stage() => byte(0x12E1228)
function game_stage_c1() => byte(0xE75C50)
function game_stage_c2() => byte(0x12E89F8)

function game_current_match() => byte(0x12E123C)
function game_matches_won() => byte(0x12e125f)
function game_screen() => byte(0x12E1254)

function training_combo_damage() => byte(0x150ff82)

// Game Modes
function game_mode_playing() => byte(0xE75982)
         gm_arcade = 0x00
         gm_vs_mode = 0x01
         gm_training = 0x02
         gm_world_tour = 0x03
         gm_entry_mode = 0x04
         gm_option_mode = 0x05
         gm_survival_mode = 0x07
         gm_dramatic_battle = 0x08
         gm_final_battle = 0x09
         gm_score_ranking = 0x0b
         gm_network = 0x0c
         gm_edit_mode = 0x0e
         gm_variable_battle = 0x0f
         gm_free_battle = 0x10
         gm_reverse_dramatic_battle = 0x11
         gm_vs_100_kumite = 0x12

function survival_mode_playing() => byte(0x12E1277)
         sm_arcade = 0x01
         sm_original = 0x02
         sm_boss = 0x03
         sm_dramatic = 0x04
         sm_variable = 0x05
         sm_reverse_dramatic_arcade = 0x06
         sm_reverse_dramatic_survival = 0x07
         sm_endless = 0x08
         
function survival_mode_timer_mins() => byte(0x15179EC)
function survival_mode_timer_secs() => byte(0x15179ED)
function survival_mode_timer_frames() => byte(0x15179EE)
function survival_mode_wins() => word(0x15179ea)

// Rounds
function round_timer() => byte(0x12E1231)
function round_started() => byte(0x12E1255)

// Slot 1 (default P1)
function slot1_character() => byte(0x12E3FF2)
function slot1_mode() => byte(0x12e4056)
         mode_mazi = 0x01
         mode_saikyou = 0x02
         mode_classic = 0x03
function slot1_fighting_style() => byte(0x12e4013)
         fs_xism = 0xff
         fs_aism = 0x00
         fs_vism = 0x01
         fs_shadaloo = 0x02

function slot1_hp() => byte(0x12E3F10)
function slot1_round_wins() => byte(0x12e4016)
function slot1_current_victory() => low4(0x12e3f98)
function slot1_state() => byte(0x12E4048)

function slot1_hit_combo() => byte(0x12e43b6)
function slot1_move() => byte(0x12e3f8c)
function slot1_move_type() => byte(0x12e3ea6)
function slot1_active_vism() => bit0(0x12e3f9b) == 1
function slot1_attacking() => bit0(0x12E3F8B) == 1
function slot1_special_move() => bit0(0x12E3FA6) == 1

// Slot 2 (default P2)
function slot2_character() => byte(0x12E448A)
function slot2_mode() => byte(0x12e44ee)
function slot2_fighting_style() => byte(0x12e44ab)

function slot2_hp() => byte(0x12E43A8)
function slot2_round_wins() => byte(0x12e44ae)
function slot2_current_victory() => low4(0x12e4430)

function slot2_hit_combo() => byte(0x12e3f1e)
function slot2_move() => byte(0x12e4424)
function slot2_move_type() => byte(0x12e438c)
function slot2_active_vism() => bit0(0x12e4433) == 1

// Slot 3
function slot3_character() => byte(0x12E4922)
function slot3_hp() => byte(0x12E4840)

// Slot 4
function slot4_character() => byte(0x12E4DBA)
function slot4_hp() => byte(0x12E4CD8)

// World Tour
function world_tour_character() => byte(0x1358529)
function world_tour_player_level() => byte(0x135852C)
function world_tour_xism_level() => byte(0x135852D)
function world_tour_aism_level() => byte(0x135852E)
function world_tour_vism_level() => byte(0x135852F)

function world_tour_ism_pluses_bitflags1() => byte(0x1358540)
function world_tour_ism_pluses_bitflags2() => byte(0x1358541)
function world_tour_ism_pluses_bitflags3() => byte(0x1358542)
function world_tour_ism_pluses_bitflags4() => byte(0x1358543)

characters = {
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
   "Gen (Mantis Stance)": 17,
   "Classic Chun-Li": 18,
   "Gen (Crane Stance)": 19,
   "Katana (Sodom)": 20,
   "Extra Balrog": 21,
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
   "Balrog": 37,
   "Eagle": 38,
   "Maki": 39,
   "Yun": 40,
   "Ingrid": 41
}

// =========================================
//             Utility Functions              
// =========================================

function all_world_tour_ism_pluses() => sum_of(range(0, 7), b => bit(b,0x1358540))+
                                        sum_of(range(0, 4), b => bit(b,0x1358541))+
                                        sum_of([0, 2], b => bit(b,0x1358542))+
                                        sum_of([1, 3], b => bit(b,0x1358543))

function players_active() => game_players_active() > 0
function p1_active() => game_players_active() == 1
function p2_active() => game_players_active() == 2

function p1_has_won_match() =>  p1_active() && slot1_round_wins() == 2 && prev(slot1_round_wins()) == 1
function p2_has_won_match() =>  p2_active() && slot2_round_wins() == 2 && prev(slot2_round_wins()) == 1

function settings_4stars_3rounds() => settings_difficulty() >= 3 && settings_round() == 1

function protect_button_shortcuts_p1() {
    return (never(settings_player_side() == 0 && word(0xa058a0) >= 15 && word(0xa058a0) <= 53) &&
           never(settings_player_side() == 0 && word(0xa058a2) >= 15 && word(0xa058a2) <= 53) &&
           never(settings_player_side() == 0 && word(0xa058a4) >= 15 && word(0xa058a4) <= 53) &&
           never(settings_player_side() == 0 && word(0xa058a6) >= 15 && word(0xa058a6) <= 53) &&
           never(settings_player_side() == 0 && word(0xa058a8) >= 15 && word(0xa058a8) <= 53) &&
           never(settings_player_side() == 0 && word(0xa058aa) >= 15 && word(0xa058aa) <= 53) &&
           never(settings_player_side() == 0 && word(0xa058ac) >= 15 && word(0xa058a0) <= 53))
}

function protect_button_shortcuts_p2() {
    return (never(settings_player_side() == 1 && word(0xa058b4) >= 15 && word(0xa058b4) <= 53) &&
           never(settings_player_side() == 1 && word(0xa058b6) >= 15 && word(0xa058b6) <= 53) &&
           never(settings_player_side() == 1 && word(0xa058b8) >= 15 && word(0xa058b8) <= 53) &&
           never(settings_player_side() == 1 && word(0xa058ba) >= 15 && word(0xa058ba) <= 53) &&
           never(settings_player_side() == 1 && word(0xa058bc) >= 15 && word(0xa058bc) <= 53) &&
           never(settings_player_side() == 1 && word(0xa058be) >= 15 && word(0xa058be) <= 53) &&
           never(settings_player_side() == 1 && word(0xa058c0) >= 15 && word(0xa058c0) <= 53))
}

// TODO: Fix Protection logic not returning correct values.

// function protect_button_shortcuts_p1() {
//     return settings_player_side() == 0 &&
//            (word(0xa058a0) < 15 || word(0xa058a0) > 53) &&
//            (word(0xa058a2) < 15 || word(0xa058a2) > 53) &&
//            (word(0xa058a4) < 15 || word(0xa058a4) > 53) &&
//            (word(0xa058a6) < 15 || word(0xa058a6) > 53) &&
//            (word(0xa058a8) < 15 || word(0xa058a8) > 53) &&
//            (word(0xa058aa) < 15 || word(0xa058aa) > 53) &&
//            (word(0xa058ac) < 15 || word(0xa058ac) > 53)
// }

// function protect_button_shortcuts_p2() {
//     return settings_player_side() == 1 &&
//            (word(0xa058b4) < 15 || word(0xa058b4) > 53) &&
//            (word(0xa058b6) < 15 || word(0xa058b6) > 53) &&
//            (word(0xa058b8) < 15 || word(0xa058b8) > 53) &&
//            (word(0xa058ba) < 15 || word(0xa058ba) > 53) &&
//            (word(0xa058bc) < 15 || word(0xa058bc) > 53) &&
//            (word(0xa058be) < 15 || word(0xa058be) > 53) &&
//            (word(0xa058c0) < 15 || word(0xa058c0) > 53)
// }

// =========================================
//               Progression              
// =========================================

// Normal
achievement("Arcade Mode", "Finish Arcade Mode (4 stars difficulty, 3 rounds).", 10,
            trigger =   game_mode_playing() == gm_arcade &&
                        game_state() == gs_playing &&
                        trigger_when(game_current_match() == 0x09) &&
                        (trigger_when(p1_has_won_match()) || trigger_when(p2_has_won_match())) &&
                        settings_4stars_3rounds())

achievement("Variable Battle", "Finish Variable Battle (4 stars difficulty, 3 rounds).", 10,
            trigger =   game_mode_playing() == gm_variable_battle &&
                        game_state() == gs_playing &&
                        trigger_when(game_current_match() == 0x09) &&
                        (trigger_when(p1_has_won_match()) || trigger_when(p2_has_won_match())) &&
                        settings_4stars_3rounds())

achievement("Dramatic Battle", "Finish Dramatic Battle (4 stars difficulty, 3 rounds).", 10,
            trigger =   game_mode_playing() == gm_dramatic_battle &&
                        game_state() == gs_playing &&
                        trigger_when(game_current_match() == 0x09) &&
                        (trigger_when(p1_has_won_match()) || trigger_when(p2_has_won_match())) &&
                        settings_4stars_3rounds())

achievement("Reverse Dramatic Battle", "Finish Reverse Dramatic Battle (4 stars difficulty, 3 rounds).", 10,
            trigger =   game_mode_playing() == gm_reverse_dramatic_battle &&
                        game_state() == gs_playing &&
                        trigger_when(game_current_match() == 0x09) &&
                        (trigger_when(p1_has_won_match()) || trigger_when(p2_has_won_match())) &&
                        settings_4stars_3rounds())

// Survival
achievement("Variable Survival Mode", "Finish Survival Mode - Variable (4 stars difficulty).", 25,
            trigger =   game_mode_playing() == gm_survival_mode &&
                        survival_mode_playing() == sm_variable &&
                        game_state() == gs_playing &&
                        trigger_when(game_current_match() == 0x25) &&
                        ((trigger_when(slot1_current_victory() > prev(slot1_current_victory()) && p1_active())) ||
                         (trigger_when(slot2_current_victory() > prev(slot2_current_victory()) && p2_active()))) &&
                        settings_difficulty() >= 3)

achievement("Dramatic Survival Mode", "Finish Survival Mode -  Dramatic (4 stars difficulty).", 25,
            trigger =   game_mode_playing() == gm_survival_mode &&
                        survival_mode_playing() == sm_dramatic &&
                        game_state() == gs_playing &&
                        trigger_when(game_current_match() == 0x25) &&
                        ((trigger_when(slot1_current_victory() > prev(slot1_current_victory()) && p1_active())) ||
                         (trigger_when(slot2_current_victory() > prev(slot2_current_victory()) && p2_active()))) &&
                        settings_difficulty() >= 3)

// =========================================
//               Miscellaneous              
// =========================================

achievement("Super Street Fighter Alpha 3 Turbo", "Finish Arcade Mode with Turbo 7 speed (4 stars difficulty, 3 rounds).", 10,
            trigger =   game_mode_playing() == gm_arcade &&
                        game_state() == gs_playing &&
                        trigger_when(game_current_match() == 0x09) &&
                        (trigger_when(p1_has_won_match()) || trigger_when(p2_has_won_match())) &&
                        settings_speed() == 7 &&
                        settings_4stars_3rounds())

achievement("Time to Get Serious", "Finish Arcade Mode as Ingrid on Mazi Mode (4 stars difficulty, 3 rounds).", 10,
            trigger =   game_mode_playing() == gm_arcade &&
                        once(game_current_match() == 0) &&
                        trigger_when(game_current_match() == 0x09) &&
                        (trigger_when(p1_has_won_match()) || trigger_when(p2_has_won_match())) &&
                        (
                            (p1_active() && slot1_character() == characters["Ingrid"] && slot1_mode() == mode_mazi && never(p1_active() && slot1_mode() != mode_mazi && game_matches_won() > prev(game_matches_won()))) ||
                            (p2_active() && slot2_character() == characters["Ingrid"] && slot2_mode() == mode_mazi && never(p2_active() && slot2_mode() != mode_mazi && game_matches_won() > prev(game_matches_won())))
                         ) &&
                        settings_4stars_3rounds())

achievement("Saikyou Master", "Finish Arcade Mode as Dan on Saikyou Mode (4 stars difficulty, 3 rounds).", 10,
            trigger =   game_mode_playing() == gm_arcade &&
                        once(game_current_match() == 0) &&
                        trigger_when(game_current_match() == 0x09) &&
                        (trigger_when(p1_has_won_match()) || trigger_when(p2_has_won_match())) &&
                        (
                            (p1_active() && slot1_character() == characters["Dan"] && slot1_mode() == mode_saikyou && never(p1_active() && slot1_mode() != mode_saikyou && game_matches_won() > prev(game_matches_won()))) ||
                            (p2_active() && slot2_character() == characters["Dan"] && slot2_mode() == mode_saikyou && never(p2_active() && slot2_mode() != mode_saikyou && game_matches_won() > prev(game_matches_won())))
                         ) &&
                        settings_4stars_3rounds())

achievement("Street Fighter II: Alpha Edition", "Finish Arcade Mode as Classic Chun-Li on Classic Mode (4 stars difficulty, 3 rounds).", 10,
            trigger =   game_mode_playing() == gm_arcade &&
                        once(game_current_match() == 0) &&
                        trigger_when(game_current_match() == 0x09) &&
                        (trigger_when(p1_has_won_match()) || trigger_when(p2_has_won_match())) &&
                        (
                            (p1_active() && slot1_character() == characters["Classic Chun-Li"] && slot1_mode() == mode_classic && never(p1_active() && slot1_mode() != mode_classic && p1_has_won_match())) ||
                            (p2_active() && slot2_character() == characters["Classic Chun-Li"] && slot2_mode() == mode_classic && never(p2_active() && slot2_mode() != mode_classic && p2_has_won_match()))
                         ) &&
                        settings_4stars_3rounds())

function cheevo_combo_v_ism_character(character, damage, points, cheevo_id) {
    if (damage == 57) {
        damage_percent = "40%"
    }
    if (damage == 43) {
        damage_percent = "30%"
    }
    achievement(format("Variable Combo - {0}", character), format("{0}: Perform a {1} damage combo using V-ISM on Training Mode (Damage 2, no Special/S.C shortcuts).", character, damage_percent), points,
                trigger = game_mode_playing() == gm_training &&
                          slot1_mode() != mode_mazi && slot2_mode() != mode_mazi &&
                          game_state() == gs_playing &&
                          (
                              (p1_active() && slot1_active_vism() && slot1_fighting_style() == fs_vism && slot1_character() == characters[character]) ||
                              (p2_active() && slot2_active_vism() && slot2_fighting_style() == fs_vism && slot2_character() == characters[character])
                          ) &&
                          trigger_when(training_combo_damage() >= damage && prev(training_combo_damage()) < damage) &&
                          settings_damage() == 1 &&
                          (protect_button_shortcuts_p1() && protect_button_shortcuts_p2()),
                id = cheevo_id)
}

function cheevo_combo_v_ism_character_dual(character1, character2, damage, points, cheevo_id) {
    if (damage == 57) {
        damage_percent = "40%"
    }
    if (damage == 43) {
        damage_percent = "30%"
    }
    achievement(format("Variable Combo - {0}", character1), format("{0}: Perform a {1} damage combo using V-ISM on Training Mode (Damage 2, no Special/S.C shortcuts).", character1, damage_percent), points,
                trigger = game_mode_playing() == gm_training &&
                          slot1_mode() != mode_mazi && slot2_mode() != mode_mazi &&
                          game_state() == gs_playing &&
                          (
                              (p1_active() && slot1_active_vism() && slot1_fighting_style() == fs_vism && (slot1_character() == characters[character1] || slot1_character() == characters[character2])) ||
                              (p2_active() && slot2_active_vism() && slot2_fighting_style() == fs_vism && (slot2_character() == characters[character1] || slot2_character() == characters[character2]))
                          ) &&
                          trigger_when(training_combo_damage() >= damage && prev(training_combo_damage()) < damage) &&
                          settings_damage() == 1 &&
                          (protect_button_shortcuts_p1() && protect_button_shortcuts_p2()),
                id = cheevo_id)
}

cheevo_combo_v_ism_character("Ryu", 57, 5, 219501)
cheevo_combo_v_ism_character("Ken", 57, 5, 219502)
cheevo_combo_v_ism_character_dual("Akuma", "Shin Akuma", 57, 5, 219503)
cheevo_combo_v_ism_character("Charlie", 57, 5, 219504)
cheevo_combo_v_ism_character_dual("Chun-Li", "Classic Chun-Li", 57, 5, 219505)
cheevo_combo_v_ism_character("Adon", 57, 5, 219506)
cheevo_combo_v_ism_character_dual("Sodom", "Katana (Sodom)", 57, 5, 219507)
cheevo_combo_v_ism_character("Guy", 57, 5, 219508)
cheevo_combo_v_ism_character("Birdie", 57, 5, 219509)
cheevo_combo_v_ism_character("Rose", 57, 5, 219510)
cheevo_combo_v_ism_character("M. Bison", 43, 5, 219511)
cheevo_combo_v_ism_character("Sagat", 57, 5, 219512)
cheevo_combo_v_ism_character("Dan", 57, 5, 219513)
cheevo_combo_v_ism_character("Sakura", 57, 5, 219514)
cheevo_combo_v_ism_character("Rolento", 57, 5, 219515)
cheevo_combo_v_ism_character("Dhalsim", 57, 5, 219516)
cheevo_combo_v_ism_character("Zangief", 57, 5, 219517)
cheevo_combo_v_ism_character_dual("Gen (Mantis Stance)", "Gen (Crane Stance)", 57, 5, 219518)
cheevo_combo_v_ism_character("Cammy", 57, 5, 219519)
cheevo_combo_v_ism_character("Evil Ryu", 57, 5, 219520)
cheevo_combo_v_ism_character("E. Honda", 57, 5, 219521)
cheevo_combo_v_ism_character("Blanka", 57, 5, 219522)
cheevo_combo_v_ism_character("R. Mika", 57, 5, 219523)
cheevo_combo_v_ism_character("Cody", 57, 5, 219524)
cheevo_combo_v_ism_character("Vega", 57, 5, 219525)
cheevo_combo_v_ism_character("Karin", 57, 5, 219526)
cheevo_combo_v_ism_character("Juli", 57, 5, 219527)
cheevo_combo_v_ism_character("Juni", 57, 5, 219528)
cheevo_combo_v_ism_character("Guile", 57, 5, 219529)
cheevo_combo_v_ism_character("Fei-Long", 57, 5, 219530)
cheevo_combo_v_ism_character("Dee Jay", 57, 5, 219531)
cheevo_combo_v_ism_character("T. Hawk", 57, 5, 219532)
cheevo_combo_v_ism_character_dual("Balrog", "Extra Balrog", 57, 5, 219533)
cheevo_combo_v_ism_character("Eagle", 57, 5, 219534)
cheevo_combo_v_ism_character("Maki", 57, 5, 219535)
cheevo_combo_v_ism_character("Yun", 57, 5, 219536)
cheevo_combo_v_ism_character("Ingrid", 57, 5, 219537)

achievement("Untamable Fists", "Win a match as EX Balrog (Arcade Mode).", 2,
            trigger =   game_mode_playing() == gm_arcade &&
                        game_state() == gs_playing &&
                        ((p1_active() && game_matches_won() > prev(game_matches_won()) && slot1_character() == characters["Extra Balrog"]) ||
                         (p2_active() && game_matches_won() > prev(game_matches_won()) && slot2_character() == characters["Extra Balrog"]))
                        )


achievement("Groan", "Win a match as Shin Akuma (Arcade Mode).", 2,
            trigger =   game_mode_playing() == gm_arcade &&
                        game_state() == gs_playing &&
                        ((p1_active() && game_matches_won() > prev(game_matches_won()) && slot1_character() == characters["Shin Akuma"]) ||
                         (p2_active() && game_matches_won() > prev(game_matches_won()) && slot2_character() == characters["Shin Akuma"]))
                        )

achievement("Ultimate Psycho Crusher", "M. Bison: Finish a round with a Ultimate Psycho Crusher (Arcade Mode).", 2,
            trigger =   game_mode_playing() == gm_arcade &&
                        game_state() == gs_playing &&
                        ((p1_active() && slot1_current_victory() == 0x0c && slot1_move() == 0x04 && slot1_character() == characters["M. Bison"] && slot1_fighting_style() == fs_shadaloo) ||
                         (p2_active() && slot2_current_victory() == 0x0c && slot2_move() == 0x04 && slot2_character() == characters["M. Bison"] && slot2_fighting_style() == fs_shadaloo))
            )

achievement("Sun Delta", "Ingrid: Finish a round with a Sun Delta (Arcade Mode).", 3,
            trigger =   game_mode_playing() == gm_arcade &&
                        game_state() == gs_playing &&
                        ((p1_active() && slot1_current_victory() == 0x0c && slot1_move() == 0x09 && slot1_character() == characters["Ingrid"]) ||
                         (p2_active() && slot2_current_victory() == 0x0c && slot2_move() == 0x09 && slot2_character() == characters["Ingrid"]))
            )

achievement("Psycho Drive", "Defeat 25 opponents in less than 3 minutes on Survival Endless.", 25,
            trigger =   game_mode_playing() == gm_survival_mode &&
                        survival_mode_playing() == sm_endless &&
                        game_state() == gs_playing &&
                        trigger_when(survival_mode_wins() == 24) &&
                        ((trigger_when(slot1_current_victory() > prev(slot1_current_victory()) && p1_active())) ||
                         (trigger_when(slot2_current_victory() > prev(slot2_current_victory()) && p2_active()))) &&
                        survival_mode_timer_mins() <= 2)

// =========================================
//                World Tour              
// =========================================

// Character Level
achievement("The World Tourist", "Reach Level 10 on World Tour.", 10,
            trigger =   game_mode_playing() == gm_world_tour &&
                        game_state() == gs_playing &&
                        players_active() &&
                        world_tour_player_level() >= 9 && prev(world_tour_player_level()) < 9)

achievement("The World Fighter", "Reach Level 20 on World Tour.", 10,
            trigger =   game_mode_playing() == gm_world_tour &&
                        game_state() == gs_playing &&
                        players_active() &&
                        world_tour_player_level() >= 19 && prev(world_tour_player_level()) < 19)

achievement("The World Warrior", "Reach Level 32 on World Tour.", 25,
            trigger =   game_mode_playing() == gm_world_tour &&
                        game_state() == gs_playing &&
                        players_active() &&
                        world_tour_player_level() >= 31 && prev(world_tour_player_level()) < 31)

// Fighting Styles

achievement("Fighting Master", "Reach Level 32 with any ISM on World Tour.", 25,
            trigger =   game_mode_playing() == gm_world_tour &&
                        game_state() == gs_playing &&
                        players_active() &&
                        (
                            (world_tour_xism_level() == 31 && prev(world_tour_xism_level()) < 31) ||
                            (world_tour_aism_level() == 31 && prev(world_tour_aism_level()) < 31) ||
                            (world_tour_vism_level() == 31 && prev(world_tour_vism_level()) < 31)
                        )
            )

achievement("X-ISM Master", "Reach Level 32 with X-ISM on World Tour.", 25,
            trigger =   game_mode_playing() == gm_world_tour &&
                        game_state() == gs_playing &&
                        players_active() &&
                        world_tour_xism_level() == 31 && prev(world_tour_xism_level()) < 31)

achievement("A-ISM Master", "Reach Level 32 with A-ISM on World Tour.", 25,
            trigger =   game_mode_playing() == gm_world_tour &&
                        game_state() == gs_playing &&
                        players_active() &&
                        world_tour_aism_level() == 31 && prev(world_tour_aism_level()) < 31)

achievement("V-ISM Master", "Reach Level 32 with V-ISM on World Tour.", 25,
            trigger =   game_mode_playing() == gm_world_tour &&
                        game_state() == gs_playing &&
                        players_active() &&
                        world_tour_vism_level() == 31 && prev(world_tour_vism_level()) < 31)

// ISM Pluses
// achievement("Secret Techniques Learner I", "Unlock 6 ISM Plus available from World Tour battles.", 10,
//             trigger =   game_mode_playing() == gm_world_tour &&
//                         game_state() == gs_playing &&
//                         players_active() &&
//                         measured(all_world_tour_ism_pluses() == 6)  && prev(all_world_tour_ism_pluses()) < 6)

// achievement("Secret Techniques Learner II", "Unlock 12 ISM Plus available from World Tour battles.", 25,
//             trigger =   game_mode_playing() == gm_world_tour &&
//                         game_state() == gs_playing &&
//                         players_active() &&
//                         measured(all_world_tour_ism_pluses() == 12)  && prev(all_world_tour_ism_pluses()) < 12)

// achievement("Secret Techniques Learner III", "Unlock 17 ISM Plus available from World Tour battles.", 25,
//             trigger =   game_mode_playing() == gm_world_tour &&
//                         game_state() == gs_playing &&
//                         players_active() &&
//                         measured(all_world_tour_ism_pluses() == 17)  && prev(all_world_tour_ism_pluses()) < 17)



// =========================================
//               Leaderboard              
// =========================================

leaderboard("Survival Endless - 25 Matches Speedrun", "Defeat 25 opponents on Survival Endless the fastest as possible.",
           start =  game_mode_playing() == gm_survival_mode &&
                    survival_mode_playing() == sm_endless &&
                    game_current_match() == 0 &&
                    game_state() == gs_playing &&
                    survival_mode_timer_secs() > prev(survival_mode_timer_secs()),
           cancel = game_mode_playing() != gm_survival_mode || game_state() != gs_playing,
           submit = survival_mode_wins() == 24 && ((slot1_current_victory() > prev(slot1_current_victory()) && p1_active()) || (slot2_current_victory() > prev(slot2_current_victory()) && p2_active())),
           value = (survival_mode_timer_mins() * 3600) + (survival_mode_timer_secs() * 60) + survival_mode_timer_frames(),
           format = "FRAMES", lower_is_better=true)


leaderboard("Survival Endless - Best Streak", "Defeat the highest amount of opponents on Survival Endless.",
           start =  game_mode_playing() == gm_survival_mode &&
                    survival_mode_playing() == sm_endless &&
                    game_current_match() == 0 &&
                    game_state() == gs_playing &&
                    survival_mode_timer_secs() > prev(survival_mode_timer_secs()),
           cancel = game_mode_playing() != gm_survival_mode || game_state() != gs_playing,
           submit = ((slot2_current_victory() > prev(slot2_current_victory()) && p1_active()) || (slot1_current_victory() > prev(slot1_current_victory()) && p2_active())),
           value = survival_mode_wins(),
           format = "VALUE", lower_is_better=false)