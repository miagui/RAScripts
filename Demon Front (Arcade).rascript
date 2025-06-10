// Demon Front
// #ID = 14880

function settings_bios_options() => byte(0x00A1A8)

function p1_charging() => byte(0x00A089)
function p1_time_holding_charge() => word(0x00A08A)

function stage_camera_x_coordinates() => word(0x00CBE0)
function key_artifact() => byte(0x00FF2D)

function game_stage_1() => byte(0x00FFB2)
function game_stage_section() => byte(0x00FFB3)
function game_stage_section_combo() => word(0x00FFB2)
function game_stage_2() => byte(0x01CB0E)
function game_stage_3() => byte(0x01DD24)

function game_stage_stage_select() => byte(0x01DB6F)

function boss_hp() => word(0x00FF92)
function boss_id() => word(0x00FF96)

function game_total_time_major() => word(0x01CB00)
function game_total_time_minor() => word(0x01CB02)
function game_credits() => byte(0x010A3D)
function game_artifacts() => byte(0x01DD1E)

function stage_section_timer_major() => word(0x01DD1A)
function stage_section_timer_minor() => word(0x01DD1C)

function p1_in_game_state() => byte(0x01DD29)
function p2_in_game_state() => byte(0x01DD2D)
function p1_continues_used() => word(0x01C930)

function p1_minion_level() => byte(0x00FF35)
function p1_combo_time() => byte(0x00FF36)
function p1_combo() => word(0x00FF38)
function p1_minion_barrier_life() => byte(0x00FF3A)
function p1_minion_barrier_being_used() => byte(0x00FF3D)
function p1_minion_experience_kills() => byte(0x00FF44)
function p1_ammo() => word(0x00FF48)
function p1_lives() => byte(0x00FF4C)
function p1_score_2nd_half() => word(0x00FF4E)
function p1_score_1st_half() => word(0x00FF50)

function p1_sum_of_max_combo_per_stage() => word(0x01C91C)
function p1_max_combo() => word(0x01C92C)

function p2_lives() => byte(0x00FF6C)

function p1_character() => byte(0x00FFF0)
function p1_state() => byte(0x00FFF1)
function p1_pet() => byte(0x00FFF2)
function p1_codes() => byte(0x00FFF8)

function p2_character() => byte(0x00FFFA)
function p2_state() => byte(0x00FFFB)
function p2_pet() => byte(0x00FFFC)

// Utility Function
function game_started() {
    return(
        dword(0xff4e) == 0x00000000 && // score
        __ornext(game_stage_section_combo() == 0x0000 || // stage 1
                game_stage_section_combo() == 0x0401 || // stage 2
                game_stage_section_combo() == 0x0702) && // stage 3
        stage_section_timer_minor() > 0x0000 &&
        prev(stage_section_timer_minor()) == 0x0000 &&
        stage_section_timer_major() == 0x0000
    )
}

