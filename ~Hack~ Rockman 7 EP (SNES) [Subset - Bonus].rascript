// ~Hack~ Rockman 7 EP [Subset - Bonus]
// #ID = 20070

// =========================================
//              Memory Acessors              
// =========================================

// Game
function g_screen() => byte(0x00013F)
function g_music() => byte(0x00FFFD)

// Stage
function st_current_stage() => byte(0x000B73)
function st_current_wily() => byte(0x000B7C)
function st_checkpoint() => byte(0x000B74)
function st_w2_damage_rank() => byte(0x000B78)
function st_boss_hp() => byte(0x000BD3)

function boss_freeze_defeated() => byte(0x000B85)
function boss_cloud_defeated() => byte(0x000B87)
function boss_junk_defeated() => byte(0x000B89)
function boss_turbo_defeated() => byte(0x000B8B)
function boss_slash_defeated() => byte(0x000B8D)
function boss_shade_defeated() => byte(0x000B8F)
function boss_burst_defeated() => byte(0x000B91)
function boss_spring_defeated() => byte(0x000B93)

// Player
function pl_lives() => byte(0x000B81)
function pl_hp() => byte(0x000C2E)
function pl_invincibility_frames() => byte(0x000C2F)
function pl_pallete() => byte(0x000C5E)
function pl_shot_fired_type() => byte(0x000CCA)
function pl_hero_shield_FF() => byte(0x001FB9)

function pl_etanks_amount() => byte(0x000BA0)
function pl_wtanks_amount() => byte(0x000BA1)
function pl_stanks_amount() => byte(0x000BA2)
function pl_beat_amount() => byte(0x000BA3)

function pl_nova_adaptor_obtained() => bit7(0x000B9F)
function pl_ultimate_adaptor_obtained() => bit6(0x000BA4)
function pl_proto_shield_obtained() => bit7(0x000b95)

function pl_bolts() => word(0x000BA6)

function pl_active_07() => byte(0x000BD7)
function pl_teleporting_01() => byte(0x000BD8)
function pl_pos_x() => word(0x000C05)
function pl_pos_y() => word(0x000C08)
function pl_on_ground_bit2() => byte(0x000C25)

// Log
function log_enabled() => byte(0x01E000)
function log_special_mode() => byte(0x01E00D)
function log_ending() => byte(0x01E6F1)
function log_game_beaten() => byte(0x01E6FF)

function log_prev_timer() => byte(0x01E010)

function log_total_damage_taken() => dword(0x01E018)
function log_bolts_used() => dword(0x01E01C)

// Consumables
function log_lives_used_1() => word(0x01E0A0)
function log_lives_used_2() => word(0x01E0A2)
function log_lives_used_3() => word(0x01E0A4)

function log_etanks_used_1() => word(0x01E0B0)
function log_etanks_used_2() => word(0x01E0B2)
function log_etanks_used_3() => word(0x01E0B4)

function log_wtanks_used_1() => word(0x01E0C0)
function log_wtanks_used_2() => word(0x01E0C2)
function log_wtanks_used_3() => word(0x01E0C4)

function log_stanks_used_1() => word(0x01E0D0)
function log_stanks_used_2() => word(0x01E0D2)
function log_stanks_used_3() => word(0x01E0D4)

function log_beats_used_1() => word(0x01E0E0)
function log_beats_used_2() => word(0x01E0E2)

// General Stats
function log_weap_hit_buster() => byte(0x01E180)

function log_red_buster() => word(0x01E200)
function log_silver_pointblank() => word(0x01E202)
function log_4hit_plasma() => word(0x01E204)
function log_3point_floor() => word(0x01E206)
function log_slash_critical() => word(0x01E208)
function log_selfburning_cancel() => word(0x01E20A)
function log_shield_parry() => word(0x01E20C)
function log_spike() => word(0x01E20E)

function log_stage_exit_count() => word(0x01E210)
function log_stage_entry_count() => word(0x01E212)

function log_stanks_found() => word(0x01E214)

function log_jumps() => dword(0x01E230)
function log_slides() => dword(0x01E234)
function log_eliminations() => dword(0x01E238)

