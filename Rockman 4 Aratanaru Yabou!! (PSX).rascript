// Rockman 4: Aratanaru Yabou!!
// #ID = 6807


function mode_indicator() => byte(0x057580)
function game_difficulty() => byte(0x0588F4)
function music_id() => tbyte(0x0578B4)

function current_stage() => byte(0x11327A)
function current_stage_main() => byte(0x20025A)
function screen_stage() => byte(0x05758E)
function robot_masters_defeated() => byte(0x2002E1)

function unlockables_of_the_menu() => byte(0x0588FE)
function unlockables_of_the_menu_sound_test() => bit3(0x0588FE)
function mission_mode_mission_unlocked() => byte(0x058902)

function game_time_minutes() => byte(0x057718)
function game_time_seconds() => byte(0x05771E)
function game_time_milisseconds() => byte(0x057738)
function game_time_frames() => (game_time_minutes() * 3600) + (game_time_seconds() * 60) + game_time_milisseconds()

function time_to_end_the_completed_stage_fanfare() => byte(0x05A8E0)

function megaman_invincibility_frames() => byte(0x200274)
function megaman_x_position() => byte(0x05AAC8)
function megaman_y_position() => byte(0x05AB10)
function megaman_status() => byte(0x05ACF0)
function problaby_the_helmetless_megaman() => byte(0x06BC25)

function weapon_selected() => byte(0x05A8C9)

function time_to_the_fade_out_of_the_current_screen() => byte(0x05A8CB)
function time_to_the_fade_out_of_the_current_screen() => word(0x05A8CB)

function boss_hp_secondary() => byte(0x05ABFF)
function hp_bar() => byte(0x11569A)




// achievement(
//     title = "Jump!, Jump!", points = 2,
//     description = "Unlock the Hyper Jump Extra Part [One Session]",
//     id = 217058, badge = "240131", published = "07/05/2022 01:20:16", modified = "09/05/2022 01:10:57",
//     trigger = (dr_light_institute_unlockables_database_file_no_18() +
//               dr_light_institute_unlockables_database_file_no_32() +
//               dr_light_institute_unlockables_database_file_no_22() +
//               dr_light_institute_unlockables_database_file_no_11() +
//               dr_light_institute_unlockables_database_file_no_26() +
//               dr_light_institute_unlockables_database_file_no_17() +
//               dr_light_institute_unlockables_database_file_no_03() +
//               dr_light_institute_unlockables_database_file_no_28() +
//               dr_light_institute_unlockables_database_file_no_41() +
//               dr_light_institute_unlockables_database_file_no_43() +
//               dr_light_institute_unlockables_database_file_no_24() +
//               dr_light_institute_unlockables_database_file_no_40() +
//               dr_light_institute_unlockables_database_file_no_23() +
//               dr_light_institute_unlockables_database_file_no_07() +
//               dr_light_institute_unlockables_database_file_no_04() +
//               dr_light_institute_unlockables_database_file_no_35() +
//               dr_light_institute_unlockables_database_file_no_14() +
//               dr_light_institute_unlockables_database_file_no_13() +
//               dr_light_institute_unlockables_database_file_no_12() +
//               dr_light_institute_unlockables_database_file_no_19() +
//               dr_light_institute_unlockables_database_file_no_38() +
//               dr_light_institute_unlockables_database_file_no_05() +
//               dr_light_institute_unlockables_database_file_no_15() +
//               dr_light_institute_unlockables_database_file_no_30() +
//               dr_light_institute_unlockables_database_file_no_16() +
//               dr_light_institute_unlockables_database_file_no_42() +
//               dr_light_institute_unlockables_database_file_no_36() +
//               dr_light_institute_unlockables_database_file_no_31() +
//               dr_light_institute_unlockables_database_file_no_09() +
//               dr_light_institute_unlockables_database_file_no_20() +
//               dr_light_institute_unlockables_database_file_no_50() +
//               dr_light_institute_unlockables_database_file_no_29() +
//               dr_light_institute_unlockables_database_file_no_21() +
//               dr_light_institute_unlockables_database_file_no_44() +
//               dr_light_institute_unlockables_database_file_no_27() +
//               dr_light_institute_unlockables_database_file_no_34() +
//               dr_light_institute_unlockables_database_file_no_47() +
//               dr_light_institute_unlockables_database_file_no_45() +
//               dr_light_institute_unlockables_database_file_no_33() +
//               dr_light_institute_unlockables_database_file_no_02() +
//               dr_light_institute_unlockables_database_file_no_46() +
//               dr_light_institute_unlockables_database_file_no_37() +
//               dr_light_institute_unlockables_database_file_no_48() +
//               dr_light_institute_unlockables_database_file_no_06() +
//               dr_light_institute_unlockables_database_file_no_49() +
//               dr_light_institute_unlockables_database_file_no_25() +
//               dr_light_institute_unlockables_database_file_no_01() +
//               dr_light_institute_unlockables_database_file_no_10() +
//               dr_light_institute_unlockables_database_file_no_08() +
//               dr_light_institute_unlockables_database_file_no_51() +
//               dr_light_institute_unlockables_database_file_no_39() +
//               dr_light_institute_unlockables_database_file_no_53() +
//               dr_light_institute_unlockables_database_file_no_54() +
//               dr_light_institute_unlockables_database_file_no_55() +
//               dr_light_institute_unlockables_database_file_no_56() +
//               dr_light_institute_unlockables_database_file_no_57() +
//               dr_light_institute_unlockables_database_file_no_58() +
//               dr_light_institute_unlockables_database_file_no_59() +
//               dr_light_institute_unlockables_database_file_no_60()) >= 20 &&
//               once((prev(dr_light_institute_unlockables_database_file_no_18()) +
//                   prev(dr_light_institute_unlockables_database_file_no_32()) +
//                   prev(dr_light_institute_unlockables_database_file_no_22()) +
//                   prev(dr_light_institute_unlockables_database_file_no_11()) +
//                   prev(dr_light_institute_unlockables_database_file_no_26()) +
//                   prev(dr_light_institute_unlockables_database_file_no_17()) +
//                   prev(dr_light_institute_unlockables_database_file_no_03()) +
//                   prev(dr_light_institute_unlockables_database_file_no_28()) +
//                   prev(dr_light_institute_unlockables_database_file_no_41()) +
//                   prev(dr_light_institute_unlockables_database_file_no_43()) +
//                   prev(dr_light_institute_unlockables_database_file_no_24()) +
//                   prev(dr_light_institute_unlockables_database_file_no_40()) +
//                   prev(dr_light_institute_unlockables_database_file_no_23()) +
//                   prev(dr_light_institute_unlockables_database_file_no_07()) +
//                   prev(dr_light_institute_unlockables_database_file_no_04()) +
//                   prev(dr_light_institute_unlockables_database_file_no_35()) +
//                   prev(dr_light_institute_unlockables_database_file_no_14()) +
//                   prev(dr_light_institute_unlockables_database_file_no_13()) +
//                   prev(dr_light_institute_unlockables_database_file_no_12()) +
//                   prev(dr_light_institute_unlockables_database_file_no_19()) +
//                   prev(dr_light_institute_unlockables_database_file_no_38()) +
//                   prev(dr_light_institute_unlockables_database_file_no_05()) +
//                   prev(dr_light_institute_unlockables_database_file_no_15()) +
//                   prev(dr_light_institute_unlockables_database_file_no_30()) +
//                   prev(dr_light_institute_unlockables_database_file_no_16()) +
//                   prev(dr_light_institute_unlockables_database_file_no_42()) +
//                   prev(dr_light_institute_unlockables_database_file_no_36()) +
//                   prev(dr_light_institute_unlockables_database_file_no_31()) +
//                   prev(dr_light_institute_unlockables_database_file_no_09()) +
//                   prev(dr_light_institute_unlockables_database_file_no_20()) +
//                   prev(dr_light_institute_unlockables_database_file_no_50()) +
//                   prev(dr_light_institute_unlockables_database_file_no_29()) +
//                   prev(dr_light_institute_unlockables_database_file_no_21()) +
//                   prev(dr_light_institute_unlockables_database_file_no_44()) +
//                   prev(dr_light_institute_unlockables_database_file_no_27()) +
//                   prev(dr_light_institute_unlockables_database_file_no_34()) +
//                   prev(dr_light_institute_unlockables_database_file_no_47()) +
//                   prev(dr_light_institute_unlockables_database_file_no_45()) +
//                   prev(dr_light_institute_unlockables_database_file_no_33()) +
//                   prev(dr_light_institute_unlockables_database_file_no_02()) +
//                   prev(dr_light_institute_unlockables_database_file_no_46()) +
//                   prev(dr_light_institute_unlockables_database_file_no_37()) +
//                   prev(dr_light_institute_unlockables_database_file_no_48()) +
//                   prev(dr_light_institute_unlockables_database_file_no_06()) +
//                   prev(dr_light_institute_unlockables_database_file_no_49()) +
//                   prev(dr_light_institute_unlockables_database_file_no_25()) +
//                   prev(dr_light_institute_unlockables_database_file_no_01()) +
//                   prev(dr_light_institute_unlockables_database_file_no_10()) +
//                   prev(dr_light_institute_unlockables_database_file_no_08()) +
//                   prev(dr_light_institute_unlockables_database_file_no_51()) +
//                   prev(dr_light_institute_unlockables_database_file_no_39()) +
//                   prev(dr_light_institute_unlockables_database_file_no_53()) +
//                   prev(dr_light_institute_unlockables_database_file_no_54()) +
//                   prev(dr_light_institute_unlockables_database_file_no_55()) +
//                   prev(dr_light_institute_unlockables_database_file_no_56()) +
//                   prev(dr_light_institute_unlockables_database_file_no_57()) +
//                   prev(dr_light_institute_unlockables_database_file_no_58()) +
//                   prev(dr_light_institute_unlockables_database_file_no_59()) +
//                   prev(dr_light_institute_unlockables_database_file_no_60())) < 20
//               ) &&
//               (always_false() || (never((prev(dr_light_institute_unlockables_database_file_no_18()) +
//                     prev(dr_light_institute_unlockables_database_file_no_32()) +
//                     prev(dr_light_institute_unlockables_database_file_no_22()) +
//                     prev(dr_light_institute_unlockables_database_file_no_11()) +
//                     prev(dr_light_institute_unlockables_database_file_no_26()) +
//                     prev(dr_light_institute_unlockables_database_file_no_17()) +
//                     prev(dr_light_institute_unlockables_database_file_no_03()) +
//                     prev(dr_light_institute_unlockables_database_file_no_28()) +
//                     prev(dr_light_institute_unlockables_database_file_no_41()) +
//                     prev(dr_light_institute_unlockables_database_file_no_43()) +
//                     prev(dr_light_institute_unlockables_database_file_no_24()) +
//                     prev(dr_light_institute_unlockables_database_file_no_40()) +
//                     prev(dr_light_institute_unlockables_database_file_no_23()) +
//                     prev(dr_light_institute_unlockables_database_file_no_07()) +
//                     prev(dr_light_institute_unlockables_database_file_no_04()) +
//                     prev(dr_light_institute_unlockables_database_file_no_35()) +
//                     prev(dr_light_institute_unlockables_database_file_no_14()) +
//                     prev(dr_light_institute_unlockables_database_file_no_13()) +
//                     prev(dr_light_institute_unlockables_database_file_no_12()) +
//                     prev(dr_light_institute_unlockables_database_file_no_19()) +
//                     prev(dr_light_institute_unlockables_database_file_no_38()) +
//                     prev(dr_light_institute_unlockables_database_file_no_05()) +
//                     prev(dr_light_institute_unlockables_database_file_no_15()) +
//                     prev(dr_light_institute_unlockables_database_file_no_30()) +
//                     prev(dr_light_institute_unlockables_database_file_no_16()) +
//                     prev(dr_light_institute_unlockables_database_file_no_42()) +
//                     prev(dr_light_institute_unlockables_database_file_no_36()) +
//                     prev(dr_light_institute_unlockables_database_file_no_31()) +
//                     prev(dr_light_institute_unlockables_database_file_no_09()) +
//                     prev(dr_light_institute_unlockables_database_file_no_20()) +
//                     prev(dr_light_institute_unlockables_database_file_no_50()) +
//                     prev(dr_light_institute_unlockables_database_file_no_29()) +
//                     prev(dr_light_institute_unlockables_database_file_no_21()) +
//                     prev(dr_light_institute_unlockables_database_file_no_44()) +
//                     prev(dr_light_institute_unlockables_database_file_no_27()) +
//                     prev(dr_light_institute_unlockables_database_file_no_34()) +
//                     prev(dr_light_institute_unlockables_database_file_no_47()) +
//                     prev(dr_light_institute_unlockables_database_file_no_45()) +
//                     prev(dr_light_institute_unlockables_database_file_no_33()) +
//                     prev(dr_light_institute_unlockables_database_file_no_02()) +
//                     prev(dr_light_institute_unlockables_database_file_no_46()) +
//                     prev(dr_light_institute_unlockables_database_file_no_37()) +
//                     prev(dr_light_institute_unlockables_database_file_no_48()) +
//                     prev(dr_light_institute_unlockables_database_file_no_06()) +
//                     prev(dr_light_institute_unlockables_database_file_no_49()) +
//                     prev(dr_light_institute_unlockables_database_file_no_25()) +
//                     prev(dr_light_institute_unlockables_database_file_no_01()) +
//                     prev(dr_light_institute_unlockables_database_file_no_10()) +
//                     prev(dr_light_institute_unlockables_database_file_no_08()) +
//                     prev(dr_light_institute_unlockables_database_file_no_51()) +
//                     prev(dr_light_institute_unlockables_database_file_no_39()) +
//                     prev(dr_light_institute_unlockables_database_file_no_53()) +
//                     prev(dr_light_institute_unlockables_database_file_no_54()) +
//                     prev(dr_light_institute_unlockables_database_file_no_55()) +
//                     prev(dr_light_institute_unlockables_database_file_no_56()) +
//                     prev(dr_light_institute_unlockables_database_file_no_57()) +
//                     prev(dr_light_institute_unlockables_database_file_no_58()) +
//                     prev(dr_light_institute_unlockables_database_file_no_59()) +
//                     prev(dr_light_institute_unlockables_database_file_no_60())) == 0
//                 )))
// )

