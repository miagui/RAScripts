// ~Hack~ Rockman 7 EP
// #ID = 17184

// =========================================
//              Memory Acessors              
// =========================================

// Game
function g_screen() => byte(0x00013F)
function g_music() => byte(0x00FFFD)
function g_dialogue_sequence() => byte(0x0000f2)

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

function pl_etanks_amount() => byte(0x000BA0)
function pl_wtanks_amount() => byte(0x000BA1)
function pl_stanks_amount() => byte(0x000BA2)
function pl_beat_amount() => byte(0x000BA3)

function pl_nova_adaptor_obtained() => bit7(0x000B9F)
function pl_ultimate_adaptor_obtained() => bit6(0x000BA4)
function pl_proto_shield_obtained() => bit7(0x000b95)
function pl_hero_shield_FF() => byte(0x001FB9)

function pl_bolts() => word(0x000BA6)

function pl_active_07() => byte(0x000BD7)
function pl_teleporting() => byte(0x000BD8)
function pl_pos_x() => word(0x000C05)
function pl_pos_y() => word(0x000C08)
function pl_screen_x() => byte(0x000c06)
function pl_screen_y() => byte(0x000c09)
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
function log_weap_fired_junk() => (byte(0x01e105) * 0x1) + (byte(0x01e125) * 0x100) + (byte(0x01e145) * 0x10000) + (byte(0x01e165) * 0x1000000)
function log_weap_fired_junk_3x() => (byte(0x01e105) * 0x3) + (byte(0x01e125) * 0x300) + (byte(0x01e145) * 0x30000)
function log_weap_hit_junk() => (byte(0x01e185) * 0x1) + (byte(0x01e1a5) * 0x100) + (byte(0x01e1c5) * 0x10000) + (byte(0x01e1e5) * 0x1000000)

function log_rush_freeze() => (byte(0x01e119) * 0x1) + (byte(0x01e139) * 0x100) + (byte(0x01e159) * 0x10000) + (byte(0x01e179) * 0x1000000)
function log_eddie_crash() => (byte(0x01e189) * 0x1) + (byte(0x01e1a9) * 0x100) + (byte(0x01e1c9) * 0x10000) + (byte(0x01e1e9) * 0x1000000)
function log_hot_beat() => (byte(0x01e18e) * 0x1) + (byte(0x01e1ae) * 0x100) + (byte(0x01e1ce) * 0x10000) + (byte(0x01e1ee) * 0x1000000)

function log_regular_buster() => (byte(0x01e100) * 0x1) + (byte(0x01e120) * 0x100) + (byte(0x01e140) * 0x10000) + (byte(0x01e160) * 0x1000000)
function log_nova_strike_lemon() => (byte(0x01e18b) * 0x1) + (byte(0x01e1ab) * 0x100) + (byte(0x01e1cb) * 0x10000) + (byte(0x01e1eb) * 0x1000000)

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
function f_normal_game() => log_special_mode() == false && never(!f_game_started())
function f_no_password_normal_game() => log_enabled() == true && log_special_mode() == false && never(!f_game_started())

function junk_3x_hits_logic() {
    trigger = always_false()

    for i in range(1,380) {
        trigger =   trigger ||
                    (log_weap_fired_junk() == i && log_weap_hit_junk() >= i * 3)
    }

    return trigger
}

function f_outside_password_screen() => g_music() != 0x2f

function f_money() => word(0x01E0A0) * 10000000 + word(0x01E0B0) * 1000000 + word(0x01E0C0) * 3000000 + word(0x01E0D0)
              * 5000000 + word(0x01E0E0) * 1000000 + word(0x01E0A2) * 1000000 + word(0x01E0B2) * 100000 + word(0x01E0C2)
              * 300000 + word(0x01E0D2) * 500000 + word(0x01E0E2) * 100000 + word(0x01E0A4) * 1000000 + word(0x01E0B4) *
              100000 + word(0x01E0C4) * 300000 + word(0x01E0D4) * 500000 + word(0x01E0E4) * 100000 + 0

function f_in_game_time() => byte(0x001FBC) * 256 + byte(0x001FBD) * 65536 + byte(0x001FBE) * 16777216 + byte(0x001FBF) *
              4294967295 + byte(0x0000D3)

