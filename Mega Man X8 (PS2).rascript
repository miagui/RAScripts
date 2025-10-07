// Mega Man X8
// #ID = 2680


// =========================================
//             Memory Accessors              
// =========================================

// Game
function menu_selected() => dword(0x64d150)
function game_difficulty() => byte(0x64c4da)
         diff_easy = 0x00
         diff_normal = 0x01
         diff_hard = 0x02

function game_igt() => dword(0x64c4a8) // Formatted as seconds
function game_current_voice_talking() => dword(0x56e3ac)

// Player
function player_hp_display() => dword(0xc472b0)
function player_retry_chips() => dword(0x64c8b8)
function player_max_combo() => dword(0xc4e124)
function player_metals() => dword(0x64c4c4)
function player_current_char() => byte(0xc472d4)
function player_char1() => byte(0x64c42c)
function player_char2() => byte(0x64c42d)
         pl_x = 0x00
         pl_zero = 0x01
         pl_axl = 0x02
         pl_alia = 0x03
         pl_layer = 0x04
         pl_pallette = 0x05

function player_navigator() => byte(0x64c8b4)
         nav_none = 0xff
         nav_alia = 0x00
         nav_layer = 0x01
         nav_pallette = 0x02

function player_weapon() => byte(0xc47324)

function pl_zero_attacking_with_technique_flag() => byte(0x8b3d84)

function weapon_flags() => byte(0x64c4d5)

// Stage
function game_stage() => byte(0x64c88f)
         st_noahs_park = 0x00
         st_troia_base = 0x01
         st_primrose = 0x02
         st_pitch_black = 0x03
         st_dynasty = 0x04
         st_inferno = 0x05
         st_central_white = 0x06
         st_metal_valley = 0x07
         st_booster_forest = 0x08
         st_jakob = 0x09
         st_gateway = 0x0a 
         st_sigma_palace = 0x0b


function stage_camera_x() => float(0x6d1ed0)
function stage_camera_y() => float(0x6d1ed4)
function stage_camera_z() => float(0x6d1ed8)
function stage_load_section() => byte(0x9cd851)

function stage_boss_hp() => byte(0xca58a0)
function stage_max_boss_hp_display() => byte(0xca58b0)
function stage_pointer_boss_hp() => dword(0xca58b4)

function stage_sucessfully_cleared_mission_flag() => bit1(0x64c8c8)
function stage_cleared_mission_flag() => bit2(0x64c8c8)
function stage_exf_finish_flag() => bit3(0x64c8c8)
function stage_no_damage_taken_flag() => bit4(0x64c8c8)
function stage_cleared_intermission_flag() => bit5(0x64c8c8)
function stage_intermission_flag() => bit6(0x64c8c8)
function stage_fighting_stage_boss_flag() => bit0(0x64c8fc)

function stage_clear_time() => dword(0x64c8dc) // Formatted as frames
function stage_foes_defeated() => word(0x64c8e0)
function stage_highest_combo() => word(0x64c8e4)
function stage_rank() => byte(0x64c8f6)
         rank_aaa = 0x00
         rank_aa = 0x01
         rank_a = 0x02
         rank_b = 0x03
         rank_c = 0x04
         rank_d = 0x05

function stage_troia_base_mameq_eliminated() => dword(0x9cd7a8)
function stage_troia_base_room() => byte(0x9cd7b0)

function intermission_inferno_score() => dword(0x64c8ec)
function intermission_park_crabs_eliminated() => word(0x9d01d8)
function intermission_optic_remaining_time() => dword(0xd71744)

function pointer_1st_entity() => word(0x88aadc)

function pointer_boss_rush_room_1() => dword(0x9cd7cc)
function pointer_boss_rush_room_2() => dword(0x9cd7d0)
function pointer_boss_rush_room_3() => dword(0x9cd7d4)
function pointer_boss_rush_room_4() => dword(0x9cd7d8)
function pointer_boss_rush_room_5() => dword(0x9cd7dc)
function pointer_boss_rush_room_6() => dword(0x9cd7e0)
function pointer_boss_rush_room_7() => dword(0x9cd7e4)
function pointer_boss_rush_room_8() => dword(0x9cd7e8)
         pointer_offset_boss_rush_id = 0x4a4
         pointer_offset_boss_rush_active = 0x4c4

// OBS: All addresses below only in this "Stage" scope updates after leaving results screen.
// Cleared 
function intro_stage_clear() => bit0(0x64c4ae)
function troia_base_clear() => bit1(0x64c4ae)
function primrose_clear() => bit2(0x64c4ae)
function pitch_black_clear() => bit3(0x64c4ae)
function dynasty() => bit4(0x64c4ae)
function inferno() => bit5(0x64c4ae)
function central_white() => bit6(0x64c4ae)
function metal_valley() => bit7(0x64c4ae)
function booster_forest_clear() => bit0(0x64c4af)

// Hunter Rank
function intro_hunter_rank() => byte(0x64c52c)
function troia_hunter_rank() => byte(0x64c52d)
function primrose_hunter_rank() => byte(0x64c52e)
function pitch_hunter_rank() => byte(0x64c52f)
function dynasty_hunter_rank() => byte(0x64c530)
function inferno_hunter_rank() => byte(0x64c531)
function central_hunter_rank() => byte(0x64c532)
function metal_hunter_rank() => byte(0x64c533)
function forest_hunter_rank() => byte(0x64c534)
function jakob_hunter_rank() => byte(0x64c535)
function palace_hunter_rank() => byte(0x64c536)

// Clear Time (Frames)
function intro_clear_time() => dword(0x64c53c)
function troia_clear_time() => dword(0x64c540)
function primrose_clear_time() => dword(0x64c544)
function pitch_clear_time() => dword(0x64c548)
function dynasty_clear_time() => dword(0x64c54c)
function inferno_clear_time() => dword(0x64c550)
function central_clear_time() => dword(0x64c554)
function metal_clear_time() => dword(0x64c558)
function forest_clear_time() => dword(0x64c55c)
function jakob_clear_time() => dword(0x64c560)
function palace_clear_time() => dword(0x64c564)

