// Metal Slug: Super Vehicle - 001
// #ID = 14492

// =========================================
//              Memory Acessors              
// =========================================

// Game
function pointer_another_story() => tbyte(tbyte(0x0075D0) + 0x2c)
function as_scene() => byte(0x0ad9c0)
function as_current_story() => byte(0x01f7ff)
function is_another_story_1() => bit7(0x01f7ff) == 0
function is_another_story_2() => bit7(0x01f7ff) == 1

function game_file1_loaded() => dword(0x00922C)
function game_file2_loaded() => dword(0x009244)
function game_stage_file() => byte(0x021231)
function game_stage_file_lastchar() => byte(0x021234)

function settings_hero() => byte(0x01F210)
function settings_hero_default() => settings_hero() >= 0x03
function settings_difficulty() => byte(0x01F213)
function settings_difficulty_default() => settings_difficulty() >= 0x02
function settings_difficulty_default_only() => settings_difficulty() == 0x02


function game_mission() => byte(0x0100B8)
function game_stage_cleared_bit0reverse() => bit0(0x0100BB)
function game_mode() => byte(0x0100BF)
         game_mode_arcade = 0x00
         game_mode_pinpoint = 0x01
         game_mode_survival = 0x02

function game_screen() => byte(0x0100F6)
         screen_arcade_p1 = 0x01
         screen_arcade_p2 = 0x02
         screen_combat_school = 0x03
         screen_howtoplay = 0x05
         screen_art_gallery_mechs = 0x07
         screen_art_gallery_chars = 0x08
         screen_art_gallery_others = 0x09
         screen_art_gallery_specials = 0x0a

function game_demo_playing() => byte(0x010603)
         demo_outside = 0x00
         demo_playing = 0x01
         demo_end_of_demo = 0x02

function game_last_score_BCD() => dword_be(0x017E54) 
function game_last_score_obtained_BCD() => dword(0x017E58)

function stage_camera_x_view() => word(0x020006)
function stage_camera_x() => word(0x01006E)
function stage_camera_y() => word(0x010072)
function stage_timer() => word(0x01ed26) // 30 fps

// Combat School
function cs_previous_rank_BCD() => word(0x017E16)
function cs_current_rank_BCD() => word(0x017E18)
function cs_p1_current_file() => byte(0x017E13)
function cs_p2_current_file() => byte(0x017E14)
function cs_file1_data() => byte(0x010204)
function cs_file2_data() => byte(0x01023C)
function cs_file3_data() => byte(0x010274)
function cs_file4_data() => byte(0x0102AC)
function cs_file5_data() => byte(0x0102E4)
function cs_file6_data() => byte(0x01031C)
function cs_file7_data() => byte(0x010354)
function cs_file8_data() => byte(0x01038C)
function cs_pin_point_timer() => dword(0x010044)
         cs_file_start = 0x010204
         o_cs_file_pp1 = 0x14
         o_cs_file_pp2 = 0x18
         o_cs_file_pp3 = 0x1c
         o_cs_file_pp4 = 0x20
         o_cs_file_pp5 = 0x24
         o_cs_file_pp6 = 0x28
         o_cs_file_surv = 0x2c // check for bit0 to bit5
         o_cs_file_surv_finished = 0x2f // check for bit7
         o_cs_file_pp_finished = 0x31 // check bit0 to bit5
         
        // Mission 1 =< 0x1085 (01'10"48)
        // Mission 2 =< 0x2CA5 (03'10"48)
        // Mission 3 =< 0x3155 (03'30"48)
        // Mission 4 =< 0x1C3D (02'00"48)
        // Mission 5 =< 0x1C3D (02'00"48)
        // Mission 6 =< 0x6036 (06'50"48)
        // Survival = 0x58e8

// Player
function p1_state() => byte(0x0106A8)
function p2_state() => byte(0x0106A9)
function p1_continues_used() => byte(0x010066)
function p2_continues_used() => byte(0x010067)
function p1_pows_recaptured() => byte(0x010068)
function p2_pows_recaptured() => byte(0x010069)
function p1_pows_collected() => word(0x0100F2)
function p2_pows_collected() => word(0x0100F4)
function p1_lives() => byte(0x0181A3)
function p2_lives() => byte(0x018243)

function p1_grenades_display() => byte(0x0181BC)
function p2_grenades_display() => byte(0x01825C)
function p1_grenades() => byte(0x0182EC)
function p2_grenades() => byte(0x01838C)

