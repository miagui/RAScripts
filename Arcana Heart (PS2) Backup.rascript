// Arcana Heart
// #ID = 20524

function number_of_times_played_as_heart_aino_32_bit() => dword(0x323EA0)
function number_of_times_played_as_saki_tsuzura_32_bit() => dword(0x323EA4)
function number_of_times_played_as_kamui_tokinomiya_32_bit() => dword(0x323EA8)
function number_of_times_played_as_konoha_32_bit() => dword(0x323EAC)
function number_of_times_played_as_maori_kasuga_32_bit() => dword(0x323EB0)
function number_of_times_played_as_mei_fang_32_bit() => dword(0x323EB4)
function number_of_times_played_as_lilicia_felchenrow_32_bit() => dword(0x323EB8)
function lieselotte_bonus_unlock_flag_32_bit() => dword(0x323EBC)
function number_of_times_played_as_yoriko_yasuzumi_32_bit() => dword(0x323EC0)
function number_of_times_played_as_kira_daidohji_32_bit() => dword(0x323EC4)
function number_of_times_played_as_fiona_mayfield_32_bit() => dword(0x323EC8)
function mildred_avalon_image_unlock_flag_32_bit() => dword(0x323ECC)
function number_of_times_used_partinias_arcana_32_bit() => dword(0x323ED0)
function number_of_times_used_bhanri_arcana_32_bit() => dword(0x323ED4)
function number_of_times_used_anutpada_arcana_32_bit() => dword(0x323ED8)
function number_of_times_used_moriomoto_arcana_32_bit() => dword(0x323EDC)
function number_of_times_used_ohtsuchi_arcana_32_bit() => dword(0x323EE0)
function number_of_times_used_lang_gong_arcana_32_bit() => dword(0x323EE4)
function number_of_times_used_tempestas_arcana_32_bit() => dword(0x323EE8)
function number_of_times_used_gier_arcana_32_bit() => dword(0x323EEC)
function number_of_times_used_dieu_mort_arcana_32_bit() => dword(0x323EF0)
function number_of_times_used_niptra_arcana_32_bit() => dword(0x323EF4)
function number_of_times_used_orichalkos_arcana_32_bit() => dword(0x323EF8)
function players_active_8_bit() => byte(0x465DC0)
function difficulty_8_bit() => byte(0x465DDC)
function time_limit_8_bit() => byte(0x465DE0)
function cpu_matches_hp_8_bit() => byte(0x465DE8)
function game_mode_8_bit() => byte(0x465E00)
function p1_character_8_bit() => byte(0x465E04)
function p1_character_8_bit() => dword(0x465E04)
function p1_arcana_8_bit() => byte(0x465E08)
function p1_arcana_8_bit() => dword(0x465E08)
function story_arcade_mode_fight_number_8_bit() => byte(0x465E14)
function p2_character_8_bit() => byte(0x465E18)
function number_of_continues_8_bit() => byte(0x465E2C)
function balancing_mode_8_bit() => byte(0x466970)
function last_spawned_object_in_the_world_32_bit_pointer() => dword(0x466C28)
function round_timer_32_bit() => dword(0x46900C)
function p1_gauge_bar_32_bit() => dword(0x469DC0)
function p1_move_cancel_sprite_flicker_32_bit() => dword(0x469E74)
function p1_guard_cancel_bit6() => bit6(0x469EF1)
function p1_state_bitflags_homing() => bit0(0x469EF3)
function p1_homing_cancel_bit0() => bit0(0x469EF8)
function p1_hp_32_bit() => dword(0x469FA8)
function p2_hp_32_bit() => dword(0x46B094)
function p1_hit_combo_32_bit() => dword(0x46B22C)
function p1_number_of_rounds_won_8_bit() => byte(0x46B25C)
function p1_round_finishing_move_32_bit() => dword(0x46B268)
function training_recovery_32_bit() => byte(0x4919C8)
function p1_move_3_16_bit_main() => word(0x1FCA5BC)

achievement(
    title = "Mao-Mao", points = 5,
    description = "Perform a 13-hit combo with \"Recovery\" set to \"Aerial\" as Maori Kasuga during Training mode. (no Arcana moves)",
    id = 346417, badge = "391802", published = "20/08/2023 13:52:57", modified = "20/08/2023 13:52:57",
    trigger = bit0(0x465DC0) == 0x01 && game_mode_8_bit() == 0x05 && (training_recovery_32_bit() == 0x01 || training_recovery_32_bit() == 0x03) && 
              never(p1_character_8_bit() != 0x04) && never(p1_move_3_16_bit_main() >= 0x300) && never(p1_hit_combo_32_bit() == 0x00) && 
              once(p1_hit_combo_32_bit() > 0x00 && prev(p1_hit_combo_32_bit()) == 0x00) && trigger_when(p1_hit_combo_32_bit() >= 0x0D)
)

