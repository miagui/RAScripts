// Metal Slug XX
// #ID = 4004

function in_game() => byte(0xB0C190) == 1 && byte(0x955d24) == 0
function in_game_no_mp() => byte(0xB0C190) == 1 && byte(0x954e40) != 8 && byte(0x955d24) == 0
function difficulty() => byte(0xCF1A58)
         difficulty_beginner = 0
         difficulty_normal = 3
         difficulty_hard = 7

function game_mode() => byte(0x954E40)
         game_mode_main_mission = 1
         game_mode_combat_school = 2
         game_mode_survival = 3

function bgm_menu() => byte(0xB0C194)
function bgm_in_game() => byte(0xD165E0)
         bgm_main_menu = 0x0c
         bgm_mission_complete = 0x10
         bgm_mission_all_over = 0x11


// In-Game Time runs at 30 FPS
function in_game_time() => dword(0x954D10)

function p1_state() => byte(0xda0b68)
function p1_char() => byte(0x9566A0)
function p1_weapon() => byte(0xd16a4f)
function p1_bombs() => byte(0xd16a51)
function p1_bullets_fired() => byte(0xd16a36)
function p1_vehicle() => byte(0xd6997c)
function p1_vehicle_bonus() => byte(0xda0590)
         vehicle_sv100 = 0x01
         vehicle_slugnoid = 0x03
         vehicle_slugtrolley = 0x1a
         
function p1_recaptured_pows() => byte(0xB0BFD8)
function p1_collected_pows() => byte(0xd69828)
function p1_continues_used() => byte(0xd69830)
function p1_score() => bcd(dword(0xDA0128))

function entity_pointer_array_start() => tbyte(0x3FC5C0)
         p_entity_id_offset = 0x04
         p_entity_sheet_offset = 0x40
         p_entity_pos_x_offset = 0x60
         p_entity_hp_offset = 0x8c
         p_entity_soldier_state = 0x4c

function cs_rank_points() => word(0xB09000)
function cs_challenge() => byte(0xB09003)

function mission() => byte(0xD16B46)
function mission_section() => byte(0xD16B47)
function mission_scroll() => word(0xda020a)

// Mission 1:
//  0x03 = Boss Fight
//  0x04 = Hunters Hideout

// Mission 5:
//  0x06 = Deeper Ruins 2
//  0x07 - Mars Hallway 2
//  0x08 = Boss Fight
//  0x09 = Mars Hallway 1

// ========================
//    Utility Functions
// ========================

function mission_1_all_pows() => sum_of(range(0, 13), b => bit(b,0x954904))
function mission_2_all_pows() => sum_of(range(6, 19), b => bit(b,0x954905))
function mission_3_all_pows() => sum_of(range(4, 17), b => bit(b,0x954907))
function mission_4_all_pows() => sum_of(range(2, 15), b => bit(b,0x954909))
function mission_5_all_pows() => sum_of(range(0, 13), b => bit(b,0x95490b))
function mission_6_all_pows() => sum_of(range(6, 19), b => bit(b,0x95490c))
function mission_7_all_pows() => sum_of(range(4, 19), b => bit(b,0x95490e))

function mission_finished() => bgm_in_game() == bgm_mission_complete && bgm_in_game() != prev(bgm_in_game())

function game_beaten_from_start() {
    return  once(mission() == 0 &&
                 mission_section() == 0 &&
                 mission_scroll() == 0 &&
                 in_game_time() > prev(in_game_time())) &&
            trigger_when(mission() == 7)
}

// ========================
//        Progress
// ========================

achievement("Worm Mecha", "Finish Mission 1 by going through the regular route (Main Mission).", 4,
            trigger =   never(!in_game_no_mp()) && never(game_mode() > game_mode_main_mission) && never(mission() != 0) && once(mission_section() == 2) && mission_finished())

achievement("Hunters Hideout", "Finish Mission 1 by going through the Hunters Hideout route (Main Mission).", 5,
            trigger =   never(!in_game_no_mp()) && never(game_mode() > game_mode_main_mission) && never(mission() != 0) && once(mission_section() == 4) && mission_finished())