achievement(
    title = "Big Claw", points = 5, type="progression",
    description = "Destroy the boss in Valley",
    id = 118889, badge = "129740", published = "21/07/2020 22:55:08", modified = "26/11/2022 05:16:29",
    trigger = game_stage_stage_select() == 1 && once(boss_id() == 0 && boss_hp() == 400) && prev(boss_hp()) > 0 &&
              boss_hp() == 0 && unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Twin Horn", points = 5, type="progression",
    description = "Destroy the boss in Station",
    id = 118890, badge = "129741", published = "21/07/2020 22:55:16", modified = "26/11/2022 05:16:26",
    trigger = game_stage_stage_select() == 2 && once(boss_id() == 1 && boss_hp() == 400) && prev(boss_hp()) > 0 &&
              boss_hp() == 0 && unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Evil Eyes", points = 5, type="progression",
    description = "Destroy the boss in Forest",
    id = 118891, badge = "129742", published = "21/07/2020 22:55:26", modified = "26/11/2022 05:16:27",
    trigger = game_stage_stage_select() == 3 && once(boss_id() == 2 && boss_hp() == 400) && prev(boss_hp()) > 0 &&
              boss_hp() == 0 && unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Iron Tooth", points = 5, type="progression",
    description = "Destroy the boss in Snow",
    id = 118892, badge = "129743", published = "21/07/2020 22:55:31", modified = "26/11/2022 05:16:27",
    trigger = game_stage_stage_select() == 4 && once(boss_id() == 3 && boss_hp() == 400) && prev(boss_hp()) > 0 &&
              boss_hp() == 0 && unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Devil Heart", points = 5, type="progression",
    description = "Destroy the boss in Temple",
    id = 118893, badge = "129744", published = "21/07/2020 22:55:37", modified = "26/11/2022 05:16:27",
    trigger = game_stage_stage_select() == 5 && once(boss_id() == 4 && boss_hp() == 400) && prev(boss_hp()) > 0 &&
              boss_hp() == 0 && unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Flame", points = 10, type="progression",
    description = "Destroy Jake Final Boss",
    id = 118894, badge = "129746", published = "21/07/2020 22:56:33", modified = "26/11/2022 05:16:28",
    trigger = game_stage_stage_select() == 6 && once(boss_id() == 6 && boss_hp() == 400) && prev(boss_hp()) > 0 &&
              boss_hp() == 0 && unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Frozen", points = 10, type="progression",
    description = "Destroy Sara Final Boss",
    id = 118895, badge = "129745", published = "21/07/2020 22:56:42", modified = "26/11/2022 05:16:28",
    trigger = game_stage_stage_select() == 6 && once(boss_id() == 9 && boss_hp() == 400) && prev(boss_hp()) > 0 &&
              boss_hp() == 0 && unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Thunder", points = 10, type="progression",
    description = "Destroy Dr. J Final Boss",
    id = 118896, badge = "129747", published = "21/07/2020 22:56:50", modified = "26/11/2022 05:16:28",
    trigger = game_stage_stage_select() == 6 && once(boss_id() == 8 && boss_hp() == 400) && prev(boss_hp()) > 0 &&
              boss_hp() == 0 && unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Storm", points = 10, type="progression",
    description = "Destroy Maya Final Boss",
    id = 118897, badge = "129748", published = "21/07/2020 22:57:00", modified = "18/03/2025 14:05:13",
    trigger = game_stage_stage_select() == 6 && once(boss_id() == 7 && boss_hp() == 400) && prev(boss_hp()) > 0 &&
              boss_hp() == 0 && unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Valley Key", points = 5,
    description = "Find the key in Stage 1",
    id = 118898, badge = "129730", published = "21/07/2020 22:57:15", modified = "26/11/2022 05:16:26",
    trigger = game_stage_stage_select() == 1 && prev(key_artifact()) == 96 && key_artifact() == 64 &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Station Key", points = 5,
    description = "Find the key in Stage 2",
    id = 118899, badge = "129731", published = "21/07/2020 22:57:19", modified = "26/11/2022 05:16:29",
    trigger = game_stage_stage_select() == 2 && prev(key_artifact()) == 96 && key_artifact() == 64 &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Forest Key", points = 5,
    description = "Find the key in Stage 3",
    id = 118900, badge = "129732", published = "21/07/2020 22:57:22", modified = "26/11/2022 05:16:30",
    trigger = game_stage_stage_select() == 3 && prev(key_artifact()) == 96 && key_artifact() == 64 &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Snow Key", points = 5,
    description = "Find the key in Stage 4",
    id = 118901, badge = "129733", published = "21/07/2020 22:57:26", modified = "26/11/2022 05:16:30",
    trigger = game_stage_stage_select() == 4 && prev(key_artifact()) == 96 && key_artifact() == 64 &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Temple Key", points = 5,
    description = "Find the key in Stage 5",
    id = 118902, badge = "129734", published = "21/07/2020 22:57:30", modified = "26/11/2022 05:16:30",
    trigger = game_stage_stage_select() == 5 && prev(key_artifact()) == 96 && key_artifact() == 64 &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Valley Artifact", points = 5,
    description = "Get the Artifact in Stage 1",
    id = 118903, badge = "129735", published = "21/07/2020 22:57:35", modified = "26/11/2022 05:16:31",
    trigger = repeated(2, game_stage_stage_select() == 1 && prev(key_artifact()) == 96 && key_artifact() == 64) &&
              prev(key_artifact()) == 32 && key_artifact() == 0 && unless(game_stage_stage_select() != 1) &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Station Artifact", points = 5,
    description = "Get the Artifact in Stage 2",
    id = 118904, badge = "129736", published = "21/07/2020 22:57:39", modified = "26/11/2022 05:16:31",
    trigger = repeated(2, game_stage_stage_select() == 2 && prev(key_artifact()) == 96 && key_artifact() == 64) &&
              prev(key_artifact()) == 32 && key_artifact() == 0 && unless(game_stage_stage_select() != 2) &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Forest Artifact", points = 5,
    description = "Get the Artifact in Stage 3",
    id = 118905, badge = "129737", published = "21/07/2020 22:57:42", modified = "26/11/2022 05:16:31",
    trigger = repeated(2, game_stage_stage_select() == 3 && prev(key_artifact()) == 96 && key_artifact() == 64) &&
              prev(key_artifact()) == 32 && key_artifact() == 0 && unless(game_stage_stage_select() != 3) &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Snow Artifact", points = 5,
    description = "Get the Artifact in Stage 4",
    id = 118906, badge = "129738", published = "21/07/2020 22:57:47", modified = "26/11/2022 05:16:23",
    trigger = repeated(2, game_stage_stage_select() == 4 && prev(key_artifact()) == 96 && key_artifact() == 64) &&
              prev(key_artifact()) == 32 && key_artifact() == 0 && unless(game_stage_stage_select() != 4) &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Temple Artifact", points = 5,
    description = "Get the Artifact in Stage 5",
    id = 118907, badge = "129739", published = "21/07/2020 22:57:51", modified = "26/11/2022 05:16:21",
    trigger = repeated(2, game_stage_stage_select() == 5 && prev(key_artifact()) == 96 && key_artifact() == 64) &&
              prev(key_artifact()) == 32 && key_artifact() == 0 && unless(game_stage_stage_select() != 5) &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Chain Reaction", points = 25,
    description = "Reach a 500 combo",
    id = 118908, badge = "129749", published = "21/07/2020 22:58:05", modified = "26/11/2022 05:16:21",
    trigger = prev(p1_combo()) == 499 && p1_combo() == 500 && unless(once(settings_bios_options() != 0)) &&
              unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Slug Style 001", points = 10,
    description = "Finish stage 1 without using any minion skill and no continue",
    id = 118909, badge = "129729", published = "21/07/2020 22:58:11", modified = "26/11/2022 05:16:21",
    trigger = game_stage_stage_select() == 1 && once(boss_id() == 0 && boss_hp() == 400) && prev(boss_hp()) > 0 &&
              boss_hp() == 0 &&
              unless(once(game_stage_stage_select() == 1 && prev(p1_continues_used()) > p1_continues_used())) &&
              unless(once(p1_minion_barrier_being_used() == 1)) && unless(once(p1_time_holding_charge() == 48)) &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Slug Style 002", points = 10,
    description = "Finish stage 2 without using any minion skill and no continue",
    id = 118910, badge = "129725", published = "21/07/2020 22:58:16", modified = "26/11/2022 05:16:22",
    trigger = game_stage_stage_select() == 2 && once(boss_id() == 1 && boss_hp() == 400) && prev(boss_hp()) > 0 &&
              boss_hp() == 0 &&
              unless(once(game_stage_stage_select() == 2 && prev(p1_continues_used()) > p1_continues_used())) &&
              unless(once(p1_minion_barrier_being_used() == 1)) && unless(once(p1_time_holding_charge() == 48)) &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Slug Style 003", points = 10,
    description = "Finish stage 3 without using any minion skill and no continue",
    id = 118911, badge = "129726", published = "21/07/2020 22:58:19", modified = "26/11/2022 05:16:22",
    trigger = game_stage_stage_select() == 3 && once(boss_id() == 2 && boss_hp() == 400) && prev(boss_hp()) > 0 &&
              boss_hp() == 0 &&
              unless(once(game_stage_stage_select() == 3 && prev(p1_continues_used()) > p1_continues_used())) &&
              unless(once(p1_minion_barrier_being_used() == 1)) && unless(once(p1_time_holding_charge() == 48)) &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Mecha-Celsius God", points = 50,
    description = "Jake 1 CC",
    id = 118914, badge = "129721", published = "21/07/2020 22:58:30", modified = "26/11/2022 05:16:22",
    trigger = p1_character() == 2 && once(prev(game_stage_stage_select()) == 0) &&
              trigger_when(game_stage_stage_select() == 6) && trigger_when(once(boss_id() == 6 && boss_hp() == 400)) &&
              trigger_when(prev(boss_hp()) > 0) && trigger_when(boss_hp() == 0) && unless(p1_continues_used() != 0) &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Mecha-Kelvin God", points = 50,
    description = "Sara  1 CC",
    id = 118915, badge = "129722", published = "21/07/2020 22:58:34", modified = "26/11/2022 05:16:20",
    trigger = p1_character() == 1 && once(prev(game_stage_stage_select()) == 0) &&
              trigger_when(game_stage_stage_select() == 6) && trigger_when(once(boss_id() == 9 && boss_hp() == 400)) &&
              trigger_when(prev(boss_hp()) > 0) && trigger_when(boss_hp() == 0) && unless(p1_continues_used() != 0) &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Mecha-Volt God", points = 50,
    description = "Dr. J 1 CC",
    id = 118916, badge = "129723", published = "21/07/2020 22:58:37", modified = "26/11/2022 05:16:23",
    trigger = p1_character() == 3 && once(prev(game_stage_stage_select()) == 0) &&
              trigger_when(game_stage_stage_select() == 6) && trigger_when(once(boss_id() == 8 && boss_hp() == 400)) &&
              trigger_when(prev(boss_hp()) > 0) && trigger_when(boss_hp() == 0) && unless(p1_continues_used() != 0) &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Mecha-Saffir God", points = 50,
    description = "Maya 1 CC",
    id = 118917, badge = "129724", published = "21/07/2020 22:58:43", modified = "26/11/2022 05:16:24",
    trigger = p1_character() == 0 && once(prev(game_stage_stage_select()) == 0) &&
              trigger_when(game_stage_stage_select() == 6) && trigger_when(once(boss_id() == 7 && boss_hp() == 400)) &&
              trigger_when(prev(boss_hp()) > 0) && trigger_when(boss_hp() == 0) && unless(p1_continues_used() != 0) &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Aeolus", points = 5,
    description = "Grow up Maya's Minion to max level",
    id = 118924, badge = "129772", published = "22/07/2020 04:38:58", modified = "26/11/2022 05:16:24",
    trigger = p1_pet() == 0 && prev(p1_minion_level()) == 7 && p1_minion_level() == 8 &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Boreas", points = 5,
    description = "Grow up Sara's Minion to max level",
    id = 118925, badge = "129774", published = "22/07/2020 04:39:19", modified = "26/11/2022 05:16:24",
    trigger = p1_pet() == 1 && prev(p1_minion_level()) == 7 && p1_minion_level() == 8 &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Hephaestus", points = 5,
    description = "Grow up Jake's Minion to max level",
    id = 118926, badge = "129773", published = "22/07/2020 04:39:25", modified = "26/11/2022 05:16:25",
    trigger = p1_pet() == 2 && prev(p1_minion_level()) == 7 && p1_minion_level() == 8 &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Brontes", points = 5,
    description = "Grow up Dr. J Minion to max level",
    id = 118927, badge = "129775", published = "22/07/2020 04:39:29", modified = "26/11/2022 05:16:25",
    trigger = p1_pet() == 3 && prev(p1_minion_level()) == 7 && p1_minion_level() == 8 &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Gate of Hell", points = 10,
    description = "Get all artifacts",
    id = 118929, badge = "129782", published = "22/07/2020 18:59:09", modified = "26/11/2022 05:16:25",
    trigger = unless(once(settings_bios_options() != 0)) && unless(once(p2_state() != 0)) &&
              (game_artifacts() == 15 || game_artifacts() == 23) &&
              ((never(game_stage_stage_select() == 0)) ||
               (repeated(2, game_stage_stage_select() == 4 && prev(key_artifact()) == 96 && key_artifact() == 64) &&
                prev(key_artifact()) == 32 && key_artifact() == 0 && unless(game_stage_stage_select() != 4)) ||
               (repeated(2, game_stage_stage_select() == 5 && prev(key_artifact()) == 96 && key_artifact() == 64) &&
                prev(key_artifact()) == 32 && key_artifact() == 0 && unless(game_stage_stage_select() != 5)))
)

