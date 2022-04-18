// ~Hack~ Ultimate Mortal Kombat 3 Plus
// #ID = 16569

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
function game_modifier() => dword(0x00c5a0)
function ladder_match() => byte(0x00C45A)
function ladder_tower() => byte(0xc5f6)
         tower_novice = 0
         tower_warrior = 1
         tower_master_i = 2
         tower_master_ii = 3

function round_finishing_move() => byte(0x00C426)
function round_finishing_move_ending() => byte(0x00c4e6)
         f_fatality = 0x01
         f_pit_fatality = 0x02
         f_animality = 0x03
         f_friendship = 0x04
         f_babality = 0x05
         f_brutality = 0x06

function round_finishing_move_announce() => byte(0x00C4E6)
function round_move_allowed() => byte(0x00C42A)
function round_victory_state() => byte(0x00C454)
function match_kombat_kode() => word(0x00c55e)
function match_current_round() => byte(0x00C452)

function p1_state() => byte(0x00C134)
function p2_state() => byte(0x00c2aa)
         ps_inactive = 0
         ps_fighting = 1
         ps_char_selecting = 3
         ps_char_selected = 4

function p1_char() => word(0x00c146)
function p1_color() => word(0x0403d8)
function p1_super_sub_zero_transformed() => word(0x0402e6)
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
   "Human Smoke": 22,
   "Noob Saibot": 23,
   "Motaro": 24,
   "Shao Kahn": 25,
   "Rain": 26,
   "Chameleon": 27,
   "Triborg": 28,
   "Khameleon": 29
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
    "Classic Sub-Zero": "Torso Rip",
    "Human Smoke": "Decaptation Uppercut"
}

// Utility Functions
function p1_only() => p1_state() > 0 && p2_state() == 0
function p1_human() => p1_state() > 0
function match_finishing_move_darkening() => byte(0x00c442) == 1
function no_kombat_code() => match_kombat_kode() == 0xFFFF
function game_beaten() {
    return  (ladder_tower() == tower_novice && ladder_match() == 7 && p1_rounds_wins() == 1 && p2_hp() == 0 && prev(p2_hp()) > 0) || 
            (ladder_tower() == tower_warrior && ladder_match() == 8 && p1_rounds_wins() == 1 && p2_hp() == 0 && prev(p2_hp()) > 0) || 
            (ladder_tower() == tower_master_i && ladder_match() == 9 && p1_rounds_wins() == 1 && p2_hp() == 0 && prev(p2_hp()) > 0) || 
            (ladder_tower() == tower_master_ii && ladder_match() == 10 && p1_rounds_wins() == 1 && p2_hp() == 0 && prev(p2_hp()) > 0)
} 

// ========================
//       Beat the Game
// ========================

function achiev_beat_game_char(char, points, id_cheevo) {
    achievement(char, format("Beat the game using only {0} (No Kombat Kodes).", char), points, 
                trigger = p1_only() &&
                          never(game_state() == gs_fighting && !no_kombat_code()) &&
                          once(ladder_match() == 0 && game_state() == gs_fighting) &&
                          never(p1_char() != characters[char] && game_state() == gs_fighting) &&
                          never(game_state() == gs_diagnostic_menu || game_state() == gs_booting_rom) &&
                          trigger_when(game_beaten()),
                id = id_cheevo
                )
}

achiev_beat_game_char("Rain", 10, 210594)
achiev_beat_game_char("Noob Saibot", 10, 210595)
achiev_beat_game_char("Shao Kahn", 5, 210596)
achiev_beat_game_char("Chameleon", 10, 210597)
achiev_beat_game_char("Khameleon", 10, 0)
achiev_beat_game_char("Triborg", 10, 210598)
        

// Separate achievement for Super Sub-Zero, since he uses a different logic.
achievement("Super Sub-Zero", "Beat the game using only Super Sub-Zero (No Kombat Kodes).", 10, 
                trigger = p1_only() &&
                          never(game_state() == gs_fighting && !no_kombat_code()) &&
                          once (ladder_match() == 0 && 
                                game_state() == gs_fighting && 
                                p1_char() == characters["Classic Sub-Zero"] &&
                                p1_super_sub_zero_transformed() == 1) &&
                          never(p1_char() != characters["Classic Sub-Zero"] && game_state() == gs_fighting || p1_super_sub_zero_transformed() != 1 && game_state() == gs_fighting) &&
                          never(game_state() == gs_diagnostic_menu || game_state() == gs_booting_rom) &&
                          trigger_when(game_beaten()),
                id = 210599
                )

// ========================
//          Towers
// ========================

achievement("Novice Tower", "Finish the Novice tower (No Kombat Kodes).", 3, 
            trigger =   p1_only() &&
                        never(game_state() == gs_fighting && !no_kombat_code()) &&
                        once(ladder_match() == 0 && game_state() == gs_fighting) &&
                        trigger_when(game_beaten()) &&
                        ladder_tower() == tower_novice,
            id = 210600)