function p1_weapon() => byte(0x0182DD)
function p1_ammo() => byte(0x0182EE)

// Vehicle
function vehicle_hp() => word(0x018412)
function vehicle_being_used() => byte(0x018419)
function vehicle_grenades() => byte(0x01843C)

screens = {
   1: "Arcade Mission",
   2: "Arcade Mission",
   3: "Combat School",
   5: "How To Play",
   7: "Art Gallery (Mechanics)",
   8: "Art Gallery (Characters)",
   9: "Art Gallery (Others)",
   10: "Art Gallery (Special)",
}

game_modes = {
   0: "Arcade Mission",
   1: "Pin Point",
   2: "Survival Attack"
}

// =========================================
//             Utility Functions              
// =========================================

function is_regular_game() => never(game_file1_loaded() != 0x30545241)
function is_another_story() => never(game_file1_loaded() != 0x2e315341)

function in_arcade_mode() => game_screen() <= screen_arcade_p2 && game_screen() != 0 && is_regular_game()
function in_combat_school() => game_screen() == screen_combat_school && is_regular_game()

function inside_mission() => game_stage_file_lastchar() > 0x30 && p1_or_p2_active()
function mission1_start() => game_mission() == 0 && stage_camera_x() == 0 && inside_mission()
function mission1_has_started() => game_mission() == 0 && stage_camera_x() > 0 && prev(stage_camera_x()) == 0 && inside_mission()

function mission_finished() => game_stage_cleared_bit0reverse() == 0 && prev(game_stage_cleared_bit0reverse()) == 1
function mission6_finished() => game_mission() == 5 && mission_finished()
function game_beaten() => game_mission() == 6 && prev(game_mission()) == 5

function p1_only() => p1_state() > 0 && p2_state() == 0
function p2_only() => p2_state() > 0 && p1_state() == 0
function p1_and_p2_active() => p1_state() > 0 && p2_state() > 0
function p1_and_p2_not_active() => p1_state() == 0 && p2_state() == 0
function p1_or_p2_active() => p1_state() > 0 || p2_state() > 0

function is_super_devil() {
    logic_is_super_devil = always_false()
    for i in range(0,7) {
        cs_current_file = cs_file_start + (56 * i)
        logic_is_super_devil =  logic_is_super_devil ||
                                (
                                    cs_p1_current_file() == i &&
                                    cs_p2_current_file() == 0xFF && // unloaded, to make P1 only
                                    dword(cs_current_file + o_cs_file_pp1) <= 0x1085 &&
                                    dword(cs_current_file + o_cs_file_pp2) <= 0x2CA5 &&
                                    dword(cs_current_file + o_cs_file_pp3) <= 0x3155 &&
                                    dword(cs_current_file + o_cs_file_pp4) <= 0x1C3D &&
                                    dword(cs_current_file + o_cs_file_pp5) <= 0x1C3D &&
                                    dword(cs_current_file + o_cs_file_pp6) <= 0x6036 &&
                                    sum_of(range(0, 5), b => bit(b,cs_current_file + o_cs_file_pp_finished)) == 6 &&
                                    word(cs_current_file + o_cs_file_surv) == 0x58e8 &&
                                    bit7(cs_current_file + o_cs_file_surv_finished) == 1
                                )
    }
    return logic_is_super_devil
}

// =========================================
//                Progression            
// =========================================

function achiev_finish_mission(title, mission_id, points, cheevo_id) {
    achievement(title, format("Finish Mission {0} (Normal difficulty).", mission_id + 1), points,
                trigger =   in_arcade_mode() &&
                            settings_difficulty_default() &&
                            game_mission() == mission_id &&
                            mission_finished()
                )
}



achiev_finish_mission("Absolute Thick Forest", 0, 2, 0)
achiev_finish_mission("A Wish For a Morning Glow", 1, 3, 0)
achiev_finish_mission("Iron Cavalrymen in Hell", 2, 5, 0)
achiev_finish_mission("Death Valley", 3, 5, 0)
achiev_finish_mission("The City Under Despotism", 4, 5, 0)
// achiev_finish_mission("The Memorial Sea", 5, 0)

achievement("World Peace, But at What Cost!?", "Beat the game (one session)", 10,
                trigger =   in_arcade_mode() &&
                            settings_difficulty_default() &&
                            once(mission1_start()) &&
                            game_beaten()
                )

