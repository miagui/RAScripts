// Mortal Kombat II
// #ID = 14978

function game_frames() => word(0x00BA12)
function fight_camera_position_x() => byte(0x00BA5E)
function game_state() => word(0x00C03A)
function p1_player_state() => word(0x00C03E)
function p1_character() => word(0x00C050)
function p1_hp() => word(0x00C05E)
function p1_flawless_victories_local() => word(0x00C060)
function p1_round_wins_local() => word(0x00C062)
function p2_player_state() => word(0x00C1B8)
function p2_character() => word(0x00C1CA)
function p2_hp() => word(0x00C1D8)
function p2_flawless_victories_local() => byte(0x00C1DA)
function p2_round_wins_local() => word(0x00C1DC)
function fight_finishing_move() => word(0x00C338)
function fight_round_end() => bit0(0x00C352)
function fight_arena() => word(0x00C358)
function game_difficulty_relative() => word(0x00C35A)
function game_human_perfomance_vs_cpu() => byte(0x00C35C)
function fight_round() => byte(0x00C35E)
function fight_winner_status() => byte(0x00C360)
function ladder_position() => word(0x00C366)
function fight_current_battle() => byte(0x00C368)
function p1_consecutive_wins() => byte(0x00C36A)
function p2_consecutive_wins() => byte(0x00C36C)
function p1_round_wins_global() => byte(0x00C36E)
function p2_round_wins_global() => byte(0x00C370)
function p1_hit_queue_array_start() => byte(0x00C372)
function p1_hit_queue_array_end() => byte(0x00C37C)
function p2_hit_queue_array_start() => byte(0x00C37E)
function p2_hit_queue_array_end() => byte(0x00C388)
function p1_related_to_shang_tsung_s_morph() => byte(0x00C3B8)

// =========================================
//             Flawless Victory              
// =========================================

achievement(
    title = "Flawless Victory", points = 3,
    description = "Defeat your opponent with a Flawless Victory.",
    id = 148849, badge = "166332", published = "07/04/2021 23:36:09", modified = "08/04/2021 12:33:07",
    trigger = p1_flawless_victories_local() == 1 && p1_player_state() != 0 && p2_player_state() == 0 &&
              game_state() == 5
)

achievement(
    title = "Double is for MK2", points = 5,
    description = "Defeat your opponent with a Double Flawless Victory.",
    id = 148850, badge = "166333", published = "07/04/2021 23:36:17", modified = "08/04/2021 12:33:08",
    trigger = p1_flawless_victories_local() == 2 && p1_player_state() != 0 && p2_player_state() == 0 &&
              game_state() == 5
)

achievement(
    title = "Flawless Kintaro", points = 5,
    description = "Defeat Kintaro with a Flawless Victory.",
    id = 148851, badge = "166334", published = "07/04/2021 23:36:22", modified = "31/05/2021 20:05:25",
    trigger = ladder_position() == 13 && p2_character() == 12 && p1_hp() == 161 && p2_hp() == 0 &&
              p2_hp() < prev(p2_hp()) && p1_player_state() != 0 && p2_player_state() == 0 && game_state() > 1
)

achievement(
    title = "Flawless Shao Kahn", points = 5,
    description = "Defeat Shao Kahn with a Flawless Victory.",
    id = 148852, badge = "166335", published = "07/04/2021 23:36:27", modified = "31/05/2021 20:05:25",
    trigger = ladder_position() == 14 && p2_character() == 13 && p1_hp() == 161 && p2_hp() == 0 &&
              p2_hp() < prev(p2_hp()) && p1_player_state() != 0 && p2_player_state() == 0 && game_state() > 1
)

// =========================================
//                  Fatality              
// =========================================

achievement(
    title = "Fatality MK2", points = 2,
    description = "Perform a Fatality Vs. CPU.",
    id = 148853, badge = "166336", published = "07/04/2021 23:36:39", modified = "07/04/2021 23:36:39",
    trigger = p1_player_state() != 0 && p2_player_state() == 0 && p1_round_wins_local() == 2 && game_state() > 1 &&
              fight_finishing_move() == 65535 &&
              ((prev(fight_finishing_move()) == 1) ||
               (prev(fight_finishing_move()) == 2) ||
               (prev(fight_finishing_move()) == 3))
)

achievement(
    title = "Back to Square One", points = 2,
    description = "Perform a Babality Vs. CPU.",
    id = 148854, badge = "166337", published = "07/04/2021 23:36:45", modified = "07/04/2021 23:36:45",
    trigger = prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535 && p1_player_state() != 0 &&
              p2_player_state() == 0 && p1_round_wins_local() == 2 && game_state() > 1
)

