// Mortal Kombat 3
// #ID = 14983

function game_state() => byte(0xc12c) //C
         gs_booting_rom = 0x00
         gs_attract = 0x01
         gs_fighting = 0x02
         gs_kontinue_screen = 0x03
         gs_char_select = 0x04
         gs_round_end = 0x05
         gs_pre_fight_setup = 0x06
         gs_round_intro = 0x07
         gs_diagnostic_menu = 0x08
         gs_vs_screen = 0x09
         gs_game_over = 0x0b
         gs_post_char_select = 0x0d
         gs_rellim_ohcanep = 0x12

function game_stage() => byte(0xc442) //C
function game_cpu_diff() => byte(0xc444) //C
function ladder_match() => byte(0xc450) //C
function ladder_tower() => byte(0xc5b0) //C
         tower_novice = 2
         tower_warrior = 0
         tower_master = 1

function round_finishing_move() => byte(0xc422) //C
         f_fatality = 0x01
         f_pit_fatality = 0x02
         f_animality = 0x03
         f_friendship = 0x04
         f_babality = 0x05

function round_finishing_move_announce() => byte(0xc4de) //c
function match_current_round() => byte(0xc448) //C

function p1_state() => byte(0xc130) //C
function p2_state() => byte(0xc2a6) //C
         ps_inactive = 0
         ps_fighting = 1
         ps_char_selecting = 3
         ps_char_selected = 4

function p1_char() => word(0xc142) //C
function p1_vel_x() => word(0x00C14A)
function p1_hp() => word(0xc148) //C
function p1_flawless_victory_flag() => word(0xc14c) //C
function p1_rounds_wins() => byte(0xc14e) //C

function p2_char() => word(0xc2b8) //C
function p2_hp() => word(0xc2be) //C
function p2_rounds_wins() => byte(0xc2c4) //C
function p2_last_hit() => word(0xc468)

function p1_matches_won_row() => byte(0xc454) //C
function p1_rounds_won_row() => byte(0xc458) //C

characters = {
    "Kano": 0,
    "Sonya": 1,
    "Jax": 2,
    "Nightwolf": 3,
    "Sub-Zero": 4,
    "Stryker": 5,
    "Sindel": 6,
    "Sektor": 7,
    "Cyrax": 8,
    "Kung Lao": 9,
    "Kabal": 10,
    "Sheeva": 11,
    "Shang Tsung": 12,
    "Liu Kang": 13,
    "Smoke": 14,
    "Motaro": 15,
    "Shao Kahn": 16
}

animalities_name = {
    "Kano": "Giant Tarantula",
    "Sonya": "Hawk",
    "Jax": "Lion",
    "Nightwolf": "Wolf",
    "Sub-Zero": "Polar Bear",
    "Stryker": "Tyrannosaurus Rex",
    "Sindel": "Giant Hornet",
    "Sektor": "Giant Bat",
    "Cyrax": "Shark",
    "Kung Lao": "Cheetah",
    "Kabal": "Skeletal Rhinoceros",
    "Sheeva": "Scorpion",
    "Shang Tsung": "Cobra",
    "Liu Kang": "Dragon",
    "Smoke": "Bull"
}

title_names = {
    "Kano": "Greedy for Power",
    "Sonya": "Outerworld Investigation Agency",
    "Jax": "Strongest Man on Earth",
    "Nightwolf": "Sacred Land",
    "Sub-Zero": "Former Ninja",
    "Stryker": "City Protector",
    "Sindel": "Mom and Daughter Reunion",
    "Sektor": "Self-Destruction",
    "Cyrax": "Stranded in the Desert",
    "Kung Lao": "Great Kung Lao",
    "Kabal": "Fighting Injustice",
    "Sheeva": "Shokan Pride",
    "Shang Tsung": "Own Brand of Evil",
    "Liu Kang": "Mortal Kombat Champion",
    "Smoke": "Artificial Body"
}

// Utility Functions
function p1_only() => p1_state() > 0 && p2_state() == 0
function game_beaten() => p2_char() == characters["Shao Kahn"] && p1_rounds_wins() == 2 && prev(p1_rounds_wins()) == 1

// ========================
//       Beat the Game
// ========================

for char in characters {
    if (char != "Motaro" && char != "Shao Kahn") {
        achievement(title_names[char], format("Beat the game using only {0}.", char), 10, 
                trigger = p1_only() &&
                          once(ladder_match() == 0 && game_state() == gs_char_select && p1_char() == characters[char]) &&
                          never(p1_char() != characters[char] && game_state() == gs_char_select && ladder_match () == 0) &&
                          never(p1_char() != characters[char] && game_state() == gs_fighting) &&
                          never(game_state() == gs_diagnostic_menu || game_state() == gs_booting_rom) &&
                          trigger_when(game_beaten()))
    }
}

// ========================
//          Towers
// ========================

achievement("Novice Ladder", "Finish the Novice tower.", 3, 
            trigger =   p1_only() &&
                        game_beaten() &&
                        ladder_tower() == tower_novice)

achievement("Warrior Ladder", "Finish the Warrior tower.", 5, 
            trigger =   p1_only() &&
                        game_beaten() &&
                        ladder_tower() == tower_warrior)