// Foes Defeated
function intro_foes_defeated() => word(0x64c570)
function troia_foes_defeated() => word(0x64c572)
function primrose_foes_defeated() => word(0x64c574)
function pitch_foes_defeated() => word(0x64c576)
function dynasty_foes_defeated() => word(0x64c578)
function inferno_foes_defeated() => word(0x64c57a)
function central_foes_defeated() => word(0x64c57c)
function metal_foes_defeated() => word(0x64c57e)
function forest_foes_defeated() => word(0x64c580)
function jakob_foes_defeated() => word(0x64c582)
function palace_foes_defeated() => word(0x64c584)

// Highest Combo
function intro_highest_combo() => word(0x64c58a)
function troia_highest_combo() => word(0x64c58c)
function primrose_highest_combo() => word(0x64c58e)
function pitch_highest_combo() => word(0x64c590)
function dynasty_highest_combo() => word(0x64c592)
function inferno_highest_combo() => word(0x64c594)
function central_highest_combo() => word(0x64c596)
function metal_highest_combo() => word(0x64c598)
function forest_highest_combo() => word(0x64c59a)
function jakob_highest_combo() => word(0x64c59c)
function palace_highest_combo() => word(0x64c59e)

// =========================================
//             Utility Functions              
// =========================================

function in_game() => dword(0x64d164) == 0x03

function inside_a_stage() => dword(0x64e100) > 0
function inside_ride_armor() => byte(0x9e63f4) == 1
function inside_chip_dev() => dword(0x8470cc) == 1
function outside_load_game() => dword(0xd6b8d8) != 3

function stage_has_been_sucessfully_cleared() => stage_sucessfully_cleared_mission_flag() == 1 && prev(stage_sucessfully_cleared_mission_flag()) == 0
function stage_has_been_cleared() => stage_cleared_mission_flag() == 1 && prev(stage_cleared_mission_flag()) == 0
function stage_intermission_has_been_cleared() => stage_cleared_intermission_flag() == 1 && prev(stage_cleared_intermission_flag()) == 0
function stage_boss_hp_bar_inactive() => dword(0xca5890) == 0xFFFFFFFF

function x_ultimate_armor_activated() => byte(0x8b118f) == 0x0f
function used_double_attack() => word(0xc472f4) < prev(word(0xc472f4))

function metal_glitch_protection() => player_metals() < 50000000

function defeated_boss() {
    return  stage_boss_hp() == 0 &&
            prev(stage_boss_hp()) > 0
}


function fighting_boss_on_boss_rush(boss_id) {
    return  game_stage() == st_gateway &&
            stage_intermission_flag() == 0 &&
            (
                (word(pointer_boss_rush_room_1() + pointer_offset_boss_rush_id) == boss_id && word(pointer_boss_rush_room_1() + pointer_offset_boss_rush_active) != 0xFFFF) ||
                (word(pointer_boss_rush_room_2() + pointer_offset_boss_rush_id) == boss_id && word(pointer_boss_rush_room_2() + pointer_offset_boss_rush_active) != 0xFFFF) ||
                (word(pointer_boss_rush_room_3() + pointer_offset_boss_rush_id) == boss_id && word(pointer_boss_rush_room_3() + pointer_offset_boss_rush_active) != 0xFFFF) ||
                (word(pointer_boss_rush_room_4() + pointer_offset_boss_rush_id) == boss_id && word(pointer_boss_rush_room_4() + pointer_offset_boss_rush_active) != 0xFFFF) ||
                (word(pointer_boss_rush_room_5() + pointer_offset_boss_rush_id) == boss_id && word(pointer_boss_rush_room_5() + pointer_offset_boss_rush_active) != 0xFFFF) ||
                (word(pointer_boss_rush_room_6() + pointer_offset_boss_rush_id) == boss_id && word(pointer_boss_rush_room_6() + pointer_offset_boss_rush_active) != 0xFFFF) ||
                (word(pointer_boss_rush_room_7() + pointer_offset_boss_rush_id) == boss_id && word(pointer_boss_rush_room_7() + pointer_offset_boss_rush_active) != 0xFFFF) ||
                (word(pointer_boss_rush_room_8() + pointer_offset_boss_rush_id) == boss_id && word(pointer_boss_rush_room_8() + pointer_offset_boss_rush_active) != 0xFFFF)
            )
}

function all_items_noahs_park() => bit5(0x64c5a4) + bit1(0x64c5a6) + bit2(0x64c5d8) // V
function all_items_troia_base() => bit6(0x64c5dc) + bit4(0x64c5a9) + bit7(0x64c5a8) + bit1(0x64c5a9) // V
function all_items_primrose() => bit2(0x64c5ac) + bit0(0x64c5e0) + bit0(0x64c5ac) // V
function all_items_pitch_black() => bit6(0x64c5b0) + bit3(0x64c5b2) + bit3(0x64c5b0) + bit5(0x64c5e4) // V
function all_items_inferno() => bit7(0x64c5ec) + bit5(0x64c5b9) + bit0(0x64c5b9) + bit1(0x64c5b8) // V
function all_items_central_white() => bit0(0x64c5be) + bit4(0x64c5f0) // V
function all_items_metal_valley() => bit4(0x64c5c0) + bit6(0x64c5c1) + bit1(0x64c5f4) + bit2(0x64c5c1) // V
function all_items_booster_forest() => bit3(0x64c5c5) + bit7(0x64c5c5) + bit2(0x64c5c6) + bit3(0x64c5f8) // V




function all_chips_everyone() => bit0(0x64c633) + bit0(0x64c634) + bit0(0x64c636) + bit0(0x64c637) + bit0(0x64c638) + bit0(0x64c639) + bit0(0x64c850) // Total 7

function all_chips_x() =>   sum_of(range(0x64c683, 0x64c685), address => bit0(address)) +
                            sum_of(range(0x64c687, 0x64c689), address => bit0(address)) +
                            sum_of(range(0x64c68b, 0x64c690), address => bit0(address)) // Total 12

function all_chips_zero() =>    sum_of(range(0x64c6cb, 0x64c6cd), address => bit0(address)) +
                                sum_of(range(0x64c6cf, 0x64c6d1), address => bit0(address)) +
                                sum_of(range(0x64c6d3, 0x64c6e1), address => bit0(address)) // Total 21