achievement("Warrior Tower", "Finish the Warrior tower (No Kombat Kodes).", 5, 
            trigger =   p1_only() &&
                        never(game_state() == gs_fighting && !no_kombat_code()) &&
                        once(ladder_match() == 0 && game_state() == gs_fighting) &&
                        trigger_when(game_beaten()) &&
                        ladder_tower() == tower_warrior,
            id = 210601)

achievement("Master I Tower", "Finish the Master I tower (No Kombat Kodes).", 10, 
            trigger =   p1_only() &&
                        never(game_state() == gs_fighting && !no_kombat_code()) &&
                        once(ladder_match() == 0 && game_state() == gs_fighting) &&
                        trigger_when(game_beaten()) &&
                        ladder_tower() == tower_master_i,
            id = 210602)

achievement("Master II Tower", "Finish the Master II tower on Extreme difficulty (No Kombat Kodes).", 25, 
            trigger =   p1_only() &&
                        never(game_state() == gs_fighting && !no_kombat_code()) &&
                        once(ladder_match() == 0 && game_state() == gs_post_char_select && game_cpu_diff() == 9) &&
                        never(game_cpu_diff() < 9 && game_state() == gs_fighting) &&
                        ladder_tower() == tower_master_ii &&
                        trigger_when(game_beaten()),
            id = 210603)

// ========================
//        Fatality
// ========================

achievement("Best Way to Finish a Fight", "Perform any finishing move.", 2,
            trigger =   p1_human() &&
                        unless(game_state() != gs_fighting) &&
                        round_finishing_move_ending() > 0 &&
                        p1_hp() > 0)


achievement("Ran Over", "Perform a Stage Fatality on The Subway.", 2,
            trigger =   p1_human() &&
                        unless(game_state() != gs_fighting) &&
                        round_finishing_move() == f_pit_fatality &&
                        game_stage() == 0x00 &&
                        p1_hp() > 0)

achievement("Meat Skewer", "Perform a Stage Fatality on Bell Tower.", 3,
            trigger =   p1_human() &&
                        unless(game_state() != gs_fighting) &&
                        round_finishing_move() == f_pit_fatality &&
                        game_stage() == 0x07 &&
                        p1_hp() > 0)

achievement("Crusher", "Perform a Stage Fatality on The Pit III.", 3,
            trigger =   p1_human() &&
                        unless(game_state() != gs_fighting) &&
                        round_finishing_move() == f_pit_fatality &&
                        game_stage() == 0x0a &&
                        p1_hp() > 0)

achievement("Welcome to Hell", "Perform a Stage Fatality on Scorpion's Lair.", 2,
            trigger =   p1_human() &&
                        unless(game_state() != gs_fighting) &&
                        round_finishing_move() == f_pit_fatality &&
                        game_stage() == 0x0c &&
                        p1_hp() > 0)


achievement("Roundhouse Explosion", "Rain: Perform a Fatality, Babality and Friendship during an arcade playthrough.", 10,
            trigger =   unless(!p1_only()) &&
                        no_kombat_code() &&
                        unless(p1_char() != characters["Rain"]) &&
                        unless(p1_hp() == 0) &&
                        unless(game_state() != gs_fighting) &&
                        measured(tally(3, once(round_finishing_move() == f_fatality),
                                          once(round_finishing_move() == f_babality),
                                          once(round_finishing_move() == f_friendship))) &&
                        (always_true() || never(ladder_match() == 0 && p1_state() == ps_char_selected))
                )  

achievement("Clone Throw", "Noob Saibot: Perform a Fatality and Babality during an arcade playthrough.", 10,
            trigger =   unless(!p1_only()) &&
                        no_kombat_code() &&
                        unless(p1_char() != characters["Noob Saibot"]) &&
                        unless(p1_hp() == 0) &&
                        unless(game_state() != gs_fighting) &&
                        measured(tally(2, once(round_finishing_move() == f_fatality),
                                          once(round_finishing_move() == f_babality))) &&
                        (always_true() || never(ladder_match() == 0 && p1_state() == ps_char_selected))
            )

achievement("Ice Spike", "Super Sub-Zero: Perform a Fatality, Babality and Friendship during an arcade playthrough.", 10,
            trigger =   unless(!p1_only()) &&
                        no_kombat_code() &&
                        unless(p1_char() != characters["Classic Sub-Zero"] || p1_super_sub_zero_transformed() != 1) &&
                        unless(p1_hp() == 0) &&
                        unless(game_state() != gs_fighting) &&
                        measured(tally(3, once(round_finishing_move() == f_fatality),
                                          once(round_finishing_move() == f_babality),
                                          once(round_finishing_move() == f_friendship))) &&
                        (always_true() || never(ladder_match() == 0 && p1_state() == ps_char_selected))
                )