achievement("Master Ladder", "Finish the Master tower.", 10, 
            trigger =   p1_only() &&
                        game_beaten() &&
                        ladder_tower() == tower_master)

// ========================
//        Fatality
// ========================

achievement("Fatality!", "Perform a Fatality (Arcade Mode).", 2,
            trigger =   p1_only() &&
                        unless(game_state() != gs_fighting) &&
                        round_finishing_move() == f_fatality &&
                        p1_hp() > 0)

achievement("Babality", "Perform a Babality (Arcade Mode).", 2,
            trigger =   p1_only() &&
                        unless(game_state() != gs_fighting) &&
                        round_finishing_move() == f_babality &&
                        p1_hp() > 0)

achievement("Friendship. Friendship, again?", "Perform a Friendship (Arcade Mode).", 2,
            trigger =   p1_only() &&
                        unless(game_state() != gs_fighting) &&
                        round_finishing_move() == f_friendship &&
                        p1_hp() > 0)

achievement("The Train", "Perform a Stage Fatality on The Subway.", 2,
            trigger =   p1_only() &&
                        unless(game_state() != gs_fighting) &&
                        round_finishing_move() == f_pit_fatality &&
                        game_stage() == 0x00 &&
                        p1_hp() > 0)

achievement("The Spikes", "Perform a Stage Fatality on Bell Tower.", 2,
            trigger =   p1_only() &&
                        unless(game_state() != gs_fighting) &&
                        round_finishing_move() == f_pit_fatality &&
                        game_stage() == 0x07 &&
                        p1_hp() > 0)

achievement("The Crusher", "Perform a Stage Fatality on The Pit III.", 2,
            trigger =   p1_only() &&
                        unless(game_state() != gs_fighting) &&
                        round_finishing_move() == f_pit_fatality &&
                        game_stage() == 0x0a &&
                        p1_hp() > 0)

for char in characters {
    if (char != "Motaro" && char != "Shao Kahn") {
        achievement(animalities_name[char], format("{0}: Perform an Animality (Arcade Mode).", char), 5,
                trigger = unless(!p1_only()) &&
                          unless(p1_char() != characters[char]) &&
                          unless(p1_hp() == 0) &&
                          unless(game_state() != gs_fighting) &&
                          round_finishing_move() == f_animality)
    }
}


// ========================
//     Flawless Victory
// ========================

achievement("Flawless Victory", "Get a Flawless Victory.", 1, 
            trigger =   p1_only() &&
                        unless(p1_hp() < 0xa6) &&
                        p1_rounds_wins() > prev(p1_rounds_wins()))

achievement("Double Flawless Victory", "Get a Double Flawless Victory.", 4, 
            trigger =   p1_only() &&
                        unless(p1_hp() < 0xa6) &&
                        never(p1_rounds_wins() == 0) &&
                        repeated(2, p1_rounds_wins() > prev(p1_rounds_wins())))

achievement("Taming the Centaur", "Defeat Motaro with a Flawless Victory on Master tower.", 10,
            trigger =   p1_only() &&
                        p1_hp() == 0xa6 &&
                        trigger_when(p1_flawless_victory_flag() == 1 && prev(p1_flawless_victory_flag()) == 0) &&
                        ladder_tower() == tower_master &&
                        p2_char() == characters["Motaro"])

achievement("Discharging the Emperor", "Defeat Shao Kahn with a Flawless Victory on Master tower.", 10,
            trigger =   p1_only() &&
                        p1_hp() == 0xa6 &&
                        trigger_when(p1_flawless_victory_flag() == 1 && prev(p1_flawless_victory_flag()) == 0) &&
                        ladder_tower() == tower_master &&
                        p2_char() == characters["Shao Kahn"])

// ========================
//          Misc
// ========================

// achievement("Penacho Miller", "Beware the realm of Rellim Ohcanep!", 3,
//             trigger =   game_state() == gs_rellim_ohcanep &&
//                         prev(game_state()) != gs_rellim_ohcanep)

achievement("Cold and in Danger", "Frosty!", 1,
            trigger =   p1_state() > 0 &&
                        p2_hp() <= 0x08 &&
                        p2_last_hit() == 0x0006 && prev(p2_last_hit()) != 0x0006)

achievement("Totally not Kano", "Defeat Noob Saibot.", 25,
            trigger =   p1_only() &&
                        never(p2_char() != 0x11) &&
                        once(match_current_round() == 1 && game_state() == gs_round_intro) &&
                        prev(p1_rounds_wins()) == 0 &&
                        p1_rounds_wins() == 1)

achievement("Unsmoking the Smoke", "Defeat Smoke.", 25,
            trigger =   p1_only() &&
                        never(p2_char() != characters["Smoke"]) &&
                        once(match_current_round() == 1 && game_state() == gs_round_intro) &&
                        prev(p1_rounds_wins()) == 0 &&
                        p1_rounds_wins() == 1)

achievement("MK3 1CC", "Beat the game on Master tower without losing a match.", 50, 
            trigger =   never(!p1_only()) &&
                        once(game_state() == gs_fighting && ladder_match() == 0) &&
                        never(p2_rounds_wins() == 2) &&
                        never(ladder_tower() != tower_master) &&
                        trigger_when(game_beaten()))