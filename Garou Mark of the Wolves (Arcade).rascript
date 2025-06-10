// Garou: Mark of the Wolves
// #ID = 11752

function p1_character() => byte(0x000410)
function p1_command() => word(0x000460)
function lower4_displayed_message_while_in_game_just_defence_p1() => bit3(0x00047E)
function p1_guard_cancel_ffag() => byte(0x00048B)
function p1_hp() => byte(0x00048F)
function p1_command_flags_1() => byte(0x0004CA)
function p1_command_flags_2() => byte(0x0004CB)
function p1_command_flags_3_bit1() => bit1(0x0004CC)
function p1_command_flags_3_top_move() => bit5(0x0004CC)
function p1_command_flags_3() => byte(0x0004CC)
function p1_command_flags_4_super_p_ii() => bit6(0x0004CD)
function p1_command_flags_4_super_p_i() => bit7(0x0004CD)
function p1_command_flags_4() => byte(0x0004CD)
function p2_character() => byte(0x000510)
function p2_character_16bits() => word(0x000510)
function p2_hp() => byte(0x00058F)
function game_region_screen() => byte(0x0041D0)
function mvs_survival_mode_flag() => byte(0x0041D8)
function beaten_cpus_in_arcade_mode() => byte(0x0041DC)
function arcade_and_survival_ladder_fight() => byte(0x007438)
function ranks_granted() => byte(0x007475)
function p1_won_rounds() => byte(0x007476)
function p1_fighting_level() => byte(0x007521)
function survival_mode_timer_0x() => word(0x00A236)
function p1_combo_hit() => byte(0x00A39D)
function p1_score_00xx0000() => word(0x00E00C)
function p1_score_xx000000() => byte(0x00E00D)
function aes_configuration_difficulty() => byte(0x00E022)
function aes_configuration_round_set() => byte(0x00E024)
function aes_configuration_game_time() => byte(0x00E025)
function mvs_active_bitflag_bit7() => bit7(0x00FD83)
function soft_dip_setup_play_time_mvs() => byte(0x00FD89)
function soft_dip_setup_difficullty_mvs() => byte(0x00FD8C)
function soft_dip_setup_win_point_mvs() => byte(0x00FD90)
function p2_active_state() => byte(0x00FDB6)
function p1_active_state() => byte(0x00FDB7)
function unibios() => dword(0x00FE30)

achievement(
    title = "Bark of the Wolves", points = 10,
    description = "Defeat Grant in Story Mode on default settings",
    id = 59693, badge = "62845", published = "03/05/2018 03:44:55", modified = "18/12/2021 16:18:32",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && mvs_survival_mode_flag() == 0 &&
              trigger_when(arcade_and_survival_ladder_fight() == 7) && trigger_when(p2_character() == 12) &&
              trigger_when(p1_won_rounds() == 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_round_set() == 1 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_win_point_mvs() == 4 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Spread the Wings", points = 10, type="win_condition",
    description = "Defeat Kain and finish Story Mode using only Rock on default settings",
    id = 59694, badge = "62846", published = "03/05/2018 03:45:14", modified = "18/12/2021 16:18:32",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 1) &&
              mvs_survival_mode_flag() == 0 && trigger_when(arcade_and_survival_ladder_fight() == 8) &&
              trigger_when(p2_character() == 13) && trigger_when(p1_won_rounds() == 2) &&
              once(beaten_cpus_in_arcade_mode() == 0) && once(game_region_screen() == 15) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_round_set() == 1 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_win_point_mvs() == 4 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Sunrise on the Train", points = 10, type="win_condition",
    description = "Defeat Kain and finish Story Mode using only Terry on default settings",
    id = 59695, badge = "62847", published = "03/05/2018 03:45:29", modified = "18/12/2021 16:18:33",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 0) &&
              mvs_survival_mode_flag() == 0 && trigger_when(arcade_and_survival_ladder_fight() == 8) &&
              trigger_when(p2_character() == 13) && trigger_when(p1_won_rounds() == 2) &&
              once(beaten_cpus_in_arcade_mode() == 0) && once(game_region_screen() == 15) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_round_set() == 1 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_win_point_mvs() == 4 && soft_dip_setup_play_time_mvs() >= 60))
)

// Ticket 35477: Beaten the entire game using only Dong Hwan but it just refuses to pop.
achievement(
    title = "Loose Genius", points = 10, type="win_condition",
    description = "Defeat Kain and finish Story Mode using only Dong Hwan on default settings",
    id = 59696, badge = "62848", published = "03/05/2018 03:45:39", modified = "18/12/2021 16:18:33",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 2) &&
              mvs_survival_mode_flag() == 0 && trigger_when(arcade_and_survival_ladder_fight() == 8) &&
              trigger_when(p2_character() == 13) && trigger_when(p1_won_rounds() == 2) &&
              once(beaten_cpus_in_arcade_mode() == 0) && once(game_region_screen() == 15) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_round_set() == 1 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_win_point_mvs() == 4 && soft_dip_setup_play_time_mvs() >= 60))
)

// Ticket 35506: I've beaten the game using only Jae Hoon but the achievement will not pop.
achievement(
    title = "Too Honest", points = 10, type="win_condition",
    description = "Defeat Kain and finish Story Mode using only Jae Hoon on default settings",
    id = 59697, badge = "62849", published = "03/05/2018 03:45:51", modified = "18/12/2021 16:18:34",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 3) &&
              mvs_survival_mode_flag() == 0 && trigger_when(arcade_and_survival_ladder_fight() == 8) &&
              trigger_when(p2_character() == 13) && trigger_when(p1_won_rounds() == 2) &&
              once(beaten_cpus_in_arcade_mode() == 0) && once(game_region_screen() == 15) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_round_set() == 1 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_win_point_mvs() == 4 && soft_dip_setup_play_time_mvs() >= 60))
)

// Ticket 35525: I've beaten the entire game using only Hotaru but the achievement will not trigger.
achievement(
    title = "Fullmoon - Heartful ", points = 10, type="win_condition",
    description = "Defeat Kain and finish Story Mode using only Hotaru on default settings",
    id = 59698, badge = "62850", published = "03/05/2018 03:45:57", modified = "18/12/2021 16:18:34",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 4) &&
              mvs_survival_mode_flag() == 0 && trigger_when(arcade_and_survival_ladder_fight() == 8) &&
              trigger_when(p2_character() == 13) && trigger_when(p1_won_rounds() == 2) &&
              once(beaten_cpus_in_arcade_mode() == 0) && once(game_region_screen() == 15) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_round_set() == 1 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_win_point_mvs() == 4 && soft_dip_setup_play_time_mvs() >= 60))
)

// Ticket 35526: I've beaten the entire game using only Gato but the achievement will not trigger.
achievement(
    title = "Heartful - A Groan", points = 10, type="win_condition",
    description = "Defeat Kain and finish Story Mode using only Gato on default settings",
    id = 59699, badge = "62851", published = "03/05/2018 03:46:04", modified = "18/12/2021 16:18:35",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 5) &&
              mvs_survival_mode_flag() == 0 && trigger_when(arcade_and_survival_ladder_fight() == 8) &&
              trigger_when(p2_character() == 13) && trigger_when(p1_won_rounds() == 2) &&
              once(beaten_cpus_in_arcade_mode() == 0) && once(game_region_screen() == 15) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_round_set() == 1 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_win_point_mvs() == 4 && soft_dip_setup_play_time_mvs() >= 60))
)

