// Capcom vs. SNK Pro
// #ID = 13918

// Setting

function setting_difficulty() => byte(0x06E261)
function setting_music_mode() => byte(0x072CAE)

// Game

function game_bgm_2() => byte(0x05C138)
function game_current_match() => byte(0x06E280)
function game_match_ended_flag() => byte(0x06E285)

function game_selected_mode() => byte(0x06E268)

function game_cutscene_flag() => byte(0x076F9F)

// P1

function p1_character_slot_1() => byte(0x06E298)
function p1_character_slot_2() => byte(0x06E299)
function p1_character_slot_3() => byte(0x06E29A)
function p1_character_slot_4() => byte(0x06E29B)

function p2_character_slot_1() => byte(0x06E29C)
function p2_character_slot_2() => byte(0x06E29D)

function p1_current_character() => byte(0x06E99E)
function p1_round_won_flag() => byte(0x06E685)

function p1_move_type() => byte(0x06E4DE)
function p1_animation() => byte(0x06E604)
function p1_grab_throw() => byte(0x06E662)
function p1_ex_mode_flag() => byte(0x06E6B5)
function p1_super_combo_flag() => byte(0x06E6C5)
function p1_active_state() => byte(0x06E8B4)
function p1_rank_s_points() => byte(0x06E968)
function p1_hit_combo() => byte(0x06F673)

// P2

function p2_ex_mode_current_character_flag() => byte(0x06F675)
function p2_stun_flag() => byte(0x06F6BF)
function p2_active_state() => byte(0x06F874)

function price_mode_characters_bought_capcom_bit_akuma() => bit5(0x08B669)
function price_mode_characters_bought_capcom_bit_morrigan() => bit6(0x08B669)
function price_mode_characters_bought_capcom_bit_evil_ryu() => bit7(0x08B669)
function price_mode_characters_bought_snk_bit_nakoruru() => bit6(0x08B66B)
function price_mode_characters_bought_snk_bit_orochi_iori() => bit7(0x08B66B)

function character_set_ex_price_mode_1() => word(0x08B670)
function character_set_ex_price_mode_2() => word(0x08B672)
function character_set_ex_price_mode_3() => byte(0x08B674)

// Utility

function p1_team_has_char(char_id) => p1_character_slot_1() == char_id || p1_character_slot_2() == char_id || p1_character_slot_3() == char_id || p1_character_slot_4() == char_id
function p1_dont_have_char(char_id) => p1_character_slot_1() != char_id && p1_character_slot_2() != char_id && p1_character_slot_3() != char_id && p1_character_slot_4() != char_id

function p1_won_a_round() => p1_round_won_flag() == 1 && prev(p1_round_won_flag()) == 0

function game_beaten() {
    return(
        game_current_match() == 5 &&
        game_match_ended_flag() == 1 &&
        game_cutscene_flag() == 85
    )
}

// =========================================
//                  Combos              
// =========================================