// // Ticket 55706: This triggered at the start of Toad Man stage after clearing Pharaoh Man stage.
// achievement(
//     title = "*Charging Intensifies*", points = 3,
//     description = "Unlock the Auto Charge Extra Part [One Session]",
//     id = 217059, badge = "240132", published = "07/05/2022 01:20:16", modified = "09/05/2022 01:10:57",
//     trigger = (dr_light_institute_unlockables_database_file_no_18() +
//               dr_light_institute_unlockables_database_file_no_32() +
//               dr_light_institute_unlockables_database_file_no_22() +
//               dr_light_institute_unlockables_database_file_no_11() +
//               dr_light_institute_unlockables_database_file_no_26() +
//               dr_light_institute_unlockables_database_file_no_17() +
//               dr_light_institute_unlockables_database_file_no_03() +
//               dr_light_institute_unlockables_database_file_no_28() +
//               dr_light_institute_unlockables_database_file_no_41() +
//               dr_light_institute_unlockables_database_file_no_43() +
//               dr_light_institute_unlockables_database_file_no_24() +
//               dr_light_institute_unlockables_database_file_no_40() +
//               dr_light_institute_unlockables_database_file_no_23() +
//               dr_light_institute_unlockables_database_file_no_07() +
//               dr_light_institute_unlockables_database_file_no_04() +
//               dr_light_institute_unlockables_database_file_no_35() +
//               dr_light_institute_unlockables_database_file_no_14() +
//               dr_light_institute_unlockables_database_file_no_13() +
//               dr_light_institute_unlockables_database_file_no_12() +
//               dr_light_institute_unlockables_database_file_no_19() +
//               dr_light_institute_unlockables_database_file_no_38() +
//               dr_light_institute_unlockables_database_file_no_05() +
//               dr_light_institute_unlockables_database_file_no_15() +
//               dr_light_institute_unlockables_database_file_no_30() +
//               dr_light_institute_unlockables_database_file_no_16() +
//               dr_light_institute_unlockables_database_file_no_42() +
//               dr_light_institute_unlockables_database_file_no_36() +
//               dr_light_institute_unlockables_database_file_no_31() +
//               dr_light_institute_unlockables_database_file_no_09() +
//               dr_light_institute_unlockables_database_file_no_20() +
//               dr_light_institute_unlockables_database_file_no_50() +
//               dr_light_institute_unlockables_database_file_no_29() +
//               dr_light_institute_unlockables_database_file_no_21() +
//               dr_light_institute_unlockables_database_file_no_44() +
//               dr_light_institute_unlockables_database_file_no_27() +
//               dr_light_institute_unlockables_database_file_no_34() +
//               dr_light_institute_unlockables_database_file_no_47() +
//               dr_light_institute_unlockables_database_file_no_45() +
//               dr_light_institute_unlockables_database_file_no_33() +
//               dr_light_institute_unlockables_database_file_no_02() +
//               dr_light_institute_unlockables_database_file_no_46() +
//               dr_light_institute_unlockables_database_file_no_37() +
//               dr_light_institute_unlockables_database_file_no_48() +
//               dr_light_institute_unlockables_database_file_no_06() +
//               dr_light_institute_unlockables_database_file_no_49() +
//               dr_light_institute_unlockables_database_file_no_25() +
//               dr_light_institute_unlockables_database_file_no_01() +
//               dr_light_institute_unlockables_database_file_no_10() +
//               dr_light_institute_unlockables_database_file_no_08() +
//               dr_light_institute_unlockables_database_file_no_51() +
//               dr_light_institute_unlockables_database_file_no_39() +
//               dr_light_institute_unlockables_database_file_no_53() +
//               dr_light_institute_unlockables_database_file_no_54() +
//               dr_light_institute_unlockables_database_file_no_55() +
//               dr_light_institute_unlockables_database_file_no_56() +
//               dr_light_institute_unlockables_database_file_no_57() +
//               dr_light_institute_unlockables_database_file_no_58() +
//               dr_light_institute_unlockables_database_file_no_59() +
//               dr_light_institute_unlockables_database_file_no_60()) >= 40 &&
//               once((prev(dr_light_institute_unlockables_database_file_no_18()) +
//                   prev(dr_light_institute_unlockables_database_file_no_32()) +
//                   prev(dr_light_institute_unlockables_database_file_no_22()) +
//                   prev(dr_light_institute_unlockables_database_file_no_11()) +
//                   prev(dr_light_institute_unlockables_database_file_no_26()) +
//                   prev(dr_light_institute_unlockables_database_file_no_17()) +
//                   prev(dr_light_institute_unlockables_database_file_no_03()) +
//                   prev(dr_light_institute_unlockables_database_file_no_28()) +
//                   prev(dr_light_institute_unlockables_database_file_no_41()) +
//                   prev(dr_light_institute_unlockables_database_file_no_43()) +
//                   prev(dr_light_institute_unlockables_database_file_no_24()) +
//                   prev(dr_light_institute_unlockables_database_file_no_40()) +
//                   prev(dr_light_institute_unlockables_database_file_no_23()) +
//                   prev(dr_light_institute_unlockables_database_file_no_07()) +
//                   prev(dr_light_institute_unlockables_database_file_no_04()) +
//                   prev(dr_light_institute_unlockables_database_file_no_35()) +
//                   prev(dr_light_institute_unlockables_database_file_no_14()) +
//                   prev(dr_light_institute_unlockables_database_file_no_13()) +
//                   prev(dr_light_institute_unlockables_database_file_no_12()) +
//                   prev(dr_light_institute_unlockables_database_file_no_19()) +
//                   prev(dr_light_institute_unlockables_database_file_no_38()) +
//                   prev(dr_light_institute_unlockables_database_file_no_05()) +
//                   prev(dr_light_institute_unlockables_database_file_no_15()) +
//                   prev(dr_light_institute_unlockables_database_file_no_30()) +
//                   prev(dr_light_institute_unlockables_database_file_no_16()) +
//                   prev(dr_light_institute_unlockables_database_file_no_42()) +
//                   prev(dr_light_institute_unlockables_database_file_no_36()) +
//                   prev(dr_light_institute_unlockables_database_file_no_31()) +
//                   prev(dr_light_institute_unlockables_database_file_no_09()) +
//                   prev(dr_light_institute_unlockables_database_file_no_20()) +
//                   prev(dr_light_institute_unlockables_database_file_no_50()) +
//                   prev(dr_light_institute_unlockables_database_file_no_29()) +
//                   prev(dr_light_institute_unlockables_database_file_no_21()) +
//                   prev(dr_light_institute_unlockables_database_file_no_44()) +
//                   prev(dr_light_institute_unlockables_database_file_no_27()) +
//                   prev(dr_light_institute_unlockables_database_file_no_34()) +
//                   prev(dr_light_institute_unlockables_database_file_no_47()) +
//                   prev(dr_light_institute_unlockables_database_file_no_45()) +
//                   prev(dr_light_institute_unlockables_database_file_no_33()) +
//                   prev(dr_light_institute_unlockables_database_file_no_02()) +
//                   prev(dr_light_institute_unlockables_database_file_no_46()) +
//                   prev(dr_light_institute_unlockables_database_file_no_37()) +
//                   prev(dr_light_institute_unlockables_database_file_no_48()) +
//                   prev(dr_light_institute_unlockables_database_file_no_06()) +
//                   prev(dr_light_institute_unlockables_database_file_no_49()) +
//                   prev(dr_light_institute_unlockables_database_file_no_25()) +
//                   prev(dr_light_institute_unlockables_database_file_no_01()) +
//                   prev(dr_light_institute_unlockables_database_file_no_10()) +
//                   prev(dr_light_institute_unlockables_database_file_no_08()) +
//                   prev(dr_light_institute_unlockables_database_file_no_51()) +
//                   prev(dr_light_institute_unlockables_database_file_no_39()) +
//                   prev(dr_light_institute_unlockables_database_file_no_53()) +
//                   prev(dr_light_institute_unlockables_database_file_no_54()) +
//                   prev(dr_light_institute_unlockables_database_file_no_55()) +
//                   prev(dr_light_institute_unlockables_database_file_no_56()) +
//                   prev(dr_light_institute_unlockables_database_file_no_57()) +
//                   prev(dr_light_institute_unlockables_database_file_no_58()) +
//                   prev(dr_light_institute_unlockables_database_file_no_59()) +
//                   prev(dr_light_institute_unlockables_database_file_no_60())) < 40
//               ) &&
//               (always_false() || (never((prev(dr_light_institute_unlockables_database_file_no_18()) +
//                     prev(dr_light_institute_unlockables_database_file_no_32()) +
//                     prev(dr_light_institute_unlockables_database_file_no_22()) +
//                     prev(dr_light_institute_unlockables_database_file_no_11()) +
//                     prev(dr_light_institute_unlockables_database_file_no_26()) +
//                     prev(dr_light_institute_unlockables_database_file_no_17()) +
//                     prev(dr_light_institute_unlockables_database_file_no_03()) +
//                     prev(dr_light_institute_unlockables_database_file_no_28()) +
//                     prev(dr_light_institute_unlockables_database_file_no_41()) +
//                     prev(dr_light_institute_unlockables_database_file_no_43()) +
//                     prev(dr_light_institute_unlockables_database_file_no_24()) +
//                     prev(dr_light_institute_unlockables_database_file_no_40()) +
//                     prev(dr_light_institute_unlockables_database_file_no_23()) +
//                     prev(dr_light_institute_unlockables_database_file_no_07()) +
//                     prev(dr_light_institute_unlockables_database_file_no_04()) +
//                     prev(dr_light_institute_unlockables_database_file_no_35()) +
//                     prev(dr_light_institute_unlockables_database_file_no_14()) +
//                     prev(dr_light_institute_unlockables_database_file_no_13()) +
//                     prev(dr_light_institute_unlockables_database_file_no_12()) +
//                     prev(dr_light_institute_unlockables_database_file_no_19()) +
//                     prev(dr_light_institute_unlockables_database_file_no_38()) +
//                     prev(dr_light_institute_unlockables_database_file_no_05()) +
//                     prev(dr_light_institute_unlockables_database_file_no_15()) +
//                     prev(dr_light_institute_unlockables_database_file_no_30()) +
//                     prev(dr_light_institute_unlockables_database_file_no_16()) +
//                     prev(dr_light_institute_unlockables_database_file_no_42()) +
//                     prev(dr_light_institute_unlockables_database_file_no_36()) +
//                     prev(dr_light_institute_unlockables_database_file_no_31()) +
//                     prev(dr_light_institute_unlockables_database_file_no_09()) +
//                     prev(dr_light_institute_unlockables_database_file_no_20()) +
//                     prev(dr_light_institute_unlockables_database_file_no_50()) +
//                     prev(dr_light_institute_unlockables_database_file_no_29()) +
//                     prev(dr_light_institute_unlockables_database_file_no_21()) +
//                     prev(dr_light_institute_unlockables_database_file_no_44()) +
//                     prev(dr_light_institute_unlockables_database_file_no_27()) +
//                     prev(dr_light_institute_unlockables_database_file_no_34()) +
//                     prev(dr_light_institute_unlockables_database_file_no_47()) +
//                     prev(dr_light_institute_unlockables_database_file_no_45()) +
//                     prev(dr_light_institute_unlockables_database_file_no_33()) +
//                     prev(dr_light_institute_unlockables_database_file_no_02()) +
//                     prev(dr_light_institute_unlockables_database_file_no_46()) +
//                     prev(dr_light_institute_unlockables_database_file_no_37()) +
//                     prev(dr_light_institute_unlockables_database_file_no_48()) +
//                     prev(dr_light_institute_unlockables_database_file_no_06()) +
//                     prev(dr_light_institute_unlockables_database_file_no_49()) +
//                     prev(dr_light_institute_unlockables_database_file_no_25()) +
//                     prev(dr_light_institute_unlockables_database_file_no_01()) +
//                     prev(dr_light_institute_unlockables_database_file_no_10()) +
//                     prev(dr_light_institute_unlockables_database_file_no_08()) +
//                     prev(dr_light_institute_unlockables_database_file_no_51()) +
//                     prev(dr_light_institute_unlockables_database_file_no_39()) +
//                     prev(dr_light_institute_unlockables_database_file_no_53()) +
//                     prev(dr_light_institute_unlockables_database_file_no_54()) +
//                     prev(dr_light_institute_unlockables_database_file_no_55()) +
//                     prev(dr_light_institute_unlockables_database_file_no_56()) +
//                     prev(dr_light_institute_unlockables_database_file_no_57()) +
//                     prev(dr_light_institute_unlockables_database_file_no_58()) +
//                     prev(dr_light_institute_unlockables_database_file_no_59()) +
//                     prev(dr_light_institute_unlockables_database_file_no_60())) == 0
//                 )))
// )

// achievement(
//     title = "Economy is Everything", points = 4,
//     description = "Unlock the Energy Saver Extra Part [One Session]",
//     id = 217060, badge = "240133", published = "07/05/2022 01:20:17", modified = "09/05/2022 01:10:57",
//     trigger = (dr_light_institute_unlockables_database_file_no_18() +
//               dr_light_institute_unlockables_database_file_no_32() +
//               dr_light_institute_unlockables_database_file_no_22() +
//               dr_light_institute_unlockables_database_file_no_11() +
//               dr_light_institute_unlockables_database_file_no_26() +
//               dr_light_institute_unlockables_database_file_no_17() +
//               dr_light_institute_unlockables_database_file_no_03() +
//               dr_light_institute_unlockables_database_file_no_28() +
//               dr_light_institute_unlockables_database_file_no_41() +
//               dr_light_institute_unlockables_database_file_no_43() +
//               dr_light_institute_unlockables_database_file_no_24() +
//               dr_light_institute_unlockables_database_file_no_40() +
//               dr_light_institute_unlockables_database_file_no_23() +
//               dr_light_institute_unlockables_database_file_no_07() +
//               dr_light_institute_unlockables_database_file_no_04() +
//               dr_light_institute_unlockables_database_file_no_35() +
//               dr_light_institute_unlockables_database_file_no_14() +
//               dr_light_institute_unlockables_database_file_no_13() +
//               dr_light_institute_unlockables_database_file_no_12() +
//               dr_light_institute_unlockables_database_file_no_19() +
//               dr_light_institute_unlockables_database_file_no_38() +
//               dr_light_institute_unlockables_database_file_no_05() +
//               dr_light_institute_unlockables_database_file_no_15() +
//               dr_light_institute_unlockables_database_file_no_30() +
//               dr_light_institute_unlockables_database_file_no_16() +
//               dr_light_institute_unlockables_database_file_no_42() +
//               dr_light_institute_unlockables_database_file_no_36() +
//               dr_light_institute_unlockables_database_file_no_31() +
//               dr_light_institute_unlockables_database_file_no_09() +
//               dr_light_institute_unlockables_database_file_no_20() +
//               dr_light_institute_unlockables_database_file_no_50() +
//               dr_light_institute_unlockables_database_file_no_29() +
//               dr_light_institute_unlockables_database_file_no_21() +
//               dr_light_institute_unlockables_database_file_no_44() +
//               dr_light_institute_unlockables_database_file_no_27() +
//               dr_light_institute_unlockables_database_file_no_34() +
//               dr_light_institute_unlockables_database_file_no_47() +
//               dr_light_institute_unlockables_database_file_no_45() +
//               dr_light_institute_unlockables_database_file_no_33() +
//               dr_light_institute_unlockables_database_file_no_02() +
//               dr_light_institute_unlockables_database_file_no_46() +
//               dr_light_institute_unlockables_database_file_no_37() +
//               dr_light_institute_unlockables_database_file_no_48() +
//               dr_light_institute_unlockables_database_file_no_06() +
//               dr_light_institute_unlockables_database_file_no_49() +
//               dr_light_institute_unlockables_database_file_no_25() +
//               dr_light_institute_unlockables_database_file_no_01() +
//               dr_light_institute_unlockables_database_file_no_10() +
//               dr_light_institute_unlockables_database_file_no_08() +
//               dr_light_institute_unlockables_database_file_no_51() +
//               dr_light_institute_unlockables_database_file_no_39() +
//               dr_light_institute_unlockables_database_file_no_53() +
//               dr_light_institute_unlockables_database_file_no_54() +
//               dr_light_institute_unlockables_database_file_no_55() +
//               dr_light_institute_unlockables_database_file_no_56() +
//               dr_light_institute_unlockables_database_file_no_57() +
//               dr_light_institute_unlockables_database_file_no_58() +
//               dr_light_institute_unlockables_database_file_no_59() +
//               dr_light_institute_unlockables_database_file_no_60()) >= 80 &&
//               once((prev(dr_light_institute_unlockables_database_file_no_18()) +
//                   prev(dr_light_institute_unlockables_database_file_no_32()) +
//                   prev(dr_light_institute_unlockables_database_file_no_22()) +
//                   prev(dr_light_institute_unlockables_database_file_no_11()) +
//                   prev(dr_light_institute_unlockables_database_file_no_26()) +
//                   prev(dr_light_institute_unlockables_database_file_no_17()) +
//                   prev(dr_light_institute_unlockables_database_file_no_03()) +
//                   prev(dr_light_institute_unlockables_database_file_no_28()) +
//                   prev(dr_light_institute_unlockables_database_file_no_41()) +
//                   prev(dr_light_institute_unlockables_database_file_no_43()) +
//                   prev(dr_light_institute_unlockables_database_file_no_24()) +
//                   prev(dr_light_institute_unlockables_database_file_no_40()) +
//                   prev(dr_light_institute_unlockables_database_file_no_23()) +
//                   prev(dr_light_institute_unlockables_database_file_no_07()) +
//                   prev(dr_light_institute_unlockables_database_file_no_04()) +
//                   prev(dr_light_institute_unlockables_database_file_no_35()) +
//                   prev(dr_light_institute_unlockables_database_file_no_14()) +
//                   prev(dr_light_institute_unlockables_database_file_no_13()) +
//                   prev(dr_light_institute_unlockables_database_file_no_12()) +
//                   prev(dr_light_institute_unlockables_database_file_no_19()) +
//                   prev(dr_light_institute_unlockables_database_file_no_38()) +
//                   prev(dr_light_institute_unlockables_database_file_no_05()) +
//                   prev(dr_light_institute_unlockables_database_file_no_15()) +
//                   prev(dr_light_institute_unlockables_database_file_no_30()) +
//                   prev(dr_light_institute_unlockables_database_file_no_16()) +
//                   prev(dr_light_institute_unlockables_database_file_no_42()) +
//                   prev(dr_light_institute_unlockables_database_file_no_36()) +
//                   prev(dr_light_institute_unlockables_database_file_no_31()) +
//                   prev(dr_light_institute_unlockables_database_file_no_09()) +
//                   prev(dr_light_institute_unlockables_database_file_no_20()) +
//                   prev(dr_light_institute_unlockables_database_file_no_50()) +
//                   prev(dr_light_institute_unlockables_database_file_no_29()) +
//                   prev(dr_light_institute_unlockables_database_file_no_21()) +
//                   prev(dr_light_institute_unlockables_database_file_no_44()) +
//                   prev(dr_light_institute_unlockables_database_file_no_27()) +
//                   prev(dr_light_institute_unlockables_database_file_no_34()) +
//                   prev(dr_light_institute_unlockables_database_file_no_47()) +
//                   prev(dr_light_institute_unlockables_database_file_no_45()) +
//                   prev(dr_light_institute_unlockables_database_file_no_33()) +
//                   prev(dr_light_institute_unlockables_database_file_no_02()) +
//                   prev(dr_light_institute_unlockables_database_file_no_46()) +
//                   prev(dr_light_institute_unlockables_database_file_no_37()) +
//                   prev(dr_light_institute_unlockables_database_file_no_48()) +
//                   prev(dr_light_institute_unlockables_database_file_no_06()) +
//                   prev(dr_light_institute_unlockables_database_file_no_49()) +
//                   prev(dr_light_institute_unlockables_database_file_no_25()) +
//                   prev(dr_light_institute_unlockables_database_file_no_01()) +
//                   prev(dr_light_institute_unlockables_database_file_no_10()) +
//                   prev(dr_light_institute_unlockables_database_file_no_08()) +
//                   prev(dr_light_institute_unlockables_database_file_no_51()) +
//                   prev(dr_light_institute_unlockables_database_file_no_39()) +
//                   prev(dr_light_institute_unlockables_database_file_no_53()) +
//                   prev(dr_light_institute_unlockables_database_file_no_54()) +
//                   prev(dr_light_institute_unlockables_database_file_no_55()) +
//                   prev(dr_light_institute_unlockables_database_file_no_56()) +
//                   prev(dr_light_institute_unlockables_database_file_no_57()) +
//                   prev(dr_light_institute_unlockables_database_file_no_58()) +
//                   prev(dr_light_institute_unlockables_database_file_no_59()) +
//                   prev(dr_light_institute_unlockables_database_file_no_60())) < 80
//               ) &&
//               (always_false() || (never((prev(dr_light_institute_unlockables_database_file_no_18()) +
//                     prev(dr_light_institute_unlockables_database_file_no_32()) +
//                     prev(dr_light_institute_unlockables_database_file_no_22()) +
//                     prev(dr_light_institute_unlockables_database_file_no_11()) +
//                     prev(dr_light_institute_unlockables_database_file_no_26()) +
//                     prev(dr_light_institute_unlockables_database_file_no_17()) +
//                     prev(dr_light_institute_unlockables_database_file_no_03()) +
//                     prev(dr_light_institute_unlockables_database_file_no_28()) +
//                     prev(dr_light_institute_unlockables_database_file_no_41()) +
//                     prev(dr_light_institute_unlockables_database_file_no_43()) +
//                     prev(dr_light_institute_unlockables_database_file_no_24()) +
//                     prev(dr_light_institute_unlockables_database_file_no_40()) +
//                     prev(dr_light_institute_unlockables_database_file_no_23()) +
//                     prev(dr_light_institute_unlockables_database_file_no_07()) +
//                     prev(dr_light_institute_unlockables_database_file_no_04()) +
//                     prev(dr_light_institute_unlockables_database_file_no_35()) +
//                     prev(dr_light_institute_unlockables_database_file_no_14()) +
//                     prev(dr_light_institute_unlockables_database_file_no_13()) +
//                     prev(dr_light_institute_unlockables_database_file_no_12()) +
//                     prev(dr_light_institute_unlockables_database_file_no_19()) +
//                     prev(dr_light_institute_unlockables_database_file_no_38()) +
//                     prev(dr_light_institute_unlockables_database_file_no_05()) +
//                     prev(dr_light_institute_unlockables_database_file_no_15()) +
//                     prev(dr_light_institute_unlockables_database_file_no_30()) +
//                     prev(dr_light_institute_unlockables_database_file_no_16()) +
//                     prev(dr_light_institute_unlockables_database_file_no_42()) +
//                     prev(dr_light_institute_unlockables_database_file_no_36()) +
//                     prev(dr_light_institute_unlockables_database_file_no_31()) +
//                     prev(dr_light_institute_unlockables_database_file_no_09()) +
//                     prev(dr_light_institute_unlockables_database_file_no_20()) +
//                     prev(dr_light_institute_unlockables_database_file_no_50()) +
//                     prev(dr_light_institute_unlockables_database_file_no_29()) +
//                     prev(dr_light_institute_unlockables_database_file_no_21()) +
//                     prev(dr_light_institute_unlockables_database_file_no_44()) +
//                     prev(dr_light_institute_unlockables_database_file_no_27()) +
//                     prev(dr_light_institute_unlockables_database_file_no_34()) +
//                     prev(dr_light_institute_unlockables_database_file_no_47()) +
//                     prev(dr_light_institute_unlockables_database_file_no_45()) +
//                     prev(dr_light_institute_unlockables_database_file_no_33()) +
//                     prev(dr_light_institute_unlockables_database_file_no_02()) +
//                     prev(dr_light_institute_unlockables_database_file_no_46()) +
//                     prev(dr_light_institute_unlockables_database_file_no_37()) +
//                     prev(dr_light_institute_unlockables_database_file_no_48()) +
//                     prev(dr_light_institute_unlockables_database_file_no_06()) +
//                     prev(dr_light_institute_unlockables_database_file_no_49()) +
//                     prev(dr_light_institute_unlockables_database_file_no_25()) +
//                     prev(dr_light_institute_unlockables_database_file_no_01()) +
//                     prev(dr_light_institute_unlockables_database_file_no_10()) +
//                     prev(dr_light_institute_unlockables_database_file_no_08()) +
//                     prev(dr_light_institute_unlockables_database_file_no_51()) +
//                     prev(dr_light_institute_unlockables_database_file_no_39()) +
//                     prev(dr_light_institute_unlockables_database_file_no_53()) +
//                     prev(dr_light_institute_unlockables_database_file_no_54()) +
//                     prev(dr_light_institute_unlockables_database_file_no_55()) +
//                     prev(dr_light_institute_unlockables_database_file_no_56()) +
//                     prev(dr_light_institute_unlockables_database_file_no_57()) +
//                     prev(dr_light_institute_unlockables_database_file_no_58()) +
//                     prev(dr_light_institute_unlockables_database_file_no_59()) +
//                     prev(dr_light_institute_unlockables_database_file_no_60())) == 0
//                 )))
// )

