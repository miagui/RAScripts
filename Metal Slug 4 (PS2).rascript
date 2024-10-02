// Metal Slug 4
// #ID = 20595

// Settings
function settings_hero() => byte(0x1070642)
function settings_hero_default() => byte(0x1070642) == 3
function settings_difficulty() => byte(0x1070643)
function settings_difficulty_normal() => byte(0x1070643) >= 2
function settings_difficulty_hard() => byte(0x1070643) >= 5

// Game
function game_mode() => byte(0x1080CB0)
function game_igt_running() => dword(0x4051B8)
function game_igt_subtractor() => dword(0x1070C9B)

function game_igt_seconds_bcd() => byte(0x1070C81)
function game_igt_minutes_bcd() => byte(0x1070C82)
function game_igt_hours_bcd() => byte(0x1070C83)

function game_mission_timer_seconds_bcd() => byte(0x1070C89)
function game_mission_timer_minutes_bcd() => byte(0x1070C8A)
function game_mission_timer_hours_bcd() => byte(0x1070C8B)

function igt_current() => (game_igt_running() * 6.8) - (game_igt_subtractor()  * 6.8)
function igt_game_time_bcd() => bcd(game_igt_hours_bcd() * 216000) + bcd(game_igt_minutes_bcd() * 3600) + bcd(game_igt_seconds_bcd() * 60)

// Mission
function game_mission() => byte(0x70BD0A)
function mission_section() => byte(0x70BD0B)
function mission_finished() => bit0(0x701170)
function mission_started() => bit2(0x701170)

function p1_active_state() => byte(0x6F5A60)
function p2_active_state() => byte(0x6F5A61)
function players_active() => word(0x6F5A60)

function p1_character() => byte(0x70BAA4)
function p1_score() => dword(0x70cc50)
function p1_form() => byte(0x70BACE)

function p1_lives() => byte(0x70BF89)
function p1_medals() => byte(0x106F1A0)
function p1_weapon() => byte(0x106F1A4)
function p1_bombs() => byte(0x106F1A7)

function p1_prisoners() => word(0x106FA90)
function p1_total_prisoners() => word(0x70CC90)
function p1_continues_used() => byte(0x70CC98)
function p1_vehicle_bonus() => byte(0x701130)

function save_data_characters_gallery() => sum_of(range(0, 3), b => bit(b,0x1070641))
function save_data_war_booty_inventory() => sum_of(range(0, 31), b => bit(b,0x10706D8))+ // 32 bits +
                                            sum_of(range(0, 9), b => bit(b,0x10706DC))   // 10 bits = 42 bits



// =========================================
//             Utility Functions              
// =========================================

function p1_only() => never(p1_active_state() == 0) && never(p2_active_state() > 0)
function any_player_active() => never(players_active() == 0)
function is_arcade() => game_mode() == 0
function is_stage_select() => game_mode() == 1

function mission_has_been_started() => mission_started() == 1 && prev(mission_started()) == 0 && mission_section() == 0
function mission_has_been_finished() => mission_finished() == 1 && prev(mission_finished()) == 0

function game_beaten() => game_mission() == 6 && prev(game_mission()) == 5

function logic_pows_collected_p1_sum() {
    logic_hits = []
    for i in range(1,6) {
        array_push(logic_hits, p1_active_state() == 1 && p1_prisoners() - prev(p1_prisoners()) >= i)
    }
    array_push(logic_hits, always_false())
    return logic_hits
}

// =========================================
//                 Progression              
// =========================================

function achiev_finish_mission_route(title, description, mission_id, section_route, points) {
    achievement(title, description, points,
                trigger =   players_active() > 0 &&
                            is_arcade() &&
                            never(game_mission() != mission_id) &&
                            once(mission_section() == section_route) &&
                            mission_has_been_finished() &&
                            settings_difficulty_normal()
                )
}