achievement("Crablops I", "Finish Mission 2 (Main Mission).", 5,
            trigger =   never(!in_game_no_mp()) && never(game_mode() > game_mode_main_mission) && never(mission() != 1) && mission_finished())

achievement("Crablops II", "Finish Mission 3 (Main Mission).", 5,
            trigger =   never(!in_game_no_mp()) && never(game_mode() > game_mode_main_mission) && never(mission() != 2) && mission_finished())

achievement("Gorilla Mecha", "Finish Mission 4 (Main Mission).", 5,
            trigger =   never(!in_game_no_mp()) && never(game_mode() > game_mode_main_mission) && never(mission() != 3) && mission_finished())

achievement("The Union", "Finish Mission 5 by going through the regular route (Main Mission).", 5,
            trigger =   never(!in_game_no_mp()) && never(game_mode() > game_mode_main_mission) && never(mission() != 4) && once(mission_section() == 3) && mission_finished())

achievement("Deeper Ruins", "Finish Mission 5 by going through the Deeper Ruins route (Main Mission).", 5,
            trigger =   never(!in_game_no_mp()) && never(game_mode() > game_mode_main_mission) && never(mission() != 4) && once(mission_section() == 6) && mission_finished())

achievement("Mars Hallway", "Finish Mission 5 by going through the Mars Hallway route (Main Mission).", 5,
            trigger =   never(!in_game_no_mp()) && never(game_mode() > game_mode_main_mission) && never(mission() != 4) && once(mission_section() == 9) && mission_finished())

achievement("Rebel Gigant", "Finish Mission 6 (Main Mission).", 5,
            trigger =   never(!in_game_no_mp()) && never(game_mode() > game_mode_main_mission) && never(mission() != 5) && mission_finished())


function achiev_beat_game_char(title, char_id, char_name) {
    achievement(title, format("Beat the entire game as {0} on Normal difficulty (Main Mission, one session).", char_name), 25,
            trigger =   never(!in_game_no_mp()) &&
                        never(game_mode() > game_mode_main_mission) &&  
                        never(p1_char() != char_id) &&
                        game_beaten_from_start())
}

achiev_beat_game_char("Marco Rossi", 0, "Marco")
achiev_beat_game_char("Tarma Roving", 1, "Tarma")
achiev_beat_game_char("Eri Kasamoto", 2, "Eri")
achiev_beat_game_char("Fiolina Germi", 3, "Fio")
achiev_beat_game_char("Ralf Jones", 4, "Ralf")
achiev_beat_game_char("Clark Still", 5, "Clark")
achiev_beat_game_char("Leona Heidern", 6, "Leona")

// ========================
//        Challenges
// ========================

achievement("SV-100", "Finish Mission 1 with a SV-100 (Main Mission).", 5,
            trigger =   never(!in_game_no_mp()) && 
                        never(game_mode() > game_mode_main_mission) && 
                        never(mission() != 0) && 
                        p1_vehicle_bonus() == vehicle_sv100 && mission_finished())

achievement("Slug Trolley", "Finish Mission 2 with a Slug Trolley (Main Mission).", 5,
            trigger =   never(!in_game_no_mp()) && 
                        never(game_mode() > game_mode_main_mission) && 
                        never(mission() != 1) && 
                        p1_vehicle_bonus() == vehicle_slugtrolley && mission_finished())

achievement("Slugnoid", "Finish Mission 3 with a Slugnoid (Main Mission).", 5,
            trigger =   never(!in_game_no_mp()) && 
                        never(game_mode() > game_mode_main_mission) && 
                        never(mission() != 2) && 
                        p1_vehicle_bonus() == vehicle_slugnoid && mission_finished())

achievement("Moon Slasher", "Finish any mission as Leona without shooting, no use of bombs and no vehicles (Main Mission).", 5,
            trigger =   never(!in_game_no_mp()) && 
                        never(game_mode() > game_mode_main_mission) && 
                        once(mission_section() == 0 &&
                             mission_scroll() == 0) &&
                        mission() != 7 &&
                        never(p1_char() != 6) &&
                        never(p1_bullets_fired() > 0) &&
                        never(p1_vehicle() > 0) &&
                        never(p1_bombs() < prev(p1_bombs())) &&
                        trigger_when(mission_finished()))

