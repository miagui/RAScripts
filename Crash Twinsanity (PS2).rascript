// Crash Twinsanity
// #ID = 19044

stages = {
   "N. Sanity Island": 0,
   "Jungle Bungle": 1,
   "Jungle Bungle (Boss Fight)": 2,
   "Cavern Catastrophe": 3,
   "Totem Hokum": 4,
   "N. Sanity Island (Boss Fight)": 5,
   "Iceberg Lab": 6,
   "Ice Climb": 7,
   "Ice Climb (Boss Fight)": 8,
   "Slip Slide Icecapades": 9,
   "High Seas Hi-Jinks": 10,
   "High Seas Hi-Jinks (Boss Fight)": 11,
   "Iceberg Lab (Boss Fight)": 12,
   "Academy of Evil": 13,
   "Boiler Room Doom": 15,
   "Boiler Room Doom (Boss Fight)": 16,
   "Classroom Chaos": 17,
   "Rooftop Rampage": 18,
   "Academy of Evil (Boss Fight)": 19,
   "Twinsanity Island": 20,
   "Rock-Slide Rumble": 21,
   "Bandicoot Pursuit": 22,
   "Ant Agony": 23,
   "Twinsanity Island (Boss Fight)": 24
}

function game_state_modifier_off() => bit0(0x98c146) == 0
function game_state_modifier_on() => bit0(0x98c146) == 1

function game_state() => high4(0x98C145) // when using these, make sure game_state_modifier_flag() is false
         gs_legal = 0x1
         gs_loading_mc1 = 0x2
         gs_loading_mc2 = 0x3
         gs_vivendi_fmv = 0x4
         gs_travellers_fmv = 0x5
         gs_loading1 = 0x6
         gs_press_start = 0x7
         gs_main_menu = 0x8
         gs_loading2 = 0x9
         gs_gameplay = 0xc
         gs_cutscene = 0xd
         gs_fmv = 0xe
         gs_paused = 0xf

function in_gameplay_strict() => game_state() == gs_gameplay
function in_gameplay() => game_state() >= gs_gameplay
function outside_gameplay() => game_state() <= 0x9 && game_state_modifier_off()
function is_paused() => game_state() == gs_paused
         
function in_load_game_menu() => bit5(0x98C147)
function in_a_cutscene_1() => bit1(0x98D950)
function in_a_cutscene_2() => bit1(0x98DA0C)
function game_paused() => bit1(0x309718)

function fmv_loaded() => byte(0x3C71C8)

function stage_id_big() {
    return(
        bit0(0x98C636) * 1 + 
        bit1(0x98C636) * 2 + 
        bit2(0x98C636) * 4 +
        bit3(0x98C636) * 8 +
        bit4(0x98C636) * 16
    )
}

function stage_id() => byte(0x98C636) & 0x1F
function stage_id_cp() => byte(0x98C6D8) & 0x1F

function igt_running() => dword(dword(0x30972C) + 0x24)
function igt_sum() => dword(0x98C638)
function igt_subtractor() => dword(0x98C63C)

function igt_real() => (igt_sum() / 150) - (igt_subtractor() / 150) + (igt_running() / 150)

function igt_save() => dword(0x98C6DC)

function lives_bit0() => bit7(0x98C630)
function lives_bit1() => bit0(0x98C631)
function lives_bit2() => bit1(0x98C631)
function lives_bit3() => bit2(0x98C631)
function lives_bit4() => bit3(0x98C631)
function lives_bit5() => bit4(0x98C631)
function lives_bit6() => bit5(0x98C631)
function lives() {
    return (
        (lives_bit0() * 1) +
        (lives_bit1() * 2) +
        (lives_bit2() * 4) +
        (lives_bit3() * 8) +
        (lives_bit4() * 16) +
        (lives_bit5() * 32) + 
        (lives_bit6() * 64)
    )

}
function boss_life() => low4(0x98C632)
function boss_life_active() => bit0(0x98c634)

function progression_bit0() => bit0(0x98C637)
function progression_bit1() => bit1(0x98C637)