// achievement(
//     title = "Super Duper Buster", points = 5,
//     description = "Unlock the Hyper Shot Extra Part [One Session]",
//     id = 217061, badge = "240134", published = "07/05/2022 01:20:17", modified = "09/05/2022 01:10:59",
//     trigger = (dr_light_institute_unlockables_database_file_no_18() +
//               dr_light_institute_unlockables_database_file_no_32() +
//               dr_light_institute_unlockables_database_file_no_22() +
//               dr_light_institute_unlockables_database_file_no_11() +
//               dr_light_institute_unlockables_database_file_no_26() +
//               dr_light_institute_unlockables_database_file_no_17() +
//               dr_light_institute_unlockables_database_file_no_03() +
//               dr_light_institute_unlockables_database_file_no_28() +
//               dr_light_institute_unlockables_database_file_no_41() +
//               dr_light_institute_unlockables_database_file_no_43() +
//               dr_light_institute_unlockables_database_file_no_24() +
//               dr_light_institute_unlockables_database_file_no_40() +
//               dr_light_institute_unlockables_database_file_no_23() +
//               dr_light_institute_unlockables_database_file_no_07() +
//               dr_light_institute_unlockables_database_file_no_04() +
//               dr_light_institute_unlockables_database_file_no_35() +
//               dr_light_institute_unlockables_database_file_no_14() +
//               dr_light_institute_unlockables_database_file_no_13() +
//               dr_light_institute_unlockables_database_file_no_12() +
//               dr_light_institute_unlockables_database_file_no_19() +
//               dr_light_institute_unlockables_database_file_no_38() +
//               dr_light_institute_unlockables_database_file_no_05() +
//               dr_light_institute_unlockables_database_file_no_15() +
//               dr_light_institute_unlockables_database_file_no_30() +
//               dr_light_institute_unlockables_database_file_no_16() +
//               dr_light_institute_unlockables_database_file_no_42() +
//               dr_light_institute_unlockables_database_file_no_36() +
//               dr_light_institute_unlockables_database_file_no_31() +
//               dr_light_institute_unlockables_database_file_no_09() +
//               dr_light_institute_unlockables_database_file_no_20() +
//               dr_light_institute_unlockables_database_file_no_50() +
//               dr_light_institute_unlockables_database_file_no_29() +
//               dr_light_institute_unlockables_database_file_no_21() +
//               dr_light_institute_unlockables_database_file_no_44() +
//               dr_light_institute_unlockables_database_file_no_27() +
//               dr_light_institute_unlockables_database_file_no_34() +
//               dr_light_institute_unlockables_database_file_no_47() +
//               dr_light_institute_unlockables_database_file_no_45() +
//               dr_light_institute_unlockables_database_file_no_33() +
//               dr_light_institute_unlockables_database_file_no_02() +
//               dr_light_institute_unlockables_database_file_no_46() +
//               dr_light_institute_unlockables_database_file_no_37() +
//               dr_light_institute_unlockables_database_file_no_48() +
//               dr_light_institute_unlockables_database_file_no_06() +
//               dr_light_institute_unlockables_database_file_no_49() +
//               dr_light_institute_unlockables_database_file_no_25() +
//               dr_light_institute_unlockables_database_file_no_01() +
//               dr_light_institute_unlockables_database_file_no_10() +
//               dr_light_institute_unlockables_database_file_no_08() +
//               dr_light_institute_unlockables_database_file_no_51() +
//               dr_light_institute_unlockables_database_file_no_39() +
//               dr_light_institute_unlockables_database_file_no_53() +
//               dr_light_institute_unlockables_database_file_no_54() +
//               dr_light_institute_unlockables_database_file_no_55() +
//               dr_light_institute_unlockables_database_file_no_56() +
//               dr_light_institute_unlockables_database_file_no_57() +
//               dr_light_institute_unlockables_database_file_no_58() +
//               dr_light_institute_unlockables_database_file_no_59() +
//               dr_light_institute_unlockables_database_file_no_60()) >= 160 &&
//               once((prev(dr_light_institute_unlockables_database_file_no_18()) +
//                   prev(dr_light_institute_unlockables_database_file_no_32()) +
//                   prev(dr_light_institute_unlockables_database_file_no_22()) +
//                   prev(dr_light_institute_unlockables_database_file_no_11()) +
//                   prev(dr_light_institute_unlockables_database_file_no_26()) +
//                   prev(dr_light_institute_unlockables_database_file_no_17()) +
//                   prev(dr_light_institute_unlockables_database_file_no_03()) +
//                   prev(dr_light_institute_unlockables_database_file_no_28()) +
//                   prev(dr_light_institute_unlockables_database_file_no_41()) +
//                   prev(dr_light_institute_unlockables_database_file_no_43()) +
//                   prev(dr_light_institute_unlockables_database_file_no_24()) +
//                   prev(dr_light_institute_unlockables_database_file_no_40()) +
//                   prev(dr_light_institute_unlockables_database_file_no_23()) +
//                   prev(dr_light_institute_unlockables_database_file_no_07()) +
//                   prev(dr_light_institute_unlockables_database_file_no_04()) +
//                   prev(dr_light_institute_unlockables_database_file_no_35()) +
//                   prev(dr_light_institute_unlockables_database_file_no_14()) +
//                   prev(dr_light_institute_unlockables_database_file_no_13()) +
//                   prev(dr_light_institute_unlockables_database_file_no_12()) +
//                   prev(dr_light_institute_unlockables_database_file_no_19()) +
//                   prev(dr_light_institute_unlockables_database_file_no_38()) +
//                   prev(dr_light_institute_unlockables_database_file_no_05()) +
//                   prev(dr_light_institute_unlockables_database_file_no_15()) +
//                   prev(dr_light_institute_unlockables_database_file_no_30()) +
//                   prev(dr_light_institute_unlockables_database_file_no_16()) +
//                   prev(dr_light_institute_unlockables_database_file_no_42()) +
//                   prev(dr_light_institute_unlockables_database_file_no_36()) +
//                   prev(dr_light_institute_unlockables_database_file_no_31()) +
//                   prev(dr_light_institute_unlockables_database_file_no_09()) +
//                   prev(dr_light_institute_unlockables_database_file_no_20()) +
//                   prev(dr_light_institute_unlockables_database_file_no_50()) +
//                   prev(dr_light_institute_unlockables_database_file_no_29()) +
//                   prev(dr_light_institute_unlockables_database_file_no_21()) +
//                   prev(dr_light_institute_unlockables_database_file_no_44()) +
//                   prev(dr_light_institute_unlockables_database_file_no_27()) +
//                   prev(dr_light_institute_unlockables_database_file_no_34()) +
//                   prev(dr_light_institute_unlockables_database_file_no_47()) +
//                   prev(dr_light_institute_unlockables_database_file_no_45()) +
//                   prev(dr_light_institute_unlockables_database_file_no_33()) +
//                   prev(dr_light_institute_unlockables_database_file_no_02()) +
//                   prev(dr_light_institute_unlockables_database_file_no_46()) +
//                   prev(dr_light_institute_unlockables_database_file_no_37()) +
//                   prev(dr_light_institute_unlockables_database_file_no_48()) +
//                   prev(dr_light_institute_unlockables_database_file_no_06()) +
//                   prev(dr_light_institute_unlockables_database_file_no_49()) +
//                   prev(dr_light_institute_unlockables_database_file_no_25()) +
//                   prev(dr_light_institute_unlockables_database_file_no_01()) +
//                   prev(dr_light_institute_unlockables_database_file_no_10()) +
//                   prev(dr_light_institute_unlockables_database_file_no_08()) +
//                   prev(dr_light_institute_unlockables_database_file_no_51()) +
//                   prev(dr_light_institute_unlockables_database_file_no_39()) +
//                   prev(dr_light_institute_unlockables_database_file_no_53()) +
//                   prev(dr_light_institute_unlockables_database_file_no_54()) +
//                   prev(dr_light_institute_unlockables_database_file_no_55()) +
//                   prev(dr_light_institute_unlockables_database_file_no_56()) +
//                   prev(dr_light_institute_unlockables_database_file_no_57()) +
//                   prev(dr_light_institute_unlockables_database_file_no_58()) +
//                   prev(dr_light_institute_unlockables_database_file_no_59()) +
//                   prev(dr_light_institute_unlockables_database_file_no_60())) < 160
//               ) &&
//               (always_false() || (never((prev(dr_light_institute_unlockables_database_file_no_18()) +
//                     prev(dr_light_institute_unlockables_database_file_no_32()) +
//                     prev(dr_light_institute_unlockables_database_file_no_22()) +
//                     prev(dr_light_institute_unlockables_database_file_no_11()) +
//                     prev(dr_light_institute_unlockables_database_file_no_26()) +
//                     prev(dr_light_institute_unlockables_database_file_no_17()) +
//                     prev(dr_light_institute_unlockables_database_file_no_03()) +
//                     prev(dr_light_institute_unlockables_database_file_no_28()) +
//                     prev(dr_light_institute_unlockables_database_file_no_41()) +
//                     prev(dr_light_institute_unlockables_database_file_no_43()) +
//                     prev(dr_light_institute_unlockables_database_file_no_24()) +
//                     prev(dr_light_institute_unlockables_database_file_no_40()) +
//                     prev(dr_light_institute_unlockables_database_file_no_23()) +
//                     prev(dr_light_institute_unlockables_database_file_no_07()) +
//                     prev(dr_light_institute_unlockables_database_file_no_04()) +
//                     prev(dr_light_institute_unlockables_database_file_no_35()) +
//                     prev(dr_light_institute_unlockables_database_file_no_14()) +
//                     prev(dr_light_institute_unlockables_database_file_no_13()) +
//                     prev(dr_light_institute_unlockables_database_file_no_12()) +
//                     prev(dr_light_institute_unlockables_database_file_no_19()) +
//                     prev(dr_light_institute_unlockables_database_file_no_38()) +
//                     prev(dr_light_institute_unlockables_database_file_no_05()) +
//                     prev(dr_light_institute_unlockables_database_file_no_15()) +
//                     prev(dr_light_institute_unlockables_database_file_no_30()) +
//                     prev(dr_light_institute_unlockables_database_file_no_16()) +
//                     prev(dr_light_institute_unlockables_database_file_no_42()) +
//                     prev(dr_light_institute_unlockables_database_file_no_36()) +
//                     prev(dr_light_institute_unlockables_database_file_no_31()) +
//                     prev(dr_light_institute_unlockables_database_file_no_09()) +
//                     prev(dr_light_institute_unlockables_database_file_no_20()) +
//                     prev(dr_light_institute_unlockables_database_file_no_50()) +
//                     prev(dr_light_institute_unlockables_database_file_no_29()) +
//                     prev(dr_light_institute_unlockables_database_file_no_21()) +
//                     prev(dr_light_institute_unlockables_database_file_no_44()) +
//                     prev(dr_light_institute_unlockables_database_file_no_27()) +
//                     prev(dr_light_institute_unlockables_database_file_no_34()) +
//                     prev(dr_light_institute_unlockables_database_file_no_47()) +
//                     prev(dr_light_institute_unlockables_database_file_no_45()) +
//                     prev(dr_light_institute_unlockables_database_file_no_33()) +
//                     prev(dr_light_institute_unlockables_database_file_no_02()) +
//                     prev(dr_light_institute_unlockables_database_file_no_46()) +
//                     prev(dr_light_institute_unlockables_database_file_no_37()) +
//                     prev(dr_light_institute_unlockables_database_file_no_48()) +
//                     prev(dr_light_institute_unlockables_database_file_no_06()) +
//                     prev(dr_light_institute_unlockables_database_file_no_49()) +
//                     prev(dr_light_institute_unlockables_database_file_no_25()) +
//                     prev(dr_light_institute_unlockables_database_file_no_01()) +
//                     prev(dr_light_institute_unlockables_database_file_no_10()) +
//                     prev(dr_light_institute_unlockables_database_file_no_08()) +
//                     prev(dr_light_institute_unlockables_database_file_no_51()) +
//                     prev(dr_light_institute_unlockables_database_file_no_39()) +
//                     prev(dr_light_institute_unlockables_database_file_no_53()) +
//                     prev(dr_light_institute_unlockables_database_file_no_54()) +
//                     prev(dr_light_institute_unlockables_database_file_no_55()) +
//                     prev(dr_light_institute_unlockables_database_file_no_56()) +
//                     prev(dr_light_institute_unlockables_database_file_no_57()) +
//                     prev(dr_light_institute_unlockables_database_file_no_58()) +
//                     prev(dr_light_institute_unlockables_database_file_no_59()) +
//                     prev(dr_light_institute_unlockables_database_file_no_60())) == 0
//                 )))
// )