achievement(
    title = "Friendship is Magic", points = 2,
    description = "Perform a Friendship Vs. CPU.",
    id = 148855, badge = "166338", published = "07/04/2021 23:37:24", modified = "07/04/2021 23:37:24",
    trigger = prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535 && p1_player_state() != 0 &&
              p2_player_state() == 0 && p1_round_wins_local() == 2 && game_state() > 1
)

achievement(
    title = "Who Send All These Babies to Fight!?", points = 25,
    description = "Transform 10 opponents into babies during an Arcade playthrough.",
    id = 148856, badge = "166339", published = "07/04/2021 23:37:30", modified = "21/04/2022 21:40:53",
    trigger = measured(repeated(10, prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535)) &&
              p1_player_state() != 0 && p2_player_state() == 0 && p1_round_wins_local() == 2 && game_state() > 1 &&
              never((game_state() == 4 && ladder_position() == 0))
)

achievement(
    title = "The Dead Pool", points = 2,
    description = "Throw your opponent to the pool on The Deadpool Vs. CPU.",
    id = 148857, badge = "166340", published = "07/04/2021 23:37:40", modified = "09/04/2021 19:40:12",
    trigger = fight_arena() == 0 && prev(fight_finishing_move()) == 0 && fight_finishing_move() == 65535 &&
              p1_player_state() != 0 && p2_player_state() == 0 && p1_round_wins_local() == 2 && game_state() > 1
)

achievement(
    title = "The Kombat Tomb", points = 2,
    description = "Throw your opponent to the ceiling of Kombat Tomb Vs. CPU.",
    id = 148858, badge = "166341", published = "07/04/2021 23:37:44", modified = "07/04/2021 23:37:44",
    trigger = prev(fight_finishing_move()) == 8 && fight_finishing_move() == 65535 && p1_player_state() != 0 &&
              p2_player_state() == 0 && p1_round_wins_local() == 2 && game_state() > 1
)

achievement(
    title = "The Pit II", points = 2,
    description = "Throw your opponent to the bottom on The Pit II Vs. CPU.",
    id = 148859, badge = "166342", published = "07/04/2021 23:37:47", modified = "07/04/2021 23:37:47",
    trigger = prev(fight_finishing_move()) == 6 && fight_finishing_move() == 65535 && p1_player_state() != 0 &&
              p2_player_state() == 0 && p1_round_wins_local() == 2 && game_state() > 1
)

// =========================================
//            Completality (OLD)              
// =========================================

// achievement(
//     title = "Body Slice", points = 10,
//     description = "Perform Fatality 1 and 2, Babality and Friendship as Kung Lao during an Arcade playthrough.",
//     id = 148860, badge = "166220", published = "07/04/2021 23:38:15", modified = "01/09/2023 02:10:27",
//     trigger = measured(tally(4, 
//                   once(prev(fight_finishing_move()) == 1 && fight_finishing_move() == 65535),
//                   once(fight_finishing_move() == 2),
//                   once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))
//               ) && 
//               unless(p1_round_wins_local() != 2) &&
//               unless((game_state() != 2 && game_state() != 5)) &&
//               unless(p1_character() != 0) &&
//               unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
//               (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
// )

// achievement(
//     title = "Dragon's Bite", points = 10,
//     description = "Perform any Fatality, Babality and Friendship as Liu Kang during an Arcade playthrough.",
//     id = 148861, badge = "166219", published = "07/04/2021 23:38:17", modified = "01/09/2023 02:10:29",
//     trigger = measured(tally(3, 
//                   once(prev(fight_finishing_move()) == 1 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
//               unless(p1_round_wins_local() != 2) && 
//               unless((game_state() != 2 && game_state() != 5)) &&
//               unless(p1_character() != 1) && 
//               unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
//               (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
// )

// achievement(
//     title = "To My Best Fan!", points = 10,
//     description = "Perform Fatality 1 and 2, Babality and Friendship as Johnny Cage during an Arcade playthrough.",
//     id = 148862, badge = "166218", published = "07/04/2021 23:38:18", modified = "01/09/2023 02:10:31",
//     trigger = measured(tally(4, 
//                   once(prev(fight_finishing_move()) == 1 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 2 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
//               unless(p1_round_wins_local() != 2) && 
//               unless((game_state() != 2 && game_state() != 5)) &&
//               unless(p1_character() != 2) && 
//               unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
//               (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
// )