// S-Tanks Found
function log_stank_freeze() => byte(0x01E251)
function log_stank_cloud() => byte(0x01E252)
function log_stank_junk() => byte(0x01E253)
function log_stank_turbo() => byte(0x01E254)
function log_stank_slash() => byte(0x01E255)
function log_stank_shade() => byte(0x01E256)
function log_stank_burst() => byte(0x01E257)
function log_stank_spring() => byte(0x01E258)

// Damage
function log_damage_1() => dword(0x01E2A0)
function log_damage_2() => dword(0x01E2A4)
function log_damage_3() => dword(0x01E2A8)

// Battle Log
function battle_opponent() => byte(0x01E400)
function battle_start_timer() => dword(0x01E404)
function battle_start_damage() => dword(0x01E408)
function battle_wins_freeze() => byte(0x01E420)
function battle_wins_cloud() => byte(0x01E421)
function battle_wins_junk() => byte(0x01E422)
function battle_wins_turbo() => byte(0x01E423)
function battle_wins_slash() => byte(0x01E424)
function battle_wins_shade() => byte(0x01E425)
function battle_wins_burst() => byte(0x01E426)
function battle_wins_spring() => byte(0x01E427)
function battle_wins_w1() => byte(0x01E428)
function battle_wins_w2() => byte(0x01E429)
function battle_wins_w3() => byte(0x01E42A)
function battle_wins_w4() => byte(0x01E42B)
function battle_wins_w5() => byte(0x01E42C)

// =========================================
//             Utility Functions              
// =========================================

function f_game_beaten() => log_game_beaten() == true && prev(log_game_beaten()) == false
function f_game_started() => word(0x1e00e) == 0x5045
function f_yes_password_normal_game() =>                         log_special_mode() == false && never(!f_game_started())
function f_no_password_normal_game() => log_enabled() == true && log_special_mode() == false && never(!f_game_started())
function f_money() => word(0x01E0A0) * 10000000 + word(0x01E0B0) * 1000000 + word(0x01E0C0) * 3000000 + word(0x01E0D0)
              * 5000000 + word(0x01E0E0) * 1000000 + word(0x01E0A2) * 1000000 + word(0x01E0B2) * 100000 + word(0x01E0C2)
              * 300000 + word(0x01E0D2) * 500000 + word(0x01E0E2) * 100000 + word(0x01E0A4) * 1000000 + word(0x01E0B4) *
              100000 + word(0x01E0C4) * 300000 + word(0x01E0D4) * 500000 + word(0x01E0E4) * 100000 + 0

function f_in_game_time() => byte(0x001FBC) * 256 + byte(0x001FBD) * 65536 + byte(0x001FBE) * 16777216 + byte(0x001FBF) *
              4294967295 + byte(0x0000D3)

function f_battle_time() => byte(0x001FBC) * 256 + byte(0x001FBD) * 65536 + byte(0x001FBE) * 16777216 + byte(0x001FBF) *
              4294967295 + byte(0x0000D3) + 0 - dword(0x01E404)

// OK
weap_hits_buster_only = [0x1E181, 0x1E182, 0x1E183, 0x1E184, 0x1E185, 0x1E186, 0x1E187, 0x1E188, 0x1E189, 0x1E18A, 0x1E18B, 0x1E18C, 0x1E18D, 0x1E18E, 0x1E18F, 0x1E190, 0x1E191, 0x1E192, 0x1E193, 0x1E194, 0x1E195, 0x1E196, 0x1E197, 0x1E198, 0x1E199, 0x1E19A, 0x1E19B, 0x1E19C, 0x1E19D, 0x1E19E, 0x1E19F, 0x1E1A1, 0x1E1A2, 0x1E1A3, 0x1E1A4, 0x1E1A5, 0x1E1A6, 0x1E1A7, 0x1E1A8, 0x1E1A9, 0x1E1AA, 0x1E1AB, 0x1E1AC, 0x1E1AD, 0x1E1AE, 0x1E1AF, 0x1E1B0, 0x1E1B1, 0x1E1B2, 0x1E1B3, 0x1E1B4, 0x1E1B5, 0x1E1B6, 0x1E1B7, 0x1E1B8, 0x1E1B9, 0x1E1BA, 0x1E1BB, 0x1E1BC, 0x1E1BD, 0x1E1BE, 0x1E1BF, 0x1E1C1, 0x1E1C2, 0x1E1C3, 0x1E1C4, 0x1E1C5, 0x1E1C6, 0x1E1C7, 0x1E1C8, 0x1E1C9, 0x1E1CA, 0x1E1CB, 0x1E1CC, 0x1E1CD, 0x1E1CE, 0x1E1CF, 0x1E1D0, 0x1E1D1, 0x1E1D2, 0x1E1D3, 0x1E1D4, 0x1E1D5, 0x1E1D6, 0x1E1D7, 0x1E1D8, 0x1E1D9, 0x1E1DA, 0x1E1DB, 0x1E1DC, 0x1E1DD, 0x1E1DE, 0x1E1DF, 0x1E1E1, 0x1E1E2, 0x1E1E3, 0x1E1E4, 0x1E1E5, 0x1E1E6, 0x1E1E7, 0x1E1E8, 0x1E1E9, 0x1E1EA, 0x1E1EB, 0x1E1EC, 0x1E1ED, 0x1E1EE, 0x1E1EF, 0x1E1F0, 0x1E1F1, 0x1E1F2, 0x1E1F3, 0x1E1F4, 0x1E1F5, 0x1E1F6, 0x1E1F7, 0x1E1F8, 0x1E1F9, 0x1E1FA, 0x1E1FB, 0x1E1FC, 0x1E1FD, 0x1E1FE, 0x1E1FF]