// achievement(
//     title = "Hyper Super Duper Mega Buster", points = 5,
//     description = "Unlock the Hyper Charge Shot Extra Part [One Session]",
//     id = 217062, badge = "240135", published = "07/05/2022 01:20:18", modified = "09/05/2022 01:10:58",
//     trigger = (dr_light_institute_unlockables_database_file_no_18() +
//               dr_light_institute_unlockables_database_file_no_32() +
//               dr_light_institute_unlockables_database_file_no_22() +
//               dr_light_institute_unlockables_database_file_no_11() +
//               dr_light_institute_unlockables_database_file_no_26() +
//               dr_light_institute_unlockables_database_file_no_17() +
//               dr_light_institute_unlockables_database_file_no_03() +
//               dr_light_institute_unlockables_database_file_no_28() +
//               dr_light_institute_unlockables_database_file_no_41() +
//               dr_light_institute_unlockables_database_file_no_43() +
//               dr_light_institute_unlockables_database_file_no_24() +
//               dr_light_institute_unlockables_database_file_no_40() +
//               dr_light_institute_unlockables_database_file_no_23() +
//               dr_light_institute_unlockables_database_file_no_07() +
//               dr_light_institute_unlockables_database_file_no_04() +
//               dr_light_institute_unlockables_database_file_no_35() +
//               dr_light_institute_unlockables_database_file_no_14() +
//               dr_light_institute_unlockables_database_file_no_13() +
//               dr_light_institute_unlockables_database_file_no_12() +
//               dr_light_institute_unlockables_database_file_no_19() +
//               dr_light_institute_unlockables_database_file_no_38() +
//               dr_light_institute_unlockables_database_file_no_05() +
//               dr_light_institute_unlockables_database_file_no_15() +
//               dr_light_institute_unlockables_database_file_no_30() +
//               dr_light_institute_unlockables_database_file_no_16() +
//               dr_light_institute_unlockables_database_file_no_42() +
//               dr_light_institute_unlockables_database_file_no_36() +
//               dr_light_institute_unlockables_database_file_no_31() +
//               dr_light_institute_unlockables_database_file_no_09() +
//               dr_light_institute_unlockables_database_file_no_20() +
//               dr_light_institute_unlockables_database_file_no_50() +
//               dr_light_institute_unlockables_database_file_no_29() +
//               dr_light_institute_unlockables_database_file_no_21() +
//               dr_light_institute_unlockables_database_file_no_44() +
//               dr_light_institute_unlockables_database_file_no_27() +
//               dr_light_institute_unlockables_database_file_no_34() +
//               dr_light_institute_unlockables_database_file_no_47() +
//               dr_light_institute_unlockables_database_file_no_45() +
//               dr_light_institute_unlockables_database_file_no_33() +
//               dr_light_institute_unlockables_database_file_no_02() +
//               dr_light_institute_unlockables_database_file_no_46() +
//               dr_light_institute_unlockables_database_file_no_37() +
//               dr_light_institute_unlockables_database_file_no_48() +
//               dr_light_institute_unlockables_database_file_no_06() +
//               dr_light_institute_unlockables_database_file_no_49() +
//               dr_light_institute_unlockables_database_file_no_25() +
//               dr_light_institute_unlockables_database_file_no_01() +
//               dr_light_institute_unlockables_database_file_no_10() +
//               dr_light_institute_unlockables_database_file_no_08() +
//               dr_light_institute_unlockables_database_file_no_51() +
//               dr_light_institute_unlockables_database_file_no_39() +
//               dr_light_institute_unlockables_database_file_no_53() +
//               dr_light_institute_unlockables_database_file_no_54() +
//               dr_light_institute_unlockables_database_file_no_55() +
//               dr_light_institute_unlockables_database_file_no_56() +
//               dr_light_institute_unlockables_database_file_no_57() +
//               dr_light_institute_unlockables_database_file_no_58() +
//               dr_light_institute_unlockables_database_file_no_59() +
//               dr_light_institute_unlockables_database_file_no_60()) >= 320 &&
//               once((prev(dr_light_institute_unlockables_database_file_no_18()) +
//                   prev(dr_light_institute_unlockables_database_file_no_32()) +
//                   prev(dr_light_institute_unlockables_database_file_no_22()) +
//                   prev(dr_light_institute_unlockables_database_file_no_11()) +
//                   prev(dr_light_institute_unlockables_database_file_no_26()) +
//                   prev(dr_light_institute_unlockables_database_file_no_17()) +
//                   prev(dr_light_institute_unlockables_database_file_no_03()) +
//                   prev(dr_light_institute_unlockables_database_file_no_28()) +
//                   prev(dr_light_institute_unlockables_database_file_no_41()) +
//                   prev(dr_light_institute_unlockables_database_file_no_43()) +
//                   prev(dr_light_institute_unlockables_database_file_no_24()) +
//                   prev(dr_light_institute_unlockables_database_file_no_40()) +
//                   prev(dr_light_institute_unlockables_database_file_no_23()) +
//                   prev(dr_light_institute_unlockables_database_file_no_07()) +
//                   prev(dr_light_institute_unlockables_database_file_no_04()) +
//                   prev(dr_light_institute_unlockables_database_file_no_35()) +
//                   prev(dr_light_institute_unlockables_database_file_no_14()) +
//                   prev(dr_light_institute_unlockables_database_file_no_13()) +
//                   prev(dr_light_institute_unlockables_database_file_no_12()) +
//                   prev(dr_light_institute_unlockables_database_file_no_19()) +
//                   prev(dr_light_institute_unlockables_database_file_no_38()) +
//                   prev(dr_light_institute_unlockables_database_file_no_05()) +
//                   prev(dr_light_institute_unlockables_database_file_no_15()) +
//                   prev(dr_light_institute_unlockables_database_file_no_30()) +
//                   prev(dr_light_institute_unlockables_database_file_no_16()) +
//                   prev(dr_light_institute_unlockables_database_file_no_42()) +
//                   prev(dr_light_institute_unlockables_database_file_no_36()) +
//                   prev(dr_light_institute_unlockables_database_file_no_31()) +
//                   prev(dr_light_institute_unlockables_database_file_no_09()) +
//                   prev(dr_light_institute_unlockables_database_file_no_20()) +
//                   prev(dr_light_institute_unlockables_database_file_no_50()) +
//                   prev(dr_light_institute_unlockables_database_file_no_29()) +
//                   prev(dr_light_institute_unlockables_database_file_no_21()) +
//                   prev(dr_light_institute_unlockables_database_file_no_44()) +
//                   prev(dr_light_institute_unlockables_database_file_no_27()) +
//                   prev(dr_light_institute_unlockables_database_file_no_34()) +
//                   prev(dr_light_institute_unlockables_database_file_no_47()) +
//                   prev(dr_light_institute_unlockables_database_file_no_45()) +
//                   prev(dr_light_institute_unlockables_database_file_no_33()) +
//                   prev(dr_light_institute_unlockables_database_file_no_02()) +
//                   prev(dr_light_institute_unlockables_database_file_no_46()) +
//                   prev(dr_light_institute_unlockables_database_file_no_37()) +
//                   prev(dr_light_institute_unlockables_database_file_no_48()) +
//                   prev(dr_light_institute_unlockables_database_file_no_06()) +
//                   prev(dr_light_institute_unlockables_database_file_no_49()) +
//                   prev(dr_light_institute_unlockables_database_file_no_25()) +
//                   prev(dr_light_institute_unlockables_database_file_no_01()) +
//                   prev(dr_light_institute_unlockables_database_file_no_10()) +
//                   prev(dr_light_institute_unlockables_database_file_no_08()) +
//                   prev(dr_light_institute_unlockables_database_file_no_51()) +
//                   prev(dr_light_institute_unlockables_database_file_no_39()) +
//                   prev(dr_light_institute_unlockables_database_file_no_53()) +
//                   prev(dr_light_institute_unlockables_database_file_no_54()) +
//                   prev(dr_light_institute_unlockables_database_file_no_55()) +
//                   prev(dr_light_institute_unlockables_database_file_no_56()) +
//                   prev(dr_light_institute_unlockables_database_file_no_57()) +
//                   prev(dr_light_institute_unlockables_database_file_no_58()) +
//                   prev(dr_light_institute_unlockables_database_file_no_59()) +
//                   prev(dr_light_institute_unlockables_database_file_no_60())) < 320
//               ) &&
//               (always_false() || (never((prev(dr_light_institute_unlockables_database_file_no_18()) +
//                     prev(dr_light_institute_unlockables_database_file_no_32()) +
//                     prev(dr_light_institute_unlockables_database_file_no_22()) +
//                     prev(dr_light_institute_unlockables_database_file_no_11()) +
//                     prev(dr_light_institute_unlockables_database_file_no_26()) +
//                     prev(dr_light_institute_unlockables_database_file_no_17()) +
//                     prev(dr_light_institute_unlockables_database_file_no_03()) +
//                     prev(dr_light_institute_unlockables_database_file_no_28()) +
//                     prev(dr_light_institute_unlockables_database_file_no_41()) +
//                     prev(dr_light_institute_unlockables_database_file_no_43()) +
//                     prev(dr_light_institute_unlockables_database_file_no_24()) +
//                     prev(dr_light_institute_unlockables_database_file_no_40()) +
//                     prev(dr_light_institute_unlockables_database_file_no_23()) +
//                     prev(dr_light_institute_unlockables_database_file_no_07()) +
//                     prev(dr_light_institute_unlockables_database_file_no_04()) +
//                     prev(dr_light_institute_unlockables_database_file_no_35()) +
//                     prev(dr_light_institute_unlockables_database_file_no_14()) +
//                     prev(dr_light_institute_unlockables_database_file_no_13()) +
//                     prev(dr_light_institute_unlockables_database_file_no_12()) +
//                     prev(dr_light_institute_unlockables_database_file_no_19()) +
//                     prev(dr_light_institute_unlockables_database_file_no_38()) +
//                     prev(dr_light_institute_unlockables_database_file_no_05()) +
//                     prev(dr_light_institute_unlockables_database_file_no_15()) +
//                     prev(dr_light_institute_unlockables_database_file_no_30()) +
//                     prev(dr_light_institute_unlockables_database_file_no_16()) +
//                     prev(dr_light_institute_unlockables_database_file_no_42()) +
//                     prev(dr_light_institute_unlockables_database_file_no_36()) +
//                     prev(dr_light_institute_unlockables_database_file_no_31()) +
//                     prev(dr_light_institute_unlockables_database_file_no_09()) +
//                     prev(dr_light_institute_unlockables_database_file_no_20()) +
//                     prev(dr_light_institute_unlockables_database_file_no_50()) +
//                     prev(dr_light_institute_unlockables_database_file_no_29()) +
//                     prev(dr_light_institute_unlockables_database_file_no_21()) +
//                     prev(dr_light_institute_unlockables_database_file_no_44()) +
//                     prev(dr_light_institute_unlockables_database_file_no_27()) +
//                     prev(dr_light_institute_unlockables_database_file_no_34()) +
//                     prev(dr_light_institute_unlockables_database_file_no_47()) +
//                     prev(dr_light_institute_unlockables_database_file_no_45()) +
//                     prev(dr_light_institute_unlockables_database_file_no_33()) +
//                     prev(dr_light_institute_unlockables_database_file_no_02()) +
//                     prev(dr_light_institute_unlockables_database_file_no_46()) +
//                     prev(dr_light_institute_unlockables_database_file_no_37()) +
//                     prev(dr_light_institute_unlockables_database_file_no_48()) +
//                     prev(dr_light_institute_unlockables_database_file_no_06()) +
//                     prev(dr_light_institute_unlockables_database_file_no_49()) +
//                     prev(dr_light_institute_unlockables_database_file_no_25()) +
//                     prev(dr_light_institute_unlockables_database_file_no_01()) +
//                     prev(dr_light_institute_unlockables_database_file_no_10()) +
//                     prev(dr_light_institute_unlockables_database_file_no_08()) +
//                     prev(dr_light_institute_unlockables_database_file_no_51()) +
//                     prev(dr_light_institute_unlockables_database_file_no_39()) +
//                     prev(dr_light_institute_unlockables_database_file_no_53()) +
//                     prev(dr_light_institute_unlockables_database_file_no_54()) +
//                     prev(dr_light_institute_unlockables_database_file_no_55()) +
//                     prev(dr_light_institute_unlockables_database_file_no_56()) +
//                     prev(dr_light_institute_unlockables_database_file_no_57()) +
//                     prev(dr_light_institute_unlockables_database_file_no_58()) +
//                     prev(dr_light_institute_unlockables_database_file_no_59()) +
//                     prev(dr_light_institute_unlockables_database_file_no_60())) == 0
//                 )))
// )