function all_crystals() {
    return(
        bit0(0x98c665) +
        bit0(0x98c66d) +
        bit0(0x98c671) +
        bit0(0x98c679) +
        bit0(0x98c67d) +
        bit0(0x98c681) +
        bit0(0x98c689) +
        bit0(0x98c68d) +
        bit0(0x98c691) +
        bit0(0x98c699) +
        bit0(0x98c69d) +
        bit0(0x98c6a1)
    )
}


function game_beaten() => progression_bit0() + progression_bit1() == 2 && prev(progression_bit0()) + prev(progression_bit1()) == 1

function character_id() => low4(0x98C635)
         char_crash = 0
         char_cortex = 1
         char_nina = 3
         char_mecha = 5

function gem_bitflags_n_sanity_island() => byte(0x98C664)
function gem_bitflags_jungle_bungle() => byte(0x98C668)
function gem_bitflags_cavern_catastrophe() => byte(0x98C66C)
function gem_bitflags_totem_hokum() => byte(0x98C670)
function gem_bitflags_iceberg_lab() => byte(0x98C674)
function gem_bitflags_ice_climb() => byte(0x98C678)
function gem_bitflags_slip_slide_icecapades() => byte(0x98C67C)
function gem_bitflags_high_seas_hi_jinks() => byte(0x98C680)
function gem_bitflags_academy_of_evil() => byte(0x98C684)
function gem_bitflags_boiler_room_doom() => byte(0x98C688)
function gem_bitflags_classroom_chaos() => byte(0x98C68C)
function gem_bitflags_rooftop_rampage() => byte(0x98C690)
function gem_bitflags_twinsanity_island() => byte(0x98C694)
function gem_bitflags_rock_slide_rumble() => byte(0x98C698)
function gem_bitflags_bandicoot_pursuit() => byte(0x98C69C)
function gem_bitflags_ant_agony() => byte(0x98C6A0)

function local_cp_id() => word(0xB955F0)
function cp_is_local() => local_cp_id() != 0xFFFF
function cp_is_global() => local_cp_id() == 0xFFFF

function local_cp_crate_x_position() => dword(0xB95610)
function local_cp_crate_y_position() => dword(0xB95614)
function local_cp_crate_z_position() => dword(0xB95618)
function local_current_area_string_ptr() => dword(0xB95624)
function global_cp_id() => word(0xB956F0)
function global_cp_crate_x_position() => dword(0xB95710)
function global_cp_crate_y_position() => dword(0xB95714)
function global_cp_crate_z_position() => dword(0xB95718)
function global_current_area_string_ptr() => dword(0xB95724)

function whac_a_worm_time_ptr() => dword(0x990680)
function whac_a_worm_time() => word(dword(0x990680) + 0x02)
function whac_a_worm_smashed() => word(dword(0x990528) + 0x00)

function player_data_ptr() => dword(0x30957C)
function player_bitflag_ptr() => dword(0x309580)

function player_position_x() => dword(player_data_ptr() + 0x280)
function player_position_y() => dword(player_data_ptr() + 0x284)
function player_position_z() => dword(player_data_ptr() + 0x288)

function player_invincibility() => bit2(player_bitflag_ptr() + 0x11)
function player_aku1() => bit6(player_bitflag_ptr() + 0x14)
function player_aku2() => bit7(player_bitflag_ptr() + 0x14)
function player_life() => byte(player_bitflag_ptr() + 0x14) & 0xc0// not really HP, just a better way to think of Aku Aku values
function player_life2() => bit6(player_bitflag_ptr() + 0x14) * 1 + bit7(player_bitflag_ptr() + 0x14) * 2 // not really HP, just a better way to think of Aku Aku values


function player_dashing() => low4(player_bitflag_ptr() + 0x10) == 0x08
function player_collabing() => bit6(0x98c634)
// function player_alive() => bit0(player_bitflag_ptr() + 0x1e)

// =========================================
//                 Utility              
// =========================================

function game_beaten() => progression_bit0() + progression_bit1() == 2 && prev(progression_bit0()) + prev(progression_bit1()) == 1
function player_died() => player_life() == 0
function reset_took_damage() {
    return(
        never(player_life2() == 2 && prev(player_life2()) == 3) &&
        never(player_life2() == 1 && prev(player_life2()) == 2) &&
        never(player_life2() == 0 && prev(player_life2()) == 1)
    )
}