// OK
weap_hits_shield_only = [0x1E183, 0x1E184, 0x1E185, 0x1E186, 0x1E187, 0x1E188, 0x1E189, 0x1E18A, 0x1E18B, 0x1E18E, 0x1E18F, 0x1E190, 0x1E191, 0x1E192, 0x1E193, 0x1E194, 0x1E195, 0x1E196, 0x1E197, 0x1E198, 0x1E199, 0x1E19A, 0x1E19B, 0x1E19C, 0x1E19D, 0x1E19E, 0x1E19F, 0x1E1A3, 0x1E1A4, 0x1E1A5, 0x1E1A6, 0x1E1A7, 0x1E1A8, 0x1E1A9, 0x1E1AA, 0x1E1AB, 0x1E1AE, 0x1E1AF, 0x1E1B0, 0x1E1B1, 0x1E1B2, 0x1E1B3, 0x1E1B4, 0x1E1B5, 0x1E1B6, 0x1E1B7, 0x1E1B8, 0x1E1B9, 0x1E1BA, 0x1E1BB, 0x1E1BC, 0x1E1BD, 0x1E1BE, 0x1E1BF, 0x1E1C3, 0x1E1C4, 0x1E1C5, 0x1E1C6, 0x1E1C7, 0x1E1C8, 0x1E1C9, 0x1E1CA, 0x1E1CB, 0x1E1CE, 0x1E1CF, 0x1E1D0, 0x1E1D1, 0x1E1D2, 0x1E1D3, 0x1E1D4, 0x1E1D5, 0x1E1D6, 0x1E1D7, 0x1E1D8, 0x1E1D9, 0x1E1DA, 0x1E1DB, 0x1E1DC, 0x1E1DD, 0x1E1DE, 0x1E1DF, 0x1E1E3, 0x1E1E4, 0x1E1E5, 0x1E1E6, 0x1E1E7, 0x1E1E8, 0x1E1E9, 0x1E1EA, 0x1E1EB, 0x1E1EE, 0x1E1EF, 0x1E1F0, 0x1E1F1, 0x1E1F2, 0x1E1F3, 0x1E1F4, 0x1E1F5, 0x1E1F6, 0x1E1F7, 0x1E1F8, 0x1E1F9, 0x1E1FA, 0x1E1FB, 0x1E1FC, 0x1E1FD, 0x1E1FE, 0x1E1FF]

// OK
weap_boss_weapon_only = [0x01e187, 0x01e1a7, 0x01e1c7, 0x01e1e7, // Beat 1
                         0x01e189, 0x01e1a9, 0x01e1c9, 0x01e1e9,  // Eddie
                         0x01e18b, 0x01e1ab, 0x01e1cb, 0x01e1eb, // Nova Strike Lemons
                         0x01e18c, 0x01e1ac, 0x01e1cc, 0x01e1ec, // Shield 1
                         0x01e18d, 0x01e1ad, 0x01e1cd, 0x01e1ed, // Shield 2
                         0x01e18e, 0x01e1ae, 0x01e1ce, 0x01e1ee, // Beat 2
                         0x01e198, 0x01e1b8, 0x01e1d8, 0x01e1f8,  // Nova Strike
                         0x01e199, 0x01e1b9, 0x01e1d9, 0x01e1f9] // Rush Freeze