// achievement(
//     title = "More damage!? This is Absolutely Welcome", points = 5,
//     description = "Unlock the Power Shot Extra Part [One Session]",
//     id = 217063, badge = "240136", published = "07/05/2022 01:20:18", modified = "09/05/2022 01:10:58",
//     trigger = (dr_light_institute_unlockables_database_file_no_18() +
//               dr_light_institute_unlockables_database_file_no_32() +
//               dr_light_institute_unlockables_database_file_no_22() +
//               dr_light_institute_unlockables_database_file_no_11() +
//               dr_light_institute_unlockables_database_file_no_26() +
//               dr_light_institute_unlockables_database_file_no_17() +
//               dr_light_institute_unlockables_database_file_no_03() +
//               dr_light_institute_unlockables_database_file_no_28() +
//               dr_light_institute_unlockables_database_file_no_41() +
//               dr_light_institute_unlockables_database_file_no_43() +
//               dr_light_institute_unlockables_database_file_no_24() +
//               dr_light_institute_unlockables_database_file_no_40() +
//               dr_light_institute_unlockables_database_file_no_23() +
//               dr_light_institute_unlockables_database_file_no_07() +
//               dr_light_institute_unlockables_database_file_no_04() +
//               dr_light_institute_unlockables_database_file_no_35() +
//               dr_light_institute_unlockables_database_file_no_14() +
//               dr_light_institute_unlockables_database_file_no_13() +
//               dr_light_institute_unlockables_database_file_no_12() +
//               dr_light_institute_unlockables_database_file_no_19() +
//               dr_light_institute_unlockables_database_file_no_38() +
//               dr_light_institute_unlockables_database_file_no_05() +
//               dr_light_institute_unlockables_database_file_no_15() +
//               dr_light_institute_unlockables_database_file_no_30() +
//               dr_light_institute_unlockables_database_file_no_16() +
//               dr_light_institute_unlockables_database_file_no_42() +
//               dr_light_institute_unlockables_database_file_no_36() +
//               dr_light_institute_unlockables_database_file_no_31() +
//               dr_light_institute_unlockables_database_file_no_09() +
//               dr_light_institute_unlockables_database_file_no_20() +
//               dr_light_institute_unlockables_database_file_no_50() +
//               dr_light_institute_unlockables_database_file_no_29() +
//               dr_light_institute_unlockables_database_file_no_21() +
//               dr_light_institute_unlockables_database_file_no_44() +
//               dr_light_institute_unlockables_database_file_no_27() +
//               dr_light_institute_unlockables_database_file_no_34() +
//               dr_light_institute_unlockables_database_file_no_47() +
//               dr_light_institute_unlockables_database_file_no_45() +
//               dr_light_institute_unlockables_database_file_no_33() +
//               dr_light_institute_unlockables_database_file_no_02() +
//               dr_light_institute_unlockables_database_file_no_46() +
//               dr_light_institute_unlockables_database_file_no_37() +
//               dr_light_institute_unlockables_database_file_no_48() +
//               dr_light_institute_unlockables_database_file_no_06() +
//               dr_light_institute_unlockables_database_file_no_49() +
//               dr_light_institute_unlockables_database_file_no_25() +
//               dr_light_institute_unlockables_database_file_no_01() +
//               dr_light_institute_unlockables_database_file_no_10() +
//               dr_light_institute_unlockables_database_file_no_08() +
//               dr_light_institute_unlockables_database_file_no_51() +
//               dr_light_institute_unlockables_database_file_no_39() +
//               dr_light_institute_unlockables_database_file_no_53() +
//               dr_light_institute_unlockables_database_file_no_54() +
//               dr_light_institute_unlockables_database_file_no_55() +
//               dr_light_institute_unlockables_database_file_no_56() +
//               dr_light_institute_unlockables_database_file_no_57() +
//               dr_light_institute_unlockables_database_file_no_58() +
//               dr_light_institute_unlockables_database_file_no_59() +
//               dr_light_institute_unlockables_database_file_no_60()) >= 640 &&
//               once((prev(dr_light_institute_unlockables_database_file_no_18()) +
//                   prev(dr_light_institute_unlockables_database_file_no_32()) +
//                   prev(dr_light_institute_unlockables_database_file_no_22()) +
//                   prev(dr_light_institute_unlockables_database_file_no_11()) +
//                   prev(dr_light_institute_unlockables_database_file_no_26()) +
//                   prev(dr_light_institute_unlockables_database_file_no_17()) +
//                   prev(dr_light_institute_unlockables_database_file_no_03()) +
//                   prev(dr_light_institute_unlockables_database_file_no_28()) +
//                   prev(dr_light_institute_unlockables_database_file_no_41()) +
//                   prev(dr_light_institute_unlockables_database_file_no_43()) +
//                   prev(dr_light_institute_unlockables_database_file_no_24()) +
//                   prev(dr_light_institute_unlockables_database_file_no_40()) +
//                   prev(dr_light_institute_unlockables_database_file_no_23()) +
//                   prev(dr_light_institute_unlockables_database_file_no_07()) +
//                   prev(dr_light_institute_unlockables_database_file_no_04()) +
//                   prev(dr_light_institute_unlockables_database_file_no_35()) +
//                   prev(dr_light_institute_unlockables_database_file_no_14()) +
//                   prev(dr_light_institute_unlockables_database_file_no_13()) +
//                   prev(dr_light_institute_unlockables_database_file_no_12()) +
//                   prev(dr_light_institute_unlockables_database_file_no_19()) +
//                   prev(dr_light_institute_unlockables_database_file_no_38()) +
//                   prev(dr_light_institute_unlockables_database_file_no_05()) +
//                   prev(dr_light_institute_unlockables_database_file_no_15()) +
//                   prev(dr_light_institute_unlockables_database_file_no_30()) +
//                   prev(dr_light_institute_unlockables_database_file_no_16()) +
//                   prev(dr_light_institute_unlockables_database_file_no_42()) +
//                   prev(dr_light_institute_unlockables_database_file_no_36()) +
//                   prev(dr_light_institute_unlockables_database_file_no_31()) +
//                   prev(dr_light_institute_unlockables_database_file_no_09()) +
//                   prev(dr_light_institute_unlockables_database_file_no_20()) +
//                   prev(dr_light_institute_unlockables_database_file_no_50()) +
//                   prev(dr_light_institute_unlockables_database_file_no_29()) +
//                   prev(dr_light_institute_unlockables_database_file_no_21()) +
//                   prev(dr_light_institute_unlockables_database_file_no_44()) +
//                   prev(dr_light_institute_unlockables_database_file_no_27()) +
//                   prev(dr_light_institute_unlockables_database_file_no_34()) +
//                   prev(dr_light_institute_unlockables_database_file_no_47()) +
//                   prev(dr_light_institute_unlockables_database_file_no_45()) +
//                   prev(dr_light_institute_unlockables_database_file_no_33()) +
//                   prev(dr_light_institute_unlockables_database_file_no_02()) +
//                   prev(dr_light_institute_unlockables_database_file_no_46()) +
//                   prev(dr_light_institute_unlockables_database_file_no_37()) +
//                   prev(dr_light_institute_unlockables_database_file_no_48()) +
//                   prev(dr_light_institute_unlockables_database_file_no_06()) +
//                   prev(dr_light_institute_unlockables_database_file_no_49()) +
//                   prev(dr_light_institute_unlockables_database_file_no_25()) +
//                   prev(dr_light_institute_unlockables_database_file_no_01()) +
//                   prev(dr_light_institute_unlockables_database_file_no_10()) +
//                   prev(dr_light_institute_unlockables_database_file_no_08()) +
//                   prev(dr_light_institute_unlockables_database_file_no_51()) +
//                   prev(dr_light_institute_unlockables_database_file_no_39()) +
//                   prev(dr_light_institute_unlockables_database_file_no_53()) +
//                   prev(dr_light_institute_unlockables_database_file_no_54()) +
//                   prev(dr_light_institute_unlockables_database_file_no_55()) +
//                   prev(dr_light_institute_unlockables_database_file_no_56()) +
//                   prev(dr_light_institute_unlockables_database_file_no_57()) +
//                   prev(dr_light_institute_unlockables_database_file_no_58()) +
//                   prev(dr_light_institute_unlockables_database_file_no_59()) +
//                   prev(dr_light_institute_unlockables_database_file_no_60())) < 640
//               ) &&
//               (always_false() || (never((prev(dr_light_institute_unlockables_database_file_no_18()) +
//                     prev(dr_light_institute_unlockables_database_file_no_32()) +
//                     prev(dr_light_institute_unlockables_database_file_no_22()) +
//                     prev(dr_light_institute_unlockables_database_file_no_11()) +
//                     prev(dr_light_institute_unlockables_database_file_no_26()) +
//                     prev(dr_light_institute_unlockables_database_file_no_17()) +
//                     prev(dr_light_institute_unlockables_database_file_no_03()) +
//                     prev(dr_light_institute_unlockables_database_file_no_28()) +
//                     prev(dr_light_institute_unlockables_database_file_no_41()) +
//                     prev(dr_light_institute_unlockables_database_file_no_43()) +
//                     prev(dr_light_institute_unlockables_database_file_no_24()) +
//                     prev(dr_light_institute_unlockables_database_file_no_40()) +
//                     prev(dr_light_institute_unlockables_database_file_no_23()) +
//                     prev(dr_light_institute_unlockables_database_file_no_07()) +
//                     prev(dr_light_institute_unlockables_database_file_no_04()) +
//                     prev(dr_light_institute_unlockables_database_file_no_35()) +
//                     prev(dr_light_institute_unlockables_database_file_no_14()) +
//                     prev(dr_light_institute_unlockables_database_file_no_13()) +
//                     prev(dr_light_institute_unlockables_database_file_no_12()) +
//                     prev(dr_light_institute_unlockables_database_file_no_19()) +
//                     prev(dr_light_institute_unlockables_database_file_no_38()) +
//                     prev(dr_light_institute_unlockables_database_file_no_05()) +
//                     prev(dr_light_institute_unlockables_database_file_no_15()) +
//                     prev(dr_light_institute_unlockables_database_file_no_30()) +
//                     prev(dr_light_institute_unlockables_database_file_no_16()) +
//                     prev(dr_light_institute_unlockables_database_file_no_42()) +
//                     prev(dr_light_institute_unlockables_database_file_no_36()) +
//                     prev(dr_light_institute_unlockables_database_file_no_31()) +
//                     prev(dr_light_institute_unlockables_database_file_no_09()) +
//                     prev(dr_light_institute_unlockables_database_file_no_20()) +
//                     prev(dr_light_institute_unlockables_database_file_no_50()) +
//                     prev(dr_light_institute_unlockables_database_file_no_29()) +
//                     prev(dr_light_institute_unlockables_database_file_no_21()) +
//                     prev(dr_light_institute_unlockables_database_file_no_44()) +
//                     prev(dr_light_institute_unlockables_database_file_no_27()) +
//                     prev(dr_light_institute_unlockables_database_file_no_34()) +
//                     prev(dr_light_institute_unlockables_database_file_no_47()) +
//                     prev(dr_light_institute_unlockables_database_file_no_45()) +
//                     prev(dr_light_institute_unlockables_database_file_no_33()) +
//                     prev(dr_light_institute_unlockables_database_file_no_02()) +
//                     prev(dr_light_institute_unlockables_database_file_no_46()) +
//                     prev(dr_light_institute_unlockables_database_file_no_37()) +
//                     prev(dr_light_institute_unlockables_database_file_no_48()) +
//                     prev(dr_light_institute_unlockables_database_file_no_06()) +
//                     prev(dr_light_institute_unlockables_database_file_no_49()) +
//                     prev(dr_light_institute_unlockables_database_file_no_25()) +
//                     prev(dr_light_institute_unlockables_database_file_no_01()) +
//                     prev(dr_light_institute_unlockables_database_file_no_10()) +
//                     prev(dr_light_institute_unlockables_database_file_no_08()) +
//                     prev(dr_light_institute_unlockables_database_file_no_51()) +
//                     prev(dr_light_institute_unlockables_database_file_no_39()) +
//                     prev(dr_light_institute_unlockables_database_file_no_53()) +
//                     prev(dr_light_institute_unlockables_database_file_no_54()) +
//                     prev(dr_light_institute_unlockables_database_file_no_55()) +
//                     prev(dr_light_institute_unlockables_database_file_no_56()) +
//                     prev(dr_light_institute_unlockables_database_file_no_57()) +
//                     prev(dr_light_institute_unlockables_database_file_no_58()) +
//                     prev(dr_light_institute_unlockables_database_file_no_59()) +
//                     prev(dr_light_institute_unlockables_database_file_no_60())) == 0
//                 )))
// )

// // Ticket 52338: I've reached 1000 Battle Data points to unlock the Hyper Charge and the achievement doesn't work.
// //               I was playing on Navi Mode on the easy difficulty.
// achievement(
//     title = "Faster Cannon Arm", points = 10,
//     description = "Unlock the Hyper Charge Extra Part [One Session]",
//     id = 217064, badge = "240137", published = "07/05/2022 01:20:18", modified = "09/05/2022 01:10:59",
//     trigger = (dr_light_institute_unlockables_database_file_no_18() +
//               dr_light_institute_unlockables_database_file_no_32() +
//               dr_light_institute_unlockables_database_file_no_22() +
//               dr_light_institute_unlockables_database_file_no_11() +
//               dr_light_institute_unlockables_database_file_no_26() +
//               dr_light_institute_unlockables_database_file_no_17() +
//               dr_light_institute_unlockables_database_file_no_03() +
//               dr_light_institute_unlockables_database_file_no_28() +
//               dr_light_institute_unlockables_database_file_no_41() +
//               dr_light_institute_unlockables_database_file_no_43() +
//               dr_light_institute_unlockables_database_file_no_24() +
//               dr_light_institute_unlockables_database_file_no_40() +
//               dr_light_institute_unlockables_database_file_no_23() +
//               dr_light_institute_unlockables_database_file_no_07() +
//               dr_light_institute_unlockables_database_file_no_04() +
//               dr_light_institute_unlockables_database_file_no_35() +
//               dr_light_institute_unlockables_database_file_no_14() +
//               dr_light_institute_unlockables_database_file_no_13() +
//               dr_light_institute_unlockables_database_file_no_12() +
//               dr_light_institute_unlockables_database_file_no_19() +
//               dr_light_institute_unlockables_database_file_no_38() +
//               dr_light_institute_unlockables_database_file_no_05() +
//               dr_light_institute_unlockables_database_file_no_15() +
//               dr_light_institute_unlockables_database_file_no_30() +
//               dr_light_institute_unlockables_database_file_no_16() +
//               dr_light_institute_unlockables_database_file_no_42() +
//               dr_light_institute_unlockables_database_file_no_36() +
//               dr_light_institute_unlockables_database_file_no_31() +
//               dr_light_institute_unlockables_database_file_no_09() +
//               dr_light_institute_unlockables_database_file_no_20() +
//               dr_light_institute_unlockables_database_file_no_50() +
//               dr_light_institute_unlockables_database_file_no_29() +
//               dr_light_institute_unlockables_database_file_no_21() +
//               dr_light_institute_unlockables_database_file_no_44() +
//               dr_light_institute_unlockables_database_file_no_27() +
//               dr_light_institute_unlockables_database_file_no_34() +
//               dr_light_institute_unlockables_database_file_no_47() +
//               dr_light_institute_unlockables_database_file_no_45() +
//               dr_light_institute_unlockables_database_file_no_33() +
//               dr_light_institute_unlockables_database_file_no_02() +
//               dr_light_institute_unlockables_database_file_no_46() +
//               dr_light_institute_unlockables_database_file_no_37() +
//               dr_light_institute_unlockables_database_file_no_48() +
//               dr_light_institute_unlockables_database_file_no_06() +
//               dr_light_institute_unlockables_database_file_no_49() +
//               dr_light_institute_unlockables_database_file_no_25() +
//               dr_light_institute_unlockables_database_file_no_01() +
//               dr_light_institute_unlockables_database_file_no_10() +
//               dr_light_institute_unlockables_database_file_no_08() +
//               dr_light_institute_unlockables_database_file_no_51() +
//               dr_light_institute_unlockables_database_file_no_39() +
//               dr_light_institute_unlockables_database_file_no_53() +
//               dr_light_institute_unlockables_database_file_no_54() +
//               dr_light_institute_unlockables_database_file_no_55() +
//               dr_light_institute_unlockables_database_file_no_56() +
//               dr_light_institute_unlockables_database_file_no_57() +
//               dr_light_institute_unlockables_database_file_no_58() +
//               dr_light_institute_unlockables_database_file_no_59() +
//               dr_light_institute_unlockables_database_file_no_60()) >= 1000 &&
//               once((prev(dr_light_institute_unlockables_database_file_no_18()) +
//                   prev(dr_light_institute_unlockables_database_file_no_32()) +
//                   prev(dr_light_institute_unlockables_database_file_no_22()) +
//                   prev(dr_light_institute_unlockables_database_file_no_11()) +
//                   prev(dr_light_institute_unlockables_database_file_no_26()) +
//                   prev(dr_light_institute_unlockables_database_file_no_17()) +
//                   prev(dr_light_institute_unlockables_database_file_no_03()) +
//                   prev(dr_light_institute_unlockables_database_file_no_28()) +
//                   prev(dr_light_institute_unlockables_database_file_no_41()) +
//                   prev(dr_light_institute_unlockables_database_file_no_43()) +
//                   prev(dr_light_institute_unlockables_database_file_no_24()) +
//                   prev(dr_light_institute_unlockables_database_file_no_40()) +
//                   prev(dr_light_institute_unlockables_database_file_no_23()) +
//                   prev(dr_light_institute_unlockables_database_file_no_07()) +
//                   prev(dr_light_institute_unlockables_database_file_no_04()) +
//                   prev(dr_light_institute_unlockables_database_file_no_35()) +
//                   prev(dr_light_institute_unlockables_database_file_no_14()) +
//                   prev(dr_light_institute_unlockables_database_file_no_13()) +
//                   prev(dr_light_institute_unlockables_database_file_no_12()) +
//                   prev(dr_light_institute_unlockables_database_file_no_19()) +
//                   prev(dr_light_institute_unlockables_database_file_no_38()) +
//                   prev(dr_light_institute_unlockables_database_file_no_05()) +
//                   prev(dr_light_institute_unlockables_database_file_no_15()) +
//                   prev(dr_light_institute_unlockables_database_file_no_30()) +
//                   prev(dr_light_institute_unlockables_database_file_no_16()) +
//                   prev(dr_light_institute_unlockables_database_file_no_42()) +
//                   prev(dr_light_institute_unlockables_database_file_no_36()) +
//                   prev(dr_light_institute_unlockables_database_file_no_31()) +
//                   prev(dr_light_institute_unlockables_database_file_no_09()) +
//                   prev(dr_light_institute_unlockables_database_file_no_20()) +
//                   prev(dr_light_institute_unlockables_database_file_no_50()) +
//                   prev(dr_light_institute_unlockables_database_file_no_29()) +
//                   prev(dr_light_institute_unlockables_database_file_no_21()) +
//                   prev(dr_light_institute_unlockables_database_file_no_44()) +
//                   prev(dr_light_institute_unlockables_database_file_no_27()) +
//                   prev(dr_light_institute_unlockables_database_file_no_34()) +
//                   prev(dr_light_institute_unlockables_database_file_no_47()) +
//                   prev(dr_light_institute_unlockables_database_file_no_45()) +
//                   prev(dr_light_institute_unlockables_database_file_no_33()) +
//                   prev(dr_light_institute_unlockables_database_file_no_02()) +
//                   prev(dr_light_institute_unlockables_database_file_no_46()) +
//                   prev(dr_light_institute_unlockables_database_file_no_37()) +
//                   prev(dr_light_institute_unlockables_database_file_no_48()) +
//                   prev(dr_light_institute_unlockables_database_file_no_06()) +
//                   prev(dr_light_institute_unlockables_database_file_no_49()) +
//                   prev(dr_light_institute_unlockables_database_file_no_25()) +
//                   prev(dr_light_institute_unlockables_database_file_no_01()) +
//                   prev(dr_light_institute_unlockables_database_file_no_10()) +
//                   prev(dr_light_institute_unlockables_database_file_no_08()) +
//                   prev(dr_light_institute_unlockables_database_file_no_51()) +
//                   prev(dr_light_institute_unlockables_database_file_no_39()) +
//                   prev(dr_light_institute_unlockables_database_file_no_53()) +
//                   prev(dr_light_institute_unlockables_database_file_no_54()) +
//                   prev(dr_light_institute_unlockables_database_file_no_55()) +
//                   prev(dr_light_institute_unlockables_database_file_no_56()) +
//                   prev(dr_light_institute_unlockables_database_file_no_57()) +
//                   prev(dr_light_institute_unlockables_database_file_no_58()) +
//                   prev(dr_light_institute_unlockables_database_file_no_59()) +
//                   prev(dr_light_institute_unlockables_database_file_no_60())) < 1000
//               ) &&
//               (always_false() || (never((prev(dr_light_institute_unlockables_database_file_no_18()) +
//                     prev(dr_light_institute_unlockables_database_file_no_32()) +
//                     prev(dr_light_institute_unlockables_database_file_no_22()) +
//                     prev(dr_light_institute_unlockables_database_file_no_11()) +
//                     prev(dr_light_institute_unlockables_database_file_no_26()) +
//                     prev(dr_light_institute_unlockables_database_file_no_17()) +
//                     prev(dr_light_institute_unlockables_database_file_no_03()) +
//                     prev(dr_light_institute_unlockables_database_file_no_28()) +
//                     prev(dr_light_institute_unlockables_database_file_no_41()) +
//                     prev(dr_light_institute_unlockables_database_file_no_43()) +
//                     prev(dr_light_institute_unlockables_database_file_no_24()) +
//                     prev(dr_light_institute_unlockables_database_file_no_40()) +
//                     prev(dr_light_institute_unlockables_database_file_no_23()) +
//                     prev(dr_light_institute_unlockables_database_file_no_07()) +
//                     prev(dr_light_institute_unlockables_database_file_no_04()) +
//                     prev(dr_light_institute_unlockables_database_file_no_35()) +
//                     prev(dr_light_institute_unlockables_database_file_no_14()) +
//                     prev(dr_light_institute_unlockables_database_file_no_13()) +
//                     prev(dr_light_institute_unlockables_database_file_no_12()) +
//                     prev(dr_light_institute_unlockables_database_file_no_19()) +
//                     prev(dr_light_institute_unlockables_database_file_no_38()) +
//                     prev(dr_light_institute_unlockables_database_file_no_05()) +
//                     prev(dr_light_institute_unlockables_database_file_no_15()) +
//                     prev(dr_light_institute_unlockables_database_file_no_30()) +
//                     prev(dr_light_institute_unlockables_database_file_no_16()) +
//                     prev(dr_light_institute_unlockables_database_file_no_42()) +
//                     prev(dr_light_institute_unlockables_database_file_no_36()) +
//                     prev(dr_light_institute_unlockables_database_file_no_31()) +
//                     prev(dr_light_institute_unlockables_database_file_no_09()) +
//                     prev(dr_light_institute_unlockables_database_file_no_20()) +
//                     prev(dr_light_institute_unlockables_database_file_no_50()) +
//                     prev(dr_light_institute_unlockables_database_file_no_29()) +
//                     prev(dr_light_institute_unlockables_database_file_no_21()) +
//                     prev(dr_light_institute_unlockables_database_file_no_44()) +
//                     prev(dr_light_institute_unlockables_database_file_no_27()) +
//                     prev(dr_light_institute_unlockables_database_file_no_34()) +
//                     prev(dr_light_institute_unlockables_database_file_no_47()) +
//                     prev(dr_light_institute_unlockables_database_file_no_45()) +
//                     prev(dr_light_institute_unlockables_database_file_no_33()) +
//                     prev(dr_light_institute_unlockables_database_file_no_02()) +
//                     prev(dr_light_institute_unlockables_database_file_no_46()) +
//                     prev(dr_light_institute_unlockables_database_file_no_37()) +
//                     prev(dr_light_institute_unlockables_database_file_no_48()) +
//                     prev(dr_light_institute_unlockables_database_file_no_06()) +
//                     prev(dr_light_institute_unlockables_database_file_no_49()) +
//                     prev(dr_light_institute_unlockables_database_file_no_25()) +
//                     prev(dr_light_institute_unlockables_database_file_no_01()) +
//                     prev(dr_light_institute_unlockables_database_file_no_10()) +
//                     prev(dr_light_institute_unlockables_database_file_no_08()) +
//                     prev(dr_light_institute_unlockables_database_file_no_51()) +
//                     prev(dr_light_institute_unlockables_database_file_no_39()) +
//                     prev(dr_light_institute_unlockables_database_file_no_53()) +
//                     prev(dr_light_institute_unlockables_database_file_no_54()) +
//                     prev(dr_light_institute_unlockables_database_file_no_55()) +
//                     prev(dr_light_institute_unlockables_database_file_no_56()) +
//                     prev(dr_light_institute_unlockables_database_file_no_57()) +
//                     prev(dr_light_institute_unlockables_database_file_no_58()) +
//                     prev(dr_light_institute_unlockables_database_file_no_59()) +
//                     prev(dr_light_institute_unlockables_database_file_no_60())) == 0
//                 )))
// )