// =========================================
//               Combat School              
// =========================================

function achiev_get_rank(title, rank_value, rank_hex, points, cheevo_id) {
    achievement(title, format("Achieve {0} points on Combat School.", rank_value), points,
                trigger =   in_combat_school() &&
                            cs_current_rank_BCD() >= rank_hex &&
                            prev(cs_current_rank_BCD()) < rank_hex &&
                            cs_previous_rank_BCD() < rank_hex
                )
}

achiev_get_rank("Warrant Officer", 220, 0x220, 10, 0)
achiev_get_rank("Lieutenant Colonel", 660, 0x660, 25, 0)
achiev_get_rank("Super Devil", 1000, 0x1000, 25, 0)

achievement("Full Stamina Soldier", "FInish Survival Attack.", 50,
            trigger =   in_combat_school() &&
                        game_mode() == game_mode_survival &&
                        p1_or_p2_active() &&
                        mission6_finished()
            )

achievement("You Can't Teach an Old Dog New Tricks", "Finish Survival Attack using only the Super Devil handgun (P1).", 50,
            trigger =   in_combat_school() &&
                        game_mode() == game_mode_survival &&
                        p1_only() &&
                        is_super_devil() &&
                        once(game_mission() == 0 && stage_camera_x() == 0) &&
                        never(p1_weapon() != 0 && p1_weapon() != 0xFF) &&
                        trigger_when(mission6_finished())
            )

// =========================================
//              POWs Collected              
// =========================================

function logic_pows_collected_p1_and_p2_sum() {
    logic_hits = []
    for i in range(1,6) {
        array_push(logic_hits, p1_state() == 1 && p1_pows_collected() - prev(p1_pows_collected()) >= i)
        array_push(logic_hits, p2_state() == 1 && p2_pows_collected() - prev(p2_pows_collected()) >= i)
    }
    array_push(logic_hits, always_false())
    return logic_hits
}

function achiev_collect_pows(title, mission_id, pows_amount, points, cheevo_id) {
    achievement(title, format("Collect {0} POWs on Mission {1} (Arcade Mission).", pows_amount, mission_id + 1), points,
                trigger =   in_arcade_mode() &&
                            never(game_mission() != mission_id) &&
                            measured(tally(pows_amount, logic_pows_collected_p1_and_p2_sum()))
                )
}

achiev_collect_pows("Absolute Thick Prisoner", 0, 10, 5, 0)
achiev_collect_pows("A Wish For a Morning Prisoner", 1, 12, 10, 0)
achiev_collect_pows("Iron Prisoner in Hell", 2, 12, 10, 0)
achiev_collect_pows("Death Prisoner", 3, 23, 10, 0)
achiev_collect_pows("The Prisoner Under Despotism", 4, 15, 10, 0)
achiev_collect_pows("The Memorial Prisoner", 5, 25, 10, 0)

achievement("You're Great!", "Get an \"Great!\" message on the mission results screen.", 5,
            trigger =   in_arcade_mode() &&
                        game_last_score_obtained_BCD() == 0x00100000 && 
                        prev(game_last_score_obtained_BCD()) != 0x00100000
            )

// =========================================
//                  Vehicle              
// =========================================

function achiev_finish_mission_with_vehicle(title, mission_id, points, cheevo_id) {
    achievement(title, format("Finish Mission {0} with a Metal Slug in Arcade Mission (Normal difficulty).", mission_id + 1), points,
                trigger =   in_arcade_mode() &&
                            settings_difficulty_default() &&
                            game_mission() == mission_id &&
                            vehicle_hp() != 0xFFFF &&
                            vehicle_hp() != 0x00 &&
                            mission_finished()
                )
}

achiev_finish_mission_with_vehicle("Metal Slug I", 0, 2, 0)
achiev_finish_mission_with_vehicle("Metal Slug II", 1, 3, 0)
achiev_finish_mission_with_vehicle("Metal Slug III", 2, 5, 0)
achiev_finish_mission_with_vehicle("Metal Slug IV", 3, 5, 0)
achiev_finish_mission_with_vehicle("Metal Slug V", 4, 5, 0)
achiev_finish_mission_with_vehicle("Metal Slug VI", 5, 10, 0)

// =========================================
//                Challenges              
// =========================================