function f_battle_time() => byte(0x001FBC) * 256 + byte(0x001FBD) * 65536 + byte(0x001FBE) * 16777216 + byte(0x001FBF) *
              4294967295 + byte(0x0000D3) + 0 - dword(0x01E404)

weap_hits_buster_only = [0x1E183, 0x1E184, 0x1E185, 0x1E186, 0x1E187, 0x1E188, 0x1E189, 0x1E18A, 0x1E18B, 0x1E18C, 0x1E18D, 0x1E18E, 0x1E18F, 0x1E190, 0x1E191, 0x1E192, 0x1E193, 0x1E194, 0x1E195, 0x1E196, 0x1E197, 0x1E198, 0x1E199, 0x1E19A, 0x1E19B, 0x1E19C, 0x1E19D, 0x1E19E, 0x1E19F, 0x1E1A3, 0x1E1A4, 0x1E1A5, 0x1E1A6, 0x1E1A7, 0x1E1A8, 0x1E1A9, 0x1E1AA, 0x1E1AB, 0x1E1AC, 0x1E1AD, 0x1E1AE, 0x1E1AF, 0x1E1B0, 0x1E1B1, 0x1E1B2, 0x1E1B3, 0x1E1B4, 0x1E1B5, 0x1E1B6, 0x1E1B7, 0x1E1B8, 0x1E1B9, 0x1E1BA, 0x1E1BB, 0x1E1BC, 0x1E1BD, 0x1E1BE, 0x1E1BF, 0x1E1C3, 0x1E1C4, 0x1E1C5, 0x1E1C6, 0x1E1C7, 0x1E1C8, 0x1E1C9, 0x1E1CA, 0x1E1CB, 0x1E1CC, 0x1E1CD, 0x1E1CE, 0x1E1CF, 0x1E1D0, 0x1E1D1, 0x1E1D2, 0x1E1D3, 0x1E1D4, 0x1E1D5, 0x1E1D6, 0x1E1D7, 0x1E1D8, 0x1E1D9, 0x1E1DA, 0x1E1DB, 0x1E1DC, 0x1E1DD, 0x1E1DE, 0x1E1DF, 0x1E1E3, 0x1E1E4, 0x1E1E5, 0x1E1E6, 0x1E1E7, 0x1E1E8, 0x1E1E9, 0x1E1EA, 0x1E1EB, 0x1E1EC, 0x1E1ED, 0x1E1EE, 0x1E1EF, 0x1E1F0, 0x1E1F1, 0x1E1F2, 0x1E1F3, 0x1E1F4, 0x1E1F5, 0x1E1F6, 0x1E1F7, 0x1E1F8, 0x1E1F9, 0x1E1FA, 0x1E1FB, 0x1E1FC, 0x1E1FD, 0x1E1FE, 0x1E1FF]

function f_pl_not_buster_counter() => sum_of(weap_hits_buster_only, i => byte(i))


// =========================================
//                Progression              
// =========================================

function achiev_boss_defeated(title, boss, address, cheevo_id) {
    achievement(title, format("Finish {0} stage and obtain his weapon.", boss), 5,
                trigger =   f_normal_game() &&
                            st_current_stage() != 0x0e &&
                            bit7(address) == true && prev(bit7(address)) == false
                )
}

achiev_boss_defeated("Silver Bullet", "Freeze Man", 0x0b85, 0)
achiev_boss_defeated("Plasma Strike", "Cloud Man", 0x0b87, 0)
achiev_boss_defeated("Scrap Flood", "Junk Man", 0x0b89, 0)
achiev_boss_defeated("Self-Burning", "Turbo Man", 0x0b8b	
, 0)
achiev_boss_defeated("King's Slash", "Slash Man", 0x0b8d, 0)
achiev_boss_defeated("Ripple Noise", "Shade Man", 0x0b8f	
, 0)
achiev_boss_defeated("3-Point Burst", "Burst Man", 0x0b91	
, 0)
achiev_boss_defeated("Bikkura Coil", "Spring Man", 0x0b93	
, 0)