achievement("The Big T", "Get Thunder Shot.", 1,
        trigger =   never(!in_game_no_mp()) &&
                    never(game_mode() > game_mode_main_mission) &&  
                    p1_weapon() == 0x14
           )

achievement("Score Hunter", "Reach 15.000.000 score on Main Mission.", 25,
        trigger =   never(!in_game_no_mp()) &&
                    never(game_mode() > game_mode_main_mission) &&  
                    p1_score() >= 15000000,
        id = 206405)

achievement("The Beginning is the End", "Beat the entire game on Hard difficulty (Main Mission, one session).", 25,
        trigger =   never(!in_game_no_mp()) &&
                    never(game_mode() > game_mode_main_mission) &&  
                    never(difficulty() != difficulty_hard) &&
                    game_beaten_from_start()
           )

achievement("Double X", "Beat the entire game without using a continue on Normal Difficulty (Main Mission, one session).", 50,
        trigger =   never(!in_game_no_mp()) &&
                    never(game_mode() > game_mode_main_mission) &&
                    never(p1_continues_used() > 0) &&
                    never(difficulty() < difficulty_normal) &&
                    never(p1_state() == 0) &&
                    game_beaten_from_start()
           )
           
achievement("Fast and Futuristic", "Beat the entire game within 35 minutes on Normal Difficulty (Main Mission, one session).", 25,
        trigger =   never(!in_game_no_mp()) &&
                    never(game_mode() > game_mode_main_mission) &&
                    never(difficulty() < difficulty_normal) &&
                    never(p1_state() == 0) &&
                    game_beaten_from_start() &&
                    in_game_time() <= 63000
           )

// ========================
//        Prisoners
// ========================

achievement("PVT. Morse", "Reach 100% recaptured POWs on Mission 1.", 10,
            trigger = in_game() && measured(mission_1_all_pows() == 14) && prev(mission_1_all_pows()) < 14)

achievement("SGT. Yang", "Reach 100% recaptured POWs on Mission 2.", 10,
            trigger = in_game() && measured(mission_2_all_pows() == 14) && prev(mission_2_all_pows()) < 14)

achievement("SGM. Metastasio", "Reach 100% recaptured POWs on Mission 3.", 10,
            trigger = in_game() && measured(mission_3_all_pows() == 14) && prev(mission_3_all_pows()) < 14)

achievement("WO1. Noma", "Reach 100% recaptured POWs on Mission 4.", 10,
            trigger = in_game() && measured(mission_4_all_pows() == 14) && prev(mission_4_all_pows()) < 14)

achievement("LCL. Campanella", "Reach 100% recaptured POWs on Mission 5.", 10,
            trigger = in_game() && measured(mission_5_all_pows() == 14) && prev(mission_5_all_pows()) < 14)

achievement("PVT. Madoka A.", "Reach 100% recaptured POWs on Mission 6.", 10,
            trigger = in_game() && measured(mission_6_all_pows() == 14) && prev(mission_6_all_pows()) < 14)

achievement("2LT. Hyakutaro", "Reach 100% recaptured POWs on Mission 7.", 10,
            trigger = in_game() && measured(mission_7_all_pows() == 16) && prev(mission_7_all_pows()) < 16)


// ========================
//        C.S Ranks
// ========================

achievement("Platoon Seargent", "Reach 2000 rank points on Combat School.", 5,
            trigger = bgm_menu() == bgm_main_menu && cs_rank_points() >= 2000 && prev(cs_rank_points()) < 2000)

achievement("Second Lieutenant", "Reach 4400 rank points on Combat School.", 5,
            trigger = bgm_menu() == bgm_main_menu && cs_rank_points() >= 4400 && prev(cs_rank_points()) < 4400)

achievement("Lieutenant Colonel", "Reach 6400 rank points on Combat School.", 5,
            trigger = bgm_menu() == bgm_main_menu && cs_rank_points() >= 6400 && prev(cs_rank_points()) < 6400)

achievement("Lieutenant General", "Reach 8400 rank points on Combat School.", 10,
            trigger = bgm_menu() == bgm_main_menu && cs_rank_points() >= 8400 && prev(cs_rank_points()) < 8400)

