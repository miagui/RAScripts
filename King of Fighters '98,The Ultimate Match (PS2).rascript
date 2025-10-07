// The King of Fighters '98: Ultimate Match
// #ID = 20604

// Settings

function settings_random_select() => byte(0x52B8E1)
function settings_cpu_level() => byte(0x52B8E2)
function settings_play_time() => byte(0x52B8E3)
function settings_single_round() => byte(0x52B8E4)
function settings_defense_level_1p() => byte(0x52B8E5)
function settings_defense_level_2p() => byte(0x52B8E6)
function settings_power_gauge_1p() => byte(0x52B8E7)
function settings_power_gauge_2p() => byte(0x52B8E8)

function default_settings()  {
    return(
        settings_cpu_level() >= 3 &&
        settings_play_time() == 2 &&
        settings_single_round() == 1 &&
        settings_defense_level_1p() == 3 &&
        settings_defense_level_2p() == 3 &&
        settings_power_gauge_1p() == 0 &&
        settings_power_gauge_2p() == 0
    )
}

function default_settings_except_gauge()  {
    return(
        settings_cpu_level() >= 3 &&
        settings_play_time() == 2 &&
        settings_single_round() == 1 &&
        settings_defense_level_1p() == 3 &&
        settings_defense_level_2p() == 3
    )
}

// Game

function game_mode() => byte(0x53F300)
         MODE_ARCADE_PLAY = 0x00
         MODE_ARCADE_PLAY_2P_VS = 0x01
         MODE_ARCADE_PLAY_CPU_VS = 0x02
         MODE_SINGLE_PLAY = 0x03
         MODE_SINGLE_PLAY_2P_VS = 0x04
         MODE_SINGLE_PLAY_CPU_VS = 0x05
         MODE_ENDLESS = 0x06
         MODE_PRACTICE = 0x07
         MODE_GALLERY = 0x08
         MODE_CHALLENGE = 0x09
         MODE_GAME_OPTIONS = 0x0A
         MODE_NEOGEO_MODE = 0x0C

function game_location() => dword(0x00505610)
function game_fighting() => bit0(0x53F330)


function game_stage() => byte(0x00504ef0)

// 0x82cc = Mr Neo Geo sprite triggered
function stage_mrneogeo_sprite_id_2d() => word(0x00509a38)
function stage_mrneogeo_sprite_id_3d() => word(0x00505838)

function round_state_bitflags() => byte(0x504E30)
function round_started() => bit6(0x504E30)
function round_winner_announcement() => bit0(0x504E30)
function round_timer() => byte(0x504E68)
function round_number() => byte(0x504EB8)
function fight_state() => byte(0x504F48)

function endless_wins() => byte(0x00500f00)

function players_active() => byte(0x00504eb0)

// P1

function p1_active_state() => bit0(0x00504eb0)
function p1_team() => byte(0x504DF1)
function p1_character_1() => byte(0x504DF4)
function p1_character_2() => byte(0x504DF5)
function p1_character_3() => byte(0x504DF6)
function p1_alt_character_team_bitflags() => byte(0x504E00)

function p1_current_character() => byte(0x50F280)
function p1_alt_character_active() => bit0(0x50f3e6)

function p1_hp() => word(0x50F348)
function p1_rounds_won() => byte(0x504DFD)
function p1_moves() => word(0x50F282)
function p1_special_move_id() => byte(0x50f2ff)
function p1_projectile_move_id() => word(0x0050f2e6)
function p1_hit_combo() => byte(0x0050f5c0)
function p1_action_flags_1() => byte(0x50F2F1)
function p1_action_flags_2() => byte(0x50F2F2)

function p1_desperation_move() => bit0(0x50F2F3)
function p1_max_dm() => bit0(0x50F2F5)
function p1_special_move_flag() => bit3(0x50f2f2)
function p1_being_attacked() => bit5(0x50f2f2)
function p1_throwing() => bit6(0x50f2f2)

function p1_macro_active() => word(0x53E930)
function p1_macro_timer() => word(0x53E932)

// P2

function p2_active_state() => bit1(0x00504eb0)

function p2_current_character() => byte(0x50F480)
function p2_alt_character_active() => bit0(0x0050f5e6)

function p2_alt_character_team_bitflags() => byte(0x504DE0)

function p2_hp() => word(0x50F548)
function p2_rounds_won() => byte(0x504DDD)

function p2_moves() => word(0x0050f482)