achievement(
    title = "Elemental Combination", points = 5,
    description = "Win a round with the Arcana Blaze that your character is a user against the CPU.",
    id = 346264, badge = "391549", published = "19/08/2023 14:38:17", modified = "19/08/2023 14:38:17",
    trigger = players_active_8_bit() == 0x01 && game_mode_8_bit() != 0x05 && p1_character_8_bit() == p1_arcana_8_bit() && p1_round_finishing_move_32_bit()
               == 0x07 && prev(p1_round_finishing_move_32_bit()) == 0xFFFFFFFF
)

achievement(
    title = "Dangerous Maiden", points = 3,
    description = "Win a round with a Super Combo against the CPU.",
    id = 346265, badge = "391550", published = "19/08/2023 14:38:17", modified = "19/08/2023 14:38:17",
    trigger = players_active_8_bit() == 0x01 && game_mode_8_bit() != 0x05 && p1_round_finishing_move_32_bit() == 0x05 && prev(p1_round_finishing_move_32_bit()) ==
               0xFFFFFFFF
)

achievement(
    title = "Eloim, Essaim, Frugativi et Appelavi", points = 3,
    description = "Create a pentagram with Ancient Talisman as Yoriko.",
    id = 346266, badge = "391551", published = "19/08/2023 14:38:17", modified = "19/08/2023 14:38:17",
    trigger = bit0(0x465DC0) == 0x01 && p1_character_8_bit() == 0x08 && p1_move_3_16_bit_main() == 0x219 && prev(p1_move_3_16_bit_main()) !=
               0x219
)

achievement(
    title = "Concentration of Metal", points = 3,
    description = "Fill your Super Meter to maximum while using the arcana Oreichalkos against the CPU.",
    id = 346267, badge = "391552", published = "19/08/2023 14:38:18", modified = "19/08/2023 14:38:18",
    trigger = players_active_8_bit() == 0x01 && game_mode_8_bit() != 0x05 && p1_arcana_8_bit() == 0x0A && p1_gauge_bar_32_bit() == 0x255A8 && 
              prev(p1_gauge_bar_32_bit()) < 0x255A8 && prev(p1_gauge_bar_32_bit()) > 0x01
)

achievement(
    title = "Harmonious Retaliation", points = 5,
    description = "Sucessfully parry an attack and counter-attack with Shi Matsuri against the CPU as Kamui.",
    id = 346268, badge = "391553", published = "19/08/2023 14:38:18", modified = "19/08/2023 14:38:18",
    trigger = players_active_8_bit() == 0x01 && game_mode_8_bit() != 0x05 && p1_character_8_bit() == 0x02 && p1_move_3_16_bit_main() == 0x264 && 
              prev(p1_move_3_16_bit_main()) != 0x264
)

achievement(
    title = "The Extraordinarily Rare Maiden", points = 4,
    description = "Perform a 20-hit combo with \"Recovery\" set to \"Aerial\" as Heart Aino during Training mode. (no Arcana moves)",
    id = 346413, badge = "391798", published = "20/08/2023 13:52:55", modified = "20/08/2023 13:58:48",
    trigger = bit0(0x465DC0) == 0x01 && game_mode_8_bit() == 0x05 && (training_recovery_32_bit() == 0x01 || training_recovery_32_bit() == 0x03) && 
              never(p1_character_8_bit() != 0x00) && never(p1_move_3_16_bit_main() >= 0x300) && never(p1_hit_combo_32_bit() == 0x00) && 
              once(p1_hit_combo_32_bit() > 0x00 && prev(p1_hit_combo_32_bit()) == 0x00) && trigger_when(p1_hit_combo_32_bit() >= 0x14)
)

achievement(
    title = "Sa-Sa", points = 5,
    description = "Perform a 15-hit combo with \"Recovery\" set to \"Aerial\" as Saki Tsuzura during Training mode. (no Arcana moves)",
    id = 346414, badge = "391799", published = "20/08/2023 13:52:56", modified = "20/08/2023 13:52:56",
    trigger = bit0(0x465DC0) == 0x01 && game_mode_8_bit() == 0x05 && (training_recovery_32_bit() == 0x01 || training_recovery_32_bit() == 0x03) && 
              never(p1_character_8_bit() != 0x01) && never(p1_move_3_16_bit_main() >= 0x300) && never(p1_hit_combo_32_bit() == 0x00) && 
              once(p1_hit_combo_32_bit() > 0x00 && prev(p1_hit_combo_32_bit()) == 0x00) && trigger_when(p1_hit_combo_32_bit() >= 0x0F)
)

