// The King of Fighters 2000
// #ID = 12033

// Settings
function settings_difficulty_aes() => byte(0x0000CE)
function settings_play_time_aes() => byte(0x0000D1)
function settings_striker_aes() => byte(0x0000D9)

function soft_dip_difficulty() => byte(0x00FD8C)

function aes_or_mvs_indicator() => byte(0x00FD82) // BAD
function mvs_flag() => bit7(0x00FD83)

function unibios() => dword(0x00FE30)

// Game
function arcade_match_progression_flags() => byte(0x00A798)
function game_stage() => byte(0x00A7AF)
function game_mode() => byte(0x00A7F4)
function game_players_active() => byte(0x00A7B6)
function round_timer() => byte(0x00A7E7)

function arcade_ba_points_16_bits_low4() => low4(0x00ECD4)
function arcade_ba_points_16_bits_high4() => high4(0x00ECD4)

// Player
function p2_active_state() => low4(0x00FDB6)
function p1_active_state() => low4(0x00FDB7)

function p2_rounds_won() => byte(0x00A806)
function p1_rounds_won() => byte(0x00A807)

// P1
function p1_moves() => word(0x008102)
function p1_active_character_in_game() => byte(0x008170)

function control() => byte(0x008172)
function control() => word(0x008172)

function p1_last_move() => word(0x0081EE)
function p1_hp() => byte(0x008238)
function p1_hit_combo() => byte(0x0084B1)
function pow_bar_flags_counter_mode() => bit0(0x0082EE)
function pow_bar_flags_armor_mode() => bit1(0x0082EE)
function pow_bar_flags() => byte(0x0082EE)

// P2
function p2_hp() => byte(0x008438)
function p2_flag_ko() => byte(0x008439)
function p2_character() => byte(0x008458)
function p2_hit_combo() => byte(0x0082B1)

function player_select_slot_1() => byte(0x00A7FB)
function player_select_slot_2() => byte(0x00A7FA)
function player_select_slot_3() => byte(0x00A7FD)
function player_select_slot_4() => byte(0x00A7FC)

function p1_striker_mode_maniac() => bit1(0x00A80B)

function control_2() => bit4(0x00E73C)
function control_2() => bit5(0x00E73C)
function control_2() => bit6(0x00E73C)
function control_2() => bit7(0x00E73C)

function cutscene() => byte(0x00EBE0)

function flag_animation_striker_bit0() => bit0(0x00EC86)
function flag_animation_striker() => byte(0x00EC86)



// =========================================
//                   Arcade              
// =========================================

achievement(
    title = "The Official KOF'2000: Hero Team", points = 10, type="win_condition",
    description = "Finish Team Play with 1-K', 2-Maxima, 3-Ramon and 4-Vanessa on default difficulty",
    id = 119959, badge = "129456", published = "30/07/2020 23:23:06", modified = "30/07/2020 23:23:06",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() != 1) && p2_character() == 35 && game_stage() == 6 && p1_rounds_won() > 0 &&
              cutscene() > 0 && once(game_players_active() == 1) && never(player_select_slot_1() != 0) &&
              never(player_select_slot_2() != 1) && never(player_select_slot_3() != 29) &&
              never(player_select_slot_4() != 31) &&
              ((mvs_flag() == 0 && settings_difficulty_aes() >= 2) ||
               (mvs_flag() == 1 && soft_dip_difficulty() >= 3))
)

achievement(
    title = "The Official KOF'2000: Substitute Team", points = 10, type="win_condition",
    description = "Finish Team Play with 1-Benimaru, 2-Shingo, 3-Lin and 4-Seth on default difficulty",
    id = 119960, badge = "129457", published = "30/07/2020 23:23:08", modified = "30/07/2020 23:23:08",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() != 1) && p2_character() == 35 && game_stage() == 6 && p1_rounds_won() > 0 &&
              cutscene() > 0 && once(game_players_active() == 1) && never(player_select_slot_1() != 2) &&
              never(player_select_slot_2() != 3) && never(player_select_slot_3() != 32) &&
              never(player_select_slot_4() != 33) &&
              ((mvs_flag() == 0 && settings_difficulty_aes() >= 2) ||
               (mvs_flag() == 1 && soft_dip_difficulty() >= 3))
)

achievement(
    title = "The Official KOF'2000: Art of Fighting Team", points = 10, type="win_condition",
    description = "Finish Team Play with 1-Ryo, 2-Robert, 3-King and 4-Takuma on default difficulty",
    id = 119961, badge = "129458", published = "30/07/2020 23:23:10", modified = "30/07/2020 23:23:10",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() != 1) && p2_character() == 35 && game_stage() == 6 && p1_rounds_won() > 0 &&
              cutscene() > 0 && once(game_players_active() == 1) && never(player_select_slot_1() != 8) &&
              never(player_select_slot_2() != 9) && never(player_select_slot_3() != 20) &&
              never(player_select_slot_4() != 11) &&
              ((mvs_flag() == 0 && settings_difficulty_aes() >= 2) ||
               (mvs_flag() == 1 && soft_dip_difficulty() >= 3))
)

achievement(
    title = "The Official KOF'2000: Fatal Fury Team", points = 10, type="win_condition",
    description = "Finish Team Play with 1-Terry, 2-Andy, 3-Joe and 4-Mary on default difficulty",
    id = 119962, badge = "129462", published = "30/07/2020 23:23:13", modified = "30/07/2020 23:23:13",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() != 1) && p2_character() == 35 && game_stage() == 6 && p1_rounds_won() > 0 &&
              cutscene() > 0 && once(game_players_active() == 1) && never(player_select_slot_1() != 4) &&
              never(player_select_slot_2() != 5) && never(player_select_slot_3() != 6) &&
              never(player_select_slot_4() != 21) &&
              ((mvs_flag() == 0 && settings_difficulty_aes() >= 2) ||
               (mvs_flag() == 1 && soft_dip_difficulty() >= 3))
)