characters = {
    "Kyo": 0x00,
    "Benimaru": 0x01,
    "Daimon": 0x02,
    "Terry": 0x03,
    "Andy": 0x04,
    "Joe": 0x05,
    "Ryo": 0x06,
    "Robert": 0x07,
    "Yuri": 0x08,
    "Leona": 0x09,
    "Ralf": 0x0A,
    "Clark": 0x0B,
    "Athena": 0x0C,
    "Kensou": 0x0D,
    "Chin": 0x0E,
    "Chizuru": 0x0F,
    "Mai": 0x10,
    "King": 0x11,
    "Kim": 0x12,
    "Chang": 0x13,
    "Choi": 0x14,
    "Yashiro": 0x15,
    "Shermie": 0x16,
    "Chris": 0x17,
    "Yamazaki": 0x18,
    "Blue Mary": 0x19,
    "Billy": 0x1A,
    "Iori": 0x1B,
    "Mature": 0x1C,
    "Vice": 0x1D,
    "Heidern": 0x1E,
    "Takuma": 0x1F,
    "Saisyu": 0x20,
    "Heavy-D!": 0x21,
    "Lucky": 0x22,
    "Brian": 0x23,
    "Rugal": 0x24,
    "Shingo": 0x25,
    "Kasumi": 0x26,
    "Geese": 0x27,
    "Krauser": 0x28,
    "Mr.Big": 0x29,
    "Goenitz": 0x2A,
    "Eiji": 0x2E,
    "Orochi": 0x2D,
    "Orochi Leona": 0x2c,
    "Orochi Iori": 0x2b
}



// Challenge

function challenge_mode_30bytes_array() => byte(0x5139E0)
function challenge_mode_tries() => byte(0x513A08)
function challenge_message() => byte(0x1C0FC8B)
function challenge_current() => byte(0x1C12430)


// Utility Functions

function p1_only() => p1_active_state() > 0 && never(p2_active_state() > 0)
function no_practice_mode() => never(game_mode() == MODE_PRACTICE)
function no_neogeo_mode() => never(game_mode() == MODE_NEOGEO_MODE)


// Only useful for situations with pause lock.
function global_resetif_notplaying() {
    return(
        (always_false()) ||
        (never(game_location() == 0x43e6d0))
    )
}

function global_resetif_not_p1_only() {
    return(
        p1_active_state() > 0 &&
        (always_false()) ||
        (never(p2_active_state() > 0))
    )
}

function global_resetif_practice_mode() {
    return(
        (always_false()) ||
        (never(game_mode() == MODE_PRACTICE))
    )
}

function global_resetif_neogeo_mode() {
    return(
        (always_false()) ||
        (never(game_mode() == MODE_NEOGEO_MODE))
    )
}

function matchup_p1_vs_p2(char_p1, char_p2) => p1_current_character() == characters[char_p1] && p2_current_character() == characters[char_p2]

// Checks range of moves
function p1_move_range_used(start, end) => p1_moves() >= start && p1_moves() <= end

// Checks just if the move == X, for dealing with regular and max versions of DM.
function p1_move_double_check(move1, move2) => __ornext(p1_moves() == move1 || p1_moves() == move2) && p1_moves() != prev(p1_moves())

function p1_won_a_round() => p1_rounds_won() > prev(p1_rounds_won())
function p1_hit_a_dm() => p1_desperation_move() == 1 && (p1_hit_combo() > prev(p1_hit_combo()) || (p2_hp() < prev(p2_hp()) && p1_throwing() == 1) || p1_won_a_round())

// =========================================
//             Desperation Moves              
// =========================================


function dm_moves_handler(moves_array) {
    logic_hits = []
    for move in moves_array {
        array_push(logic_hits, once(p1_move_range_used(move[0], move[1]) && p1_hit_a_dm()))
    }
    return measured(tally(length(moves_array), logic_hits))
}

