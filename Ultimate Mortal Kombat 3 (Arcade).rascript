// Ultimate Mortal Kombat 3
// #ID = 14654

function game_state() => byte(0x00C12C)
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

function game_stage() => byte(0x00C44C)
function game_cpu_diff() => byte(0x00C44E)
function ladder_match() => byte(0x00C45A)
function ladder_tower() => byte(0xc5f6)
         tower_novice = 0
         tower_warrior = 1
         tower_master_i = 2
         tower_master_ii = 3

function round_finishing_move() => byte(0x00C426)
         f_fatality = 0x01
         f_pit_fatality = 0x02
         f_animality = 0x03
         f_friendship = 0x04
         f_babality = 0x05
         f_brutality = 0x06

function round_finishing_move_announce() => byte(0x00C4E6)
function round_move_allowed() => byte(0x00C42A)
function round_victory_state() => byte(0x00C454)
function match_current_round() => byte(0x00C452)

function p1_state() => byte(0x00C134)
function p2_state() => byte(0x00c2aa)
         ps_inactive = 0
         ps_fighting = 1
         ps_char_selecting = 3
         ps_char_selected = 4

function p1_char() => word(0x00c146)
function p1_vel_x() => word(0x00C14A)
function p1_hp() => word(0x00C14C)
function p1_stamina() => word(0x00C14E)
function p1_flawless_victory_flag() => word(0x00C150)
function p1_rounds_wins() => byte(0x00C152)

function p2_char() => word(0x00C2BC)
function p2_hp() => word(0x00C2C2)
function p2_stamina() => word(0x00C2C4)
function p2_last_hit_taken() => word(0x00C472)

function p1_matches_won_row() => byte(0x00C45E)
function p2_matches_won_row() => byte(0x00C460)
function p1_rounds_won_row() => byte(0x00C462)
function p2_rounds_won_row() => byte(0x00C464)

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
    "Kitana": 15,
    "Jade": 16,
    "Mileena": 17,
    "Scorpion": 18,
    "Reptile": 19,
    "Ermac": 20,
    "Classic Sub-Zero": 21,
    "Human Smoke": 22
}

fatalities_name = {
    "Kano": "Eye Laser",
    "Sonya": "Death Orb",
    "Jax": "Slice and Dice",
    "Nightwolf": "Spirit Realm",
    "Sub-Zero": "Overhead Ice Shatter",
    "Stryker": "Explosive",
    "Sindel": "Hair Whip",
    "Sektor": "Compactor",
    "Cyrax": "Helicopter",
    "Kung Lao": "Hat Splice",
    "Kabal": "Air Pump",
    "Sheeva": "Pound",
    "Shang Tsung": "Spike Bed",
    "Liu Kang": "Internal Combustion",
    "Smoke": "Complete Destruction",
    "Kitana": "Fan Decapitation",
    "Jade": "Staff Shaker",
    "Mileena": "Nail Spitter",
    "Scorpion": "Inferno",
    "Reptile": "Tasty Dinner",
    "Ermac": "Telekinetic Operation",
    "Classic Sub-Zero": "Spine Rip",
    "Human Smoke": "Decaptation Uppercut"
}

// Utility Functions
function p1_only() => p1_state() > 0 && p2_state() == 0
function game_beaten() => p2_char() == 0x19 && p1_rounds_wins() == 2 && prev(p1_rounds_wins()) == 1

// ========================
//       Beat the Game
// ========================

for char in characters {
    if (char != "Human Smoke") {
        achievement(char, format("Beat the game using only {0}.", char), 10, 
                trigger = p1_only() &&
                          once(ladder_match() == 0 && game_state() == gs_char_select && p1_char() == characters[char]) &&
                          never(p1_char() != characters[char] && game_state() == gs_char_select && ladder_match () == 0) &&
                          never(p1_char() != characters[char] && game_state() == gs_fighting) &&
                          never(game_state() == gs_diagnostic_menu || game_state() == gs_booting_rom) &&
                          trigger_when(game_beaten()))
    }
}

// Separate achievement for Human Smoke, since he uses a different logic.
achievement("Human Smoke", "Beat the game using only Human Smoke.", 10, 
                trigger = p1_only() &&
                          once(ladder_match() == 0 && game_state() == gs_fighting) &&
                          never(p1_char() != 0x16 && game_state() == gs_fighting) &&
                          never(game_state() == gs_diagnostic_menu || game_state() == gs_booting_rom) &&
                          trigger_when(game_beaten())
               )