function all_chips_axl() => sum_of(range(0x64c713, 0x64c715), address => bit0(address)) +
                            sum_of(range(0x64c717, 0x64c719), address => bit0(address)) +
                            sum_of(range(0x64c71b, 0x64c71f), address => bit0(address))+
                            bit0(0x64c721) + bit0(0x64c729) // Total 13

function all_chips_alia() =>    sum_of(range(0x64c75b, 0x64c75d), address => bit0(address)) +
                                sum_of(range(0x64c75f, 0x64c761), address => bit0(address)) +
                                sum_of(range(0x64c763, 0x64c768), address => bit0(address)) // Total 12

function all_chips_layer() =>   sum_of(range(0x64c7a3, 0x64c7a5), address => bit0(address)) +
                                sum_of(range(0x64c7a7, 0x64c7a9), address => bit0(address)) +
                                sum_of(range(0x64c7ab, 0x64c7b9), address => bit0(address)) // Total 21

function all_chips_pallette() =>    sum_of(range(0x64c7eb, 0x64c7ed), address => bit0(address)) +
                                    sum_of(range(0x64c7ef, 0x64c7f1), address => bit0(address)) +
                                    sum_of(range(0x64c7f3, 0x64c7f7), address => bit0(address))+
                                    bit0(0x64c7f9) + bit0(0x64c801) // Total 13

// =========================================
//                Progression              
// =========================================

function achievement_clear_mission(title, stage_name, stage_id, points, cheevo_id) {
    achievement(title, format("Finish {0} stage.", stage_name), points, type="progression",
                trigger =   game_stage() == stage_id &&
                            stage_intermission_flag() == 0 &&
                            stage_has_been_sucessfully_cleared()
                ) 
}

function achievement_clear_mission_no_revisit(title, stage_name, stage_id, points, cheevo_id) {
    achievement(title, format("Finish {0} stage.", stage_name), points, type="progression",
                trigger =   game_stage() == stage_id &&
                            stage_intermission_flag() == 0 &&
                            stage_has_been_sucessfully_cleared() &&
                            stage_fighting_stage_boss_flag() == 1
                ) 
}

function achievement_exf_finish(title, boss_name, stage_id, points, cheevo_id) {
    achievement(title, format("Defeat {0} with an EXF Double Attack.", boss_name), points, type="missable",
                trigger =   game_stage() == stage_id &&
                            stage_intermission_flag() == 0 &&
                            stage_exf_finish_flag() == 1 && prev(stage_exf_finish_flag()) == 0
                ) 
}

function achievement_no_damage_clear(stage_name, stage_id, points, cheevo_id) {
    achievement(format("{0} Damageless", stage_name), format("Achieve a 'No Damage' clear on {0}'s' stage (Normal difficulty).", stage_name), points,
                trigger =   game_stage() == stage_id &&
                            stage_intermission_flag() == 0 &&
                            trigger_when(stage_has_been_sucessfully_cleared()) &&
                            stage_no_damage_taken_flag() == 1 &&
                            game_difficulty() >= diff_normal
                ) 
}

function achievement_rank_aaa_clear(stage_name, stage_id, points, cheevo_id) {
    achievement(format("{0} Expert", stage_name), format("Achieve rank AAA on {0} stage (Normal difficulty).", stage_name), points,
                trigger =   game_stage() == stage_id &&
                            stage_intermission_flag() == 0 &&
                            stage_rank() == rank_aaa && prev(stage_rank()) != rank_aaa &&
                            stage_sucessfully_cleared_mission_flag() == 1 &&
                            game_difficulty() >= diff_normal
                ) 
}

achievement_clear_mission("Noah's Ark", "Noah's Park", st_noahs_park, 5, 0)
achievement_clear_mission_no_revisit("Helios", "Troia Base", st_troia_base, 5, 0)
achievement_clear_mission_no_revisit("Antigravity Laboratory", "Primrose", st_primrose, 5, 0)
achievement_clear_mission_no_revisit("Military Facility", "Pitch Black", st_pitch_black, 5, 0)
achievement_clear_mission_no_revisit("Megalopolis", "Dynasty", st_dynasty, 5, 0)
achievement_clear_mission_no_revisit("Waste Disposal Center", "Inferno", st_inferno, 5, 0)
achievement_clear_mission_no_revisit("Environmental Science Facility", "Central White", st_central_white, 5, 0)
achievement_clear_mission_no_revisit("Metal Mine", "Metal Valley", st_metal_valley, 5, 0)
achievement_clear_mission_no_revisit("Rocket Ruins", "Booster Forest", st_booster_forest, 5, 0)
achievement_clear_mission_no_revisit("Jacob's Ladder", "Jakob", st_jakob, 5, 0)
achievement_clear_mission_no_revisit("Fake Mavericks", "Gateway", st_gateway, 5, 0)

achievement("Disruption of the New World", "Beat the game on Normal difficulty.", 10, type="win_condition",
                trigger =   game_stage() == st_sigma_palace &&
                            stage_has_been_sucessfully_cleared() &&
                            game_difficulty() >= diff_normal,
                id = 0
            )


achievement("Paradise Lost", "Beat the game on Hard difficulty.", 50, type="win_condition",
                trigger =   game_stage() == st_sigma_palace &&
                            stage_has_been_sucessfully_cleared() &&
                            game_difficulty() == diff_hard,
                id = 0
            )

achievement("Chips!? What Are Chips?", "Beat the game without buying chips (Retry Chips and Life Bottle allowed) and no X's armors (Normal difficulty).", 50,
                trigger =   trigger_when(game_stage() == st_sigma_palace &&
                                         stage_has_been_sucessfully_cleared()) &&
                            tbyte(0x64c620) == 0x000000 && byte(0x64c851) != 0x01 && // All Chips
                            tbyte(0x64c66a) == 0x000440 && // X Chips
                            tbyte(0x64c6b2) == 0x00000440 && // Zero Chips
                            tbyte(0x64c6fa) == 0x00000440 && // Axl Chips
                            bit3(0x64c4d0) == 0 &&
                            bit4(0x64c4d0) == 0 &&
                            bit5(0x64c4d0) == 0 &&
                            byte(0x64c4d8) == 0x00 && // Armors
                            game_difficulty() >= diff_normal,
                id = 0
            )

