// Metal Slug 3
// #ID = 20521

// Settings
function settings_hero() => byte(0x59CE24)
function settings_hero_default() => byte(0x59CE24) == 0x03
function settings_difficulty() => byte(0x59CE25)
function settings_difficulty_default() => byte(0x59CE25) >= 0x02
function settings_difficulty_veryhard() => byte(0x59CE25) == 0x04

// Game and Mission stuff
function game_mode() => byte(0x59D110)
function game_arcade_timer() => dword(0x59D220)
function game_display_mode() => byte(0x59FAA0)
function game_paused() => byte(0x67FFD2)
function game_mission() => byte(0x67A7B8)

function mission_section() => byte(0x67A7B9)
function mission_finished() => bit0(0x688F99)
function mission_started() => bit2(0x688F99)
function mission_bgm() => byte(0x688F9C)

function all_items_war_booty() => sum_of(range(0, 37), index => bit0(0x59cdf4 + index))

// UFO Mini Game
function ufo_current_soldier() => byte(0x62D1E0)
function ufo_finished() => byte(0x62D1F8)

// P1
function p1_lives() => byte(0x67A667)
function p1_char() => byte(0x67A912)
function p1_form() => byte(0x67a93a)

function p1_continues_used() => byte(0x688EB4)
function p1_total_prisoners() => byte(0x688EB8)
function p1_score_BE() => dword_be(0x688FEA)
function p1_prisoners() => byte(0x68913C)
function p1_bonus_vehicle() => byte(0x688fa8)

function p1_active_state() => byte(0x68A156)
function p2_active_state() => byte(0x68a157)

// =========================================
//                  Utility              
// =========================================

function p1_only() => p1_active_state() > 0 && p2_active_state() == 0
function is_60hz() => game_display_mode() == 0
function is_arcade() => game_mode() == 0x00 && p1_only()
function is_ufo_game() => game_mode() == 0x01 && p1_only()

function mission_has_been_started() => mission_started() == 1 && prev(mission_started()) == 0 && mission_section() == 0
function mission_has_been_finished() => mission_finished() == 1 && prev(mission_finished()) == 0

function ufo_has_been_finished() => ufo_finished() == 1 && prev(ufo_finished()) == 0

function game_beaten() => game_mission() == 4 && mission_has_been_finished()

// =========================================
//                Progression              
// =========================================

function achiev_finish_mission_route(title, description, mission_id, section_route, points) {
    achievement(title, description, points,
                trigger =   is_arcade() &&
                            never(game_mission() != mission_id) &&
                            once(mission_section() == section_route) &&
                            settings_difficulty_default() &&
                            mission_has_been_finished()
                )
}

function achiev_finish_mission_no_route(title, description, mission_id, section_route_reset, points) {
    achievement(title, description, points,
                trigger =   is_arcade() &&
                            never(game_mission() != mission_id) &&
                            never(mission_section() >= section_route_reset) && // reset if value is higher than the default route
                            once(mission_has_been_started()) &&
                            settings_difficulty_default() &&
                            mission_has_been_finished()
                )
}

achiev_finish_mission_no_route("The Island of Dr. Moreau", "Finish Mission 1 without taking any detours (Normal difficulty).", 0, 1, 5)
achiev_finish_mission_route("Marine Diver", "Finish Mission 1 by going through the ocean depths detour (Normal difficulty).", 0, 1, 5)
achiev_finish_mission_route("The Unknown World", "Finish Mission 1 by going through the core facility detour (Normal difficulty).", 0, 3, 5)
achiev_finish_mission_no_route("The Midnight Wandering", "Finish Mission 2 without taking any detours", 1, 1, 5)
achiev_finish_mission_route("Devil's Snow Cave", "Finish Mission 2 by going through ice cave detour (Normal difficulty).", 1, 3, 5)
achiev_finish_mission_no_route("The Shallow Sea", "Finish Mission 3 without taking detours (Normal difficulty).", 2, 4, 5)
achiev_finish_mission_route("Hard Water", "Finish Mission 3 by going through the underground channel detour (Normal difficulty).", 2, 4, 5)
achiev_finish_mission_route("Bridge Assault", "Finish Mission 3 by going through the bridge detour (Normal difficulty).", 2, 6, 5)
achiev_finish_mission_route("Desert", "Finish Mission 4 by going through the top detour (Normal difficulty).", 3, 2, 5)
achiev_finish_mission_route("The Japanese Army", "Finish Mission 4 by going through the ex-military hideout detour (Normal difficulty).", 3, 5, 5)
achiev_finish_mission_route("The Cenotaph", "Finish Mission 4 by going through the underground detour (Normal difficulty).", 3, 7, 5)
achiev_finish_mission_route("Pyramid", "Finish Mission 4 by going through the pyramid detour (Normal difficulty).", 3, 11, 5)
achiev_finish_mission_route("Metamorphosis", "Beat the game (Normal difficulty).", 4, 0, 10)