achievement(
    title = "The Official KOF'2000: Psycho Soldier Team", points = 10, type="win_condition",
    description = "Finish Team Play with 1-Athena, 2-Kensou, 3-Chin and 4-Bao on default difficulty",
    id = 119963, badge = "129463", published = "30/07/2020 23:23:15", modified = "30/07/2020 23:23:15",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() != 1) && p2_character() == 35 && game_stage() == 6 && p1_rounds_won() > 0 &&
              cutscene() > 0 && once(game_players_active() == 1) && never(player_select_slot_1() != 16) &&
              never(player_select_slot_2() != 17) && never(player_select_slot_3() != 18) &&
              never(player_select_slot_4() != 19) &&
              ((mvs_flag() == 0 && settings_difficulty_aes() >= 2) ||
               (mvs_flag() == 1 && soft_dip_difficulty() >= 3))
)

achievement(
    title = "The Official KOF'2000: Gals Fighters Team", points = 10, type="win_condition",
    description = "Finish Team Play with 1-Mai, 2-Yuri, 3-Kasumi and 4-Hinako on default difficulty",
    id = 119964, badge = "129464", published = "30/07/2020 23:23:17", modified = "30/07/2020 23:23:17",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() != 1) && p2_character() == 35 && game_stage() == 6 && p1_rounds_won() > 0 &&
              cutscene() > 0 && once(game_players_active() == 1) && never(player_select_slot_1() != 7) &&
              never(player_select_slot_2() != 10) && never(player_select_slot_3() != 22) &&
              never(player_select_slot_4() != 23) &&
              ((mvs_flag() == 0 && settings_difficulty_aes() >= 2) ||
               (mvs_flag() == 1 && soft_dip_difficulty() >= 3))
)

achievement(
    title = "The Official KOF'2000: Ikari Assassins Team", points = 10, type="win_condition",
    description = "Finish Team Play with 1-Leona, 2-Ralf, 3-Clark and 4-Whip on default difficulty",
    id = 119965, badge = "129465", published = "30/07/2020 23:23:18", modified = "30/07/2020 23:23:18",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() != 1) && p2_character() == 35 && game_stage() == 6 && p1_rounds_won() > 0 &&
              cutscene() > 0 && once(game_players_active() == 1) && never(player_select_slot_1() != 12) &&
              never(player_select_slot_2() != 13) && never(player_select_slot_3() != 14) &&
              never(player_select_slot_4() != 15) &&
              ((mvs_flag() == 0 && settings_difficulty_aes() >= 2) ||
               (mvs_flag() == 1 && soft_dip_difficulty() >= 3))
)

achievement(
    title = "The Official KOF'2000: Korea Justice Team", points = 10, type="win_condition",
    description = "Finish Team Play with 1-Kim, 2-Chang, 3-Choi and 4-Jhun on default difficulty",
    id = 119966, badge = "129466", published = "30/07/2020 23:23:20", modified = "30/07/2020 23:23:20",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() != 1) && p2_character() == 35 && game_stage() == 6 && p1_rounds_won() > 0 &&
              cutscene() > 0 && once(game_players_active() == 1) && never(player_select_slot_1() != 24) &&
              never(player_select_slot_2() != 25) && never(player_select_slot_3() != 26) &&
              never(player_select_slot_4() != 27) &&
              ((mvs_flag() == 0 && settings_difficulty_aes() >= 2) ||
               (mvs_flag() == 1 && soft_dip_difficulty() >= 3))
)

achievement(
    title = "Single Entry 2000: Kusanagi Team", points = 10, type="win_condition",
    description = "Finish Team Play with Kyo as your first choice on default difficulty",
    id = 119967, badge = "129467", published = "30/07/2020 23:23:23", modified = "30/07/2020 23:23:23",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() != 1) && p2_character() == 35 && game_stage() == 6 && p1_rounds_won() > 0 &&
              cutscene() > 0 && once(game_players_active() == 1) && never(player_select_slot_1() != 28) &&
              ((mvs_flag() == 0 && settings_difficulty_aes() >= 2) ||
               (mvs_flag() == 1 && soft_dip_difficulty() >= 3))
)

achievement(
    title = "Single Entry 2000: Yagami Team", points = 10, type="win_condition",
    description = "Finish Team Play with Iori as your first choice on default difficulty",
    id = 119968, badge = "129468", published = "30/07/2020 23:23:25", modified = "30/07/2020 23:23:25",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() != 1) && p2_character() == 35 && game_stage() == 6 && p1_rounds_won() > 0 &&
              cutscene() > 0 && once(game_players_active() == 1) && never(player_select_slot_1() != 30) &&
              ((mvs_flag() == 0 && settings_difficulty_aes() >= 2) ||
               (mvs_flag() == 1 && soft_dip_difficulty() >= 3))
)

achievement(
    title = "Single Entry 2000: Diamond Team", points = 10, type="win_condition",
    description = "Finish Team Play with Kula as your first choice on default difficulty",
    id = 119969, badge = "129469", published = "30/07/2020 23:23:31", modified = "08/03/2025 21:25:52",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() != 1) && p2_character() == 35 && game_stage() == 6 && p1_rounds_won() > 0 &&
              cutscene() > 0 && once(game_players_active() == 1) && never(player_select_slot_1() != 34) &&
              ((mvs_flag() == 0 && settings_difficulty_aes() >= 2) ||
               (mvs_flag() == 1 && soft_dip_difficulty() >= 3))
)

achievement(
    title = "The Mix 2000: Submission x Karate", points = 10, type="win_condition",
    description = "Finish Team Play with 1-Clark, 2-Mary, 3-Takuma and 4-Kasumi on default difficulty",
    id = 119970, badge = "129471", published = "30/07/2020 23:23:33", modified = "08/03/2025 21:25:38",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() != 1) && p2_character() == 35 && game_stage() == 6 && p1_rounds_won() > 0 &&
              cutscene() > 0 && once(game_players_active() == 1) && never(player_select_slot_1() != 14) &&
              never(player_select_slot_2() != 21) && never(player_select_slot_3() != 11) &&
              never(player_select_slot_4() != 22) &&
              ((mvs_flag() == 0 && settings_difficulty_aes() >= 2) ||
               (mvs_flag() == 1 && soft_dip_difficulty() >= 3))
)