dm_moves_dict = {
    "Kyo": ["Serpent Wave", // title
           [                // array
                [0xb8, 0xc6],
                [0xca, 0xdb]
           ],
           3],      // points
    "Benimaru": ["Heaven Blast Flash", 
           [
                [0x8b, 0x8f],
                [0xb4, 0xbd],
                [0x1f0, 0x1f6]
           ],
           5],
    "Terry": ["Power Geyser", 
           [
                [0xa5, 0xaa],
                [0xb0, 0xbe]
           ],
           3],
    "Andy": ["Super Sonic Swirl", 
           [
                [0xa8, 0xb0],
                [0xb2, 0xbf]
           ],
           3],
    "Joe": ["Screw Upper", 
           [
                [0xb4, 0xbd],
                [0xc2, 0xd2]
           ],
           3],
    "Ryo": ["Heaven Glaze Punch", 
           [
                [0xb0, 0xc7],
                [0xa8, 0xac],
                [0xc8, 0xca]
           ],
           5],
    "Robert": ["Furious Spectre Kick", 
           [
                [0xb0, 0xc7],
                [0xa8, 0xac],
                [0xc8, 0xdc]
           ],
           5],
    "Yuri": ["Flying Phoenix Kick", 
           [
                [0xd0, 0xe4],
                [0xe5, 0xe9],
                [0xb0, 0xcf]
           ],
           5],
    // "Leona": ["Revolver Spark", 
    //        [
    //             [0xde, 0xdf],
    //             [0xc4, 0xd6],
    //             [0xb0, 0xc1]
    //        ],
    //        5],
    "Ralf": ["Super Vulcan Punch", 
           [
                [0xa0, 0xac],
                [0xad, 0xc2],
                [0xc3, 0xc8]
           ],
           5],
    "Clark": ["Napalm Strike", 
           [
                [0xb0, 0xb8],
                [0x1e9, 0x1fa],
                [0xc0, 0xcf]
           ],
           5],
    "Chin": ["Thunder Blast", 
           [
                [0xa8, 0xb1],
                [0xb5, 0xc0],
                [0xe0, 0xeb],
                [0xf0, 0xfa]
           ],
           5],
    "Mai": ["Super Deadly Ninja Bees", 
           [
                [0xa8, 0xb0],
                [0xb1, 0xbb],
                [0xbc, 0xc0]
           ],
           5],
    "King": ["Illusion Dance", 
           [
                [0xa8, 0xba],
                [0xbc, 0xcc]
           ],
           3],
    "Kim": ["Heavenly Phoenix Kick", 
           [
                [0xb1, 0xc4],
                [0xc8, 0xd5]
           ],
           3],
    "Chang": ["Wild Ball Attack", 
           [
                [0xa7, 0xbf],
                [0x98, 0xa5]
           ],
           3],
    "Choi": ["Phoenix Flattener", 
           [
                [0xb7, 0xc6],
                [0xa8, 0xb2]
           ],
           3],
    "Yashiro": ["Million Bash Stream", 
           [
                [0xaa, 0xb7],
                [0xa0, 0xa9]
           ],
           3],
    "Shermie": ["Shermie Carnival", 
           [
                [0xa7, 0xb1],
                [0xa0, 0xa6]
           ],
           3],
    "Chris": ["Twister Drive", 
           [
                [0xaa, 0xb5],
                [0xa0, 0xa7]
           ],
           3],
    "Yamazaki": ["Guillotine", 
           [
                [0xa8, 0xb9],
                [0xbb, 0xc2]
           ],
           3],
    "Blue Mary": ["M. Typhoon", 
           [
                [0xb0, 0xb5],
                [0xd6, 0xea],
                [0xb6, 0xd0]
           ],
           5],
    "Billy": ["Super Fire Wheel", 
           [
                [0xa0, 0xac],
                [0xb2, 0xbb]
           ],
           3],
    "Heidern": ["Final Bringer", 
           [
                [0xad, 0xc3],
                [0xa0, 0xac]
           ],
           3],
    "Takuma": ["Neo Demon-God Attack", 
           [
                [0xd0, 0xd4],
                [0xb0, 0xc1],
                [0xda, 0xe1]
           ],
           5],
    "Saisyu": ["Annihilating Slicer", 
           [
                [0xa0, 0xae],
                [0xb1, 0xbc]
           ],
           3],
    "Lucky": ["Lucky Driver", 
           [
                [0xb3, 0xb6],
                [0xa0, 0xb0]
           ],
           3],
    "Brian": ["American Super NOVA", 
           [
                [0xd0, 0xd5],
                [0xb8, 0xcd],
                [0xf0, 0xf7]
           ],
           5],
    "Eiji": ["Mantis Punch", 
           [
                [0xda, 0xe5],
                [0xb6, 0xbb]
           ],
           3],
    "Shingo": ["Burning Shingo", 
           [
                [0xac, 0xb4],
                [0xa0, 0xa8]
           ],
           3],
    "Rugal": ["Dead End Screamer", 
           [
                [0xc2, 0xd2],
                [0xb0, 0xc0]
           ],
           3],
    "Goenitz": ["Mizuchi", 
           [
                [0x91, 0x96],
                [0x9d, 0xa7]
           ],
           3],
    "Mr.Big": ["Blaster Wave", 
           [
                [0x98, 0x9a],
                [0xe8, 0xf6]
           ],
           3],
    "Orochi Leona": ["V-Slasher", 
           [
                [0xa2, 0xaa],
                [0xb1, 0xbf],
                [0xc4, 0xd5]
           ],
           5]
}


dm_moves_ex_dict = {
    "Andy": ["EX", // alt name
            "Ultimate Sonic Swirl", // title
           [                // array
                [0xe3, 0xe8],
                [0x1ec, 0x1f4]
           ],
           3],      // points
    "Joe": ["EX", 
            "Thunder Fire",
           [
                [0xb4, 0xbd],
                [0xd7, 0xf5]
           ],
           3],
    "Ryo": ["EX", 
            "EX Ryoku Ranbu",
           [
                [0xa8, 0xac],
                [0xb0, 0xc0]
           ],
           3],
    "Robert": ["EX", 
            "EX Haoh Sho Koh Ken",
           [
                [0xa8, 0xac],
                [0xb0, 0xc6]
           ],
           3],
    "Yuri": ["EX", 
            "Core Max! Super Upper",
           [
                [0xe5, 0xe9],
                [0x1f0, 0x1fe],
                [0xd0, 0xe3]
           ],
           5],
    "Mai": ["EX", 
            "Flower Storm",
           [
                [0x1f6, 0x1ff],
                [0x1e7, 0x1f4]
           ],
           3],
    "King": ["EX", 
            "Double Venom Strike",
           [
                [0xe8, 0xf7],
                [0x1e0, 0x1e2]
           ],
           3],
    "Yashiro": ["Orochi", 
            "Ankoku Jigoku Gokuraku Otoshi",
           [
                [0xcf, 0xd9],
                [0xc0, 0xc9],
                [0xe3, 0xe9]
           ],
           5],
    "Shermie": ["Orochi", 
            "Ankoku Raikouken",
           [
                [0xb4, 0xbb],
                [0x1f5, 0x1f9]
           ],
           3],
    "Chris": ["Orochi", 
            "Ankoku Orochinagi",
           [
                [0x1f5, 0x1fd],
                [0xd0, 0xde]
           ],
           3],
    "Blue Mary": ["EX", 
            "M. Triple Ecstasy",
           [
                [0xcc, 0xdf],
                [0xe0, 0xe5]
           ],
           5],
    "Billy": ["EX", 
            "Crimson Lotus Crush",
           [
                [0x1f4, 0x1fc],
                [0xa0, 0xab],
                [0x1e5, 0x1ef]
           ],
           5],
    "Rugal": ["Omega", 
            "Rugal Execution",
           [
                [0xc4, 0xcc],
                [0xd4, 0xe0],
                [0xe0, 0xf0]
           ],
           5],
    "Geese": ["EX", 
            "Ra Sho Mon",
           [
                [0xda, 0xe4],
                [0x1dd, 0x1e9]
           ],
           5]
}

