// Metal Slug 6
// #ID = 20520

// Settings
function settings_hero() => byte(0x977AC8)
function settings_difficulty() => byte(0x977AD0)
function settings_hero_default() => byte(0x977AC8) == 3
function settings_difficulty_default() => byte(0x977AD0) >= 3
function settings_difficulty_level8() => byte(0x977AD0) == 7

function settings_bullet_infinity() => bit0(0xe8f07b)
function settings_bomb_infinity() => bit0(0xe8f07c)

function no_infinity_settings() => settings_bullet_infinity() == 0 && settings_bomb_infinity() == 0
function only_bullet_infinity_allowed() => settings_bullet_infinity() == 1 && settings_bomb_infinity() == 0
function only_bomb_infinity_allowed() => settings_bullet_infinity() == 0 && settings_bomb_infinity() == 1

// Game stuff
function game_difficulty_mode() => byte(0x978918)
         easy_mode = 1
         hard_mode = 2

function game_mode() => dword(0x979914)
         game_mode_arcade = 0
         game_mode_stage_select = 1
         game_mode_cs = 4

function game_context() => byte(0x979980)
         ctx_main_menu = 1
         ctx_in_game = 2

function main_menu_current_screen() => byte(0x9799A4)

function game_in_game_timer_running() => dword(0x8EC7C8)
function game_in_game_timer_subtractor() => dword(0x979643)
function igt_current() => (game_in_game_timer_running() * 6.8) - (game_in_game_timer_subtractor()  * 6.8)
function igt_game_time_bcd() => bcd(byte(0x97962f) * 216000) + bcd(byte(0x97962e) * 3600) + bcd(byte(0x97962d) * 60)

function full_game_timer_bcd() => dword(0x97962C)
function mission_timer_bcd() => dword(0x979630)

// Mission
function game_mission() => byte(0xA0F8A6)
function mission_section() => byte(0xA0F8A7)
function mission_finished() => bit0(0x979388)
function mission_started() => bit2(0x979388)
function mission_state() => byte(0x979388)

// Players
function p1_state() => byte(0x979134)
function p2_state() => byte(0x979135)

function p1_character() => byte(0xA0FAB6)
function p1_lives() => byte(0xA0FAB7)
function p1_vehicle() => byte(0xA26D8C)
function p1_prisoners() => word(0x979778)
function p1_total_prisoners() => byte(0x979098)
function p1_continues_used() => byte(0x97909C)

function p1_score() => dword(0x9E9070)
function p1_vehicle_bonus() => byte(0x9EF280)
function p1_invincibility_frames() => byte(0xA0F6C8)
function p1_weapon() => byte(0xA0F703)
function p1_bombs() => byte(0xA0F705)
function p1_ammo() => word(0xA0F708)
function p1_bullets_fired() => byte(0xa0f6ea)
function p1_attacking() => bit4(0xa0f6fa)
function p1_clark_lifts() => byte(0xA0F719)

// Save Data
function save_data_missions_finished() => byte(0xE8F060)
function save_data_recaptured_soldiers() => sum_of(range(0, 31), b => bit(b,0xE8F080))+
                                            sum_of(range(0, 31), b => bit(b,0xE8F084))+
                                            sum_of(range(0, 31), b => bit(b,0xE8F088))+
                                            sum_of(range(0, 3), b => bit(b,0xE8F08c))

function save_data_trophy_of_war() => sum_of(range(0, 31), b => bit(b,0xE8F104))+
                                      sum_of(range(0, 8), b => bit(b,0xE8F108))

function save_data_gallery_best_ending_image_unlocked() => dword(0xE90308)
function save_data_gallery_lilly_ending_image_unlocked() => dword(0xE9030C)
function save_data_gallery_mary_ending_image_unlocked() => dword(0xE90310)

// Combat School
function combat_school_current_mission() => byte(0x978ED4)
function combat_school_pows_collected() => byte(0x979A68)
function combat_school_items_collected() => byte(0x979A7C)
function combat_school_mission_success_flag() => byte(0x979A78)

// Combat School Profiles
function combat_school_profile() => byte(0x978ed8)
base_combat_school_failed_attempts = 0xE8FEBE
base_combat_school_missions_unlocked = 0xE8FEC8
base_combat_school_finished = 0xE90004


// =========================================
//                  Utility              
// =========================================