// =========================================
//                 Deathless             
// =========================================

// function achiev_finish_mission_deathless(title, mission_id, points) {
//     achievement(title, format("Finish Mission {0} without dying on Arcade Mission (Normal difficulty, 60hz).", mission_id + 1), points,
//                 trigger =   is_arcade() &&
//                             is_60hz() &&
//                             never(game_mission() != mission_id) &&
//                             never(p1_lives() < prev(p1_lives)) && // lose a live
//                             never(p1_active_state() == 2) && // lose a continue
//                             once(mission_has_been_started()) &&
//                             trigger_when(mission_has_been_finished())
//                 )
// }

// achiev_finish_mission_deathless("A Couple's Love Land", 0, 10)
// achiev_finish_mission_deathless("Wandering at Midnight", 1, 25)
// achiev_finish_mission_deathless("Eyes Over the Waves", 2, 25)
// achiev_finish_mission_deathless("Tombstone of Sand", 3, 25)
// achiev_finish_mission_deathless("All About Love", 4, 50)

// New achievement for routes
function achiev_finish_mission_route_deathless(title, description, mission_id, section_route, points) {
    achievement(title + " Challenge", description, points,
                trigger =   is_arcade() &&
                            is_60hz() &&
                            never(game_mission() != mission_id) &&
                            once(mission_has_been_started()) &&
                            once(mission_section() == section_route) &&
                            never(p1_lives() < prev(p1_lives())) && // lose a live
                            never(p1_active_state() == 2) && // lose a continue
                            never(p1_active_state() == 0 && p2_active_state() == 0) &&
                            settings_difficulty_default() &&
                            trigger_when(mission_has_been_finished())
                )
}

function achiev_finish_mission_route_3deathes(title, description, mission_id, section_route, points) {
    achievement(title + " Challenge", description, points,
                trigger =   is_arcade() &&
                            is_60hz() &&
                            never(game_mission() != mission_id) &&
                            once(mission_has_been_started()) &&
                            once(mission_section() == section_route) &&
                             never(tally(3, p1_lives() < prev(p1_lives()), // lose a live
                                           p1_active_state() == 2 && prev(p1_active_state()) == 1 // lose a continue
                                  )) && 
                            never(p1_active_state() == 0 && p2_active_state() == 0) &&
                            settings_difficulty_default() &&
                            trigger_when(mission_has_been_finished())
                )
}

function achiev_finish_mission_no_route_deathless(title, description, mission_id, section_route_reset, points) {
    achievement(title + " Challenge", description, points,
                trigger =   is_arcade() &&
                            is_60hz() &&
                            never(game_mission() != mission_id) &&
                            once(mission_has_been_started()) &&
                            never(mission_section() >= section_route_reset) && // reset if value is higher than the default route
                            never(p1_lives() < prev(p1_lives())) && // lose a live
                            never(p1_active_state() == 2) && // lose a continue
                            never(p1_active_state() == 0 && p2_active_state() == 0) &&
                            settings_difficulty_default() &&
                            trigger_when(mission_has_been_finished())
                )
}

// function achiev_finish_mission_no_route_3deathes(title, description, mission_id, section_route_reset, points) {
//     achievement(title + " Challenge", description, points,
//                 trigger =   is_arcade() &&
//                             never(game_mission() != mission_id) &&
//                             once(mission_has_been_started()) &&
//                             never(mission_section() >= section_route_reset) && // reset if value is higher than the default route
//                             never(tally(3, p1_lives() < prev(p1_lives()), // lose a live
//                                            p1_active_state() == 2 && prev(p1_active_state()) == 1 // lose a continue
//                                   )) && 
//                             trigger_when(mission_has_been_finished())
//                 )
// }

achiev_finish_mission_no_route_deathless("The Island of Dr. Moreau", "Finish Mission 1 without dying and without taking any detours (Normal difficulty, 60hz).", 0, 1, 25)
achiev_finish_mission_route_deathless("Marine Diver", "Finish Mission 1 without dying by going through the ocean depths detour (Normal difficulty, 60hz).", 0, 1, 25)
achiev_finish_mission_route_deathless("The Unknown World", "Finish Mission 1 without dying by going through the core facility detour (Normal difficulty, 60hz).", 0, 3, 25)