function achiev_regular_dm_hit(char) {
    achievement(dm_moves_dict[char][0], format("Hit your opponent with all Desperation Moves as {0} against the CPU.", char), dm_moves_dict[char][2],
            trigger =   global_resetif_not_p1_only() &&
                        global_resetif_notplaying() &&
                        global_resetif_neogeo_mode() &&
                        global_resetif_practice_mode() &&
                        unless(p1_current_character() != characters[char]) &&
                        unless(p1_alt_character_active() == 1) &&
                        dm_moves_handler(dm_moves_dict[char][1])
            )
}

function achiev_exchar_dm_hit(char) {
    achievement(dm_moves_ex_dict[char][1], format("Hit your opponent with all Desperation Moves as {0} {1} against the CPU.", dm_moves_ex_dict[char][0], char), dm_moves_ex_dict[char][3],
            trigger =   global_resetif_not_p1_only() &&
                        global_resetif_notplaying() &&
                        global_resetif_neogeo_mode() &&
                        global_resetif_practice_mode() &&
                        unless(p1_current_character() != characters[char]) &&
                        unless(p1_alt_character_active() == 0) &&
                        dm_moves_handler(dm_moves_ex_dict[char][2])
            )
}

for char in dm_moves_dict achiev_regular_dm_hit(char)
for char in dm_moves_ex_dict achiev_exchar_dm_hit(char)

// Characters exception

// NORMAL CHARACTERS
achievement("Heaven-to-Hell Drop", "Hit your opponent with all Desperation Moves as Daimon against the CPU.", 5,
            trigger =   global_resetif_not_p1_only() &&
                        global_resetif_notplaying() &&
                        global_resetif_neogeo_mode() &&
                        global_resetif_practice_mode() &&
                        unless(p1_current_character() != characters["Daimon"]) &&
                        unless(p1_alt_character_active() == 1) &&
                        measured(
                            tally(2, 
                                once(p1_move_double_check(0xb1, 0xb9)),
                                once(p1_move_double_check(0x9d, 0xa2))
                                )
                        )
            )

achievement("Revolver Spark", "Hit your opponent with all Desperation Moves as Leona against the CPU.", 5,
            trigger =   global_resetif_not_p1_only() &&
                        global_resetif_notplaying() &&
                        global_resetif_neogeo_mode() &&
                        global_resetif_practice_mode() &&
                        unless(p1_current_character() != characters["Leona"]) &&
                        unless(p1_alt_character_active() == 1) &&
                        measured(
                            tally(3, 
                                once(p1_move_range_used(0xa0, 0xae) && __ornext(p2_hp() < prev(p2_hp()) || p1_won_a_round()) ),
                                once(p1_move_range_used(0xc4, 0xd6) && p1_hit_a_dm()),
                                once(p1_move_range_used(0xb0, 0xc1) && p1_hit_a_dm())
                            )
                        )
            )

achievement("Psycho Ball Revolution", "Hit your opponent with both Shining Crystal Bit and Phoenix Arrow, and use Psycho Ball Revolution as Athena against the CPU.", 5,
            trigger =   global_resetif_not_p1_only() &&
                        global_resetif_notplaying() &&
                        global_resetif_neogeo_mode() &&
                        global_resetif_practice_mode() &&
                        unless(p1_current_character() != characters["Athena"]) &&
                        unless(p1_alt_character_active() == 1) &&
                        measured(
                            tally(3, 
                                once(p1_move_range_used(0xa3, 0xcc) && p1_hit_a_dm()),
                                once(p1_move_range_used(0xce, 0xd7) && p1_hit_a_dm()),
                                once(p1_move_range_used(0x1f0, 0x1f4))
                            )
                        )
            )
            