// Ticket 71742: I beat the game with Butt only but the achievement didn't trigger
achievement(
    title = "From Brazil", points = 10, type="win_condition",
    description = "Defeat Kain and finish Story Mode using only Marco/Butt on default settings",
    id = 59700, badge = "62852", published = "03/05/2018 03:46:12", modified = "18/12/2021 16:18:36",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 7) &&
              mvs_survival_mode_flag() == 0 && trigger_when(arcade_and_survival_ladder_fight() == 8) &&
              trigger_when(p2_character() == 13) && trigger_when(p1_won_rounds() == 2) &&
              once(beaten_cpus_in_arcade_mode() == 0) && once(game_region_screen() == 15) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_round_set() == 1 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_win_point_mvs() == 4 && soft_dip_setup_play_time_mvs() >= 60))
)

// Ticket 35485: I've beaten the game with B. Jenet but the achievement just refuses to pop.
achievement(
    title = "Bad Girl?", points = 10, type="win_condition",
    description = " Defeat Kain and finish Story Mode using only B. Jenet on default settings",
    id = 59701, badge = "62853", published = "03/05/2018 03:46:19", modified = "18/12/2021 16:18:36",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 6) &&
              mvs_survival_mode_flag() == 0 && trigger_when(arcade_and_survival_ladder_fight() == 8) &&
              trigger_when(p2_character() == 13) && trigger_when(p1_won_rounds() == 2) &&
              once(beaten_cpus_in_arcade_mode() == 0) && once(game_region_screen() == 15) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_round_set() == 1 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_win_point_mvs() == 4 && soft_dip_setup_play_time_mvs() >= 60))
)

// Ticket 35524: I've beaten the game as Hokutomaru but the achievement will just not trigger at all.
achievement(
    title = "Ninja? Or Monkey?", points = 10, type="win_condition",
    description = "Defeat Kain and finish Story Mode using only Hokutomaru on default settings",
    id = 59702, badge = "62854", published = "03/05/2018 03:46:29", modified = "18/12/2021 16:18:37",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 8) &&
              mvs_survival_mode_flag() == 0 && trigger_when(arcade_and_survival_ladder_fight() == 8) &&
              trigger_when(p2_character() == 13) && trigger_when(p1_won_rounds() == 2) &&
              once(beaten_cpus_in_arcade_mode() == 0) && once(game_region_screen() == 15) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_round_set() == 1 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_win_point_mvs() == 4 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "All Over with Blood", points = 10, type="win_condition",
    description = "Defeat Kain and finish Story Mode using only Freeman on default settings",
    id = 59703, badge = "62827", published = "03/05/2018 03:47:33", modified = "18/12/2021 16:18:37",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 9) &&
              mvs_survival_mode_flag() == 0 && trigger_when(arcade_and_survival_ladder_fight() == 8) &&
              trigger_when(p2_character() == 13) && trigger_when(p1_won_rounds() == 2) &&
              once(beaten_cpus_in_arcade_mode() == 0) && once(game_region_screen() == 15) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_round_set() == 1 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_win_point_mvs() == 4 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Invincible Mask", points = 10, type="win_condition",
    description = "Defeat Kain and finish Story Mode using only The Griffon/Tizoc on default settings",
    id = 59704, badge = "62828", published = "03/05/2018 03:47:41", modified = "18/12/2021 16:18:38",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 10) &&
              mvs_survival_mode_flag() == 0 && trigger_when(arcade_and_survival_ladder_fight() == 8) &&
              trigger_when(p2_character() == 13) && trigger_when(p1_won_rounds() == 2) &&
              once(beaten_cpus_in_arcade_mode() == 0) && once(game_region_screen() == 15) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_round_set() == 1 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_win_point_mvs() == 4 && soft_dip_setup_play_time_mvs() >= 60))
)

// Ticket 35484: I've beaten the entire game using only Kevin, yet this achievement will not pop.
achievement(
    title = "Wilderness Policeman", points = 10, type="win_condition",
    description = "Defeat Kain and finish Story Mode using only Kevin on default settings",
    id = 59705, badge = "62826", published = "03/05/2018 03:47:46", modified = "18/12/2021 16:18:38",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 11) &&
              mvs_survival_mode_flag() == 0 && trigger_when(arcade_and_survival_ladder_fight() == 8) &&
              trigger_when(p2_character() == 13) && trigger_when(p1_won_rounds() == 2) &&
              once(beaten_cpus_in_arcade_mode() == 0) && once(game_region_screen() == 15) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_round_set() == 1 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_win_point_mvs() == 4 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Destruction Maniac", points = 10, type="win_condition",
    description = "Defeat Kain and finish Story Mode using only Grant on default settings",
    id = 59706, badge = "62829", published = "03/05/2018 03:47:58", modified = "18/12/2021 16:18:39",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 12) &&
              mvs_survival_mode_flag() == 0 && trigger_when(arcade_and_survival_ladder_fight() == 8) &&
              trigger_when(p2_character() == 13) && trigger_when(p1_won_rounds() == 2) &&
              once(beaten_cpus_in_arcade_mode() == 0) && once(game_region_screen() == 15) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_round_set() == 1 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_win_point_mvs() == 4 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Dignity Palace", points = 10, type="win_condition",
    description = "Defeat Kain and finish Story Mode using only Kain on default settings",
    id = 59707, badge = "62830", published = "03/05/2018 03:48:02", modified = "18/12/2021 16:18:39",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 13) &&
              mvs_survival_mode_flag() == 0 && trigger_when(arcade_and_survival_ladder_fight() == 8) &&
              trigger_when(p2_character() == 13) && trigger_when(p1_won_rounds() == 2) &&
              once(beaten_cpus_in_arcade_mode() == 0) && once(game_region_screen() == 15) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_round_set() == 1 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_win_point_mvs() == 4 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Garou Mark of the Wolves 1CC", points = 25,
    description = "Defeat Kain and finish Story Mode without using any continues on default settings",
    id = 59708, badge = "62825", published = "03/05/2018 03:48:14", modified = "18/12/2021 16:18:40",
    trigger = never(unibios() != 0) && never(p1_active_state() != 1) && mvs_survival_mode_flag() == 0 &&
              trigger_when(arcade_and_survival_ladder_fight() == 8) && trigger_when(p2_character() == 13) &&
              trigger_when(p1_won_rounds() == 2) && once(beaten_cpus_in_arcade_mode() == 0) &&
              once(game_region_screen() == 15) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_round_set() == 1 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_win_point_mvs() == 4 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Hmph... Pathetic...", points = 1,
    description = "Use all of Rock's taunts in one playthrough",
    id = 59709, badge = "62855", published = "03/05/2018 03:48:27", modified = "20/11/2020 00:27:24",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 1) &&
              once(p1_command() == 512) && once(p1_won_rounds() > 0 && p1_command() == 561) &&
              once(p1_won_rounds() > 0 && p1_command() == 562) && never(p2_active_state() != 0)
)