achievement("Super Devil", "Reach 10000 rank points on Combat School.", 25,
            trigger = bgm_menu() == bgm_main_menu && cs_rank_points() >= 10000 && prev(cs_rank_points()) < 10000)


// ========================
//     C.S Challenges
// ========================

achievement("Scrap Island 100%", "Complete all Mission 1 challenges on Combat School.", 25,
            trigger =   in_game() &&
                        byte(0x9553c1) >= 1 &&
                        byte(0x9553c2) >= 1 &&
                        byte(0x9553c3) >= 1 &&
                        byte(0x9553c5) >= 1 &&
                        byte(0x9553c6) >= 1 &&
                        byte(0x9553c7) >= 1 &&
                        byte(0x9553c8) >= 1 &&
                        byte(0x9553c9) >= 1 &&
                        byte(0x9553ca) >= 1 &&
                        byte(0x9553cb) >= 1 &&
                        (prev(byte(0x9553c1)) == 0 ||
                        prev(byte(0x9553c2)) == 0 ||
                        prev(byte(0x9553c3)) == 0 ||
                        prev(byte(0x9553c5)) == 0 ||
                        prev(byte(0x9553c6)) == 0 ||
                        prev(byte(0x9553c7)) == 0 ||
                        prev(byte(0x9553c8)) == 0 ||
                        prev(byte(0x9553c9)) == 0 ||
                        prev(byte(0x9553ca)) == 0 ||
                        prev(byte(0x9553cb)) == 0))


achievement("Coal Mines 100%", "Complete all Mission 2 challenges on Combat School.", 25,
            trigger =   in_game() &&
                        byte(0x9553cc) >= 1 &&
                        byte(0x9553cd) >= 1 &&
                        byte(0x9553ce) >= 1 &&
                        byte(0x9553d0) >= 1 &&
                        byte(0x9553d1) >= 1 &&
                        byte(0x9553d2) >= 1 &&
                        byte(0x9553d3) >= 1 &&
                        byte(0x9553d4) >= 1 &&
                        byte(0x9553d5) >= 1 &&
                        byte(0x9553d6) >= 1 &&
                        byte(0x9553d7) >= 1 &&
                        (prev(byte(0x9553cc)) == 0 ||
                        prev(byte(0x9553cd)) == 0 ||
                        prev(byte(0x9553ce)) == 0 ||
                        prev(byte(0x9553d0)) == 0 ||
                        prev(byte(0x9553d1)) == 0 ||
                        prev(byte(0x9553d2)) == 0 ||
                        prev(byte(0x9553d3)) == 0 ||
                        prev(byte(0x9553d4)) == 0 ||
                        prev(byte(0x9553d5)) == 0 ||
                        prev(byte(0x9553d6)) == 0 ||
                        prev(byte(0x9553d7)) == 0))


achievement("Underground Fortress 100%", "Complete all Mission 3 challenges on Combat School.", 25,
            trigger =   in_game() &&
                        byte(0x9553d8) >= 1 &&
                        byte(0x9553d9) >= 1 &&
                        byte(0x9553da) >= 1 &&
                        byte(0x9553dc) >= 1 &&
                        byte(0x9553dd) >= 1 &&
                        byte(0x9553de) >= 1 &&
                        byte(0x9553df) >= 1 &&
                        byte(0x9553e0) >= 1 &&
                        byte(0x9553e1) >= 1 &&
                        byte(0x9553e2) >= 1 &&
                        byte(0x9553e3) >= 1 &&
                        (prev(byte(0x9553d8)) == 0 ||
                        prev(byte(0x9553d9)) == 0 ||
                        prev(byte(0x9553da)) == 0 ||
                        prev(byte(0x9553dc)) == 0 ||
                        prev(byte(0x9553dd)) == 0 ||
                        prev(byte(0x9553de)) == 0 ||
                        prev(byte(0x9553df)) == 0 ||
                        prev(byte(0x9553e0)) == 0 ||
                        prev(byte(0x9553e1)) == 0 ||
                        prev(byte(0x9553e2)) == 0 ||
                        prev(byte(0x9553e3)) == 0))