function f_pl_buster_only() {
    return sum_of(weap_hits_buster_only, i => byte(i)) == 0
}

function f_pl_shield_only() {
    return (
        sum_of(weap_hits_shield_only, i => byte(i)) == 0 &&
        byte(0x01e180) == byte(0x01e260) &&
        byte(0x01e1a0) == byte(0x01e261) &&
        byte(0x01e1c0) == byte(0x01e262) &&
        byte(0x01e1e0) == byte(0x01e263) &&
 
        byte(0x01e181) == byte(0x01e264) &&
        byte(0x01e1a1) == byte(0x01e265) &&
        byte(0x01e1c1) == byte(0x01e266) &&
        byte(0x01e1e1) == byte(0x01e267) &&

        byte(0x01e182) == byte(0x01e268) &&
        byte(0x01e1a2) == byte(0x01e269) &&
        byte(0x01e1c2) == byte(0x01e26a) &&
        byte(0x01e1e2) == byte(0x01e26b)
    )
}

function f_pl_boss_weapon_only() {
    return (
        sum_of(weap_boss_weapon_only, i => byte(i)) == 0 &&
        byte(0x01e180) == byte(0x01e270) &&
        byte(0x01e1a0) == byte(0x01e271) &&
        byte(0x01e1c0) == byte(0x01e272) &&
        byte(0x01e1e0) == byte(0x01e273) &&
 
        byte(0x01e181) == byte(0x01e274) &&
        byte(0x01e1a1) == byte(0x01e275) &&
        byte(0x01e1c1) == byte(0x01e276) &&
        byte(0x01e1e1) == byte(0x01e277) &&

        byte(0x01e182) == byte(0x01e278) &&
        byte(0x01e1a2) == byte(0x01e279) &&
        byte(0x01e1c2) == byte(0x01e27a) &&
        byte(0x01e1e2) == byte(0x01e27b)

    )
}

// =========================================
//                 Bonus Set            
// =========================================

achievement("Abstainer", "Reach Wily 5 without consuming E-Tanks.", 10,
            trigger =   f_no_password_normal_game() &&
                        log_etanks_used_1() == 0 &&
                        st_current_wily() == 5 && prev(st_current_wily()) == 4)

achievement("Energy-Efficient", "Reach Wily 5 without consuming W-Tanks.", 10,
            trigger =   f_no_password_normal_game() &&
                        log_wtanks_used_1() == 0 &&
                        st_current_wily() == 5 && prev(st_current_wily()) == 4)

achievement("Elixir", "Reach Wily 5 without consuming S-Tanks.", 10,
            trigger =   f_no_password_normal_game() &&
                        log_stanks_used_1() == 0 &&
                        st_current_wily() == 5 && prev(st_current_wily()) == 4)

achievement("I'm on a Diet", "Reach Wily 5 without consuming Beat.", 25,
            trigger =   f_no_password_normal_game() &&
                        log_beats_used_1() == 0 &&
                        st_current_wily() == 5 && prev(st_current_wily()) == 4,
            id = 232858)

achievement("New Old Goods", "Reach Wily 5 without taking more than 140 damage.", 100,
            trigger =   f_no_password_normal_game() &&
                        log_total_damage_taken() <= 140 &&
                        st_current_wily() == 5 && prev(st_current_wily()) == 4)

achievement("Bullseye", "Beat the game with the hit ratio of full charged buster shots at 95% or more.", 10,
            trigger =   f_no_password_normal_game() &&
                        bit0(0x01e703) == true && prev(bit0(0x01e703)) == false)
                        
achievement("Consistent", "Beat the game without using the exit item.", 10,
            trigger =   f_no_password_normal_game() &&
                        log_stage_exit_count() == 0 &&
                        f_game_beaten())

achievement("I'm Not Lost", "Beat the game without reentering any stage.", 25,
            trigger =   f_no_password_normal_game() &&
                        log_stage_entry_count() <= 13 &&
                        f_game_beaten())