achievement(
    title = "Slug Style 004", points = 25,
    description = "Finish stage 4 without using any minion skill and no continue",
    id = 118912, badge = "129727", published = "21/07/2020 22:58:23", modified = "21/07/2020 22:58:23",
    trigger = game_stage_stage_select() == 4 && once(boss_id() == 3 && boss_hp() == 400) && prev(boss_hp()) > 0 &&
              boss_hp() == 0 &&
              unless(once(game_stage_stage_select() == 4 && prev(p1_continues_used()) > p1_continues_used())) &&
              unless(once(p1_minion_barrier_being_used() == 1)) && unless(once(p1_time_holding_charge() == 48)) &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() > 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)

achievement(
    title = "Slug Style 005", points = 25,
    description = "Finish stage 5 without using any minion skill and no continue",
    id = 118913, badge = "129728", published = "21/07/2020 22:58:26", modified = "21/07/2020 22:58:26",
    trigger = game_stage_stage_select() == 5 && once(boss_id() == 4 && boss_hp() == 400) && prev(boss_hp()) > 0 &&
              boss_hp() == 0 &&
              unless(once(game_stage_stage_select() == 5 && prev(p1_continues_used()) > p1_continues_used())) &&
              unless(once(p1_minion_barrier_being_used() == 1)) && unless(once(p1_time_holding_charge() == 48)) &&
              unless(once(settings_bios_options() != 0)) && unless(once(p2_state() > 0)) &&
              (always_false() || (never(game_stage_stage_select() == 0)))
)