achievement("Hittin' It Hard", "Beat the game without using a continue on Normal difficulty (Hero 3).", 50,
            trigger =   in_arcade_mode() &&
                        settings_difficulty_default() &&
                        settings_hero_default() &&
                        once(mission1_start()) &&
                        never(p1_continues_used() > 0) &&
                        never(p2_continues_used() > 0) &&
                        trigger_when(mission6_finished())
            )

// OLD
// achievement("Run and Gun, Literally", "Beat the game within 18 minutes on Hard difficulty.", 50,
//             trigger =   in_arcade_mode() &&
//                         settings_difficulty() >= 5 &&
//                         once(mission1_has_started()) &&
//                         never(tally(64800, tally(0, once(mission1_has_started()) && stage_timer() != prev(stage_timer())) ,
//                                                     once(mission1_has_started()) && stage_timer() != prev(stage_timer())  )) &&
//                         trigger_when(mission6_finished())
//             )

achievement("Run and Gun, Literally", "Beat the game within 18 minutes on Hard difficulty.", 50,
            trigger =   in_arcade_mode() &&
                        settings_difficulty() >= 5 &&
                        never(game_screen() == 0) &&
                        once(mission1_has_started()) &&
                        never(tally(64800,  once(mission1_has_started()) && stage_timer() != prev(stage_timer()), once(mission1_has_started()) && stage_timer() != prev(stage_timer()))) &&
                        trigger_when(mission6_finished())
            )

achievement("High Value Slug", "Beat the game with over 1.5 million score (single player).", 50,
            trigger =   in_arcade_mode() &&
                        once(mission1_start()) &&
                        game_last_score_BCD() >= 0x01500000 &&
                        never(p1_and_p2_active()) &&
                        trigger_when(game_beaten())
            )

// =========================================
//             Mission Challenges              
// =========================================

function minimalist_restrictions() {
    return  (
                never(p1_lives() != prev(p1_lives())) &&
                never(p2_lives() != prev(p2_lives())) &&
                never(p1_grenades() < prev(p1_grenades())) &&
                never(p2_grenades() < prev(p2_grenades())) &&
                never(vehicle_grenades() < prev(vehicle_grenades()) && prev(vehicle_grenades()) != 0xFF)
            )
}

achievement("Minimalist Soldier I", "Finish Mission 1 without throwing grenades and no deaths in Arcade Mission (Normal difficulty).", 10,
            trigger =   in_arcade_mode() &&
                        settings_difficulty_default() &&
                        never(game_mission() != 0) &&
                        once(stage_camera_x() == 0 && inside_mission()) &&
                        minimalist_restrictions() &&
                        trigger_when(mission_finished())
            )

achievement("Minimalist Soldier II", "Finish Mission 2 without throwing grenades and no deaths in Arcade Mission (Normal difficulty).", 10,
            trigger =   in_arcade_mode() &&
                        settings_difficulty_default() &&
                        never(game_mission() != 1) &&
                        once(stage_camera_x() == 0 && inside_mission()) &&
                        minimalist_restrictions() &&
                        trigger_when(mission_finished())
            )

achievement("Minimalist Soldier III", "Finish Mission 3 without throwing grenades and no deaths in Arcade Mission (Normal difficulty).", 25,
            trigger =   in_arcade_mode() &&
                        settings_difficulty_default() &&
                        never(game_mission() != 2) &&
                        once(stage_camera_x() == 0x00 && stage_camera_y() == 0x430 && inside_mission()) &&
                        minimalist_restrictions() &&
                        trigger_when(mission_finished())
            )

achievement("Minimalist Soldier IV", "Finish Mission 4 without throwing grenades and no deaths in Arcade Mission (Normal difficulty).", 25,
            trigger =   in_arcade_mode() &&
                        settings_difficulty_default() &&
                        never(game_mission() != 3) &&
                        once(stage_camera_x() == 0 && inside_mission()) &&
                        minimalist_restrictions() &&
                        trigger_when(mission_finished())
            )

achievement("Minimalist Soldier V", "Finish Mission 5 without throwing grenades and no deaths in Arcade Mission (Normal difficulty).", 25,
            trigger =   in_arcade_mode() &&
                        settings_difficulty_default() &&
                        never(game_mission() != 4) &&
                        once(stage_camera_x() == 0 && inside_mission()) &&
                        minimalist_restrictions() &&
                        trigger_when(mission_finished())
            )