function changed_global_cp_to(cp_x, cp_y, cp_z) { // accept values as hex instead of float
    return (
        global_cp_crate_x_position() == cp_x &&
        global_cp_crate_y_position() == cp_y &&
        global_cp_crate_z_position() == cp_z &&
        global_cp_crate_x_position() != prev(global_cp_crate_x_position())
    )
}

function changed_local_cp_to(cp_x, cp_y, cp_z) { // accept values as hex instead of float
    return (
        local_cp_crate_x_position() == cp_x &&
        local_cp_crate_y_position() == cp_y &&
        local_cp_crate_z_position() == cp_z &&
        __ornext(local_cp_crate_x_position() != prev(local_cp_crate_x_position()) || local_cp_id() != prev(local_cp_id()))
    )
}


function global_cp_is(cp_x, cp_y, cp_z) { // accept values as hex instead of float
    return (
        global_cp_crate_x_position() == cp_x &&
        global_cp_crate_y_position() == cp_y &&
        global_cp_crate_z_position() == cp_z
    )
}

function local_cp_is(cp_x, cp_y, cp_z) { // accept values as hex instead of float
    return (
        local_cp_crate_x_position() == cp_x &&
        local_cp_crate_y_position() == cp_y &&
        local_cp_crate_z_position() == cp_z
    )
}


function player_pos_xyz(pos_x, pos_y, pos_z) { // accept values as hex instead of float
    return (
        player_position_x() == pos_x &&
        player_position_y() == pos_y &&
        player_position_z() == pos_z &&
        player_position_x() != prev(player_position_x())
    )
}


function objects_linkedlist_tail() => dword(dword(dword(0x309844) + 0x15c) + 0x48)

function wumpa_tree_grown() {
    trigger = always_false()
    node_number = 0
    current_node = objects_linkedlist_tail()
    for i in range(0, 299) {
        object_id = word(dword(current_node + 0x18)+ 0x06)
        object_flag = dword(dword(dword(current_node + 0x18) + 0x00) + 0x04)

        trigger =   trigger ||
                    never(object_id != 0x12c) &&
                    object_flag == 0x5618

        // proceed to next node
        current_node = dword(current_node + 0x10)
        node_number = node_number + 1
    }
    return trigger
}

function wumpa_tree_grown_attempt2() {
    trigger = always_false()
    node_number = 0
    current_object = 0x3d6bb0
    for i in range(0, 299) {
        object_flag1 = dword(dword(current_object) + 0x04)
        object_flag2 = low4(dword(dword(current_object) + 0x08) + 0x60)
        obj_pos_x = float(dword(dword(current_object) + 0x08) + 0x30)
        obj_pos_z = float(dword(dword(current_object) + 0x08) + 0x38)

        trigger =   trigger ||
                    __ornext(object_flag1 == 0x00005618 || object_flag1 == 0x00005418) && // 5418 is when object isn't visible
                    object_flag2 == 0x00 &&
                    obj_pos_x > -16.0 &&
                    obj_pos_z > 38.0

        // proceed to next node
        current_object = current_object + 4
        node_number = node_number + 1
    }
    return trigger
}


// =========================================
//                    Miscs              
// =========================================

achievement("Farmer Ernest is Proud!", "Grow a Wumpa Tree in N. Sanity Island", 1,
            trigger =   once(stage_id() == stages["N. Sanity Island"]) &&
                        in_gameplay() &&
                        wumpa_tree_grown_attempt2()
            )

achievement("Strong Spirit", "Turn invincible through the Aku Aku mask", 2,
            trigger =   in_gameplay_strict() &&
                        player_life() == 0xc0 &&
                        player_invincibility() == 1 &&
                        prev(player_invincibility()) == 0
            )

achievement("Whac-A-Worm", "Finish the Whac-A-Mole from N. Sanity Island with 23 seconds left", 5,
            trigger =   game_state() >= 0xc &&
                        stage_id() == stages["N. Sanity Island"] &&
                        once(whac_a_worm_time() == 0x3933 && prev(whac_a_worm_time()) != 0x3933 && player_collabing() == 1) &&
                        never(whac_a_worm_time() == 0x3232 || player_collabing() == 0) &&
                        never(outside_gameplay()) && // loading screen
                        trigger_when(game_state() == gs_cutscene && 
                                     prev(game_state()) == gs_gameplay &&
                                     game_state_modifier_off()
                                    )
            )