// =========================================
//                Leaderboards              
// =========================================

leaderboard(
    id = 8764, title = "Sara 1CC Score",
    description = "",
    start  = game_stage_1() == 5 && p1_character() == 1 && boss_id() == 9 && boss_hp() == 0 && prev(boss_hp()) > 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0) ||
              (p1_continues_used() != 0)),
    submit = always_true(),
    value  = p1_score_1st_half() + p1_score_2nd_half() * 65536,
    format = "SCORE"
)

leaderboard(
    id = 8778, title = "Jake 1CC Score",
    description = "",
    start  = game_stage_1() == 5 && p1_character() == 2 && boss_id() == 6 && boss_hp() == 0 && prev(boss_hp()) > 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0) ||
              (p1_continues_used() != 0)),
    submit = always_true(),
    value  = p1_score_1st_half() + p1_score_2nd_half() * 65536,
    format = "SCORE"
)

leaderboard(
    id = 8779, title = "Dr. J 1CC Score",
    description = "",
    start  = game_stage_1() == 5 && p1_character() == 3 && boss_id() == 8 && boss_hp() == 0 && prev(boss_hp()) > 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0) ||
              (p1_continues_used() != 0)),
    submit = always_true(),
    value  = p1_score_1st_half() + p1_score_2nd_half() * 65536,
    format = "SCORE"
)