achievement(
    title = "Good Going!", points = 1,
    description = "Use all of Terry's taunts in one playthrough",
    id = 59710, badge = "62856", published = "03/05/2018 03:48:35", modified = "20/11/2020 00:14:47",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 0) &&
              once(p1_command() == 512) && once(p1_won_rounds() > 0 && p1_command() == 561) &&
              once(p1_won_rounds() > 0 && p1_command() == 562) && never(p2_active_state() != 0)
)

achievement(
    title = "You're Tired of Losing, Huh?!", points = 1,
    description = "Use all of Dong Hwan's taunts in one playthrough",
    id = 59711, badge = "62857", published = "03/05/2018 03:48:41", modified = "21/11/2020 19:44:58",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 2) &&
              once(p1_command() == 512) && once(p1_won_rounds() > 0 && p1_command() == 561) &&
              once(p1_won_rounds() > 0 && p1_command() == 562) && never(p2_active_state() != 0)
)

achievement(
    title = "How's This!", points = 1,
    description = "Use all of Jae Hoon's taunts in one playthrough",
    id = 59712, badge = "62858", published = "03/05/2018 03:48:44", modified = "21/11/2020 19:47:45",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 3) &&
              once(p1_command() == 512) && once(p1_won_rounds() > 0 && p1_command() == 561) &&
              once(p1_won_rounds() > 0 && p1_command() == 562) && never(p2_active_state() != 0)
)

achievement(
    title = "I Must Do My Best", points = 1,
    description = "Use all of Hotaru's taunts in one playthrough",
    id = 59713, badge = "62859", published = "03/05/2018 03:48:46", modified = "21/11/2020 20:10:12",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 4) &&
              once(p1_command() == 512) && once(p1_won_rounds() > 0 && p1_command() == 561) &&
              once(p1_won_rounds() > 0 && p1_command() == 562) && never(p2_active_state() != 0)
)

achievement(
    title = "You're an Uninteresting Person!", points = 1,
    description = "Use all of Gato's taunts in one playthrough",
    id = 59714, badge = "62860", published = "03/05/2018 03:48:48", modified = "21/11/2020 20:10:15",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 5) &&
              once(p1_command() == 512) && once(p1_won_rounds() > 0 && p1_command() == 561) &&
              once(p1_won_rounds() > 0 && p1_command() == 562) && never(p2_active_state() != 0)
)

achievement(
    title = "Non, Non!", points = 1,
    description = "Use all of B. Jenet's taunts in one playthrough",
    id = 59715, badge = "62861", published = "03/05/2018 03:48:50", modified = "21/11/2020 20:10:22",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 6) &&
              once(p1_command() == 512) && once(p1_won_rounds() > 0 && p1_command() == 561) &&
              once(p1_won_rounds() > 0 && p1_command() == 562) && never(p2_active_state() != 0)
)

achievement(
    title = "Don't Screw Around!", points = 1,
    description = "Use all of Marco/Butt's taunts in one playthrough",
    id = 59716, badge = "62862", published = "03/05/2018 03:48:53", modified = "21/11/2020 20:10:55",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 7) &&
              once(p1_command() == 512) && once(p1_won_rounds() > 0 && p1_command() == 561) &&
              once(p1_won_rounds() > 0 && p1_command() == 562) && never(p2_active_state() != 0)
)

achievement(
    title = "I Won!", points = 1,
    description = "Use all of Hokutomaru's taunts in one playthrough",
    id = 59717, badge = "62863", published = "03/05/2018 03:48:56", modified = "21/11/2020 20:15:37",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 8) &&
              once(p1_command() == 512) && once(p1_won_rounds() > 0 && p1_command() == 695) &&
              once(p1_won_rounds() > 0 && p1_command() == 534) && never(p2_active_state() != 0)
)

achievement(
    title = "Die Right Now...!", points = 1,
    description = "Use all of Freeman's taunts in one playthrough",
    id = 59718, badge = "62864", published = "03/05/2018 03:48:59", modified = "21/11/2020 20:27:34",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 9) &&
              once(p1_command() == 512) && once(p1_won_rounds() > 0 && p1_command() == 561) &&
              once(p1_won_rounds() > 0 && p1_command() == 562) && never(p2_active_state() != 0)
)

achievement(
    title = "Look at These Abdominal Muscles!", points = 1,
    description = "Use all of The Griffon/Tizoc's taunts in one playthrough",
    id = 59719, badge = "62867", published = "03/05/2018 03:49:01", modified = "21/11/2020 20:27:51",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 10) &&
              once(p1_command() == 512) && once(p1_won_rounds() > 0 && p1_command() == 561) &&
              once(p1_won_rounds() > 0 && p1_command() == 562) && never(p2_active_state() != 0)
)

achievement(
    title = "Aim Correctly!", points = 1,
    description = "Use all of Kevin's taunts in one playthrough",
    id = 59720, badge = "62866", published = "03/05/2018 03:49:03", modified = "21/11/2020 20:27:47",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 11) &&
              once(p1_command() == 512) && once(p1_won_rounds() > 0 && p1_command() == 561) &&
              once(p1_won_rounds() > 0 && p1_command() == 562) && never(p2_active_state() != 0)
)

achievement(
    title = "You Cannot Beat Me!", points = 1,
    description = "Use all of Grant's taunts in one playthrough",
    id = 59721, badge = "62865", published = "03/05/2018 03:49:05", modified = "21/11/2020 20:27:45",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 12) &&
              once(p1_command() == 512) && once(p1_won_rounds() > 0 && p1_command() == 561) &&
              once(p1_won_rounds() > 0 && p1_command() == 562) && never(p2_active_state() != 0)
)

achievement(
    title = "You Seemed to Have Dreamed Too Much...", points = 1,
    description = "Use all of Kain's taunts in one playthrough",
    id = 59722, badge = "62868", published = "03/05/2018 03:49:09", modified = "21/11/2020 20:27:41",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && never(p1_character() != 13) &&
              once(p1_command() == 512) && once(p1_won_rounds() > 0 && p1_command() == 561) &&
              once(p1_won_rounds() > 0 && p1_command() == 562) && never(p2_active_state() != 0)
)

achievement(
    title = "Rasetsu Raging Knuckle Rage", points = 10,
    description = "Use Rock's T.O.P. attack and all Potential Powers in one playthrough",
    id = 59723, badge = "62869", published = "03/05/2018 03:49:27", modified = "21/11/2020 21:57:45",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_state() == 0) &&
              once(p1_command_flags_4_super_p_i() > 0) && once(p1_command_flags_4_super_p_ii() > 0) &&
              once(p1_command_flags_3_top_move() > 0) && unless(p1_combo_hit() == 0) && never(p1_character() != 1)
)

achievement(
    title = "MAX Power Wolf", points = 10,
    description = "Use Terry's T.O.P. attack and all Potential Powers in one playthrough",
    id = 59724, badge = "62870", published = "03/05/2018 03:49:29", modified = "21/11/2020 21:57:56",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_state() == 0) &&
              once(p1_command_flags_4_super_p_i() > 0) && once(p1_command_flags_4_super_p_ii() > 0) &&
              once(p1_command_flags_3_top_move() > 0) && unless(p1_combo_hit() == 0) && never(p1_character() != 0)
)