achievement("The Waterfall 100%", "Complete all Mission 4 challenges on Combat School.", 25,
            trigger =   in_game() &&
                        byte(0x9553e4) >= 1 &&
                        byte(0x9553e5) >= 1 &&
                        byte(0x9553e6) >= 1 &&
                        byte(0x9553e8) >= 1 &&
                        byte(0x9553e9) >= 1 &&
                        byte(0x9553ea) >= 1 &&
                        byte(0x9553eb) >= 1 &&
                        byte(0x9553ec) >= 1 &&
                        byte(0x9553ed) >= 1 &&
                        byte(0x9553ee) >= 1 &&
                        (prev(byte(0x9553e4)) == 0 ||
                        prev(byte(0x9553e5)) == 0 ||
                        prev(byte(0x9553e6)) == 0 ||
                        prev(byte(0x9553e8)) == 0 ||
                        prev(byte(0x9553e9)) == 0 ||
                        prev(byte(0x9553ea)) == 0 ||
                        prev(byte(0x9553eb)) == 0 ||
                        prev(byte(0x9553ec)) == 0 ||
                        prev(byte(0x9553ed)) == 0 ||
                        prev(byte(0x9553ee)) == 0))


achievement("Ruins Base 100%", "Complete all Mission 5 challenges on Combat School.", 25,
            trigger =   in_game() &&
                        byte(0x9553ef) >= 1 &&
                        byte(0x9553f0) >= 1 &&
                        byte(0x9553f1) >= 1 &&
                        byte(0x9553f3) >= 1 &&
                        byte(0x9553f4) >= 1 &&
                        byte(0x9553f5) >= 1 &&
                        byte(0x9553f6) >= 1 &&
                        byte(0x9553f7) >= 1 &&
                        byte(0x9553f8) >= 1 &&
                        byte(0x9553f9) >= 1 &&
                        (prev(byte(0x9553ef)) == 0 ||
                        prev(byte(0x9553f0)) == 0 ||
                        prev(byte(0x9553f1)) == 0 ||
                        prev(byte(0x9553f3)) == 0 ||
                        prev(byte(0x9553f4)) == 0 ||
                        prev(byte(0x9553f5)) == 0 ||
                        prev(byte(0x9553f6)) == 0 ||
                        prev(byte(0x9553f7)) == 0 ||
                        prev(byte(0x9553f8)) == 0 ||
                        prev(byte(0x9553f9)) == 0))


achievement("Snowy Country 100%", "Complete all Mission 6 challenges on Combat School.", 25,
            trigger =   in_game() &&
                        byte(0x9553fa) >= 1 &&
                        byte(0x9553fb) >= 1 &&
                        byte(0x9553fc) >= 1 &&
                        byte(0x9553fe) >= 1 &&
                        byte(0x9553ff) >= 1 &&
                        byte(0x955400) >= 1 &&
                        byte(0x955401) >= 1 &&
                        byte(0x955402) >= 1 &&
                        byte(0x955403) >= 1 &&
                        byte(0x955404) >= 1 &&
                        byte(0x955405) >= 1 &&
                        (prev(byte(0x9553fa)) == 0 ||
                        prev(byte(0x9553fb)) == 0 ||
                        prev(byte(0x9553fc)) == 0 ||
                        prev(byte(0x9553fe)) == 0 ||
                        prev(byte(0x9553ff)) == 0 ||
                        prev(byte(0x955400)) == 0 ||
                        prev(byte(0x955401)) == 0 ||
                        prev(byte(0x955402)) == 0 ||
                        prev(byte(0x955403)) == 0 ||
                        prev(byte(0x955404)) == 0 ||
                        prev(byte(0x955405)) == 0))


achievement("The Beginning is the End 100%", "Complete all Mission 7 challenges on Combat School.", 25,

            trigger =   in_game() &&
                        byte(0x955406) >= 1 &&
                        byte(0x955407) >= 1 &&
                        byte(0x955408) >= 1 &&
                        byte(0x95540a) >= 1 &&
                        byte(0x95540b) >= 1 &&
                        byte(0x95540c) >= 1 &&
                        byte(0x95540d) >= 1 &&
                        byte(0x95540e) >= 1 &&
                        byte(0x95540f) >= 1 &&
                        byte(0x955410) >= 1 &&
                        (prev(byte(0x955406)) == 0 ||
                        prev(byte(0x955407)) == 0 ||
                        prev(byte(0x955408)) == 0 ||
                        prev(byte(0x95540a)) == 0 ||
                        prev(byte(0x95540b)) == 0 ||
                        prev(byte(0x95540c)) == 0 ||
                        prev(byte(0x95540d)) == 0 ||
                        prev(byte(0x95540e)) == 0 ||
                        prev(byte(0x95540f)) == 0 ||
                        prev(byte(0x955410)) == 0))



