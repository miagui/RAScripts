// Metal Slug 3
// #ID = 11771

function settings_lives() => byte(0x00FD89)
function settings_diff() => byte(0x00FD8A)
function settings_playtime() => byte(0x00FD8D)

function game_event() => byte(0x00044C)
function game_event_big() => byte(0x0004B6)
function game_event_program() => byte(0x0004B8)
function game_event_program_w() => word(0x0004B8)

function stage_counters() => byte(0x00040A)
function stage_counters_w() => word(0x00040A)
function stage_section() => byte(0x00040C)
function stage_section_w() => word(0x00040C)
function stage_id() => byte(0x00040D)
function stage_id_w() => word(0x00040D)

function enemies_on_screen() => byte(0x00A093)
function vehicle_flag() => byte(0x00A094)

function p1_state() => byte(0x00FDB7)
function p2_state() => byte(0x00FDB6)

function p1_ammo() => word(0x0002B2)
function p1_lives() => byte(0x0002BA)
function p1_vehicle() => byte(0x0002C0)
function p1_bombs() => byte(0x0002C1)
function p1_form() => byte(0x00058E)

function p1_weapon() => byte(0x00EAF2)
function p1_in_vehicle() => byte(0x00EB3B)
function p1_pickup_counter() => byte(0x00EBF4)
function p1_pows_total() => byte(0x00EC0E)
function p1_pows() => byte(0x00ED04)
function p1_score_xx000000() => byte(0x00ED19)
function p1_score_0000xx00() => byte(0x00ED1B)

function mvs_flag() => bit7(0x00FD83)


// =========================================
//             Utility Functions              
// =========================================

function no_unibios() => dword(0x00FE30) == 0

function settings_difficulty_level3() => settings_diff() >= 2
function settings_playtime60() => settings_playtime() == 0
function settings_lives3() => settings_lives() <= 3

function p1_only() => never(p2_state() == 1) && p1_state() >= 1
function is_mvs() => mvs_flag() == 1 && no_unibios()

function logic_pows_collected_p1_sum() {
    logic_hits = []
    for i in range(1,6) {
        array_push(logic_hits, p1_state() == 1 && p1_pows() - prev(p1_pows()) >= i)
    }
    array_push(logic_hits, always_false())
    return logic_hits
}

function logic_items_collected_p1_sum() {
    logic_hits = []
    for i in range(1,6) {
        array_push(logic_hits, p1_state() == 1 && p1_pickup_counter() - prev(p1_pickup_counter()) >= i)
    }
    array_push(logic_hits, always_false())
    return logic_hits
}

// =========================================
//                Progression              
// =========================================

achievement(
    title = "Blue Water Fangs -The Island of Dr.Moreau-", points = 4,
    description = "Clear Mission 1 without taking any detours (Level-3 difficulty)",
    id = 64755, badge = "69839", published = "18/08/2018 19:15:53", modified = "10/04/2022 03:14:23",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_section_w() != 0) &&
              stage_counters() == 29
)

achievement(
    title = "Marine Diver", points = 5,
    description = "Clear Mission 1 going through Ocean Depths (Level-3 difficulty)",
    id = 64756, badge = "69840", published = "18/08/2018 19:15:55", modified = "10/04/2022 03:14:23",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_section_w() != 2) &&
              stage_counters() == 29
)

achievement(
    title = "The Unknown World", points = 5,
    description = "Clear Mission 1 going through Core Facility (Level-3 difficulty)",
    id = 64757, badge = "69841", published = "18/08/2018 19:15:57", modified = "10/04/2022 03:14:24",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_section_w() != 4) &&
              stage_counters() == 29
)

achievement(
    title = "The Midnight Wandering", points = 5,
    description = "Clear Mission 2 without taking any detours (Level-3 difficulty)",
    id = 64758, badge = "69842", published = "18/08/2018 19:15:59", modified = "10/04/2022 03:14:24",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_section_w() != 256) &&
              stage_counters() == 29
)

achievement(
    title = "Devil's Snow Cave ", points = 5,
    description = "Clear Mission 2 going through Cave of Ice (Level-3 difficulty)",
    id = 64759, badge = "69843", published = "18/08/2018 19:16:03", modified = "10/04/2022 03:14:25",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_section_w() != 260) &&
              stage_counters() == 29
)

achievement(
    title = "The Shallow Sea", points = 5,
    description = "Clear Mission 3 without taking detours (Level-3 difficulty)",
    id = 64760, badge = "69844", published = "18/08/2018 19:16:05", modified = "10/04/2022 03:14:25",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 2) &&
              once(game_event_program_w() == 43194) &&
              stage_counters() == 29 &&
              stage_section_w() == 515
)

achievement(
    title = "Hard Water", points = 5,
    description = "Clear Mission 3 going through Underground Channel (Level-3 difficulty)",
    id = 64761, badge = "69845", published = "18/08/2018 19:16:08", modified = "10/04/2022 03:14:26",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 2) &&
              once(stage_section_w() == 517) &&
              stage_counters() == 29 &&
              stage_section_w() == 515
)

achievement(
    title = "Assault Theme", points = 5,
    description = "Clear Mission 3 going through the Bridge (Level-3 difficulty)",
    id = 64762, badge = "69846", published = "18/08/2018 19:16:11", modified = "10/04/2022 03:14:26",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 2) &&
              once(stage_section_w() == 518) &&
              stage_counters() == 29 &&
              stage_section_w() == 515
)

achievement(
    title = "Desert", points = 5,
    description = "Clear Mission 4 going through the upper route (Level-3 difficulty)",
    id = 64763, badge = "69847", published = "18/08/2018 19:16:13", modified = "10/04/2022 03:14:27",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 3) &&
              once(game_event_program_w() == 62384) &&
              stage_counters() == 29 &&
              stage_section_w() == 770
)