// Name Suggestion 1
achievement_exf_finish("Double Attack Against the Crab", "Crab-Y", st_noahs_park, 3, 223527)
achievement_exf_finish("Double Attack Against the Flower", "Optic Sunflower", st_troia_base, 3, 223528)
achievement_exf_finish("Double Attack Against the Scientist", "Gravity Antonion", st_primrose, 3, 223529)
achievement_exf_finish("Double Attack Against the Mantis", "Dark Mantis", st_pitch_black, 3, 223530)
achievement_exf_finish("Double Attack Against the Drifter", "Gigavolt Man-O-War", st_dynasty, 3, 223531)
achievement_exf_finish("Double Attack Against the Fowl", "Burn Rooster", st_inferno, 3, 223532)
achievement_exf_finish("Double Attack Against the Yeti", "Avalanche Yeti", st_central_white, 3, 223533)
achievement_exf_finish("Double Attack Against the Trilobite", "Earthrock Trilobite", st_metal_valley, 3, 223534)
achievement_exf_finish("Double Attack Against the Panda", "Bamboo Pandamonium", st_booster_forest, 3, 223535)
achievement_exf_finish("Double Attack Against the Wreaker", "Vile-V", st_jakob, 3, 223536)
achievement_exf_finish("Double Attack Against the Copy", "Copy Sigma", st_gateway, 3, 223537)
achievement_exf_finish("Double Attack Against the Lucifer", "Lumine", st_sigma_palace, 5, 223538)

achievement_no_damage_clear("Noah's Park", st_noahs_park, 10, 223539)
achievement_no_damage_clear("Troia Base", st_troia_base, 10, 223540)
achievement_no_damage_clear("Primrose", st_primrose, 10, 223541)
achievement_no_damage_clear("Pitch Black", st_pitch_black, 25, 223542)
// achievement_no_damage_clear("Dynasty [VOID]", st_dynasty, 0, 223543)
achievement_no_damage_clear("Inferno", st_inferno, 25, 223544)
// achievement_no_damage_clear("Central White [VOID]", st_central_white, 0, 223545)
achievement_no_damage_clear("Metal Valley", st_metal_valley, 10, 223546)
achievement_no_damage_clear("Booster Forest", st_booster_forest, 10, 223547)
achievement_no_damage_clear("Jakob", st_jakob, 10, 223548)
achievement_no_damage_clear("Gateway", st_gateway, 25, 223549)
achievement_no_damage_clear("Sigma Palace", st_sigma_palace, 10, 223550)

achievement_rank_aaa_clear("Noah's Park", st_noahs_park, 10, 223551)
achievement_rank_aaa_clear("Troia Base", st_troia_base, 10, 223552)
achievement_rank_aaa_clear("Dynasty", st_dynasty, 10, 223555)
achievement_rank_aaa_clear("Primrose", st_primrose, 25, 223553)
achievement_rank_aaa_clear("Pitch Black", st_pitch_black, 10, 223554)
achievement_rank_aaa_clear("Inferno", st_inferno, 10, 223556)
achievement_rank_aaa_clear("Central White", st_central_white, 25, 223557)
achievement_rank_aaa_clear("Metal Valley", st_metal_valley, 10, 223558)
achievement_rank_aaa_clear("Booster Forest", st_booster_forest, 10, 223559)
achievement_rank_aaa_clear("Jakob", st_jakob, 10, 223560)
achievement_rank_aaa_clear("Gateway", st_gateway, 25, 223561)
// achievement_rank_aaa_clear("Sigma Palace [VOID]", st_sigma_palace, 0, 223562)

// =========================================
//                   Misc              
// =========================================

achievement("Hover a Little More", "Obtain the Rare Metal in the river on the first playthrough at Noah's Park.", 3, type="missable",
            trigger = game_stage() == st_noahs_park &&
                      word(0x64c4ae) == 0 && // Stages Cleared Bitflags
                      bit5(0x64c5a4) == 1 &&
                      prev(bit5(0x64c5a4)) == 0
            )

achievement("Forgot Something Here?", "Enter the secret room on Noah's Park.", 2,
            trigger = game_stage() == st_noahs_park &&
                      stage_camera_x() >= 243 && stage_camera_x() <= 244 &&
                      stage_camera_y() == 12.0 &&
                      stage_camera_z() >= -153.0
            )

achievement("Sneaking", "Get through Pitch Black stage without activating any alarm and with lights off.", 4,
            trigger = never(game_stage() != st_pitch_black) &&
                      once(stage_load_section() == 2 && prev(stage_load_section()) != 2) &&
                      trigger_when(stage_has_been_sucessfully_cleared() || stage_fighting_stage_boss_flag() == 1) &&
                      never(bit7(0x9cd798) == 1) &&
                      never(bit5(0x9cd799) == 1)
            )

achievement("MAME-Q Destroyer", "Score 175 points or higher in the first room at Troia Base stage.", 5,
            trigger =   inside_a_stage() &&
                        game_stage() == st_troia_base &&
                        stage_intermission_flag() == 0 &&
                        stage_troia_base_room() == 0 &&
                        stage_troia_base_mameq_eliminated() >= 175 &&
                        prev(stage_troia_base_mameq_eliminated()) < 175
            )

achievement("Additional Mobility", "Obtain all items from Central White stage within a single visit.", 5, type="missable",
            trigger =   tally(2, all_items_central_white() > prev(all_items_central_white())) &&
                        never(byte(0x64db40) != st_central_white)
            ) 

achievement("Havoc Wrecker", "Encounter Vile 4 times before reaching Sigma Palace.", 10, type="missable",
            trigger =   inside_a_stage() &&
                        bit2(0x64c4af) == 0 &&
                        measured(sum_of(range(0, 3), b => bit(b,0x64c4d4)) == 4) &&
                        prev(sum_of(range(0, 3), b => bit(b,0x64c4d4))) == 3 &&
                        always_true()
            )

// TODO  
// achievement("Megalopolis Speedrun", "Defeat Gigavolt Man-o-War during the chase within X seconds.", 5,
//             trigger =   inside_a_stage() &&
//                         game_stage() == st_dynasty &&
//                         stage_intermission_flag() == 0 &&
//                         stage_clear_time() < 0 &&
//                         always_true()
//             )
                        