function p1_only() => never(p1_state() == 0) && never(p2_state() > 0)
function is_hard_mode() => never(game_difficulty_mode() != hard_mode)
function is_arcade() => never(game_mode() != game_mode_arcade)
function is_arcade_or_select() => never(game_mode() != game_mode_arcade && game_mode() != game_mode_stage_select)
function is_combat_school() => never(game_mode() != game_mode_cs)
function in_game() => game_context() == ctx_in_game
function in_main_menu() => game_context() == ctx_main_menu

function mission_has_been_started() => mission_started() == 1 && prev(mission_started()) == 0 && mission_section() == 0
function mission_has_been_finished() => mission_finished() == 1 && prev(mission_finished()) == 0
function cs_mission_has_been_finished() => combat_school_mission_success_flag() == 0xFF && prev(combat_school_mission_success_flag()) == 0x00

function game_beaten() => game_mission() == 4 && mission_has_been_finished()

function logic_pows_collected_p1_sum() {
    logic_hits = []
    for i in range(1,6) {
        array_push(logic_hits, p1_state() == 1 && p1_prisoners() - prev(p1_prisoners()) >= i)
    }
    array_push(logic_hits, always_false())
    return logic_hits
}

// =========================================
//                Progression              
// =========================================

function achiev_finish_mission_route(title, description, mission_id, section_route, points) {
    achievement(title, description, points,
                trigger =   p1_only() &&
                            is_arcade_or_select() &&
                            never(game_mission() != mission_id) &&
                            once(mission_section() == section_route) &&
                            mission_has_been_finished()
                )
}

achiev_finish_mission_route("African Winds - Cliff", "Finish Mission 1 by going through the upper path.", 0, 4, 5)
achiev_finish_mission_route("African Winds - Caves", "Finish Mission 1 by going through the lower path.", 0, 2, 5)
achiev_finish_mission_route("The Illusion of El Dorado", "Finish Mission 2.", 1, 0, 5)
achiev_finish_mission_route("Asian Impact - Downtown", "Finish Mission 3 by going through the upper path.", 2, 1, 5)
achiev_finish_mission_route("Asian Impact - Utility Room", "Finish Mission 3 by going through the lower path.", 2, 2, 5)
achiev_finish_mission_route("Golden Bridge is Falling Down - Morden", "Finish Mission 4 by going through the upper path.", 3, 2, 5)
achiev_finish_mission_route("Golden Bridge is Falling Down - Rootmars", "Finish Mission 4 by going through the lower path.", 3, 1, 5)

// =========================================
//                Beat the game          
// =========================================

achievement("Piece of Cake", "Finish Arcade Game on Easy Mode (Level-4 difficulty).", 5,
            trigger = p1_only() &&
                      is_arcade() &&
                      game_difficulty_mode() == easy_mode &&
                      once(game_mission() == 0 && mission_has_been_started()) &&
                      settings_difficulty_default() &&
                      game_mission() == 4 &&
                      mission_section() == 6
            )

achievement("Ancient Law", "Finish Arcade Game on Hard Mode (Level-4 difficulty)", 5,
            trigger = p1_only() &&
                      is_arcade() &&
                      game_difficulty_mode() == hard_mode &&
                      once(game_mission() == 0 && mission_has_been_started()) &&
                      settings_difficulty_default() &&
                      game_beaten()
            )


function achiev_beat_game_char(title, description, char_id) {
    achievement(title, description, 10,
            trigger = p1_only() &&
                      is_arcade() &&
                      once(game_mission() == 0 && mission_has_been_started() && p1_character() == char_id) &&
                      never(p1_character() != char_id && p1_state() == 1) &&
                      settings_difficulty_default() &&
                      trigger_when(
                        game_beaten() ||
                        (game_mission() == 4 && mission_section() == 6)
                      )
            
            )
}

achiev_beat_game_char("Marco Rossi", "Finish Arcade Game as Marco (Level-4 difficulty).", 0)
achiev_beat_game_char("Tarma Roving", "Finish Arcade Game as Tarma (Level-4 difficulty).", 1)
achiev_beat_game_char("Eri Kasamoto", "Finish Arcade Game as Eri (Level-4 difficulty).", 2)
achiev_beat_game_char("Fio Germi", "Finish Arcade Game as Fio (Level-4 difficulty).", 3)
achiev_beat_game_char("Ralf Jones", "Finish Arcade Game as Ralf (Level-4 difficulty).", 4)
achiev_beat_game_char("Clark Still", "Finish Arcade Game as Clark (Level-4 difficulty).", 5)

// =========================================
//                 Challenges              
// =========================================