achievement(
    title = "The Japanese Army", points = 5,
    description = "Clear Mission 4 going through Ex-military Hideout (Level-3 difficulty)",
    id = 64764, badge = "69848", published = "18/08/2018 19:16:16", modified = "10/04/2022 03:14:27",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 3) &&
              once(stage_section_w() == 774) &&
              stage_counters() == 29 &&
              stage_section_w() == 784
)

achievement(
    title = "The Cenotaph", points = 5,
    description = "Clear Mission 4 going through Ancient Ruins (Level-3 difficulty)",
    id = 64765, badge = "69849", published = "18/08/2018 19:16:20", modified = "10/04/2022 03:14:27",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 3) &&
              once(stage_section_w() == 775) &&
              stage_counters() == 29 &&
              stage_section_w() == 784
)

achievement(
    title = "Pyramid", points = 5,
    description = "Clear Mission 4 going through Pyramid (Level-3 difficulty)",
    id = 64766, badge = "69850", published = "18/08/2018 19:16:22", modified = "10/04/2022 03:14:28",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 3) &&
              once(stage_section_w() == 783) &&
              stage_counters() == 29 &&
              stage_section_w() == 784
)

achievement(
    title = "First Contact", points = 10,
    description = "Finish the game (Level-3 difficulty)",
    id = 64767, badge = "69851", published = "18/08/2018 19:16:27", modified = "10/04/2022 03:14:28",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_section_w() < 1037) &&
              stage_id() == 5 &&
              never(stage_counters_w() != 65535)
)

// =========================================
//                 Vehicles              
// =========================================

achievement(
    title = "Super Vehicle I", points = 4,
    description = "Clear Mission 1 without taking detours and riding a vehicle (Level-3 difficulty, Play Time 60)",
    id = 64768, badge = "69778", published = "18/08/2018 19:16:43", modified = "10/04/2022 03:14:29",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_section_w() != 0) &&
              settings_playtime60() &&
              stage_counters() == 29 &&
              vehicle_flag() == 1
)

achievement(
    title = "Super Vehicle II", points = 5,
    description = "Clear Mission 1 going through Ocean Depths and riding a vehicle (Level-3 difficulty, Play Time 60)",
    id = 64769, badge = "69779", published = "18/08/2018 19:16:47", modified = "10/04/2022 03:14:29",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_section_w() != 2) &&
              settings_playtime60() &&
              stage_counters() == 29 &&
              vehicle_flag() == 1
)

achievement(
    title = "Super Vehicle III", points = 5,
    description = "Reach Ocean Depth's end in Mission 1 riding Slug Mariner (Level-3 difficulty, Play Time 60)",
    id = 64776, badge = "69780", published = "18/08/2018 19:17:05", modified = "10/04/2022 03:14:29",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_section_w() != 1) &&
              settings_playtime60() &&
              game_event_program_w() == 25172 &&
              p1_vehicle() == 8
)

achievement(
    title = "Super Vehicle IV", points = 5,
    description = "Clear Mission 1 going through Core Facility and riding a vehicle (Level-3 difficulty, Play Time 60)",
    id = 64770, badge = "69781", published = "18/08/2018 19:16:50", modified = "10/04/2022 03:14:30",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_section_w() != 4) &&
              settings_playtime60() &&
              stage_counters() == 29 &&
              vehicle_flag() == 1
)

achievement(
    title = "Super Vehicle V", points = 10,
    description = "Clear Mission 3 without taking detours and riding a vehicle (Level-3 difficulty, Play Time 60)",
    id = 64771, badge = "69782", published = "18/08/2018 19:16:52", modified = "10/04/2022 03:14:30",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 2) &&
              settings_playtime60() &&
              once(game_event_program_w() == 43194) &&
              stage_counters() == 29 &&
              stage_section_w() == 515 &&
              vehicle_flag() == 1
)

achievement(
    title = "Super Vehicle VI", points = 5,
    description = "Reach Underground Channel's end in Mission 3 riding Slug Mariner (Level-3 difficulty, Play Time 60)",
    id = 64777, badge = "69783", published = "18/08/2018 19:17:08", modified = "10/04/2022 03:14:31",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_section_w() != 517) &&
              settings_playtime60() &&
              game_event_program_w() == 48302 &&
              p1_vehicle() == 8
)

achievement(
    title = "Super Vehicle VII", points = 10,
    description = "Clear Mission 3 going through Underground Channel and riding a vehicle (Level-3 difficulty, Play Time 60)",
    id = 64772, badge = "69784", published = "18/08/2018 19:16:54", modified = "10/04/2022 03:14:31",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 2) &&
              settings_playtime60() &&
              once(stage_section_w() == 517) &&
              stage_counters() == 29 &&
              stage_section_w() == 515 &&
              vehicle_flag() == 1
)

achievement(
    title = "Super Vehicle VIII", points = 10,
    description = "Reach Ancient Ruins end in Mission 4 riding a Drill Slug (Level-3 difficulty, Play Time 60)",
    id = 64778, badge = "69785", published = "18/08/2018 19:17:11", modified = "10/04/2022 03:14:31",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_section_w() != 775) &&
              settings_playtime60() &&
              game_event_program_w() == 10182 &&
              p1_vehicle() == 9
)

achievement(
    title = "Super Vehicle IX", points = 5,
    description = "Reach sky part's end in Final Mission riding a Slug Flyer (Level-3 difficulty, Play Time 60)",
    id = 64773, badge = "69786", published = "18/08/2018 19:16:56", modified = "10/04/2022 03:14:32",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 4) &&
              settings_playtime60() &&
              game_event_program_w() == 22466 &&
              p1_vehicle() == 6
)

achievement(
    title = "Super Vehicle X", points = 5,
    description = "Reach sky part's end in Final Mission riding a Slug Copter (Level-3 difficulty, Play Time 60)",
    id = 64774, badge = "69788", published = "18/08/2018 19:16:58", modified = "10/04/2022 03:14:32",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 4) &&
              settings_playtime60() &&
              game_event_program_w() == 22466 &&
              p1_vehicle() == 7
)