achievement("Unknown Data \"CM\"", "Defeat Cut Man.", 3,
            trigger =   game_stage() == st_troia_base &&
                        inside_a_stage() &&
                        stage_troia_base_room() == 9 && prev(stage_troia_base_room()) == 8
            )

achievement("Cyclops", "Defeat Bamboo Pandamonium without leaving the Ride Armor.", 10,
            trigger =   never(game_stage() != st_booster_forest) &&
                        once(prev(stage_boss_hp()) < stage_max_boss_hp_display() &&
                             stage_boss_hp() == stage_max_boss_hp_display()) &&
                        never(!inside_ride_armor()) &&
                        trigger_when(defeated_boss())
            )


// Removed from RATools to use it within RAIntegration
// achievement("Low-key Shipping", "Right, Layer?", 1,
//             trigger =   in_game() &&
//                         game_current_voice_talking() == 0x2ce3 &&
//                         prev(game_current_voice_talking()) == 0x2ca7,
//             id = 223568
//             )

achievement("Buster Team-Up", "Finish a stage with X and Alia.", 3,
            trigger =   (
                            (player_char1() == pl_x && player_char2() == pl_alia) ||
                            (player_char2() == pl_x && player_char1() == pl_alia)
                        ) &&
                        stage_intermission_flag() == 0 &&
                        stage_has_been_sucessfully_cleared(),
            id = 223569
            )

achievement("Saber Team-Up", "Finish a stage with Zero and Layer.", 3,
            trigger =   (
                            (player_char1() == pl_zero && player_char2() == pl_layer) ||
                            (player_char2() == pl_zero && player_char1() == pl_layer)
                        ) &&
                        stage_intermission_flag() == 0 &&
                        stage_has_been_sucessfully_cleared()
                        ,
            id = 223570
            )

achievement("Bullets Team-Up", "Finish a stage with Axl and Pallette.", 3,
            trigger =   (
                            (player_char1() == pl_axl && player_char2() == pl_pallette) ||
                            (player_char2() == pl_axl && player_char1() == pl_pallette)
                        ) &&
                        stage_intermission_flag() == 0 &&
                        stage_has_been_sucessfully_cleared(),
            id = 223571
            )

// =========================================
//               Intermission              
// =========================================

achievement("Crabs-K Infestation", "Eliminate 250 Crabs-K on Noah's Park intermission.", 10,
            trigger =   stage_intermission_flag() == 1 &&
                        game_stage() == st_noahs_park &&
                        stage_foes_defeated() >= 250 && prev(stage_foes_defeated()) < 250
            )

achievement("Endurance Test", "Score 4000 distance points without using Zero's techniques on Inferno intermission.", 10,
            trigger =   stage_intermission_flag() == 1 &&
                        game_stage() == st_inferno &&
                        once(intermission_inferno_score() == 0) &&
                        never(pl_zero_attacking_with_technique_flag() == 1 && prev(pl_zero_attacking_with_technique_flag()) == 0) &&
                        intermission_inferno_score() >= 4000 && prev(intermission_inferno_score()) < 4000
            )

achievement("On Parade", "Finish Troia Base intermission with at least 4:15 minutes remaining.", 10,
            trigger =   stage_intermission_flag() == 1 &&
                        game_stage() == st_gateway &&
                        trigger_when(stage_cleared_intermission_flag() == 1 && prev(stage_cleared_intermission_flag()) == 0) &&
                        intermission_optic_remaining_time() >= 15300
            )

achievement("Barius Ride Chaser", "Finish Central White intermission.", 4,
            trigger =   stage_intermission_flag() == 1 &&
                        game_stage() == st_central_white &&
                        stage_cleared_intermission_flag() == 1 && prev(stage_cleared_intermission_flag()) == 0
            )

achievement("Not a Invincible Claw", "Finish Noah's Park intermission.", 4,
            trigger =   stage_intermission_flag() == 1 &&
                        game_stage() == st_noahs_park &&
                        stage_cleared_intermission_flag() == 1 && prev(stage_cleared_intermission_flag()) == 0
            )

// =========================================
//                  Items              
// =========================================

achievement("Noah's Park 100%", "Collect all items from Noah's Park stage.", 5,
            trigger =   inside_a_stage() &&
                        game_stage() == st_noahs_park &&
                        measured(all_items_noahs_park() == 3) && prev(all_items_noahs_park()) == 2)

achievement("Troia Base 100%", "Collect all items from Troia Base stage.", 5,
            trigger =   inside_a_stage() &&
                        game_stage() == st_troia_base &&
                        measured(all_items_troia_base() == 4) && prev(all_items_troia_base()) == 3)

achievement("Primrose 100%", "Collect all items from Primrose stage.", 5,
            trigger =   inside_a_stage() &&
                        game_stage() == st_primrose &&
                        measured(all_items_primrose() == 3) && prev(all_items_primrose()) == 2)

achievement("Pitch Black 100%", "Collect all items from Pitch Black stage.", 5,
            trigger =   inside_a_stage() &&
                        game_stage() == st_pitch_black &&
                        measured(all_items_pitch_black() == 4) && prev(all_items_pitch_black()) == 3)

achievement("Inferno 100%", "Collect all items from Inferno stage.", 5,
            trigger =   inside_a_stage() &&
                        game_stage() == st_inferno &&
                        measured(all_items_inferno() == 4) && prev(all_items_inferno()) == 3)

achievement("Central White 100%", "Collect all items from Central White stage.", 5,
            trigger =   inside_a_stage() &&
                        game_stage() == st_central_white &&
                        measured(all_items_central_white() == 2) && prev(all_items_central_white()) == 1)

achievement("Metal Valley 100%", "Collect all items from Metal Valley stage.", 5,
            trigger =   inside_a_stage() &&
                        game_stage() == st_metal_valley &&
                        measured(all_items_metal_valley() == 4) && prev(all_items_metal_valley()) == 3)

achievement("Booster Forest 100%", "Collect all items from Booster Forest stage.", 5,
            trigger =   inside_a_stage() &&
                        game_stage() == st_booster_forest &&
                        measured(all_items_booster_forest() == 4) && prev(all_items_booster_forest()) == 3)

address_purple_metals_1 = 0x64c88c
address_purple_metals_2 = 0x64c88d