achievement(
    title = "Kaiten Super Dan", points = 10,
    description = "Use Dong Hwan's T.O.P. attack and all Potential Powers in one playthrough",
    id = 59725, badge = "62871", published = "03/05/2018 03:49:31", modified = "21/11/2020 22:02:52",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_state() == 0) &&
              once(p1_command_flags_4_super_p_i() > 0) && once(p1_command_flags_4_super_p_ii() > 0) &&
              once(p1_command_flags_3_top_move() > 0) && unless(p1_combo_hit() == 0) && never(p1_character() != 2)
)

achievement(
    title = "High-Angle Ten-Ou Kyaku", points = 10,
    description = "Use Jae Hoon's T.O.P. attack and all Potential Powers in one playthrough",
    id = 59726, badge = "62872", published = "03/05/2018 03:49:32", modified = "21/11/2020 22:07:21",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_state() == 0) &&
              once(p1_command_flags_4_super_p_i() > 0) && once(p1_command_flags_4_super_p_ii() > 0) &&
              once(p1_command_flags_3_top_move() > 0) && unless(p1_combo_hit() == 0) && never(p1_character() != 3)
)

achievement(
    title = "Sen-Kai Ten-Shou Ten-Ren-Ge", points = 10,
    description = "Use Hotaru's T.O.P. attack and all Potential Powers in one playthrough",
    id = 59727, badge = "62873", published = "03/05/2018 03:49:34", modified = "21/11/2020 22:11:55",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_state() == 0) &&
              once(p1_command_flags_4_super_p_i() > 0) && once(p1_command_flags_4_super_p_ii() > 0) &&
              once(p1_command_flags_3_top_move() > 0) && unless(p1_combo_hit() == 0) && never(p1_character() != 4)
)

achievement(
    title = "Mou-Ko Zero Tatsu Retsu-Kiba", points = 10,
    description = "Use Gato's T.O.P. attack and all Potential Powers in one playthrough",
    id = 59728, badge = "62874", published = "03/05/2018 03:49:36", modified = "21/11/2020 22:15:59",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_state() == 0) &&
              once(p1_command_flags_4_super_p_i() > 0) && once(p1_command_flags_4_super_p_ii() > 0) &&
              once(p1_command_flags_3_top_move() > 0) && unless(p1_combo_hit() == 0) && never(p1_character() != 5)
)

achievement(
    title = "Rolling Many Many Aurora", points = 10,
    description = "Use B. Jenet's T.O.P. attack and all Potential Powers in one playthrough",
    id = 59729, badge = "62875", published = "03/05/2018 03:49:38", modified = "21/11/2020 22:18:22",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_state() == 0) &&
              once(p1_command_flags_4_super_p_i() > 0) && once(p1_command_flags_4_super_p_ii() > 0) &&
              once(p1_command_flags_3_top_move() > 0) && unless(p1_combo_hit() == 0) && never(p1_character() != 6)
)

achievement(
    title = "Zan-Retsu Kyokugen Shoukou Ken Ranbu", points = 10,
    description = "Use Marco/Butt's T.O.P. attack and all Potential Powers in one playthrough",
    id = 59730, badge = "62876", published = "03/05/2018 03:49:40", modified = "21/11/2020 22:20:24",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_state() == 0) &&
              once(p1_command_flags_4_super_p_i() > 0) && once(p1_command_flags_4_super_p_ii() > 0) &&
              once(p1_command_flags_3_top_move() > 0) && unless(p1_combo_hit() == 0) && never(p1_character() != 7)
)

achievement(
    title = "Nin-pou Chou Hissatsu Tatsumaki", points = 10,
    description = "Use Hokutomaru's T.O.P. attack and all Potential Powers in one playthrough",
    id = 59731, badge = "62877", published = "03/05/2018 03:49:42", modified = "21/11/2020 22:22:08",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_state() == 0) &&
              once(p1_command_flags_4_super_p_i() > 0) && once(p1_command_flags_4_super_p_ii() > 0) &&
              once(p1_command_flags_3_top_move() > 0) && unless(p1_combo_hit() == 0) && never(p1_character() != 8)
)

// Ticket 80794: Achievement randomly triggered during a fight against B.Jenet. I had connected with the qcf,qcf+C
//               before but I had never even used with the qcf,qcf+D and I'm not even sure that I had actually
//               connected with the T.O.P. at that point.
achievement(
    title = "Overkill Full Death", points = 10,
    description = "Use Freeman's T.O.P. attack and all Potential Powers in one playthrough",
    id = 59732, badge = "62878", published = "03/05/2018 03:49:44", modified = "09/12/2024 19:16:36",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_state() == 0) &&
              once(p1_combo_hit() > prev(p1_combo_hit()) && p1_command_flags_4_super_p_i() == 1) &&
              once(p1_combo_hit() > prev(p1_combo_hit()) && p1_command_flags_3_top_move() == 1) &&
              once(p1_combo_hit() > prev(p1_combo_hit()) && p1_command_flags_3_bit1() == 1) &&
              never(p1_character() != 9)
)

achievement(
    title = "Gri-Dro Big Fall Attack", points = 10,
    description = "Use The Griffon/Tizoc's T.O.P. attack and all Potential Powers in one playthrough",
    id = 59733, badge = "62879", published = "03/05/2018 03:49:48", modified = "21/11/2020 22:34:22",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_state() == 0) &&
              once(p2_hp() < prev(p2_hp()) && p1_command_flags_4_super_p_i() > 0) &&
              once(p1_combo_hit() > 0 && p1_command_flags_4_super_p_ii() > 0) &&
              once(p1_combo_hit() > 0 && p1_command_flags_3_top_move() > 0) && never(p1_character() != 10)
)

achievement(
    title = "Blast Lucky Freezer", points = 10,
    description = "Use Kevin's T.O.P. attack and all Potential Powers in one playthrough",
    id = 59734, badge = "62880", published = "03/05/2018 03:49:50", modified = "21/11/2020 22:37:49",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_state() == 0) &&
              once(p1_command_flags_4_super_p_i() > 0) && once(p1_command_flags_4_super_p_ii() > 0) &&
              once(p1_command_flags_3_top_move() > 0) && unless(p1_combo_hit() == 0) && never(p1_character() != 11)
)

achievement(
    title = "Majin Gan-Haten-Engetsu", points = 10,
    description = "Use Grant's T.O.P. attack and all Potential Powers in one playthrough",
    id = 59735, badge = "62881", published = "03/05/2018 03:49:54", modified = "21/11/2020 22:39:16",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_state() == 0) &&
              once(p1_command_flags_4_super_p_i() > 0) && once(p1_command_flags_4_super_p_ii() > 0) &&
              once(p1_command_flags_3_top_move() > 0) && unless(p1_combo_hit() == 0) && never(p1_character() != 12)
)

achievement(
    title = "Schwarzer Himmlischer Seele", points = 10,
    description = "Use Kain's T.O.P. attack and all Potential Powers in one playthrough",
    id = 59736, badge = "62882", published = "03/05/2018 03:49:58", modified = "21/11/2020 22:43:07",
    trigger = never(unibios() != 0) && never(p2_active_state() != 0) && never(p1_active_state() == 0) &&
              once(p1_command_flags_4_super_p_i() > 0) && once(p1_command_flags_4_super_p_ii() > 0) &&
              once(p1_command_flags_3_top_move() > 0) && p1_combo_hit() > 0 && never(p1_character() != 13)
)