achievement(
    title = "Capcom Combo - Ryu", points = 5,
    description = "Perform a 6-hit combo as Ryu, linking 2 hits into a Super Combo",
    id = 94916, badge = "104583", published = "16/01/2020 17:38:00", modified = "21/04/2021 20:24:20",
    trigger = repeated(4, p1_move_type() == 8 && p1_hit_combo() > prev(p1_hit_combo())) &&
              repeated(2, p1_move_type() != 8 && p1_move_type() != 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              p1_current_character() == 0 && never(p1_current_character() != 0) && never(p1_grab_throw() == 1) &&
              never(p2_stun_flag() == 1) && never(p1_hit_combo() < prev(p1_hit_combo())) &&
              p1_hit_combo() >= 6
)

achievement(
    title = "Capcom Combo - Ken", points = 5,
    description = "Perform a 13-hit combo as Ken, linking 2 hits into a Super Combo",
    id = 94917, badge = "104582", published = "16/01/2020 17:38:11", modified = "21/04/2021 20:24:21",
    trigger = repeated(11, p1_move_type() == 8 && p1_hit_combo() > prev(p1_hit_combo())) &&
              repeated(2, p1_move_type() != 8 && p1_move_type() != 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              p1_current_character() == 1 && never(p1_current_character() != 1) && never(p1_grab_throw() == 1) &&
              never(p2_stun_flag() == 1) && never(p1_hit_combo() < prev(p1_hit_combo())) &&
              p1_hit_combo() >= 13
)

achievement(
    title = "Capcom Combo - Chun Li", points = 5,
    description = "Perform a 8-hit combo as Chun Li, linking 2 hits into a Super Combo",
    id = 94918, badge = "104613", published = "16/01/2020 17:38:21", modified = "21/04/2021 20:24:21",
    trigger = repeated(4, p1_move_type() == 8 && p1_hit_combo() > prev(p1_hit_combo())) &&
              repeated(2, p1_move_type() != 8 && p1_move_type() != 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              p1_current_character() == 2 && never(p1_current_character() != 2) && never(p1_grab_throw() == 1) &&
              never(p2_stun_flag() == 1) && never(p1_hit_combo() < prev(p1_hit_combo())) &&
              p1_hit_combo() >= 8
)

achievement(
    title = "Capcom Combo - Guile", points = 5,
    description = "Perform a 6-hit combo as Guile, linking 2 hits into a Super Combo",
    id = 94919, badge = "104609", published = "16/01/2020 17:38:43", modified = "21/04/2021 20:24:22",
    trigger = repeated(4, p1_move_type() == 8 && p1_hit_combo() > prev(p1_hit_combo())) &&
              repeated(2, p1_move_type() != 8 && p1_move_type() != 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              p1_current_character() == 3 && never(p1_current_character() != 3) && never(p1_grab_throw() == 1) &&
              never(p2_stun_flag() == 1) && never(p1_hit_combo() < prev(p1_hit_combo())) &&
              p1_hit_combo() >= 6
)

achievement(
    title = "Capcom Combo - Dhalsim", points = 5,
    description = "Perform a 6-hit combo as Dhalsim",
    id = 94920, badge = "104584", published = "16/01/2020 17:39:52", modified = "16/01/2020 18:15:04",
    trigger = repeated(6, p1_hit_combo() > prev(p1_hit_combo())) && p1_current_character() == 5 &&
              never(p1_current_character() != 5) && never(p1_grab_throw() == 1) && never(p2_stun_flag() == 1) &&
              never(p1_hit_combo() < prev(p1_hit_combo())) && p1_hit_combo() >= 6
)

achievement(
    title = "Capcom Combo - E-Honda", points = 5,
    description = "Perform a 9-hit combo as E-Honda",
    id = 94921, badge = "168285", published = "16/01/2020 17:39:59", modified = "31/05/2021 14:53:16",
    trigger = repeated(6, p1_hit_combo() > prev(p1_hit_combo())) && p1_current_character() == 6 &&
              never(p1_current_character() != 6) && never(p1_grab_throw() == 1) && never(p2_stun_flag() == 1) &&
              never(p1_hit_combo() < prev(p1_hit_combo())) && p1_hit_combo() >= 9
)

achievement(
    title = "Capcom Combo - Blanka", points = 5,
    description = "Perform a HP Throw followed by a Super as Normal Blanka",
    id = 94922, badge = "104585", published = "16/01/2020 17:40:10", modified = "16/01/2020 18:15:02",
    trigger = once(p1_grab_throw() == 1 && p1_hit_combo() > prev(p1_hit_combo())) &&
              once(p1_move_type() == 8 && p1_hit_combo() > prev(p1_hit_combo())) &&
              repeated(4, p1_current_character() == 7) && never(p1_current_character() != 7) &&
              never(p2_stun_flag() == 1) && never(p1_hit_combo() < prev(p1_hit_combo())) && p1_hit_combo() >= 2
)

achievement(
    title = "Capcom Combo - Vega", points = 5,
    description = "Perform a 4-hit combo as Vega, linking a hit into a Special Move",
    id = 94923, badge = "104628", published = "16/01/2020 17:40:15", modified = "21/04/2021 20:24:33",
    trigger = repeated(4, p1_hit_combo() > prev(p1_hit_combo())) && p1_hit_combo() >= 4 &&
              once(p1_move_type() == 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              never(p1_current_character() != 8) && never(p1_grab_throw() == 1) && never(p2_stun_flag() == 1) &&
              never(p1_hit_combo() < prev(p1_hit_combo()))
)

achievement(
    title = "Capcom Combo - Sagat", points = 5,
    description = "Perform a 6-hit combo as Normal Sagat, linking 2 hits into a Super Combo",
    id = 94924, badge = "104580", published = "16/01/2020 17:40:40", modified = "07/08/2024 14:04:51",
    trigger = repeated(4, p1_super_combo_flag() == 1 && p1_hit_combo() > prev(p1_hit_combo())) &&
              repeated(2, p1_super_combo_flag() == 0 && p1_hit_combo() > prev(p1_hit_combo())) &&
              p1_current_character() == 9 && never(p1_current_character() != 9) && never(p1_grab_throw() == 1) &&
              never(p2_stun_flag() == 1) && never(p1_hit_combo() < prev(p1_hit_combo())) &&
              p1_hit_combo() >= 6
)

achievement(
    title = "Capcom Combo - M Bison", points = 5,
    description = "Perform a 8-hit combo as M Bison, linking 2 hits into Super Combo",
    id = 94925, badge = "104586", published = "16/01/2020 17:40:45", modified = "21/04/2021 20:24:44",
    trigger = repeated(6, p1_move_type() == 8 && p1_hit_combo() > prev(p1_hit_combo())) && p1_hit_combo() >= 8 &&
              repeated(2, p1_move_type() != 8 && p1_move_type() != 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              never(p1_current_character() != 10) && never(p2_stun_flag() == 1) &&
              never(p1_hit_combo() < prev(p1_hit_combo()))
)

achievement(
    title = "Capcom Combo - Sakura", points = 5,
    description = "Perform a 8 hit as Sakura, linking 2 hits into a Super Combo",
    id = 94926, badge = "104610", published = "16/01/2020 17:40:53", modified = "21/04/2021 20:24:47",
    trigger = repeated(6, p1_move_type() == 8 && p1_hit_combo() > prev(p1_hit_combo())) && p1_hit_combo() >= 8 &&
              repeated(2, p1_move_type() != 8 && p1_move_type() != 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              never(p1_current_character() != 11) && never(p1_grab_throw() == 1) && never(p2_stun_flag() == 1) &&
              never(p1_hit_combo() < prev(p1_hit_combo()))
)

achievement(
    title = "Capcom Combo - Cammy", points = 5,
    description = "Perform a 8-hit combo as Cammy, linking 2 hits into a Super Combo",
    id = 94927, badge = "104611", published = "16/01/2020 17:40:57", modified = "21/04/2021 20:24:50",
    trigger = repeated(6, p1_move_type() == 8 && p1_hit_combo() > prev(p1_hit_combo())) &&
              repeated(2, p1_move_type() != 8 && p1_move_type() != 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              p1_current_character() == 12 && never(p1_current_character() != 12) && never(p1_grab_throw() == 1) &&
              never(p2_stun_flag() == 1) && never(p1_hit_combo() < prev(p1_hit_combo())) &&
              p1_hit_combo() >= 8
)

achievement(
    title = "Capcom Combo - Akuma", points = 5,
    description = "Perform a 8-hit combo as Akuma, linking 2 hits into a Super Combo",
    id = 94928, badge = "104587", published = "16/01/2020 17:41:02", modified = "21/04/2021 20:24:53",
    trigger = repeated(6, p1_move_type() == 8 && p1_hit_combo() > prev(p1_hit_combo())) &&
              repeated(2, p1_move_type() != 8 && p1_move_type() != 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              p1_current_character() == 13 && never(p1_current_character() != 13) && never(p1_grab_throw() == 1) &&
              never(p2_stun_flag() == 1) && never(p1_hit_combo() < prev(p1_hit_combo())) && p1_hit_combo() >= 8
)

achievement(
    title = "Capcom Combo - Morrigan", points = 5,
    description = "Perform a 29-hit combo as Morrigan",
    id = 94929, badge = "104588", published = "16/01/2020 17:41:06", modified = "18/01/2020 13:09:39",
    trigger = p1_current_character() == 14 && never(p1_current_character() != 14) && never(p1_grab_throw() == 1) &&
              never(p2_stun_flag() == 1) && never(p1_hit_combo() < prev(p1_hit_combo())) && p1_hit_combo() >= 29
)

achievement(
    title = "Capcom Combo - Evil Ryu", points = 5,
    description = "Perform a 8-hit combo as Evil Ryu, linking 2 hits into a Super Combo",
    id = 94930, badge = "104589", published = "16/01/2020 17:41:09", modified = "21/04/2021 20:24:55",
    trigger = repeated(6, p1_move_type() == 8 && p1_hit_combo() > prev(p1_hit_combo())) &&
              repeated(2, p1_move_type() != 8 && p1_move_type() != 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              p1_current_character() == 15 && never(p1_current_character() != 15) && never(p1_grab_throw() == 1) &&
              never(p2_stun_flag() == 1) && never(p1_hit_combo() < prev(p1_hit_combo())) && p1_hit_combo() >= 8
)

achievement(
    title = "Capcom Combo - Balrog", points = 5,
    description = "Perform a 11-hit combo as Balrog",
    id = 94931, badge = "104590", published = "16/01/2020 17:41:18", modified = "16/01/2020 18:14:51",
    trigger = repeated(11, p1_hit_combo() > prev(p1_hit_combo())) && p1_current_character() == 32 &&
              never(p1_current_character() != 32) && never(p1_grab_throw() == 1) && never(p2_stun_flag() == 1) &&
              never(p1_hit_combo() < prev(p1_hit_combo())) && p1_hit_combo() >= 11
)

achievement(
    title = "Capcom Combo - Dan", points = 5,
    description = "Perform a 9-hit combo as Dan, linking 2 hits into a Super Combo",
    id = 94932, badge = "104612", published = "16/01/2020 17:41:24", modified = "21/04/2021 20:24:57",
    trigger = repeated(7, p1_move_type() == 8 && p1_hit_combo() > prev(p1_hit_combo())) && p1_hit_combo() >= 9 &&
              repeated(2, p1_move_type() != 8 && p1_move_type() != 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              p1_current_character() == 33 &&
              never(p1_current_character() != 33) && never(p1_grab_throw() == 1) && never(p2_stun_flag() == 1) &&
              never(p1_hit_combo() < prev(p1_hit_combo()))
)

achievement(
    title = "SNK Combo - Vice", points = 5,
    description = "Perform a 4-hit combo as EX Vice, chained with Mayhem + Cide Slayer",
    id = 94933, badge = "104607", published = "16/01/2020 17:41:32", modified = "16/01/2020 18:15:00",
    trigger = once(p1_animation() == 16 && p1_hit_combo() > prev(p1_hit_combo())) &&
              once(p1_animation() == 61 && p1_hit_combo() > prev(p1_hit_combo())) &&
              repeated(2,
                  p1_animation() != 16 && p1_animation() != 61 &&
                  p1_hit_combo() > prev(p1_hit_combo())
              ) && p1_current_character() == 26 && never(p1_current_character() != 26) && never(p2_stun_flag() == 1) &&
              never(p1_hit_combo() < prev(p1_hit_combo())) && p1_hit_combo() >= 4
)

achievement(
    title = "SNK Combo - Benimaru", points = 5,
    description = "Perform a 9-hit combo as Normal Benimaru",
    id = 94934, badge = "104591", published = "16/01/2020 17:41:36", modified = "16/01/2020 18:15:58",
    trigger = repeated(9, p1_hit_combo() > prev(p1_hit_combo())) && p1_current_character() == 27 &&
              never(p1_current_character() != 27) && never(p1_grab_throw() == 1) && never(p2_stun_flag() == 1) &&
              never(p1_hit_combo() < prev(p1_hit_combo())) && p1_hit_combo() >= 9
)

achievement(
    title = "SNK Combo - Yuri", points = 5,
    description = "Perform a 5-hit combo as Yuri, linking 2 hits into a Super Combo",
    id = 94935, badge = "104592", published = "16/01/2020 17:41:45", modified = "23/04/2021 22:09:07",
    trigger = repeated(3, p1_move_type() == 8 && p1_hit_combo() > prev(p1_hit_combo())) &&
              repeated(2, p1_move_type() != 8 && p1_move_type() != 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              p1_current_character() == 28 && never(p1_current_character() != 28) && never(p1_grab_throw() == 1) &&
              never(p2_stun_flag() == 1) && never(p1_hit_combo() < prev(p1_hit_combo())) &&
              p1_hit_combo() >= 5
)

achievement(
    title = "SNK Combo - King", points = 5,
    description = "Perform a 8-hit combo as EX King  linking 2 hits into a Double Strike",
    id = 94936, badge = "104606", published = "16/01/2020 17:41:49", modified = "18/01/2020 02:27:25",
    trigger = repeated(6, p1_super_combo_flag() == 1 && p1_hit_combo() > prev(p1_hit_combo())) &&
              repeated(2, p1_super_combo_flag() == 0 && p1_hit_combo() > prev(p1_hit_combo())) &&
              p1_ex_mode_flag() == 1 && p1_current_character() == 29 &&
              never(p1_current_character() != 29) && never(p1_grab_throw() == 1) && never(p2_stun_flag() == 1) &&
              never(p1_hit_combo() < prev(p1_hit_combo())) && p1_hit_combo() >= 8
)

achievement(
    title = "SNK Combo - Nakoruru", points = 5,
    description = "Perform a 3-hit combo as Nakoruru, linking 2 hits into a Special Move",
    id = 94937, badge = "104594", published = "16/01/2020 17:42:04", modified = "20/04/2021 14:28:59",
    trigger = once(p1_move_type() == 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              repeated(2, p1_move_type() != 8 && p1_move_type() != 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              p1_current_character() == 30 && never(p1_current_character() != 30) && never(p1_grab_throw() == 1) &&
              never(p2_stun_flag() == 1) && never(p1_hit_combo() < prev(p1_hit_combo())) &&
              p1_hit_combo() >= 3
)

achievement(
    title = "SNK Combo - Orochi Iori", points = 5,
    description = "Perform a 14-hit combo as Orochi Iori, linking 2 hits into a Super Combo",
    id = 94938, badge = "104595", published = "16/01/2020 17:42:08", modified = "23/04/2021 20:59:18",
    trigger = repeated(12, p1_move_type() == 8 && p1_hit_combo() > prev(p1_hit_combo())) && p1_hit_combo() >= 14 &&
              repeated(2, p1_move_type() != 8 && p1_move_type() != 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              never(p1_current_character() != 31) && never(p2_stun_flag() == 1) &&
              never(p1_hit_combo() < prev(p1_hit_combo()))
)

achievement(
    title = "SNK Combo - Kyo", points = 5,
    description = "Perform a 11-hit combo as Kyo, linking 2 hits into a Super Combo",
    id = 94939, badge = "104596", published = "16/01/2020 17:42:17", modified = "21/04/2021 20:25:30",
    trigger = repeated(9, p1_move_type() == 8 && p1_hit_combo() > prev(p1_hit_combo())) && p1_hit_combo() >= 11 &&
              repeated(2, p1_move_type() != 8 && p1_move_type() != 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              p1_current_character() == 16 && never(p1_current_character() != 16) && never(p2_stun_flag() == 1) &&
              never(p1_hit_combo() < prev(p1_hit_combo()))
)

achievement(
    title = "SNK Combo - Iori", points = 5,
    description = "Perform a 15-hit combo as Iori",
    id = 94940, badge = "104597", published = "16/01/2020 17:42:22", modified = "16/01/2020 18:15:24",
    trigger = repeated(15, p1_hit_combo() > prev(p1_hit_combo())) && p1_hit_combo() >= 15 &&
              p1_current_character() == 17 && never(p1_current_character() != 17) && never(p2_stun_flag() == 1) &&
              never(p1_hit_combo() < prev(p1_hit_combo())) && p1_hit_combo() >= 15
)

achievement(
    title = "SNK Combo - Ryo", points = 5,
    description = "Perform a 14-hit combo as Ryo, linking 2 hits into a Super Combo",
    id = 94941, badge = "104598", published = "16/01/2020 17:42:38", modified = "21/04/2021 20:25:32",
    trigger = repeated(12, p1_move_type() == 8 && p1_hit_combo() > prev(p1_hit_combo())) && p1_hit_combo() >= 14 &&
              repeated(2, p1_move_type() != 8 && p1_move_type() != 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              p1_current_character() == 19 && never(p1_current_character() != 19) && never(p2_stun_flag() == 1) &&
              never(p1_hit_combo() < prev(p1_hit_combo()))
)

achievement(
    title = "SNK Combo - Mai", points = 5,
    description = "Perform a 4-hit combo as Mai, linking into a Special Move",
    id = 94942, badge = "168881", published = "16/01/2020 17:42:47", modified = "22/04/2021 17:38:40",
    trigger = repeated(4, p1_hit_combo() > prev(p1_hit_combo())) && p1_hit_combo() >= 4 &&
              once(p1_move_type() == 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              p1_current_character() == 20 && never(p1_current_character() != 20) && never(p2_stun_flag() == 1) &&
              never(p1_hit_combo() < prev(p1_hit_combo()))
)

achievement(
    title = "SNK Combo - Kim", points = 5,
    description = "Perform a 19-hit combo as EX Kim",
    id = 94943, badge = "104600", published = "16/01/2020 17:42:54", modified = "16/01/2020 18:15:21",
    trigger = repeated(19, p1_hit_combo() > prev(p1_hit_combo())) && p1_hit_combo() >= 19 &&
              p1_current_character() == 21 && never(p1_current_character() != 21) && never(p2_stun_flag() == 1) &&
              never(p1_hit_combo() < prev(p1_hit_combo())) && p1_hit_combo() >= 19
)

achievement(
    title = "SNK Combo - Geese", points = 5,
    description = "Perform a 12-hit combo as Geese, linking 2 hits into Deadly Rave",
    id = 94944, badge = "104601", published = "16/01/2020 17:43:03", modified = "22/04/2021 17:58:21",
    trigger = p1_hit_combo() >= 12 &&
              repeated(10, p1_move_type() == 8 && p1_hit_combo() > prev(p1_hit_combo())) &&
              repeated(2, p1_move_type() != 8 && p1_move_type() != 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              p1_current_character() == 22 && never(p1_current_character() != 22) && never(p1_grab_throw() == 1) &&
              never(p2_stun_flag() == 1) && never(p1_hit_combo() < prev(p1_hit_combo()))
)

achievement(
    title = "SNK Combo - Terry", points = 5,
    description = "Perform a 7-hit combo as Terry, linking 3 hits into a Super Combo",
    id = 94945, badge = "104593", published = "16/01/2020 17:43:15", modified = "21/04/2021 20:25:41",
    trigger = repeated(4, p1_move_type() == 8 && p1_hit_combo() > prev(p1_hit_combo())) &&
              repeated(3, p1_move_type() != 8 && p1_move_type() != 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              p1_current_character() == 18 && never(p1_current_character() != 18) && never(p1_grab_throw() == 1) &&
              never(p2_stun_flag() == 1) && never(p1_hit_combo() < prev(p1_hit_combo())) &&
              p1_hit_combo() >= 7
)

achievement(
    title = "SNK Combo - Yamazaki", points = 5,
    description = "Perform a 11-hit combo as Yamazaki, linking 2 hits into a Super Combo",
    id = 94946, badge = "104603", published = "16/01/2020 17:43:28", modified = "21/04/2021 20:25:44",
    trigger = repeated(9, p1_move_type() == 8 && p1_hit_combo() > prev(p1_hit_combo())) && p1_hit_combo() >= 11 &&
              repeated(2, p1_move_type() != 8 && p1_move_type() != 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              p1_current_character() == 23 && never(p1_current_character() != 23) && never(p2_stun_flag() == 1) &&
              never(p1_hit_combo() < prev(p1_hit_combo()))
)

achievement(
    title = "SNK Combo - Raiden", points = 5,
    description = "Perform a 6-hit combo as Raiden, linking 2 hits into a Super Combo",
    id = 94947, badge = "104604", published = "16/01/2020 17:43:31", modified = "21/04/2021 20:25:56",
    trigger = repeated(4, p1_move_type() == 8 && p1_hit_combo() > prev(p1_hit_combo())) && p1_hit_combo() >= 6 &&
              repeated(2, p1_move_type() != 8 && p1_move_type() != 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              p1_current_character() == 24 && never(p1_current_character() != 24) && never(p1_grab_throw() == 1) &&
              never(p2_stun_flag() == 1) && never(p1_hit_combo() < prev(p1_hit_combo()))
)

achievement(
    title = "SNK Combo - Rugal", points = 5,
    description = "Perform a 8-hit combo as Rugal, linking 2 hits into a Super Combo",
    id = 94948, badge = "104602", published = "16/01/2020 17:43:35", modified = "21/04/2021 20:26:00",
    trigger = repeated(6, p1_move_type() == 8 && p1_hit_combo() > prev(p1_hit_combo())) && p1_hit_combo() >= 8 &&
              repeated(2, p1_move_type() != 8 && p1_move_type() != 7 && p1_hit_combo() > prev(p1_hit_combo())) &&
              never(p1_current_character() != 25) && never(p2_stun_flag() == 1) && never(p1_hit_combo() < prev(p1_hit_combo()))
)

achievement(
    title = "SNK Combo - Joe", points = 5,
    description = "Perform a 6-hit combo as Joe",
    id = 94949, badge = "104605", published = "16/01/2020 17:43:39", modified = "16/01/2020 18:15:14",
    trigger = repeated(6, p1_hit_combo() > prev(p1_hit_combo())) && p1_hit_combo() >= 6 &&
              p1_current_character() == 34 && never(p1_current_character() != 34) && never(p2_stun_flag() == 1) &&
              never(p1_hit_combo() < prev(p1_hit_combo())) && never(p1_grab_throw() == 1) && p1_hit_combo() >= 6
)

// =========================================
//                   Misc              
// =========================================

achievement(
    title = "I'm EXpecial", points = 3,
    description = "Play as an EX character",
    id = 93843, badge = "102974", published = "07/01/2020 13:34:14", modified = "08/01/2020 15:13:18",
    trigger = p1_character_slot_1() != 255 &&
              ((p1_ex_mode_flag() == 1) ||
               (p2_ex_mode_current_character_flag() == 1))
)

achievement(
    title = "In A Word, OK!", points = 10,
    description = "Get 10 Rank S Groove Points",
    id = 93844, badge = "103175", published = "07/01/2020 13:34:17", modified = "07/01/2020 14:01:38",
    trigger = measured(p1_rank_s_points() == 10) && p1_active_state() >= 1 && p2_active_state() == 0 &&
              p1_round_won_flag() == 0
)

achievement(
    title = "I Prefer The Classics!", points = 2,
    description = "Enable \"Original\" music mode",
    id = 93845, badge = "103010", published = "07/01/2020 13:34:21", modified = "07/01/2020 14:01:39",
    trigger = setting_music_mode() == 1 && unless(game_selected_mode() != 8) && game_selected_mode() == 8
)

achievement(
    title = "EX Collection", points = 25,
    description = "Unlock all EX characters",
    id = 93846, badge = "103094", published = "07/01/2020 13:34:26", modified = "07/01/2020 14:01:40",
    trigger = unless(game_selected_mode() != 3) &&
              character_set_ex_price_mode_1() == 0x1FFF && character_set_ex_price_mode_2() == 0x3fff &&
              character_set_ex_price_mode_3() == 0x07 &&
              __ornext(character_set_ex_price_mode_1() != prev(character_set_ex_price_mode_1()) ||
                       character_set_ex_price_mode_2() != prev(character_set_ex_price_mode_2()) ||
                       character_set_ex_price_mode_3() != prev(character_set_ex_price_mode_3())
                       )
)

achievement(
    title = "This DLC is worth just $20", points = 25,
    description = "Buy all secret characters",
    id = 93847, badge = "103095", published = "07/01/2020 13:34:28", modified = "07/01/2020 14:01:41",
    trigger = unless(game_selected_mode() != 3) && game_selected_mode() == 3 &&
              price_mode_characters_bought_snk_bit_orochi_iori() == 1 &&
              price_mode_characters_bought_snk_bit_nakoruru() == 1 &&
              price_mode_characters_bought_capcom_bit_evil_ryu() == 1 &&
              price_mode_characters_bought_capcom_bit_morrigan() == 1 &&
              price_mode_characters_bought_capcom_bit_akuma() == 1
)

// =========================================
//                  Arcade              
// =========================================

achievement(
    title = "Entertain Me!", points = 25,
    description = "Defeat Morrigan on Arcade Mode on the hardest difficulty",
    id = 93848, badge = "103177", published = "07/01/2020 13:34:33", modified = "07/01/2020 14:01:44",
    trigger =
        p2_character_slot_1() == 14 &&
        game_current_match() == 2 &&
        unless(game_current_match() < 2) &&
        unless(game_current_match() > 2) &&
        setting_difficulty() == 7 &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        p1_round_won_flag() == 1
)

achievement(
    title = "This is Nature's Punishment!", points = 25,
    description = "Defeat Nakoruru on Arcade Mode on the hardest difficulty",
    id = 93849, badge = "103176", published = "07/01/2020 13:34:36", modified = "07/01/2020 14:01:34",
    trigger =
        p2_character_slot_1() == 30 &&
        game_current_match() == 2 &&
        unless(game_current_match() < 2) &&
        unless(game_current_match() > 2) &&
        setting_difficulty() == 7 &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        p1_round_won_flag() == 1
)

achievement(
    title = "Volcano's Eruption", points = 5, type = "win_condition",
    description = "Defeat M.Bison in the last match on default difficulty",
    id = 93850, badge = "102969", published = "07/01/2020 13:34:41", modified = "23/02/2025 15:25:46",
    trigger =
        p2_character_slot_2() == 10 &&
        game_current_match() == 5 &&
        unless(game_current_match() != 5) &&
        setting_difficulty() >= 1 &&
        game_match_ended_flag() == 1 &&
        game_cutscene_flag() == 85 &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0
)

achievement(
    title = "Tower Explosion", points = 5, type = "win_condition",
    description = "Defeat Geese in the last match on default difficulty",
    id = 93851, badge = "102970", published = "07/01/2020 13:34:44", modified = "23/02/2025 15:25:47",
    trigger =
        p2_character_slot_1() == 22 &&
        game_current_match() == 5 &&
        unless(game_current_match() != 5) &&
        setting_difficulty() >= 1 &&
        game_match_ended_flag() == 1 &&
        game_cutscene_flag() == 85 &&
        p1_active_state() != 1 &&
        p2_active_state() == 0
)

achievement(
    title = "Demon Enragement", points = 25, type = "win_condition",
    description = "Defeat Akuma in the last match on default difficulty",
    id = 93852, badge = "102973", published = "07/01/2020 13:34:45", modified = "23/02/2025 15:25:47",
    trigger =
        p2_character_slot_1() == 13 &&
        game_current_match() == 5 &&
        unless(game_current_match() != 5) &&
        setting_difficulty() >= 1 &&
        game_match_ended_flag() == 1 &&
        game_cutscene_flag() == 85 &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0
)

achievement(
    title = "Reserved Champion", points = 25,
    description = "Beat the game without using a Super Combo on the hardest difficulty",
    id = 93841, badge = "103009", published = "07/01/2020 13:33:44", modified = "07/01/2020 14:01:35",
    trigger =
        trigger_when(game_beaten()) &&
        setting_difficulty() == 7 &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        never(p1_super_combo_flag() == 1) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0
)

achievement(
    title = "Millenium Fighter 2000", points = 25,
    description = "Beat the game without using a continue on the hardest difficulty",
    id = 93842, badge = "103000", published = "07/01/2020 13:33:49", modified = "08/01/2020 16:13:48",
    trigger =
        trigger_when(game_beaten()) &&
        setting_difficulty() == 7 &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        never(game_bgm_2() == 33) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0
)


// =========================================
//                   Teams              
// =========================================


achievement(
    title = "Heroes", points = 10,
    description = "Beat the game playing only as Ryu and Kyo on default difficulty",
    id = 93857, badge = "102096", published = "07/01/2020 13:34:52", modified = "11/01/2020 23:24:23",
    trigger =
        p1_team_has_char(0) &&
        p1_team_has_char(16) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(0) && p1_won_a_round()) &&
        never(p1_dont_have_char(16) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)

achievement(
    title = "Stars", points = 10,
    description = "Beat the game playing only as Ken and Terry on default difficulty",
    id = 93858, badge = "102097", published = "07/01/2020 13:34:53", modified = "07/01/2020 14:14:27",
    trigger =
        p1_team_has_char(1) &&
        p1_team_has_char(18) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(1) && p1_won_a_round()) &&
        never(p1_dont_have_char(18) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)

achievement(
    title = "The Young and The Emperor", points = 10,
    description = "Beat the game playing only as Sagat and Joe on default difficulty",
    id = 93853, badge = "101924", published = "07/01/2020 13:34:47", modified = "07/01/2020 14:14:21",
    trigger =
        p1_team_has_char(9) &&
        p1_team_has_char(34) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(9) && p1_won_a_round()) &&
        never(p1_dont_have_char(34) && p1_won_a_round()) &&

        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)

achievement(
    title = "Girl Power", points = 10,
    description = "Beat the game playing only as Chun-li and Mai on default difficulty",
    id = 93859, badge = "102099", published = "07/01/2020 13:34:54", modified = "07/01/2020 14:14:28",
    trigger =
        p1_team_has_char(2) &&
        p1_team_has_char(20) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(2) && p1_won_a_round()) &&
        never(p1_dont_have_char(20) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)

achievement(
    title = "Master and Slave", points = 10,
    description = "Beat the game playing only as Vice and Rugal on default difficulty",
    id = 93860, badge = "102100", published = "07/01/2020 13:34:56", modified = "23/04/2021 14:38:18",
    trigger =
        p1_team_has_char(26) &&
        p1_team_has_char(25) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(26) && p1_won_a_round()) &&
        never(p1_dont_have_char(25) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)

achievement(
    title = "Abnormal Muscles", points = 10,
    description = "Beat the game playing only as Zangief and Raiden on default difficulty",
    id = 93861, badge = "102101", published = "07/01/2020 13:34:57", modified = "23/04/2021 14:38:09",
    trigger =
        p1_team_has_char(4) &&
        p1_team_has_char(24) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(4) && p1_won_a_round()) &&
        never(p1_dont_have_char(24) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)

achievement(
    title = "Narcissism", points = 10,
    description = "Beat the game playing only as Vega and Benimaru on default difficulty",
    id = 93862, badge = "102102", published = "07/01/2020 13:34:58", modified = "07/01/2020 14:14:30",
    trigger =
        p1_team_has_char(8) &&
        p1_team_has_char(27) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(8) && p1_won_a_round()) &&
        never(p1_dont_have_char(27) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)


achievement(
    title = "Double Hakkeshu", points = 10,
    description = "Beat the game playing only as Vice and Yamazaki on default difficulty",
    id = 93863, badge = "102103", published = "07/01/2020 13:35:01", modified = "07/01/2020 14:14:31",
    trigger =
        p1_team_has_char(26) &&
        p1_team_has_char(23) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(26) && p1_won_a_round()) &&
        never(p1_dont_have_char(23) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)

achievement(
    title = "Dimensional Problems", points = 10,
    description = "Beat the game playing only as Morrigan and Nakoruru on default difficulty",
    id = 93864, badge = "102104", published = "07/01/2020 13:35:03", modified = "07/01/2020 14:14:35",
    trigger =
        p1_team_has_char(14) &&
        p1_team_has_char(30) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(14) && p1_won_a_round()) &&
        never(p1_dont_have_char(30) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)

achievement(
    title = "Treasure Guardians", points = 10,
    description = "Beat the game playing only as Kyo and Iori on default difficulty",
    id = 93865, badge = "102105", published = "07/01/2020 13:35:04", modified = "07/01/2020 14:14:33",
    trigger =
        p1_team_has_char(16) &&
        p1_team_has_char(17) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(16) && p1_won_a_round()) &&
        never(p1_dont_have_char(17) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)

achievement(
    title = "Clown Champions", points = 10,
    description = "Beat the game playing only as Dan and Joe on default difficulty",
    id = 93866, badge = "102106", published = "07/01/2020 13:35:06", modified = "01/05/2021 21:58:52",
    trigger =
        p1_team_has_char(33) &&
        p1_team_has_char(34) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(33) && p1_won_a_round()) &&
        never(p1_dont_have_char(34) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)

achievement(
    title = "Justice For All", points = 10,
    description = "Beat the game playing only as Guile and Kim on default difficulty",
    id = 93867, badge = "102107", published = "07/01/2020 13:35:07", modified = "07/01/2020 14:14:36",
    trigger =
        p1_team_has_char(3) &&
        p1_team_has_char(21) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(3) && p1_won_a_round()) &&
        never(p1_dont_have_char(21) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)


achievement(
    title = "Criminal Team Up", points = 10,
    description = "Beat the game playing only as M.Bison and Geese on default difficulty",
    id = 93854, badge = "102093", published = "07/01/2020 13:34:49", modified = "07/01/2020 14:14:22",
    trigger =
        p1_team_has_char(10) &&
        p1_team_has_char(22) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(10) && p1_won_a_round()) &&
        never(p1_dont_have_char(22) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)

achievement(
    title = "Dark Hadou", points = 10,
    description = "Beat the game playing only as Evil Ryu and Akuma on default difficulty",
    id = 93855, badge = "102094", published = "07/01/2020 13:34:50", modified = "11/01/2020 23:24:25",
    trigger =
        p1_team_has_char(15) &&
        p1_team_has_char(13) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(15) && p1_won_a_round()) &&
        never(p1_dont_have_char(13) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)

achievement(
    title = "Insanity", points = 10,
    description = "Beat the game playing only as Orochi Iori and Yamazaki on default difficulty",
    id = 93856, badge = "102095", published = "07/01/2020 13:34:51", modified = "11/01/2020 23:24:24",
    trigger =
        p1_team_has_char(31) &&
        p1_team_has_char(23) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(31) && p1_won_a_round()) &&
        never(p1_dont_have_char(23) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)

achievement(
    title = "Grandmasters", points = 10,
    description = "Beat the game playing only as Balrog and Vega on default difficulty",
    id = 93868, badge = "102108", published = "07/01/2020 13:35:09", modified = "23/04/2021 22:09:17",
    trigger =
        p1_team_has_char(32) &&
        p1_team_has_char(8) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(32) && p1_won_a_round()) &&
        never(p1_dont_have_char(8) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)

achievement(
    title = "Easy Win", points = 10,
    description = "Beat the game playing only as Dan and Yuri on default difficulty",
    id = 93872, badge = "102112", published = "07/01/2020 13:35:18", modified = "07/01/2020 14:14:43",
    trigger =
        p1_team_has_char(33) &&
        p1_team_has_char(28) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(33) && p1_won_a_round()) &&
        never(p1_dont_have_char(28) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)


achievement(
    title = "School Fighting", points = 10,
    description = "Beat the game playing only as Sakura and Kyo on default difficulty",
    id = 93873, badge = "102113", published = "07/01/2020 13:35:20", modified = "07/01/2020 14:14:44",
    trigger =
        p1_team_has_char(11) &&
        p1_team_has_char(16) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(11) && p1_won_a_round()) &&
        never(p1_dont_have_char(16) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)

achievement(
    title = "Shadaloo Force", points = 10,
    description = "Beat the game playing only as M.Bison and Cammy on default difficulty.",
    id = 93874, badge = "102805", published = "07/01/2020 13:35:22", modified = "07/01/2020 14:14:44",
    trigger =
        p1_team_has_char(10) &&
        p1_team_has_char(12) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(10) && p1_won_a_round()) &&
        never(p1_dont_have_char(12) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)

achievement(
    title = "World Warriors", points = 10,
    description = "Beat the game playing only as Dhalsim, E-Honda, and Blanka on default difficulty.",
    id = 93869, badge = "102109", published = "07/01/2020 13:35:11", modified = "23/04/2021 22:09:19",
    trigger =
        p1_team_has_char(5) &&
        p1_team_has_char(6) &&
        p1_team_has_char(7) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(5) && p1_won_a_round()) &&
        never(p1_dont_have_char(6) && p1_won_a_round()) &&
        never(p1_dont_have_char(7) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)

achievement(
    title = "Art of Fighting", points = 10,
    description = "Beat the game playing only as Yuri, King, and Ryo on default difficulty.",
    id = 93870, badge = "102110", published = "07/01/2020 13:35:12", modified = "07/01/2020 14:14:40",
    trigger =
        p1_team_has_char(28) &&
        p1_team_has_char(29) &&
        p1_team_has_char(19) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(28) && p1_won_a_round()) &&
        never(p1_dont_have_char(29) && p1_won_a_round()) &&
        never(p1_dont_have_char(19) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)

achievement(
    title = "Team 4 SNK", points = 10,
    description = "Beat the game playing only as Vice, Benimaru, Yuri, and King on default difficulty",
    id = 93871, badge = "102111", published = "07/01/2020 13:35:15", modified = "07/01/2020 14:14:41",
    trigger =
        p1_team_has_char(26) &&
        p1_team_has_char(27) &&
        p1_team_has_char(28) &&
        p1_team_has_char(29) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(26) && p1_won_a_round()) &&
        never(p1_dont_have_char(27) && p1_won_a_round()) &&
        never(p1_dont_have_char(28) && p1_won_a_round()) &&
        never(p1_dont_have_char(29) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)

achievement(
    title = "Team 4 Capcom", points = 10,
    description = "Beat the game playing only as Dhalsim, Blanka, Sakura, and Cammy on default difficulty",
    id = 92410, badge = "102092", published = "28/12/2019 14:24:28", modified = "07/01/2020 14:14:40",
    trigger =
        p1_team_has_char(5) &&
        p1_team_has_char(7) &&
        p1_team_has_char(11) &&
        p1_team_has_char(12) &&
        trigger_when(game_beaten()) &&
        once(p1_character_slot_1() == 255 && game_current_match() == 0) &&
        p1_active_state() >= 1 &&
        p2_active_state() == 0 &&
        never(p1_dont_have_char(5) && p1_won_a_round()) &&
        never(p1_dont_have_char(7) && p1_won_a_round()) &&
        never(p1_dont_have_char(11) && p1_won_a_round()) &&
        never(p1_dont_have_char(12) && p1_won_a_round()) &&
        
        never(game_bgm_2() == 30) &&
        setting_difficulty() >= 1
)