function achiev_beat_game_char_1cc(title, description, char_id) {
    achievement(title, description, 50,
            trigger = p1_only() &&
                      is_arcade() &&
                      is_hard_mode() &&
                      once(game_mission() == 0 && mission_has_been_started() && p1_character() == char_id) &&
                      never(p1_character() != char_id && p1_state() == 1) &&
                      never(p1_continues_used() > 0) &&
                      settings_hero_default() &&
                      settings_difficulty_default() &&
                      no_infinity_settings() &&
                      trigger_when(game_beaten())
            )
}

achiev_beat_game_char_1cc("Handgun Specialist", "Finish Arcade Game without using a continue as Marco on Hard Mode (Level-4 difficulty, Hero 3).", 0)
achiev_beat_game_char_1cc("Vehicles Specialist", "Finish Arcade Game without using a continue as Tarma on Hard Mode (Level-4 difficulty, Hero 3).", 1)
achiev_beat_game_char_1cc("Bombs Specialist", "Finish Arcade Game without using a continue as Eri on Hard Mode (Level-4 difficulty, Hero 3).", 2)
achiev_beat_game_char_1cc("Weapons Specialist", "Finish Arcade Game without using a continue as Fio on Hard Mode (Level-4 difficulty, Hero 3).", 3)
achiev_beat_game_char_1cc("Punch Specialist", "Finish Arcade Game without using a continue as Ralf on Hard Mode (Level-4 difficulty, Hero 3).", 4)
achiev_beat_game_char_1cc("Grab Specialist", "Finish Arcade Game without using a continue as Clark on Hard Mode (Level-4 difficulty, Hero 3).", 5)

achievement("MS6 Survival Attack", "Finish Arcade Game without dying and not using vehicles, with bullet infinity enabled (Level-4 difficulty).", 50,
            trigger = p1_only() &&
                      is_arcade() &&
                      is_hard_mode() &&
                      once(game_mission() == 0 && mission_has_been_started()) &&
                      never(p1_vehicle() == 0x01) &&
                      never(p1_vehicle() == 0x04) &&
                      never(p1_vehicle() == 0x15) &&
                      never(p1_vehicle() == 0x17) &&
                      never(p1_vehicle() == 0x19) &&
                      never(p1_lives() != prev(p1_lives())) &&
                      settings_difficulty_default() &&
                      only_bullet_infinity_allowed() &&
                      trigger_when(game_beaten())
            )

achievement("Bomb Attack", "Finish Arcade Game without dying and never attacking, with bomb infinity enabled as Eri (Level-4 difficulty).", 50,
            trigger = p1_only() &&
                      is_arcade() &&
                      is_hard_mode() &&
                      p1_character() == 0x02 && 
                      once(game_mission() == 0 && mission_has_been_started()) &&
                      never(p1_bullets_fired() > prev(p1_bullets_fired()) ) &&
                      never(p1_attacking() > prev(p1_attacking()) ) &&
                      never(p1_lives() != prev(p1_lives())) &&
                      settings_difficulty_default() &&
                      only_bomb_infinity_allowed() &&
                      trigger_when(game_beaten())
            )

achievement("Aim High Chase Fast", "Finish Arcade Game within 28 minutes (Level-4 difficulty).", 50,
            trigger = p1_only() &&
                      is_arcade() &&
                      is_hard_mode() &&
                      once(game_mission() == 0 && mission_has_been_started()) &&
                      igt_current() + igt_game_time_bcd() <= 100800 &&
                      settings_difficulty_default() &&
                      no_infinity_settings() &&
                      trigger_when(game_beaten())
            )

achievement("Biotoxic", "Finish Arcade Game using less than 10 continues on Hard Mode and Level-8 difficulty.", 50,
            trigger = p1_only() &&
                      is_arcade() &&
                      is_hard_mode() &&
                      once(game_mission() == 0 && mission_has_been_started()) &&
                      never( tally(10, p1_continues_used() > prev(p1_continues_used())) ) &&
                      settings_difficulty_level8() &&
                      trigger_when(game_beaten())
            )


// =========================================
//                    Misc              
// =========================================

function achiev_finish_with_vehicle(title, description, mission_id, vehicle_id, points) {
    achievement(title, description, points,
                trigger =   p1_only() &&
                            is_arcade_or_select() &&
                            game_mission() == mission_id &&
                            settings_difficulty_default() &&
                            p1_vehicle_bonus() == vehicle_id &&
                            mission_has_been_finished()
                )
}