achievement("Crash Dash", "Slide over a slope terrain for over a second", 2,
            trigger =   in_gameplay_strict() &&
                        character_id() == char_crash &&
                        tally(90, igt_running() != prev(igt_running()) ) &&
                        never(player_died()) &&
                        never(!player_dashing())
            )

achievement("Slippery Slope", "Finish Slip Slide Icecapades in less than 3m10s", 10,
            trigger =   in_gameplay() &&
                        __ornext(stage_id_big() == stages["Slip Slide Icecapades"] || stage_id_big() == stages["High Seas Hi-Jinks"]) &&
                        tally(1, changed_local_cp_to(0xc2520e50, 0x42a34d80, 0xc2d29cc0), player_pos_xyz(0xc2520e50, 0x42a34d80, 0xc2d29cc0)) &&
                        never(outside_gameplay() || (local_cp_is(0xc2520e50, 0x42a34d80, 0xc2d29cc0) && cp_is_local() && player_died())) &&
                        never(repeated(11400, once(changed_local_cp_to(0xc2520e50, 0x42a34d80, 0xc2d29cc0)) && igt_running() != prev(igt_running()))) &&
                        never(repeated(11400, once(player_pos_xyz(0xc2520e50, 0x42a34d80, 0xc2d29cc0)) && igt_running() != prev(igt_running()))) &&
                        trigger_when(changed_global_cp_to(0xc107fd60, 0xc2295e4c, 0x425f9315))
            )

achievement("10th Dimension Humilliation", "Finish Rock-Slide Rumble in less than 1m45s", 10,
            trigger =   in_gameplay() &&
                        stage_id() == stages["Rock-Slide Rumble"] &&
                        tally(1, changed_global_cp_to(0xc23cd360, 0x42b414c0, 0xc3302394), player_pos_xyz(0xc23cd360, 0x42b414c0, 0xc3302394),
                                 global_cp_is(0xc23cd360, 0x42b414c0, 0xc3302394) && in_gameplay() && prev(game_state()) < 0xc && cp_is_global()) &&
                        never(outside_gameplay() || (global_cp_is(0xc23cd360, 0x42b414c0, 0xc3302394) && cp_is_global() && player_died())) &&
                        never(repeated(6300, once(changed_global_cp_to(0xc23cd360, 0x42b414c0, 0xc3302394)) && igt_running() != prev(igt_running()))) &&
                        never(repeated(6300, once(player_pos_xyz(0xc23cd360, 0x42b414c0, 0xc3302394)) && igt_running() != prev(igt_running()))) &&
                        never(repeated(6300, once(global_cp_is(0xc23cd360, 0x42b414c0, 0xc3302394) && in_gameplay() && prev(game_state()) < 0xc && cp_is_global()) && igt_running() != prev(igt_running()))) &&
                        trigger_when(changed_local_cp_to(0x40fa4b80, 0xc2fc1c70, 0x430f3612))
            )

achievement("N. Tropy's Nemesis", "Beat the game with all crystals collected in less than 2 hours in-game time", 50,
            trigger =   in_gameplay() &&
                        game_state_modifier_off() &&
                        igt_real() <= 432000 &&
                        prev(progression_bit0()) + prev(progression_bit1()) == 1 &&
                        all_crystals() == 12 &&
                        trigger_when(game_beaten())
            )


// =========================================
//                 Deathless              
// =========================================

// Global to local
function achiev_deathless_segment_gtol(title, description, stage_name, points, start_x, start_y, start_z, end_x, end_y, end_z) {
    achievement(title, description, points,
                trigger =   in_gameplay() &&
                            stage_id_big() == stages[stage_name] &&
                            tally(1, changed_global_cp_to(start_x, start_y, start_z), player_pos_xyz(start_x, start_y, start_z),
                                     global_cp_is(start_x, start_y, start_z) && in_gameplay() && prev(game_state()) < 0xc && cp_is_global()) &&
                            never(outside_gameplay()) &&
                            never(player_died() || lives() < prev(lives())) &&
                            trigger_when(changed_local_cp_to(end_x, end_y, end_z))                
                )
}