// achievement(
//     title = "Quick Man", points = 10,
//     description = "Unlock the Speed Up Extra Part [One Session]",
//     id = 217065, badge = "240138", published = "07/05/2022 01:20:19", modified = "09/05/2022 01:11:00",
//     trigger = (dr_light_institute_unlockables_database_file_no_18() +
//               dr_light_institute_unlockables_database_file_no_32() +
//               dr_light_institute_unlockables_database_file_no_22() +
//               dr_light_institute_unlockables_database_file_no_11() +
//               dr_light_institute_unlockables_database_file_no_26() +
//               dr_light_institute_unlockables_database_file_no_17() +
//               dr_light_institute_unlockables_database_file_no_03() +
//               dr_light_institute_unlockables_database_file_no_28() +
//               dr_light_institute_unlockables_database_file_no_41() +
//               dr_light_institute_unlockables_database_file_no_43() +
//               dr_light_institute_unlockables_database_file_no_24() +
//               dr_light_institute_unlockables_database_file_no_40() +
//               dr_light_institute_unlockables_database_file_no_23() +
//               dr_light_institute_unlockables_database_file_no_07() +
//               dr_light_institute_unlockables_database_file_no_04() +
//               dr_light_institute_unlockables_database_file_no_35() +
//               dr_light_institute_unlockables_database_file_no_14() +
//               dr_light_institute_unlockables_database_file_no_13() +
//               dr_light_institute_unlockables_database_file_no_12() +
//               dr_light_institute_unlockables_database_file_no_19() +
//               dr_light_institute_unlockables_database_file_no_38() +
//               dr_light_institute_unlockables_database_file_no_05() +
//               dr_light_institute_unlockables_database_file_no_15() +
//               dr_light_institute_unlockables_database_file_no_30() +
//               dr_light_institute_unlockables_database_file_no_16() +
//               dr_light_institute_unlockables_database_file_no_42() +
//               dr_light_institute_unlockables_database_file_no_36() +
//               dr_light_institute_unlockables_database_file_no_31() +
//               dr_light_institute_unlockables_database_file_no_09() +
//               dr_light_institute_unlockables_database_file_no_20() +
//               dr_light_institute_unlockables_database_file_no_50() +
//               dr_light_institute_unlockables_database_file_no_29() +
//               dr_light_institute_unlockables_database_file_no_21() +
//               dr_light_institute_unlockables_database_file_no_44() +
//               dr_light_institute_unlockables_database_file_no_27() +
//               dr_light_institute_unlockables_database_file_no_34() +
//               dr_light_institute_unlockables_database_file_no_47() +
//               dr_light_institute_unlockables_database_file_no_45() +
//               dr_light_institute_unlockables_database_file_no_33() +
//               dr_light_institute_unlockables_database_file_no_02() +
//               dr_light_institute_unlockables_database_file_no_46() +
//               dr_light_institute_unlockables_database_file_no_37() +
//               dr_light_institute_unlockables_database_file_no_48() +
//               dr_light_institute_unlockables_database_file_no_06() +
//               dr_light_institute_unlockables_database_file_no_49() +
//               dr_light_institute_unlockables_database_file_no_25() +
//               dr_light_institute_unlockables_database_file_no_01() +
//               dr_light_institute_unlockables_database_file_no_10() +
//               dr_light_institute_unlockables_database_file_no_08() +
//               dr_light_institute_unlockables_database_file_no_51() +
//               dr_light_institute_unlockables_database_file_no_39() +
//               dr_light_institute_unlockables_database_file_no_53() +
//               dr_light_institute_unlockables_database_file_no_54() +
//               dr_light_institute_unlockables_database_file_no_55() +
//               dr_light_institute_unlockables_database_file_no_56() +
//               dr_light_institute_unlockables_database_file_no_57() +
//               dr_light_institute_unlockables_database_file_no_58() +
//               dr_light_institute_unlockables_database_file_no_59() +
//               dr_light_institute_unlockables_database_file_no_60()) >= 2000 &&
//               once((prev(dr_light_institute_unlockables_database_file_no_18()) +
//                   prev(dr_light_institute_unlockables_database_file_no_32()) +
//                   prev(dr_light_institute_unlockables_database_file_no_22()) +
//                   prev(dr_light_institute_unlockables_database_file_no_11()) +
//                   prev(dr_light_institute_unlockables_database_file_no_26()) +
//                   prev(dr_light_institute_unlockables_database_file_no_17()) +
//                   prev(dr_light_institute_unlockables_database_file_no_03()) +
//                   prev(dr_light_institute_unlockables_database_file_no_28()) +
//                   prev(dr_light_institute_unlockables_database_file_no_41()) +
//                   prev(dr_light_institute_unlockables_database_file_no_43()) +
//                   prev(dr_light_institute_unlockables_database_file_no_24()) +
//                   prev(dr_light_institute_unlockables_database_file_no_40()) +
//                   prev(dr_light_institute_unlockables_database_file_no_23()) +
//                   prev(dr_light_institute_unlockables_database_file_no_07()) +
//                   prev(dr_light_institute_unlockables_database_file_no_04()) +
//                   prev(dr_light_institute_unlockables_database_file_no_35()) +
//                   prev(dr_light_institute_unlockables_database_file_no_14()) +
//                   prev(dr_light_institute_unlockables_database_file_no_13()) +
//                   prev(dr_light_institute_unlockables_database_file_no_12()) +
//                   prev(dr_light_institute_unlockables_database_file_no_19()) +
//                   prev(dr_light_institute_unlockables_database_file_no_38()) +
//                   prev(dr_light_institute_unlockables_database_file_no_05()) +
//                   prev(dr_light_institute_unlockables_database_file_no_15()) +
//                   prev(dr_light_institute_unlockables_database_file_no_30()) +
//                   prev(dr_light_institute_unlockables_database_file_no_16()) +
//                   prev(dr_light_institute_unlockables_database_file_no_42()) +
//                   prev(dr_light_institute_unlockables_database_file_no_36()) +
//                   prev(dr_light_institute_unlockables_database_file_no_31()) +
//                   prev(dr_light_institute_unlockables_database_file_no_09()) +
//                   prev(dr_light_institute_unlockables_database_file_no_20()) +
//                   prev(dr_light_institute_unlockables_database_file_no_50()) +
//                   prev(dr_light_institute_unlockables_database_file_no_29()) +
//                   prev(dr_light_institute_unlockables_database_file_no_21()) +
//                   prev(dr_light_institute_unlockables_database_file_no_44()) +
//                   prev(dr_light_institute_unlockables_database_file_no_27()) +
//                   prev(dr_light_institute_unlockables_database_file_no_34()) +
//                   prev(dr_light_institute_unlockables_database_file_no_47()) +
//                   prev(dr_light_institute_unlockables_database_file_no_45()) +
//                   prev(dr_light_institute_unlockables_database_file_no_33()) +
//                   prev(dr_light_institute_unlockables_database_file_no_02()) +
//                   prev(dr_light_institute_unlockables_database_file_no_46()) +
//                   prev(dr_light_institute_unlockables_database_file_no_37()) +
//                   prev(dr_light_institute_unlockables_database_file_no_48()) +
//                   prev(dr_light_institute_unlockables_database_file_no_06()) +
//                   prev(dr_light_institute_unlockables_database_file_no_49()) +
//                   prev(dr_light_institute_unlockables_database_file_no_25()) +
//                   prev(dr_light_institute_unlockables_database_file_no_01()) +
//                   prev(dr_light_institute_unlockables_database_file_no_10()) +
//                   prev(dr_light_institute_unlockables_database_file_no_08()) +
//                   prev(dr_light_institute_unlockables_database_file_no_51()) +
//                   prev(dr_light_institute_unlockables_database_file_no_39()) +
//                   prev(dr_light_institute_unlockables_database_file_no_53()) +
//                   prev(dr_light_institute_unlockables_database_file_no_54()) +
//                   prev(dr_light_institute_unlockables_database_file_no_55()) +
//                   prev(dr_light_institute_unlockables_database_file_no_56()) +
//                   prev(dr_light_institute_unlockables_database_file_no_57()) +
//                   prev(dr_light_institute_unlockables_database_file_no_58()) +
//                   prev(dr_light_institute_unlockables_database_file_no_59()) +
//                   prev(dr_light_institute_unlockables_database_file_no_60())) < 2000
//               ) &&
//               (always_false() || (never((prev(dr_light_institute_unlockables_database_file_no_18()) +
//                     prev(dr_light_institute_unlockables_database_file_no_32()) +
//                     prev(dr_light_institute_unlockables_database_file_no_22()) +
//                     prev(dr_light_institute_unlockables_database_file_no_11()) +
//                     prev(dr_light_institute_unlockables_database_file_no_26()) +
//                     prev(dr_light_institute_unlockables_database_file_no_17()) +
//                     prev(dr_light_institute_unlockables_database_file_no_03()) +
//                     prev(dr_light_institute_unlockables_database_file_no_28()) +
//                     prev(dr_light_institute_unlockables_database_file_no_41()) +
//                     prev(dr_light_institute_unlockables_database_file_no_43()) +
//                     prev(dr_light_institute_unlockables_database_file_no_24()) +
//                     prev(dr_light_institute_unlockables_database_file_no_40()) +
//                     prev(dr_light_institute_unlockables_database_file_no_23()) +
//                     prev(dr_light_institute_unlockables_database_file_no_07()) +
//                     prev(dr_light_institute_unlockables_database_file_no_04()) +
//                     prev(dr_light_institute_unlockables_database_file_no_35()) +
//                     prev(dr_light_institute_unlockables_database_file_no_14()) +
//                     prev(dr_light_institute_unlockables_database_file_no_13()) +
//                     prev(dr_light_institute_unlockables_database_file_no_12()) +
//                     prev(dr_light_institute_unlockables_database_file_no_19()) +
//                     prev(dr_light_institute_unlockables_database_file_no_38()) +
//                     prev(dr_light_institute_unlockables_database_file_no_05()) +
//                     prev(dr_light_institute_unlockables_database_file_no_15()) +
//                     prev(dr_light_institute_unlockables_database_file_no_30()) +
//                     prev(dr_light_institute_unlockables_database_file_no_16()) +
//                     prev(dr_light_institute_unlockables_database_file_no_42()) +
//                     prev(dr_light_institute_unlockables_database_file_no_36()) +
//                     prev(dr_light_institute_unlockables_database_file_no_31()) +
//                     prev(dr_light_institute_unlockables_database_file_no_09()) +
//                     prev(dr_light_institute_unlockables_database_file_no_20()) +
//                     prev(dr_light_institute_unlockables_database_file_no_50()) +
//                     prev(dr_light_institute_unlockables_database_file_no_29()) +
//                     prev(dr_light_institute_unlockables_database_file_no_21()) +
//                     prev(dr_light_institute_unlockables_database_file_no_44()) +
//                     prev(dr_light_institute_unlockables_database_file_no_27()) +
//                     prev(dr_light_institute_unlockables_database_file_no_34()) +
//                     prev(dr_light_institute_unlockables_database_file_no_47()) +
//                     prev(dr_light_institute_unlockables_database_file_no_45()) +
//                     prev(dr_light_institute_unlockables_database_file_no_33()) +
//                     prev(dr_light_institute_unlockables_database_file_no_02()) +
//                     prev(dr_light_institute_unlockables_database_file_no_46()) +
//                     prev(dr_light_institute_unlockables_database_file_no_37()) +
//                     prev(dr_light_institute_unlockables_database_file_no_48()) +
//                     prev(dr_light_institute_unlockables_database_file_no_06()) +
//                     prev(dr_light_institute_unlockables_database_file_no_49()) +
//                     prev(dr_light_institute_unlockables_database_file_no_25()) +
//                     prev(dr_light_institute_unlockables_database_file_no_01()) +
//                     prev(dr_light_institute_unlockables_database_file_no_10()) +
//                     prev(dr_light_institute_unlockables_database_file_no_08()) +
//                     prev(dr_light_institute_unlockables_database_file_no_51()) +
//                     prev(dr_light_institute_unlockables_database_file_no_39()) +
//                     prev(dr_light_institute_unlockables_database_file_no_53()) +
//                     prev(dr_light_institute_unlockables_database_file_no_54()) +
//                     prev(dr_light_institute_unlockables_database_file_no_55()) +
//                     prev(dr_light_institute_unlockables_database_file_no_56()) +
//                     prev(dr_light_institute_unlockables_database_file_no_57()) +
//                     prev(dr_light_institute_unlockables_database_file_no_58()) +
//                     prev(dr_light_institute_unlockables_database_file_no_59()) +
//                     prev(dr_light_institute_unlockables_database_file_no_60())) == 0
//                 )))
// )