achiev_finish_mission_route("Under The Bridge", "Finish Mission 1 by going through the lower route (Normal difficulty).", 0, 2, 5)
achiev_finish_mission_route("Highway", "Finish Mission 1 by going through the upper route (Normal difficulty).", 0, 1, 5)
achiev_finish_mission_route("Ridge 256", "Finish Mission 2 (Normal difficulty).", 1, 0, 5)
achiev_finish_mission_route("Mountain Climb", "Finish Mission 3 by going through the lower route (Normal difficulty).", 2, 1, 5)
achiev_finish_mission_route("Ice Slide", "Finish Mission 3 by going through the upper route (Normal difficulty).", 2, 4, 5)
achiev_finish_mission_route("Secret Mummies", "Finish Mission 4 by going through the lower route (Normal difficulty).", 3, 1, 5)
achiev_finish_mission_route("Zombies Attack", "Finish Mission 4 by going through the upper route (Normal difficulty).", 3, 4, 5)
achiev_finish_mission_route("Lower Deck", "Finish Mission 5 by going through the lower route (Normal difficulty).", 4, 2, 5)
achiev_finish_mission_route("Ship Resistence", "Finish Mission 5 by going through the upper route (Normal difficulty).", 4, 1, 5)

achiev_finish_mission_route("Large Feast", "Beat the game with the good ending (Normal difficulty).", 5, 0x0c, 10)
achiev_finish_mission_route("Painful Escape", "Beat the game with the bad ending (Normal difficulty).", 5, 0x0d, 10)

// =========================================
//           Full Game Challenges              
// =========================================

achievement("Amadeus", "Beat the game without using a continue on Normal difficulty (Hero 3).", 50,
            trigger =   p1_only() &&
                        is_arcade() &&
                        once(game_mission() == 0 && mission_has_been_started()) &&
                        never(p1_continues_used() > prev(p1_continues_used())) &&
                        settings_difficulty_normal() &&
                        settings_hero_default() &&
                        trigger_when(game_beaten())
            )

achievement("White Baby", "Beat the game without using 10 continues on Hard difficulty (Hero 3).", 50,
            trigger =   p1_only() &&
                        is_arcade() &&
                        once(game_mission() == 0 && mission_has_been_started()) &&
                        never(repeated(10, p1_continues_used() > prev(p1_continues_used()))) &&
                        settings_difficulty_hard() &&
                        settings_hero_default() &&
                        trigger_when(game_beaten())
            )

achievement("MS4KK", "Beat the game with 4 million score (Normal difficulty).", 50,
            trigger =   p1_only() &&
                        is_arcade() &&
                        p1_score() >= 0x04000000 &&
                        settings_difficulty_normal() &&
                        trigger_when(game_beaten())
            )


achievement("Fast Madness", "Beat the game within 24 minutes (Normal difficulty).", 24,
            trigger = p1_only() &&
                      is_arcade() &&
                      once(game_mission() == 0 && mission_has_been_started()) &&
                      igt_current() + igt_game_time_bcd() <= 86400 &&
                      settings_difficulty_normal() &&
                      trigger_when(game_mission() == 5 && mission_has_been_finished())
            )

// =========================================
//                 Deathless              
// =========================================

function achiev_deathless_stage(title, mission_id, points) {
    achievement(title, format("Finish Mission {0} without dying (Normal difficulty).", mission_id + 1), points,
                trigger =   p1_only() &&
                            once(game_mission() == mission_id && mission_has_been_started()) &&
                            never(game_mission() != mission_id) &&
                            never(p1_lives() != prev(p1_lives())) &&
                            never(p1_continues_used() > prev(p1_continues_used())) &&
                            settings_difficulty_normal() &&
                            trigger_when(game_mission() == mission_id && mission_has_been_finished())
                )
}

achiev_deathless_stage("Let's Run Through!", 0, 25)
achiev_deathless_stage("Show Spirit", 1, 25)
achiev_deathless_stage("Snowy Road", 2, 25)
achiev_deathless_stage("Cadaverous", 3, 25)
achiev_deathless_stage("Go Ahead!", 4, 25)
achiev_deathless_stage("Secret Place", 5, 25)

// =========================================
//                  Forms              
// =========================================