// Global to global
function achiev_deathless_segment_gtog(title, description, stage_name, points, start_x, start_y, start_z, end_x, end_y, end_z) {
    achievement(title, description, points,
                trigger =   in_gameplay() &&
                            stage_id_big() == stages[stage_name] &&
                            tally(1, changed_global_cp_to(start_x, start_y, start_z), player_pos_xyz(start_x, start_y, start_z),
                                     global_cp_is(start_x, start_y, start_z) && in_gameplay() && prev(game_state()) < 0xc && cp_is_global()) &&
                            never(outside_gameplay()) &&
                            never(player_died() || lives() < prev(lives())) &&
                            trigger_when(changed_global_cp_to(end_x, end_y, end_z))                
                )
}

// Local to local
function achiev_deathless_segment_ltol(title, description, stage_name, points, start_x, start_y, start_z, end_x, end_y, end_z) {
    achievement(title, description, points,
                trigger =   in_gameplay() &&
                            stage_id_big() == stages[stage_name] &&
                            tally(1, changed_local_cp_to(start_x, start_y, start_z), player_pos_xyz(start_x, start_y, start_z)) &&
                            never(outside_gameplay()) &&
                            never(player_died() || lives() < prev(lives())) &&
                            trigger_when(changed_local_cp_to(end_x, end_y, end_z))                
                )
}


achievement("The Doctor in Drag", "Reach the end of Jungle Bungle without dying", 5,
                trigger =   in_gameplay() &&
                            __ornext(stage_id_big() == stages["Jungle Bungle"] || stage_id_big() == stages["Jungle Bungle (Boss Fight)"]) &&
                            tally(1, changed_global_cp_to(0xc047eb00, 0x26600000, 0xc1c09000), player_pos_xyz(0xc047eb00, 0x26600000, 0xc1c09000),
                                     global_cp_is(0xc047eb00, 0x26600000, 0xc1c09000) && in_gameplay() && prev(game_state()) < 0xc && cp_is_global()) &&
                            never(outside_gameplay()) &&
                            never(player_died() || lives() < prev(lives())) &&
                            trigger_when(changed_local_cp_to(0xc0266880, 0xc19a2d88, 0xc0553e00))                
                )

// Classroom exception

achievement("Crash's Chaos in the Class", "Finish the Crash segment from Classroom Chaos without dying", 10,
            trigger =   in_gameplay() &&
                        stage_id_big() == stages["Classroom Chaos"] &&
                        tally(1, changed_global_cp_to(0xc120d038, 0x4001cd7e, 0x40e1df00), player_pos_xyz(0xc120d038, 0x4001cd7e, 0x40e1df00),
                                 global_cp_is(0xc120d038, 0x4001cd7e, 0x40e1df00) && in_gameplay() && prev(game_state()) < 0xc && cp_is_global()) &&
                        never(outside_gameplay()) &&
                        never(player_died() || lives() < prev(lives())) &&
                        trigger_when(character_id() == char_cortex && prev(character_id()) == char_crash)        
            )

achievement("N. Cortex's Chaos in the Class", "Finish the N. Cortex segment from Classroom Chaos without dying", 10,
            trigger =   in_gameplay() &&
                        __ornext(stage_id_big() == stages["Classroom Chaos"] || stage_id_big() == stages["Rooftop Rampage"]) &&
                        tally(1, changed_global_cp_to(0x422ccd00, 0xc066d1d5, 0xc226abe4), player_pos_xyz(0x422ccd00, 0xc066d1d5, 0xc226abe4),
                                 global_cp_is(0x422ccd00, 0xc066d1d5, 0xc226abe4) && in_gameplay() && prev(game_state()) < 0xc && cp_is_global()) &&
                        never(outside_gameplay()) &&
                        never(player_died() || lives() < prev(lives())) &&
                        trigger_when(character_id() == char_nina && prev(character_id()) == char_cortex)              
            )