achievement(
    title = "The Mix 2000: Leaders Team", points = 10, type="win_condition",
    description = "Finish Team Play with 1-Benimaru, 2-K', 3-Terry and 4-Ryo on default difficulty",
    id = 119971, badge = "129470", published = "30/07/2020 23:23:35", modified = "08/03/2025 21:25:21",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() != 1) && p2_character() == 35 && game_stage() == 6 && p1_rounds_won() > 0 &&
              cutscene() > 0 && once(game_players_active() == 1) && never(player_select_slot_1() != 2) &&
              never(player_select_slot_2() != 0) && never(player_select_slot_3() != 4) &&
              never(player_select_slot_4() != 8) &&
              ((mvs_flag() == 0 && settings_difficulty_aes() >= 2) ||
               (mvs_flag() == 1 && soft_dip_difficulty() >= 3))
)

achievement(
    title = "The Mix 2000: Friendzone", points = 10, type="win_condition",
    description = "Finish Team Play with 1-Kensou, 2-Athena, 3-Mai and 4-Andy on default difficulty",
    id = 119972, badge = "129472", published = "30/07/2020 23:23:38", modified = "08/03/2025 21:25:07",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() != 1) && p2_character() == 35 && game_stage() == 6 && p1_rounds_won() > 0 &&
              cutscene() > 0 && once(game_players_active() == 1) && never(player_select_slot_1() != 17) &&
              never(player_select_slot_2() != 16) && never(player_select_slot_3() != 7) &&
              never(player_select_slot_4() != 5) &&
              ((mvs_flag() == 0 && settings_difficulty_aes() >= 2) ||
               (mvs_flag() == 1 && soft_dip_difficulty() >= 3))
)

achievement(
    title = "The Mix 2000: Dominators Team", points = 10, type="win_condition",
    description = "Finish Team Play with 1-Chin, 2-Jhun, 3-Whip and 4-Lin on default difficulty",
    id = 119973, badge = "129473", published = "30/07/2020 23:23:41", modified = "04/03/2025 23:01:07",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() != 1) && p2_character() == 35 && game_stage() == 6 && p1_rounds_won() > 0 &&
              cutscene() > 0 && once(game_players_active() == 1) && never(player_select_slot_1() != 18) &&
              never(player_select_slot_2() != 27) && never(player_select_slot_3() != 15) &&
              never(player_select_slot_4() != 32) &&
              ((mvs_flag() == 0 && settings_difficulty_aes() >= 2) ||
               (mvs_flag() == 1 && soft_dip_difficulty() >= 3))
)

// =========================================
//             Desperation Moves             
// =========================================

achievement(
    title = "If You Can't Win, Buzz Off!", points = 5,
    description = "Perform all K' Desperation Moves without using Counter Mode",
    id = 119974, badge = "129477", published = "30/07/2020 23:25:59", modified = "30/07/2020 23:25:59",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              once(p1_active_character_in_game() == 0 && p1_last_move() == 558) &&
              once((p1_active_character_in_game() == 0 && p1_last_move() == 553) || p1_last_move() == 556) &&
              never(game_mode() == 6) && unless(p1_active_character_in_game() != 0) && once(game_players_active() == 1)
)

// Ticket 84458: Triggered after finishing a round using Bunker Buster without having used Maxima Revenger.
achievement(
    title = "Best Give up Than Be Wrong", points = 5,
    description = "Perform all Maxima Desperation Moves without using Counter Mode",
    id = 119975, badge = "129478", published = "30/07/2020 23:26:01", modified = "30/07/2020 23:26:01",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              once(p1_last_move() == 563) &&
              once(p1_last_move() == 553 || p1_last_move() == 571) &&
              never(game_mode() == 6) && unless(p1_active_character_in_game() != 1) && once(game_players_active() == 1)
)

achievement(
    title = "Your Expression Was a Classic!", points = 5,
    description = "Perform all Ramon Desperation Moves without using Counter Mode",
    id = 119976, badge = "129479", published = "30/07/2020 23:26:03", modified = "30/07/2020 23:26:03",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 29) && once(p1_last_move() == 549) &&
              once(p1_last_move() == 551 || p1_last_move() == 552) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "Let's do This Again", points = 5,
    description = "Perform all Vanessa Desperation Moves without using Counter Mode",
    id = 119977, badge = "129480", published = "30/07/2020 23:26:05", modified = "30/07/2020 23:26:05",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 31) && once(p1_last_move() == 551) &&
              once(p1_last_move() == 552 || p1_last_move() == 554) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "Your Fiery Fighting Almost Wilted", points = 5,
    description = "Perform all Benimaru Desperation Moves without using Counter Mode",
    id = 119978, badge = "129481", published = "30/07/2020 23:26:07", modified = "30/07/2020 23:26:07",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 2) && once(p1_last_move() == 561) &&
              once(p1_last_move() == 551 || p1_last_move() == 552) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "I, I... Won... I Am Suuuupreeeme!!!", points = 5,
    description = "Perform all Shingo Desperation Moves without using Counter Mode",
    id = 119979, badge = "129482", published = "30/07/2020 23:26:09", modified = "30/07/2020 23:26:09",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 3) && once(p1_last_move() == 547) &&
              once(p1_last_move() == 549 || p1_last_move() == 550) && never(game_mode() == 6) && once(game_players_active() == 1)
)

// Ticket 30244: No work for me.
//               
//               Proof:https://youtu.be/qnWAhDxxdVQ<br>MD5: Unknown<br>Emulator: RetroArch (Final Burn Neo)
achievement(
    title = "My Venom Has No Antidote...", points = 5,
    description = "Perform all Lin Desperation Moves without using Counter Mode",
    id = 119980, badge = "129538", published = "30/07/2020 23:26:11", modified = "31/07/2020 23:37:27",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 32) && once(p1_last_move() == 556) && once(p1_last_move() == 555) &&
              once(p1_last_move() == 551 || p1_last_move() == 553) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "Bring Wine and Chinchilla", points = 5,
    description = "Perform all Seph Desperation Moves without using Counter Mode",
    id = 119981, badge = "129539", published = "30/07/2020 23:26:14", modified = "30/07/2020 23:26:14",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 33) && once(p1_last_move() == 557) &&
              once(p1_last_move() == 0x22b) &&
              once(p1_last_move() == 558 || p1_last_move() == 559) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "Kyokugen Karate Is Peerless!", points = 5,
    description = "Perform all Ryo Desperation Moves without using Counter Mode",
    id = 119982, badge = "130212", published = "30/07/2020 23:26:16", modified = "30/07/2020 23:26:16",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              once(p1_active_character_in_game() == 8 && p1_last_move() == 557) &&
              once((p1_active_character_in_game() == 8 && p1_last_move() == 552) || p1_last_move() == 551) &&
              once((p1_active_character_in_game() == 8 && p1_last_move() == 550) || p1_last_move() == 549) &&
              never(game_mode() == 6) && unless(p1_active_character_in_game() != 8) && once(game_players_active() == 1)
)