function achiev_finish_form_stage(title, description, mission_id, form_id, points) {
    achievement(title, description, points,
                trigger =   p1_only() &&
                            game_mission() == mission_id &&
                            p1_form() == form_id &&
                            settings_difficulty_normal() &&
                            trigger_when(game_mission() == mission_id && mission_has_been_finished())
                )
}

achiev_finish_form_stage("The Monkey Under the Bridge", "Finish Mission 1 while transformed into a monkey (Normal difficulty).", 0, 0x08, 10)
achiev_finish_form_stage("Ancient Mummy", "Finish Mission 4 while transformed into a mummy (Normal difficulty).", 3, 0x03, 10)
achiev_finish_form_stage("Illegal Zombie Experiment", "Finish Mission 4 while transformed into a zombie (Normal difficulty).", 3, 0x07, 5)
achiev_finish_form_stage("Reject Humanity, Return to Monke", "Finish Mission 6 while transformed into a monkey (Normal difficulty).", 5, 0x08, 50)

// =========================================
//                 Prisoners              
// =========================================

function achiev_collect_pows_route(title, description, mission_id, pows_amount, section_to_go, points) {
    achievement(title, description, points,
                trigger =   p1_only() &&
                            never(game_mission() != mission_id) &&
                            once(mission_section() == section_to_go) &&
                            measured(tally(pows_amount, logic_pows_collected_p1_sum()), once(mission_section() == section_to_go))
                )
}

achiev_collect_pows_route("P.F Squad Rescue I", "Collect 13 prisoners on Mission 1 by going through the lower route.", 0, 13, 2, 10)
achiev_collect_pows_route("P.F Squad Rescue II", "Collect 8 prisoners on Mission 1 by going through the upper route.", 0, 8, 1, 5)
achiev_collect_pows_route("P.F Squad Rescue III", "Collect 7 prisoners on Mission 2.", 1, 7, 0, 5)
achiev_collect_pows_route("P.F Squad Rescue IV", "Collect 7 prisoners on Mission 3 by going through the lower route.", 2, 7, 1, 10)
achiev_collect_pows_route("P.F Squad Rescue V", "Collect 5 prisoners on Mission 3 by going through the upper route.", 2, 5, 4, 5)
achiev_collect_pows_route("P.F Squad Rescue VI", "Collect 10 prisoners on Mission 4 by going through the lower route.", 3, 10, 1, 10)
achiev_collect_pows_route("P.F Squad Rescue VII", "Collect 10 prisoners on Mission 4 by going through the upper route.", 3, 10, 4, 10)
achiev_collect_pows_route("P.F Squad Rescue VIII", "Collect 16 prisoners on Mission 5 by going through the upper route.", 4, 16, 1, 10)
achiev_collect_pows_route("P.F Squad Rescue IX", "Collect 7 prisoners on Mission 5 by going through the lower route.", 4, 7, 2, 5)
achiev_collect_pows_route("P.F Squad Rescue X", "Collect 12 prisoners on Mission 6.", 5, 12, 0, 10)

// =========================================
//                  Miscs              
// =========================================

achievement("Excellent Soldier", "Obtain a White Medal.", 5,
            trigger = p1_only() &&
                      p1_medals() >= 0x0d &&
                      prev(p1_medals()) < 0x0d
            )

achievement("Metal Slug", "Finish a mission with a Metal Slug (Normal difficulty).", 5,
            trigger = p1_only() &&
                      p1_vehicle_bonus() == 1 &&
                      mission_has_been_finished()
            )

achievement("Items Collector MS4", "Collect all items from the War Booty Inventory.", 25,
            trigger =   any_player_active() &&
                        measured(save_data_war_booty_inventory() == 42) &&
                        prev(save_data_war_booty_inventory()) < 42
            )

achievement("Soldiers of Honor", "Beat the game with the good ending as each of the 4 characters.", 10,
            trigger =   any_player_active() &&
                        measured(save_data_characters_gallery() == 4) &&
                        prev(save_data_characters_gallery()) < 4
            )