leaderboard(
    id = 8780, title = "Maya 1CC Score",
    description = "",
    start  = game_stage_1() == 5 && p1_character() == 0 && boss_id() == 7 && boss_hp() == 0 && prev(boss_hp()) > 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0) ||
              (p1_continues_used() != 0)),
    submit = always_true(),
    value  = p1_score_1st_half() + p1_score_2nd_half() * 65536,
    format = "SCORE"
)

leaderboard(
    id = 8784, title = "Sara 1CC Max Combo",
    description = "",
    start  = game_stage_1() == 5 && p1_character() == 1 && boss_id() == 9 && boss_hp() == 0 && prev(boss_hp()) > 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0) ||
              (p1_continues_used() != 0)),
    submit = always_true(),
    value  = p1_max_combo(),
    format = "VALUE"
)


leaderboard(
    id = 8786, title = "Jake 1CC Max Combo",
    description = "",
    start  = game_stage_1() == 5 && p1_character() == 2 && boss_id() == 6 && boss_hp() == 0 && prev(boss_hp()) > 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0) ||
              (p1_continues_used() != 0)),
    submit = always_true(),
    value  = p1_max_combo(),
    format = "VALUE"
)

leaderboard(
    id = 8788, title = "Dr. J 1CC Max Combo",
    description = "",
    start  = game_stage_1() == 5 && p1_character() == 3 && boss_id() == 8 && boss_hp() == 0 && prev(boss_hp()) > 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0) ||
              (p1_continues_used() != 0)),
    submit = always_true(),
    value  = p1_max_combo(),
    format = "VALUE"
)

leaderboard(
    id = 8790, title = "Maya 1CC Max Combo",
    description = "",
    start  = game_stage_1() == 5 && p1_character() == 0 && boss_id() == 7 && boss_hp() == 0 && prev(boss_hp()) > 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0) ||
              (p1_continues_used() != 0)),
    submit = always_true(),
    value  = p1_max_combo(),
    format = "VALUE"
)