achievement(
    title = "I Guess I Was Just Born to Be Wild!", points = 10,
    description = "Defeat 7 opponents in Survival Mode as Rock on the default round time setting",
    id = 59737, badge = "62883", published = "03/05/2018 03:50:32", modified = "28/05/2021 16:26:35",
    trigger = never(unibios() != 0) && arcade_and_survival_ladder_fight() == 8 && unless(mvs_survival_mode_flag() != 1) &&
              never(p1_character() != 1) && never(p2_active_state() != 0) && never(game_region_screen() == 26) &&
              never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Disappointment Sprung Me to True Might!", points = 10,
    description = "Defeat 7 opponents in Survival Mode as Terry on the default round time setting",
    id = 59738, badge = "62884", published = "03/05/2018 03:50:34", modified = "28/05/2021 16:26:35",
    trigger = never(unibios() != 0) && arcade_and_survival_ladder_fight() == 8 && unless(mvs_survival_mode_flag() != 1) &&
              never(p1_character() != 0) && never(p2_active_state() != 0) && never(game_region_screen() == 26) &&
              never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "A Taekwondo God Stands Before You, Punk!", points = 10,
    description = "Defeat 7 opponents in Survival Mode as Dong Hwan on the default round time setting",
    id = 59739, badge = "62885", published = "03/05/2018 03:50:36", modified = "28/05/2021 16:26:36",
    trigger = never(unibios() != 0) && arcade_and_survival_ladder_fight() == 8 && unless(mvs_survival_mode_flag() != 1) &&
              never(p1_character() != 2) && never(p2_active_state() != 0) && never(game_region_screen() == 26) &&
              never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Glad to Meet You, Wimp!", points = 10,
    description = "Defeat 7 opponents in Survival Mode as Jae Hoon on the default round time setting",
    id = 59740, badge = "62886", published = "03/05/2018 03:50:38", modified = "28/05/2021 16:26:36",
    trigger = never(unibios() != 0) && arcade_and_survival_ladder_fight() == 8 && unless(mvs_survival_mode_flag() != 1) &&
              never(p1_character() != 3) && never(p2_active_state() != 0) && never(game_region_screen() == 26) &&
              never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "I'm a Real Fighter, Aren't I?", points = 10,
    description = "Defeat 7 opponents in Survival Mode as Hotaru on the default round time setting",
    id = 59741, badge = "62887", published = "03/05/2018 03:50:40", modified = "28/05/2021 16:26:37",
    trigger = never(unibios() != 0) && arcade_and_survival_ladder_fight() == 8 && unless(mvs_survival_mode_flag() != 1) &&
              never(p1_character() != 4) && never(p2_active_state() != 0) && never(game_region_screen() == 26) &&
              never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "That Was Scary. Not!", points = 10,
    description = "Defeat 7 opponents in Survival Mode as Gato on the default round time setting",
    id = 59742, badge = "62888", published = "03/05/2018 03:50:42", modified = "28/05/2021 16:26:37",
    trigger = never(unibios() != 0) && arcade_and_survival_ladder_fight() == 8 && unless(mvs_survival_mode_flag() != 1) &&
              never(p1_character() != 5) && never(p2_active_state() != 0) && never(game_region_screen() == 26) &&
              never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "That Was Easy!", points = 10,
    description = "Defeat 7 opponents in Survival Mode as B. Jenet on the default round time setting",
    id = 59743, badge = "62889", published = "03/05/2018 03:50:44", modified = "28/05/2021 16:26:38",
    trigger = never(unibios() != 0) && arcade_and_survival_ladder_fight() == 8 && unless(mvs_survival_mode_flag() != 1) &&
              never(p1_character() != 6) && never(p2_active_state() != 0) && never(game_region_screen() == 26) &&
              never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "This is Kyokugen Karate!", points = 10,
    description = "Defeat 7 opponents in Survival Mode as Marco/Butt on the default round time setting",
    id = 59744, badge = "62890", published = "03/05/2018 03:50:46", modified = "28/05/2021 16:26:38",
    trigger = never(unibios() != 0) && arcade_and_survival_ladder_fight() == 8 && unless(mvs_survival_mode_flag() != 1) &&
              never(p1_character() != 7) && never(p2_active_state() != 0) && never(game_region_screen() == 26) &&
              never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Master'd Be Proud of Me Today", points = 10,
    description = "Defeat 7 opponents in Survival Mode as Hokutomaru on the default round time setting",
    id = 59745, badge = "62891", published = "03/05/2018 03:50:48", modified = "28/05/2021 16:26:39",
    trigger = never(unibios() != 0) && arcade_and_survival_ladder_fight() == 8 && unless(mvs_survival_mode_flag() != 1) &&
              never(p1_character() != 8) && never(p2_active_state() != 0) && never(game_region_screen() == 26) &&
              never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Welcome... This Nightmare!", points = 10,
    description = "Defeat 7 opponents in Survival Mode as Freeman on the default round time setting",
    id = 59746, badge = "62892", published = "03/05/2018 03:50:51", modified = "28/05/2021 16:26:39",
    trigger = never(unibios() != 0) && arcade_and_survival_ladder_fight() == 8 && unless(mvs_survival_mode_flag() != 1) &&
              never(p1_character() != 9) && never(p2_active_state() != 0) && never(game_region_screen() == 26) &&
              never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "No Choice Only to Give Up!", points = 10,
    description = "Defeat 7 opponents in Survival Mode as The Griffon/Tizoc on the default round time setting",
    id = 59747, badge = "62894", published = "03/05/2018 03:50:57", modified = "28/05/2021 16:26:39",
    trigger = never(unibios() != 0) && arcade_and_survival_ladder_fight() == 8 && unless(mvs_survival_mode_flag() != 1) &&
              never(p1_character() != 10) && never(p2_active_state() != 0) && never(game_region_screen() == 26) &&
              never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "You Should Take Up Gardening, You Wimp!", points = 10,
    description = "Defeat 7 opponents in Survival Mode as Kevin on the default round time setting",
    id = 59748, badge = "62895", published = "03/05/2018 03:51:03", modified = "28/05/2021 16:26:40",
    trigger = never(unibios() != 0) && arcade_and_survival_ladder_fight() == 8 && never(p1_character() != 11) &&
              unless(mvs_survival_mode_flag() != 1) && never(p2_active_state() != 0) &&
              never(game_region_screen() == 26) && never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Death Is Your Punishment", points = 10,
    description = "Defeat 7 opponents in Survival Mode as Grant on the default round time setting",
    id = 59749, badge = "62896", published = "03/05/2018 03:51:05", modified = "28/05/2021 16:26:40",
    trigger = never(unibios() != 0) && arcade_and_survival_ladder_fight() == 8 && unless(mvs_survival_mode_flag() != 1) &&
              never(p1_character() != 12) && never(p2_active_state() != 0) && never(game_region_screen() == 26) &&
              never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "You'll Never Know the Truth of Victory", points = 10,
    description = "Defeat 7 opponents in Survival Mode as Kain on the default round time setting",
    id = 59750, badge = "62897", published = "03/05/2018 03:51:07", modified = "28/05/2021 16:26:41",
    trigger = never(unibios() != 0) && arcade_and_survival_ladder_fight() == 8 && unless(mvs_survival_mode_flag() != 1) &&
              never(p1_character() != 13) && never(p2_active_state() != 0) && never(game_region_screen() == 26) &&
              never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Uwaaaaaaaa!", points = 5,
    description = "Get a Perfect against Rock on default settings",
    id = 59751, badge = "62831", published = "03/05/2018 03:51:11", modified = "21/06/2021 13:47:32",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && unless(p2_active_state() != 0) &&
              unless(mvs_survival_mode_flag() == 2) && unless(mvs_survival_mode_flag() == 3) &&
              trigger_when(p1_won_rounds() > prev(p1_won_rounds())) && unless(p2_character() != 1) &&
              unless(p1_hp() != 120) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Uwaaaaaaaa!!", points = 5,
    description = "Get a Perfect against Terry on default settings",
    id = 59752, badge = "62832", published = "03/05/2018 03:51:14", modified = "21/06/2021 13:47:33",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && unless(p2_active_state() != 0) &&
              unless(mvs_survival_mode_flag() == 2) && unless(mvs_survival_mode_flag() == 3) &&
              trigger_when(p1_won_rounds() > prev(p1_won_rounds())) && unless(p2_character() != 0) &&
              unless(p1_hp() != 120) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Sonnan Ari Kayooo!!", points = 5,
    description = "Get a Perfect against Dong Hwan on default settings",
    id = 59753, badge = "62833", published = "03/05/2018 03:51:15", modified = "21/06/2021 13:47:33",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && unless(p2_active_state() != 0) &&
              unless(mvs_survival_mode_flag() == 2) && unless(mvs_survival_mode_flag() == 3) &&
              trigger_when(p1_won_rounds() > prev(p1_won_rounds())) && unless(p2_character() != 2) &&
              unless(p1_hp() != 120) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Mairimashtaaa!", points = 5,
    description = "Get a Perfect against Jae Hoon on default settings",
    id = 59754, badge = "62834", published = "03/05/2018 03:51:17", modified = "21/06/2021 13:47:34",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && unless(p2_active_state() != 0) &&
              unless(mvs_survival_mode_flag() == 2) && unless(mvs_survival_mode_flag() == 3) &&
              trigger_when(p1_won_rounds() > prev(p1_won_rounds())) && unless(p2_character() != 3) &&
              unless(p1_hp() != 120) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Onichaaaaaann!", points = 5,
    description = "Get a Perfect against Hotaru on default settings",
    id = 59755, badge = "62835", published = "03/05/2018 03:51:20", modified = "21/06/2021 13:47:34",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && unless(p2_active_state() != 0) &&
              unless(mvs_survival_mode_flag() == 2) && unless(mvs_survival_mode_flag() == 3) &&
              trigger_when(p1_won_rounds() > prev(p1_won_rounds())) && unless(p2_character() != 4) &&
              unless(p1_hp() != 120) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Aitsu wo Taosu Madewaaa!", points = 5,
    description = "Get a Perfect against Gato on default settings",
    id = 59756, badge = "62836", published = "03/05/2018 03:51:22", modified = "21/06/2021 13:47:35",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && unless(p2_active_state() != 0) &&
              unless(mvs_survival_mode_flag() == 2) && unless(mvs_survival_mode_flag() == 3) &&
              trigger_when(p1_won_rounds() > prev(p1_won_rounds())) && unless(p2_character() != 5) &&
              unless(p1_hp() != 120) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Zen-in Tetaiii!", points = 5,
    description = "Get a Perfect against B. Jenet on default settings",
    id = 59757, badge = "62837", published = "03/05/2018 03:51:23", modified = "21/06/2021 13:47:35",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && unless(p2_active_state() != 0) &&
              unless(mvs_survival_mode_flag() == 2) && unless(mvs_survival_mode_flag() == 3) &&
              trigger_when(p1_won_rounds() > prev(p1_won_rounds())) && unless(p2_character() != 6) &&
              unless(p1_hp() != 120) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Shishouuu!", points = 5,
    description = "Get a Perfect against Marco/Butt on default settings",
    id = 59758, badge = "62838", published = "03/05/2018 03:51:25", modified = "21/06/2021 13:47:36",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && unless(p2_active_state() != 0) &&
              unless(mvs_survival_mode_flag() == 2) && unless(mvs_survival_mode_flag() == 3) &&
              trigger_when(p1_won_rounds() > prev(p1_won_rounds())) && unless(p2_character() != 7) &&
              unless(p1_hp() != 120) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Makechatta Yooo!", points = 5,
    description = "Get a Perfect against Hokutomaru on default settings",
    id = 59759, badge = "62839", published = "03/05/2018 03:51:27", modified = "21/06/2021 13:47:36",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && unless(p2_active_state() != 0) &&
              unless(mvs_survival_mode_flag() == 2) && unless(mvs_survival_mode_flag() == 3) &&
              trigger_when(p1_won_rounds() > prev(p1_won_rounds())) && unless(p2_character() != 8) &&
              unless(p1_hp() != 120) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Ushaaaaoooo!", points = 5,
    description = "Get a Perfect against Freeman on default settings",
    id = 59760, badge = "62840", published = "03/05/2018 03:51:29", modified = "21/06/2021 13:47:37",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && unless(p2_active_state() != 0) &&
              unless(mvs_survival_mode_flag() == 2) && unless(mvs_survival_mode_flag() == 3) &&
              trigger_when(p1_won_rounds() > prev(p1_won_rounds())) && unless(p2_character() != 9) &&
              unless(p1_hp() != 120) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Kodomo-tachi yo, Sumanuuu!", points = 5,
    description = "Get a Perfect against The Griffon/Tizoc on default settings",
    id = 59761, badge = "62841", published = "03/05/2018 03:51:31", modified = "21/06/2021 13:47:38",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && unless(p2_active_state() != 0) &&
              unless(mvs_survival_mode_flag() == 2) && unless(mvs_survival_mode_flag() == 3) &&
              trigger_when(p1_won_rounds() > prev(p1_won_rounds())) && unless(p2_character() != 10) &&
              unless(p1_hp() != 120) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Tobidazeee!", points = 5,
    description = "Get a Perfect against Kevin on default settings",
    id = 59762, badge = "62842", published = "03/05/2018 03:51:33", modified = "21/06/2021 13:47:38",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && unless(p2_active_state() != 0) &&
              unless(mvs_survival_mode_flag() == 2) && unless(mvs_survival_mode_flag() == 3) &&
              trigger_when(p1_won_rounds() > prev(p1_won_rounds())) && unless(p2_character() != 11) &&
              unless(p1_hp() != 120) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Kain Yoooooo!", points = 5,
    description = "Get a Perfect against Grant on default settings",
    id = 59763, badge = "62843", published = "03/05/2018 03:51:34", modified = "21/06/2021 13:47:39",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && unless(p2_active_state() != 0) &&
              unless(mvs_survival_mode_flag() == 2) && unless(mvs_survival_mode_flag() == 3) &&
              trigger_when(p1_won_rounds() > prev(p1_won_rounds())) && unless(p2_character() != 12) &&
              unless(p1_hp() != 120) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Uooooooooo!", points = 5,
    description = "Get a Perfect against Kain on default settings",
    id = 59764, badge = "62844", published = "03/05/2018 03:51:36", modified = "21/06/2021 13:47:39",
    trigger = never(unibios() != 0) && never(p1_active_state() == 0) && unless(p2_active_state() != 0) &&
              unless(mvs_survival_mode_flag() == 2) && unless(mvs_survival_mode_flag() == 3) &&
              trigger_when(p1_won_rounds() > prev(p1_won_rounds())) && unless(p2_character() != 13) &&
              unless(p1_hp() != 120) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Rush Hakkyokuseiken Hits", points = 10,
    description = "Perform a 20-hit combo as Rock",
    id = 60156, badge = "62909", published = "10/05/2018 04:43:33", modified = "28/05/2021 16:26:48",
    trigger = never(unibios() != 0) && unless(p1_character() != 1) && p1_combo_hit() == 32 &&
              never(p1_active_state() == 0) && never(game_region_screen() != 15) && never(game_region_screen() < 2)
)