// Achievement order: after Athena
achievement("Dragon God Kick", "Hit your opponent with all Desperation Moves, and use Eat Meat Duplings as Kensou against the CPU.", 5,
            trigger =   global_resetif_not_p1_only() &&
                        global_resetif_notplaying() &&
                        global_resetif_neogeo_mode() &&
                        global_resetif_practice_mode() &&
                        unless(p1_current_character() != characters["Kensou"]) &&
                        unless(p1_alt_character_active() == 1) &&
                        measured(
                            tally(3, 
                                once(p1_move_range_used(0xa0, 0xb8) && p1_hit_a_dm()),
                                once(p1_move_range_used(0xb9, 0xbe) && p1_hit_a_dm()),
                                once(p1_move_range_used(0xc5, 0xc6))
                            )
                        )
            )



achievement("Rules of Zen", "Hit your opponent with Rules of Zen and use Rustling Wind Bruiser as Chizuru against the CPU.", 3,
            trigger =   global_resetif_not_p1_only() &&
                        global_resetif_notplaying() &&
                        global_resetif_neogeo_mode() &&
                        global_resetif_practice_mode() &&
                        unless(p1_current_character() != characters["Chizuru"]) &&
                        unless(p1_alt_character_active() == 1) &&
                        measured(
                            tally(2, 
                                once(p1_move_range_used(0xb2, 0xb8) && p1_hit_a_dm()),
                                once(p1_move_range_used(0xba, 0xc2))
                            )
                        )
            )

achievement("Maiden Masher", "Hit your opponent with Maiden Masher and use \"One-for-the-Road\" Blast as Iori against the CPU.", 3,
            trigger =   global_resetif_not_p1_only() &&
                        global_resetif_notplaying() &&
                        global_resetif_neogeo_mode() &&
                        global_resetif_practice_mode() &&
                        unless(p1_current_character() != characters["Iori"]) &&
                        unless(p1_alt_character_active() == 1) &&
                        measured(
                            tally(2, 
                                once(p1_move_range_used(0xa0, 0xb0) && p1_hit_a_dm()),
                                once(p1_move_range_used(0xc0, 0xcc)) // blast
                            )
                        )
            )

achievement("Nocturnal Lights", "Hit your opponent with all Desperation Moves as Mature against the CPU.", 4,
            trigger =   global_resetif_not_p1_only() &&
                        global_resetif_notplaying() &&
                        global_resetif_neogeo_mode() &&
                        global_resetif_practice_mode() &&
                        unless(p1_current_character() != characters["Mature"]) &&
                        unless(p1_alt_character_active() == 1) &&
                        measured(
                            tally(2, 
                                once(p1_move_range_used(0xb9, 0xc9) && p1_hit_a_dm()),
                                once(p1_moves() == 0xb7 && prev(p1_moves()) != 0xb7)
                            )
                        )
            )

achievement("Dying Conception", "Hit your opponent with all Desperation Moves as Vice against the CPU.", 5,
            trigger =   global_resetif_not_p1_only() &&
                        global_resetif_notplaying() &&
                        global_resetif_neogeo_mode() &&
                        global_resetif_practice_mode() &&
                        unless(p1_current_character() != characters["Vice"]) &&
                        unless(p1_alt_character_active() == 1) &&
                        measured(
                            tally(3, 
                                once(p1_move_range_used(0xc9, 0xda) && p1_hit_a_dm()),
                                once(p1_move_double_check(0xb6, 0xbe)), // withering force
                                once(p1_move_double_check(0xf9, 0xeb)) // dying conception
                            )
                        )
            )

achievement("D. Crazy", "Hit your opponent with both Desperation Moves and use D. Shadow as Heavy-D! against the CPU.", 4,
            trigger =   global_resetif_not_p1_only() &&
                        global_resetif_notplaying() &&
                        global_resetif_neogeo_mode() &&
                        global_resetif_practice_mode() &&
                        unless(p1_current_character() != characters["Heavy-D!"]) &&
                        unless(p1_alt_character_active() == 1) &&
                        measured(
                            tally(3, 
                                once(p1_move_range_used(0xe0, 0xf7) && p1_hit_a_dm()),
                                once(p1_move_range_used(0x1e0, 0x1eb) && p1_hit_a_dm()),
                                once(p1_move_double_check(0xd6, 0xd7))
                            )
                        )
            )

achievement("Ultimate Ecstasy Crunch", "Hit your opponent with a Desperation Move as Kasumi against the CPU.", 3,
            trigger =   global_resetif_not_p1_only() &&
                        global_resetif_notplaying() &&
                        global_resetif_neogeo_mode() &&
                        global_resetif_practice_mode() &&
                        unless(p1_current_character() != characters["Kasumi"]) &&
                        unless(p1_alt_character_active() == 1) &&
                        measured(
                            tally(1, 
                                once(p1_move_range_used(0x96, 0xa0) && p1_hit_a_dm()),
                                once(p1_move_range_used(0xc2, 0xcf) && p1_hit_a_dm())
                            )
                        )
            )

achievement("Supreme Divinity", "Hit your opponent with a Desperation Move as Orochi against the CPU.", 3,
            trigger =   global_resetif_not_p1_only() &&
                        global_resetif_notplaying() &&
                        global_resetif_neogeo_mode() &&
                        global_resetif_practice_mode() &&
                        unless(p1_current_character() != characters["Orochi"]) &&
                        unless(p1_alt_character_active() == 1) &&
                        measured(
                            tally(2, 
                                once(p1_move_range_used(0x90, 0xc4) && p1_desperation_move() == 1 && p1_throwing() == 0 && p1_hit_combo() > prev(p1_hit_combo())),
                                once(p1_move_range_used(0xb4, 0xbd) && p1_hit_a_dm())
                            )
                        )
            )