achievement(
    title = "Super Vehicle XI", points = 5,
    description = "Reach the 2nd space flight stage's end in Final Mission riding a Astro Slug (Level-3 difficulty, Play Time 60)",
    id = 64779, badge = "69787", published = "18/08/2018 19:17:13", modified = "10/04/2022 03:14:33",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_section_w() != 1029) &&
              settings_playtime60() &&
              game_event_program_w() == 36604 &&
              p1_vehicle() == 11
)

achievement(
    title = "Super Vehicle XII", points = 5,
    description = "Defeat the last boss in a vehicle (Level-3 difficulty, Play Time 60)",
    id = 64775, badge = "69789", published = "18/08/2018 19:17:01", modified = "10/04/2022 03:14:33",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 4) &&
              settings_playtime60() &&
              stage_section_w() == 1038 &&
              vehicle_flag() == 1 &&
              enemies_on_screen() == 1 &&
              game_event() == 0 &&
              game_event_big() == 0 &&
              game_event_program() == 0 &&
              prev(game_event()) == 1
)

// =========================================
//                POWs Rescue              
// =========================================
// YES
achievement(
    title = "The Great Rescue I", points = 10,
    description = "Find 22 POWs in Mission 1 without taking detours (Level-3 difficulty)",
    id = 64796, badge = "69806", published = "18/08/2018 19:18:04", modified = "10/04/2022 03:14:33",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 0) &&
              never(stage_section_w() != 0) &&
              //measured(p1_pows() == 22) &&
              measured(tally(22, logic_pows_collected_p1_sum()))
)
// YES
achievement(
    title = "The Great Rescue II", points = 10,
    description = "Find 18 POWs in Mission 1 going thorugh Ocean Depths (Level-3 difficulty)",
    id = 64797, badge = "69807", published = "18/08/2018 19:18:06", modified = "10/04/2022 03:14:34",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 0) &&
              once(game_event_program_w() == 25172) &&
              //measured(p1_pows() == 18) &&
              measured(tally(18, logic_pows_collected_p1_sum()))
)
// YES
achievement(
    title = "The Great Rescue III", points = 10,
    description = "Find 16 POWs in Mission 1 going thorugh Core Facility (Level-3 difficulty)",
    id = 64798, badge = "69808", published = "18/08/2018 19:18:08", modified = "10/04/2022 03:14:34",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 0) &&
              once(game_event_program_w() == 26994) &&
              //measured(p1_pows() == 16) &&
              measured(tally(16, logic_pows_collected_p1_sum()))
)
// YES
achievement(
    title = "The Great Rescue IV", points = 10,
    description = "Find 12 POWs in Mission 2 without taking the detours (Level-3 difficulty)",
    id = 64799, badge = "69809", published = "18/08/2018 19:18:09", modified = "10/04/2022 03:14:35",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 1) &&
              never(stage_section_w() != 256) &&
              //measured(p1_pows() == 12) &&
              measured(tally(12, logic_pows_collected_p1_sum()))
)
// YES
achievement(
    title = "The Great Rescue V", points = 10,
    description = "Find 23 POWs in Mission 2 going through Cave of Ice (Level-3 difficulty)",
    id = 64800, badge = "69810", published = "18/08/2018 19:18:12", modified = "10/04/2022 03:14:35",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 1) &&
              once(game_event_program_w() == 40622) &&
              //measured(p1_pows() == 23) &&
              measured(tally(23, logic_pows_collected_p1_sum()))
)
// YES
achievement(
    title = "The Great Rescue VI", points = 10,
    description = "Find 13 POWs in Mission 3 without taking any detours (Level-3 difficulty)",
    id = 64801, badge = "69811", published = "18/08/2018 19:18:14", modified = "10/04/2022 03:14:36",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 2) &&
              once(game_event_program_w() == 43194) &&
              //measured(p1_pows() == 13) &&
              measured(tally(13, logic_pows_collected_p1_sum()))
)
// YES
achievement(
    title = "The Great Rescue VII", points = 10,
    description = "Find 11 POWs in Mission 3 going thorugh Underground Channel (Level-3 difficulty)",
    id = 64802, badge = "69813", published = "18/08/2018 19:18:15", modified = "10/04/2022 03:14:36",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 2) &&
              once(game_event_program_w() == 48302) &&
              //measured(p1_pows() == 11) &&
              measured(tally(11, logic_pows_collected_p1_sum()))
)
// YES
achievement(
    title = "The Great Rescue VIII", points = 10,
    description = "Find all 13 POWs in Bridge detour part of Mission 3 (Level-3 difficulty)",
    id = 64803, badge = "69814", published = "18/08/2018 19:18:17", modified = "10/04/2022 03:14:36",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 2) &&
              once(game_event_program_w() == 51596) &&
              //measured(p1_pows() == 13) &&
              measured(tally(13, logic_pows_collected_p1_sum()))
)
// YES
achievement(
    title = "The Great Rescue X", points = 10,
    description = "Find all 18 POWs in Ex-military Hideout detour part of Mission 4 (Level-3 difficulty)",
    id = 64805, badge = "69816", published = "18/08/2018 19:18:20", modified = "10/04/2022 03:14:37",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 3) &&
              once(game_event_program_w() == 3510) &&
              //measured(p1_pows() == 18) &&
              measured(tally(18, logic_pows_collected_p1_sum()))
)
// YES
achievement(
    title = "The Great Rescue XI", points = 10,
    description = "Find all 22 POWs in Ancient Ruins detour part of Mission 4 (Level-3 difficulty)",
    id = 64806, badge = "69818", published = "18/08/2018 19:18:22", modified = "10/04/2022 03:14:37",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 3) &&
              once(game_event_program_w() == 10234) &&
              //measured(p1_pows() == 22) &&
              measured(tally(22, logic_pows_collected_p1_sum()))
)
// YES
achievement(
    title = "The Great Rescue XII", points = 10,
    description = "Find all 24 POWs in Pyramid detour part of Mission 4 (Level-3 difficulty)",
    id = 64807, badge = "69819", published = "18/08/2018 19:18:24", modified = "10/04/2022 03:14:38",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 3) &&
              once(game_event_program_w() == 17852) &&
              //measured(p1_pows() == 24) &&
              measured(tally(24, logic_pows_collected_p1_sum()))
)
// YES
achievement(
    title = "The Great Rescue XIII", points = 10,
    description = "Find all 16 POWs in Final Mission (Level-3 difficulty)",
    id = 64808, badge = "69820", published = "18/08/2018 19:18:26", modified = "10/04/2022 03:14:38",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 4) &&
              //measured(p1_pows() == 16) &&
              measured(tally(16, logic_pows_collected_p1_sum()))
)