achievement(
    title = "The Millennial Guardian", points = 5,
    description = "Perform a 9-hit combo with \"Recovery\" set to \"Aerial\" as Kamui Tokinomiya during Training mode. (no Arcana moves)",
    id = 346415, badge = "391800", published = "20/08/2023 13:52:56", modified = "20/08/2023 13:52:56",
    trigger = bit0(0x465DC0) == 0x01 && game_mode_8_bit() == 0x05 && (training_recovery_32_bit() == 0x01 || training_recovery_32_bit() == 0x03) && 
              never(p1_character_8_bit() != 0x02) && never(p1_move_3_16_bit_main() >= 0x300) && never(p1_hit_combo_32_bit() == 0x00) && 
              once(p1_hit_combo_32_bit() > 0x00 && prev(p1_hit_combo_32_bit()) == 0x00) && trigger_when(p1_hit_combo_32_bit() >= 0x09)
)

achievement(
    title = "Retainer of the Millenial Guardian", points = 4,
    description = "Perform a 104-hit combo with \"Recovery\" set to \"Aerial\" as Konoha during Training mode. (no Arcana moves)",
    id = 346416, badge = "391801", published = "20/08/2023 13:52:57", modified = "20/08/2023 13:58:49",
    trigger = bit0(0x465DC0) == 0x01 && game_mode_8_bit() == 0x05 && (training_recovery_32_bit() == 0x01 || training_recovery_32_bit() == 0x03) && 
              never(p1_character_8_bit() != 0x03) && never(p1_move_3_16_bit_main() >= 0x300) && never(p1_hit_combo_32_bit() == 0x00) && 
              once(p1_hit_combo_32_bit() > 0x00 && prev(p1_hit_combo_32_bit()) == 0x00) && trigger_when(p1_hit_combo_32_bit() >= 0x68)
)

achievement(
    title = "Plushy Love", points = 10,
    description = "Make a stuffed animal appear during Kawarimi no Jutsu as Konoha.",
    id = 346263, badge = "391548", published = "19/08/2023 14:38:16", modified = "19/08/2023 14:38:16",
    trigger = bit0(0x465DC0) == 0x01 && p1_character_8_bit() == 0x03 && dword(last_spawned_object_in_the_world_32_bit_pointer() + 0x000058) == 0x00 && 
              dword(last_spawned_object_in_the_world_32_bit_pointer() + 0x00005C) == 0x265
)

achievement(
    title = "Mei-Mei", points = 5,
    description = "Perform a 15-hit combo with \"Recovery\" set to \"Aerial\" as Mei-Fang during Training mode. (no Arcana moves)",
    id = 346418, badge = "391803", published = "20/08/2023 13:52:58", modified = "20/08/2023 13:52:58",
    trigger = bit0(0x465DC0) == 0x01 && game_mode_8_bit() == 0x05 && (training_recovery_32_bit() == 0x01 || training_recovery_32_bit() == 0x03) && 
              never(p1_character_8_bit() != 0x05) && never(p1_move_3_16_bit_main() >= 0x300) && never(p1_hit_combo_32_bit() == 0x00) && 
              once(p1_hit_combo_32_bit() > 0x00 && prev(p1_hit_combo_32_bit()) == 0x00) && trigger_when(p1_hit_combo_32_bit() >= 0x0F)
)

achievement(
    title = "Lili-Lili", points = 5,
    description = "Perform a 15-hit combo with \"Recovery\" set to \"Aerial\" as Lilica Felchenerow during Training mode. (no Arcana moves)",
    id = 346419, badge = "391804", published = "20/08/2023 13:52:58", modified = "20/08/2023 13:58:49",
    trigger = bit0(0x465DC0) == 0x01 && game_mode_8_bit() == 0x05 && (training_recovery_32_bit() == 0x01 || training_recovery_32_bit() == 0x03) && 
              never(p1_character_8_bit() != 0x06) && never(p1_move_3_16_bit_main() >= 0x300) && never(p1_hit_combo_32_bit() == 0x00) && 
              once(p1_hit_combo_32_bit() > 0x00 && prev(p1_hit_combo_32_bit()) == 0x00) && trigger_when(p1_hit_combo_32_bit() >= 0x0F)
)