achievement(
    title = "Rush Hakkyokuseiken Chi Hits", points = 10,
    description = "Perform a 10-hit combo as Terry",
    id = 60157, badge = "62910", published = "10/05/2018 04:43:37", modified = "28/05/2021 16:26:49",
    trigger = never(unibios() != 0) && unless(p1_character() != 0) && p1_combo_hit() == 16 &&
              never(p1_active_state() == 0) && never(game_region_screen() != 15) && never(game_region_screen() < 2)
)

achievement(
    title = "Rush Byeolag Taekwondo Hits", points = 10,
    description = "Perform a 23-hit combo as Dong Hwan",
    id = 60158, badge = "62911", published = "10/05/2018 04:43:46", modified = "28/05/2021 16:26:49",
    trigger = never(unibios() != 0) && unless(p1_character() != 2) && p1_combo_hit() == 35 &&
              never(p1_active_state() == 0) && never(game_region_screen() != 15) && never(game_region_screen() < 2)
)

achievement(
    title = "Rush Bulkkoch Taekwondo Hits", points = 10,
    description = "Perform a 24-hit combo as Jae Hoon",
    id = 60159, badge = "62912", published = "10/05/2018 04:43:50", modified = "28/05/2021 16:26:50",
    trigger = never(unibios() != 0) && unless(p1_character() != 3) && p1_combo_hit() == 36 &&
              never(p1_active_state() == 0) && never(game_region_screen() != 15) && never(game_region_screen() < 2)
)

