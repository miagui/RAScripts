// Mega Man X8
// #ID = 2680

function menu_selected() => bword(0x64d150)

// Game
function game_difficulty() => bword(0x64c46c)

function player_hp_display() => dword(0xc472b0)
function player_retry_chips() => bword(0x64c8b8)
function player_max_combo() => bword(0xc4e124)
function player_metals() => bword(0x64c4c4)
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

function game_igt() => dword(0x64c4a8) // Formatted as seconds
function game_stage() => byte(0x64c88f)
         st_noahs_park=0x00
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

// =========================================
//                Stage Flags              
// =========================================

// Kitchen Sink
function weapon_flags() => byte(0x64c4d5)

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
rank_aaa = 0x00
rank_aa = 0x01
rank_a = 0x02
rank_b = 0x03
rank_c = 0x04
rank_d = 0x05

// Clear Time (Frames)
function intro_clear_time() => bword(0x64c53c)
function troia_clear_time() => bword(0x64c540)
function primrose_clear_time() => bword(0x64c544)
function pitch_clear_time() => bword(0x64c548)
function dynasty_clear_time() => bword(0x64c54c)
function inferno_clear_time() => bword(0x64c550)
function central_clear_time() => bword(0x64c554)
function metal_clear_time() => bword(0x64c558)
function forest_clear_time() => bword(0x64c55c)
function jakob_clear_time() => bword(0x64c560)
function palace_clear_time() => bword(0x64c564)

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

// Items Found Bitflags
function intro_items() == byte(0x64c5a4)



function slot1_hp() => bword(0x64e35c)
function slot2_hp() => bword(0x64e14c)

function x_camera1() => bword(0xb536ec)