leaderboard(
    id = 8792, title = "Wall of Shame - Frozen",
    description = "",
    start  = game_stage_1() == 5 && boss_id() == 9 && boss_hp() == 0 && prev(boss_hp()) > 0 &&  settings_bios_options() == 0 &&
             p2_state() == 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0)),
    submit = always_true(),
    value  = p1_continues_used(),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    id = 8793, title = "Wall of Shame - Thunder",
    description = "",
    start  = game_stage_1() == 5 && boss_id() == 8 && boss_hp() == 0 && prev(boss_hp()) > 0 &&  settings_bios_options() == 0 &&
             p2_state() == 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0)),
    submit = always_true(),
    value  = p1_continues_used(),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    id = 8794, title = "Wall of Shame - Storm",
    description = "",
    start  = game_stage_1() == 5 && boss_id() == 7 && boss_hp() == 0 && prev(boss_hp()) > 0 &&  settings_bios_options() == 0 &&
             p2_state() == 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0)),
    submit = always_true(),
    value  = p1_continues_used(),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    id = 8795, title = "Wall of Shame - Flame",
    description = "",
    start  = game_stage_1() == 5 && boss_id() == 6 && boss_hp() == 0 && prev(boss_hp()) > 0 &&  settings_bios_options() == 0 &&
             p2_state() == 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0)),
    submit = always_true(),
    value  = p1_continues_used(),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    id = 8796, title = "Frozen Score",
    description = "",
    start  = game_stage_1() == 5 && boss_id() == 9 && boss_hp() == 0 && prev(boss_hp()) > 0 &&  settings_bios_options() == 0 &&
             p2_state() == 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0)),
    submit = always_true(),
    value  = p1_score_1st_half() + p1_score_2nd_half() * 65536,
    format = "SCORE"
)

leaderboard(
    id = 8797, title = "Frozen Max Combo",
    description = "",
    start  = game_stage_1() == 5 && boss_id() == 9 && boss_hp() == 0 && prev(boss_hp()) > 0 &&  settings_bios_options() == 0 &&
             p2_state() == 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0)),
    submit = always_true(),
    value  = p1_max_combo(),
    format = "VALUE"
)

leaderboard(
    id = 8798, title = "Thunder Score",
    description = "",
    start  = game_stage_1() == 5 && boss_id() == 8 && boss_hp() == 0 && prev(boss_hp()) > 0 &&  settings_bios_options() == 0 &&
             p2_state() == 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0)),
    submit = always_true(),
    value  = p1_score_1st_half() + p1_score_2nd_half() * 65536,
    format = "SCORE"
)

leaderboard(
    id = 8799, title = "Thunder Max Combo",
    description = "",
    start  = game_stage_1() == 5 && boss_id() == 8 && boss_hp() == 0 && prev(boss_hp()) > 0 &&  settings_bios_options() == 0 &&
             p2_state() == 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0)),
    submit = always_true(),
    value  = p1_max_combo(),
    format = "VALUE"
)

leaderboard(
    id = 8800, title = "Storm Score",
    description = "",
    start  = game_stage_1() == 5 && boss_id() == 7 && boss_hp() == 0 && prev(boss_hp()) > 0 &&  settings_bios_options() == 0 &&
             p2_state() == 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0)),
    submit = always_true(),
    value  = p1_score_1st_half() + p1_score_2nd_half() * 65536,
    format = "SCORE"
)

leaderboard(
    id = 8801, title = "Storm Max Combo",
    description = "",
    start  = game_stage_1() == 5 && boss_id() == 7 && boss_hp() == 0 && prev(boss_hp()) > 0 &&  settings_bios_options() == 0 &&
             p2_state() == 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0)),
    submit = always_true(),
    value  = p1_max_combo(),
    format = "VALUE"
)

leaderboard(
    id = 8802, title = "Flame Score",
    description = "",
    start  = game_stage_1() == 5 && boss_id() == 6 && boss_hp() == 0 && prev(boss_hp()) > 0 &&  settings_bios_options() == 0 &&
             p2_state() == 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0)),
    submit = always_true(),
    value  = p1_score_1st_half() + p1_score_2nd_half() * 65536,
    format = "SCORE"
)

leaderboard(
    id = 8803, title = "Flame Max Combo",
    description = "",
    start  = game_stage_1() == 5 && boss_id() == 6 && boss_hp() == 0 && prev(boss_hp()) > 0 &&  settings_bios_options() == 0 &&
             p2_state() == 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0)),
    submit = always_true(),
    value  = p1_max_combo(),
    format = "VALUE"
)