achiev_finish_mission_no_route_deathless("The Midnight Wandering", "Finish Mission 2 without dying and without taking any detours (Normal difficulty, 60hz).", 1, 1, 25)
achiev_finish_mission_route_deathless("Devil's Snow Cave", "Finish Mission 2 without dying by going through ice cave detour (Normal difficulty, 60hz).", 1, 3, 25)

achiev_finish_mission_no_route_deathless("The Shallow Sea", "Finish Mission 3 without dying and without taking detours (Normal difficulty, 60hz).", 2, 4, 25)
achiev_finish_mission_route_deathless("Hard Water", "Finish Mission 3 without dying by going through the underground channel detour (Normal difficulty, 60hz).", 2, 4, 25)
achiev_finish_mission_route_deathless("Bridge Assault", "Finish Mission 3 without dying by going through the bridge detour (Normal difficulty, 60hz).", 2, 6, 25)

achiev_finish_mission_route_3deathes("Desert", "Finish Mission 4 without dying 3 times by going through the top detour (Normal difficulty, 60hz).", 3, 2, 25)
achiev_finish_mission_route_3deathes("The Japanese Army", "Finish Mission 4 without dying 3 times by going through the ex-military hideout detour (Normal difficulty, 60hz).", 3, 5, 25)
achiev_finish_mission_route_3deathes("The Cenotaph", "Finish Mission 4 without dying 3 times by going through the underground detour (Normal difficulty, 60hz).", 3, 7, 25)
achiev_finish_mission_route_3deathes("Pyramid", "Finish Mission 4 without dying by 3 times going through the pyramid detour (Normal difficulty, 60hz).", 3, 10, 25)

achiev_finish_mission_route_deathless("Metamorphosis", "Finish Mission 5 without dying (Normal difficulty, 60hz).", 4, 0, 50)

// =========================================
//                 Speedrun             
// =========================================

function achiev_finish_mission_speedrun(title, description, mission_id, time_frames, points) {
    achievement(title, description, points,
                trigger =   is_arcade() &&
                            is_60hz() &&
                            never(game_mission() != mission_id) &&
                            never( repeated(time_frames, once(mission_has_been_started()) && always_true()) ) &&
                            once(mission_has_been_started()) &&
                            settings_difficulty_default() &&
                            trigger_when(mission_has_been_finished())
                )
}

achiev_finish_mission_speedrun("Island Speedrun", "Finish Mission 1 within 2m10s (Normal Difficulty, 60hz).", 0, 7800, 25)
achiev_finish_mission_speedrun("Midnight Speedrun", "Finish Mission 2 within 2m30s (Normal Difficulty, 60hz).", 1, 9000
, 25)
achiev_finish_mission_speedrun("Sea Speedrun", "Finish Mission 3 within 2m30s (Normal Difficulty, 60hz).", 2, 9000, 25)
achiev_finish_mission_speedrun("Desert Speedrun", "Finish Mission 4 within 3m40s (Normal Difficulty, 60hz).", 3, 12600 + 600
, 25)
achiev_finish_mission_speedrun("UFO Speedrun", "Finish Final Mission within 21m0s (Normal Difficulty, 60hz).", 4, 75600, 50)


// =========================================
//                 Full Game              
// =========================================

achievement("Into The Cosmos", "Beat the game on Very Hard difficulty (60hz).", 25,
                trigger =   is_arcade() &&
                            is_60hz() &&
                            once(mission_has_been_started() && game_mission() == 0) &&
                            settings_difficulty_veryhard() &&
                            game_beaten()
            )

achievement("The Military System III", "Beat the game with over 3 million score (Normal difficulty, 60hz).", 10,
                trigger =   is_arcade() &&
                            is_60hz() &&
                            p1_score_BE() >= 0x03000000 &&
                            settings_difficulty_default() &&
                            game_beaten()
            )

achievement("Bioinformatics", "Beat the game without using a continue on Normal difficulty (Hero 3, 60hz).", 50,
                trigger =   is_arcade() &&
                            is_60hz() &&
                            once(mission_has_been_started() && game_mission() == 0) &&
                            never(p1_continues_used() == 1) &&
                            never(p1_active_state() == 0 && p2_active_state() == 0) &&
                            settings_hero_default() &&
                            settings_difficulty_default() &&
                            trigger_when(game_beaten())
            )