for char in characters {
    if (char != "Chameleon" && char != "Khameleon" && char != "Shao Kahn" && char != "Motaro" && char != "Triborg")
    achievement(format("MKX Brutality - {0}", char), format("{0}: Perform a MKX Brutality (Arcade Mode).", char), 10,
                trigger = unless(!p1_only()) &&
                          unless(p1_char() != characters[char]) &&
                          unless(p1_hp() == 0) &&
                          unless(game_state() != gs_fighting) &&
                          !match_finishing_move_darkening() &&
                          round_finishing_move_ending() == f_brutality
                )
}


// ========================
//     Flawless Victory
// ========================

achievement("Flawless Victory", "Get a Flawless Victory (Arcade Mode).", 1, 
            trigger =   p1_only() &&
                        no_kombat_code() &&
                        unless(p1_hp() < 0xa6) &&
                        p1_rounds_wins() > prev(p1_rounds_wins()))

achievement("Double Flawless Victory", "Get a Double Flawless Victory (Arcade Mode).", 4, 
            trigger =   p1_only() &&
                        no_kombat_code() &&
                        unless(p1_hp() < 0xa6) &&
                        never(p1_rounds_wins() == 0) &&
                        repeated(2, p1_rounds_wins() > prev(p1_rounds_wins())))

// ========================
//          Misc
// ========================

achievement("We're Out of Ninja Sprites, What Do We Do?!", "Play as Noob MK3.", 2,
            trigger =   p1_human() &&
                        game_state() == gs_round_intro &&
                        p1_char() == characters["Kano"] &&
                        p1_color() == 3)

achievement("Super Brutality", "Perform a Super Uppercut at the end of a Brutality.", 2,
            trigger =   unless(!p1_human()) &&
                        unless(p1_hp() == 0) &&
                        unless(game_state() != gs_fighting) &&
                        match_finishing_move_darkening() &&
                        round_finishing_move_ending() == f_brutality &&
                        match_kombat_kode() == 0x38 && prev(match_kombat_kode()) != 0x38)

achievement("Funny Blood LMAO XD", "Kolorful Kombat.", 1, 
            trigger =   game_state() == gs_round_intro &&
                        (match_kombat_kode() == 0x3a ||
                        match_kombat_kode() == 0x3c))

achievement("Such Kombat. Many Blood. Much Throw. Wow.", "Doge Kombat.", 2, 
            trigger =   game_state() == gs_round_intro &&
                        match_kombat_kode() == 0x3d)

achievement("Pedrinho Matador", "Perform a Fart-ality.", 3,
            trigger = p1_human() &&
                      p1_hp() > 0 &&
                      p1_char() == characters["Stryker"] &&
                      game_state() == gs_round_end &&
                      game_modifier() == 0x69420) 

achievement("We Are Many", "Defeat Chameleon (No Kombat Kodes).", 25,
            trigger =   p1_only() &&
                        no_kombat_code() &&
                        never(p2_char() != characters["Chameleon"]) &&
                        once(match_current_round() == 1 && game_state() == gs_round_intro) &&
                        prev(p1_rounds_wins()) == 1 && p1_rounds_wins() == 2)

achievement("Secret Battle", "Defeat Khameleon (No Kombat Kodes).", 25,
            trigger =   p1_only() &&
                        no_kombat_code() &&
                        never(p2_char() != characters["Khameleon"]) &&
                        once(match_current_round() == 1 && game_state() == gs_round_intro) &&
                        prev(p1_rounds_wins()) == 1 && p1_rounds_wins() == 2)

achievement("Boss Endurance", "Beat the Boss Endurance (No Kombat Kodes).", 25,
            trigger =   never(!p1_only()) &&
                        no_kombat_code() &&
                        once(p2_char() == characters["Motaro"] && game_state() == gs_fighting) &&
                        once(p2_char() == characters["Shao Kahn"] && game_state() == gs_fighting) &&
                        never(match_current_round() < prev(match_current_round())) &&
                        p1_rounds_wins() == 2,
            id = 210646)

achievement("Plus Ultimate Endurance", "Beat the Plus Ultimate Endurance (No Kombat Kodes).", 50,
            trigger =   never(!p1_only()) &&
                        no_kombat_code() &&
                        once(p2_char() == characters["Chameleon"]) &&
                        once(p2_char() == characters["Noob Saibot"]) &&
                        once(p2_char() == characters["Rain"]) &&
                        once(p2_char() == characters["Mileena"] || p2_char() == characters["Jade"] || p2_char() == characters["Kitana"]) &&
                        once(p2_char() == characters["Cyrax"] || p2_char() == characters["Smoke"] || p2_char() == characters["Sektor"]) &&
                        never(match_current_round() < prev(match_current_round())) &&
                        p1_rounds_wins() == 2)