// =========================================
//                Speedrun              
// =========================================

// TODO: Add cancel condition for credit used
// 1CC
leaderboard(
    id = 8783, title = "Sara 1CC Time",
    description = "",
    start  = game_started() && p1_character() == 1 && 
             settings_bios_options() == 0 && p2_state() == 0 && p1_continues_used() == 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0) ||
              (p1_continues_used() != 0)),
    submit = game_stage_1() == 5 && p1_character() == 1 && prev(boss_id()) == 9 && boss_hp() == 0 && prev(boss_hp()) > 0,
    value  = always_true(),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 8785, title = "Jake 1CC Time",
    description = "",
    start  = game_started() && p1_character() == 2 && 
             settings_bios_options() == 0 && p2_state() == 0 && p1_continues_used() == 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0) ||
              (p1_continues_used() != 0)),
    submit = game_stage_1() == 5 && p1_character() == 2 && prev(boss_id()) == 6 && boss_hp() == 0 && prev(boss_hp()) > 0,
    value  = always_true(),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 8787, title = "Dr. J 1CC Time",
    description = "",
    start  = game_started() && p1_character() == 3 && 
             settings_bios_options() == 0 && p2_state() == 0 && p1_continues_used() == 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0) ||
              (p1_continues_used() != 0)),
    submit = game_stage_1() == 5 && p1_character() == 3 && prev(boss_id()) == 8 && boss_hp() == 0 && prev(boss_hp()) > 0,
    value  = always_true(),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 8789, title = "Maya 1CC Time",
    description = "",
    start  = game_started() && p1_character() == 0 && 
             settings_bios_options() == 0 && p2_state() == 0 && p1_continues_used() == 0,
    cancel = ((p2_state() > 0) ||
              (settings_bios_options() != 0) ||
              (p1_continues_used() != 0)),
    submit = game_stage_1() == 5 && p1_character() == 0 && prev(boss_id()) == 7 && boss_hp() == 0 && prev(boss_hp()) > 0,
    value  = always_true(),
    format = "FRAMES", lower_is_better = true
)

// Max Time
leaderboard(
    id = 8804, title = "Flame Max Time",
    description = "",
    start  = game_started() && p1_character() == 2 && 
             settings_bios_options() == 0 && p2_state() == 0,
    cancel = ((p2_state() > 0) ||
              (p1_character() != 2 && p1_state() == 3) ||
              (settings_bios_options() != 0)),
    submit = game_stage_1() == 5 && prev(boss_id()) == 6 && boss_hp() == 0 && prev(boss_hp()) > 0 &&  settings_bios_options() == 0 &&
             p2_state() == 0,
    value  = always_true(),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 8805, title = "Storm Max Time",
    description = "",
    start  = game_started() && p1_character() == 0 && 
             settings_bios_options() == 0 && p2_state() == 0,
    cancel = ((p2_state() > 0) ||
              (p1_character() != 0 && p1_state() == 3) ||
              (settings_bios_options() != 0)),
    submit = game_stage_1() == 5 && prev(boss_id()) == 7 && boss_hp() == 0 && prev(boss_hp()) > 0 &&  settings_bios_options() == 0 &&
             p2_state() == 0,
    value  = always_true(),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 8806, title = "Thunder Max Time",
    description = "",
    start  = game_started() && p1_character() == 3 && 
             settings_bios_options() == 0 && p2_state() == 0,
    cancel = ((p2_state() > 0) ||
              (p1_character() != 3 && p1_state() == 3) ||
              (settings_bios_options() != 0)),
    submit = game_stage_1() == 5 && prev(boss_id()) == 8 && boss_hp() == 0 && prev(boss_hp()) > 0 &&  settings_bios_options() == 0 &&
             p2_state() == 0,
    value  = always_true(),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 8807, title = "Frozen Max Time",
    description = "",
    start  = game_started() && p1_character() == 1 && 
             settings_bios_options() == 0 && p2_state() == 0,
    cancel = ((p2_state() > 0) ||
              (p1_character() != 1 && p1_state() == 3) ||
              (settings_bios_options() != 0)),
    submit = game_stage_1() == 5 && prev(boss_id()) == 9 && boss_hp() == 0 && prev(boss_hp()) > 0 &&  settings_bios_options() == 0 &&
             p2_state() == 0,
    value  = always_true(),
    format = "FRAMES", lower_is_better = true
)