achievement("Hidden in the Park", "Excavate all Purple Metals on Noah's Park.", 5,
            trigger =   inside_a_stage() &&
                        measured(sum_of(range(0, 2), b => bit(b,address_purple_metals_1)) == 3) &&
                        prev(sum_of(range(0, 2), b => bit(b,address_purple_metals_1))) == 2
            )

achievement("Hidden in the Base", "Excavate a Purple Metal on Troia Base.", 2,
            trigger =   inside_a_stage() &&
                        bit3(address_purple_metals_1) == 1 && 
                        prev(bit3(address_purple_metals_1)) == 0
            )

achievement("Hidden in the Factory", "Excavate the second Purple Metal from Pitch Black.", 2,
            trigger =   inside_a_stage() &&
                        bit5(address_purple_metals_1) == 1 && 
                        prev(bit5(address_purple_metals_1)) == 0
            )

achievement("Hidden in the Factory and Inferno", "Excavate the first Purple Metal from Pitch Black or Inferno.", 2,
            trigger =   inside_a_stage() &&
                        bit4(address_purple_metals_1) == 1 && 
                        prev(bit4(address_purple_metals_1)) == 0,
            id = 223585
            )

achievement("Hidden in the Valley", "Excavate a Purple Metal on Metal Valley.", 2,
            trigger =   inside_a_stage() &&
                        bit7(address_purple_metals_1) == 1 && 
                        prev(bit7(address_purple_metals_1)) == 0
            )

achievement("Hidden in the Forest", "Excavate all Purple Metals on Booster Forest.", 5,
            trigger =   inside_a_stage() &&
                        measured(sum_of(range(0, 4), b => bit(b,address_purple_metals_2)) == 5) &&
                        prev(sum_of(range(0, 4), b => bit(b,address_purple_metals_2))) == 4,
            id = 223586
            )

achievement("Here Goes Nothing!", "Buy Alia Buster.", 25,
            trigger =   inside_chip_dev() &&
                        // metal_glitch_protection() &&
                        bit0(0x64c630) == 1 && prev(bit0(0x64c630)) == 0)

achievement("I'll Give a Shot", "Buy Layer Rapier.", 25,
            trigger =   inside_chip_dev() &&
                        // metal_glitch_protection() &&
                        bit0(0x64c631) == 1 && prev(bit0(0x64c631)) == 0)

achievement("My Turn!", "Buy Pallet Bullets.", 25,
            trigger =   inside_chip_dev() &&
                        // metal_glitch_protection() &&
                        bit0(0x64c632) == 1 && prev(bit0(0x64c632)) == 0)

achievement("Σ Blade", "Buy the Sigma Blade for Zero.", 5,
            trigger =   inside_chip_dev() &&
                        // metal_glitch_protection() &&
                        bit0(0x64c6e0) == 1 && prev(bit0(0x64c6e0)) == 0)

achievement("All 100%", "Buy all permanent green chips (All).", 10,
            trigger =   inside_chip_dev() &&
                        // metal_glitch_protection() &&
                        measured(all_chips_everyone() == 7) && prev(all_chips_everyone()) == 6)

achievement("X 100%", "Buy all X chips.", 25,
            trigger =   inside_chip_dev() &&
                        // metal_glitch_protection() &&
                        measured(all_chips_x() == 12) && prev(all_chips_x()) == 11)

achievement("Zero 100%", "Buy all Zero chips.", 25,
            trigger =   inside_chip_dev() &&
                        // metal_glitch_protection() &&
                        measured(all_chips_zero() == 21) && prev(all_chips_zero()) == 20)

achievement("Axl 100%", "Buy all Axl chips.", 25,
            trigger =   inside_chip_dev() &&
                        // metal_glitch_protection() &&
                        measured(all_chips_axl() == 13) && prev(all_chips_axl()) == 12)

achievement("Alia 100%", "Buy all Alia chips.", 25,
            trigger =   inside_chip_dev() &&
                        // metal_glitch_protection() &&
                        measured(all_chips_alia() == 12) && prev(all_chips_alia()) == 11)

achievement("Layer 100%", "Buy all Layer chips.", 25,
            trigger =   inside_chip_dev() &&
                        // metal_glitch_protection() &&
                        measured(all_chips_layer() == 21) && prev(all_chips_layer()) == 20)

achievement("Pallette 100%", "Buy all Pallette chips.", 25,
            trigger =   inside_chip_dev() &&
                        // metal_glitch_protection() &&
                        measured(all_chips_pallette() == 13) && prev(all_chips_pallette()) == 12)

achievement("Ultimate X", "Unlock Ultimate Armor.", 5,
            trigger =   outside_load_game() &&
                        bit0(0x64c955) == 0 &&
                        bit1(0x64c4d6) == 1 && prev(bit1(0x64c4d6)) == 0
            )

achievement("Nightshade Zero", "Unlock Black Zero.", 5,
            trigger =   outside_load_game() &&
                        bit0(0x64c956) == 0 &&
                        bit4(0x64c4d0) == 1 && prev(bit4(0x64c4d0)) == 0
            )

achievement("Lumine Armor", "Unlock White Axl.", 5,
            trigger =   outside_load_game() &&
                        bit0(0x64c957) == 0 &&
                        bit5(0x64c4d0) == 1 && prev(bit5(0x64c4d0)) == 0
            )


// =========================================
//                Damageless              
// =========================================

function achievement_damageless_boss_x(title, boss_name, stage_id, points, cheevo_id) {
    achievement(format("X vs. {0}", boss_name), format("X: Defeat {0} without taking damage and without using weapons (no Ultimate Armor or Double Attack).", boss_name), 10,
                trigger =   (
                                (game_stage() == stage_id) ||
                                (fighting_boss_on_boss_rush(stage_id - 1))
                            ) &&
                            once(prev(stage_boss_hp()) < stage_max_boss_hp_display() &&
                                 stage_boss_hp() == stage_max_boss_hp_display()) &&
                            never(player_hp_display() < prev(player_hp_display())) &&
                            never(player_current_char() != pl_x && stage_boss_hp() < prev(stage_boss_hp())) &&
                            player_current_char() == pl_x &&
                            never(x_ultimate_armor_activated()) &&
                            never(player_weapon() != 0) &&
                            never(used_double_attack()) &&
                            never(stage_boss_hp_bar_inactive()) &&
                            never(game_stage() == st_booster_forest && inside_ride_armor()) &&
                            trigger_when(defeated_boss()),
                        id = cheevo_id)
}