achievement("Thorny Paths", "Finish Wily 1 stage.", 5,
                trigger =   f_normal_game() &&
                            f_outside_password_screen() &&
                            st_current_wily() == 2 && prev(st_current_wily()) == 1,
                id = 0)

achievement("Dreadnought", "Finish Wily 2 stage.", 5,
                trigger =   f_normal_game() &&
                            f_outside_password_screen() &&
                            st_current_wily() == 3 && prev(st_current_wily()) == 2,
                id = 0)

achievement("Pursuer", "Finish Wily 3 stage.", 5,
                trigger =   f_normal_game() &&
                            f_outside_password_screen() &&
                            st_current_wily() == 4 && prev(st_current_wily()) == 3,
                id = 0)

achievement("Abyss", "Finish Wily 4 stage.", 5,
                trigger =   f_normal_game() &&
                            f_outside_password_screen() &&
                            st_current_wily() == 5 && prev(st_current_wily()) == 4,
                id = 0)

achievement("The EP", "Beat the game.", 5,
                trigger =   f_normal_game() &&
                            f_outside_password_screen() &&
                            f_game_beaten(),
                id = 0)

// =========================================
//                Damageless              
// =========================================

function achiev_boss_damageless(title, boss, boss_id, points, cheevo_id) {
    boss_wins = byte(0x1e420 + boss_id)
    boss_losses = byte(0x1e440 + boss_id)
    achievement(title, format("Defeat {0} without taking damage.", boss), points,
                trigger =   f_normal_game() &&
                            once(battle_opponent() == boss_id && prev(battle_opponent()) == 0xFF) &&
                            trigger_when(boss_wins > prev(boss_wins)) &&
                            never(log_total_damage_taken() > prev(log_total_damage_taken())) &&
                            never(log_stage_exit_count() > prev(log_stage_exit_count())) &&
                            never(boss_losses > prev(boss_losses)))
}

achiev_boss_damageless("Frozen Skyscrapers", "Freeze Man", 0x00, 5, 0)
achiev_boss_damageless("Welcome To My Palace", "Cloud Man", 0x01, 10, 0)
achiev_boss_damageless("Dreamful Factory", "Junk Man", 0x02, 2, 0)
achiev_boss_damageless("Safety First!!", "Turbo Man", 0x03, 5, 0)

achiev_boss_damageless("Save the Animals!!", "Slash Man", 0x04, 2, 0)
achiev_boss_damageless("I Like Texas Toast", "Shade Man", 0x05, 3, 0)
achiev_boss_damageless("I'm Not Bubble Man!!", "Burst Man", 0x06, 10, 0)
achiev_boss_damageless("Viva!!! Spring World", "Spring Man", 0x07, 10, 0)

// =========================================
//               Buster Only              
// =========================================

function achiev_boss_buster_only(title, boss, boss_id, id_cheevo) {
    boss_wins = byte(0x1e420 + boss_id)
    boss_losses = byte(0x1e440 + boss_id)
    achievement(title, format("Defeat {0} using buster only and without consuming items.", boss), 5,
                trigger =   f_normal_game() &&
                            once(battle_opponent() == boss_id && prev(battle_opponent()) == 0xFF) &&
                            trigger_when(boss_wins > prev(boss_wins)) &&
                            never(pl_etanks_amount() < prev(pl_etanks_amount())) &&
                            never(pl_stanks_amount() < prev(pl_stanks_amount())) &&
                            never(f_pl_not_buster_counter() > prev(f_pl_not_buster_counter())) &&
                            never(log_stage_exit_count() > prev(log_stage_exit_count())) &&
                            never(boss_losses > prev(boss_losses))
                )
}

achiev_boss_buster_only("Frozen Lemon", "Freeze Man", 0x00, 0)
achiev_boss_buster_only("Cloudy Lemon", "Cloud Man", 0x01, 0)
achiev_boss_buster_only("Junky Lemon", "Junk Man", 0x02, 0)
achiev_boss_buster_only("Turbo Lemon", "Turbo Man", 0x03, 0)

achiev_boss_buster_only("Slashed Lemon", "Slash Man", 0x04, 0)
achiev_boss_buster_only("Shaded Lemon", "Shade Man", 0x05, 0)
achiev_boss_buster_only("Bursted Lemon", "Burst Man", 0x06, 0)
achiev_boss_buster_only("Springy Lemon", "Spring Man", 0x07, 0)