achievement("Evil Party Big Hustle", "Reach the end of Rooftop Rampage without dying", 10,
            trigger =   in_gameplay() &&
                        stage_id_big() == stages["Rooftop Rampage"] &&
                        tally(1, changed_global_cp_to(0x4219999a, 0x41666666, 0x4319999a), player_pos_xyz(0x4219999a, 0x41666666, 0x4319999a),
                                 global_cp_is(0x4219999a, 0x41666666, 0x4319999a) && in_gameplay() && prev(game_state()) < 0xc && cp_is_global()) &&
                        never(outside_gameplay()) &&
                        never(player_died() || lives() < prev(lives())) &&
                        trigger_when(character_id() == char_cortex && prev(character_id()) == char_nina)                
            )

// Ant Agony exception

achievement("The Evil Twins' Compound", "Reach the end of Ant Agony without dying", 25,
                trigger =   in_gameplay() &&
                            stage_id_big() == stages["Ant Agony"] &&
                            tally(1, changed_global_cp_to(0xc2e02159, 0xbdd48217, 0x42e60a86), player_pos_xyz(0xc2e02159, 0xbdd48217, 0x42e60a86),
                                     changed_local_cp_to(0xc2199970, 0x00000000, 0x42901b00), player_pos_xyz(0xc2199970, 0x00000000, 0x42901b00),
                                     changed_local_cp_to(0xc2e00616, 0x00000000, 0x4359622d), player_pos_xyz(0xc2e00616, 0x00000000, 0x4359622d),
                                     global_cp_is(0xc2e02159, 0xbdd48217, 0x42e60a86) && in_gameplay() && prev(game_state()) < 0xc && cp_is_global()
                                 ) &&
                            never(outside_gameplay()) &&
                            never(player_died() || lives() < prev(lives())) &&
                            trigger_when(changed_local_cp_to(0xc1437ba0, 0x00000000, 0xc240dea0))                
            )


// achiev_deathless_segment_gtol("The Doctor in Drag", "Reach the end of Jungle Bungle without dying", "Jungle Bungle", 5, 0xc047eb00, 0x26600000, 0xc1c09000, 0xc0266880, 0xc19a2d88, 0xc0553e00)
achiev_deathless_segment_gtol("Cave Rollerbrawlling", "Reach the end of Cavern Catastrophe without dying", "Cavern Catastrophe", 10, 0x42336279, 0x42275220, 0xc2aa2bfc, 0xc15a6760, 0x41f9bee8, 0x41138540)
achiev_deathless_segment_gtol("Doc Amok", "Finish the Doc Amok segment from Totem Hokum without dying", "Totem Hokum", 5, 0x4241e438, 0xc1c92c4c, 0x428576e7, 0xc22ae090, 0xc1458bca, 0x41aedf18)
achiev_deathless_segment_gtol("River Rollerbrawl", "Finish the River Rollerbrawl segment from Totem Hokum without dying", "Totem Hokum", 5, 0xc0bf0912, 0x3f4cf733, 0xc18a9dc0, 0xc2cf2050, 0xc14c6b80, 0xc187ca58)
achiev_deathless_segment_gtol("Worm Chase", "Finish the Worm Chase segment from Totem Hokum without dying", "Totem Hokum", 5, 0x42992daf, 0x41419db2, 0xc24c0df9, 0xc2cc8982, 0xc07d8c50, 0xbf91b460)
achiev_deathless_segment_gtol("Iceberg Cave", "Reach the end of Ice Climb without dying", "Ice Climb", 10, 0x41847f68, 0xbf454be0, 0x410985ae, 0xc2ce6e7f, 0x40d7abc0, 0x4047730c)
achiev_deathless_segment_gtol("Henchmania", "Finish the Battleship segment from High Seas Hi-Jinks without dying", "High Seas Hi-Jinks", 10, 0xc107fd60, 0xc2295e4c, 0x425f9315, 0xc2cf0c0c, 0x415b15e8, 0x42169b38)
achiev_deathless_segment_ltol("The Rusty Walrus Chase", "Finish the Walrus chase corridor in High Seas Hi-Jinks without dying", "High Seas Hi-Jinks", 10, 0x41953930, 0x414b720a, 0xc3891907, 0x41d565e0, 0xc2889222, 0xc1975340)
achiev_deathless_segment_gtog("The Accursed Boiler", "Reach the end of Boiler Room Doom without dying", "Boiler Room Doom", 10, 0x41e66654, 0x3f4ccccd, 0x42800000, 0xc166bcb0, 0xc016d740, 0x404fd400)