// achievement(
//     title = "Blade Impale", points = 10,
//     description = "Perform any Fatality, Babality and Friendship as Baraka during an Arcade playthrough.",
//     id = 148863, badge = "166217", published = "07/04/2021 23:38:19", modified = "01/09/2023 02:10:33",
//     trigger = measured(tally(3, 
//                   once(prev(fight_finishing_move()) == 1 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
//               unless(p1_round_wins_local() != 2) && 
//               unless((game_state() != 2 && game_state() != 5)) &&
//               unless(p1_character() != 3) && 
//               unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
//               (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
// )

// achievement(
//     title = "Death Kiss", points = 10,
//     description = "Perform any Fatality, Babality and Friendship as Kitana during an Arcade playthrough.",
//     id = 148864, badge = "166221", published = "07/04/2021 23:38:20", modified = "01/09/2023 02:10:34",
//     trigger = measured(tally(3, 
//                   once(prev(fight_finishing_move()) == 2 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
//               unless(p1_round_wins_local() != 2) && 
//               unless((game_state() != 2 && game_state() != 5)) &&
//               unless(p1_character() != 4) && 
//               unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
//               (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
// )

// achievement(
//     title = "Man-Eater", points = 10,
//     description = "Perform any Fatality, Babality and Friendship as Mileena during an Arcade playthrough.",
//     id = 148865, badge = "166222", published = "07/04/2021 23:38:22", modified = "01/09/2023 02:10:36",
//     trigger = measured(tally(3, 
//                   once(prev(fight_finishing_move()) == 2 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
//               unless(p1_round_wins_local() != 2) && 
//               unless((game_state() != 2 && game_state() != 5)) &&
//               unless(p1_character() != 5) && 
//               unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
//               (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
// )

// achievement(
//     title = "Soul Steal", points = 10,
//     description = "Perform Fatality 1, 2 and 3, Babality and Friendship as Shang Tsung during an Arcade playthrough.",
//     id = 148866, badge = "166223", published = "07/04/2021 23:38:23", modified = "01/09/2023 02:10:37",
//     trigger = measured(tally(5, 
//                   once(prev(fight_finishing_move()) == 1 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 2 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 3 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
//               unless(p1_round_wins_local() != 2) && 
//               unless((game_state() != 2 && game_state() != 5)) &&
//               unless(p1_character() != 6) && 
//               unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
//               (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
// )

// achievement(
//     title = "Electrocution", points = 10,
//     description = "Perform any Fatality, Babality and Friendship as Rayden during an Arcade playthrough.",
//     id = 148867, badge = "166224", published = "07/04/2021 23:38:24", modified = "01/09/2023 02:10:39",
//     trigger = measured(tally(3, 
//                   once(prev(fight_finishing_move()) == 2 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
//               unless(p1_round_wins_local() != 2) && 
//               unless((game_state() != 2 && game_state() != 5)) &&
//               unless(p1_character() != 7) && 
//               unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
//               (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
// )

// achievement(
//     title = "Deep Freeze", points = 10,
//     description = "Perform any Fatality, Babality and Friendship as Sub-Zero during an Arcade playthrough.",
//     id = 148868, badge = "166225", published = "07/04/2021 23:38:25", modified = "01/09/2023 02:10:40",
//     trigger = measured(tally(3, 
//                   once(prev(fight_finishing_move()) == 2 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
//               unless(p1_round_wins_local() != 2) && 
//               unless((game_state() != 2 && game_state() != 5)) &&
//               unless(p1_character() != 8) && 
//               unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
//               (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
// )

// achievement(
//     title = "Yummy!", points = 10,
//     description = "Perform Fatality 1 and 2, Babality and Friendship as Reptile during an Arcade playthrough.",
//     id = 148869, badge = "166226", published = "07/04/2021 23:38:27", modified = "01/09/2023 02:10:42",
//     trigger = measured(tally(4, 
//                   once(prev(fight_finishing_move()) == 1 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 2 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
//               unless(p1_round_wins_local() != 2) && 
//               unless((game_state() != 2 && game_state() != 5)) &&
//               unless(p1_character() != 9) && 
//               unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
//               (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
// )

// achievement(
//     title = "Toasty!", points = 10,
//     description = "Perform Fatality 1 and 2, Babality and Friendship as Scorpion during an Arcade playthrough.",
//     id = 148870, badge = "166227", published = "07/04/2021 23:38:28", modified = "01/09/2023 02:10:46",
//     trigger = measured(tally(4, 
//                   once(prev(fight_finishing_move()) == 1 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 2 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
//               unless(p1_round_wins_local() != 2) && 
//               unless((game_state() != 2 && game_state() != 5)) &&
//               unless(p1_character() != 10) && 
//               unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
//               (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
// )