achievement(
    title = "True, Fighters Need Composure", points = 5,
    description = "Perform all Robert Desperation Moves without using Counter Mode",
    id = 119983, badge = "130213", published = "30/07/2020 23:26:17", modified = "31/07/2020 22:03:30",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              once((p1_active_character_in_game() == 9 && p1_last_move() == 541) || p1_last_move() == 540) &&
              once(p1_active_character_in_game() == 9 && p1_last_move() == 551) &&
              once((p1_active_character_in_game() == 9 && p1_last_move() == 549) || p1_last_move() == 550) &&
              never(game_mode() == 6) && unless(p1_active_character_in_game() != 9) && once(game_players_active() == 1)
)

achievement(
    title = "Fait Accomplis Bore Me Silly", points = 5,
    description = "Perform all King Desperation Moves without using Counter Mode",
    id = 119984, badge = "130216", published = "30/07/2020 23:26:20", modified = "30/07/2020 23:26:20",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 20) && once(p1_last_move() == 565) &&
              once(p1_last_move() == 559 || p1_last_move() == 556) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "The True Way of Battle!", points = 5,
    description = "Perform all Takuma Desperation Moves without using Counter Mode",
    id = 119985, badge = "130219", published = "30/07/2020 23:26:22", modified = "30/07/2020 23:26:22",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 11) && once(p1_last_move() == 556) && once(p1_last_move() == 546) &&
              once(p1_last_move() == 552 || p1_last_move() == 555) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "Now You Know My Power", points = 5,
    description = "Perform all Terry Desperation Moves without using Counter Mode",
    id = 119986, badge = "130250", published = "30/07/2020 23:26:24", modified = "30/07/2020 23:26:24",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 4) && once(p1_last_move() == 555) &&
              once(p1_last_move() == 550 || p1_last_move() == 551) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "You Can't Win With Personality Only!", points = 5,
    description = "Perform all Andy Desperation Moves without using Counter Mode",
    id = 119987, badge = "130251", published = "30/07/2020 23:26:27", modified = "30/07/2020 23:26:27",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 5) && once(p1_last_move() == 556) &&
              once(p1_last_move() == 554 || p1_last_move() == 561) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "Can You Hear It? Huh?", points = 5,
    description = "Perform all Joe Desperation Moves without using Counter Mode",
    id = 119988, badge = "130252", published = "30/07/2020 23:26:29", modified = "30/07/2020 23:26:29",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 6) && once(p1_last_move() == 554) && once(p1_last_move() == 560) &&
              once(p1_last_move() == 551 || p1_last_move() == 552) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "Ok! Uh Oh! I Wonder Where I Got That Line?!", points = 5,
    description = "Perform all Mary Desperation Moves without using Counter Mode",
    id = 119989, badge = "130255", published = "30/07/2020 23:26:31", modified = "31/07/2020 00:07:17",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 21) && once(p1_last_move() == 552) && once(p1_last_move() == 550) &&
              once(p1_last_move() == 556 || p1_last_move() == 558) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "I Won't Say You're Weak", points = 5,
    description = "Perform all Athena Desperation Moves without using Counter Mode",
    id = 119990, badge = "130284", published = "30/07/2020 23:26:34", modified = "13/10/2020 13:51:20",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 16) && once(p1_last_move() == 557) &&
              once(p1_last_move() == 554 || p1_last_move() == 548 || p1_last_move() == 550 || p1_last_move() == 552) &&
              once(p1_last_move() == 555 || p1_last_move() == 549 || p1_last_move() == 551 || p1_last_move() == 553) &&
              never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "Beaten as You Were", points = 5,
    description = "Perform all Kensou Desperation Moves without using Counter Mode",
    id = 119991, badge = "130285", published = "30/07/2020 23:26:36", modified = "30/07/2020 23:26:36",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 17) && once(p1_last_move() == 563) &&
              once(p1_last_move() == 549 || p1_last_move() == 554) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "Whew! I'm Beat! Wish I Were a Striker!", points = 5,
    description = "Perform all Chin Desperation Moves without using Counter Mode",
    id = 119992, badge = "130286", published = "30/07/2020 23:26:38", modified = "30/07/2020 23:26:38",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 18) && once(p1_last_move() == 562) &&
              once(p1_last_move() == 551 || p1_last_move() == 552) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "Let I and You Meet Again", points = 5,
    description = "Perform all Bao Desperation Moves without using Counter Mode",
    id = 119993, badge = "130287", published = "30/07/2020 23:26:47", modified = "30/07/2020 23:26:47",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 19) && once(p1_last_move() == 552) &&
              once(p1_last_move() == 551 || p1_last_move() == 550) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "You Should've Expected That", points = 5,
    description = "Perform all Leona Desperation Moves without using Counter Mode",
    id = 119994, badge = "130406", published = "30/07/2020 23:26:49", modified = "30/07/2020 23:26:49",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 12) && once(p1_last_move() == 560) && once(p1_last_move() == 555) &&
              once(p1_last_move() == 548 || p1_last_move() == 550) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "Total Firepower", points = 5,
    description = "Perform all Ralf Desperation Moves without using Counter Mode",
    id = 119995, badge = "130407", published = "30/07/2020 23:26:51", modified = "30/07/2020 23:26:51",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 13) && once(p1_last_move() == 557) &&
              once(p1_last_move() == 553 || p1_last_move() == 555) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "You've Nothing to Regret", points = 5,
    description = "Perform all Clark Desperation Moves without using Counter Mode",
    id = 119996, badge = "130415", published = "30/07/2020 23:26:54", modified = "30/07/2020 23:26:54",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 14) && once(p1_last_move() == 551) &&
              once(p1_last_move() == 548 || p1_last_move() == 549) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "What a Fierce Sneer!", points = 5,
    description = "Perform Whip Desperation Move without using Counter Mode",
    id = 119997, badge = "130416", published = "30/07/2020 23:26:57", modified = "30/07/2020 23:26:57",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 15) && once(p1_last_move() == 552) && never(game_mode() == 6) &&
              once(game_players_active() == 1)
)