// =========================================
//             Items Collection              
// =========================================

achievement(
    title = "MS3 Quartermaster I", points = 5,
    description = "Find 60 bonus items in Mission 1 without taking detours (Level-3 difficulty)",
    id = 64809, badge = "69821", published = "18/08/2018 19:18:27", modified = "10/04/2022 03:14:38",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 0) &&
              //never(stage_section_w() != 0) &&
              measured(p1_pickup_counter() >= 60, stage_section_w() == 0)
)

achievement(
    title = "MS3 Quartermaster II", points = 10,
    description = "Find 35 bonus items in Ocean Depths detour part of Mission 1 (Level-3 difficulty)",
    id = 64810, badge = "69822", published = "18/08/2018 19:18:29", modified = "10/04/2022 03:14:39",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 0) &&
              //never(stage_section_w() != 1) &&
              measured(p1_pickup_counter() >= 35, stage_section_w() == 1) &&
              game_event_program_w() == 25172
)

achievement(
    title = "MS3 Quartermaster III", points = 5,
    description = "Find 10 bonus items in Core Facility detour part of Mission 1 (Level-3 difficulty)",
    id = 64811, badge = "69823", published = "18/08/2018 19:18:31", modified = "10/04/2022 03:14:39",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 0) &&
              //never(stage_section_w() != 3) &&
              measured(p1_pickup_counter() >= 10, stage_section_w() == 3) &&
              game_event_program_w() == 26994
)

achievement(
    title = "MS3 Quartermaster IV", points = 10,
    description = "Find 35 bonus items in Mission 2 without taking detours (Level-3 difficulty)",
    id = 64812, badge = "69824", published = "18/08/2018 19:18:33", modified = "10/04/2022 03:14:40",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 1) &&
              //never(stage_section_w() != 256) &&
              measured(p1_pickup_counter() >= 35, stage_section_w() == 256) &&
              game_event_program_w() == 33352
)

achievement(
    title = "MS3 Quartermaster V", points = 5,
    description = "Find 50 bonus items in Cave of Ice detour part of Mission 2 (Level-3 difficulty)",
    id = 64813, badge = "69825", published = "18/08/2018 19:18:34", modified = "10/04/2022 03:14:40",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 1) &&
              //never(stage_section_w() != 259) &&
              measured(p1_pickup_counter() >= 50, stage_section_w() == 259) &&
              game_event_program_w() == 40622
)

achievement(
    title = "MS3 Quartermaster VI", points = 10,
    description = "Find 20 bonus items in Mission 3 without taking detours (LV Armor can't be empty, Level-3 difficulty)",
    id = 64814, badge = "69826", published = "18/08/2018 19:18:36", modified = "10/04/2022 03:14:41",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 2) &&
              never(stage_section_w() < 512) &&
              never(stage_section_w() > 515) &&
              //measured(repeated(20, prev(p1_pickup_counter()) < p1_pickup_counter())) &&
              measured(tally(20, logic_items_collected_p1_sum())) &&
              unless(p1_ammo() == 0)
)

achievement(
    title = "MS3 Quartermaster VII", points = 5,
    description = "Find 7 bonus items in Underground Channel part of Mission 3 (Level-3 difficulty)",
    id = 64815, badge = "69827", published = "18/08/2018 19:18:38", modified = "10/04/2022 03:14:41",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 2) &&
              //never(stage_section_w() < 516) &&
              //never(stage_section_w() > 517) &&
              measured(p1_pickup_counter() >= 7, stage_section_w() >= 516 && stage_section_w() <= 517) &&
              game_event_program_w() == 48302
)

achievement(
    title = "MS3 Quartermaster VIII", points = 5,
    description = "Find 10 bonus items in Bridge detour part of Mission 3 (Level-3 difficulty)",
    id = 64816, badge = "69828", published = "18/08/2018 19:18:39", modified = "10/04/2022 03:14:41",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 2) &&
              //never(stage_section_w() != 518) &&
              measured(p1_pickup_counter() >= 10, stage_section_w() == 518) &&
              game_event_program_w() == 51596 &&
              unless(p1_ammo() == 0)
)

achievement(
    title = "MS3 Quartermaster IX", points = 10,
    description = "Find 35 bonus items in Mission 4 going through the top route (Level-3 difficulty)",
    id = 64817, badge = "69829", published = "18/08/2018 19:18:42", modified = "10/04/2022 03:14:42",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 3) &&
              never(stage_section_w() < 768) &&
              never(stage_section_w() > 770) &&
              //measured(repeated(35, prev(p1_pickup_counter()) < p1_pickup_counter()))
              measured(tally(35, logic_items_collected_p1_sum()))
)