// =========================================
//             Economic Mega Man              
// =========================================

function achiev_stage_challenge(title, stage_name, stage_id, start_checkpoint, end_checkpoint, points, id_cheevo) {
    achievement(title, format("Reach {0} boss door without dying and not consuming items.", stage_name), points,
                trigger =   f_normal_game() &&
                            never(st_current_stage() != stage_id) &&
                            once(st_checkpoint() == start_checkpoint &&
                                 pl_active_07() == 0x07 &&
                                 pl_teleporting() == false && prev(pl_teleporting()) == true) &&
                            trigger_when(st_checkpoint() == end_checkpoint && prev(st_checkpoint()) == end_checkpoint - 1) &&

                            never(log_lives_used_1() > prev(log_lives_used_1())) &&
                            never(log_lives_used_2() > prev(log_lives_used_2())) &&

                            never(log_etanks_used_1() > prev(log_etanks_used_1())) &&
                            never(log_etanks_used_2() > prev(log_etanks_used_2())) &&

                            never(log_wtanks_used_1() > prev(log_wtanks_used_1())) &&
                            never(log_wtanks_used_2() > prev(log_wtanks_used_2())) &&

                            never(log_stanks_used_1() > prev(log_stanks_used_1())) &&
                            never(log_stanks_used_2() > prev(log_stanks_used_2())) &&

                            never(log_beats_used_1() > prev(log_beats_used_1())) &&
                            never(log_beats_used_2() > prev(log_beats_used_2()))
                )
}

achiev_stage_challenge("Economic Mega Man I", "Freeze Man", 0x01, 0, 2, 5, 0) // V
achiev_stage_challenge("Economic Mega Man II", "Cloud Man", 0x02, 0, 2, 5, 0) // V
achiev_stage_challenge("Economic Mega Man III", "Junk Man", 0x03, 0, 2, 5, 0) // V
achiev_stage_challenge("Economic Mega Man IV", "Turbo Man", 0x04, 0, 2, 5, 0) // V
achiev_stage_challenge("Economic Mega Man V", "Slash Man", 0x05, 0, 2, 5, 0) // V
achiev_stage_challenge("Economic Mega Man VI", "Shade Man", 0x06, 0, 2, 5, 0) // V
achiev_stage_challenge("Economic Mega Man VII", "Burst Man", 0x07, 0, 2, 5, 0) // V
achiev_stage_challenge("Economic Mega Man VIII", "Spring Man", 0x08, 0, 2, 5, 0) // V
achiev_stage_challenge("Economic Mega Man IX", "Wily 1", 0x0a, 0, 2, 10, 0) // V
// achiev_stage_challenge("Economic Mega Man X", "Wily 2", 0x0b, 0, 3, 10, 0)
achiev_stage_challenge("Economic Mega Man XI", "Wily 3", 0x0c, 0, 3, 10, 0) // V
achiev_stage_challenge("Economic Mega Man XII", "Wily 4", 0x0d, 0, 1, 10, 0) // V
// achiev_stage_challenge("Economic Mega Man XIII", "Wily 5", 0x09, 0, 3, 10, 0)

// Wily 2 specific logic
achievement("Economic Mega Man X", "Reach Wily 2 boss without dying and not consuming items.", 10,
                trigger =   f_normal_game() &&
                            never(st_current_stage() != 0x0b) &&
                            once(st_checkpoint() == 0x00 &&
                                 pl_active_07() == 0x07 &&
                                 pl_teleporting() == false && prev(pl_teleporting()) == true) &&
                            trigger_when(battle_opponent() == 0x09 && prev(battle_opponent()) == 0xff) &&

                            never(log_lives_used_1() > prev(log_lives_used_1())) &&
                            never(log_lives_used_2() > prev(log_lives_used_2())) &&

                            never(log_etanks_used_1() > prev(log_etanks_used_1())) &&
                            never(log_etanks_used_2() > prev(log_etanks_used_2())) &&

                            never(log_wtanks_used_1() > prev(log_wtanks_used_1())) &&
                            never(log_wtanks_used_2() > prev(log_wtanks_used_2())) &&

                            never(log_stanks_used_1() > prev(log_stanks_used_1())) &&
                            never(log_stanks_used_2() > prev(log_stanks_used_2())) &&

                            never(log_beats_used_1() > prev(log_beats_used_1())) &&
                            never(log_beats_used_2() > prev(log_beats_used_2()))
                )