// EXCEPTIONS
// achiev_deathless_segment_("Crash's Chaos in the Class", "Finish the Crash segment from Classroom Chaos without dying", 10, 0xc120d038, 0x4001cd7e, 0x40e1df00, 0x38800000, 0x3ecd3880, 0x41808000)
// achiev_deathless_segment_("N. Cortex's Chaos in the Class", "Finish the N. Cortex segment from Classroom Chaos without dying", 10, 0x422ccd00, 0xc066d1d5, 0xc226abe4, end_x, end_y, end_z)
// achiev_deathless_segment_("Evil Party Big Hustle", "Reach the end of Rooftop Rampage without dying", 10, 0x4219999a, 0x41666666, 0x4319999a, end_x, end_y, end_z)

achiev_deathless_segment_ltol("Twisted Doc Amok", "Reach the end of Bandicoot Pursuit without dying", "Bandicoot Pursuit", 10, 0x42969480, 0x3fcccccd, 0xc2c998f0, 0x43087d6c, 0x3fcccccd, 0x42c64fa0)

// achiev_deathless_segment_ltol("The Evil Twins' Compound", "Reach the end of Ant Agony without dying", 25, 0xc2e02159, 0xbdd48217, 0x42e60a86, 0xc1437ba0, 0x00000000, 0xc240dea0)


// =========================================
//              Damageless Boss              
// =========================================

achievement("Mechabandicoot", "Defeat Neo Cortex and Mechabandicoot without taking damage", 3,
            trigger =   in_gameplay() &&
                        never(stage_id_big() != stages["Jungle Bungle"] && stage_id_big() != stages["Jungle Bungle (Boss Fight)"]) &&
                        once(boss_life() == 0x6 && boss_life_active() == 1 && prev(boss_life()) != 0x6 && prev(boss_life_active()) == 0) &&
                        reset_took_damage() &&
                        never(lives() < prev(lives())) &&
                        trigger_when(boss_life() == 0x1 && prev(boss_life()) == 0x3)
            )

achievement("Tikimon", "Defeat Tikimon without taking damage", 3,
            trigger =   in_gameplay() &&
                        never(stage_id_big() != stages["N. Sanity Island"] && stage_id_big() != stages["N. Sanity Island (Boss Fight)"]) &&
                        once(boss_life() > 0x0 && boss_life_active() == 1 && prev(boss_life()) == 0x0 && prev(boss_life_active()) == 0) &&
                        reset_took_damage() &&
                        never(lives() < prev(lives())) &&
                        trigger_when(boss_life() == 0x0 && prev(boss_life()) == 0x2)
            )

achievement("Uka Uka", "Defeat Uka Uka without taking damage", 3,
            trigger =   in_gameplay() &&
                        never(stage_id_big() != stages["Ice Climb"] && stage_id_big() != stages["Ice Climb (Boss Fight)"] && stage_id_big() != stages["Iceberg Lab"]) &&
                        once(boss_life() > 0x0 && boss_life_active() == 1 && prev(boss_life()) == 0x0 && prev(boss_life_active()) == 0) &&
                        reset_took_damage() &&
                        never(lives() < prev(lives())) &&
                        trigger_when(boss_life() == 0x2 && boss_life_active() == 0 && prev(boss_life_active()) == 1)
            )

achievement("N. Tropy & N. Brio", "Defeat Nefarious Tropy and Nitrus Brio without taking damage", 3,
            trigger =   in_gameplay() &&
                        never(stage_id_big() != stages["Iceberg Lab"] && stage_id_big() != stages["Iceberg Lab (Boss Fight)"]) &&
                        once(boss_life_active() == 1 && prev(boss_life_active()) == 0) &&
                        reset_took_damage() &&
                        never(lives() < prev(lives())) &&
                        trigger_when(boss_life() == 0x0 && prev(boss_life()) == 0x2 && prev(boss_life_active()) == 1)
            )