achievement(
    title = "MS3 Quartermaster X", points = 10,
    description = "Find 20 bonus items in Ex-military Hideout detour part of Mission 4 (Level-3 difficulty)",
    id = 64818, badge = "69830", published = "18/08/2018 19:18:45", modified = "10/04/2022 03:14:42",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 3) &&
              never(stage_section_w() < 771) &&
              never(stage_section_w() > 774) &&
              //measured(repeated(20, prev(p1_pickup_counter()) < p1_pickup_counter())) &&
              measured(tally(20, logic_items_collected_p1_sum())) &&
              game_event_program_w() == 3510
)

achievement(
    title = "MS3 Quartermaster XI", points = 10,
    description = "Find 25 bonus items in Ancient Ruins detour part of Mission 4 (Level-3 difficulty)",
    id = 64819, badge = "69831", published = "18/08/2018 19:18:47", modified = "10/04/2022 03:14:43",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 3) &&
              never(stage_section_w() != 775) &&
              measured(p1_pickup_counter() >= 25, stage_section_w() == 775) &&
              game_event_program_w() == 10234
)

achievement(
    title = "MS3 Quartermaster XII", points = 10,
    description = "Find 27 bonus items in Pyramid detour part of Mission 4 (Level-3 difficulty)",
    id = 64820, badge = "69832", published = "18/08/2018 19:18:49", modified = "10/04/2022 03:14:43",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 3) &&
              never(stage_section_w() < 778) &&
              never(stage_section_w() > 785) &&
              game_event_program_w() == 4196 &&
              once(stage_section_w() == 780 &&
              p1_pickup_counter() >= 9) &&
              once(stage_section_w() == 782 &&
              p1_pickup_counter() >= 2) &&
              once(stage_section_w() == 783 &&
              p1_pickup_counter() >= 7) &&
              (stage_section_w() == 778 &&
              p1_pickup_counter() >= 9)
)

achievement(
    title = "MS3 Quartermaster XIII", points = 10,
    description = "Find 200 bonus items in Final Mission (Level-3 difficulty)",
    id = 64821, badge = "69833", published = "18/08/2018 19:18:50", modified = "10/04/2022 03:14:44",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 4) &&
              never(stage_section_w() < 1024) &&
              never(stage_section_w() > 1038) &&
              //measured(repeated(200, prev(p1_pickup_counter()) < p1_pickup_counter()))
              measured(tally(200, logic_items_collected_p1_sum()))
)

// =========================================
//               Score Weapon              
// =========================================

achievement(
    title = "MS3 Infantry", points = 2,
    description = "Score 500 times equipped with H while on foot (Level-3 difficulty)",
    id = 66419, badge = "69898", published = "05/10/2018 00:22:07", modified = "10/04/2022 03:14:44",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_playtime60() &&
              measured(repeated(500, prev(p1_score_0000xx00()) < p1_score_0000xx00())) &&
              unless(p1_in_vehicle() == 1) &&
              unless(p1_weapon() < 5) &&
              unless(p1_weapon() == 6) &&
              unless(p1_weapon() == 7) &&
              unless(p1_weapon() == 8) &&
              unless(p1_weapon() == 9) &&
              unless(p1_weapon() >= 10) &&
              unless(p1_form() > 7) &&
              unless(p1_state() != 1)
)

achievement(
    title = "MS3 Modern Infantry", points = 5,
    description = "Score 500 times equipped with l while on foot (Level-3 difficulty)",
    id = 66420, badge = "69897", published = "05/10/2018 00:22:11", modified = "10/04/2022 03:14:45",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_playtime60() &&
              measured(repeated(500, prev(p1_score_0000xx00()) < p1_score_0000xx00())) &&
              unless(p1_weapon() < 6) &&
              unless(p1_weapon() > 11) &&
              unless(p1_weapon() == 7) &&
              unless(p1_weapon() == 8) &&
              unless(p1_weapon() == 9) &&
              unless(p1_weapon() == 10) &&
              unless(p1_in_vehicle() == 1) &&
              unless(p1_form() > 7) &&
              unless(p1_state() != 1)
)

achievement(
    title = "MS3 Response Force", points = 4,
    description = "Score 250 times equipped with S or F while on foot (Level-3 difficulty)",
    id = 66418, badge = "69899", published = "05/10/2018 00:22:00", modified = "10/04/2022 03:14:45",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_playtime60() &&
              measured(repeated(250, prev(p1_score_0000xx00()) < p1_score_0000xx00())) &&
              unless(p1_weapon() < 2) &&
              unless(p1_weapon() == 5) &&
              unless(p1_in_vehicle() == 1) &&
              unless(p1_weapon() == 6) &&
              unless(p1_weapon() > 7) &&
              unless(p1_state() != 1)
)

achievement(
    title = "MS3 Rocket Artillery", points = 4,
    description = "Score 250 times equipped with R or C while on foot (Level-3 difficulty)",
    id = 66421, badge = "69896", published = "05/10/2018 00:22:16", modified = "10/04/2022 03:14:46",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_playtime60() &&
              measured(repeated(250, prev(p1_score_0000xx00()) < p1_score_0000xx00())) &&
              unless(p1_weapon() < 8) &&
              unless(p1_weapon() == 9) &&
              unless(p1_weapon() == 10) &&
              unless(p1_weapon() == 11) &&
              unless(p1_weapon() > 12) &&
              unless(p1_in_vehicle() == 1) &&
              unless(p1_form() > 7) &&
              unless(p1_state() != 1)
)

achievement(
    title = "MS3 Anti-Tank Artillery", points = 3,
    description = "Score 250 times equipped with G, D or I while on foot (Level-3 difficulty)",
    id = 66422, badge = "69895", published = "05/10/2018 00:22:20", modified = "10/04/2022 03:14:46",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_playtime60() &&
              measured(repeated(250, prev(p1_score_0000xx00()) < p1_score_0000xx00())) &&
              unless(p1_weapon() < 12) &&
              unless(p1_weapon() > 15) &&
              unless(p1_in_vehicle() == 1) &&
              unless(p1_form() > 7) &&
              unless(p1_state() != 1)
)