// =========================================
//                  UFO Game              
// =========================================

achievement("Grenade vs. Aliens", "Finish Storming the UFO Mothership as Normal Soldier (60hz).", 25,
            trigger =   is_ufo_game() &&
                        is_60hz() &&
                        ufo_current_soldier() == 0 &&
                        ufo_has_been_finished()
            )

achievement("Bazooka vs. Aliens", "Finish Storming the UFO Mothership as Bazooka Soldier (60hz).", 25,
            trigger =   is_ufo_game() &&
                        is_60hz() &&
                        ufo_current_soldier() == 1 &&
                        ufo_has_been_finished()
            )

achievement("Shield vs. Aliens", "Finish Storming the UFO Mothership as Shield Soldier (60hz).", 25,
            trigger =   is_ufo_game() &&
                        is_60hz() &&
                        ufo_current_soldier() == 2 &&
                        ufo_has_been_finished()
            )


// =========================================
//             Vehicles and Forms            
// =========================================

achievement("Metal Slug I", "Finish Mission 1 with a Metal Slug (Normal difficulty, 60hz).", 5,
            trigger =   is_arcade() &&
                        is_60hz() &&
                        game_mission() == 0 &&
                        p1_bonus_vehicle() == 1 &&
                        mission_has_been_finished(),
            id = 259560
            )

achievement("Slugnoid", "Finish Mission 1 with a Slugnoid (Normal difficulty, 60hz).", 5,
            trigger =   is_arcade() &&
                        is_60hz() &&
                        game_mission() == 0 &&
                        p1_bonus_vehicle() == 3 &&
                        mission_has_been_finished(),
            id = 259723
            )

achievement("LV Armor", "Finish Mission 3 with a LV Armor (Normal difficulty, 60hz).", 5,
            trigger =   is_arcade() &&
                        is_60hz() &&
                        game_mission() == 2 &&
                        p1_bonus_vehicle() > 0 &&
                        mission_has_been_finished(),
            id = 259561
            )

achievement("Metal Slug II", "Finish Final Mission with a Metal Slug (Normal difficulty, 60hz).", 10,
            trigger =   is_arcade() &&
                        is_60hz() &&
                        game_mission() == 4 &&
                        p1_bonus_vehicle() > 0 &&
                        mission_has_been_finished(),
            id = 259562
            )

achievement("Heavy Soldier", "Finish Mission 1 while being fat (Normal difficulty, 60hz).", 5,
            trigger =   is_arcade() &&
                        is_60hz() &&
                        game_mission() == 0 &&
                        p1_form() == 2 &&
                        mission_has_been_finished()
            )

achievement("Vomit Bomb", "Finish Mission 2 while transformed into a zombie (Normal difficulty, 60hz).", 10,
            trigger =   is_arcade() &&
                        is_60hz() &&
                        game_mission() == 1 &&
                        p1_form() == 7 &&
                        mission_has_been_finished()
            )

// =========================================
//         Prisoners and Collectables              
// =========================================

achievement("Items Collector MS3 I", "Collect 25% of the total items in the game.", 5,
            trigger =   is_arcade() &&
                        measured(all_items_war_booty() >= 9) &&
                        prev(all_items_war_booty()) < 9
            )

achievement("Items Collector MS3 II", "Collect 50% of the total items in the game.", 10,
            trigger =   is_arcade() &&
                        measured(all_items_war_booty() >= 19) &&
                        prev(all_items_war_booty()) < 19
            )

achievement("Items Collector MS3 III", "Collect 75% of the total items in the game.", 10,
            trigger =   is_arcade() &&
                        measured(all_items_war_booty() >= 28) &&
                        prev(all_items_war_booty()) < 28
            )

achievement("Items Collector MS3 IV", "Collect 100% of the total items in the game.", 25,
            trigger =   is_arcade() &&
                        measured(all_items_war_booty() >= 38) &&
                        prev(all_items_war_booty()) < 38
            )

function logic_pows_collected_p1_and_p2_sum() {
    logic_hits = []
    for i in range(1,6) {
        array_push(logic_hits, p1_active_state() == 1 && p1_prisoners() - prev(p1_prisoners()) >= i)
    }
    array_push(logic_hits, always_false())
    return logic_hits
}