achievement("Needlework", "Beat the game without touching any spikes.", 50,
            trigger =   f_no_password_normal_game() &&
                        log_spike() == 0 &&
                        trigger_when(f_game_beaten()),
            id = 232863)

achievement("I'm Not a Boy", "Beat the game without jumping more than 400 times.", 50,
            trigger =   f_no_password_normal_game() &&
                        log_jumps() <= 400 &&
                        f_game_beaten())

achievement("Examinee", "Beat the game without sliding more than 20 times.", 25,
            trigger =   f_no_password_normal_game() &&
                        log_slides() <= 20 &&
                        f_game_beaten())

achievement("Pacifist", "Beat the game without killing more than 20 enemies (except where needed to progress).", 100,
            trigger =   f_no_password_normal_game() &&
                        log_eliminations() <= 20 &&
                        f_game_beaten())

achievement("Runner", "Beat the game within a time of 1h15.", 50,
            trigger =   f_no_password_normal_game() &&
                        f_in_game_time() <= 270000 &&
                        f_game_beaten())

achievement("Master Bean", "Beat the game using lemons only, no charged shots.", 50,
            trigger =   f_no_password_normal_game() &&
                        f_pl_buster_only() &&
                        trigger_when(f_game_beaten()))

achievement("Captain", "Start at Slash Man and obtain Proto Shield, then beat the game only using it.", 100,
            trigger =   f_no_password_normal_game() &&
                        sum_of(range(0,15), i => byte(0x1e260 + i)) > 0 &&
                        f_pl_shield_only() &&
                        trigger_when(f_game_beaten()))

achievement("Rainbowkid", "After obtaining a boss weapon, beat the entire game only using any of the 8 boss weapons.", 50,
            trigger =   f_no_password_normal_game() &&
                        sum_of(range(0,15), i => byte(0x1e270 + i)) > 0 &&
                        f_pl_boss_weapon_only() &&
                        trigger_when(f_game_beaten()))

// =========================================
//           Leaderboard for Bonus              
// =========================================

leaderboard(
    id = 37969, title = "Damage Challenge",
    description = "Reach Wily 5 with the least amount of damage (no password).",
    start  = byte(0x01E000) == 1 && byte(0x00FFFD) == 21 && byte(0x01E00D) == 0,
    cancel = byte(0x01E000) == 0,
    submit = dword(0x01E2A0) != prev(dword(0x01E2A0)),
    value = dword(0x01E018),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    id = 37966, title = "Jump Challenge",
    description = "Beat the game with the least amount of jumps (no password).",
    start  = byte(0x01E000) == 1 && byte(0x00FFFD) == 21 && byte(0x01E00D) == 0,
    cancel = byte(0x01E000) == 0,
    submit = byte(0x01E6FF) == 1 && prev(byte(0x01E6FF)) == 0,
    value = dword(0x01E230),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    id = 37967, title = "Slide Challenge",
    description = "Beat the game with the least amount of slides (no password).",
    start  = byte(0x01E000) == 1 && byte(0x00FFFD) == 21 && byte(0x01E00D) == 0,
    cancel = byte(0x01E000) == 0,
    submit = byte(0x01E6FF) == 1 && prev(byte(0x01E6FF)) == 0,
    value = dword(0x01E234),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    id = 37968, title = "Pacifist Challenge",
    description = "Beat the game by eliminating the least amount of enemies possible (no password).",
    start  = byte(0x01E000) == 1 && byte(0x00FFFD) == 21 && byte(0x01E00D) == 0,
    cancel = byte(0x01E000) == 0,
    submit = byte(0x01E6FF) == 1 && prev(byte(0x01E6FF)) == 0,
    value = dword(0x01E238),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    id = 37948, title = "Speedrun Any%",
    description = "Beat the game the fastest as possible (no password).",
    start  = byte(0x01E000) == 1 && byte(0x00FFFD) == 21 && byte(0x01E00D) == 0,
    cancel = byte(0x01E000) == 0,
    submit = byte(0x01E6FF) == 1 && prev(byte(0x01E6FF)) == 0,
    value = measured((byte(0x001FBC) * 255 + byte(0x001FBD) * 65535 + byte(0x001FBE) * 16777215 + byte(0x001FBF) *
              4294967295 + byte(0x0000D3))),
    format = "FRAMES", lower_is_better = true
)