achievement(
    title = "MS3 Mystic Ops", points = 2,
    description = "Score 30 times equipped with Cloud while on foot (Level-3 difficulty)",
    id = 66423, badge = "69894", published = "05/10/2018 00:22:26", modified = "10/04/2022 03:14:46",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_playtime60() &&
              measured(repeated(30, prev(p1_score_0000xx00()) < p1_score_0000xx00())) &&
              unless(p1_weapon() != 17) &&
              unless(p1_state() != 1)
)

achievement(
    title = "MS3 Special Ops", points = 5,
    description = "Score 150 times equipped with Satellite while on foot (Level-3 difficulty)",
    id = 66424, badge = "69893", published = "05/10/2018 00:22:31", modified = "10/04/2022 03:14:47",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_playtime60() &&
              measured(repeated(150, prev(p1_score_0000xx00()) < p1_score_0000xx00())) &&
              unless(p1_weapon() != 16) &&
              unless(p1_state() != 1)
)

achievement(
    title = "MS3 Commando", points = 4,
    description = "Score 500 times without using weapons, slugs or dying (Level-3 difficulty)",
    id = 66417, badge = "69900", published = "05/10/2018 00:21:50", modified = "10/04/2022 03:14:47",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_playtime60() &&
              measured(repeated(500, prev(p1_score_0000xx00()) < p1_score_0000xx00())) &&
              never(p1_weapon() != 0) &&
              never(prev(p1_lives()) > p1_lives()) &&
              unless(p1_form() > 7) &&
              unless(p1_vehicle() > 1) &&
              unless(p1_lives() == 1) &&
              never(p1_state() != 1)
)

// =========================================
//                   Forms              
// =========================================

achievement(
    title = "Metal Squab", points = 3,
    description = "Clear Mission 1 while being fat (Level-3 difficulty, Play Time 60)",
    id = 66425, badge = "69890", published = "05/10/2018 00:22:36", modified = "10/04/2022 03:14:48",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_playtime60() &&
              never(stage_id() != 0) &&
              trigger_when(stage_counters() == 29) &&
              p1_form() == 2
)

achievement(
    title = "Metal Haunt", points = 5,
    description = "Clear Mission 2 while being a zombie (Level-3 difficulty, Play Time 60)",
    id = 66426, badge = "69892", published = "05/10/2018 00:22:42", modified = "10/04/2022 03:14:48",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_playtime60() &&
              never(stage_id() != 1) &&
              trigger_when(stage_counters() == 29) &&
              p1_form() == 7
)

// =========================================
//                 Creditless              
// =========================================

achievement(
    title = "Carry Out I", points = 5,
    description = "Clear Mission 1 without using a credit (Level-3 difficulty, 3 Lives, Play Time 60)",
    id = 64780, badge = "69790", published = "18/08/2018 19:17:20", modified = "10/04/2022 03:14:49",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_lives3() &&
              settings_playtime60() &&
              never(stage_id_w() != 0) &&
              once(game_event_program_w() == 11654) &&
              trigger_when(stage_counters() == 29) &&
              never(p1_state() != 1)
)

achievement(
    title = "Carry Out II", points = 5,
    description = "Clear Mission 2 without using a credit (Level-3 difficulty, 3 Lives, Play Time 60)",
    id = 64781, badge = "69791", published = "18/08/2018 19:17:22", modified = "10/04/2022 03:14:49",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_lives3() &&
              settings_playtime60() &&
              never(stage_id() != 1) &&
              once(game_event_program_w() == 27136) &&
              trigger_when(stage_counters() == 29) &&
              never(p1_state() != 1)
)

achievement(
    title = "Carry Out III", points = 5,
    description = "Clear Mission 3 without using a credit (Level-3 difficulty, 3 Lives, Play Time 60)",
    id = 64782, badge = "69792", published = "18/08/2018 19:17:25", modified = "10/04/2022 03:14:49",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_lives3() &&
              settings_playtime60() &&
              never(stage_id() != 2) &&
              once(game_event_program_w() == 40626) &&
              trigger_when(stage_counters() == 29) &&
              never(p1_state() != 1)
)

achievement(
    title = "Carry Out IV", points = 5,
    description = "Clear Mission 4 without using a credit (Level-3 difficulty, 3 Lives, Play Time 60)",
    id = 64783, badge = "69793", published = "18/08/2018 19:17:27", modified = "10/04/2022 03:14:50",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_lives3() &&
              settings_playtime60() &&
              never(stage_id() != 3) &&
              once(game_event_program_w() == 51730) &&
              trigger_when(stage_counters() == 29) &&
              never(p1_state() != 1)
)

achievement(
    title = "Carry Out V", points = 10,
    description = "Clear Final Mission without using a credit (Level-3 difficulty, 3 Lives, Play Time 60)",
    id = 64784, badge = "69794", published = "18/08/2018 19:17:29", modified = "10/04/2022 03:14:50",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_lives3() &&
              settings_playtime60() &&
              never(stage_id() < 4) &&
              once(game_event_program_w() == 18170) &&
              trigger_when(stage_id() == 5) &&
              never(p1_state() != 1)
)

// =========================================
//                   Miscs              
// =========================================

achievement(
    title = "Munition Slug", points = 5,
    description = "Gather 999 of ammo (Level-3 difficulty, Play Time 60)",
    id = 66376, badge = "69852", published = "03/10/2018 04:26:24", modified = "10/04/2022 03:14:51",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_playtime60() &&
              p1_ammo() == 999
)

achievement(
    title = "Mulligan Slug", points = 5,
    description = "Gather 50 bombs (Level-3 difficulty, Play Time 60)",
    id = 64824, badge = "69836", published = "18/08/2018 19:18:59", modified = "10/04/2022 03:14:51",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_playtime60() &&
              p1_bombs() >= 50 &&
              p1_bombs() != 255
)