achievement("Economic Mega Man XIII", "Reach Wily 5 boss door without dying and not consuming items.", 10,
                trigger =   f_normal_game() &&
                            never(st_current_stage() != 0x09) &&
                            once(pl_screen_x() == 0x02 &&
                                 pl_screen_y() == 0x06 &&
                                 pl_active_07() == 0x07 &&
                                 pl_teleporting() == false && prev(pl_teleporting()) == true) &&
                            trigger_when(pl_screen_x() == 0x06 && pl_screen_y() == 0x0c) &&

                            never(log_lives_used_1() > prev(log_lives_used_1())) &&
                            never(log_lives_used_2() > prev(log_lives_used_2())) &&

                            never(log_etanks_used_1() > prev(log_etanks_used_1())) &&
                            never(log_etanks_used_2() > prev(log_etanks_used_2())) &&

                            never(log_wtanks_used_1() > prev(log_wtanks_used_1())) &&
                            never(log_wtanks_used_2() > prev(log_wtanks_used_2())) &&

                            never(log_stanks_used_1() > prev(log_stanks_used_1())) &&
                            never(log_stanks_used_2() > prev(log_stanks_used_2())) &&

                            never(log_beats_used_1() > prev(log_beats_used_1())) &&
                            never(log_beats_used_2() > prev(log_beats_used_2())),
                id = 232821
                )

// =========================================
//               Miscellaneous              
// =========================================

achievement("Cursed Shield", "Defeat Proto Man and obtain his Proto Shield.", 3,
            trigger =   f_normal_game() &&
                        f_outside_password_screen() &&
                        pl_proto_shield_obtained() == true && prev(pl_proto_shield_obtained()) == false)

achievement("R.U.S.H", "Obtain the Nova Adaptor.", 5,
            trigger =   f_normal_game() &&
                        f_outside_password_screen() &&
                        pl_nova_adaptor_obtained() == true && prev(pl_nova_adaptor_obtained()) == false)

achievement("Nova Strike", "Obtain the Ultimate Adaptor", 5,
            trigger =   f_normal_game() &&
                        f_outside_password_screen() &&
                        pl_ultimate_adaptor_obtained() == true && prev(pl_ultimate_adaptor_obtained()) == false)

achievement("Eu prefiro morrer do que perder a vida!", "Collect the 2nd 1-UP on Turbo Man stage", 2,
            trigger =   f_normal_game() &&
                        st_current_stage() == 0x04 &&
                        pl_screen_x() == 0x05 &&
                        pl_screen_y() == 0x0c &&
                        byte(0x000ba8) > prev(byte(0x000ba8)))

// =========================================
//                  Records            
// =========================================

function achiev_log_record(title, description, address, record_value, points, cheevo_id) {
    achievement(title, description, points,
                trigger =   f_normal_game() &&
                            measured(address >= record_value && prev(address) < record_value))
}

// Template: achiev_log_record("title", "description", address, 10, 5, 0)

achiev_log_record("Bean Counter", "Fire regular buster shot 2222+ times.", log_regular_buster(), 2222, 5, 0)

achiev_log_record("Fireball", "Fire a red full charged buster shot.", log_red_buster(), 1, 5, 0)
achiev_log_record("Holy Fist", "Silver Bullet: Hit 30+ times at close range.", log_silver_pointblank(), 30, 5, 0)
achiev_log_record("Ecology", "Plasma Strike: Achieve a 4-hit shot 30+ times.", log_4hit_plasma(), 30, 5, 0)

achievement("Recycle", "Scrap Flood: Beat the game with the hit ratio at 300%+ (380 shots or less).", 10,
                trigger =   f_normal_game() &&
                            log_weap_fired_junk() <= 380 &&
                            junk_3x_hits_logic() &&
                            trigger_when(f_game_beaten()))