function achiev_collect_pows_route(title, description, mission_id, pows_amount, section_to_go, points, cheevo_id) {
    achievement(title, description, points,
                trigger =   is_arcade() &&
                            never(game_mission() != mission_id) &&
                            never(p1_active_state() == 0 && p2_active_state() == 0) &&
                            once(mission_section() == section_to_go) &&
                            measured(tally(pows_amount, logic_pows_collected_p1_and_p2_sum()), once(mission_section() == section_to_go))
                )
}

function achiev_collect_pows_no_route(title, description, mission_id, pows_amount, section_reset, points, cheevo_id) {
    achievement(title, description, points,
                trigger =   is_arcade() &&
                            never(game_mission() != mission_id) &&
                            never(p1_active_state() == 0 && p2_active_state() == 0) &&
                            never(mission_section() >= section_reset) && // reset if value is higher than the default route
                            once(mission_has_been_started()) &&
                            measured(tally(pows_amount, logic_pows_collected_p1_and_p2_sum()), once(mission_section() == 0x00))
                )
}

achiev_collect_pows_no_route("The Island of Dr. Prisoner", "Collect 22 POWs in Mission 1 without taking detours (Normal difficulty).", 0, 22, 1, 10, 0)
achiev_collect_pows_route("Prisoner Diver", "Collect 18 POWs in Mission 1 by going through ocean depths detour (Normal difficulty).", 0, 18, 1, 10, 0)
achiev_collect_pows_route("The Unknown Prisoner", "Collect 16 POWs in Mission 1 by going through core facility detour (Normal difficulty).", 0, 16, 3, 10, 0)
achiev_collect_pows_no_route("The Midnight Prisoner", "Collect 12 POWs in Mission 2 without taking the detours (Normal difficulty).", 1, 12, 1, 10, 0)
achiev_collect_pows_route("Prisoner's Snow Cave", "Collect 23 POWs in Mission 2 by going through the ice cave detour (Normal difficulty).", 1, 23, 3, 10, 0)
achiev_collect_pows_no_route("The Shallow Prisoner", "Collect 13 POWs in Mission 3 without taking any detours (Normal difficulty).", 2, 13, 4, 10, 0)
achiev_collect_pows_route("Hard Prisoner", "Collect 11 POWs in Mission 3 by going through underground channel detour (Normal difficulty).", 2, 11, 4, 10, 0)
achiev_collect_pows_route("Assault Prisoner", "Collect 13 POWs in Mission 3 by going through the bridge detour (Normal difficulty).", 2, 13, 6, 10, 0)
achiev_collect_pows_route("Desert Prisoner", "Collect 18 POWs in Mission 4 by going through the top route (Normal difficulty).", 3, 18, 2, 10, 0)
achiev_collect_pows_route("The Japanese Prisoner", "Collect 18 POWs in Mission 4 by going through the ex-military hideout detour (Normal difficulty).", 3, 18, 5, 10, 0)
achiev_collect_pows_route("The Prisoner", "Collect 22 POWs in Mission 4 by going through the ancient ruins detour (Normal difficulty).", 3, 22, 7, 10, 0)
achiev_collect_pows_route("Pyramid Prisoner", "Collect 24 POWs in Mission 4 by going through the desert detour (Normal difficulty).", 3, 24, 1, 10, 0)
achiev_collect_pows_route("All About Prisoner", "Collect 16 POWs in FInal Mission (Normal difficulty).", 4, 16, 0, 10, 0)

// =========================================
//                Leaderboards              
// =========================================

function lb_mission_speedrun(mission_id) {
    leaderboard(format("Mission {0} - Speedrun", mission_id + 1), format("Finish Mission {0} the fastest as possible (Normal difficulty, 60hz).", mission_id + 1),
               start = is_arcade() && game_mission() == mission_id && mission_has_been_started() && settings_difficulty_default() && is_60hz(),
               cancel = p1_active_state() == 0 || p2_active_state() > 0 || game_mission() != mission_id,
               submit = mission_has_been_finished(),
               value = measured(always_true()),
               format = "FRAMES", lower_is_better=true
               )
}

lb_mission_speedrun(0)
lb_mission_speedrun(1)
lb_mission_speedrun(2)
lb_mission_speedrun(3)
lb_mission_speedrun(4)

leaderboard("Metal Slug 3 - Normal Speedrun", "Finish Arcade Mission the fastest as possible (Normal difficulty, 60hz).",
           start = is_arcade() && game_mission() == 0 && mission_has_been_started() && settings_difficulty() == 2 && is_60hz(),
           cancel = p1_active_state() == 0 || p2_active_state() > 0,
           submit = game_mission() == 4 && mission_has_been_finished(),
           value = measured(tally(0, game_arcade_timer() > prev(game_arcade_timer()))),
           format = "FRAMES", lower_is_better=true
           )