achievement(
    title = "Liesy-Poo", points = 5,
    description = "Perform a 20-hit combo with \"Recovery\" set to \"Aerial\" as Lieselotte Achenbach during Training mode. (no Arcana moves)",
    id = 346420, badge = "391805", published = "20/08/2023 13:52:59", modified = "20/08/2023 13:52:59",
    trigger = bit0(0x465DC0) == 0x01 && game_mode_8_bit() == 0x05 && (training_recovery_32_bit() == 0x01 || training_recovery_32_bit() == 0x03) && 
              never(p1_character_8_bit() != 0x07) && never(p1_move_3_16_bit_main() >= 0x300) && never(p1_hit_combo_32_bit() == 0x00) && 
              once(p1_hit_combo_32_bit() > 0x00 && prev(p1_hit_combo_32_bit()) == 0x00) && trigger_when(p1_hit_combo_32_bit() >= 0x14)
)

achievement(
    title = "Yori-Poo", points = 5,
    description = "Perform a 17-hit combo with \"Recovery\" set to \"Aerial\" as Yoriko Yasuzumi during Training mode. (no Arcana moves)",
    id = 346421, badge = "391806", published = "20/08/2023 13:52:59", modified = "20/08/2023 13:52:59",
    trigger = bit0(0x465DC0) == 0x01 && game_mode_8_bit() == 0x05 && (training_recovery_32_bit() == 0x01 || training_recovery_32_bit() == 0x03) && 
              never(p1_character_8_bit() != 0x08) && never(p1_move_3_16_bit_main() >= 0x300) && never(p1_hit_combo_32_bit() == 0x00) && 
              once(p1_hit_combo_32_bit() > 0x00 && prev(p1_hit_combo_32_bit()) == 0x00) && trigger_when(p1_hit_combo_32_bit() >= 0x11)
)

achievement(
    title = "Swimsuit Scientist", points = 5,
    description = "Perform a 6-hit combo with \"Recovery\" set to \"Aerial\" as Kira Daidohji during Training mode. (no Arcana moves)",
    id = 346422, badge = "391807", published = "20/08/2023 13:52:59", modified = "20/08/2023 13:52:59",
    trigger = bit0(0x465DC0) == 0x01 && game_mode_8_bit() == 0x05 && (training_recovery_32_bit() == 0x01 || training_recovery_32_bit() == 0x03) && 
              never(p1_character_8_bit() != 0x09) && never(p1_move_3_16_bit_main() >= 0x300) && never(p1_hit_combo_32_bit() == 0x00) && 
              once(p1_hit_combo_32_bit() > 0x00 && prev(p1_hit_combo_32_bit()) == 0x00) && trigger_when(p1_hit_combo_32_bit() >= 0x06)
)

achievement(
    title = "Maid Lady", points = 4,
    description = "Perform a 20-hit combo with \"Recovery\" set to \"Aerial\" as Fiona Mayfield during Training mode. (no Arcana moves)",
    id = 346423, badge = "391808", published = "20/08/2023 13:53:00", modified = "20/08/2023 13:58:50",
    trigger = bit0(0x465DC0) == 0x01 && game_mode_8_bit() == 0x05 && (training_recovery_32_bit() == 0x01 || training_recovery_32_bit() == 0x03) && 
              never(p1_character_8_bit() != 0x0A) && never(p1_move_3_16_bit_main() >= 0x300) && never(p1_hit_combo_32_bit() == 0x00) && 
              once(p1_hit_combo_32_bit() > 0x00 && prev(p1_hit_combo_32_bit()) == 0x00) && trigger_when(p1_hit_combo_32_bit() >= 0x14)
)

// achievement(
//     title = "The New Elemental World", points = 5,
//     description = "Finish Story Mode with a bad ending. (Default Settings)",
//     id = 346434, badge = "391864", published = "20/08/2023 16:50:04", modified = "20/08/2023 16:55:11",
//     trigger = prev(story_arcade_mode_fight_number_8_bit()) == 0x07 && story_arcade_mode_fight_number_8_bit() == 0x08 && p1_hp_32_bit() > p2_hp_32_bit() && 
//               round_timer_32_bit() == 0x00 && players_active_8_bit() == 0x01 && p2_character_8_bit() == 0x0B && difficulty_8_bit() == 0x04 && 
//               time_limit_8_bit() == 0x00 && game_mode_8_bit() == 0x01 && cpu_matches_hp_8_bit() == 0x06
// )

// achievement(
//     title = "Arcade Clear!", points = 5,
//     description = "Finish Arcade mode as any character. (Default Settings)",
//     id = 346459, badge = "391892", published = "20/08/2023 17:20:14", modified = "20/08/2023 17:20:14",
//     trigger = prev(story_arcade_mode_fight_number_8_bit()) == 0x09 && story_arcade_mode_fight_number_8_bit() == 0x0A && game_mode_8_bit() == 0x02 && difficulty_8_bit() == 0x04 && 
//               time_limit_8_bit() == 0x00 && p2_hp_32_bit() == 0x00 && p1_character_8_bit() <= 0x0A && players_active_8_bit() == 0x01 && 
//               cpu_matches_hp_8_bit() == 0x06
// )