// ========================
//          Towers
// ========================

achievement("Novice Ladder", "Finish the Novice tower.", 3, type="win_condition", 
            trigger =   p1_only() &&
                        game_beaten() &&
                        ladder_tower() == tower_novice)

achievement("Warrior Ladder", "Finish the Warrior tower.", 5, type="win_condition",
            trigger =   p1_only() &&
                        game_beaten() &&
                        ladder_tower() == tower_warrior)

achievement("Master Ladder", "Finish the Master I tower.", 5, type="win_condition",
            trigger =   p1_only() &&
                        game_beaten() &&
                        ladder_tower() == tower_master_i)

achievement("Champion Ladder", "Finish the Master II tower.", 10, type="win_condition",
            trigger =   p1_only() &&
                        game_beaten() &&
                        ladder_tower() == tower_master_ii)

// ========================
//        Fatality
// ========================

achievement("Best Way to Finish a Fight", "Perform any finishing move during Arcade mode.", 2,
            trigger =   p1_only() &&
                        unless(game_state() != gs_fighting) &&
                        round_finishing_move() > 0 &&
                        p1_hp() > 0)


achievement("Ran Over", "Perform a Stage Fatality on The Subway during Arcade mode.", 2,
            trigger =   p1_only() &&
                        unless(game_state() != gs_fighting) &&
                        round_finishing_move() == f_pit_fatality &&
                        game_stage() == 0x00 &&
                        p1_hp() > 0)

achievement("Meat Skewer", "Perform a Stage Fatality on Bell Tower during Arcade mode.", 3,
            trigger =   p1_only() &&
                        unless(game_state() != gs_fighting) &&
                        round_finishing_move() == f_pit_fatality &&
                        game_stage() == 0x07 &&
                        p1_hp() > 0)

achievement("Crusher", "Perform a Stage Fatality on The Pit III during Arcade mode.", 3,
            trigger =   p1_only() &&
                        unless(game_state() != gs_fighting) &&
                        round_finishing_move() == f_pit_fatality &&
                        game_stage() == 0x0a &&
                        p1_hp() > 0)

achievement("Welcome to Hell", "Perform a Stage Fatality on Scorpion's Lair during Arcade mode.", 2,
            trigger =   p1_only() &&
                        unless(game_state() != gs_fighting) &&
                        round_finishing_move() == f_pit_fatality &&
                        game_stage() == 0x0c &&
                        p1_hp() > 0)


for char in characters {
    // Ermac, C. Sub-Zero and Human Smoke can't do Animality and Friendship, so create a different logic for them.
    if (char != "Ermac" && char != "Classic Sub-Zero" && char != "Human Smoke") {
        achievement(fatalities_name[char], format("Perform a Fatality, Animality, Babality and Friendship as {0} during an arcade playthrough.", char), 10,
                trigger = unless(!p1_only()) &&
                          unless(p1_char() != characters[char]) &&
                          unless(p1_hp() == 0) &&
                          unless(game_state() != gs_fighting) &&
                          measured(tally(4, once(round_finishing_move() == f_fatality), 
                                            once(round_finishing_move() == f_animality),
                                            once(round_finishing_move() == f_babality),
                                            once(round_finishing_move() == f_friendship))) &&
                          (always_true() || never(ladder_match() == 0 && p1_state() == ps_char_selected)))
    }
}

achievement(fatalities_name["Ermac"], "Perform a Fatality as Ermac during an arcade playthrough.", 2,
                trigger = unless(!p1_only()) &&
                          unless(p1_char() != characters["Ermac"]) &&
                          unless(p1_hp() == 0) &&
                          unless(game_state() != gs_fighting) &&
                          measured(tally(1,  once(round_finishing_move() == f_fatality))) &&
                          (always_true() || never(ladder_match() == 0 && p1_state() == ps_char_selected)))

achievement(fatalities_name["Classic Sub-Zero"], "Perform a Fatality as Classic Sub-Zero during an arcade playthrough.", 2,
                trigger = unless(!p1_only()) &&
                          unless(p1_char() != characters["Classic Sub-Zero"]) &&
                          unless(p1_hp() == 0) &&
                          unless(game_state() != gs_fighting) &&
                          measured(tally(1,  once(round_finishing_move() == f_fatality))) &&
                          (always_true() || never(ladder_match() == 0 && p1_state() == ps_char_selected)))