// ========================
//  C.S Challenges Rank S
// ========================

achievement("Scrap Island 200%", "Achieve Rank S on all Mission 1 challenges on Combat School.", 50,
            trigger =   in_game() &&
                        byte(0x9553c1) == 4 &&
                        byte(0x9553c2) == 4 &&
                        byte(0x9553c3) == 4 &&
                        byte(0x9553c5) == 4 &&
                        byte(0x9553c6) == 4 &&
                        byte(0x9553c7) == 4 &&
                        byte(0x9553c8) == 4 &&
                        byte(0x9553c9) == 4 &&
                        byte(0x9553ca) == 4 &&
                        byte(0x9553cb) == 4 &&
                        (prev(byte(0x9553c1)) < 4 ||
                        prev(byte(0x9553c2)) < 4 ||
                        prev(byte(0x9553c3)) < 4 ||
                        prev(byte(0x9553c5)) < 4 ||
                        prev(byte(0x9553c6)) < 4 ||
                        prev(byte(0x9553c7)) < 4 ||
                        prev(byte(0x9553c8)) < 4 ||
                        prev(byte(0x9553c9)) < 4 ||
                        prev(byte(0x9553ca)) < 4 ||
                        prev(byte(0x9553cb)) < 4))


achievement("Coal Mines 200%", "Achieve Rank S on all Mission 2 challenges on Combat School.", 50,
            trigger =   in_game() &&
                        byte(0x9553cc) == 4 &&
                        byte(0x9553cd) == 4 &&
                        byte(0x9553ce) == 4 &&
                        byte(0x9553d0) == 4 &&
                        byte(0x9553d1) == 4 &&
                        byte(0x9553d2) == 4 &&
                        byte(0x9553d3) == 4 &&
                        byte(0x9553d4) == 4 &&
                        byte(0x9553d5) == 4 &&
                        byte(0x9553d6) == 4 &&
                        byte(0x9553d7) == 4 &&
                        (prev(byte(0x9553cc)) < 4 ||
                        prev(byte(0x9553cd)) < 4 ||
                        prev(byte(0x9553ce)) < 4 ||
                        prev(byte(0x9553d0)) < 4 ||
                        prev(byte(0x9553d1)) < 4 ||
                        prev(byte(0x9553d2)) < 4 ||
                        prev(byte(0x9553d3)) < 4 ||
                        prev(byte(0x9553d4)) < 4 ||
                        prev(byte(0x9553d5)) < 4 ||
                        prev(byte(0x9553d6)) < 4 ||
                        prev(byte(0x9553d7)) < 4))


achievement("Underground Fortress 200%", "Achieve Rank S on all Mission 3 challenges on Combat School.", 50,
            trigger =   in_game() &&
                        byte(0x9553d8) == 4 &&
                        byte(0x9553d9) == 4 &&
                        byte(0x9553da) == 4 &&
                        byte(0x9553dc) == 4 &&
                        byte(0x9553dd) == 4 &&
                        byte(0x9553de) == 4 &&
                        byte(0x9553df) == 4 &&
                        byte(0x9553e0) == 4 &&
                        byte(0x9553e1) == 4 &&
                        byte(0x9553e2) == 4 &&
                        byte(0x9553e3) == 4 &&
                        (prev(byte(0x9553d8)) < 4 ||
                        prev(byte(0x9553d9)) < 4 ||
                        prev(byte(0x9553da)) < 4 ||
                        prev(byte(0x9553dc)) < 4 ||
                        prev(byte(0x9553dd)) < 4 ||
                        prev(byte(0x9553de)) < 4 ||
                        prev(byte(0x9553df)) < 4 ||
                        prev(byte(0x9553e0)) < 4 ||
                        prev(byte(0x9553e1)) < 4 ||
                        prev(byte(0x9553e2)) < 4 ||
                        prev(byte(0x9553e3)) < 4))


