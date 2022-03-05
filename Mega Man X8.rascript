// Mega Man X8
// #ID = 2680

function menu_selected() => bword(0x64d150)
function menu_difficult_selected() => bword(0x64d154)

function difficulty() => bword(0x64c46c)
function retry_chips() => bword(0x64c8b8)
function max_combo() => bword(0xc4e124)
function metals() => bword(0x64c4c4)

// Stage Clear Flags
// b0 = Booster Forest
// b1 = Troia Base
// b2 = Primrose
// b3 = Pitch Black
// b4 = Dynasty
// b5 = Inferno
// b6 = Central White
// b7 = Metal Valley
function intro_stage_clear() => bit0(0x64c4ae)
function troia_base_clear() => bit1(0x64c4ae)
function primrose_clear() => bit2(0x64c4ae)
function pitch_black_clear() => bit3(0x64c4ae)
function dynasty() => bit4(0x64c4ae)
function inferno() => bit5(0x64c4ae)
function central_white() => bit6(0x64c4ae)
function metal_valley() => bit7(0x64c4ae)
function booster_forest_clear() => bit0(0x64c4af)

function weapon_flags() => byte(0x64c4d5)

// Hunter Rank
rank_aaa = 0x00
rank_aa = 0x01
rank_a = 0x02
rank_b = 0x03
rank_c = 0x05
rank_d = 0x05

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