function achievement_damageless_boss_zero(title, boss_name, stage_id, points, cheevo_id) {
    achievement(format("Zero vs. {0}", boss_name), format("Zero: Defeat {0} without taking damage and without using techniques (no Double Attack).", boss_name), 10,
                trigger =   (
                                (game_stage() == stage_id) ||
                                (fighting_boss_on_boss_rush(stage_id - 1))
                            ) &&
                            once(prev(stage_boss_hp()) < stage_max_boss_hp_display() &&
                                 stage_boss_hp() == stage_max_boss_hp_display()) &&
                            never(player_hp_display() < prev(player_hp_display())) &&
                            never(player_current_char() != pl_zero && stage_boss_hp() < prev(stage_boss_hp())) &&
                            player_current_char() == pl_zero &&
                            never(pl_zero_attacking_with_technique_flag() == 1) &&
                            never(used_double_attack()) &&
                            never(stage_boss_hp_bar_inactive()) &&
                            never(game_stage() == st_booster_forest && inside_ride_armor()) &&
                            trigger_when(defeated_boss()),
                        id = cheevo_id)
}

function achievement_damageless_boss_axl(title, boss_name, stage_id, points, cheevo_id) {
    achievement(format("Axl vs. {0}", boss_name), format("Axl: Defeat {0} without taking damage (no Double Attack).", boss_name), 10,
                trigger =   (
                                (game_stage() == stage_id) ||
                                (fighting_boss_on_boss_rush(stage_id - 1))
                            ) &&
                            once(prev(stage_boss_hp()) < stage_max_boss_hp_display() &&
                                 stage_boss_hp() == stage_max_boss_hp_display()) &&
                            never(player_hp_display() < prev(player_hp_display())) &&
                            never(player_current_char() != pl_axl && stage_boss_hp() < prev(stage_boss_hp())) &&
                            player_current_char() == pl_axl &&
                            never(used_double_attack()) &&
                            never(stage_boss_hp_bar_inactive()) &&
                            never(game_stage() == st_booster_forest && inside_ride_armor()) &&
                            trigger_when(defeated_boss()),
                        id = cheevo_id)
}

achievement_damageless_boss_x("Shining Ray", "Optic Sunflower", st_troia_base, 10, 0)
achievement_damageless_boss_x("Squeeze Bomb", "Gravity Antonion", st_primrose, 10, 0)
achievement_damageless_boss_x("Shadow Runner", "Dark Mantis", st_pitch_black, 10, 0)
achievement_damageless_boss_x("Thunder Dancer", "Gigavolt Man-O-War", st_dynasty, 10, 0)
achievement_damageless_boss_x("Melt Creeper", "Burn Rooster", st_inferno, 10, 0)
achievement_damageless_boss_x("Drift Diamond", "Avalanche Yeti", st_central_white, 10, 0)
achievement_damageless_boss_x("Crystal Wall", "Earthrock Trilobite", st_metal_valley, 10, 0)
achievement_damageless_boss_x("Green Spinner", "Bamboo Pandamonium", st_booster_forest, 10, 0)

achievement_damageless_boss_zero("Tenshouha", "Optic Sunflower", st_troia_base, 10, 0)
achievement_damageless_boss_zero("Juuhazan", "Gravity Antonion", st_primrose, 10, 0)
achievement_damageless_boss_zero("Rasetsusen", "Dark Mantis", st_pitch_black, 10, 0)
achievement_damageless_boss_zero("Raikousen", "Gigavolt Man-O-War", st_dynasty, 5, 0)
achievement_damageless_boss_zero("Enkoujin", "Burn Rooster", st_inferno, 10, 0)
achievement_damageless_boss_zero("Hyouryuushou", "Avalanche Yeti", st_central_white, 10, 0)
achievement_damageless_boss_zero("Rekkyoudan", "Earthrock Trilobite", st_metal_valley, 10, 0)
achievement_damageless_boss_zero("Youdantotsu", "Bamboo Pandamonium", st_booster_forest, 10, 0)

achievement_damageless_boss_axl("Ray Gun", "Optic Sunflower", st_troia_base, 10, 0)
achievement_damageless_boss_axl("Spiral Magnum", "Gravity Antonion", st_primrose, 10, 0)
achievement_damageless_boss_axl("Black Arrow", "Dark Mantis", st_pitch_black, 10, 0)
achievement_damageless_boss_axl("Plasma Gun", "Gigavolt Man-O-War", st_dynasty, 10, 0)
achievement_damageless_boss_axl("Flame Burner", "Burn Rooster", st_inferno, 10, 0)
achievement_damageless_boss_axl("Ice Gattling", "Avalanche Yeti", st_central_white, 10, 0)
achievement_damageless_boss_axl("Bound Blaster", "Earthrock Trilobite", st_metal_valley, 10, 0)
achievement_damageless_boss_axl("Blast Launcher", "Bamboo Pandamonium", st_booster_forest, 10, 0)


// =========================================
//                Leaderboards              
// =========================================

function leaderboard_foes_defeated(stage_name, stage_id, cheevo_id) {
    leaderboard(format("Foes Defeated - {0}", stage_name), format("Defeat the highest amount of enemies on {0}.", stage_name),
               start = game_stage() == stage_id && stage_has_been_sucessfully_cleared() && stage_intermission_flag() == 0,
               cancel = game_stage() != stage_id || stage_cleared_mission_flag() == 1 && stage_sucessfully_cleared_mission_flag() == 0,
               submit = game_stage() == stage_id && stage_has_been_sucessfully_cleared(),
               value = stage_foes_defeated(),
               format = "VALUE", lower_is_better=false)
}

function leaderboard_highest_combo(stage_name, stage_id, cheevo_id) {
    leaderboard(format("Highest Combo - {0}", stage_name), format("Finish {0} with highest combo possible.", stage_name),
               start = game_stage() == stage_id && stage_has_been_sucessfully_cleared() && stage_intermission_flag() == 0,
               cancel = game_stage() != stage_id || stage_cleared_mission_flag() == 1 && stage_sucessfully_cleared_mission_flag() == 0,
               submit = game_stage() == stage_id && stage_has_been_sucessfully_cleared(),
               value = stage_highest_combo(),
               format = "VALUE", lower_is_better=false)
}