achievement(
    title = "What a Rush!", points = 5,
    description = "Perform all Kim Desperation Moves without using Counter Mode",
    id = 119998, badge = "130436", published = "30/07/2020 23:27:00", modified = "30/07/2020 23:27:00",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 24) && once(p1_last_move() == 564) &&
              once(p1_last_move() == 552 || p1_last_move() == 561) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "I've Given up Wasting Losers", points = 5,
    description = "Perform all Chang Desperation Moves without using Counter Mode",
    id = 119999, badge = "130437", published = "30/07/2020 23:27:03", modified = "30/07/2020 23:27:03",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 25) && once(p1_last_move() == 549) && once(p1_last_move() == 544) &&
              once(p1_last_move() == 552 || p1_last_move() == 558) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "Oooh! the Mutilation", points = 5,
    description = "Perform all Choi Desperation Moves without using Counter Mode",
    id = 120000, badge = "130438", published = "30/07/2020 23:27:05", modified = "30/07/2020 23:27:05",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 26) && once(p1_last_move() == 550) && once(p1_last_move() == 563) &&
              once(p1_last_move() == 551 || p1_last_move() == 557) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "Take This, Please!", points = 5,
    description = "Perform all Jhun Desperation Moves without using Counter Mode",
    id = 120002, badge = "130439", published = "30/07/2020 23:27:10", modified = "30/07/2020 23:27:10",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 27) && once(p1_last_move() == 552) &&
              once(p1_last_move() == 557 || p1_last_move() == 559) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "All My Moves Are Superb!", points = 5,
    description = "Perform all Kasumi Desperation Moves without using Counter Mode",
    id = 120001, badge = "130453", published = "30/07/2020 23:27:07", modified = "30/07/2020 23:27:07",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 22) && once(p1_last_move() == 552) &&
              once(p1_last_move() == 554 || p1_last_move() == 555) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "I'm Hot This Year", points = 5,
    description = "Perform all Mai Desperation Moves without using Counter Mode",
    id = 120003, badge = "130454", published = "30/07/2020 23:27:12", modified = "30/07/2020 23:27:12",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 7) && once(p1_last_move() == 554) && once(p1_last_move() == 552) &&
              once(p1_last_move() == 550 || p1_last_move() == 551) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "Any Monkey Can Fight! ", points = 5,
    description = "Perform all Yuri Desperation Moves without using Counter Mode",
    id = 120004, badge = "130455", published = "30/07/2020 23:27:14", modified = "30/07/2020 23:27:14",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 10) && once(p1_last_move() == 554) && once(p1_last_move() == 558) &&
              never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "I Reacted Without Thinking. You Ok?...", points = 5,
    description = "Perform Hinako Desperation Move without using Counter Mode",
    id = 120005, badge = "130456", published = "30/07/2020 23:27:16", modified = "30/07/2020 23:27:16",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 23) && once(p1_last_move() == 554 || p1_last_move() == 555) &&
              never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "It's Like I'm Assisting Suicide!", points = 5,
    description = "Perform all Iori Desperation Moves without using Counter Mode",
    id = 120006, badge = "130457", published = "30/07/2020 23:27:19", modified = "30/07/2020 23:27:19",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 30) && once(p1_last_move() == 565) &&
              once(p1_last_move() == 549 || p1_last_move() == 551) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "Resistance Is Flammable", points = 5,
    description = "Perform all Kyo Desperation Moves without using Counter Mode",
    id = 120007, badge = "130458", published = "30/07/2020 23:27:21", modified = "30/07/2020 23:27:21",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 28) && once(p1_last_move() == 563) &&
              once(p1_last_move() == 566 || p1_last_move() == 568) && never(game_mode() == 6) && once(game_players_active() == 1)
)

achievement(
    title = "I Won! Are You Happy?", points = 5,
    description = "Perform Kula Desperation Move without using Counter Mode",
    id = 120008, badge = "130459", published = "30/07/2020 23:27:24", modified = "30/07/2020 23:27:24",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p2_active_state() != 0) &&
              unless(p1_active_character_in_game() != 34) && once(p1_last_move() == 547 || p1_last_move() == 548) &&
              never(game_mode() == 6) && once(game_players_active() == 1)
)

// =========================================
//               Damage Dealer              
// =========================================

achievement(
    title = "Damage Dealers 1: Hero Team", points = 10,
    description = "Deal 8000 damage with Hero Team using the same order of choice as the character selection",
    id = 120017, badge = "130520", published = "30/07/2020 23:29:38", modified = "31/07/2020 00:42:24",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && once(game_players_active() == 1) && measured(repeated(8000, p1_hit_combo() > 0)) &&
              game_stage() <= 7 && never(player_select_slot_1() != 0) && never(player_select_slot_2() != 1) &&
              never(player_select_slot_3() != 29) && never(player_select_slot_4() != 31) && never(p2_rounds_won() == 3)
)

achievement(
    title = "Damage Dealers 2: Substitute Team", points = 10,
    description = "Deal 8000 damage with Substitute Team using the same order of choice as the character selection",
    id = 120018, badge = "130521", published = "30/07/2020 23:29:40", modified = "31/07/2020 00:31:58",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && once(game_players_active() == 1) && measured(repeated(8000, p1_hit_combo() > 0)) &&
              game_stage() <= 7 && never(player_select_slot_1() != 2) && never(player_select_slot_2() != 3) &&
              never(player_select_slot_3() != 32) && never(player_select_slot_4() != 33) && never(p2_rounds_won() == 3)
)

achievement(
    title = "Damage Dealers 3: Fatal Fury Team", points = 10,
    description = "Deal 8000 damage with Fatal Fury Team using the same order of choice as the character selection",
    id = 120019, badge = "130522", published = "30/07/2020 23:29:42", modified = "31/07/2020 00:31:55",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && once(game_players_active() == 1) && measured(repeated(8000, p1_hit_combo() > 0)) &&
              game_stage() <= 7 && never(player_select_slot_1() != 4) && never(player_select_slot_2() != 5) &&
              never(player_select_slot_3() != 6) && never(player_select_slot_4() != 21) && never(p2_rounds_won() == 3)
)