achievement("Minimalist Soldier VI", "Finish Mission 6 without throwing grenades and no deaths in Arcade Mission (Normal difficulty).", 25,
            trigger =   in_arcade_mode() &&
                        settings_difficulty_default() &&
                        never(game_mission() != 5) &&
                        once(stage_camera_x() == 0 && inside_mission()) &&
                        minimalist_restrictions() &&
                        trigger_when(mission_finished())
            )

// =========================================
//               Another Story              
// =========================================

achievement("Record of Cpt. Chris Key", "Finish Another Story #1 for the first time.", 5,
            trigger =   is_another_story() &&
                        is_another_story_1() &&
                        as_scene() == 6 && prev(as_scene()) != 6
            )

achievement("Record of Cpt. Chris Key II", "Finish Another Story #1 for the second time.", 10,
            trigger =   is_another_story() &&
                        is_another_story_1() &&
                        as_scene() == 8 && prev(as_scene()) != 8
            )

achievement("Rumi-Chan's Adventure", "Finish Another Story #2.", 10,
            trigger =   is_another_story() &&
                        is_another_story_2() &&
                        as_scene() == 8 && prev(as_scene()) != 8
            )


// =========================================
//                Leaderboards              
// =========================================

function lb_timer_logic() => tally(0, stage_timer() != prev(stage_timer()), stage_timer() != prev(stage_timer()))

leaderboard("Metal Slug - Normal Speedrun", "Finish Arcade Mission the fastest as possible (Normal difficulty).",
           start =  in_arcade_mode() &&
                    settings_difficulty_default_only() &&
                    mission1_has_started(),
           cancel = game_screen() == 0,
           submit = mission6_finished(),
           value = lb_timer_logic(),
           format = "FRAMES", lower_is_better=true
           )

leaderboard("Metal Slug - Hard Speedrun", "Finish Arcade Mission the fastest as possible (Hard difficulty).",
           start =  in_arcade_mode() &&
                    settings_difficulty() >= 5 &&
                    mission1_has_started(),
           cancel = game_screen() == 0,
           submit = mission6_finished(),
           value = lb_timer_logic(),
           format = "FRAMES", lower_is_better=true
           )

leaderboard("Metal Slug - High Score", "Finish Arcade Mission with the highest score possible (Normal difficulty, single player).",
           start =  in_arcade_mode() &&
                    settings_difficulty_default() &&
                    (p1_only() || p2_only()) &&
                    game_beaten(),
           cancel = (game_screen() == 0 || 
                    p1_and_p2_active()),
           submit = game_beaten(),
           value = bcd(game_last_score_BCD()),
           format = "VALUE", lower_is_better=true
           )

leaderboard("POWs Recapturer", "Finish Arcade Mission with the highest amount of prisoners recaptured (Normal difficulty).",
           start =  in_arcade_mode() &&
                    settings_difficulty_default() &&
                    mission1_start(),
           cancel = game_screen() == 0,
           submit = game_beaten(),
           value = p1_pows_recaptured() + p2_pows_recaptured(),
           format = "VALUE", lower_is_better=false
           )

leaderboard("Coin Saver - Normal", "Finish Arcade Mission with the lowest amount of continues used (Normal difficulty, Hero 3).",
           start =  in_arcade_mode() &&
                    settings_difficulty_default_only() &&
                    settings_hero_default() &&
                    mission1_start(),
           cancel = game_screen() == 0,
           submit = game_beaten(),
           value = p1_continues_used() + p2_continues_used(),
           format = "VALUE", lower_is_better=true
           )

leaderboard("Coin Saver - Hard", "Finish Arcade Mission with the lowest amount of continues used (Hard difficulty, Hero 3).",
           start =  in_arcade_mode() &&
                    settings_difficulty() >= 5 &&
                    settings_hero_default() &&
                    mission1_start(),
           cancel = game_screen() == 0,
           submit = game_beaten(),
           value = p1_continues_used() + p2_continues_used(),
           format = "VALUE", lower_is_better=true
           )