function leaderboard_clear_time(stage_name, stage_id, cheevo_id) {
    leaderboard(format("Speedrun - {0}", stage_name), format("Reach the stage boss the fastest as possible on {0}", stage_name),
               start = game_stage() == stage_id && stage_clear_time() > 0 && prev(stage_clear_time()) == 0 && stage_intermission_flag() == 0,
               cancel = game_stage() != stage_id || stage_cleared_mission_flag() == 1 && stage_sucessfully_cleared_mission_flag() == 0,
               submit = game_stage() == stage_id && stage_has_been_sucessfully_cleared(),
               value = stage_clear_time(),
               format = "FRAMES", lower_is_better=true)
}

leaderboard_foes_defeated("Noah's Park", st_noahs_park, 0)
leaderboard_foes_defeated("Troia Base", st_troia_base, 0)
leaderboard_foes_defeated("Primrose", st_primrose, 0)
leaderboard_foes_defeated("Pitch Black", st_pitch_black, 0)
leaderboard_foes_defeated("Dynasty", st_dynasty, 0)
leaderboard_foes_defeated("Inferno", st_inferno, 0)
leaderboard_foes_defeated("Central White", st_central_white, 0)
leaderboard_foes_defeated("Metal Valley", st_metal_valley, 0)
leaderboard_foes_defeated("Booster Forest", st_booster_forest, 0)
leaderboard_foes_defeated("Jakob", st_jakob, 0)
leaderboard_foes_defeated("Gateway", st_gateway, 0)
leaderboard_foes_defeated("Sigma Palace", st_sigma_palace, 0)

leaderboard_highest_combo("Noah's Park", st_noahs_park, 0)
leaderboard_highest_combo("Troia Base", st_troia_base, 0)
leaderboard_highest_combo("Primrose", st_primrose, 0)
leaderboard_highest_combo("Pitch Black", st_pitch_black, 0)
leaderboard_highest_combo("Dynasty", st_dynasty, 0)
leaderboard_highest_combo("Inferno", st_inferno, 0)
leaderboard_highest_combo("Central White", st_central_white, 0)
leaderboard_highest_combo("Metal Valley", st_metal_valley, 0)
leaderboard_highest_combo("Booster Forest", st_booster_forest, 0)
leaderboard_highest_combo("Jakob", st_jakob, 0)
leaderboard_highest_combo("Gateway", st_gateway, 0)
leaderboard_highest_combo("Sigma Palace", st_sigma_palace, 0)

leaderboard_clear_time("Noah's Park", st_noahs_park, 0)
leaderboard_clear_time("Troia Base", st_troia_base, 0)
leaderboard_clear_time("Primrose", st_primrose, 0)
leaderboard_clear_time("Pitch Black", st_pitch_black, 0)
leaderboard_clear_time("Dynasty", st_dynasty, 0)
leaderboard_clear_time("Inferno", st_inferno, 0)
leaderboard_clear_time("Central White", st_central_white, 0)
leaderboard_clear_time("Metal Valley", st_metal_valley, 0)
leaderboard_clear_time("Booster Forest", st_booster_forest, 0)
leaderboard_clear_time("Jakob", st_jakob, 0)
leaderboard_clear_time("Gateway", st_gateway, 0)
leaderboard_clear_time("Sigma Palace", st_sigma_palace, 0)

leaderboard("Speedrun - Full Game (Normal)", "Full game run (any%).",
           start = game_stage() == st_sigma_palace && stage_has_been_sucessfully_cleared() && game_difficulty() == 0x01,
           cancel = always_false(),
           submit = always_true(),
           value = game_igt() * 60,
           format = "FRAMES", lower_is_better=true)

leaderboard("Speedrun - Full Game (Hard)", "Full game run (any%).",
           start = game_stage() == st_sigma_palace && stage_has_been_sucessfully_cleared() && game_difficulty() == 0x02,
           cancel = always_false(),
           submit = always_true(),
           value = game_igt() * 60,
           format = "FRAMES", lower_is_better=true)

leaderboard("Score - MAME-Q Mini Game", "Score the highest as you can at the first room on Troia Base stage.",
           start = stage_troia_base_room() == 1 && prev(stage_troia_base_room()) == 0,
           cancel = tally(120, stage_troia_base_room() == 1),
           submit = stage_troia_base_room() == 1 && prev(stage_troia_base_room()) == 0,
           value = prior(stage_troia_base_mameq_eliminated()),
           format = "VALUE", lower_is_better=false)

leaderboard("Intermission - Noah's Park", "Eliminate the highest amount of Crabs-K on Noah's Park intermission.",
           start = game_stage() == st_noahs_park && stage_has_been_cleared() && stage_intermission_flag() == 1,
           cancel = game_stage() != st_noahs_park || stage_intermission_flag() == 0,
           submit = game_stage() == st_noahs_park && stage_has_been_cleared() && stage_intermission_flag() == 1,
           value = stage_foes_defeated(),
           format = "VALUE", lower_is_better=false)

leaderboard("Intermission - Inferno", "Walk the highest distance as you can on Inferno intermission (no Zero's techniques).",
           start = game_stage() == st_inferno && stage_intermission_flag() == 1 && intermission_inferno_score() == 0,
           cancel = game_stage() != st_inferno || stage_intermission_flag() == 0 || pl_zero_attacking_with_technique_flag() == 1 && prev(pl_zero_attacking_with_technique_flag()) == 0,
           submit = game_stage() == st_inferno && stage_has_been_cleared() && stage_intermission_flag() == 1,
           value = intermission_inferno_score(),
           format = "VALUE", lower_is_better=false)

leaderboard("Intermission - Troia Base", "Finish the Boss Rush from Troia Base intermission with the highest time remaining.",
           start = game_stage() == st_gateway && stage_intermission_has_been_cleared() && stage_intermission_flag() == 1,
           cancel = game_stage() != st_gateway || stage_intermission_flag() == 0,
           submit = game_stage() == st_gateway && stage_intermission_has_been_cleared() && stage_intermission_flag() == 1,
           value = intermission_optic_remaining_time(),
           format = "FRAMES", lower_is_better=false)