achiev_finish_with_vehicle("Super Vehicle", "Finish Mission 1 with the SV-001 (Metal Slug) (Level-4 difficulty).", 0, 0x01, 2)
achiev_finish_with_vehicle("LV Armor Prototype", "Finish Mission 3 with the Protogunner (Level-4 difficulty).", 2, 0x15, 3)
achiev_finish_with_vehicle("Slug Flyer", "Finish Mission 4 with the Slug Flyer (Level-4 difficulty).", 3, 0x04, 5)
achiev_finish_with_vehicle("Enhanced Metal Slug", "Finish Mission 5 with the SV-001 Type-R (Metal Slug) (Level-4 difficulty).", 4, 0x01, 5)

achievement("The Military System VI", "Reach 10 million score.", 5,
            trigger =   p1_only() &&
                        is_arcade_or_select() &&
                        p1_score() >= 0x10000000 &&
                        prev(p1_score()) < 0x10000000
            )

achievement("Messiah VI", "Recapture all 100 prisoners from the Soldiers List.", 25,
            trigger =   p1_only() &&
                        is_arcade_or_select() &&
                        measured(save_data_recaptured_soldiers() == 100) && 
                        prev(save_data_recaptured_soldiers()) == 99
            )

achievement("Full of Junk VI", "Collect all 41 items from the Trophy of War.", 25,
            trigger =   p1_only() &&
                        is_arcade_or_select() &&
                        measured(save_data_trophy_of_war() == 41) && 
                        prev(save_data_trophy_of_war()) < 41
            )

// =========================================
//           POWs Collection Route           
// =========================================

function achiev_collect_pows_route(title, description, mission_id, pows_amount, section_to_go, points, cheevo_id) {
    achievement(title, description, points,
                trigger =   is_arcade_or_select() &&
                            never(game_mission() != mission_id) &&
                            once(mission_section() == section_to_go) &&
                            measured(tally(pows_amount, logic_pows_collected_p1_sum()), once(mission_section() == section_to_go))
                )
}

achiev_collect_pows_route("African Prisoners", "Collect 20 POWs on Mission 1 by going through the upper path.", 0, 20, 4, 10, 0)
achiev_collect_pows_route("Cave Prisoners", "Collect 20 POWs on Mission 1 by going through the lower path.", 0, 20, 2, 10, 0)
achiev_collect_pows_route("The Prisoner from El Dorado", "Collect 20 POWs on Mission 2.", 1, 20, 0, 10, 0)
achiev_collect_pows_route("Downtown Prisoner", "Collect 20 POWs on Mission 3 by going through the upper path.", 2, 20, 1, 10, 0)
achiev_collect_pows_route("Asian Prisoner", "Collect 20 POWs on Mission 3 by going through the lower path.", 2, 20, 2, 10, 0)
achiev_collect_pows_route("Golden Prisoner is Falling Down", "Collect 20 POWs on Mission 4.", 3, 20, 0, 10, 0)
achiev_collect_pows_route("Ancient Prisoner", "Collect 20 POWs on Mission 5.", 4, 20, 0, 10, 0)




// =========================================
//               Combat School              
// =========================================

function achiev_finish_cs_mission(title, cs_mission_id, points) {
    achievement(title, format("Finish Mission {0} from Combat School.", cs_mission_id + 1), points,
                trigger =   p1_only() &&
                            is_combat_school() &&
                            combat_school_current_mission() == cs_mission_id &&
                            cs_mission_has_been_finished()  
                )
}

achiev_finish_cs_mission("African Winds 100%", 4, 25)
achiev_finish_cs_mission("The Illusion of El Dorado 100%", 8, 25)
achiev_finish_cs_mission("Asian Impact 100%", 13, 25)
achiev_finish_cs_mission("Golden Bridge is Falling Down 100%", 20, 25)
achiev_finish_cs_mission("Ancient Law 100%", 25, 50)

achievement("Harem Ending", "Unlock the special ending image from the art gallery.", 50,
            trigger =   is_combat_school() &&
                        trigger_when(save_data_gallery_best_ending_image_unlocked() == 0xFF &&
                                     prev(save_data_gallery_best_ending_image_unlocked()) == 0x00) &&
                        (
                            (combat_school_profile() == 0 && word(base_combat_school_failed_attempts + (384 * 0)) == 0) ||
                            (combat_school_profile() == 1 && word(base_combat_school_failed_attempts + (384 * 1)) == 0) ||
                            (combat_school_profile() == 2 && word(base_combat_school_failed_attempts + (384 * 2)) == 0)
                        )

            )