// achievement(
//     title = "Fiona Mayfield", points = 5,
//     description = "Finish Story Mode as Fiona Mayfield. (Default Settings)",
//     id = 345228, badge = "391855", published = "14/08/2023 17:30:36", modified = "20/08/2023 16:12:23",
//     trigger = prev(story_arcade_mode_fight_number_8_bit()) == 0x07 && story_arcade_mode_fight_number_8_bit() == 0x08 && game_mode_8_bit() == 0x01 && difficulty_8_bit() == 0x04 && 
//               time_limit_8_bit() == 0x00 && p2_character_8_bit() == 0x0B && p2_hp_32_bit() == 0x00 && p1_character_8_bit() == 0x0A && 
//               players_active_8_bit() == 0x01
// )

// achievement(
//     title = "Saki Tsuzura", points = 5,
//     description = "Finish Story Mode as Saki Tsuzura. (Default Settings)",
//     id = 345219, badge = "391846", published = "14/08/2023 17:30:32", modified = "20/08/2023 16:12:16",
//     trigger = prev(story_arcade_mode_fight_number_8_bit()) == 0x07 && story_arcade_mode_fight_number_8_bit() == 0x08 && game_mode_8_bit() == 0x01 && difficulty_8_bit() == 0x04 && 
//               time_limit_8_bit() == 0x00 && p2_character_8_bit() == 0x0B && p2_hp_32_bit() == 0x00 && p1_character_8_bit() == 0x01 && 
//               players_active_8_bit() == 0x01
// )

// achievement(
//     title = "Kamui Tokinomiya", points = 5,
//     description = "Finish Story Mode as Kamui Tokinomiya. (Default Settings)",
//     id = 345220, badge = "391847", published = "14/08/2023 17:30:32", modified = "20/08/2023 16:12:16",
//     trigger = prev(story_arcade_mode_fight_number_8_bit()) == 0x07 && story_arcade_mode_fight_number_8_bit() == 0x08 && game_mode_8_bit() == 0x01 && difficulty_8_bit() == 0x04 && 
//               time_limit_8_bit() == 0x00 && p2_character_8_bit() == 0x0B && p2_hp_32_bit() == 0x00 && p1_character_8_bit() == 0x02 && 
//               players_active_8_bit() == 0x01
// )

// achievement(
//     title = "Konoha", points = 5,
//     description = "Finish Story Mode as Konoha. (Default Settings)",
//     id = 345221, badge = "391848", published = "14/08/2023 17:30:33", modified = "20/08/2023 16:12:17",
//     trigger = prev(story_arcade_mode_fight_number_8_bit()) == 0x07 && story_arcade_mode_fight_number_8_bit() == 0x08 && game_mode_8_bit() == 0x01 && difficulty_8_bit() == 0x04 && 
//               time_limit_8_bit() == 0x00 && p2_character_8_bit() == 0x0B && p2_hp_32_bit() == 0x00 && p1_character_8_bit() == 0x03 && 
//               players_active_8_bit() == 0x01
// )

// achievement(
//     title = "Maori Kasuga", points = 5,
//     description = "Finish Story Mode as Maori Kasuga. (Default Settings)",
//     id = 345222, badge = "391849", published = "14/08/2023 17:30:33", modified = "20/08/2023 16:12:18",
//     trigger = prev(story_arcade_mode_fight_number_8_bit()) == 0x07 && story_arcade_mode_fight_number_8_bit() == 0x08 && game_mode_8_bit() == 0x01 && difficulty_8_bit() == 0x04 && 
//               time_limit_8_bit() == 0x00 && p2_character_8_bit() == 0x0B && p2_hp_32_bit() == 0x00 && p1_character_8_bit() == 0x04 && 
//               players_active_8_bit() == 0x01
// )

// achievement(
//     title = "Mei-Fang", points = 5,
//     description = "Finish Story Mode as Mei-Fang. (Default Settings)",
//     id = 345223, badge = "391850", published = "14/08/2023 17:30:34", modified = "20/08/2023 16:12:18",
//     trigger = prev(story_arcade_mode_fight_number_8_bit()) == 0x07 && story_arcade_mode_fight_number_8_bit() == 0x08 && game_mode_8_bit() == 0x01 && difficulty_8_bit() == 0x04 && 
//               time_limit_8_bit() == 0x00 && p2_character_8_bit() == 0x0B && p2_hp_32_bit() == 0x00 && p1_character_8_bit() == 0x05 && 
//               players_active_8_bit() == 0x01
// )