achievement(
    title = "Rush Neibu Kung Fu Hits", points = 10,
    description = "Perform a 22-hit combo as Hotaru",
    id = 60160, badge = "62913", published = "10/05/2018 04:43:56", modified = "28/05/2021 16:26:50",
    trigger = never(unibios() != 0) && unless(p1_character() != 4) && p1_combo_hit() == 34 &&
              never(p1_active_state() == 0) && never(game_region_screen() != 15) && never(game_region_screen() < 2)
)

achievement(
    title = "Rush Quan Fa Hits", points = 10,
    description = "Perform an 18-hit combo as Gato",
    id = 60161, badge = "62914", published = "10/05/2018 04:43:59", modified = "28/05/2021 16:26:51",
    trigger = never(unibios() != 0) && unless(p1_character() != 5) && p1_combo_hit() == 24 &&
              never(p1_active_state() == 0) && never(game_region_screen() != 15) && never(game_region_screen() < 2)
)

achievement(
    title = "Rush LK Arts Hits", points = 10,
    description = "Perform a 23-hit combo as B. Jenet",
    id = 60162, badge = "62915", published = "10/05/2018 04:44:04", modified = "28/05/2021 16:26:51",
    trigger = never(unibios() != 0) && unless(p1_character() != 6) && p1_combo_hit() == 35 &&
              never(p1_active_state() == 0) && never(game_region_screen() != 15) && never(game_region_screen() < 2)
)

achievement(
    title = "Rush Kyokugenryu Karate Hits", points = 10,
    description = "Perform a 20-hit combo as Marco/Butt",
    id = 60163, badge = "64565", published = "10/05/2018 04:44:08", modified = "28/05/2021 16:26:52",
    trigger = never(unibios() != 0) && unless(p1_character() != 7) && p1_combo_hit() == 32 &&
              never(p1_active_state() == 0) && never(game_region_screen() != 15) && never(game_region_screen() < 2)
)

achievement(
    title = "Rush Shiranui-ryuu Ninjutsu Hits", points = 10,
    description = "Perform a 15-hit combo as Hokutomaru",
    id = 60164, badge = "62917", published = "10/05/2018 04:44:12", modified = "28/05/2021 16:26:52",
    trigger = never(unibios() != 0) && unless(p1_character() != 8) && p1_combo_hit() == 21 &&
              never(p1_active_state() == 0) && never(game_region_screen() != 15) && never(game_region_screen() < 2)
)

achievement(
    title = "Rush Ga-ryuu Kakutoujustu Zanki Hits", points = 10,
    description = "Perform a 6-hit combo as Freeman",
    id = 60165, badge = "62918", published = "10/05/2018 04:44:16", modified = "28/05/2021 16:26:53",
    trigger = never(unibios() != 0) && unless(p1_character() != 9) && p1_combo_hit() == 6 &&
              never(p1_active_state() == 0) && never(game_region_screen() != 15) && never(game_region_screen() < 2)
)

achievement(
    title = "Rush Pro Wrestling Hits", points = 10,
    description = "Perform a 9-hit combo as The Griffon/Tizoc",
    id = 60166, badge = "62919", published = "10/05/2018 04:44:18", modified = "28/05/2021 16:26:53",
    trigger = never(unibios() != 0) && unless(p1_character() != 10) && p1_combo_hit() == 9 &&
              never(p1_active_state() == 0) && never(game_region_screen() != 15) && never(game_region_screen() < 2)
)

achievement(
    title = "Rush SWAT Mercenary Techniques Hits", points = 10,
    description = "Perform a 13-hit combo as Kevin",
    id = 60167, badge = "62920", published = "10/05/2018 04:44:20", modified = "28/05/2021 16:26:53",
    trigger = never(unibios() != 0) && unless(p1_character() != 11) && p1_combo_hit() == 19 &&
              never(p1_active_state() == 0) && never(game_region_screen() != 15) && never(game_region_screen() < 2)
)

achievement(
    title = "Rush Ankoku Karate Hits", points = 10,
    description = "Perform a 10-hit combo as Grant",
    id = 60168, badge = "62921", published = "10/05/2018 04:44:22", modified = "28/05/2021 16:26:54",
    trigger = never(unibios() != 0) && unless(p1_character() != 12) && p1_combo_hit() == 16 &&
              never(p1_active_state() == 0) && never(game_region_screen() != 15) && never(game_region_screen() < 2)
)

achievement(
    title = "Rush Ankoku Shinkuu-Ken Hits", points = 10,
    description = "Perform a 21-hit combo as Kain",
    id = 60169, badge = "62922", published = "10/05/2018 04:44:23", modified = "28/05/2021 16:26:54",
    trigger = never(unibios() != 0) && unless(p1_character() != 13) && p1_combo_hit() == 33 &&
              never(p1_active_state() == 0) && never(game_region_screen() != 15) && never(game_region_screen() < 2)
)

