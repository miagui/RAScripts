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


// Game

function game_mode() => byte(0x53F300)
function game_fighting() => bit0(0x53F330)

function round_state_bitflags() => byte(0x504E30)
function round_timer() => byte(0x504E68)
function round_number() => byte(0x504EB8)
function fight_state() => byte(0x504F48)

// P1

function p1_active_state() => byte(0x4FBDF0)
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
function p1_action_flags_1() => byte(0x50F2F1)
function p1_action_flags_2() => byte(0x50F2F2)
function p1_desperation_move() => bit0(0x50F2F3)
function p1_max_dm() => bit0(0x50F2F5)
function p1_macro_active() => word(0x53E930)
function p1_macro_timer() => word(0x53E932)

// P2

function p2_active_state() => byte(0x4FBDF1)
function p2_current_character() => byte(0x50F480)
function p2_alt_character_team_bitflags() => byte(0x504DE0)

function p2_hp() => word(0x50F548)
function p2_rounds_won() => byte(0x504DDD)


// Challenge

function challenge_mode_30bytes_array() => byte(0x5139E0)
function challenge_mode_tries() => byte(0x513A08)
function challenge_message() => byte(0x1C0FC8B)
function challenge_current() => byte(0x1C12430)