achievement(
    title = "Damage Dealers 4: Art of Fighting Team", points = 10,
    description = "Deal 8000 damage with Art of Fighting Team using the same order of choice as the character selection",
    id = 120020, badge = "130524", published = "30/07/2020 23:29:45", modified = "31/07/2020 00:31:51",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && once(game_players_active() == 1) && measured(repeated(8000, p1_hit_combo() > 0)) &&
              game_stage() <= 7 && never(player_select_slot_1() != 8) && never(player_select_slot_2() != 9) &&
              never(player_select_slot_3() != 20) && never(player_select_slot_4() != 11) && never(p2_rounds_won() == 3)
)

achievement(
    title = "Damage Dealers 5: Psycho Soldier Team", points = 10,
    description = "Deal 8000 damage with Psycho Soldier Team using the same order of choice as the character selection",
    id = 120021, badge = "130525", published = "30/07/2020 23:29:48", modified = "31/07/2020 00:31:49",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && once(game_players_active() == 1) && measured(repeated(8000, p1_hit_combo() > 0)) &&
              game_stage() <= 7 && never(player_select_slot_1() != 16) && never(player_select_slot_2() != 17) &&
              never(player_select_slot_3() != 18) && never(player_select_slot_4() != 19) && never(p2_rounds_won() == 3)
)

achievement(
    title = "Damage Dealers 6: Ikari Assassins Team", points = 10,
    description = "Deal 8000 damage with Ikari Assassins Team using the same order of choice as the character selection",
    id = 120022, badge = "130526", published = "30/07/2020 23:29:51", modified = "31/07/2020 00:31:47",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && once(game_players_active() == 1) && measured(repeated(8000, p1_hit_combo() > 0)) &&
              game_stage() <= 7 && never(player_select_slot_1() != 12) && never(player_select_slot_2() != 13) &&
              never(player_select_slot_3() != 14) && never(player_select_slot_4() != 15) && never(p2_rounds_won() == 3)
)

achievement(
    title = "Damage Dealers 7: Gals Fighters Team", points = 10,
    description = "Deal 8000 damage with Gals Fighters Team using the same order of choice as the character selection",
    id = 120023, badge = "130527", published = "30/07/2020 23:29:53", modified = "31/07/2020 00:31:44",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && once(game_players_active() == 1) && measured(repeated(8000, p1_hit_combo() > 0)) &&
              game_stage() <= 7 && never(player_select_slot_1() != 7) && never(player_select_slot_2() != 10) &&
              never(player_select_slot_3() != 22) && never(player_select_slot_4() != 23) && never(p2_rounds_won() == 3)
)

achievement(
    title = "Damage Dealers 8: Korea Justice Team", points = 10,
    description = "Deal 8000 damage with Korea Justice Team using the same order of choice as the character selection",
    id = 120024, badge = "130528", published = "30/07/2020 23:29:55", modified = "31/07/2020 00:31:42",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && once(game_players_active() == 1) && measured(repeated(8000, p1_hit_combo() > 0)) &&
              game_stage() <= 7 && never(player_select_slot_1() != 24) && never(player_select_slot_2() != 25) &&
              never(player_select_slot_3() != 26) && never(player_select_slot_4() != 27) && never(p2_rounds_won() == 3)
)

// =========================================
//                    Misc              
// =========================================

achievement(
    title = "I-Basic KOF Move 2000 - Recovery", points = 1,
    description = "Perform a Recovery Roll",
    id = 120009, badge = "130462", published = "30/07/2020 23:29:09", modified = "30/07/2020 23:29:09",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && unless(game_players_active() != 1) && p1_moves() == 60244
)

achievement(
    title = "II-Basic KOF Move 2000 - GC Evade", points = 1,
    description = "Perform a Guard Cancel evade",
    id = 120010, badge = "130463", published = "30/07/2020 23:29:11", modified = "30/07/2020 23:29:11",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && unless(game_players_active() != 1) && p1_moves() == 23252 &&
              (control() == 61 || control() == 58)
)

achievement(
    title = "III-Basic KOF Move 2000 - GC Body Blow", points = 1,
    description = "Perform a Guard Cancel in body blow",
    id = 120011, badge = "130464", published = "30/07/2020 23:29:13", modified = "30/07/2020 23:29:13",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && unless(game_players_active() != 1) && control() == 118 && p1_moves() == 49100
)

// Ticket 84459: Triggered when *losing* a round against Whip with K' by time over.
achievement(
    title = "Wow!!! My Time Is Up...", points = 3,
    description = "Win a fight in time out",
    id = 120025, badge = "130933", published = "30/07/2020 23:32:14", modified = "30/07/2020 23:32:14",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              unless(game_players_active() != 1) &&
              round_timer() == 0 && p1_rounds_won() > prev(p1_rounds_won())
)

achievement(
    title = "The Fourth Secret Character", points = 2,
    description = "Enable the Maniac striker and select him",
    id = 119958, badge = "130934", published = "30/07/2020 23:23:00", modified = "30/07/2020 23:23:00",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && unless(game_players_active() != 1) &&
              p1_striker_mode_maniac() > 0
)

achievement(
    title = "Touch Here Partner!", points = 2,
    description = "Finish your opponent with the help of the Striker",
    id = 120027, badge = "130923", published = "30/07/2020 23:32:25", modified = "30/07/2020 23:32:25",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && unless(game_players_active() != 1) && flag_animation_striker_bit0() == 1 &&
              p2_flag_ko() == 255
)

achievement(
    title = "The King of Zoation", points = 5,
    description = "Tease your opponent 10 times without being hit",
    id = 120026, badge = "130928", published = "30/07/2020 23:32:18", modified = "30/07/2020 23:32:18",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              unless(game_players_active() != 1) && never(game_mode() == 6) && measured(repeated(10, control() == 70)) &&
              unless(prev(control()) == 70) && never(p2_hit_combo() > 0)
)

achievement(
    title = "Leaving the Armored Defense Body", points = 5,
    description = "Enter Armor mode 5 times",
    id = 120030, badge = "130533", published = "30/07/2020 23:34:03", modified = "30/07/2020 23:34:03",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && unless(game_players_active() != 1) && measured(repeated(5, pow_bar_flags() == 2)) &&
              unless(prev(pow_bar_flags()) == 2)
)