// achievement(
//     title = "Lilica Felchenrow", points = 5,
//     description = "Finish Story Mode as Lilica Felchenrow. (Default Settings)",
//     id = 345224, badge = "391851", published = "14/08/2023 17:30:34", modified = "20/08/2023 16:12:19",
//     trigger = prev(story_arcade_mode_fight_number_8_bit()) == 0x07 && story_arcade_mode_fight_number_8_bit() == 0x08 && game_mode_8_bit() == 0x01 && difficulty_8_bit() == 0x04 && 
//               time_limit_8_bit() == 0x00 && p2_character_8_bit() == 0x0B && p2_hp_32_bit() == 0x00 && p1_character_8_bit() == 0x06 && 
//               players_active_8_bit() == 0x01
// )

// achievement(
//     title = "Lieselotte Achenbach", points = 5,
//     description = "Finish Story Mode as Lieselotte Achenbach. (Default Settings)",
//     id = 345225, badge = "391852", published = "14/08/2023 17:30:34", modified = "20/08/2023 16:12:20",
//     trigger = prev(story_arcade_mode_fight_number_8_bit()) == 0x07 && story_arcade_mode_fight_number_8_bit() == 0x08 && game_mode_8_bit() == 0x01 && difficulty_8_bit() == 0x04 && 
//               time_limit_8_bit() == 0x00 && p2_character_8_bit() == 0x0B && p2_hp_32_bit() == 0x00 && p1_character_8_bit() == 0x07 && 
//               players_active_8_bit() == 0x01
// )

// achievement(
//     title = "Yoriko Yasuzumi", points = 5,
//     description = "Finish Story Mode as Yoriko Yasuzumi. (Default Settings)",
//     id = 345226, badge = "391853", published = "14/08/2023 17:30:35", modified = "20/08/2023 16:12:21",
//     trigger = prev(story_arcade_mode_fight_number_8_bit()) == 0x07 && story_arcade_mode_fight_number_8_bit() == 0x08 && game_mode_8_bit() == 0x01 && difficulty_8_bit() == 0x04 && 
//               time_limit_8_bit() == 0x00 && p2_character_8_bit() == 0x0B && p2_hp_32_bit() == 0x00 && p1_character_8_bit() == 0x08 && 
//               players_active_8_bit() == 0x01
// )

// achievement(
//     title = "Kira Daidohji", points = 5,
//     description = "Finish Story Mode as Lieselotte Achenbach. (Default Settings)",
//     id = 345227, badge = "391854", published = "14/08/2023 17:30:35", modified = "20/08/2023 16:12:22",
//     trigger = prev(story_arcade_mode_fight_number_8_bit()) == 0x07 && story_arcade_mode_fight_number_8_bit() == 0x08 && game_mode_8_bit() == 0x01 && difficulty_8_bit() == 0x04 && 
//               time_limit_8_bit() == 0x00 && p2_character_8_bit() == 0x0B && p2_hp_32_bit() == 0x00 && p1_character_8_bit() == 0x09 && 
//               players_active_8_bit() == 0x01
// )

// achievement(
//     title = "Heart Aino", points = 5,
//     description = "Finish Story Mode as Heart Aino. (Default Settings)",
//     id = 345218, badge = "391845", published = "14/08/2023 17:30:32", modified = "20/08/2023 16:12:15",
//     trigger = prev(story_arcade_mode_fight_number_8_bit()) == 0x07 && story_arcade_mode_fight_number_8_bit() == 0x08 && p1_character_8_bit() == 0x00 && game_mode_8_bit() == 0x01 && 
//               difficulty_8_bit() == 0x04 && time_limit_8_bit() == 0x00 && p2_character_8_bit() == 0x0B && p2_hp_32_bit() == 0x00 && 
//               players_active_8_bit() == 0x01
// )

// achievement(
//     title = "Story Master", points = 10,
//     description = "Finish Story Mode on max difficulty as any character. (otherwise default settings)",
//     id = 345229, badge = "391856", published = "14/08/2023 17:30:36", modified = "20/08/2023 16:12:23",
//     trigger = prev(story_arcade_mode_fight_number_8_bit()) == 0x07 && story_arcade_mode_fight_number_8_bit() == 0x08 && game_mode_8_bit() == 0x01 && difficulty_8_bit() == 0x08 && 
//               time_limit_8_bit() == 0x00 && p2_character_8_bit() == 0x0B && p2_hp_32_bit() == 0x00 && p1_character_8_bit() <= 0x0A && 
//               players_active_8_bit() == 0x01
// )