achievement("Raising Storm", "Hit your opponent with all Desperation Moves as Geese against the CPU.", 5,
            trigger =   global_resetif_not_p1_only() &&
                        global_resetif_notplaying() &&
                        global_resetif_neogeo_mode() &&
                        global_resetif_practice_mode() &&
                        unless(p1_current_character() != characters["Geese"]) &&
                        unless(p1_alt_character_active() == 1) &&
                        measured(
                            tally(2, 
                                once(p1_move_range_used(0xb4, 0xd2) && p1_hit_a_dm()),
                                once(p1_move_double_check(0xa6, 0x1f5))
                            )
                        )
            )

achievement("Kaiser Wave", "Hit your opponent with all Desperation Moves as Krauser against the CPU.", 5,
            trigger =   global_resetif_not_p1_only() &&
                        global_resetif_notplaying() &&
                        global_resetif_neogeo_mode() &&
                        global_resetif_practice_mode() &&
                        unless(p1_current_character() != characters["Krauser"]) &&
                        unless(p1_alt_character_active() == 1) &&
                        measured(
                            tally(3, 
                                once(p1_projectile_move_id() >= 0xd7 && p1_projectile_move_id() <= 0xdc && p1_desperation_move() == 1 && (p1_hit_combo() > prev(p1_hit_combo()) || p1_won_a_round())),
                                once(p1_move_double_check(0xca, 0xd1)),
                                once(p1_move_range_used(0x1e3, 0x1e7))
                            )
                        )
            )

achievement("\"One-for-the-Road\" Blast", "Hit your opponent with Maiden Masher and use \"One-for-the-Road\" Blast as Orochi Iori against the CPU.", 3,
            trigger =   global_resetif_not_p1_only() &&
                        global_resetif_notplaying() &&
                        global_resetif_neogeo_mode() &&
                        global_resetif_practice_mode() &&
                        unless(p1_current_character() != characters["Orochi Iori"]) &&
                        unless(p1_alt_character_active() == 1) &&
                        measured(
                            tally(2, 
                                once(p1_move_range_used(0xa0, 0xb0) && p1_hit_a_dm()),
                                once(p1_move_range_used(0xc0, 0xcc)) // blast
                            )
                        )
            )

// EX CHARACTERS
achievement("EX Serpent Wave", "Hit your opponent with a Desperation Move as EX Kyo against the CPU.", 2,
            trigger =   global_resetif_not_p1_only() &&
                        global_resetif_notplaying() &&
                        global_resetif_neogeo_mode() &&
                        global_resetif_practice_mode() &&
                        unless(p1_current_character() != characters["Kyo"]) &&
                        unless(p1_alt_character_active() == 0) &&
                        measured(
                            tally(1, 
                                once(p1_move_range_used(0xb8, 0xc6) && p1_hit_a_dm())
                            )
                        )
            )

achievement("EX Power Geyser", "Hit your opponent with a Desperation Move as EX Terry against the CPU.", 2,
            trigger =   global_resetif_not_p1_only() &&
                        global_resetif_notplaying() &&
                        global_resetif_neogeo_mode() &&
                        global_resetif_practice_mode() &&
                        unless(p1_current_character() != characters["Terry"]) &&
                        unless(p1_alt_character_active() == 0) &&
                        measured(
                            tally(1, 
                                once(p1_move_range_used(0xa5, 0xaa) && p1_hit_a_dm())
                            )
                        )
            )

achievement("Drill Lv 5", "Hit your opponent with Guillotine and Drill Lv 5 as EX Yamazaki against the CPU.", 5,
            trigger =   global_resetif_not_p1_only() &&
                        global_resetif_notplaying() &&
                        global_resetif_neogeo_mode() &&
                        global_resetif_practice_mode() &&
                        unless(p1_current_character() != characters["Yamazaki"]) &&
                        unless(p1_alt_character_active() == 0) &&
                        measured(
                            tally(2, 
                                once(p1_move_range_used(0xa8, 0xb9) && p1_hit_a_dm()),
                                once(p1_move_range_used(0xe5, 0xe6)) // Drill Lv 5
                            )
                        )
            )

// =========================================
//                  Miscs              
// =========================================

achievement("Mr. Neo Geo Is Here!", "Make Dr. Neo Geo & Neo Poke-kun show up during the Japan Street stage.", 3,
            trigger =    game_fighting() == 1 &&
                         game_stage() == 0x00 &&
                         __ornext(stage_mrneogeo_sprite_id_2d() == 0x82cc || stage_mrneogeo_sprite_id_3d() == 0x82cc) &&
                         round_number() > 0
            )