achievement("The Waterfall 200%", "Achieve Rank S on all Mission 4 challenges on Combat School.", 50,
            trigger =   in_game() &&
                        byte(0x9553e4) == 4 &&
                        byte(0x9553e5) == 4 &&
                        byte(0x9553e6) == 4 &&
                        byte(0x9553e8) == 4 &&
                        byte(0x9553e9) == 4 &&
                        byte(0x9553ea) == 4 &&
                        byte(0x9553eb) == 4 &&
                        byte(0x9553ec) == 4 &&
                        byte(0x9553ed) == 4 &&
                        byte(0x9553ee) == 4 &&
                        (prev(byte(0x9553e4)) < 4 ||
                        prev(byte(0x9553e5)) < 4 ||
                        prev(byte(0x9553e6)) < 4 ||
                        prev(byte(0x9553e8)) < 4 ||
                        prev(byte(0x9553e9)) < 4 ||
                        prev(byte(0x9553ea)) < 4 ||
                        prev(byte(0x9553eb)) < 4 ||
                        prev(byte(0x9553ec)) < 4 ||
                        prev(byte(0x9553ed)) < 4 ||
                        prev(byte(0x9553ee)) < 4))


achievement("Ruins Base 200%", "Achieve Rank S on all Mission 5 challenges on Combat School.", 50,
            trigger =   in_game() &&
                        byte(0x9553ef) == 4 &&
                        byte(0x9553f0) == 4 &&
                        byte(0x9553f1) == 4 &&
                        byte(0x9553f3) == 4 &&
                        byte(0x9553f4) == 4 &&
                        byte(0x9553f5) == 4 &&
                        byte(0x9553f6) == 4 &&
                        byte(0x9553f7) == 4 &&
                        byte(0x9553f8) == 4 &&
                        byte(0x9553f9) == 4 &&
                        (prev(byte(0x9553ef)) < 4 ||
                        prev(byte(0x9553f0)) < 4 ||
                        prev(byte(0x9553f1)) < 4 ||
                        prev(byte(0x9553f3)) < 4 ||
                        prev(byte(0x9553f4)) < 4 ||
                        prev(byte(0x9553f5)) < 4 ||
                        prev(byte(0x9553f6)) < 4 ||
                        prev(byte(0x9553f7)) < 4 ||
                        prev(byte(0x9553f8)) < 4 ||
                        prev(byte(0x9553f9)) < 4))


achievement("Snowy Country 200%", "Achieve Rank S on all Mission 6 challenges on Combat School.", 50,
            trigger =   in_game() &&
                        byte(0x9553fa) == 4 &&
                        byte(0x9553fb) == 4 &&
                        byte(0x9553fc) == 4 &&
                        byte(0x9553fe) == 4 &&
                        byte(0x9553ff) == 4 &&
                        byte(0x955400) == 4 &&
                        byte(0x955401) == 4 &&
                        byte(0x955402) == 4 &&
                        byte(0x955403) == 4 &&
                        byte(0x955404) == 4 &&
                        byte(0x955405) == 4 &&
                        (prev(byte(0x9553fa)) < 4 ||
                        prev(byte(0x9553fb)) < 4 ||
                        prev(byte(0x9553fc)) < 4 ||
                        prev(byte(0x9553fe)) < 4 ||
                        prev(byte(0x9553ff)) < 4 ||
                        prev(byte(0x955400)) < 4 ||
                        prev(byte(0x955401)) < 4 ||
                        prev(byte(0x955402)) < 4 ||
                        prev(byte(0x955403)) < 4 ||
                        prev(byte(0x955404)) < 4 ||
                        prev(byte(0x955405)) < 4))