// achievement(
//     title = "Rebalanced Arcana", points = 5,
//     description = "Finish Arcade or Story mode using only Arcana Heart Full! mode. (Default Settings)",
//     id = 345230, badge = "391863", published = "14/08/2023 17:30:37", modified = "20/08/2023 16:55:08",
//     trigger = difficulty_8_bit() == 0x04 && time_limit_8_bit() == 0x00 && p2_hp_32_bit() == 0x00 && p1_character_8_bit() <= 0x0A && 
//               players_active_8_bit() == 0x01 && balancing_mode_8_bit() == 0x01 && cpu_matches_hp_8_bit() == 0x06 &&
//               ((prev(story_arcade_mode_fight_number_8_bit()) == 0x07 && story_arcade_mode_fight_number_8_bit() == 0x08 && game_mode_8_bit() == 0x01 && p2_character_8_bit() ==
//                  0x0B) ||
//                (prev(story_arcade_mode_fight_number_8_bit()) == 0x09 && story_arcade_mode_fight_number_8_bit() == 0x0A && game_mode_8_bit() == 0x02))
// )

// achievement(
//     title = "Unbeatable!", points = 10,
//     description = "Complete Arcade Mode as any character without using a continue. (Default Settings)",
//     id = 345231, badge = "391858", published = "14/08/2023 17:30:37", modified = "20/08/2023 16:12:25",
//     trigger = prev(story_arcade_mode_fight_number_8_bit()) == 0x09 && story_arcade_mode_fight_number_8_bit() == 0x0A && number_of_continues_8_bit() == 0x00 && difficulty_8_bit() == 0x04 && 
//               time_limit_8_bit() == 0x00 && cpu_matches_hp_8_bit() == 0x06 && game_mode_8_bit() == 0x02 && p2_hp_32_bit() == 0x00
// )

// achievement(
//     title = "Perfection!", points = 5,
//     description = "Achieve a double Perfect Victory in Arcade or Story mode. (Default Settings)",
//     id = 345232, badge = "391862", published = "14/08/2023 17:30:37", modified = "20/08/2023 16:16:01",
//     trigger = trigger_when(once(prev(p1_number_of_rounds_won_8_bit()) == 0x01)) && trigger_when(p1_number_of_rounds_won_8_bit() == 0x02) && 
//               trigger_when(p2_hp_32_bit() == 0x00) && difficulty_8_bit() == 0x04 && time_limit_8_bit() == 0x00 && 
//               cpu_matches_hp_8_bit() == 0x06 && game_mode_8_bit() <= 0x02 && game_mode_8_bit() >= 0x01 && disable_when(round_timer_32_bit()
//                == 0x00 || p1_hp_32_bit() < prev(p1_hp_32_bit()), until=story_arcade_mode_fight_number_8_bit() != prev(story_arcade_mode_fight_number_8_bit())) && 
//               players_active_8_bit() == 0x01
// )

// achievement(
//     title = "Heart of the Cards!", points = 5,
//     description = "Use every Arcana at least once.",
//     id = 345233, badge = "391860", published = "14/08/2023 17:30:37", modified = "20/08/2023 16:12:26",
//     trigger = (prev(number_of_times_used_partinias_arcana_32_bit()) / prev(number_of_times_used_partinias_arcana_32_bit()) + prev(number_of_times_used_bhanri_arcana_32_bit()) / prev(number_of_times_used_bhanri_arcana_32_bit()) +
//                prev(number_of_times_used_anutpada_arcana_32_bit()) / prev(number_of_times_used_anutpada_arcana_32_bit()) + prev(number_of_times_used_moriomoto_arcana_32_bit()) / prev(number_of_times_used_moriomoto_arcana_32_bit()) +
//                prev(number_of_times_used_ohtsuchi_arcana_32_bit()) / prev(number_of_times_used_ohtsuchi_arcana_32_bit()) + prev(number_of_times_used_lang_gong_arcana_32_bit()) / prev(number_of_times_used_lang_gong_arcana_32_bit()) +
//                prev(number_of_times_used_tempestas_arcana_32_bit()) / prev(number_of_times_used_tempestas_arcana_32_bit()) + prev(number_of_times_used_gier_arcana_32_bit()) / prev(number_of_times_used_gier_arcana_32_bit()) +
//                prev(number_of_times_used_dieu_mort_arcana_32_bit()) / prev(number_of_times_used_dieu_mort_arcana_32_bit()) + prev(number_of_times_used_niptra_arcana_32_bit()) / prev(number_of_times_used_niptra_arcana_32_bit()) +
//                prev(number_of_times_used_orichalkos_arcana_32_bit()) / prev(number_of_times_used_orichalkos_arcana_32_bit()) + 0x00) == 0x10 && measured((number_of_times_used_partinias_arcana_32_bit() /
//                number_of_times_used_partinias_arcana_32_bit() + number_of_times_used_bhanri_arcana_32_bit() / number_of_times_used_bhanri_arcana_32_bit() + number_of_times_used_anutpada_arcana_32_bit() / number_of_times_used_anutpada_arcana_32_bit() + number_of_times_used_moriomoto_arcana_32_bit()
//                / number_of_times_used_moriomoto_arcana_32_bit() + number_of_times_used_ohtsuchi_arcana_32_bit() / number_of_times_used_ohtsuchi_arcana_32_bit() + number_of_times_used_lang_gong_arcana_32_bit() / number_of_times_used_lang_gong_arcana_32_bit() +
//                number_of_times_used_tempestas_arcana_32_bit() / number_of_times_used_tempestas_arcana_32_bit() + number_of_times_used_gier_arcana_32_bit() / number_of_times_used_gier_arcana_32_bit() + number_of_times_used_dieu_mort_arcana_32_bit() / number_of_times_used_dieu_mort_arcana_32_bit()
//                + number_of_times_used_niptra_arcana_32_bit() / number_of_times_used_niptra_arcana_32_bit() + number_of_times_used_orichalkos_arcana_32_bit() / number_of_times_used_orichalkos_arcana_32_bit() + 0x00) == 0x11)
// )