achievement(
    title = "I Believe in Miracles", points = 5,
    description = "Earn a Miracle win in Story Mode on any difficulty and default settings",
    id = 59765, badge = "62898", published = "03/05/2018 03:51:44", modified = "28/05/2021 16:26:55",
    trigger = never(unibios() != 0) && unless(p1_fighting_level() != 0) && unless(p1_hp() == 0) &&
              unless(mvs_survival_mode_flag() != 0) && never(p2_hp() != 255) && prev(ranks_granted()) < ranks_granted() &&
              never(p2_active_state() != 0) && never(game_region_screen() == 26) && never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_round_set() == 1 &&
                aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_win_point_mvs() == 4 &&
                soft_dip_setup_play_time_mvs() >= 60))
)

// Ticket 80704: Triggered as Rock when fighting Freeman on the first Just Defend I performed of the entire match.
achievement(
    title = "Just Defending", points = 3,
    description = "Perform a Just Defense 5 times in one match",
    id = 59766, badge = "62899", published = "03/05/2018 03:51:47", modified = "09/12/2024 17:36:00",
    trigger = never(unibios() != 0) && never(prev(p2_character()) != p2_character()) &&
              repeated(5,
                  prev(lower4_displayed_message_while_in_game_just_defence_p1()) >
                  lower4_displayed_message_while_in_game_just_defence_p1()
              ) && unless(p2_character_16bits() == 368) && unless(p2_character_16bits() == 369) &&
              unless(p2_character_16bits() == 370) && unless(p2_character_16bits() == 371) &&
              unless(p2_character_16bits() == 372) && never(game_region_screen() == 26) &&
              never(game_region_screen() < 2)
)

achievement(
    title = "Wild Thing!", points = 3,
    description = "Perform a Guard Cancel",
    id = 59767, badge = "62900", published = "03/05/2018 03:51:49", modified = "28/05/2021 16:26:56",
    trigger = never(unibios() != 0) && p1_guard_cancel_ffag() == 1 && never(p2_active_state() != 0) &&
              never(game_region_screen() == 26) && never(game_region_screen() < 2)
)

achievement(
    title = "Marque of the Wolves", points = 10,
    description = "Score 1,500,000 points in Story Mode on default settings",
    id = 59768, badge = "62901", published = "03/05/2018 03:52:03", modified = "26/07/2023 18:41:04",
    trigger = never(unibios() != 0) && p1_score_00xx0000() >= 336 && never(p1_score_xx000000() > 2) &&
              unless(mvs_survival_mode_flag() != 0) && never(p2_active_state() != 0) &&
              never(game_region_screen() == 26) && never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 2 &&
                aes_configuration_round_set() == 1 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 2 &&
                soft_dip_setup_win_point_mvs() == 4 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Stark of the Wolves", points = 10,
    description = "Perform a Just Defense 25 times in one playthrough",
    id = 59769, badge = "62902", published = "03/05/2018 03:52:06", modified = "28/05/2021 16:26:56",
    trigger = never(unibios() != 0) && repeated(25, prev(low4(0x00047E)) > low4(0x00047E)) &&
              unless(p2_character_16bits() == 368) && unless(p2_character_16bits() == 369) &&
              never(p2_active_state() != 0) && unless(p2_character_16bits() == 370) &&
              unless(p2_character_16bits() == 371) && unless(p2_character_16bits() == 372) &&
              never(game_region_screen() == 26) && never(game_region_screen() < 2)
)

achievement(
    title = "Sympathy for the Wolves", points = 25,
    description = "Defeat Kain and finish Story Mode on the hardest difficulty and default settings",
    id = 59770, badge = "62905", published = "03/05/2018 03:52:09", modified = "18/12/2021 16:18:41",
    trigger = never(unibios() != 0) && unless(mvs_survival_mode_flag() != 0) &&
              trigger_when(arcade_and_survival_ladder_fight() == 8) && trigger_when(p2_character() == 13) &&
              trigger_when(p1_won_rounds() == 2) && never(p2_active_state() != 0) && never(game_region_screen() == 26) &&
              never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_difficulty() >= 7 &&
                aes_configuration_round_set() == 1 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_difficullty_mvs() >= 7 &&
                soft_dip_setup_win_point_mvs() == 4 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Dark of the Wolves", points = 25,
    description = "Defeat Kain and finish Story Mode without using any specials, T.O.P. attacks, or super moves on any difficulty and default settings",
    id = 59771, badge = "62904", published = "03/05/2018 03:52:15", modified = "21/06/2021 13:47:44",
    trigger = never(unibios() != 0) && once(game_region_screen() == 8 && beaten_cpus_in_arcade_mode() == 0) &&
              trigger_when(arcade_and_survival_ladder_fight() == 8) && trigger_when(p1_won_rounds() == 2) &&
              trigger_when(p2_character() == 13) && unless(mvs_survival_mode_flag() != 0) &&
              never(p1_command_flags_1() != 0) && never(p1_command_flags_2() != 0) && never(p1_command_flags_3() != 0) &&
              never(p1_command_flags_4() != 0) && never(p2_active_state() != 0) && never(game_region_screen() == 26) &&
              never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_round_set() == 1 &&
                aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_win_point_mvs() == 4 &&
                soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Those Consumed with Vengeance", points = 25,
    description = "Finish Survival Mode in under 7 minutes on the default round time setting",
    id = 59772, badge = "62907", published = "03/05/2018 03:52:24", modified = "21/06/2021 13:47:45",
    trigger = never(unibios() != 0) && trigger_when(arcade_and_survival_ladder_fight() == 14) &&
              trigger_when(p2_hp() == 255) && trigger_when(p2_character() == 13) &&
              unless(mvs_survival_mode_flag() != 1) && never(survival_mode_timer_0x() >= 7) &&
              never(p2_active_state() != 0) && never(game_region_screen() == 26) && never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "For Here, the Mighty Rule!", points = 25,
    description = "Finish Survival Mode without falling below 33% health on the default round time setting",
    id = 59773, badge = "62908", published = "03/05/2018 03:52:29", modified = "26/07/2023 18:43:28",
    trigger = never(unibios() != 0) && trigger_when(arcade_and_survival_ladder_fight() == 14) &&
              trigger_when(p2_hp() == 255) && trigger_when(p2_character() == 13) &&
              once(arcade_and_survival_ladder_fight() == 1) && unless(mvs_survival_mode_flag() != 1) &&
              never(p1_hp() < 40) && never(p2_active_state() != 0) && never(game_region_screen() == 26) &&
              never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_play_time_mvs() >= 60))
)

achievement(
    title = "Those Blinded by Ambition", points = 25,
    description = "Finish Survival Mode on the default round time setting",
    id = 59774, badge = "62906", published = "03/05/2018 03:52:31", modified = "28/05/2021 16:26:58",
    trigger = never(unibios() != 0) && arcade_and_survival_ladder_fight() == 14 && p2_hp() == 255 &&
              unless(mvs_survival_mode_flag() != 1) && p2_character() == 13 && never(p2_active_state() != 0) &&
              never(game_region_screen() == 26) && never(game_region_screen() < 2) &&
              ((mvs_active_bitflag_bit7() == 0 && aes_configuration_game_time() >= 1) ||
               (mvs_active_bitflag_bit7() == 1 && soft_dip_setup_play_time_mvs() >= 60))
)