achievement("The Beginning is the End 200%", "Achieve Rank S on all Mission 7 challenges on Combat School.", 50,
            trigger =   in_game() &&
                        byte(0x955406) == 4 &&
                        byte(0x955407) == 4 &&
                        byte(0x955408) == 4 &&
                        byte(0x95540a) == 4 &&
                        byte(0x95540b) == 4 &&
                        byte(0x95540c) == 4 &&
                        byte(0x95540d) == 4 &&
                        byte(0x95540e) == 4 &&
                        byte(0x95540f) == 4 &&
                        byte(0x955410) == 4 &&
                        (prev(byte(0x955406)) < 4 ||
                        prev(byte(0x955407)) < 4 ||
                        prev(byte(0x955408)) < 4 ||
                        prev(byte(0x95540a)) < 4 ||
                        prev(byte(0x95540b)) < 4 ||
                        prev(byte(0x95540c)) < 4 ||
                        prev(byte(0x95540d)) < 4 ||
                        prev(byte(0x95540e)) < 4 ||
                        prev(byte(0x95540f)) < 4 ||
                        prev(byte(0x955410)) < 4))

achievement("Extreme Survival", "Finish Survival Mode on Combat School.", 50,
            trigger =   in_game() &&
                        byte(0x955411) == 4 &&
                        prev(byte(0x955411)) < 4)

// ========================
//      Leaderboards
// ========================

leaderboard("MSXX Beginner Speedrun", "Beat the game the fastest as possible on Beginner difficulty (In-Game Time).", 
            in_game() && game_mode() == game_mode_main_mission && difficulty() == difficulty_beginner && mission() == 0 && mission_section() == 0 && mission_scroll() == 0 && in_game_time() > prev(in_game_time()),
            !in_game_no_mp() || p1_state() == 0, 
            mission() == 7, 
            in_game_time() * 2, 
            format="FRAMES", lower_is_better=true, id = 31885
            )

leaderboard("MSXX Normal Speedrun", "Beat the game the fastest as possible on Normal difficulty (In-Game Time).", 
            in_game() && game_mode() == game_mode_main_mission && difficulty() == difficulty_normal && mission() == 0 && mission_section() == 0 && mission_scroll() == 0 && in_game_time() > prev(in_game_time()),
            !in_game_no_mp() || p1_state() == 0, 
            mission() == 7, 
            in_game_time() * 2, 
            format="FRAMES", lower_is_better=true, id = 31886
            )

leaderboard("MSXX Hard Speedrun", "Beat the game the fastest as possible on Hard difficulty (In-Game Time).", 
            in_game() && game_mode() == game_mode_main_mission && difficulty() == difficulty_hard && mission() == 0 && mission_section() == 0 && mission_scroll() == 0 && in_game_time() > prev(in_game_time()),
            !in_game_no_mp() || p1_state() == 0, 
            mission() == 7, 
            in_game_time() * 2, 
            format="FRAMES", lower_is_better=true, id = 31887
            )

leaderboard("MSXX Hi-Score", "Beat the game with the highest score.", 
            in_game() && game_mode() == game_mode_main_mission && mission() == 0 && mission_section() == 0 && mission_scroll() == 0 && in_game_time() > prev(in_game_time()),
            !in_game_no_mp() || p1_state() == 0, 
            mission() == 7, 
            p1_score(), 
            format="VALUE", lower_is_better=false, id = 31888
            )

leaderboard("MSXX POWs Collector", "Beat the game with the highest amount of collected POWs.", 
            in_game() && game_mode() == game_mode_main_mission && mission() == 0 && mission_section() == 0 && mission_scroll() == 0 && in_game_time() > prev(in_game_time()),
            !in_game_no_mp() || p1_state() == 0, 
            mission() == 7, 
            p1_collected_pows(), 
            format="VALUE", lower_is_better=false, id = 31889
            )

leaderboard("MSXX POWs Recapturer", "Beat the game with the highest amount of recaptured POWs.", 
            mission() == 7,
            !in_game_no_mp() || p1_state() == 0, 
            mission() == 7, 
            p1_recaptured_pows(), 
            format="VALUE", lower_is_better=false, id = 31890
            )

leaderboard("MSXX Coin Saver", "Beat the game with the lowest amount of continues.", 
            in_game() && game_mode() == game_mode_main_mission && mission() == 0 && mission_section() == 0 && mission_scroll() == 0 && in_game_time() > prev(in_game_time()),
            !in_game_no_mp() || p1_state() == 0, 
            mission() == 7, 
            p1_continues_used(), 
            format="VALUE", lower_is_better=true, id = 31891
            )