achievement("Hot Pursuit", "As Mai, defeat Andy with Super Deadly Ninja Bees.", 2,
            trigger =    p1_only() &&
                         matchup_p1_vs_p2("Mai", "Andy") &&
                         (trigger_when(p1_move_range_used(0xa8, 0xb0) && // normal
                                      p1_won_a_round()) ||
                          trigger_when(p1_move_range_used(0x1f6, 0x1ff) && // EX
                                      p1_won_a_round())
                         )     
                         // default_settings()       
            )

achievement("Oh, Is It Bedtime Already?", "As Kyo, perform a Desperation Taunt against Iori.", 1,
            trigger =    p1_only() &&
                         matchup_p1_vs_p2("Kyo", "Iori") &&
                         p1_move_range_used(0xd0, 0xd1) &&
                         p1_moves() != prev(p1_moves())
            )

achievement("Funny Old Man", "As Chin, defeat your opponent with Stumbling Hermit Bombast.", 4,
            trigger =    p1_only() &&
                         p1_current_character() == characters["Chin"] &&
                         p1_move_range_used(0xe0, 0xeb) &&
                         p1_won_a_round()     
            )

achievement("Rugal Clones Theory", "Have three Omega Rugals on your team.", 1,
            trigger =    p1_active_state() == 1 &&
                         tbyte(0x00504df4) == 0x3c3c3c &&
                         prev(tbyte(0x00504df4)) == 0xff3c3c
            )

achievement("Bordeaux Vengeance", "As Rugal, defeat Goenitz with a perfect in Single Play on default settings.", 10,
            trigger =    p1_only() &&
                         __ornext(game_mode() == MODE_SINGLE_PLAY || game_mode() == MODE_SINGLE_PLAY_CPU_VS) &&
                         matchup_p1_vs_p2("Rugal", "Goenitz") &&
                         p1_hp() == 0x77 &&
                         trigger_when(p1_won_a_round()) &&
                         default_settings()  
            )

achievement("Geese!...", "As EX Terry or EX Andy, defeat EX Geese with a perfect in Single Play on default settings.", 10,
            trigger =    p1_only() &&
                         __ornext(game_mode() == MODE_SINGLE_PLAY || game_mode() == MODE_SINGLE_PLAY_CPU_VS) &&
                         __ornext(p1_current_character() == characters["Terry"] || p1_current_character() == characters["Andy"]) &&
                         p2_current_character() == characters["Geese"] &&
                         p1_alt_character_active() == 1 &&
                         p2_alt_character_active() == 1 &&
                         p1_hp() == 0x77 &&
                         trigger_when(p1_won_a_round()) &&
                         default_settings()  
            )

achievement("Art of Vengeance", "As EX Ryo or EX Robert, defeat Mr. Big with a perfect in Single Play on default settings.", 10,
            trigger =    p1_only() &&
                         __ornext(game_mode() == MODE_SINGLE_PLAY || game_mode() == MODE_SINGLE_PLAY_CPU_VS) &&
                         __ornext(p1_current_character() == characters["Ryo"] || p1_current_character() == characters["Robert"]) &&
                         p2_current_character() == characters["Mr.Big"] &&
                         p1_alt_character_active() == 1 &&
                         p1_hp() == 0x77 &&
                         trigger_when(p1_won_a_round()) &&
                         default_settings()  
            )

achievement("I’ll Chisel Your Gravestone, Sleep Well!", "Using a Fatal Fury Special character, defeat Krauser with a perfect in Single Play on default settings.", 10,
            trigger =    p1_only() &&
                         __ornext(game_mode() == MODE_SINGLE_PLAY || game_mode() == MODE_SINGLE_PLAY_CPU_VS) &&
                         once(p2_moves() == 0x163) &&
                         never(p2_current_character() != characters["Krauser"]) &&
                         p1_hp() == 0x77 &&
                         trigger_when(p1_won_a_round()) &&
                         default_settings()  
            )

achievement("Quick Revenge", "As Eiji, defeat Iori on Single Play by winning both rounds without the timer going below 47 on default settings.", 10,
            trigger =    p1_only() &&
                         once(p1_moves() == 0x160) &&
                         never(p1_current_character() != characters["Eiji"]) &&
                         never(p2_current_character() != characters["Iori"]) &&
                         never(round_timer() < 0x47 && p1_won_a_round()) &&
                         round_timer() >= 0x47 &&
                         trigger_when(p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1)
            )

achievement("Hey, Stop Stealing Others' Moves!", "As Krauser, win a round against Omega Rugal using only Kaiser Wave, without a time-out, with both fighters having infinite power gauge and default settings.", 10,
            trigger =    p1_only() &&
                         __ornext(game_mode() == MODE_SINGLE_PLAY || game_mode() == MODE_SINGLE_PLAY_CPU_VS) &&
                         once(round_started() > prev(round_started())) &&
                         round_timer() != 0 &&
                         never(p1_current_character() != characters["Krauser"]) &&
                         never(p2_current_character() != characters["Rugal"]) &&
                         never(p2_alt_character_active() != 1) &&
                         never(p1_projectile_move_id() < 0xd7 && p2_hp() < prev(p2_hp())) &&
                         never(p1_projectile_move_id() > 0xdc && p2_hp() < prev(p2_hp())) &&
                         never(p1_special_move_flag() == 0 && p2_hp() < prev(p2_hp())) &&
                         trigger_when(p1_won_a_round()) &&
                         default_settings_except_gauge() &&
                         settings_power_gauge_1p() == 1 &&
                         settings_power_gauge_2p() == 1
            )