leaderboard("Metal Slug 3 - Very Hard Speedrun", "Finish Arcade Mission the fastest as possible (Very Hard difficulty, 60hz).",
           start = is_arcade() && game_mission() == 0 && mission_has_been_started() && settings_difficulty_veryhard() && is_60hz(),
           cancel = p1_active_state() == 0 || p2_active_state() > 0,
           submit = game_mission() == 4 && mission_has_been_finished(),
           value = measured(tally(0, game_arcade_timer() > prev(game_arcade_timer()))),
           format = "FRAMES", lower_is_better=true
           )

leaderboard("Metal Slug 3 - High Score", "Finish Arcade Mission with the highest score possible (60hz).",
           start = game_mission() == 4 && mission_has_been_finished() && is_60hz(),
           cancel = p1_active_state() == 0 || p2_active_state() > 0,
           submit = game_mission() == 4 && mission_has_been_finished() && is_60hz(),
           value = bcd(p1_score_BE()),
           format = "VALUE", lower_is_better=false
           )

leaderboard("POWs Collector", "Finish Arcade Mission with the highest amount of prisoners recaptured (60hz).",
           start = is_arcade() && game_mission() == 0 && mission_has_been_started() && is_60hz(),
           cancel = p1_active_state() == 0 || p2_active_state() > 0,
           submit = game_mission() == 4 && mission_has_been_finished(),
           value = p1_total_prisoners(),
           format = "VALUE", lower_is_better=false
           )

leaderboard("Coin Saver - Normal", "Finish Arcade Mission with the lowest amount of continues used (Normal difficulty, Hero 3, 60hz).",
           start = is_arcade() && game_mission() == 0 && mission_has_been_started() && settings_difficulty() == 2 && settings_hero_default() && is_60hz(),
           cancel = p1_active_state() == 0 || p2_active_state() > 0,
           submit = game_mission() == 4 && mission_has_been_finished(),
           value = measured(tally(0, p1_continues_used() > prev(p1_continues_used()))),
           format = "VALUE", lower_is_better=true
           )

leaderboard("Coin Saver - Very Hard", "Finish Arcade Mission with the lowest amount of continues used (Very Hard difficulty, Hero 3, 60hz).",
           start = is_arcade() && game_mission() == 0 && mission_has_been_started() && settings_difficulty_veryhard() && settings_hero_default() && is_60hz(),
           cancel = p1_active_state() == 0 || p2_active_state() > 0,
           submit = game_mission() == 4 && mission_has_been_finished(),
           value = measured(tally(0, p1_continues_used() > prev(p1_continues_used()))),
           format = "VALUE", lower_is_better=true
           )

// =========================================
//               Rich Presence              
// =========================================

dict_difficulty = {
    1: "Easy",
    2: "Normal",
    3: "Hard",
    4: "Very Hard"
}

dict_ufo_game_characters = {
    0: "Normal Soldier",
    1: "Bazooka Soldier",
    2: "Shield Soldier",
}

// rich_presence_conditional_display(game_mode() == 0 && (p1_active_state() > 0 || p2_active_state() > 0) && game_arcade_timer() != 0xFFFFFFFF, "Arcade Mission - Mission {0} on {1} difficulty, ⏰ {2}", 
//                                   rich_presence_macro("Number", game_mission() + 1), 
//                                   rich_presence_lookup("Difficulty", settings_difficulty(), dict_difficulty),
//                                   rich_presence_macro("Centisecs", game_arcade_timer())
//                                   )

// rich_presence_conditional_display(game_mode() == 0 && (p1_active_state() > 0 || p2_active_state() > 0), "Arcade Mission - Mission {0} on {1} difficulty", 
//                                   rich_presence_macro("Number", game_mission() + 1), 
//                                   rich_presence_lookup("Difficulty", settings_difficulty(), dict_difficulty)
//                                   )

// rich_presence_conditional_display(game_mode() == 1, "Storming the Mother Ship - Playing as {0}", 
//                                   rich_presence_lookup("UFOCharacters", ufo_current_soldier(), dict_ufo_game_characters)
//                                   )

// rich_presence_conditional_display(game_mode() == 2, "Chubby Island Paradise")

// rich_presence_display("Adventuring Into the Cosmos")