// achievement(
//     title = "Not too Slow", points = 2,
//     description = "In Toad Man Stage defeat the first Escaroo/Bomber Snail Mini Boss without taking damage",
//     id = 217011, badge = "240084", published = "07/05/2022 01:19:56", modified = "09/05/2022 00:33:01",
//     trigger = (current_stage() == 1 && screen_stage() == 18) &&
//               trigger_when((once(boss_hp_secondary() == 16) &&
//                   boss_hp_secondary() == 0)
//               ) && unless(once(hp_bar() < prev(hp_bar()))) &&
//               unless(once(megaman_status() == 17)) &&
//               (always_false() || (never((current_stage() == 1 && screen_stage() == 15)) && never((current_stage() == 1 && screen_stage() == 19))))
// )

// achievement(
//     title = "Frog Man", points = 5, type="progression",
//     description = "Defeat Toad Man",
//     id = 217012, badge = "240085", published = "07/05/2022 01:19:56", modified = "07/05/2022 01:25:55",
//     trigger = (current_stage() == 1 && screen_stage() == 27 && boss_hp_secondary() == 0) &&
//               time_to_end_the_completed_stage_fanfare() == 255 &&
//               (always_false() || (never(screen_stage() == 26) && never(current_stage() != 1)))
// )

// achievement(
//     title = "Rain Flush", points = 5,
//     description = "Defeat Toad Man using only the Mega Buster [Only in the Robot Master's Stage, Switch the Weapon will Void the achievement, In Original Mode switching in the menu still count as a switch]",
//     id = 217013, badge = "240086", published = "07/05/2022 01:19:56", modified = "28/08/2022 11:22:45",
//     trigger = (current_stage() == 1 && screen_stage() == 27) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(weapon_selected() != 7 && weapon_selected() != 0)) &&
//               (always_false() || (never(screen_stage() == 26) && never(current_stage() != 1)))
// )

// achievement(
//     title = "Master of the Rain", points = 10,
//     description = "Defeat Toad Man without taking damage [Only in the Robot Master's Stage]",
//     id = 217014, badge = "240087", published = "07/05/2022 01:19:57", modified = "09/05/2022 00:33:04",
//     trigger = (current_stage() == 1 && screen_stage() == 27) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(hp_bar() < prev(hp_bar()))) &&
//               unless(once(megaman_status() == 17)) &&
//               (always_false() || (never(screen_stage() == 26) && never(current_stage() != 1)))
// )

// achievement(
//     title = "It's Time to Stop", points = 5, type="progression",
//     description = "Defeat Bright Man",
//     id = 217015, badge = "240088", published = "07/05/2022 01:19:57", modified = "07/05/2022 01:25:56",
//     trigger = (current_stage() == 0 && screen_stage() == 26 && boss_hp_secondary() == 0) &&
//               time_to_end_the_completed_stage_fanfare() == 255 &&
//               (always_false() || (never(screen_stage() == 25) && never(current_stage() != 0)))
// )

// achievement(
//     title = "Flash Stopper", points = 5,
//     description = "Defeat Bright Man using only the Mega Buster [Only in the Robot Master's Stage, Switch the Weapon will Void the achievement, In Original Mode switching in the menu still count as a switch]",
//     id = 217016, badge = "240089", published = "07/05/2022 01:19:58", modified = "28/08/2022 11:22:45",
//     trigger = (current_stage() == 0 && screen_stage() == 26) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(weapon_selected() != 7 && weapon_selected() != 0)) &&
//               (always_false() || (never(screen_stage() == 25) && never(current_stage() != 0)))
// )

// achievement(
//     title = "[Put a JoJo Reference]", points = 25,
//     description = "Defeat Bright Man without taking damage [Only in the Robot Master's Stage]",
//     id = 217017, badge = "240090", published = "07/05/2022 01:19:58", modified = "09/05/2022 00:33:08",
//     trigger = (current_stage() == 0 && screen_stage() == 26) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(hp_bar() < prev(hp_bar()))) &&
//               unless(once(megaman_status() == 17)) &&
//               (always_false() || (never(screen_stage() == 25) && never(current_stage() != 0)))
// )

// achievement(
//     title = "Balloon Fight", points = 2,
//     description = "Get the Balloon on the Pharaoh Stage",
//     id = 217018, badge = "240091", published = "07/05/2022 01:19:59", modified = "07/05/2022 01:25:57",
//     trigger = (current_stage() == 3 && screen_stage() == 10 && time_to_end_the_completed_stage_fanfare() == 255)
// )

// achievement(
//     title = "The Pharaoh Left the Tomb, to Return to it Again", points = 5, type="progression",
//     description = "Defeat Pharaoh Man",
//     id = 217019, badge = "240092", published = "07/05/2022 01:19:59", modified = "07/05/2022 01:25:57",
//     trigger = (current_stage() == 3 && screen_stage() == 32 && boss_hp_secondary() == 0) &&
//               time_to_end_the_completed_stage_fanfare() == 255 &&
//               (always_false() || (never(screen_stage() == 31) && never(current_stage() != 3)))
// )

// achievement(
//     title = "Pharaoh Shot", points = 5,
//     description = "Defeat Pharaoh Man using only the Mega Buster [Only in the Robot Master's Stage, Switch the Weapon will Void the achievement, In Original Mode switching in the menu still count as a switch]",
//     id = 217020, badge = "240093", published = "07/05/2022 01:19:59", modified = "28/08/2022 11:22:45",
//     trigger = (current_stage() == 3 && screen_stage() == 32) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(weapon_selected() != 7 && weapon_selected() != 0)) &&
//               (always_false() || (never(screen_stage() == 31) && never(current_stage() != 3)))
// )

// achievement(
//     title = "Tumba Lah-Kathûmbah", points = 10,
//     description = "Defeat Pharaoh Man without taking damage [Only in the Robot Master's Stage]",
//     id = 217021, badge = "240094", published = "07/05/2022 01:20:00", modified = "09/05/2022 00:33:06",
//     trigger = (current_stage() == 3 && screen_stage() == 32) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(hp_bar() < prev(hp_bar()))) &&
//               unless(once(megaman_status() == 17)) &&
//               (always_false() || (never(screen_stage() == 31) && never(current_stage() != 3)))
// )

// achievement(
//     title = "Purple Hippowdon?", points = 2,
//     description = "In Ring Man Stage defeat the first Kabatoncue/Hippo Launcher Mini Boss without taking damage",
//     id = 217022, badge = "240095", published = "07/05/2022 01:20:00", modified = "09/05/2022 00:33:01",
//     trigger = (current_stage() == 4 && screen_stage() == 5) &&
//               trigger_when((once(boss_hp_secondary() == 16) &&
//                   boss_hp_secondary() == 0)
//               ) && unless(once(hp_bar() < prev(hp_bar()))) &&
//               unless(once(megaman_status() == 17)) &&
//               (always_false() || (never((current_stage() == 4 && screen_stage() == 4)) && never((current_stage() == 4 && screen_stage() == 6))))
// )

// achievement(
//     title = "Boing!!", points = 2,
//     description = "In Ring Man Stage defeat the first Whopper/Spring King Mini Boss without taking damage",
//     id = 217023, badge = "240096", published = "07/05/2022 01:20:00", modified = "09/05/2022 00:33:00",
//     trigger = (current_stage() == 4 && screen_stage() == 10) &&
//               trigger_when((once(boss_hp_secondary() == 9) &&
//                   boss_hp_secondary() == 0)
//               ) && unless(once(hp_bar() < prev(hp_bar()))) &&
//               unless(once(megaman_status() == 17)) &&
//               (always_false() || (never((current_stage() == 4 && screen_stage() == 9)) && never((current_stage() == 4 && screen_stage() == 11))))
// )

// achievement(
//     title = "Can this Ring Fit in my Finger?", points = 5, type="progression",
//     description = "Defeat Ring Man",
//     id = 217024, badge = "240097", published = "07/05/2022 01:20:01", modified = "07/05/2022 01:25:59",
//     trigger = (current_stage() == 4 && screen_stage() == 24 && boss_hp_secondary() == 0) &&
//               time_to_end_the_completed_stage_fanfare() == 255 &&
//               (always_false() || (never(screen_stage() == 23) && never(current_stage() != 4)))
// )

// achievement(
//     title = "Ring Boomerang", points = 5,
//     description = "Defeat Ring Man using only the Mega Buster [Only in the Robot Master's Stage, Switch the Weapon will Void the achievement, In Original Mode switching in the menu still count as a switch]",
//     id = 217025, badge = "240098", published = "07/05/2022 01:20:01", modified = "28/08/2022 11:22:46",
//     trigger = (current_stage() == 4 && screen_stage() == 24) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(weapon_selected() != 7 && weapon_selected() != 0)) &&
//               (always_false() || (never(screen_stage() == 23) && never(current_stage() != 4)))
// )

// achievement(
//     title = "How a Ring can be a Boomerang?", points = 10,
//     description = "Defeat Ring Man without taking damage [Only in the Robot Master's Stage]",
//     id = 217026, badge = "240099", published = "07/05/2022 01:20:02", modified = "09/05/2022 00:33:03",
//     trigger = (current_stage() == 4 && screen_stage() == 24) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(hp_bar() < prev(hp_bar()))) &&
//               unless(once(megaman_status() == 17)) &&
//               (always_false() || (never(screen_stage() == 23) && never(current_stage() != 4)))
// )

// achievement(
//     title = "A Trash Dispenser", points = 5, type="progression",
//     description = "Defeat Dust Man",
//     id = 217027, badge = "240100", published = "07/05/2022 01:20:02", modified = "07/05/2022 01:26:00",
//     trigger = (current_stage() == 5 && screen_stage() == 23 && boss_hp_secondary() == 0) &&
//               time_to_end_the_completed_stage_fanfare() == 255 &&
//               (always_false() || (never(screen_stage() == 22) && never(current_stage() != 5)))
// )

// achievement(
//     title = "Dust Crusher", points = 5,
//     description = "Defeat Dust Man using only the Mega Buster [Only in the Robot Master's Stage, Switch the Weapon will Void the achievement, In Original Mode switching in the menu still count as a switch]",
//     id = 217028, badge = "240101", published = "07/05/2022 01:20:03", modified = "28/08/2022 11:22:46",
//     trigger = (current_stage() == 5 && screen_stage() == 23) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(weapon_selected() != 7 && weapon_selected() != 0)) &&
//               (always_false() || (never(screen_stage() == 22) && never(current_stage() != 5)))
// )

// achievement(
//     title = "You can go Back to the Dump", points = 10,
//     description = "Defeat Dust Man without taking damage [Only in the Robot Master's Stage]",
//     id = 217029, badge = "240102", published = "07/05/2022 01:20:03", modified = "09/05/2022 00:33:07",
//     trigger = (current_stage() == 5 && screen_stage() == 23) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(hp_bar() < prev(hp_bar()))) &&
//               unless(once(megaman_status() == 17)) &&
//               (always_false() || (never(screen_stage() == 22) && never(current_stage() != 5)))
// )

// achievement(
//     title = "Do you Like Horror Movies?", points = 5, type="progression",
//     description = "Defeat Skull Man",
//     id = 217030, badge = "240103", published = "07/05/2022 01:20:04", modified = "07/05/2022 01:26:01",
//     trigger = (current_stage() == 7 && screen_stage() == 26 && boss_hp_secondary() == 0) &&
//               time_to_end_the_completed_stage_fanfare() == 255 &&
//               (always_false() || (never(screen_stage() == 25) && never(current_stage() != 7)))
// )

// achievement(
//     title = "Skull Barrier", points = 5,
//     description = "Defeat Skull Man using only the Mega Buster [Only in the Robot Master's Stage, Switch the Weapon will Void the achievement, In Original Mode switching in the menu still count as a switch]",
//     id = 217031, badge = "240104", published = "07/05/2022 01:20:04", modified = "28/08/2022 11:22:46",
//     trigger = (current_stage() == 7 && screen_stage() == 26) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(weapon_selected() != 7 && weapon_selected() != 0)) &&
//               (always_false() || (never(screen_stage() == 25) && never(current_stage() != 7)))
// )

// achievement(
//     title = "A Ton of Work, a Skele-TON of Work", points = 10,
//     description = "Defeat Skull Man without taking damage [Only in the Robot Master's Stage]",
//     id = 217032, badge = "240105", published = "07/05/2022 01:20:04", modified = "09/05/2022 00:33:02",
//     trigger = (current_stage() == 7 && screen_stage() == 26) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(hp_bar() < prev(hp_bar()))) &&
//               unless(once(megaman_status() == 17)) &&
//               (always_false() || (never(screen_stage() == 25) && never(current_stage() != 7)))
// )

// achievement(
//     title = "Moby the Whale", points = 3,
//     description = "In Dive Man Stage defeat the first Moby Mini Boss without taking damage",
//     id = 217033, badge = "240106", published = "07/05/2022 01:20:05", modified = "09/05/2022 00:33:01",
//     trigger = (current_stage() == 6 && screen_stage() == 7) &&
//               trigger_when((once(boss_hp_secondary() == 14) &&
//                   boss_hp_secondary() == 0)
//               ) && unless(once(hp_bar() < prev(hp_bar()))) &&
//               unless(once(megaman_status() == 17)) &&
//               (always_false() || (never((current_stage() == 6 && screen_stage() == 6)) && never((current_stage() == 6 && screen_stage() == 8))))
// )

// achievement(
//     title = "Climbing Wire", points = 2,
//     description = "Get the Wire on the Dive Stage",
//     id = 217034, badge = "240107", published = "07/05/2022 01:20:06", modified = "07/05/2022 01:26:03",
//     trigger = (current_stage() == 6 && screen_stage() == 29 && time_to_end_the_completed_stage_fanfare() == 255)
// )

// achievement(
//     title = "Captain Dive M. on Command!!!", points = 5, type="progression",
//     description = "Defeat Dive Man",
//     id = 217035, badge = "240108", published = "07/05/2022 01:20:06", modified = "07/05/2022 01:26:03",
//     trigger = (current_stage() == 6 && screen_stage() == 24 && boss_hp_secondary() == 0) &&
//               time_to_end_the_completed_stage_fanfare() == 255 &&
//               (always_false() || (never(screen_stage() == 23) && never(current_stage() != 6)))
// )

// achievement(
//     title = "Dive Missile", points = 5,
//     description = "Defeat Dive Man using only the Mega Buster [Only in the Robot Master's Stage, Switch the Weapon will Void the achievement, In Original Mode switching in the menu still count as a switch]",
//     id = 217036, badge = "240109", published = "07/05/2022 01:20:07", modified = "28/08/2022 11:22:47",
//     trigger = (current_stage() == 6 && screen_stage() == 24) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(weapon_selected() != 7 && weapon_selected() != 0)) &&
//               (always_false() || (never(screen_stage() == 23) && never(current_stage() != 6)))
// )

// achievement(
//     title = "Time to Dive", points = 10,
//     description = "Defeat Dive Man without taking damage [Only in the Robot Master's Stage]",
//     id = 217037, badge = "240110", published = "07/05/2022 01:20:07", modified = "09/05/2022 00:33:06",
//     trigger = (current_stage() == 6 && screen_stage() == 24) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(hp_bar() < prev(hp_bar()))) &&
//               unless(once(megaman_status() == 17)) &&
//               (always_false() || (never(screen_stage() == 23) && never(current_stage() != 6)))
// )

// achievement(
//     title = "Excavation Location", points = 5, type="progression",
//     description = "Defeat Drill Man",
//     id = 217038, badge = "240111", published = "07/05/2022 01:20:08", modified = "07/05/2022 01:26:04",
//     trigger = (current_stage() == 2 && screen_stage() == 22 && boss_hp_secondary() == 0) &&
//               time_to_end_the_completed_stage_fanfare() == 255 &&
//               (always_false() || (never(screen_stage() == 21) && never(current_stage() != 2)))
// )

// // Ticket 50930: Challenge still remained active and cheevo still triggered after switching to Dive Missile from the
// //               weapon menu in the middle of the fight and then proceeding to kill Drill Man. This was done in Navi
// //               Mode btw.
// achievement(
//     title = "Drill Bomb", points = 5,
//     description = "Defeat Drill Man using only the Mega Buster [Only in the Robot Master's Stage, Switch the Weapon will Void the achievement, In Original Mode switching in the menu still count as a switch]",
//     id = 217039, badge = "240112", published = "07/05/2022 01:20:09", modified = "28/08/2022 11:22:47",
//     trigger = (current_stage() == 2 && screen_stage() == 22) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(weapon_selected() != 7 && weapon_selected() != 0)) &&
//               (always_false() || (never(screen_stage() == 21) && never(current_stage() != 2)))
// )