achievement(
    title = "Attack Power Count", points = 5,
    description = "Enter Counter Mode 5 times",
    id = 120031, badge = "130531", published = "30/07/2020 23:34:07", modified = "30/07/2020 23:34:07",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && unless(game_players_active() != 1) && measured(repeated(5, pow_bar_flags() == 1)) &&
              unless(prev(pow_bar_flags()) == 1)
)

// =========================================
//             Combos and Counter             
// =========================================

achievement(
    title = "Playing Making Hits", points = 2,
    description = "Perform a 10-hit combo",
    id = 120032, badge = "130697", published = "30/07/2020 23:36:04", modified = "30/07/2020 23:36:04",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && unless(game_players_active() != 1) && p1_hit_combo() >= 16
)

achievement(
    title = "Going From a Veteran's Point", points = 3,
    description = "Perform a 20-hit combo",
    id = 120033, badge = "130720", published = "30/07/2020 23:36:07", modified = "30/07/2020 23:36:07",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && unless(game_players_active() != 1) && p1_hit_combo() >= 32
)

achievement(
    title = "Leader of Combos Generation", points = 5,
    description = "Perform a 28-hit combo",
    id = 120034, badge = "130959", published = "30/07/2020 23:36:10", modified = "31/07/2020 04:10:11",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && unless(game_players_active() != 1) && p1_hit_combo() >= 40
)

achievement(
    title = "COUNTER 5s - Valkyrie Killer", points = 3,
    description = "Finish your opponent using Whip's Sonic Slaughter:Code KW while on Counter Mode",
    id = 120036, badge = "130481", published = "30/07/2020 23:37:07", modified = "30/07/2020 23:37:07",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && unless(game_players_active() != 1) && p1_active_character_in_game() == 15 &&
              pow_bar_flags_counter_mode() > 0 && p2_flag_ko() == 255 && p1_last_move() == 810
)

achievement(
    title = "COUNTER 4s - Ball Mix", points = 3,
    description = "Finish your opponent using Bao's Psycho Ball Attack Max while on Counter Mode",
    id = 120037, badge = "130480", published = "30/07/2020 23:37:09", modified = "30/07/2020 23:37:09",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && unless(game_players_active() != 1) && p1_active_character_in_game() == 19 &&
              pow_bar_flags_counter_mode() > 0 && p2_flag_ko() == 255 && p1_last_move() == 806
)

// Ticket 58808: triggers with Haoh Shoukou Ken while on Counter Mode.
achievement(
    title = "COUNTER 3s - Aerial Tiger", points = 3,
    description = "Finish your opponent using Ryo's Haoh Shoukou Ken while on Counter Mode",
    id = 120038, badge = "130479", published = "30/07/2020 23:37:12", modified = "04/03/2025 22:47:13",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && unless(game_players_active() != 1) && p1_active_character_in_game() == 8 &&
              pow_bar_flags_counter_mode() > 0 && p2_flag_ko() == 255 && p1_last_move() == 807
)

achievement(
    title = "COUNTER 2s - Rapid Spider", points = 3,
    description = "Finish your opponent using Mary's M. Dynamite Swing while on Counter Mode",
    id = 120039, badge = "130478", published = "30/07/2020 23:37:17", modified = "30/07/2020 23:37:17",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && unless(game_players_active() != 1) && p1_active_character_in_game() == 21 &&
              pow_bar_flags_counter_mode() > 0 && p2_flag_ko() == 255 && p1_last_move() == 812
)

achievement(
    title = "COUNTER 1s - Narrow Spike", points = 3,
    description = "Finish your opponent using K' Chain Drive while on Counter Mode",
    id = 120040, badge = "130477", published = "30/07/2020 23:37:20", modified = "30/07/2020 23:37:20",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && unless(game_players_active() != 1) && p1_active_character_in_game() == 0 &&
              pow_bar_flags_counter_mode() > 0 && p2_flag_ko() == 255 && p1_last_move() == 810
)

achievement(
    title = "Origins of a Freezing Tale", points = 5,
    description = "Perform a 4-hit combo using Kula's Freeze Execution",
    id = 120035, badge = "130534", published = "30/07/2020 23:37:00", modified = "30/07/2020 23:37:00",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              unless(game_players_active() != 1) && never(game_mode() == 6) && p1_active_character_in_game() == 34 &&
              p1_hit_combo() >= 4 && p1_last_move() == 549
)

achievement(
    title = "GAUGE MAX 1 - Psychic Heal", points = 3,
    description = "Finish your opponent with Athena's Crystal Shot with the Max gauge bar",
    id = 120012, badge = "130466", published = "30/07/2020 23:29:17", modified = "30/07/2020 23:29:17",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && unless(game_players_active() != 1) && p1_active_character_in_game() == 16 &&
              (p1_last_move() == 551 || p1_last_move() == 555) && p2_flag_ko() == 255
)

achievement(
    title = "GAUGE MAX 2 - Scalding Steam Blast", points = 3,
    description = "Finish your opponent with Yuri's Neo Super Upper with the Max gauge bar",
    id = 120013, badge = "130467", published = "30/07/2020 23:29:19", modified = "30/07/2020 23:29:19",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && unless(game_players_active() != 1) && p1_active_character_in_game() == 10 &&
              p1_last_move() == 572 && p2_flag_ko() == 255
)

achievement(
    title = "GAUGE MAX 3 - Regal Blow", points = 3,
    description = "Finish your opponent with Ralf's Galactica Phantom with the Max gauge bar",
    id = 120014, badge = "130468", published = "30/07/2020 23:29:22", modified = "30/07/2020 23:29:22",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && unless(game_players_active() != 1) && p1_active_character_in_game() == 13 &&
              p1_last_move() == 561 && p2_flag_ko() == 255
)

achievement(
    title = "GAUGE MAX 4 - Vessels of 8 Elixirs", points = 3,
    description = "Finish your opponent with Iori's Style 1201 Maiden Masher with the Max gauge bar",
    id = 120015, badge = "130469", published = "30/07/2020 23:29:24", modified = "30/07/2020 23:29:24",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && unless(game_players_active() != 1) && p1_active_character_in_game() == 30 &&
              p1_last_move() == 564 && p2_flag_ko() == 255
)