achiev_log_record("Mymine", "3-Point Burst: Throw mines on the floor 20+ times.", log_3point_floor(), 20, 2, 0)
achiev_log_record("Short Stop", "King's Slash: Hit with a critical strike 5+ times.", log_slash_critical(), 5, 3, 0)
achiev_log_record("Noisy Neighbor", "Ripple Noise: Hit a large ripple 30+ times.", byte(0x01e18f), 30, 3, 0)
achiev_log_record("Keep Cool", "Self-Burning: Cancel ice bullets 3+ times.", log_selfburning_cancel(), 3, 4, 0)
achiev_log_record("Recoil", "Bikkura Coil: Hit with any attribute 10+ times.", byte(0x01e191), 10, 5, 232835)

achiev_log_record("Fridge", "Activate \"Rush Freeze\".", log_rush_freeze(), 1, 3, 0)
achiev_log_record("Rice Cooker", "Activate \"Eddie Crash\".", log_eddie_crash(), 1, 3, 0)
achiev_log_record("Oven", "Activate \"Hot Beat\".", log_hot_beat(), 1, 3, 0)
achiev_log_record("Sonic Bean", "Hit a buster shot during a Nova Strike 30+ times.", log_nova_strike_lemon(), 30, 3, 0)
achiev_log_record("Hero", "Block bullets with Proto Shield 256+ times.", log_shield_parry(), 256, 5, 0)


// =========================================
//                  S-Tanks              
// =========================================

function achiev_collect_s_tank(title, stage_name, address, cheevo_id) {
    achievement(title, format("Collect a S-Tank in {0} stage.", stage_name), 3,
                trigger =   f_normal_game() &&
                            byte(address) > prev(byte(address)))
}

achiev_collect_s_tank("Frozen S-Tank", "Freeze Man", 0x01e251, 0)
achiev_collect_s_tank("Electric S-Tank", "Cloud Man", 0x01e252, 0)
achiev_collect_s_tank("Junky S-Tank", "Junk Man", 0x01e253, 0)
achiev_collect_s_tank("Burning S-Tank", "Turbo Man", 0x01e254, 0)
achiev_collect_s_tank("Natural S-Tank", "Slash Man", 0x01e255, 0)
achiev_collect_s_tank("Vampiristic S-Tank", "Shade Man", 0x01e256, 0)
achiev_collect_s_tank("Bubble S-Tank", "Burst Man", 0x01e257, 0)
achiev_collect_s_tank("Bikkura S-Tank", "Spring Man", 0x01e258, 0)

// =========================================
//                   Misc              
// =========================================

achievement("Gladiator", "Finish Wily 2 with an AAA rank.", 25,
            trigger =   f_normal_game() &&
                        st_current_stage() == 0x0b &&
                        st_w2_damage_rank() < 3 &&
                        trigger_when(battle_wins_w2() > prev(battle_wins_w2())))

// =========================================
//                  Endings              
// =========================================

achievement("Low% and Penny-Pincher", "Beat the game without obtaining Proto Shield, Nova Adaptor and not buying anything.", 50,
            trigger =   f_no_password_normal_game() &&
                        pl_proto_shield_obtained() == false &&
                        pl_nova_adaptor_obtained() == false &&
                        log_bolts_used() == 0 &&
                        trigger_when(f_game_beaten()))

achievement("100%", "Beat the game with Heroic Shield and Ultimate Adaptor obtained.", 25,
            trigger =   f_no_password_normal_game() &&
                        pl_hero_shield_FF() == 0xFF &&
                        pl_ultimate_adaptor_obtained() == true &&
                        trigger_when(f_game_beaten()))

achievement("Everlasting Punishment", "Get the bad ending (password allowed).", 10,
            trigger =   f_normal_game() &&
                        once(pl_lives() == 0 &&
                             byte(0x01e44c) > prev(byte(0x01e44c))) &&
                        never(pl_lives() > prev(pl_lives())) &&
                        g_dialogue_sequence() == 0x2c,
            id = 232822
            )

achievement("Expert Player", "Beat the game without wasting more than 1 million dollars.", 50,
            trigger =   f_no_password_normal_game() &&
                        f_money() <= 1000000 &&
                        trigger_when(f_game_beaten()))