achievement("Dingodile", "Defeat Dingodile without taking damage", 5,
            trigger =   in_gameplay() &&
                        never(stage_id_big() != stages["Boiler Room Doom"] && stage_id_big() != stages["Boiler Room Doom (Boss Fight)"]) &&
                        once(boss_life_active() == 1 && prev(boss_life_active()) == 0) &&
                        reset_took_damage() &&
                        never(lives() < prev(lives())) &&
                        trigger_when(boss_life() == 0x1 && prev(boss_life()) == 0x3)
            )

achievement("M. Amberley", "Defeat Madame Amberley without taking damage", 5,
            trigger =   in_gameplay() &&
                        never(stage_id_big() != stages["Academy of Evil"] && stage_id_big() != stages["Academy of Evil (Boss Fight)"]) &&
                        once(boss_life_active() == 1 && prev(boss_life_active()) == 0) &&
                        reset_took_damage() &&
                        never(lives() < prev(lives())) &&
                        trigger_when(boss_life() == 0x0 && prev(boss_life()) == 0x2)
            )

achievement("Evil Twins", "Defeat the Evil Twins without taking damage", 10,
            trigger =   in_gameplay() &&
                        never(stage_id_big() != stages["Twinsanity Island"] && stage_id_big() != stages["Twinsanity Island (Boss Fight)"]) &&
                        once(boss_life_active() == 1 && prev(boss_life_active()) == 0 && character_id() == char_nina) &&
                        reset_took_damage() &&
                        never(lives() < prev(lives())) &&
                        trigger_when(boss_life() == 0x1 && prev(boss_life()) == 0x3 && character_id() == char_mecha)
            )



// =========================================
//                Leaderboard              
// =========================================

leaderboard("Whac-A-Worm - Best Time", "Best time record in the Whac-A-Mole mini-game",
           start = in_gameplay_strict() && stage_id() == stages["N. Sanity Island"] && player_collabing() == 1 && whac_a_worm_time() == 0x3933 && prev(whac_a_worm_time()) != 0x3933,
           cancel = outside_gameplay() || player_collabing() == 0,
           submit = game_state() == gs_cutscene && prev(game_state()) == gs_gameplay && game_state_modifier_off(),
           value = low4(whac_a_worm_time_ptr() + 0x02) * 600 + low4(whac_a_worm_time_ptr() + 0x03) * 60,
           format = "FRAMES", lower_is_better=false
           )

leaderboard("Slip Slide Icecapades - Best Time", "Best time record in Slip Slide Icecapades",
           start = stage_id() == stages["Slip Slide Icecapades"] && (changed_local_cp_to(0xc2520e50, 0x42a34d80, 0xc2d29cc0) || player_pos_xyz(0xc2520e50, 0x42a34d80, 0xc2d29cc0)),
           cancel = outside_gameplay() || (local_cp_is(0xc2520e50, 0x42a34d80, 0xc2d29cc0) && cp_is_local() && player_died()),
           submit = changed_global_cp_to(0xc107fd60, 0xc2295e4c, 0x425f9315),
           value = igt_running() != prev(igt_running()),
           format = "FRAMES", lower_is_better=true
           )


leaderboard("Rock-Slide Rumble - Best Time", "Best time record in Rock-Slide Rumble",
           start = stage_id() == stages["Rock-Slide Rumble"] && (changed_global_cp_to(0xc23cd360, 0x42b414c0, 0xc3302394) ||
                                                                 player_pos_xyz(0xc23cd360, 0x42b414c0, 0xc3302394) || 
                                                                 global_cp_is(0xc23cd360, 0x42b414c0, 0xc3302394) && in_gameplay() && prev(game_state()) < 0xc && cp_is_global()),
           cancel = outside_gameplay() || (global_cp_is(0xc23cd360, 0x42b414c0, 0xc3302394) && cp_is_global() && player_died()),
           submit = changed_local_cp_to(0x40fa4b80, 0xc2fc1c70, 0x430f3612),
           value = igt_running() != prev(igt_running()),
           format = "FRAMES", lower_is_better=true
           )