achievement(fatalities_name["Human Smoke"], "Perform a Fatality and Babality as Human Smoke during an arcade playthrough.", 3,
                trigger = unless(!p1_only()) &&
                          unless(p1_char() != characters["Human Smoke"]) &&
                          unless(p1_hp() == 0) &&
                          unless(game_state() != gs_fighting) &&
                          measured(tally(2,  once(round_finishing_move() == f_fatality),
                                             once(round_finishing_move() == f_babality))) &&
                          (always_true() || never(ladder_match() == 0 && p1_state() == ps_char_selected)))


// ========================
//     Flawless Victory
// ========================
// TODO: Test Achievements
achievement("Flawless Victory", "Get a Flawless Victory during Arcade mode.", 1, 
            trigger =   p1_only() &&
                        unless(p1_hp() < 0xa6) &&
                        p1_rounds_wins() > prev(p1_rounds_wins()))

achievement("Double Flawless Victory", "Get a Double Flawless Victory during Arcade mode.", 4, 
            trigger =   p1_only() &&
                        unless(p1_hp() < 0xa6) &&
                        never(p1_rounds_wins() == 0) &&
                        repeated(2, p1_rounds_wins() > prev(p1_rounds_wins())))

achievement("Flawless Against the Centaurian", "Defeat Motaro with a Flawless Victory on Master II tower.", 10,
            trigger =   p1_only() &&
                        p1_hp() == 0xa6 &&
                        trigger_when(p1_flawless_victory_flag() == 1 && prev(p1_flawless_victory_flag()) == 0) &&
                        ladder_tower() == tower_master_ii &&
                        p2_char() == 0x18)

achievement("Flawless Against the Tyrant", "Defeat Shao Kahn with a Flawless Victory on Master II tower.", 10,
            trigger =   p1_only() &&
                        p1_hp() == 0xa6 &&
                        trigger_when(p1_flawless_victory_flag() == 1 && prev(p1_flawless_victory_flag()) == 0) &&
                        ladder_tower() == tower_master_ii &&
                        p2_char() == 0x19)

// ========================
//          Misc
// ========================
// TODO: Test Achievements

achievement("True Warrior of Earthrealm", "Win 3 battles in a row during Arcade mode.", 5,
            trigger =   unless(!p1_only()) &&
                        measured(repeated(3, p1_rounds_wins() == 2 && prev(p1_rounds_wins()) == 1)) &&
                        (always_true() || never(p1_matches_won_row() == 0) && never(game_state() == gs_char_select)),
            id = 209495)

achievement("True Master of Earthrealm", "Win 7 battles in a row during Arcade mode.", 10,
            trigger =   unless(!p1_only()) &&
                        measured(repeated(7, p1_rounds_wins() == 2 && prev(p1_rounds_wins()) == 1)) &&
                        (always_true() || never(p1_matches_won_row() == 0) && never(game_state() == gs_char_select)),
            id = 209496)

achievement("True Champion of Earthrealm", "Win 11 battles in a row during Arcade mode.", 50,
            trigger =   unless(!p1_only()) &&
                        measured(repeated(11, p1_rounds_wins() == 2 && prev(p1_rounds_wins()) == 1)) &&
                        (always_true() || never(p1_matches_won_row() == 0) && never(game_state() == gs_char_select)),
            id = 209497)


achievement("Penacho Miller", "Enter the realm of Rellim Ohcanep!", 3,
            trigger =   game_state() == gs_rellim_ohcanep &&
                        prev(game_state()) != gs_rellim_ohcanep)

achievement("Boon Tobias", "Defeat Noob Saibot.", 25,
            trigger =   p1_only() &&
                        never(p2_char() != 0x17) &&
                        once(match_current_round() == 1 && game_state() == gs_round_intro) &&
                        prev(p1_rounds_wins()) == 1 &&
                        p1_rounds_wins() == 2,
            id = 209499)

achievement("UMK3 Mega Endurance", "Go through and defeat all opponents from the Mega Endurance Kombat.", 50,
            trigger =   never(!p1_only()) &&
                        once(p2_char() == 0x17) &&
                        once(p2_char() == characters["Classic Sub-Zero"]) &&
                        once(p2_char() == characters["Human Smoke"]) &&
                        once(p2_char() == characters["Ermac"]) &&
                        once(p2_char() == characters["Mileena"]) &&
                        never(match_current_round() < prev(match_current_round())) &&
                        p1_rounds_wins() == 2)