// achievement(
//     title = "Let put that's Drills to Work", points = 10,
//     description = "Defeat Drill Man without taking damage [Only in the Robot Master's Stage]",
//     id = 217040, badge = "240113", published = "07/05/2022 01:20:09", modified = "09/05/2022 00:33:04",
//     trigger = (current_stage() == 2 && screen_stage() == 22) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(hp_bar() < prev(hp_bar()))) &&
//               unless(once(megaman_status() == 17)) &&
//               (always_false() || (never(screen_stage() == 21) && never(current_stage() != 2)))
// )

// achievement(
//     title = "Entering the Fortress I", points = 5, type="progression",
//     description = "Defeat Mothraya",
//     id = 217041, badge = "240114", published = "07/05/2022 01:20:09", modified = "07/05/2022 01:26:05",
//     trigger = (current_stage() == 8 && screen_stage() == 18 && boss_hp_secondary() == 0) &&
//               time_to_end_the_completed_stage_fanfare() == 255 &&
//               (always_false() || (never(screen_stage() == 17) && never(current_stage() != 8)))
// )

// achievement(
//     title = "Moth Body + Stingray Tail = This Thing...", points = 10,
//     description = "Defeat Mothraya without taking damage",
//     id = 217042, badge = "240115", published = "07/05/2022 01:20:10", modified = "09/05/2022 00:33:05",
//     trigger = (current_stage() == 8 && screen_stage() == 18) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(hp_bar() < prev(hp_bar()))) &&
//               unless(once(megaman_status() == 17)) &&
//               (always_false() || (never(screen_stage() == 17) && never(current_stage() != 8)))
// )

// achievement(
//     title = "Going Further into the Fortress I", points = 5, type="progression",
//     description = "Defeat Square Machine",
//     id = 217043, badge = "240116", published = "07/05/2022 01:20:10", modified = "07/05/2022 01:26:06",
//     trigger = (current_stage() == 9 && screen_stage() == 16 && boss_hp_secondary() == 0) &&
//               time_to_end_the_completed_stage_fanfare() == 255 &&
//               (always_false() || (never(screen_stage() == 15) && never(current_stage() != 9)))
// )

// achievement(
//     title = "Square Machine²", points = 10,
//     description = "Defeat Square Machine without taking damage",
//     id = 217044, badge = "240117", published = "07/05/2022 01:20:11", modified = "09/05/2022 00:33:05",
//     trigger = (current_stage() == 9 && screen_stage() == 16) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(hp_bar() < prev(hp_bar()))) &&
//               unless(once(megaman_status() == 17)) &&
//               (always_false() || (never(screen_stage() == 15) && never(current_stage() != 9)))
// )

// achievement(
//     title = "Near to the End of the Fortress I", points = 5, type="progression",
//     description = "Defeat Cockroach Twins",
//     id = 217045, badge = "240118", published = "07/05/2022 01:20:11", modified = "07/05/2022 01:26:07",
//     trigger = (current_stage() == 10 && screen_stage() == 16 && boss_hp_secondary() == 0) &&
//               time_to_end_the_completed_stage_fanfare() == 255 &&
//               (always_false() || (never(screen_stage() == 15) && never(current_stage() != 10)))
// )

// achievement(
//     title = "Two Against One?", points = 10,
//     description = "Defeat Cockroach Twins without taking damage",
//     id = 217046, badge = "240119", published = "07/05/2022 01:20:11", modified = "09/05/2022 00:33:06",
//     trigger = (current_stage() == 10 && screen_stage() == 16) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(hp_bar() < prev(hp_bar()))) &&
//               unless(once(megaman_status() == 17)) &&
//               (always_false() || (never(screen_stage() == 15) && never(current_stage() != 10)))
// )

// achievement(
//     title = "It's already the fourth time Wily...", points = 5, type="progression",
//     description = "Defeat Cossack Catcher",
//     id = 217047, badge = "240120", published = "07/05/2022 01:20:12", modified = "07/05/2022 01:26:07",
//     trigger = once(once(once(current_stage() == 11 && screen_stage() == 19) &&
//                   boss_hp_secondary() == 28) &&
//                   boss_hp_secondary() == 0
//               ) && (music_id() == 49757 || music_id() == 236862) &&
//               (always_false() || (never(screen_stage() == 18) && never(current_stage() != 11)))
// )

// achievement(
//     title = "Is the Boss one of those Grappling Machines from Hell!? >:v", points = 10,
//     description = "Defeat Cossack Catcher without taking damage",
//     id = 217048, badge = "240121", published = "07/05/2022 01:20:12", modified = "09/05/2022 00:33:04",
//     trigger = once(current_stage() == 11 && screen_stage() == 19) &&
//               trigger_when(once(once(boss_hp_secondary() == 28) &&
//                   boss_hp_secondary() == 0)
//               ) && trigger_when((music_id() == 49757 || music_id() == 236862)) &&
//               unless(once(hp_bar() < prev(hp_bar()))) &&
//               unless(once(megaman_status() == 17)) &&
//               (always_false() || (never(screen_stage() == 18) && never(current_stage() != 11)))
// )

// achievement(
//     title = "Entering the Fortress II", points = 5, type="progression",
//     description = "Defeat Met Daddy",
//     id = 217049, badge = "240122", published = "07/05/2022 01:20:12", modified = "07/05/2022 01:26:08",
//     trigger = (current_stage() == 12 && screen_stage() == 20 && boss_hp_secondary() == 0) &&
//               time_to_end_the_completed_stage_fanfare() == 255 &&
//               (always_false() || (never(screen_stage() == 19) && never(current_stage() != 12)))
// )

// achievement(
//     title = "Holy Crap it's a Giant Met", points = 10,
//     description = "Defeat Met Daddy without taking damage",
//     id = 217050, badge = "240123", published = "07/05/2022 01:20:13", modified = "09/05/2022 00:33:02",
//     trigger = (current_stage() == 12 && screen_stage() == 20) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(hp_bar() < prev(hp_bar()))) &&
//               unless(once(megaman_status() == 17)) &&
//               (always_false() || (never(screen_stage() == 19) && never(current_stage() != 12)))
// )

// achievement(
//     title = "Going Further into the Fortress II", points = 5, type="progression",
//     description = "Defeat Tako Trash",
//     id = 217051, badge = "240124", published = "07/05/2022 01:20:13", modified = "07/05/2022 01:26:09",
//     trigger = (current_stage() == 13 && screen_stage() == 21 && boss_hp_secondary() == 0) &&
//               time_to_end_the_completed_stage_fanfare() == 255 &&
//               (always_false() || (never(screen_stage() == 20) && never(current_stage() != 13)))
// )

// achievement(
//     title = "Why they Always is Giants?", points = 10,
//     description = "Defeat Tako Trash without taking damage",
//     id = 217052, badge = "240125", published = "07/05/2022 01:20:13", modified = "09/05/2022 00:33:07",
//     trigger = (current_stage() == 13 && screen_stage() == 21) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(hp_bar() < prev(hp_bar()))) &&
//               unless(once(megaman_status() == 17)) &&
//               (always_false() || (never(screen_stage() == 20) && never(current_stage() != 13)))
// )

// achievement(
//     title = "Near to the End of the Fortress II", points = 5, type="progression",
//     description = "Defeat Wily Machine and the Boring Boss Rush",
//     id = 217053, badge = "240126", published = "07/05/2022 01:20:14", modified = "07/05/2022 01:26:10",
//     trigger = (current_stage() == 14 && screen_stage() == 11 && boss_hp_secondary() == 0) &&
//               time_to_end_the_completed_stage_fanfare() == 255 &&
//               (always_false() || (never(screen_stage() == 9) && never(current_stage() != 14)))
// )

// achievement(
//     title = "Here Go Again ;-;", points = 10,
//     description = "Defeat the Boss Rush and move to the Wily's room only using buster [Reset the Stage if you fail, Switch the Weapon will Void the achievement, In Original Mode switching in the menu still count as a switch]",
//     id = 217055, badge = "240128", published = "07/05/2022 01:20:14", modified = "09/05/2022 01:09:32",
//     trigger = once(current_stage() == 14 && screen_stage() == 6) &&
//               trigger_when((prev(screen_stage()) == 9 && screen_stage() == 11)) &&
//               unless(once(weapon_selected() != 7 && weapon_selected() != 0)) &&
//               (always_false() || (never(screen_stage() == 5) && never(current_stage() != 14)))
// )

// achievement(
//     title = "You'll not Escape this Time", points = 10,
//     description = "Defeat Wily Machine without taking damage",
//     id = 217054, badge = "240127", published = "07/05/2022 01:20:14", modified = "09/05/2022 00:33:07",
//     trigger = (current_stage() == 14 && screen_stage() == 11) &&
//               trigger_when((boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && unless(once(hp_bar() < prev(hp_bar()))) &&
//               unless(once(megaman_status() == 17)) &&
//               (always_false() || (never(screen_stage() == 9) && never(current_stage() != 14)))
// )

// achievement(
//     title = "You can Escape... for Now", points = 10, type="win_condition",
//     description = "Finish the game",
//     id = 217056, badge = "240129", published = "07/05/2022 01:20:15", modified = "07/05/2022 01:26:11",
//     trigger = once(once(once(current_stage() == 15 && screen_stage() == 6) &&
//                   boss_hp_secondary() == 28) &&
//                   boss_hp_secondary() == 0
//               ) && (music_id() == 49104 || music_id() == 237130) &&
//               (always_false() || (never(screen_stage() == 5) && never(current_stage() != 15)))
// )

// achievement(
//     title = "Dodge this One", points = 10,
//     description = "Defeat Wily Capsule without taking damage",
//     id = 217057, badge = "240130", published = "07/05/2022 01:20:15", modified = "09/05/2022 00:33:02",
//     trigger = once(current_stage() == 15 && screen_stage() == 6) &&
//               trigger_when(once(once(boss_hp_secondary() == 28) &&
//                   boss_hp_secondary() == 0)
//               ) && trigger_when((music_id() == 49104 || music_id() == 237130)) &&
//               unless(once(hp_bar() < prev(hp_bar()))) &&
//               unless(once(megaman_status() == 17)) &&
//               (always_false() || (never(screen_stage() == 5) && never(current_stage() != 15)))
// )

// achievement(
//     title = "This Should be Easy... Right?", points = 10,
//     description = "Beat all 8 Robot Masters Stages and move to the Dr. Cossack stages without dying",
//     id = 217066, badge = "240139", published = "07/05/2022 01:20:20", modified = "07/05/2022 01:26:14",
//     trigger = trigger_when(once(current_stage() == 6 && screen_stage() == 24 &&
//                   boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) &&
//               trigger_when(once(current_stage() == 3 && screen_stage() == 32 &&
//                   boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) &&
//               trigger_when(once(current_stage() == 5 && screen_stage() == 23 &&
//                   boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) &&
//               trigger_when(once(current_stage() == 4 && screen_stage() == 24 &&
//                   boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) &&
//               trigger_when(once(current_stage() == 7 && screen_stage() == 26 &&
//                   boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) &&
//               trigger_when(once(current_stage() == 2 && screen_stage() == 22 &&
//                   boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) &&
//               trigger_when(once(current_stage() == 1 && screen_stage() == 27 &&
//                   boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) &&
//               trigger_when(once(current_stage() == 0 && screen_stage() == 26 &&
//                   boss_hp_secondary() == 0 &&
//                   time_to_end_the_completed_stage_fanfare() == 255)
//               ) && trigger_when((music_id() == 237029 || music_id() == 49247)) &&
//               unless(once(prev(music_id()) == 235453 && music_id() == 236271)) &&
//               unless(once(prev(music_id()) == 48461 && music_id() == 46037)) &&
//               unless(once(byte(0x05A8CC) == 1 && time_to_the_fade_out_of_the_current_screen() == 44)) &&
//               (always_false() || (never(music_id() == 235453) && never(music_id() == 48461) && never(music_id() == 189314)))
// )

// achievement(
//     title = "It's Ended... Right?", points = 25,
//     description = "Complete all the Cossack and Wily Stage without dying",
//     id = 217067, badge = "240140", published = "07/05/2022 01:20:20", modified = "07/05/2022 01:26:15",
//     trigger = once(current_stage() == 8) &&
//               trigger_when(once(once(once(current_stage() == 15 && screen_stage() == 6) &&
//                   boss_hp_secondary() == 28) &&
//                   boss_hp_secondary() == 0)
//               ) && trigger_when((music_id() == 49104 || music_id() == 237130)) &&
//               unless(once(byte(0x05A8CC) == 1 && time_to_the_fade_out_of_the_current_screen() == 44)) &&
//               (always_false() || (never(current_stage() < 8) && never(music_id() == 235453) && never(music_id() == 48461) &&
//                 never(music_id() == 189314)))
// )

// achievement(
//     title = "Let the Music Play", points = 5,
//     description = "Complete the Mission Mode and Unlock the sound test",
//     id = 217010, badge = "240083", published = "07/05/2022 01:19:55", modified = "07/05/2022 01:25:54",
//     trigger = (once(prev(unlockables_of_the_menu_sound_test()) == 0) && unlockables_of_the_menu_sound_test() == 1) &&
//               mission_mode_mission_unlocked() == 3
// )

// =========================================
//               Leaderboards              
// =========================================

// ORIGINAL
leaderboard("Original Mode Speedrun - Easy", "Best time to finish the game in Original Mode on Easy difficulty",
           start = mode_indicator() == 0 && game_difficulty() == 0 && robot_masters_defeated() == 0 && prev(game_time_frames()) == 0x00 && game_time_frames() > prev(game_time_frames()),
           cancel = music_id() == 0x2e382 || music_id() == 0x397bd || music_id() == 0xbd4d,
           submit = __ornext(music_id() == 49104 || music_id() == 237130) && current_stage() == 15 && screen_stage() == 6,
           value = game_time_frames(),
           format = "FRAMES", lower_is_better=true
           )

leaderboard("Original Mode Speedrun - Normal", "Best time to finish the game in Original Mode on Normal difficulty",
           start = mode_indicator() == 0 && game_difficulty() == 1 && robot_masters_defeated() == 0 && prev(game_time_frames()) == 0x00 && game_time_frames() > prev(game_time_frames()),
           cancel = music_id() == 0x2e382 || music_id() == 0x397bd || music_id() == 0xbd4d,
           submit = __ornext(music_id() == 49104 || music_id() == 237130) && current_stage() == 15 && screen_stage() == 6,
           value = game_time_frames(),
           format = "FRAMES", lower_is_better=true
           )

leaderboard("Original Mode Speedrun - Hard", "Best time to finish the game in Original Mode on Hard difficulty",
           start = mode_indicator() == 0 && game_difficulty() == 2 && robot_masters_defeated() == 0 && prev(game_time_frames()) == 0x00 && game_time_frames() > prev(game_time_frames()),
           cancel = music_id() == 0x2e382 || music_id() == 0x397bd || music_id() == 0xbd4d,
           submit = __ornext(music_id() == 49104 || music_id() == 237130) && current_stage() == 15 && screen_stage() == 6,
           value = game_time_frames(),
           format = "FRAMES", lower_is_better=true
           )


// NAVI
leaderboard("Navi Mode Speedrun - Easy", "Best time to finish the game in Navi Mode on Easy difficulty",
           start = mode_indicator() == 1 && game_difficulty() == 0 && robot_masters_defeated() == 0 && prev(game_time_frames()) == 0x00 && game_time_frames() > prev(game_time_frames()),
           cancel = music_id() == 0x2e382 || music_id() == 0x397bd || music_id() == 0xbd4d,
           submit = __ornext(music_id() == 49104 || music_id() == 237130) && current_stage() == 15 && screen_stage() == 6,
           value = game_time_frames(),
           format = "FRAMES", lower_is_better=true
           )

leaderboard("Navi Mode Speedrun - Normal", "Best time to finish the game in Navi Mode on Normal difficulty",
           start = mode_indicator() == 1 && game_difficulty() == 1 && robot_masters_defeated() == 0 && prev(game_time_frames()) == 0x00 && game_time_frames() > prev(game_time_frames()),
           cancel = music_id() == 0x2e382 || music_id() == 0x397bd || music_id() == 0xbd4d,
           submit = __ornext(music_id() == 49104 || music_id() == 237130) && current_stage() == 15 && screen_stage() == 6,
           value = game_time_frames(),
           format = "FRAMES", lower_is_better=true
           )

leaderboard("Navi Mode Speedrun - Hard", "Best time to finish the game in Navi Mode on Hard difficulty",
           start = mode_indicator() == 1 && game_difficulty() == 2 && robot_masters_defeated() == 0 && prev(game_time_frames()) == 0x00 && game_time_frames() > prev(game_time_frames()),
           cancel = music_id() == 0x2e382 || music_id() == 0x397bd || music_id() == 0xbd4d,
           submit = __ornext(music_id() == 49104 || music_id() == 237130) && current_stage() == 15 && screen_stage() == 6,
           value = game_time_frames(),
           format = "FRAMES", lower_is_better=true
           )