// achievement(
//     title = "Head Smash", points = 10,
//     description = "Perform Fatality 1 and 2, Babality and Friendship as Jax during an Arcade playthrough.",
//     id = 148871, badge = "166228", published = "07/04/2021 23:38:30", modified = "01/09/2023 02:10:49",
//     trigger = measured(tally(4, 
//                   once(prev(fight_finishing_move()) == 1 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 2 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
//                   once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
//               unless(p1_round_wins_local() != 2) && 
//               unless((game_state() != 2 && game_state() != 5)) &&
//               unless(p1_character() != 11) && 
//               unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
//               (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
// )


// =========================================
//            Completality (NEW)            
// =========================================

achievement(
    title = "Body Slice", points = 10,
    description = "Perform a Fatality, a Babality and a Friendship as Kung Lao during an Arcade playthrough.",
    id = 148860, badge = "166220", published = "07/04/2021 23:38:15", modified = "01/09/2023 02:10:27",
    trigger = measured(tally(3, 
                  once(__ornext(prev(fight_finishing_move()) == 1 || prev(fight_finishing_move()) == 2) && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))
              ) && 
              unless(p1_round_wins_local() != 2) &&
              unless((game_state() != 2 && game_state() != 5)) &&
              unless(p1_character() != 0) &&
              unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
              (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
)

achievement(
    title = "Dragon's Bite", points = 10,
    description = "Perform a Fatality, a Babality and a Friendship as Liu Kang during an Arcade playthrough.",
    id = 148861, badge = "166219", published = "07/04/2021 23:38:17", modified = "01/09/2023 02:10:29",
    trigger = measured(tally(3, 
                  once(prev(fight_finishing_move()) == 1 && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
              unless(p1_round_wins_local() != 2) && 
              unless((game_state() != 2 && game_state() != 5)) &&
              unless(p1_character() != 1) && 
              unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
              (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
)

achievement(
    title = "To My Best Fan!", points = 10,
    description = "Perform a Fatality, a Babality and a Friendship as Johnny Cage during an Arcade playthrough.",
    id = 148862, badge = "166218", published = "07/04/2021 23:38:18", modified = "01/09/2023 02:10:31",
    trigger = measured(tally(3, 
                  once(__ornext(prev(fight_finishing_move()) == 1 || prev(fight_finishing_move()) == 2) && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
              unless(p1_round_wins_local() != 2) && 
              unless((game_state() != 2 && game_state() != 5)) &&
              unless(p1_character() != 2) && 
              unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
              (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
)

achievement(
    title = "Blade Impale", points = 10,
    description = "Perform a Fatality, a Babality and a Friendship as Baraka during an Arcade playthrough.",
    id = 148863, badge = "166217", published = "07/04/2021 23:38:19", modified = "01/09/2023 02:10:33",
    trigger = measured(tally(3, 
                  once(prev(fight_finishing_move()) == 1 && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
              unless(p1_round_wins_local() != 2) && 
              unless((game_state() != 2 && game_state() != 5)) &&
              unless(p1_character() != 3) && 
              unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
              (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
)

achievement(
    title = "Death Kiss", points = 10,
    description = "Perform a Fatality, a Babality and a Friendship as Kitana during an Arcade playthrough.",
    id = 148864, badge = "166221", published = "07/04/2021 23:38:20", modified = "01/09/2023 02:10:34",
    trigger = measured(tally(3, 
                  once(prev(fight_finishing_move()) == 2 && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
              unless(p1_round_wins_local() != 2) && 
              unless((game_state() != 2 && game_state() != 5)) &&
              unless(p1_character() != 4) && 
              unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
              (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
)

achievement(
    title = "Man-Eater", points = 10,
    description = "Perform a Fatality, a Babality and a Friendship as Mileena during an Arcade playthrough.",
    id = 148865, badge = "166222", published = "07/04/2021 23:38:22", modified = "01/09/2023 02:10:36",
    trigger = measured(tally(3, 
                  once(prev(fight_finishing_move()) == 2 && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
              unless(p1_round_wins_local() != 2) && 
              unless((game_state() != 2 && game_state() != 5)) &&
              unless(p1_character() != 5) && 
              unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
              (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
)

achievement(
    title = "Soul Steal", points = 10,
    description = "Perform a Fatality, the Kintaro Morphy, a Babality and Friendship as Shang Tsung during an Arcade playthrough.",
    id = 148866, badge = "166223", published = "07/04/2021 23:38:23", modified = "01/09/2023 02:10:37",
    trigger = measured(tally(4, 
                  once(__ornext(prev(fight_finishing_move()) == 1 || prev(fight_finishing_move()) == 2) && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 3 && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
              unless(p1_round_wins_local() != 2) && 
              unless((game_state() != 2 && game_state() != 5)) &&
              unless(p1_character() != 6) && 
              unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
              (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
)

achievement(
    title = "Electrocution", points = 10,
    description = "Perform a Fatality, a Babality and a Friendship as Rayden during an Arcade playthrough.",
    id = 148867, badge = "166224", published = "07/04/2021 23:38:24", modified = "01/09/2023 02:10:39",
    trigger = measured(tally(3, 
                  once(prev(fight_finishing_move()) == 2 && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
              unless(p1_round_wins_local() != 2) && 
              unless((game_state() != 2 && game_state() != 5)) &&
              unless(p1_character() != 7) && 
              unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
              (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
)

achievement(
    title = "Deep Freeze", points = 10,
    description = "Perform a Fatality, a Babality and a Friendship as Sub-Zero during an Arcade playthrough.",
    id = 148868, badge = "166225", published = "07/04/2021 23:38:25", modified = "01/09/2023 02:10:40",
    trigger = measured(tally(3, 
                  once(prev(fight_finishing_move()) == 2 && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
              unless(p1_round_wins_local() != 2) && 
              unless((game_state() != 2 && game_state() != 5)) &&
              unless(p1_character() != 8) && 
              unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
              (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
)

achievement(
    title = "Yummy!", points = 10,
    description = "Perform a Fatality, a Babality and a Friendship as Reptile during an Arcade playthrough.",
    id = 148869, badge = "166226", published = "07/04/2021 23:38:27", modified = "01/09/2023 02:10:42",
    trigger = measured(tally(3, 
                  once(__ornext(prev(fight_finishing_move()) == 1 || prev(fight_finishing_move()) == 2) && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
              unless(p1_round_wins_local() != 2) && 
              unless((game_state() != 2 && game_state() != 5)) &&
              unless(p1_character() != 9) && 
              unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
              (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
)

achievement(
    title = "Toasty!", points = 10,
    description = "Perform a Fatality, a Babality and a Friendship as Scorpion during an Arcade playthrough.",
    id = 148870, badge = "166227", published = "07/04/2021 23:38:28", modified = "01/09/2023 02:10:46",
    trigger = measured(tally(3, 
                  once(__ornext(prev(fight_finishing_move()) == 1 || prev(fight_finishing_move()) == 2) && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
              unless(p1_round_wins_local() != 2) && 
              unless((game_state() != 2 && game_state() != 5)) &&
              unless(p1_character() != 10) && 
              unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
              (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
)

achievement(
    title = "Head Smash", points = 10,
    description = "Perform a Fatality, a Babality and a Friendship as Jax during an Arcade playthrough.",
    id = 148871, badge = "166228", published = "07/04/2021 23:38:30", modified = "01/09/2023 02:10:49",
    trigger = measured(tally(3, 
                  once(__ornext(prev(fight_finishing_move()) == 1 || prev(fight_finishing_move()) == 2) && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 65535),
                  once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 65535))) && 
              unless(p1_round_wins_local() != 2) && 
              unless((game_state() != 2 && game_state() != 5)) &&
              unless(p1_character() != 11) && 
              unless((p1_player_state() != 1 || p2_player_state() == 1)) &&
              (always_false() || (never((game_state() == 4 && ladder_position() == 0))))
)



// =========================================
//              Beat the game              
// =========================================

achievement(
    title = "Kung Lao", points = 10, type="progression",
    description = "Beat the game using only Kung Lao.",
    id = 148872, badge = "166324", published = "07/04/2021 23:40:00", modified = "18/11/2024 00:25:30",
    trigger = once(ladder_position() == 0) && trigger_when(ladder_position() == 14) &&
              trigger_when(p2_character() == 13) && trigger_when(prev(p1_round_wins_local()) == 1) &&
              trigger_when(p1_hp() != 0) && trigger_when(p2_hp() == 0) && trigger_when(p2_hp() < prev(p2_hp())) &&
              p1_player_state() != 0 && p2_player_state() == 0 && game_state() > 1 &&
              never((game_state() == 2 && byte(0x00C062) > prev(byte(0x00C062)) && p1_character() != 0)) &&
              p1_character() == 0
)

achievement(
    title = "Liu Kang", points = 10, type="progression",
    description = "Beat the game using only Liu Kang.",
    id = 148873, badge = "166325", published = "07/04/2021 23:40:03", modified = "18/11/2024 00:25:31",
    trigger = once(ladder_position() == 0) && trigger_when(ladder_position() == 14) &&
              trigger_when(p2_character() == 13) && trigger_when(prev(p1_round_wins_local()) == 1) &&
              trigger_when(p1_hp() != 0) && trigger_when(p2_hp() == 0) && trigger_when(p2_hp() < prev(p2_hp())) &&
              p1_player_state() != 0 && p2_player_state() == 0 && game_state() > 1 &&
              never((game_state() == 2 && byte(0x00C062) > prev(byte(0x00C062)) && p1_character() != 1)) &&
              p1_character() == 1
)

achievement(
    title = "Johnny Cage", points = 10, type="progression",
    description = "Beat the game using only Johnny Cage.",
    id = 148874, badge = "166322", published = "07/04/2021 23:40:11", modified = "18/11/2024 00:25:31",
    trigger = once(ladder_position() == 0) && trigger_when(ladder_position() == 14) &&
              trigger_when(p2_character() == 13) && trigger_when(prev(p1_round_wins_local()) == 1) &&
              trigger_when(p1_hp() != 0) && trigger_when(p2_hp() == 0) && trigger_when(p2_hp() < prev(p2_hp())) &&
              p1_player_state() != 0 && p2_player_state() == 0 && game_state() > 1 &&
              never((game_state() == 2 && byte(0x00C062) > prev(byte(0x00C062)) && p1_character() != 2)) &&
              p1_character() == 2
)

achievement(
    title = "Baraka", points = 10, type="progression",
    description = "Beat the game using only Baraka.",
    id = 148875, badge = "166320", published = "07/04/2021 23:40:15", modified = "18/11/2024 00:25:31",
    trigger = once(ladder_position() == 0) && trigger_when(ladder_position() == 14) &&
              trigger_when(p2_character() == 13) && trigger_when(prev(p1_round_wins_local()) == 1) &&
              trigger_when(p1_hp() != 0) && trigger_when(p2_hp() == 0) && trigger_when(p2_hp() < prev(p2_hp())) &&
              p1_player_state() != 0 && p2_player_state() == 0 && game_state() > 1 &&
              never((game_state() == 2 && byte(0x00C062) > prev(byte(0x00C062)) && p1_character() != 3)) &&
              p1_character() == 3
)

achievement(
    title = "Kitana", points = 10, type="progression",
    description = "Beat the game using only Kitana.",
    id = 148876, badge = "166323", published = "07/04/2021 23:40:19", modified = "18/11/2024 00:25:32",
    trigger = once(ladder_position() == 0) && trigger_when(ladder_position() == 14) &&
              trigger_when(p2_character() == 13) && trigger_when(prev(p1_round_wins_local()) == 1) &&
              trigger_when(p1_hp() != 0) && trigger_when(p2_hp() == 0) && trigger_when(p2_hp() < prev(p2_hp())) &&
              p1_player_state() != 0 && p2_player_state() == 0 && game_state() > 1 &&
              never((game_state() == 2 && byte(0x00C062) > prev(byte(0x00C062)) && p1_character() != 4)) &&
              p1_character() == 4
)

achievement(
    title = "Mileena", points = 10, type="progression",
    description = "Beat the game using only Mileena.",
    id = 148877, badge = "166326", published = "07/04/2021 23:40:21", modified = "18/11/2024 00:25:32",
    trigger = once(ladder_position() == 0) && trigger_when(ladder_position() == 14) &&
              trigger_when(p2_character() == 13) && trigger_when(prev(p1_round_wins_local()) == 1) &&
              trigger_when(p1_hp() != 0) && trigger_when(p2_hp() == 0) && trigger_when(p2_hp() < prev(p2_hp())) &&
              p1_player_state() != 0 && p2_player_state() == 0 && game_state() > 1 &&
              never((game_state() == 2 && byte(0x00C062) > prev(byte(0x00C062)) && p1_character() != 5)) &&
              p1_character() == 5
)

achievement(
    title = "Shang Tsung", points = 10, type="progression",
    description = "Beat the game using only Shang Tsung.",
    id = 148878, badge = "166330", published = "07/04/2021 23:40:24", modified = "18/11/2024 00:25:32",
    trigger = once(ladder_position() == 0) && trigger_when(ladder_position() == 14) &&
              trigger_when(p2_character() == 13) && trigger_when(prev(p1_round_wins_local()) == 1) &&
              trigger_when(p1_hp() != 0) && trigger_when(p2_hp() == 0) && trigger_when(p2_hp() < prev(p2_hp())) &&
              p1_player_state() != 0 && p2_player_state() == 0 && game_state() > 1 &&
              never((game_state() == 2 && byte(0x00C062) > prev(byte(0x00C062)) && p1_character() != 6)) &&
              p1_character() == 6
)

achievement(
    title = "Rayden", points = 10, type="progression",
    description = "Beat the game using only Rayden.",
    id = 148879, badge = "166327", published = "07/04/2021 23:40:31", modified = "18/11/2024 00:25:33",
    trigger = once(ladder_position() == 0) && trigger_when(ladder_position() == 14) &&
              trigger_when(p2_character() == 13) && trigger_when(prev(p1_round_wins_local()) == 1) &&
              trigger_when(p1_hp() != 0) && trigger_when(p2_hp() == 0) && trigger_when(p2_hp() < prev(p2_hp())) &&
              p1_player_state() != 0 && p2_player_state() == 0 && game_state() > 1 &&
              never((game_state() == 2 && byte(0x00C062) > prev(byte(0x00C062)) && p1_character() != 7)) &&
              p1_character() == 7
)

achievement(
    title = "Sub-Zero", points = 10, type="progression",
    description = "Beat the game using only Sub-Zero.",
    id = 148880, badge = "166331", published = "07/04/2021 23:40:33", modified = "18/11/2024 00:25:33",
    trigger = once(ladder_position() == 0) && trigger_when(ladder_position() == 14) &&
              trigger_when(p2_character() == 13) && trigger_when(prev(p1_round_wins_local()) == 1) &&
              trigger_when(p1_hp() != 0) && trigger_when(p2_hp() == 0) && trigger_when(p2_hp() < prev(p2_hp())) &&
              p1_player_state() != 0 && p2_player_state() == 0 && game_state() > 1 &&
              never((game_state() == 2 && byte(0x00C062) > prev(byte(0x00C062)) && p1_character() != 8)) &&
              p1_character() == 8
)

achievement(
    title = "Reptile", points = 10, type="progression",
    description = "Beat the game using only Reptile.",
    id = 148881, badge = "166328", published = "07/04/2021 23:40:37", modified = "18/11/2024 00:25:33",
    trigger = once(ladder_position() == 0) && trigger_when(ladder_position() == 14) &&
              trigger_when(p2_character() == 13) && trigger_when(prev(p1_round_wins_local()) == 1) &&
              trigger_when(p1_hp() != 0) && trigger_when(p2_hp() == 0) && trigger_when(p2_hp() < prev(p2_hp())) &&
              p1_player_state() != 0 && p2_player_state() == 0 && game_state() > 1 &&
              never((game_state() == 2 && byte(0x00C062) > prev(byte(0x00C062)) && p1_character() != 9)) &&
              p1_character() == 9
)

achievement(
    title = "Scorpion", points = 10, type="progression",
    description = "Beat the game using only Scorpion.",
    id = 148882, badge = "166329", published = "07/04/2021 23:40:40", modified = "18/11/2024 00:25:34",
    trigger = once(ladder_position() == 0) && trigger_when(ladder_position() == 14) &&
              trigger_when(p2_character() == 13) && trigger_when(prev(p1_round_wins_local()) == 1) &&
              trigger_when(p1_hp() != 0) && trigger_when(p2_hp() == 0) && trigger_when(p2_hp() < prev(p2_hp())) &&
              p1_player_state() != 0 && p2_player_state() == 0 && game_state() > 1 &&
              never((game_state() == 2 && byte(0x00C062) > prev(byte(0x00C062)) && p1_character() != 10)) &&
              p1_character() == 10
)

achievement(
    title = "Jax", points = 10, type="progression",
    description = "Beat the game using only Jax.",
    id = 148883, badge = "166321", published = "07/04/2021 23:40:42", modified = "18/11/2024 00:25:34",
    trigger = once(ladder_position() == 0) && trigger_when(ladder_position() == 14) &&
              trigger_when(p2_character() == 13) && trigger_when(prev(p1_round_wins_local()) == 1) &&
              trigger_when(p1_hp() != 0) && trigger_when(p2_hp() == 0) && trigger_when(p2_hp() < prev(p2_hp())) &&
              p1_player_state() != 0 && p2_player_state() == 0 && game_state() > 1 &&
              never((game_state() == 2 && byte(0x00C062) > prev(byte(0x00C062)) && p1_character() != 11)) &&
              p1_character() == 11
)

achievement(
    title = "Outworld Master", points = 25,
    description = "Beat the game on Very Hard.",
    id = 148890, badge = "166351", published = "07/04/2021 23:41:26", modified = "21/04/2022 21:41:01",
    trigger = once(game_difficulty_relative() == 4 && ladder_position() == 0) && trigger_when(ladder_position() == 14) &&
              trigger_when(p2_character() == 13) && trigger_when(prev(p1_round_wins_local()) == 1) &&
              trigger_when(p1_hp() != 0) && trigger_when(p2_hp() == 0) && trigger_when(p2_hp() < prev(p2_hp())) &&
              p1_player_state() != 0 && p2_player_state() == 0 && never(game_state() <= 1)
)

achievement(
    title = "MK2 1CC", points = 25,
    description = "Beat the game without losing a match.",
    id = 148891, badge = "166349", published = "07/04/2021 23:41:27", modified = "21/04/2022 21:41:02",
    trigger = once(ladder_position() == 0) && trigger_when(ladder_position() == 14) &&
              trigger_when(p2_character() == 13) && trigger_when(prev(p1_round_wins_local()) == 1) &&
              trigger_when(p1_hp() != 0) && trigger_when(p2_hp() == 0) && trigger_when(p2_hp() < prev(p2_hp())) &&
              p1_player_state() != 0 && p2_player_state() == 0 && game_state() > 1 && never(p2_round_wins_local() == 2)
)

// =========================================
//                   Misc              
// =========================================

achievement(
    title = "Hidden in The Forest", points = 10,
    description = "Find Smoke.",
    id = 148884, badge = "166343", published = "07/04/2021 23:41:15", modified = "07/04/2021 23:41:15",
    trigger = p2_character() == 14 && p1_player_state() != 0 && p2_player_state() == 0 && game_state() > 1
)

achievement(
    title = "Ceamr Odse Nto Exits", points = 10,
    description = "Find Noob Saibot.",
    id = 148885, badge = "166345", published = "07/04/2021 23:41:19", modified = "07/04/2021 23:41:19",
    trigger = p2_character() == 15 && p1_player_state() != 0 && p2_player_state() == 0 && game_state() > 1
)

achievement(
    title = "One Day We Will Fight!", points = 10,
    description = "Find Jade.",
    id = 148886, badge = "166344", published = "07/04/2021 23:41:21", modified = "07/04/2021 23:41:21",
    trigger = p2_character() == 16 && p1_player_state() != 0 && p2_player_state() == 0 && game_state() > 1
)

achievement(
    title = "Smoke Addiction", points = 25,
    description = "Defeat Smoke.",
    id = 148887, badge = "166352", published = "07/04/2021 23:41:22", modified = "07/04/2021 23:41:22",
    trigger = p2_character() == 14 && p1_player_state() != 0 && p2_player_state() == 0 && p1_round_wins_local() == 2 &&
              game_state() > 1
)

achievement(
    title = "Feel The Power of TOASTY!", points = 25,
    description = "Defeat Noob Saibot.",
    id = 148888, badge = "166347", published = "07/04/2021 23:41:23", modified = "07/04/2021 23:41:23",
    trigger = p2_character() == 15 && p1_player_state() != 0 && p2_player_state() == 0 && p1_round_wins_local() == 2 &&
              game_state() > 1
)

achievement(
    title = "Secret Assassin", points = 25,
    description = "Defeat Jade.",
    id = 148889, badge = "166353", published = "07/04/2021 23:41:25", modified = "07/04/2021 23:41:25",
    trigger = p2_character() == 16 && p1_player_state() != 0 && p2_player_state() == 0 && p1_round_wins_local() == 2 &&
              game_state() > 1
)

leaderboard(
    id = 21824, title = "MK2 Speedrun",
    description = "Fastest time to beat the game.",
    start  = game_state() == 7 && ladder_position() == 0 && p1_player_state() == 1 && p2_player_state() == 0,
    cancel = game_state() == 4 && ladder_position() == 0,
    submit = ladder_position() == 14 && prev(p1_round_wins_local()) == 1 && p1_hp() != 0 && p2_hp() == 0 &&
             p2_hp() < prev(p2_hp()),
    value  = measured(tally(0, game_frames() != prev(game_frames()))),
    format = "FRAMES", lower_is_better = true
)