achievement("Riviera \"Lilly\" von Wittenberg", "Unlock Lilly's ending image from the art gallery.", 25,
            trigger =   is_combat_school() &&
                        trigger_when(save_data_gallery_lilly_ending_image_unlocked() == 0xFF &&
                                     prev(save_data_gallery_lilly_ending_image_unlocked()) == 0x00) &&
                        (
                            (combat_school_profile() == 0 && word(base_combat_school_failed_attempts + (384 * 0)) < 10 && word(base_combat_school_failed_attempts + (384 * 0)) > 0) ||
                            (combat_school_profile() == 1 && word(base_combat_school_failed_attempts + (384 * 1)) < 10 && word(base_combat_school_failed_attempts + (384 * 1)) > 0) ||
                            (combat_school_profile() == 2 && word(base_combat_school_failed_attempts + (384 * 2)) < 10 && word(base_combat_school_failed_attempts + (384 * 2)) > 0)
                        )

            )

achievement("Maryell \"Mary\" von Wittenberg", "Unlock Mary's ending image from the art gallery.", 25,
            trigger =   is_combat_school() &&
                        trigger_when(save_data_gallery_mary_ending_image_unlocked() == 0xFF &&
                                     prev(save_data_gallery_mary_ending_image_unlocked()) == 0x00) &&
                        (
                            (combat_school_profile() == 0 && word(base_combat_school_failed_attempts + (384 * 0)) >= 10) ||
                            (combat_school_profile() == 1 && word(base_combat_school_failed_attempts + (384 * 1)) >= 10) ||
                            (combat_school_profile() == 2 && word(base_combat_school_failed_attempts + (384 * 2)) >= 10)
                        )

            )



// =========================================
//                Leaderboards              
// =========================================

function lb_mission_speedrun(mission_id) {
    leaderboard(format("Mission {0} Speedrun", mission_id + 1), format("Finish Mission {0} the fastest as possible (Level-4 difficulty, Hard Mode).", mission_id + 1),
               start = p1_only() && is_arcade() && game_mission() == mission_id && mission_has_been_started() && settings_difficulty_default() && no_infinity_settings() && is_hard_mode(),
               cancel = p1_state() == 0 || p2_state() > 0 || game_mission() != mission_id || in_main_menu(),
               submit = mission_has_been_finished(),
               value =  measured(igt_current() + 0x01),
               format = "FRAMES", lower_is_better=true
               )
}

lb_mission_speedrun(0)
lb_mission_speedrun(1)
lb_mission_speedrun(2)
lb_mission_speedrun(3)
lb_mission_speedrun(4)

function lb_mission_items_collection(mission_id, mission_id2) {
    leaderboard(format("Items Collector {0}", mission_id + 1), format("Finish Mission {0} from the Combat School with the highest amount of items collected.", mission_id2 + 1),
               start = p1_only() && is_combat_school() && combat_school_current_mission() == mission_id2 && mission_has_been_started(),
               cancel = p1_state() == 0 || p2_state() > 0 || combat_school_current_mission() != mission_id2 || in_main_menu(),
               submit = combat_school_mission_success_flag() > 0 && prev(combat_school_mission_success_flag()) == 0,
               value = measured(combat_school_items_collected()),
               format = "VALUE", lower_is_better=false
               )
}

lb_mission_items_collection(0, 2)
lb_mission_items_collection(1, 7)
lb_mission_items_collection(2, 12)
lb_mission_items_collection(3, 17)
lb_mission_items_collection(4, 22)

leaderboard("High Score", "Finish Arcade Game with the highest score as you can (Level-4 difficulty).",
           start = p1_only() && game_mission() == 4 && mission_has_been_finished() && no_infinity_settings(),
           cancel = p1_state() == 0 || p2_state() > 0 || in_main_menu(),
           submit = game_mission() == 4 && mission_has_been_finished(),
           value = bcd(p1_score()),
           format = "VALUE", lower_is_better=false
           )

leaderboard("POWs Collector", "Finish Arcade Game with the highest amount of prisoners collected (Level-4 difficulty).",
           start = p1_only() && is_arcade() && game_mission() == 0 && mission_has_been_started() && no_infinity_settings(),
           cancel = p1_state() == 0 || p2_state() > 0 || in_main_menu(),
           submit = game_mission() == 4 && mission_has_been_finished(),
           value = p1_total_prisoners(),
           format = "VALUE", lower_is_better=false
           )