achievement("Chains of Yata", "As Chizuru, use Rules of Zen to seal any of the Eight Heads of Orochi three times during a round on default settings.", 3,
            trigger =    p1_only() &&
                         never(p1_current_character() != characters["Chizuru"]) &&
                         never(round_winner_announcement() > prev(round_winner_announcement())) &&
                         measured(tally(3, once(p1_moves() == 0x164) && p1_move_range_used(0xb2, 0xb8) && p1_hit_combo() > prev(p1_hit_combo()),
                                           once(p1_moves() == 0x164) && p1_move_range_used(0xb2, 0xb8) && p1_won_a_round() )) &&
                         default_settings()  
            )

achievement("Friendzoned", "As Athena, win a round against Kensou using only Psycho Reflector in Single Play on default settings.", 5,
            trigger =    p1_only() &&
                         __ornext(game_mode() == MODE_SINGLE_PLAY || game_mode() == MODE_SINGLE_PLAY_CPU_VS) &&
                         once(round_started() > prev(round_started())) &&
                         never(p1_current_character() != characters["Athena"]) &&
                         never(p2_current_character() != characters["Kensou"]) &&
                         never(p1_projectile_move_id() < 0x8a && __ornext(p2_hp() < prev(p2_hp()) || p1_won_a_round())) &&
                         never(p1_projectile_move_id() > 0x8e && __ornext(p2_hp() < prev(p2_hp()) || p1_won_a_round())) &&
                         never(p1_special_move_flag() == 0 && __ornext(p2_hp() < prev(p2_hp()) || p1_won_a_round())) &&
                         never(p1_desperation_move() == 1 && __ornext(p2_hp() < prev(p2_hp()) || p1_won_a_round())) &&
                         trigger_when(p1_won_a_round()) &&
                         default_settings()
            )

achievement("Open Up, Lone Wolf", "As EX Blue Mary, perform all her throw and crunch moves sequences against EX Terry in a single round on default settings.", 10,
            trigger =    p1_only() &&
                         no_practice_mode() &&
                         never(p1_current_character() != characters["Blue Mary"]) &&
                         never(p2_current_character() != characters["Terry"]) &&
                         never(p1_alt_character_active() != 1)  &&
                         never(p2_alt_character_active() != 1)  &&
                         never(round_winner_announcement() > prev(round_winner_announcement())) &&
                         measured(tally(6, 
                                   once(p1_moves() == 0x8d),
                                   once(p1_moves() == 0xa2),
                                   once(p1_move_range_used(0xab, 0xae)),
                                   once(p1_moves() == 0xa8),
                                   once(p1_moves() == 0x97),
                                   once(p1_moves() == 0xcc)
                         )) &&
                         default_settings()
            )

achievement("Silent Crush", "As EX King, defeat EX Ryo with a perfect in Single Play on default settings.", 10,
            trigger =    p1_only() &&
                         __ornext(game_mode() == MODE_SINGLE_PLAY || game_mode() == MODE_SINGLE_PLAY_CPU_VS) &&
                         p1_current_character() == characters["King"] &&
                         p2_current_character() == characters["Ryo"] &&
                         p1_alt_character_active() == 1 &&
                         p2_alt_character_active() == 1 &&
                         p1_hp() == 0x77 &&
                         trigger_when(p1_won_a_round()) &&
                         default_settings()  
            )

achievement("The King of Speedrun 98 UM", "Defeat 30 opponents on Endless mode within 5 minutes.", 25,
            trigger =    p1_only() &&
                         never(p1_active_state() != 1) &&
                         never(game_mode() != MODE_ENDLESS) &&
                         once(endless_wins() == 0 && round_started() > prev(round_started())) &&
                         never(repeated(18000, once(endless_wins() == 0 && round_started() > prev(round_started())) && round_state_bitflags() == 0x40)) &&
                         trigger_when(endless_wins() == 30 && prev(endless_wins()) == 29)            
            )


// =========================================
//                Leaderboards              
// =========================================

leaderboard("98 UM Survivalist", "Highest wins in Endless mode on default settings.",
           start = game_mode() == MODE_ENDLESS && default_settings() && (p2_rounds_won() > prev(p2_rounds_won()) || players_active() == 0 && prev(players_active()) > 0) ,
           cancel = always_false(),
           submit = always_true(),
           value = endless_wins(),
           format = "VALUE", lower_is_better=false)

leaderboard("The King of Speedrun 98 UM", "Fastest time to defeat 30 opponents in Endless mode on default settings.",
           start = p1_only() && game_mode() == MODE_ENDLESS && endless_wins() == 0 && round_started() > prev(round_started()),
           cancel = p1_active_state() == 0 || p2_active_state() > 0 && game_mode() != MODE_ENDLESS,
           submit = endless_wins() == 30 && prev(endless_wins()) == 29,
           value = round_state_bitflags() == 0x40,
           format = "FRAMES", lower_is_better=true)