achievement(
    title = "GAUGE MAX 5 - Reverse Major", points = 3,
    description = "Finish your opponent with Kyo's Style 108 Major Serpent Wave with the Max gauge bar",
    id = 120016, badge = "130470", published = "30/07/2020 23:29:26", modified = "30/07/2020 23:29:26",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && unless(game_players_active() != 1) && p1_active_character_in_game() == 28 &&
              p1_last_move() == 568 && p2_flag_ko() == 255
)

// =========================================
//                 Challenges              
// =========================================

achievement(
    title = "Without Assistance From the Fourth Fighter", points = 10, type="win_condition",
    description = "Finish the game without using Striker on default difficulty",
    id = 120041, badge = "130922", published = "30/07/2020 23:41:13", modified = "04/03/2025 23:02:57",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              never(game_mode() == 6) && unless(game_players_active() != 1) && p2_character() == 35 && game_stage() == 6 &&
              p1_rounds_won() > 0 && cutscene() > 0 && settings_striker_aes() <= 5 &&
              once(arcade_match_progression_flags() == 0 && round_timer() == 96 && p2_hp() == 102 && flag_animation_striker() == 0) &&
              never(flag_animation_striker() == 1) &&
              ((mvs_flag() == 0 && settings_difficulty_aes() >= 2) ||
               (mvs_flag() == 1 && soft_dip_difficulty() >= 3))
)

achievement(
    title = "Welcome to the Frozen World", points = 10,
    description = "Defeat Kula without losing anyone on the team",
    id = 120043, badge = "130927", published = "30/07/2020 23:41:20", modified = "30/07/2020 23:41:20",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              unless(game_players_active() != 1) && game_mode() == 1 && p2_character() == 34 && p1_rounds_won() > 0 &&
              unless(p2_rounds_won() != 0)
)

achievement(
    title = "Spare Me Little Boss", points = 10, type="win_condition",
    description = "Get a perfect against Zero in Team Play",
    id = 120042, badge = "130926", published = "30/07/2020 23:41:18", modified = "04/03/2025 23:04:47",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              unless(game_players_active() != 1) && game_mode() == 1 && p1_hp() == 102 && p2_character() == 35 &&
              game_stage() == 6 && p1_rounds_won() > 0
)

achievement(
    title = "The Path of a Warrior Alone", points = 10,
    description = "Finish Single Play mode on default difficulty",
    id = 120044, badge = "130929", published = "30/07/2020 23:41:24", modified = "30/07/2020 23:41:24",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              unless(game_players_active() != 1) && game_mode() == 0 && p2_character() == 35 && game_stage() == 6 &&
              p1_rounds_won() == 2 &&
              ((mvs_flag() == 0 && settings_difficulty_aes() >= 2) ||
               (mvs_flag() == 1 && soft_dip_difficulty() >= 3))
)

achievement(
    title = "My Second Name Is the King of Fights", points = 25, type="win_condition",
    description = "Finish Team Play using only one credit on default difficulty",
    id = 120045, badge = "130924", published = "30/07/2020 23:41:29", modified = "04/03/2025 23:02:35",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              unless(game_players_active() != 1) && game_mode() == 1 && p2_character() == 35 && game_stage() == 6 &&
              p1_rounds_won() > 0 && cutscene() > 0 &&
              once(arcade_match_progression_flags() == 0 && round_timer() == 96 && p2_hp() == 102 &&
                  arcade_match_progression_flags() == 0
              ) && never(p1_active_state() == 2) && never(p2_rounds_won() == 3) &&
              ((mvs_flag() == 0 && settings_difficulty_aes() >= 2) ||
               (mvs_flag() == 1 && soft_dip_difficulty() >= 3))
)

achievement(
    title = "Old Guard Player Is Hardcore", points = 25, type="win_condition",
    description = "Finish Team Play on the highest difficulty",
    id = 120046, badge = "130925", published = "30/07/2020 23:41:31", modified = "04/03/2025 23:02:16",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              unless(game_players_active() != 1) && game_mode() == 1 && p2_character() == 35 && game_stage() == 6 &&
              p1_rounds_won() > 0 && cutscene() > 0 &&
              ((mvs_flag() == 0 && settings_difficulty_aes() == 7) ||
               (mvs_flag() == 1 && soft_dip_difficulty() == 7))
)

achievement(
    title = "Ice Lady", points = 50,
    description = "Finish Single Play using only Kula without using strikers, Desperation Moves, Counter or Armor Mode mode on default difficulty",
    id = 120047, badge = "130931", published = "30/07/2020 23:41:33", modified = "30/07/2020 23:41:33",
    trigger = never(unibios() != 0) && unless(p1_active_state() != 1) && never(p2_active_state() != 0) &&
              unless(game_players_active() != 1) && 
              never(p1_active_character_in_game() != 34) && 
              game_mode() == 0 &&
              trigger_when(p2_character() == 35 && 
                           game_stage() == 6 && 
                           p1_rounds_won() == 2) &&
              once(arcade_match_progression_flags() == 0 && round_timer() == 96 && p2_hp() == 102 &&
                  arcade_match_progression_flags() == 0
              ) && 
              never(control() == 79) && 
              never(p1_last_move() == 547) && 
              never(p1_last_move() == 548) &&
              never(p1_last_move() == 549) && 
              never(flag_animation_striker() == 1) &&
              never(pow_bar_flags_armor_mode() > 0) && 
              never(pow_bar_flags_counter_mode() > 0) &&
              ((mvs_flag() == 0 && settings_difficulty_aes() >= 2) ||
               (mvs_flag() == 1 && soft_dip_difficulty() >= 3))
)

// =========================================
//               Leaderboards              
// =========================================

leaderboard(
    id = 9129, title = "HI-B.A Point",
    description = "Table of the best Ability Points",
    start  = game_players_active() == 1 && arcade_match_progression_flags() == 0 && round_timer() == 96,
    cancel = game_players_active() == 0,
    submit = p2_character() == 35 && game_stage() == 6 && p1_rounds_won() > 0 && cutscene() > 0,
    value  = high4(0x00ECD5) * 1000 + low4(0x00ECD5) * 100 + arcade_ba_points_16_bits_high4() * 10 + arcade_ba_points_16_bits_low4() * 1,
    format = "SCORE"
)