// achievement(
//     title = "Artwork Appreciator!", points = 10,
//     description = "Unlock all bonus artwork for every character.",
//     id = 345234, badge = "391861", published = "14/08/2023 17:30:38", modified = "20/08/2023 16:12:27",
//     trigger = (prev(number_of_times_played_as_heart_aino_32_bit()) == 0x09 || prev(number_of_times_played_as_saki_tsuzura_32_bit()) == 0x09 || prev(number_of_times_played_as_kamui_tokinomiya_32_bit()) == 0x09 ||
//                prev(number_of_times_played_as_konoha_32_bit()) == 0x09 || prev(number_of_times_played_as_maori_kasuga_32_bit()) == 0x09 || prev(number_of_times_played_as_mei_fang_32_bit()) == 0x09 ||
//                prev(number_of_times_played_as_lilicia_felchenrow_32_bit()) == 0x09 || prev(lieselotte_bonus_unlock_flag_32_bit()) == 0x09 || prev(number_of_times_played_as_yoriko_yasuzumi_32_bit()) == 0x09 ||
//                prev(number_of_times_played_as_kira_daidohji_32_bit()) == 0x09 || prev(number_of_times_played_as_fiona_mayfield_32_bit()) == 0x09 || prev(mildred_avalon_image_unlock_flag_32_bit()) == 0x00) && 
//               number_of_times_played_as_heart_aino_32_bit() >= 0x0A && number_of_times_played_as_saki_tsuzura_32_bit() >= 0x0A && number_of_times_played_as_kamui_tokinomiya_32_bit() >= 0x0A && number_of_times_played_as_konoha_32_bit() >= 0x0A && 
//               number_of_times_played_as_maori_kasuga_32_bit() >= 0x0A && number_of_times_played_as_mei_fang_32_bit() >= 0x0A && number_of_times_played_as_lilicia_felchenrow_32_bit() >= 0x0A && lieselotte_bonus_unlock_flag_32_bit() >= 0x0A && 
//               number_of_times_played_as_yoriko_yasuzumi_32_bit() >= 0x0A && number_of_times_played_as_kira_daidohji_32_bit() >= 0x0A && number_of_times_played_as_fiona_mayfield_32_bit() >= 0x0A && mildred_avalon_image_unlock_flag_32_bit() >= 0x01
// )

achievement(
    title = "Homing Cancel", points = 2,
    description = "Perform a Homing Cancel during a match.",
    id = 346261, badge = "391546", published = "19/08/2023 14:38:15", modified = "19/08/2023 14:38:15",
    trigger = players_active_8_bit() == 0x01 && p1_move_cancel_sprite_flicker_32_bit() > 0x00 && p1_homing_cancel_bit0() == 0x01 && p1_guard_cancel_bit6() == 0x00
)

achievement(
    title = "Guard Cancel", points = 2,
    description = "Perform a Guard Cancel during a match.",
    id = 346262, badge = "391547", published = "19/08/2023 14:38:16", modified = "19/08/2023 14:38:16",
    trigger = players_active_8_bit() == 0x01 && p1_move_cancel_sprite_flicker_32_bit() > 0x00 && p1_state_bitflags_homing() == 0x01 && p1_guard_cancel_bit6() == 0x01
)