achievement(
    title = "Metal Jug", points = 50,
    description = "Score 5 million points (Level-3 difficulty, Play Time 60)",
    id = 64822, badge = "69834", published = "18/08/2018 19:18:54", modified = "10/04/2022 03:14:52",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_playtime60() &&
              p1_score_xx000000() == 5
)

achievement(
    title = "Combatant Foundation", points = 50,
    description = "Rescue total of 95 POWs in one game (Level-3 difficulty, Play Time 60)",
    id = 64823, badge = "69835", published = "18/08/2018 19:18:57", modified = "10/04/2022 03:14:52",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_playtime60() &&
              never(p1_pows_total() == 0) &&
              //measured(repeated(95, p1_pows() > prev(p1_pows())))
              measured(tally(95, logic_pows_collected_p1_sum()))
)

achievement(
    title = "Metal Slugger", points = 25,
    description = "Finish the game on Level-6 difficulty (Play Time 60)",
    id = 64825, badge = "69837", published = "18/08/2018 19:19:06", modified = "10/04/2022 03:14:53",
    trigger = is_mvs() &&
              never(settings_diff() < 5) &&
              p1_only() &&
              settings_playtime60() &&
              trigger_when(stage_id() == 5)
)

achievement(
    title = "Metal Slug 3 1CC", points = 50,
    description = "Beat the game using only one credit (Level-3 difficulty, 3 Lives, Play Time 60)",
    id = 64826, badge = "69838", published = "18/08/2018 19:19:21", modified = "10/04/2022 03:14:53",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_lives3() &&
              settings_playtime60() &&
              once(game_event_program_w() == 11654) &&
              once(stage_id() == 0) &&
              trigger_when(stage_id() == 5) &&
              never(p1_state() != 1)
)

// =========================================
//   Impossible Achievements (Unofficial)             
// =========================================

achievement(
    title = "The Great Rescue IX", points = 4,
    description = "Find all 18 POWs in Mission 4 going through the top route (Level-3 difficulty)",
    id = 64804, badge = "69817", published = "18/08/2018 19:18:19", modified = "07/10/2018 14:17:33",
    trigger = is_mvs() &&
              p1_only() &&
              settings_difficulty_level3() &&
              never(stage_id() != 3) &&
              once(game_event_program_w() == 62384) &&
              //p1_pows() == 21
              measured(tally(18, logic_pows_collected_p1_sum()))
)

achievement(
    title = "Metal Rag", points = 5,
    description = "Clear Mission 4 while being a mummy (Level-3 difficulty, Play Time 60)",
    id = 66427, badge = "69891", published = "05/10/2018 00:22:47", modified = "07/10/2018 14:18:43",
    trigger = is_mvs() &&
              settings_lives3() &&
              p1_only() &&
              settings_difficulty_level3() &&
              settings_playtime60() &&
              never(stage_id() != 3) &&
              stage_counters() == 29 &&
              p1_form() == 3
)

// =========================================
//           Damageless (Unofficial)              
// =========================================

// achievement(
//     title = "Metal Chug I (Huge Hermit)", points = 4,
//     description = "Defeat Huge Hermit without losing a life not teking detours (P1, dif>=Normal, oth opt<=default)",
//     id = 64785, badge = "69795", published = "18/08/2018 19:17:33", modified = "08/11/2018 04:32:59",
//     trigger = is_mvs() &&
//               settings_lives3() &&
//               p1_only() &&
//               settings_difficulty_level3() &&
//               settings_playtime60() &&
//               never(stage_id() != 0) &&
//               never(p1_state() != 1) &&
//               stage_counters() == 29 &&
//               p1_state() == 1 &&
              
//               ((once(game_event_program_w() == 18036) &&
//               never(prev(p1_lives()) > p1_lives())) ||
//                (once(game_event_program_w() == 18582) &&
//               never(prev(p1_lives()) > p1_lives())))
// )

// achievement(
//     title = "Metal Chug II (Monoeyes)", points = 5,
//     description = "Defeat Monoeyes without losing a life (P1, dif>=Normal, oth opt<=default)",
//     id = 64786, badge = "69796", published = "18/08/2018 19:17:35", modified = "21/08/2020 12:59:38",
//     trigger = is_mvs() &&
//               settings_lives3() &&
//               p1_only() &&
//               settings_difficulty_level3() &&
//               settings_playtime60() &&
//               never(stage_id() != 1) &&
//               once(game_event_program_w() == 33346) &&
//               game_event_program_w() == 33582 &&
//               never(p1_state() != 1) &&
//               never(prev(p1_lives()) > p1_lives()) &&
//               p1_state() == 1
// )

// achievement(
//     title = "Metal Chug III (Monoeye UFO)", points = 5,
//     description = "Defeat Monoeye UFO without losing a life (P1, dif>=Normal, oth opt<=default)",
//     id = 64787, badge = "69797", published = "18/08/2018 19:17:37", modified = "21/08/2020 12:59:37",
//     trigger = is_mvs() &&
//               settings_lives3() &&
//               p1_only() &&
//               settings_difficulty_level3() &&
//               settings_playtime60() &&
//               never(stage_id() != 1) &&
//               once(game_event_program_w() == 33402) &&
//               stage_counters() == 29 &&
//               never(p1_state() != 1) &&
//               never(prev(p1_lives()) > p1_lives()) &&
//               p1_state() == 1
// )