function lb_pinpoint_mission(mission_id, lb_id) {
    leaderboard(format("Mission {0} Pin Point Attack", mission_id + 1), format("Finish Pin Point Attack 1 the fastest as possible.", mission_id + 1),
                start = in_combat_school() &&
                        game_mode() == game_mode_pinpoint &&
                        game_mission() == mission_id &&
                        cs_pin_point_timer() > 0 && 
                        prev(cs_pin_point_timer()) == 0,
                cancel = game_screen() != screen_combat_school || game_mode() != game_mode_pinpoint || game_mission() != mission_id || (p1_state() == 0 && p2_state() == 0) ,
                submit = mission_finished(),
                value = cs_pin_point_timer(),
                format = "FRAMES", lower_is_better=true
                )
}
lb_pinpoint_mission(0, 0)
lb_pinpoint_mission(1, 0)
lb_pinpoint_mission(2, 0)
lb_pinpoint_mission(3, 0)
lb_pinpoint_mission(4, 0)
lb_pinpoint_mission(5, 0)

leaderboard("Survival Attack Speedrun", "Finish Survival Attack the fastest as possible.",
           start =  in_combat_school() &&
                    game_mode() == game_mode_survival &&
                    mission1_has_started(),
           cancel = game_screen() != screen_combat_school || p1_lives() < prev(p1_lives()) || p2_lives() < prev(p2_lives()) || (p1_state() == 0 && p2_state() == 0),
           submit = mission6_finished(),
           value = lb_timer_logic(),
           format = "FRAMES", lower_is_better=true
           )

// =========================================
//               Rich Presence              
// =========================================

function rp_lookup_current_missions() => rich_presence_macro("Number", game_mission() + 1)

// Arcade Mission
rich_presence_conditional_display(is_another_story() && as_current_story() == 0x00, "Playing Another Story 1")
rich_presence_conditional_display(is_another_story() && as_current_story() == 0x80, "Playing Another Story 2")
rich_presence_conditional_display(p1_only() && in_arcade_mode(), 
                                  "Arcade Mission (Mission {0}) - P1 with {1} prisoners recaptured and {2} score and {3} continues used", 
                                  rp_lookup_current_missions(),
                                  rich_presence_macro("Number", p1_pows_recaptured()), 
                                  rich_presence_macro("Number", bcd(game_last_score_BCD())),
                                  rich_presence_macro("Number", p1_continues_used())
                                  )

rich_presence_conditional_display(p2_only() && in_arcade_mode(), 
                                  "Arcade Mission (Mission {0}) - P2 with {1} prisoners recaptured and {2} score and {3} continues used", 
                                  rp_lookup_current_missions(),
                                  rich_presence_macro("Number", p2_pows_recaptured()), 
                                  rich_presence_macro("Number", bcd(game_last_score_BCD())),
                                  rich_presence_macro("Number", p2_continues_used())
                                  )

rich_presence_conditional_display(p1_and_p2_active() && in_arcade_mode(), 
                                  "Arcade Mission (Mission {0}) - Co-op: P1 with {1} prisoners recaptured and {2} continues used, P2 with {3} prisoners recaptured and {4} continues used", 
                                  rp_lookup_current_missions(),
                                  rich_presence_macro("Number", p1_pows_recaptured()), 
                                  rich_presence_macro("Number", p1_continues_used()),
                                  rich_presence_macro("Number", p2_pows_recaptured()),
                                  rich_presence_macro("Number", p2_continues_used())
                                  )

// Combat School
rich_presence_conditional_display(p1_only() && in_combat_school() && is_super_devil(), "Combat School (Mission {0}) - {1} with P1 as Super Devil",    
                                  rp_lookup_current_missions(),
                                  rich_presence_lookup("Mode", game_mode(), game_modes))

rich_presence_conditional_display(p1_only() && in_combat_school(), "Combat School (Mission {0}) - {1} with P1",    
                                  rp_lookup_current_missions(),
                                  rich_presence_lookup("Mode", game_mode(), game_modes))

rich_presence_conditional_display(p2_only() && in_combat_school(), "Combat School (Mission {0}) - {1} with P2",    
                                  rp_lookup_current_missions(),
                                  rich_presence_lookup("Mode", game_mode(), game_modes))

rich_presence_conditional_display(p1_and_p2_active() && in_combat_school(), "Combat School (Mission {0}) - {1} on Co-op",    
                                  rp_lookup_current_missions(),
                                  rich_presence_lookup("Mode", game_mode(), game_modes))

// Others
for screen in screens {
    rich_presence_conditional_display(game_screen() == screen, screens[screen])
}

rich_presence_display("Fighting against the Rebel Army")