// achievement(
//     title = "Metal Chug IV (Jupiter King)", points = 5,
//     description = "Defeat Jupiter King without losing a life (P1, dif>=Normal, oth opt<=default)",
//     id = 64788, badge = "69798", published = "18/08/2018 19:17:40", modified = "21/08/2020 12:59:36",
//     trigger = is_mvs() &&
//               settings_lives3() &&
//               p1_only() &&
//               settings_difficulty_level3() &&
//               settings_playtime60() &&
//               never(stage_id() != 2) &&
//               once(game_event_program_w() == 46526) &&
//               stage_counters() == 29 &&
//               never(p1_state() != 1) &&
//               never(prev(p1_lives()) > p1_lives()) &&
//               p1_state() == 1
// )

// achievement(
//     title = "Metal Chug V (Sol Dae Rokkerr)", points = 5,
//     description = "Defeat Sol Dae Rokkerr without losing a life (P1, dif>=Normal, oth opt<=default)",
//     id = 64789, badge = "69799", published = "18/08/2018 19:17:42", modified = "21/08/2020 12:59:34",
//     trigger = is_mvs() &&
//               settings_lives3() &&
//               p1_only() &&
//               settings_difficulty_level3() &&
//               settings_playtime60() &&
//               never(stage_id() != 3) &&
//               stage_counters() == 29 &&
//               never(p1_state() != 1) &&
//               p1_state() == 1 &&
              
//               ((once(game_event_program_w() == 62384) &&
//               never(prev(p1_lives()) > p1_lives())) ||
//                (once(game_event_program_w() == 62408) &&
//               never(prev(p1_lives()) > p1_lives())))
// )

// achievement(
//     title = "Metal Chug VI (Hairbuster Riberts)", points = 5,
//     description = "Defeat Hairbuster Riberts without losing a life (P1, dif>=Normal, oth opt<=default)",
//     id = 64790, badge = "69800", published = "18/08/2018 19:17:44", modified = "21/08/2020 12:59:33",
//     trigger = is_mvs() &&
//               settings_lives3() &&
//               p1_only() &&
//               settings_difficulty_level3() &&
//               settings_playtime60() &&
//               never(stage_id() != 4) &&
//               once(game_event_program_w() == 22162) &&
//               game_event_program_w() == 22430 &&
//               never(p1_state() != 1) &&
//               never(prev(p1_lives()) > p1_lives()) &&
//               p1_state() == 1
// )

// achievement(
//     title = "Metal Chug VII (Hi-Do)", points = 5,
//     description = "Defeat Hi-Do without losing a life  (P1, dif>=Normal, oth opt<=default)",
//     id = 64791, badge = "69801", published = "18/08/2018 19:17:53", modified = "21/08/2020 12:59:32",
//     trigger = is_mvs() &&
//               settings_lives3() &&
//               p1_only() &&
//               settings_difficulty_level3() &&
//               settings_playtime60() &&
//               never(stage_id() != 4) &&
//               once(game_event_program_w() == 23088) &&
//               game_event_program_w() == 23154 &&
//               never(p1_state() != 1) &&
//               never(prev(p1_lives()) > p1_lives()) &&
//               p1_state() == 1
// )

// achievement(
//     title = "Metal Chug VIII (Rugname)", points = 5,
//     description = "Defeat Rugname without losing a life (P1, dif>=Normal, oth opt<=default)",
//     id = 64792, badge = "69802", published = "18/08/2018 19:17:55", modified = "21/08/2020 12:59:31",
//     trigger = is_mvs() &&
//               settings_lives3() &&
//               p1_only() &&
//               settings_difficulty_level3() &&
//               settings_playtime60() &&
//               never(stage_id() != 4) &&
//               once(game_event_program_w() == 23308) &&
//               game_event_program_w() == 29424 &&
//               never(p1_state() != 1) &&
//               never(prev(p1_lives()) > p1_lives()) &&
//               p1_state() == 1
// )

// achievement(
//     title = "Metal Chug IX (Fake Rootmars)", points = 5,
//     description = "Defeat Fake Rootmars without losing a life (P1, dif>=Normal, oth opt<=default)",
//     id = 64793, badge = "69803", published = "18/08/2018 19:17:57", modified = "21/08/2020 12:59:29",
//     trigger = is_mvs() &&
//               settings_lives3() &&
//               p1_only() &&
//               settings_difficulty_level3() &&
//               settings_playtime60() &&
//               never(stage_id() != 4) &&
//               once(game_event_program_w() == 44154) &&
//               game_event_program_w() == 44572 &&
//               never(p1_state() != 1) &&
//               never(prev(p1_lives()) > p1_lives()) &&
//               p1_state() == 1
// )

// achievement(
//     title = "Metal Chug X (Cloning Machine)", points = 5,
//     description = "Defeat Cloning Machine without losing a life (P1, dif>=Normal, oth opt<=default)",
//     id = 64794, badge = "69804", published = "18/08/2018 19:17:59", modified = "21/08/2020 12:59:27",
//     trigger = is_mvs() &&
//               settings_lives3() &&
//               p1_only() &&
//               settings_difficulty_level3() &&
//               settings_playtime60() &&
//               never(stage_id() != 4) &&
//               once(game_event_program_w() == 48052) &&
//               game_event_program_w() == 48530 &&
//               never(p1_state() != 1) &&
//               never(prev(p1_lives()) > p1_lives()) &&
//               p1_state() == 1
// )

// achievement(
//     title = "Metal Chug XI (Rootmars)", points = 5,
//     description = "Defeat Rootmars without losing a life (P1, dif>=Normal, oth opt<=default)",
//     id = 64795, badge = "69805", published = "18/08/2018 19:18:01", modified = "21/08/2020 12:59:26",
//     trigger = is_mvs() &&
//               settings_lives3() &&
//               p1_only() &&
//               settings_difficulty_level3() &&
//               settings_playtime60() &&
//               never(stage_section_w() < 1037) &&
//               once(stage_section_w() == 1037) &&
//               stage_id() == 5 &&
//               never(p1_state() != 1) &&
//               never(prev(p1_lives()) > p1_lives()) &&
//               p1_state() == 1
// )
