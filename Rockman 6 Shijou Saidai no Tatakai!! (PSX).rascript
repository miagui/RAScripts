// Rockman 6: Shijou Saidai no Tatakai!!
// #ID = 3777

function game_difficulty() => byte(0x057e74)
function mode_indicator() => byte(0x056af4)

function stage_screen() => byte(0x056B02)
function stage_screen_main() => byte(0x20028f)
function in_a_stage() => byte(0x059F7D)
function current_stage() => byte(0x12067A)
function current_stage_main() => byte(0x200289)

function stages_beaten_32bits_combo() => dword(0x05a242)

function helmetless_mega_man() => byte(0x056B08)
function mega_man_hp() => byte(0x059F95)
function mega_man_weapon_equipped() => byte(0x05A249)

function game_time_minutes() => byte(0x056C98)
function game_time_seconds() => byte(0x056C9E)
function game_time_milisseconds() => byte(0x056CB8)
function game_time_frames() => (game_time_minutes() * 3600) + (game_time_seconds() * 60) + game_time_milisseconds()


function music_id_8bits() => byte(0x056E30)
function music_id() => word(0x056E30)
function menu_extra_unlocked_sound_test() => bit3(0x057E7E)

function mission_mode_mission_unlocked() => byte(0x057E82)


function energy_balancer() => byte(0x05A246)
function energy_tank_quantity_lower_4() => low4(0x05A251)

function yamato_spear_ammunition() => byte(0x05A239)
function wind_storm_ammunition() => byte(0x05A23A)
function blizzard_attack_ammunition() => byte(0x05A23B)
function flame_blast_ammunition() => byte(0x05A23C)
function plant_barrier_ammunition() => byte(0x05A23D)
function knight_crush_ammunition() => byte(0x05A23E)
function silver_tomahawk_ammunition() => byte(0x05A23F)
function centaur_flash_ammunition() => byte(0x05A240)
function beat_ammunition() => byte(0x05A241)

function boss_hp() => byte(0x059F9D)


// achievement(
//     title = "A True Hero Doesn't Hide His Hair", points = 1,
//     description = "Play as Helmetless Mega Man",
//     id = 200640, badge = "222893", published = "27/02/2022 21:39:49", modified = "23/06/2023 16:22:34",
//     trigger = helmetless_mega_man() == 1 && in_a_stage() == 1 && never(music_id_8bits() == 27)
// )

// achievement(
//     title = "Balanced Energy", points = 2,
//     description = "Get the Energy Balancer [Without Password]",
//     id = 200696, badge = "222949", published = "27/02/2022 21:40:07", modified = "27/02/2022 22:19:10",
//     trigger = (current_stage() == 5 && stage_screen() == 28) && in_a_stage() == 1 &&
//               (prev(energy_balancer()) == 0 && energy_balancer() == 1) &&
//               unless(once(prev(music_id()) == 49901 && music_id() == 38)) &&
//               unless(once(prev(music_id()) == 25120 && music_id() == 40488)) &&
//               (always_false() || (never(music_id() == 49901) && never(music_id() == 25120)))
// )

// achievement(
//     title = "Comrade Birdie", points = 3,
//     description = "Unlock Beat [without password]",
//     id = 200641, badge = "222894", published = "27/02/2022 21:39:49", modified = "28/02/2022 17:18:25",
//     trigger = (bit2(0x05A242) == 1 && bit2(0x05A243) == 1 && bit2(0x05A244) == 1 && bit2(0x05A245) == 1) &&
//               unless(once(prev(music_id()) == 49901 && music_id() == 38)) &&
//               unless(once(prev(music_id()) == 25120 && music_id() == 40488)) &&
//               ((prev(bit2(0x05A242)) == 0) ||
//                (prev(bit2(0x05A243)) == 0) ||
//                (prev(bit2(0x05A244)) == 0) ||
//                (prev(bit2(0x05A245)) == 0) ||
//                (never(music_id() == 49901) && never(music_id() == 25120)))
// )

// achievement(
//     title = "Mega Collector I", points = 4,
//     description = "Get 2 E-Tanks and two 1-ups in Blizzard Man Stage",
//     id = 200682, badge = "222935", published = "27/02/2022 21:40:03", modified = "27/02/2022 22:19:11",
//     trigger = once(current_stage() == 0 && prev(bit1(0x05A201)) == 0 && bit1(0x05A201) == 1) &&
//               once(current_stage() == 0 && prev(bit7(0x05A202)) == 0 && bit7(0x05A202) == 1) &&
//               once(current_stage() == 0 && prev(bit7(0x05A203)) == 0 && bit7(0x05A203) == 1) &&
//               once(current_stage() == 0 && prev(bit4(0x05A206)) == 0 && bit4(0x05A206) == 1) && never(current_stage() != 0) &&
//               never(in_a_stage() == 0)
// )

// achievement(
//     title = "Blizzard Attack", points = 5, type="progression",
//     description = "Defeat Blizzard Man",
//     id = 200642, badge = "222895", published = "27/02/2022 21:39:49", modified = "27/02/2022 22:19:11",
//     trigger = (boss_hp() == 255 && prev(bit0(0x05A242)) == 0 && bit0(0x05A242) == 1) && current_stage() == 0 &&
//               stage_screen() == 24 && once(stage_screen() == 24 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) && never(current_stage() != 0) &&
//               never((current_stage() == 0 && stage_screen() == 23)) && never(mega_man_hp() >= 128)
// )

// achievement(
//     title = "Master of the Snow", points = 5,
//     description = "Defeat Blizzard Man only using the buster and without using E-tanks [Rush's Adapters is OK and Only in the Robot Master's Stage]",
//     id = 200643, badge = "222896", published = "27/02/2022 21:39:50", modified = "27/02/2022 22:19:12",
//     trigger = trigger_when((boss_hp() == 255 && prev(bit0(0x05A242)) == 0 && bit0(0x05A242) == 1)) && current_stage() == 0 &&
//               stage_screen() == 24 && once(stage_screen() == 24 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_weapon_equipped() == 1 && yamato_spear_ammunition() < prev(yamato_spear_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 2 && wind_storm_ammunition() < prev(wind_storm_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 3 && blizzard_attack_ammunition() < prev(blizzard_attack_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 4 && flame_blast_ammunition() < prev(flame_blast_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 5 && plant_barrier_ammunition() < prev(plant_barrier_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 6 && knight_crush_ammunition() < prev(knight_crush_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 7 && silver_tomahawk_ammunition() < prev(silver_tomahawk_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 8 && centaur_flash_ammunition() < prev(centaur_flash_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 9 && beat_ammunition() < prev(beat_ammunition()))) &&
//               unless(once(energy_tank_quantity_lower_4() < prev(energy_tank_quantity_lower_4()))) &&
//               (always_false() || (never(current_stage() != 0) && never((current_stage() == 0 && stage_screen() == 23)) &&
//                 never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Warning, Blizzard Ahead", points = 10,
//     description = "Defeat Blizzard Man without taking damage [Only in the Robot Master's Stage]",
//     id = 200644, badge = "222897", published = "27/02/2022 21:39:50", modified = "27/02/2022 22:19:12",
//     trigger = trigger_when((boss_hp() == 255 && prev(bit0(0x05A242)) == 0 && bit0(0x05A242) == 1)) && current_stage() == 0 &&
//               stage_screen() == 24 && once(stage_screen() == 24 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_hp() < prev(mega_man_hp()))) &&
//               (always_false() || (never(current_stage() != 0) && never((current_stage() == 0 && stage_screen() == 23)) &&
//                 never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Centaur Flash", points = 5, type="progression",
//     description = "Defeat Centaur Man",
//     id = 200645, badge = "222898", published = "27/02/2022 21:39:50", modified = "27/02/2022 22:19:12",
//     trigger = (boss_hp() == 255 && prev(bit1(0x05A244)) == 0 && bit1(0x05A244) == 1) && current_stage() == 7 &&
//               (stage_screen() == 26 || stage_screen() == 23) &&
//               once((stage_screen() == 26 || stage_screen() == 23) && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) && never(current_stage() != 7) &&
//               never((current_stage() == 7 && stage_screen() == 22)) && never((current_stage() == 7 && stage_screen() == 25)) &&
//               never(mega_man_hp() >= 128)
// )

// // Ticket 83224: Beat centaur man buster only, no etanks. had 1 hp left So i assume thats what went wrong.
// achievement(
//     title = "Ability Unknown", points = 5,
//     description = "Defeat Centaur Man only using the buster and without using E-tanks [Rush's Adapters is OK and Only in the Robot Master's Stage]",
//     id = 200646, badge = "222899", published = "27/02/2022 21:39:51", modified = "29/12/2024 06:24:19",
//     trigger = trigger_when((bit1(0x05A244) > prev(bit1(0x05A244)) || bit2(0x05A244) > prev(bit2(0x05A244))) && boss_hp() == 255) &&
//               current_stage() == 7 && (stage_screen() == 26 || stage_screen() == 23) &&
//               once((stage_screen() == 26 || stage_screen() == 23) && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_weapon_equipped() == 1 && yamato_spear_ammunition() < prev(yamato_spear_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 2 && wind_storm_ammunition() < prev(wind_storm_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 3 && blizzard_attack_ammunition() < prev(blizzard_attack_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 4 && flame_blast_ammunition() < prev(flame_blast_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 5 && plant_barrier_ammunition() < prev(plant_barrier_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 6 && knight_crush_ammunition() < prev(knight_crush_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 7 && silver_tomahawk_ammunition() < prev(silver_tomahawk_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 8 && centaur_flash_ammunition() < prev(centaur_flash_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 9 && beat_ammunition() < prev(beat_ammunition()))) &&
//               unless(once(energy_tank_quantity_lower_4() < prev(energy_tank_quantity_lower_4()))) &&
//               (always_false() || (never(current_stage() != 7) && never((current_stage() == 7 && stage_screen() == 22)) &&
//                 never((current_stage() == 7 && stage_screen() == 25)) && never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Flashing the Centaur", points = 10,
//     description = "Defeat Centaur Man without taking damage [Only in the Robot Master's Stage]",
//     id = 200647, badge = "222900", published = "27/02/2022 21:39:51", modified = "29/12/2024 06:24:19",
//     trigger = trigger_when((bit1(0x05A244) > prev(bit1(0x05A244)) || bit2(0x05A244) > prev(bit2(0x05A244))) && boss_hp() == 255) &&
//               current_stage() == 7 && (stage_screen() == 26 || stage_screen() == 23) &&
//               once((stage_screen() == 26 || stage_screen() == 23) && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_hp() < prev(mega_man_hp()))) &&
//               (always_false() || (never(current_stage() != 7) && never((current_stage() == 7 && stage_screen() == 22)) &&
//                 never((current_stage() == 7 && stage_screen() == 25)) && never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Mega Collector II", points = 2,
//     description = "Get 1 E-Tanks and one 1-ups in Flame Man Stage",
//     id = 200683, badge = "222936", published = "27/02/2022 21:40:03", modified = "27/02/2022 22:19:13",
//     trigger = once(current_stage() == 3 && prev(bit6(0x05A200)) == 0 && bit6(0x05A200) == 1) &&
//               once(current_stage() == 3 && prev(bit2(0x05A206)) == 0 && bit2(0x05A206) == 1) && never(current_stage() != 3) &&
//               never(in_a_stage() == 0)
// )

// achievement(
//     title = "Flame Blast", points = 5, type="progression",
//     description = "Defeat Flame Man",
//     id = 200648, badge = "222901", published = "27/02/2022 21:39:51", modified = "27/02/2022 22:19:14",
//     trigger = (boss_hp() == 255 && prev(bit0(0x05A244)) == 0 && bit0(0x05A244) == 1) && current_stage() == 3 &&
//               stage_screen() == 23 && once(stage_screen() == 23 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) && never(current_stage() != 3) &&
//               never((current_stage() == 3 && stage_screen() == 22)) && never(mega_man_hp() >= 128)
// )

// achievement(
//     title = "Master of the Flames", points = 5,
//     description = "Defeat Flame Man only using the buster and without using E-tanks [Rush's Adapters is OK and Only in the Robot Master's Stage]",
//     id = 200649, badge = "222902", published = "27/02/2022 21:39:52", modified = "27/02/2022 22:19:14",
//     trigger = trigger_when((boss_hp() == 255 && prev(bit0(0x05A244)) == 0 && bit0(0x05A244) == 1)) && current_stage() == 3 &&
//               stage_screen() == 23 && once(stage_screen() == 23 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_weapon_equipped() == 1 && yamato_spear_ammunition() < prev(yamato_spear_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 2 && wind_storm_ammunition() < prev(wind_storm_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 3 && blizzard_attack_ammunition() < prev(blizzard_attack_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 4 && flame_blast_ammunition() < prev(flame_blast_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 5 && plant_barrier_ammunition() < prev(plant_barrier_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 6 && knight_crush_ammunition() < prev(knight_crush_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 7 && silver_tomahawk_ammunition() < prev(silver_tomahawk_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 8 && centaur_flash_ammunition() < prev(centaur_flash_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 9 && beat_ammunition() < prev(beat_ammunition()))) &&
//               unless(once(energy_tank_quantity_lower_4() < prev(energy_tank_quantity_lower_4()))) &&
//               (always_false() || (never(current_stage() != 3) && never((current_stage() == 3 && stage_screen() == 22)) &&
//                 never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Watchout for not Burn", points = 10,
//     description = "Defeat Flame Man without taking damage [Only in the Robot Master's Stage]",
//     id = 200650, badge = "222903", published = "27/02/2022 21:39:52", modified = "27/02/2022 22:19:14",
//     trigger = trigger_when((boss_hp() == 255 && prev(bit0(0x05A244)) == 0 && bit0(0x05A244) == 1)) && current_stage() == 3 &&
//               stage_screen() == 23 && once(stage_screen() == 23 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_hp() < prev(mega_man_hp()))) &&
//               (always_false() || (never(current_stage() != 3) && never((current_stage() == 3 && stage_screen() == 22)) &&
//                 never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Mega Collector III", points = 2,
//     description = "Get 1 E-Tanks and one 1-ups in Knight Man Stage (No Eddie)",
//     id = 200684, badge = "222937", published = "27/02/2022 21:40:03", modified = "27/02/2022 22:19:15",
//     trigger = once(current_stage() == 6 && prev(bit3(0x05A200)) == 0 && bit3(0x05A200) == 1) &&
//               once(current_stage() == 6 && prev(bit7(0x05A203)) == 0 && bit7(0x05A203) == 1) && never(current_stage() != 6) &&
//               never(in_a_stage() == 0)
// )

// achievement(
//     title = "Knight Crush", points = 5, type="progression",
//     description = "Defeat Knight Man",
//     id = 200651, badge = "222904", published = "27/02/2022 21:39:52", modified = "27/02/2022 22:19:15",
//     trigger = (boss_hp() == 255 && prev(bit1(0x05A245)) == 0 && bit1(0x05A245) == 1) && current_stage() == 6 &&
//               (stage_screen() == 26 || stage_screen() == 23) &&
//               once((stage_screen() == 26 || stage_screen() == 23) && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) && never(current_stage() != 6) &&
//               never((current_stage() == 6 && stage_screen() == 22)) && never((current_stage() == 6 && stage_screen() == 25)) &&
//               never(mega_man_hp() >= 128)
// )

// achievement(
//     title = "Master of the Mace Ball", points = 5,
//     description = "Defeat Knight Man only using the buster and without using E-tanks [Rush's Adapters is OK and Only in the Robot Master's Stage]",
//     id = 200652, badge = "222905", published = "27/02/2022 21:39:53", modified = "29/12/2024 06:24:19",
//     trigger = trigger_when((bit1(0x05A245) > prev(bit1(0x05A245)) || bit2(0x05A245) > prev(bit2(0x05A245))) && boss_hp() == 255) &&
//               current_stage() == 6 && (stage_screen() == 26 || stage_screen() == 23) &&
//               once((stage_screen() == 26 || stage_screen() == 23) && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_weapon_equipped() == 1 && yamato_spear_ammunition() < prev(yamato_spear_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 2 && wind_storm_ammunition() < prev(wind_storm_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 3 && blizzard_attack_ammunition() < prev(blizzard_attack_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 4 && flame_blast_ammunition() < prev(flame_blast_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 5 && plant_barrier_ammunition() < prev(plant_barrier_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 6 && knight_crush_ammunition() < prev(knight_crush_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 7 && silver_tomahawk_ammunition() < prev(silver_tomahawk_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 8 && centaur_flash_ammunition() < prev(centaur_flash_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 9 && beat_ammunition() < prev(beat_ammunition()))) &&
//               unless(once(energy_tank_quantity_lower_4() < prev(energy_tank_quantity_lower_4()))) &&
//               (always_false() || (never(current_stage() != 6) && never((current_stage() == 6 && stage_screen() == 22)) &&
//                 never((current_stage() == 6 && stage_screen() == 25)) && never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Bustering the Shield", points = 10,
//     description = "Defeat Knight Man without taking damage [Only in the Robot Master's Stage]",
//     id = 200653, badge = "222906", published = "27/02/2022 21:39:53", modified = "29/12/2024 06:24:20",
//     trigger = trigger_when((bit1(0x05A245) > prev(bit1(0x05A245)) || bit2(0x05A245) > prev(bit2(0x05A245))) && boss_hp() == 255) &&
//               current_stage() == 6 && (stage_screen() == 26 || stage_screen() == 23) &&
//               once((stage_screen() == 26 || stage_screen() == 23) && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_hp() < prev(mega_man_hp()))) &&
//               (always_false() || (never(current_stage() != 6) && never((current_stage() == 6 && stage_screen() == 22)) &&
//                 never((current_stage() == 6 && stage_screen() == 25)) && never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Mega Collector IV", points = 1,
//     description = "Get a 1-up in Plant Man Stage (No Eddie)",
//     id = 200685, badge = "222938", published = "27/02/2022 21:40:04", modified = "27/02/2022 22:19:16",
//     trigger = once(current_stage() == 2 && prev(bit0(0x05A201)) == 0 && bit0(0x05A201) == 1) && never(current_stage() != 2) &&
//               never(in_a_stage() == 0)
// )

// achievement(
//     title = "Plant Barrier", points = 5, type="progression",
//     description = "Defeat Plant Man",
//     id = 200654, badge = "222907", published = "27/02/2022 21:39:53", modified = "27/02/2022 22:19:17",
//     trigger = (boss_hp() == 255 && prev(bit0(0x05A245)) == 0 && bit0(0x05A245) == 1) && current_stage() == 2 &&
//               stage_screen() == 23 && once(stage_screen() == 23 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) && never(current_stage() != 2) &&
//               never((current_stage() == 2 && stage_screen() == 22)) && never(mega_man_hp() >= 128)
// )

// achievement(
//     title = "Flower Fancier", points = 5,
//     description = "Defeat Plant Man only using the buster and without using E-tanks [Rush's Adapters is OK and Only in the Robot Master's Stage]",
//     id = 200655, badge = "222908", published = "27/02/2022 21:39:54", modified = "27/02/2022 22:19:17",
//     trigger = trigger_when((boss_hp() == 255 && prev(bit0(0x05A245)) == 0 && bit0(0x05A245) == 1)) && current_stage() == 2 &&
//               stage_screen() == 23 && once(stage_screen() == 23 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_weapon_equipped() == 1 && yamato_spear_ammunition() < prev(yamato_spear_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 2 && wind_storm_ammunition() < prev(wind_storm_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 3 && blizzard_attack_ammunition() < prev(blizzard_attack_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 4 && flame_blast_ammunition() < prev(flame_blast_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 5 && plant_barrier_ammunition() < prev(plant_barrier_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 6 && knight_crush_ammunition() < prev(knight_crush_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 7 && silver_tomahawk_ammunition() < prev(silver_tomahawk_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 8 && centaur_flash_ammunition() < prev(centaur_flash_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 9 && beat_ammunition() < prev(beat_ammunition()))) &&
//               unless(once(energy_tank_quantity_lower_4() < prev(energy_tank_quantity_lower_4()))) &&
//               (always_false() || (never(current_stage() != 2) && never((current_stage() == 2 && stage_screen() == 22)) &&
//                 never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Against Plants I Use Flame or Blizzard?", points = 10,
//     description = "Defeat Plant Man without taking damage [Only in the Robot Master's Stage]",
//     id = 200656, badge = "222909", published = "27/02/2022 21:39:54", modified = "27/02/2022 22:19:17",
//     trigger = trigger_when((boss_hp() == 255 && prev(bit0(0x05A245)) == 0 && bit0(0x05A245) == 1)) && current_stage() == 2 &&
//               stage_screen() == 23 && once(stage_screen() == 23 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_hp() < prev(mega_man_hp()))) &&
//               (always_false() || (never(current_stage() != 2) && never((current_stage() == 2 && stage_screen() == 22)) &&
//                 never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Mega Collector V", points = 2,
//     description = "Get 2 E-Tanks in Tomahawk Man Stage (No Eddie)",
//     id = 200686, badge = "222939", published = "27/02/2022 21:40:04", modified = "27/02/2022 22:19:18",
//     trigger = once(current_stage() == 5 && prev(bit5(0x05A200)) == 0 && bit5(0x05A200) == 1) &&
//               once(current_stage() == 5 && prev(bit5(0x05A207)) == 0 && bit5(0x05A207) == 1) && never(current_stage() != 5) &&
//               never(in_a_stage() == 0)
// )

// achievement(
//     title = "Silver Tomahawk", points = 5, type="progression",
//     description = "Defeat Tomahawk Man",
//     id = 200657, badge = "222910", published = "27/02/2022 21:39:54", modified = "27/02/2022 22:19:18",
//     trigger = (boss_hp() == 255 && prev(bit1(0x05A242)) == 0 && bit1(0x05A242) == 1) && current_stage() == 5 &&
//               (stage_screen() == 31 || stage_screen() == 23) &&
//               once((stage_screen() == 31 || stage_screen() == 23) && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) && never(current_stage() != 5) &&
//               never((current_stage() == 5 && stage_screen() == 22)) && never((current_stage() == 6 && stage_screen() == 30)) &&
//               never(mega_man_hp() >= 128)
// )

// achievement(
//     title = "Master of the Tomahawk", points = 5,
//     description = "Defeat Tomahawk Man only using the buster and without using E-tanks [Rush's Adapters is OK and Only in the Robot Master's Stage]",
//     id = 200658, badge = "222911", published = "27/02/2022 21:39:55", modified = "29/12/2024 06:24:20",
//     trigger = trigger_when((bit1(0x05A242) > prev(bit1(0x05A242)) || bit2(0x05A242) > prev(bit2(0x05A242))) && boss_hp() == 255) &&
//               current_stage() == 5 && (stage_screen() == 31 || stage_screen() == 23) &&
//               once((stage_screen() == 31 || stage_screen() == 23) && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_weapon_equipped() == 1 && yamato_spear_ammunition() < prev(yamato_spear_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 2 && wind_storm_ammunition() < prev(wind_storm_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 3 && blizzard_attack_ammunition() < prev(blizzard_attack_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 4 && flame_blast_ammunition() < prev(flame_blast_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 5 && plant_barrier_ammunition() < prev(plant_barrier_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 6 && knight_crush_ammunition() < prev(knight_crush_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 7 && silver_tomahawk_ammunition() < prev(silver_tomahawk_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 8 && centaur_flash_ammunition() < prev(centaur_flash_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 9 && beat_ammunition() < prev(beat_ammunition()))) &&
//               unless(once(energy_tank_quantity_lower_4() < prev(energy_tank_quantity_lower_4()))) &&
//               (always_false() || (never(current_stage() != 5) && never((current_stage() == 5 && stage_screen() == 22)) &&
//                 never((current_stage() == 5 && stage_screen() == 30)) && never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Professional Tomahawk Thrower", points = 10,
//     description = "Defeat Tomahawk Man without taking damage [Only in the Robot Master's Stage]",
//     id = 200659, badge = "222912", published = "27/02/2022 21:39:55", modified = "29/12/2024 06:24:20",
//     trigger = trigger_when((bit1(0x05A242) > prev(bit1(0x05A242)) || bit2(0x05A242) > prev(bit2(0x05A242))) && boss_hp() == 255) &&
//               current_stage() == 5 && (stage_screen() == 31 || stage_screen() == 23) &&
//               once((stage_screen() == 31 || stage_screen() == 23) && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_hp() < prev(mega_man_hp()))) &&
//               (always_false() || (never(current_stage() != 5) && never((current_stage() == 5 && stage_screen() == 22)) &&
//                 never((current_stage() == 5 && stage_screen() == 30)) && never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Mega Collector VI", points = 2,
//     description = "Get 1 E-Tanks and one 1-ups in Wind Man Stage",
//     id = 200687, badge = "222940", published = "27/02/2022 21:40:04", modified = "27/02/2022 22:19:19",
//     trigger = once(current_stage() == 1 && prev(bit5(0x05A204)) == 0 && bit5(0x05A204) == 1) &&
//               once(current_stage() == 1 && prev(bit2(0x05A205)) == 0 && bit2(0x05A205) == 1) && never(current_stage() != 1) &&
//               never(in_a_stage() == 0)
// )

// achievement(
//     title = "Wind Storm", points = 5, type="progression",
//     description = "Defeat Wind Man",
//     id = 200660, badge = "222913", published = "27/02/2022 21:39:55", modified = "27/02/2022 22:19:19",
//     trigger = (boss_hp() == 255 && prev(bit0(0x05A243)) == 0 && bit0(0x05A243) == 1) && current_stage() == 1 &&
//               stage_screen() == 21 && once(stage_screen() == 21 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) && never(current_stage() != 1) &&
//               never((current_stage() == 1 && stage_screen() == 20)) && never(mega_man_hp() >= 128)
// )

// achievement(
//     title = "Master of the Wind", points = 5,
//     description = "Defeat Wind Man only using the buster and without using E-tanks [Rush's Adapters is OK and Only in the Robot Master's Stage]",
//     id = 200661, badge = "222914", published = "27/02/2022 21:39:56", modified = "27/02/2022 22:19:20",
//     trigger = trigger_when((boss_hp() == 255 && prev(bit0(0x05A243)) == 0 && bit0(0x05A243) == 1)) && current_stage() == 1 &&
//               stage_screen() == 21 && once(stage_screen() == 21 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_weapon_equipped() == 1 && yamato_spear_ammunition() < prev(yamato_spear_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 2 && wind_storm_ammunition() < prev(wind_storm_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 3 && blizzard_attack_ammunition() < prev(blizzard_attack_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 4 && flame_blast_ammunition() < prev(flame_blast_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 5 && plant_barrier_ammunition() < prev(plant_barrier_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 6 && knight_crush_ammunition() < prev(knight_crush_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 7 && silver_tomahawk_ammunition() < prev(silver_tomahawk_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 8 && centaur_flash_ammunition() < prev(centaur_flash_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 9 && beat_ammunition() < prev(beat_ammunition()))) &&
//               unless(once(energy_tank_quantity_lower_4() < prev(energy_tank_quantity_lower_4()))) &&
//               (always_false() || (never(current_stage() != 1) && never((current_stage() == 1 && stage_screen() == 20)) &&
//                 never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Faster than Wind", points = 10,
//     description = "Defeat Wind Man without taking damage [Only in the Robot Master's Stage]",
//     id = 200662, badge = "222915", published = "27/02/2022 21:39:56", modified = "27/02/2022 22:19:20",
//     trigger = trigger_when((boss_hp() == 255 && prev(bit0(0x05A243)) == 0 && bit0(0x05A243) == 1)) && current_stage() == 1 &&
//               stage_screen() == 21 && once(stage_screen() == 21 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_hp() < prev(mega_man_hp()))) &&
//               (always_false() || (never(current_stage() != 1) && never((current_stage() == 1 && stage_screen() == 20)) &&
//                 never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Mega Collector VII", points = 2,
//     description = "Get 1 E-Tanks and one 1-ups in Yamato Man Stage",
//     id = 200688, badge = "222941", published = "27/02/2022 21:40:05", modified = "27/02/2022 22:19:20",
//     trigger = once(current_stage() == 4 && prev(bit6(0x05A200)) == 0 && bit6(0x05A200) == 1) &&
//               once(current_stage() == 4 && prev(bit7(0x05A203)) == 0 && bit7(0x05A203) == 1) && never(current_stage() != 4) &&
//               never(in_a_stage() == 0)
// )

// achievement(
//     title = "Yamato Spear", points = 5, type="progression",
//     description = "Defeat Yamato Man",
//     id = 200663, badge = "222916", published = "27/02/2022 21:39:56", modified = "27/02/2022 22:19:21",
//     trigger = (boss_hp() == 255 && prev(bit1(0x05A243)) == 0 && bit1(0x05A243) == 1) && current_stage() == 4 &&
//               (stage_screen() == 29 || stage_screen() == 23) &&
//               once((stage_screen() == 29 || stage_screen() == 23) && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) && never(current_stage() != 4) &&
//               never((current_stage() == 4 && stage_screen() == 22)) && never((current_stage() == 4 && stage_screen() == 28)) &&
//               never(mega_man_hp() >= 128)
// )

// achievement(
//     title = "Master of the Spear", points = 5,
//     description = "Defeat Yamato Man only using the buster and without using E-tanks [Rush's Adapters is OK and Only in the Robot Master's Stage]",
//     id = 200664, badge = "222917", published = "27/02/2022 21:39:57", modified = "29/12/2024 06:24:20",
//     trigger = trigger_when((bit1(0x05A243) > prev(bit1(0x05A243)) || bit2(0x05A243) > prev(bit2(0x05A243))) && boss_hp() == 255) &&
//               current_stage() == 4 && (stage_screen() == 29 || stage_screen() == 23) &&
//               once((stage_screen() == 29 || stage_screen() == 23) && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_weapon_equipped() == 1 && yamato_spear_ammunition() < prev(yamato_spear_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 2 && wind_storm_ammunition() < prev(wind_storm_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 3 && blizzard_attack_ammunition() < prev(blizzard_attack_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 4 && flame_blast_ammunition() < prev(flame_blast_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 5 && plant_barrier_ammunition() < prev(plant_barrier_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 6 && knight_crush_ammunition() < prev(knight_crush_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 7 && silver_tomahawk_ammunition() < prev(silver_tomahawk_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 8 && centaur_flash_ammunition() < prev(centaur_flash_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 9 && beat_ammunition() < prev(beat_ammunition()))) &&
//               unless(once(energy_tank_quantity_lower_4() < prev(energy_tank_quantity_lower_4()))) &&
//               (always_false() || (never(current_stage() != 4) && never((current_stage() == 4 && stage_screen() == 22)) &&
//                 never((current_stage() == 4 && stage_screen() == 28)) && never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "You can Call him of Galactic Spear", points = 10,
//     description = "Defeat Yamato Man without taking damage [Only in the Robot Master's Stage]",
//     id = 200665, badge = "222918", published = "27/02/2022 21:39:57", modified = "29/12/2024 06:24:21",
//     trigger = trigger_when((bit1(0x05A243) > prev(bit1(0x05A243)) || bit2(0x05A243) > prev(bit2(0x05A243))) && boss_hp() == 255) &&
//               current_stage() == 4 && (stage_screen() == 29 || stage_screen() == 23) &&
//               once((stage_screen() == 29 || stage_screen() == 23) && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_hp() < prev(mega_man_hp()))) &&
//               (always_false() || (never(current_stage() != 4) && never((current_stage() == 4 && stage_screen() == 22)) &&
//                 never((current_stage() == 4 && stage_screen() == 28)) && never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Wow Nice Secret!", points = 2,
//     description = "Find another path in Mr. X Stage 1",
//     id = 200690, badge = "222943", published = "27/02/2022 21:40:05", modified = "27/02/2022 22:19:22",
//     trigger = (once(current_stage() == 8 && stage_screen() == 6) && prev(stage_screen()) == 17 && stage_screen() == 18) &&
//               never(current_stage() != 8) && never(in_a_stage() == 0)
// )

// achievement(
//     title = "Mega Collector VIII", points = 1,
//     description = "Get 1 E-Tank in Mr. X Stage 1",
//     id = 200689, badge = "222942", published = "27/02/2022 21:40:05", modified = "27/02/2022 22:19:22",
//     trigger = once(current_stage() == 8 && prev(bit7(0x05A203)) == 0 && bit7(0x05A203) == 1) && never(current_stage() != 8) &&
//               never(in_a_stage() == 0)
// )

// achievement(
//     title = "Entering the Fortress I", points = 5, type="progression",
//     description = "Defeat 'Rounder 2",
//     id = 200666, badge = "222919", published = "27/02/2022 21:39:57", modified = "27/02/2022 22:19:22",
//     trigger = (boss_hp() == 255 && music_id() == 50977) || music_id() == 30033 && current_stage() == 8 &&
//               stage_screen() == 17 && once(stage_screen() == 17 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) && never(current_stage() != 8) &&
//               never((current_stage() == 8 && stage_screen() == 16)) && never(mega_man_hp() >= 128)
// )

// achievement(
//     title = "Two Against One?", points = 10,
//     description = "Defeat 'Rounder 2 without taking damage",
//     id = 200667, badge = "222920", published = "27/02/2022 21:39:58", modified = "27/02/2022 22:19:23",
//     trigger = trigger_when((boss_hp() == 255 && music_id() == 50977) || music_id() == 30033) && current_stage() == 8 &&
//               stage_screen() == 17 && once(stage_screen() == 17 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_hp() < prev(mega_man_hp()))) &&
//               (always_false() || (never(current_stage() != 8) && never((current_stage() == 8 && stage_screen() == 16)) &&
//                 never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Going Further into the Fortress I", points = 5, type="progression",
//     description = "Defeat Power Piston",
//     id = 200668, badge = "222921", published = "27/02/2022 21:39:58", modified = "27/02/2022 22:19:23",
//     trigger = (boss_hp() == 255 && music_id() == 50977) || music_id() == 30033 && current_stage() == 9 &&
//               stage_screen() == 17 && once(stage_screen() == 17 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) && never(current_stage() != 9) &&
//               never((current_stage() == 9 && stage_screen() == 16)) && never(mega_man_hp() >= 128)
// )

// achievement(
//     title = "'Coé Menor, Olha a PEDRA!!'", points = 10,
//     description = "Defeat Power Piston without taking damage",
//     id = 200669, badge = "222922", published = "27/02/2022 21:39:58", modified = "27/02/2022 22:19:23",
//     trigger = trigger_when((boss_hp() == 255 && music_id() == 50977) || music_id() == 30033) && current_stage() == 9 &&
//               stage_screen() == 17 && once(stage_screen() == 17 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_hp() < prev(mega_man_hp()))) &&
//               (always_false() || (never(current_stage() != 9) && never((current_stage() == 9 && stage_screen() == 16)) &&
//                 never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Mega Collector IX", points = 3,
//     description = "Get 2 E-Tanks and one 1-ups in Mr. X Stage 3",
//     id = 200691, badge = "222944", published = "27/02/2022 21:40:06", modified = "27/02/2022 22:19:24",
//     trigger = once(current_stage() == 10 && prev(bit2(0x05A200)) == 0 && bit2(0x05A200) == 1) &&
//               once(current_stage() == 10 && prev(bit6(0x05A200)) == 0 && bit6(0x05A200) == 1) &&
//               once(current_stage() == 10 && prev(bit3(0x05A205)) == 0 && bit3(0x05A205) == 1) && never(current_stage() != 10) &&
//               never(in_a_stage() == 0)
// )

// achievement(
//     title = "Near to the End of the Fortress I", points = 5, type="progression",
//     description = "Defeat Metonger Z",
//     id = 200670, badge = "222923", published = "27/02/2022 21:39:59", modified = "27/02/2022 22:19:24",
//     trigger = (boss_hp() == 255 && music_id() == 50977) || music_id() == 30033 && current_stage() == 10 &&
//               stage_screen() == 17 && once(stage_screen() == 17 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) && never(current_stage() != 10) &&
//               never((current_stage() == 10 && stage_screen() == 16)) && never(mega_man_hp() >= 128)
// )

// achievement(
//     title = "Met in a Megazord", points = 10,
//     description = "Defeat Metonger Z without taking damage",
//     id = 200671, badge = "222924", published = "27/02/2022 21:39:59", modified = "27/02/2022 22:19:24",
//     trigger = trigger_when((boss_hp() == 255 && music_id() == 50977) || music_id() == 30033) && current_stage() == 10 &&
//               stage_screen() == 17 && once(stage_screen() == 17 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_hp() < prev(mega_man_hp()))) &&
//               (always_false() || (never(current_stage() != 10) && never((current_stage() == 10 && stage_screen() == 16)) &&
//                 never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Mega Collector X", points = 3,
//     description = "Get 2 E-Tanks and one 1-ups in Mr. X Stage 4",
//     id = 200692, badge = "222945", published = "27/02/2022 21:40:06", modified = "27/02/2022 22:19:25",
//     trigger = once(current_stage() == 11 && prev(bit1(0x05A202)) == 0 && bit1(0x05A202) == 1) &&
//               once(current_stage() == 11 && prev(bit1(0x05A206)) == 0 && bit1(0x05A206) == 1) &&
//               once(current_stage() == 11 && prev(bit7(0x05A206)) == 0 && bit7(0x05A206) == 1) && never(current_stage() != 11) &&
//               never(in_a_stage() == 0)
// )

// achievement(
//     title = "I'm not Surprised for See You Again Dr. Wily", points = 5, type="progression",
//     description = "Defeat Mr. X?",
//     id = 200672, badge = "222925", published = "27/02/2022 21:39:59", modified = "27/02/2022 22:19:25",
//     trigger = (boss_hp() == 255 && music_id() == 50738) || music_id() == 28562 && current_stage() == 11 &&
//               stage_screen() == 21 && once(stage_screen() == 21 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               once(once(in_a_stage() == 1) || in_a_stage() == 3) && never(current_stage() != 11) &&
//               never((current_stage() == 11 && stage_screen() != 0 && stage_screen() == 20)) &&
//               never(mega_man_hp() >= 128)
// )

// achievement(
//     title = "First Time?", points = 10,
//     description = "Defeat Mr. X without taking damage",
//     id = 200673, badge = "222926", published = "27/02/2022 21:40:00", modified = "27/02/2022 22:19:25",
//     trigger = trigger_when((boss_hp() == 255 && music_id() == 50738) || music_id() == 28562) && current_stage() == 11 &&
//               stage_screen() == 21 && once(stage_screen() == 21 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               once(once(in_a_stage() == 1) || in_a_stage() == 3) &&
//               unless(once(mega_man_hp() < prev(mega_man_hp()))) &&
//               (always_false() || (never(current_stage() != 11) && never((current_stage() == 11 && stage_screen() != 0 && stage_screen() == 20)) &&
//                 never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Mega Collector XI", points = 2,
//     description = "Get 1 E-Tanks and one 1-ups in Dr. Wily Stage 1",
//     id = 200693, badge = "222946", published = "27/02/2022 21:40:06", modified = "27/02/2022 22:19:26",
//     trigger = once(current_stage() == 12 && prev(bit4(0x05A200)) == 0 && bit4(0x05A200) == 1) &&
//               once(current_stage() == 12 && prev(bit3(0x05A207)) == 0 && bit3(0x05A207) == 1) && never(current_stage() != 12) &&
//               never(in_a_stage() == 0)
// )

// achievement(
//     title = "Entering the Fortress II", points = 5, type="progression",
//     description = "Defeat Mechazaurus",
//     id = 200674, badge = "222927", published = "27/02/2022 21:40:00", modified = "27/02/2022 22:19:26",
//     trigger = (boss_hp() == 255 && music_id() == 50977) || music_id() == 30033 && current_stage() == 12 &&
//               stage_screen() == 19 && once(stage_screen() == 19 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) && never(current_stage() != 12) &&
//               never((current_stage() == 18 && stage_screen() == 18)) && never(mega_man_hp() >= 128)
// )

// achievement(
//     title = "Robotized Jurassic Park", points = 10,
//     description = "Defeat Mechazaurus without taking damage",
//     id = 200675, badge = "222928", published = "27/02/2022 21:40:00", modified = "27/02/2022 22:19:26",
//     trigger = trigger_when((boss_hp() == 255 && music_id() == 50977) || music_id() == 30033) && current_stage() == 12 &&
//               stage_screen() == 19 && once(stage_screen() == 19 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_hp() < prev(mega_man_hp()))) &&
//               (always_false() || (never(current_stage() != 12) && never((current_stage() == 12 && stage_screen() == 18)) &&
//                 never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Mega Collector XII", points = 2,
//     description = "Get 2 E-Tanks in Dr. Wily Stage 2",
//     id = 200694, badge = "222947", published = "27/02/2022 21:40:07", modified = "27/02/2022 22:19:27",
//     trigger = once(current_stage() == 13 && prev(bit0(0x05A200)) == 0 && bit0(0x05A200) == 1) &&
//               once(current_stage() == 13 && prev(bit7(0x05A203)) == 0 && bit7(0x05A203) == 1) && never(current_stage() != 13) &&
//               never(in_a_stage() == 0)
// )

// achievement(
//     title = "Going Further into the Fortress II", points = 5, type="progression",
//     description = "Defeat Tank-CS2",
//     id = 200676, badge = "222929", published = "27/02/2022 21:40:01", modified = "27/02/2022 22:19:27",
//     trigger = (boss_hp() == 255 && music_id() == 50977) || music_id() == 30033 && current_stage() == 13 &&
//               stage_screen() == 15 && once(stage_screen() == 15 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) && never(current_stage() != 13) &&
//               never((current_stage() == 13 && stage_screen() == 14)) && never(mega_man_hp() >= 128)
// )

// achievement(
//     title = "Elite Tank", points = 10,
//     description = "Defeat Tank-CS2 without taking damage",
//     id = 200677, badge = "222930", published = "27/02/2022 21:40:01", modified = "27/02/2022 22:19:27",
//     trigger = trigger_when((boss_hp() == 255 && music_id() == 50977) || music_id() == 30033) && current_stage() == 13 &&
//               stage_screen() == 15 && once(stage_screen() == 15 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(mega_man_hp() < prev(mega_man_hp()))) &&
//               (always_false() || (never(current_stage() != 13) && never((current_stage() == 13 && stage_screen() == 14)) &&
//                 never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Mega Collector XIII", points = 1,
//     description = "Get 1 E-Tank in Dr. Wily Stage 3",
//     id = 200695, badge = "222948", published = "27/02/2022 21:40:07", modified = "27/02/2022 22:19:28",
//     trigger = once(current_stage() == 14 && prev(bit5(0x05A200)) == 0 && bit5(0x05A200) == 1) && never(current_stage() != 14) &&
//               never(in_a_stage() == 0)
// )

// achievement(
//     title = "Near to the End of the Fortress II", points = 5, type="progression",
//     description = "Defeat the Terrible Boss Rush *Sad Face*",
//     id = 200678, badge = "222931", published = "27/02/2022 21:40:01", modified = "17/04/2022 01:32:39",
//     trigger = (music_id() == 50738 || music_id() == 28562) && current_stage() == 14 && stage_screen() == 8 &&
//               once(once(in_a_stage() == 1) || in_a_stage() == 3) && never(current_stage() != 14) &&
//               never((current_stage() == 14 && stage_screen() == 0)) && never(mega_man_hp() >= 128)
// )

// achievement(
//     title = "A Traditional Boring Moment", points = 10,
//     description = "Complete the Terrible Boss Rush only using the buster and without using E-tanks [Rush's Adapters is OK]",
//     id = 200679, badge = "222932", published = "27/02/2022 21:40:02", modified = "17/04/2022 01:32:39",
//     trigger = trigger_when((music_id() == 50738 || music_id() == 28562)) && once(stage_screen() == 8) &&
//               current_stage() == 14 && once(once(in_a_stage() == 1) || in_a_stage() == 3) &&
//               unless(once(energy_tank_quantity_lower_4() < prev(energy_tank_quantity_lower_4()))) &&
//               unless(once(mega_man_weapon_equipped() == 1 && yamato_spear_ammunition() < prev(yamato_spear_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 2 && wind_storm_ammunition() < prev(wind_storm_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 3 && blizzard_attack_ammunition() < prev(blizzard_attack_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 4 && flame_blast_ammunition() < prev(flame_blast_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 5 && plant_barrier_ammunition() < prev(plant_barrier_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 6 && knight_crush_ammunition() < prev(knight_crush_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 7 && silver_tomahawk_ammunition() < prev(silver_tomahawk_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 8 && centaur_flash_ammunition() < prev(centaur_flash_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 9 && beat_ammunition() < prev(beat_ammunition()))) &&
//               unless(once(energy_tank_quantity_lower_4() < prev(energy_tank_quantity_lower_4()))) &&
//               (always_false() || (never(current_stage() != 14) && never((current_stage() == 14 && stage_screen() == 0)) &&
//                 never((current_stage() == 14 && stage_screen() == 7)) && never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "I Got you Again...", points = 10, type="win_condition",
//     description = "Defeat Wily and Beat the game",
//     id = 200680, badge = "222933", published = "27/02/2022 21:40:02", modified = "27/02/2022 22:19:29",
//     trigger = (boss_hp() == 255 && music_id() == 50868) || music_id() == 29335 && current_stage() == 15 &&
//               stage_screen() == 6 && once(stage_screen() == 6 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) && never(current_stage() != 15) &&
//               never((current_stage() == 15 && stage_screen() == 5)) && never(mega_man_hp() >= 128)
// )

// achievement(
//     title = "Man this is Sixth Time I Defeat You", points = 10,
//     description = "Defeat Wily only using the buster and without using E-tanks [Rush's Adapters is OK]",
//     id = 200681, badge = "222934", published = "27/02/2022 21:40:02", modified = "27/02/2022 22:19:29",
//     trigger = trigger_when((boss_hp() == 255 && music_id() == 50868) || music_id() == 29335) && current_stage() == 15 &&
//               stage_screen() == 6 && once(stage_screen() == 6 && boss_hp() != 255 && boss_hp() > prev(boss_hp())) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) &&
//               unless(once(energy_tank_quantity_lower_4() < prev(energy_tank_quantity_lower_4()))) &&
//               unless(once(mega_man_weapon_equipped() == 1 && yamato_spear_ammunition() < prev(yamato_spear_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 2 && wind_storm_ammunition() < prev(wind_storm_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 3 && blizzard_attack_ammunition() < prev(blizzard_attack_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 4 && flame_blast_ammunition() < prev(flame_blast_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 5 && plant_barrier_ammunition() < prev(plant_barrier_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 6 && knight_crush_ammunition() < prev(knight_crush_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 7 && silver_tomahawk_ammunition() < prev(silver_tomahawk_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 8 && centaur_flash_ammunition() < prev(centaur_flash_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 9 && beat_ammunition() < prev(beat_ammunition()))) &&
//               unless(once(energy_tank_quantity_lower_4() < prev(energy_tank_quantity_lower_4()))) &&
//               (always_false() || (never(current_stage() != 15) && never((current_stage() == 15 && stage_screen() == 5)) &&
//                 never(mega_man_hp() >= 128)))
// )

// achievement(
//     title = "Here Go Again", points = 10,
//     description = "Beat all 8 Robot Masters Stages without a Game Over",
//     id = 200697, badge = "222950", published = "27/02/2022 21:40:08", modified = "27/02/2022 22:19:29",
//     trigger = trigger_when(once(current_stage() == 0 && boss_hp() == 255 && prev(bit0(0x05A242)) == 0 && bit0(0x05A242) == 1)) &&
//               trigger_when(once(current_stage() == 5 && boss_hp() == 255 && prev(bit1(0x05A242)) == 0 && bit1(0x05A242) == 1)) &&
//               trigger_when(once(current_stage() == 1 && boss_hp() == 255 && prev(bit0(0x05A243)) == 0 && bit0(0x05A243) == 1)) &&
//               trigger_when(once(current_stage() == 4 && boss_hp() == 255 && prev(bit1(0x05A243)) == 0 && bit1(0x05A243) == 1)) &&
//               trigger_when(once(current_stage() == 3 && boss_hp() == 255 && prev(bit0(0x05A244)) == 0 && bit0(0x05A244) == 1)) &&
//               trigger_when(once(current_stage() == 7 && boss_hp() == 255 && prev(bit1(0x05A244)) == 0 && bit1(0x05A244) == 1)) &&
//               trigger_when(once(current_stage() == 2 && boss_hp() == 255 && prev(bit0(0x05A245)) == 0 && bit0(0x05A245) == 1)) &&
//               trigger_when(once(current_stage() == 6 && boss_hp() == 255 && prev(bit1(0x05A245)) == 0 && bit1(0x05A245) == 1)) &&
//               once(once(music_id() == 36) || music_id() == 37700) && unless(once(music_id() == 30085)) &&
//               unless(once(music_id() == 51067)) && unless(once(prev(music_id()) == 49901 && music_id() == 38)) &&
//               unless(once(prev(music_id()) == 25120 && music_id() == 40488)) && unless(once(current_stage() >= 8)) &&
//               (always_false() || (never(music_id() == 49901) && never(music_id() == 25120)))
// )

// achievement(
//     title = "Game Over to you Wily", points = 10,
//     description = "Beat all Mr. X and Dr. Wily Stages without a Game Over",
//     id = 200700, badge = "222953", published = "27/02/2022 21:40:09", modified = "27/02/2022 22:19:30",
//     trigger = trigger_when((boss_hp() == 255 && music_id() == 50868) || music_id() == 29335) &&
//               trigger_when(current_stage() == 15) && once(current_stage() == 8) && trigger_when(stage_screen() == 6) &&
//               trigger_when(once(stage_screen() == 6 && boss_hp() != 255 && boss_hp() > prev(boss_hp()))) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) && unless(once(music_id() == 30085)) &&
//               unless(once(music_id() == 51067)) && unless(once(prev(music_id()) == 49901 && music_id() == 38)) &&
//               unless(once(prev(music_id()) == 25120 && music_id() == 40488)) &&
//               (always_false() || (never(music_id() == 49901) && never(music_id() == 25120) && never(current_stage() < 8) &&
//                 never(music_id() == 36) && never(music_id() == 37700)))
// )

// achievement(
//     title = "A Robot and your Dog", points = 10,
//     description = "Beat all Mr. X Stages only using the buster [Rush's Adapters is OK]",
//     id = 200699, badge = "222952", published = "27/02/2022 21:40:08", modified = "27/02/2022 22:19:30",
//     trigger = trigger_when((boss_hp() == 255 && music_id() == 50738) || music_id() == 28562) && once(current_stage() == 8) &&
//               trigger_when(current_stage() == 11) && trigger_when(stage_screen() == 21) &&
//               trigger_when(once(stage_screen() == 21 && boss_hp() != 255 && boss_hp() > prev(boss_hp()))) &&
//               once(once(in_a_stage() == 1) || in_a_stage() == 3) &&
//               unless(once(mega_man_weapon_equipped() == 1 && yamato_spear_ammunition() < prev(yamato_spear_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 2 && wind_storm_ammunition() < prev(wind_storm_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 3 && blizzard_attack_ammunition() < prev(blizzard_attack_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 4 && flame_blast_ammunition() < prev(flame_blast_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 5 && plant_barrier_ammunition() < prev(plant_barrier_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 6 && knight_crush_ammunition() < prev(knight_crush_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 7 && silver_tomahawk_ammunition() < prev(silver_tomahawk_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 8 && centaur_flash_ammunition() < prev(centaur_flash_ammunition()))) &&
//               unless(once(mega_man_weapon_equipped() == 9 && beat_ammunition() < prev(beat_ammunition()))) &&
//               (always_false() || (never(music_id() == 49901) && never(music_id() == 25120) && never(current_stage() > 11) &&
//                 never(current_stage() < 8) && never(music_id() == 36) && never(music_id() == 37700)))
// )

// achievement(
//     title = "Flash Man", points = 10,
//     description = "Defeat Wily and Beat the game in less 70 minutes in game time",
//     id = 200701, badge = "222954", published = "27/02/2022 21:40:09", modified = "27/02/2022 22:19:30",
//     trigger = trigger_when((boss_hp() == 255 && music_id() == 50868) || music_id() == 29335) &&
//               trigger_when(current_stage() == 15) && trigger_when(stage_screen() == 6) &&
//               trigger_when(once(stage_screen() == 6 && boss_hp() != 255 && boss_hp() > prev(boss_hp()))) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) && once(once(music_id() == 36) || music_id() == 37700) &&
//               unless(once(game_time_minutes() >= 70 && game_time_seconds() >= 0 && game_time_milisseconds() >= 0)) &&
//               unless(once(prev(music_id()) == 49901 && music_id() == 38)) &&
//               unless(once(prev(music_id()) == 25120 && music_id() == 40488)) &&
//               (always_false() || (never(music_id() == 49901) && never(music_id() == 25120)))
// )

// achievement(
//     title = "The Fastest Robot Ever", points = 25,
//     description = "Defeat Wily and Beat the game in less 50 minutes in game time",
//     id = 200702, badge = "222955", published = "27/02/2022 21:40:09", modified = "27/02/2022 22:19:31",
//     trigger = trigger_when((boss_hp() == 255 && music_id() == 50868) || music_id() == 29335) &&
//               trigger_when(current_stage() == 15) && trigger_when(stage_screen() == 6) &&
//               trigger_when(once(stage_screen() == 6 && boss_hp() != 255 && boss_hp() > prev(boss_hp()))) &&
//               (in_a_stage() == 1 || in_a_stage() == 3) && once(once(music_id() == 36) || music_id() == 37700) &&
//               unless(once(game_time_minutes() >= 50 && game_time_seconds() >= 0 && game_time_milisseconds() >= 0)) &&
//               unless(once(prev(music_id()) == 49901 && music_id() == 38)) &&
//               unless(once(prev(music_id()) == 25120 && music_id() == 40488)) &&
//               (always_false() || (never(music_id() == 49901) && never(music_id() == 25120)))
// )

// achievement(
//     title = "Don't Stop the Music", points = 5,
//     description = "Complete the Mission Mode and Unlock the sound test",
//     id = 200698, badge = "222951", published = "27/02/2022 21:40:08", modified = "27/02/2022 22:19:31",
//     trigger = (prev(menu_extra_unlocked_sound_test()) == 0 && menu_extra_unlocked_sound_test() == 1) &&
//               mission_mode_mission_unlocked() == 3
// )

// =========================================
//                Leaderboards              
// =========================================

// Original
leaderboard("Original Mode Speedrun - Easy", "Best time to finish the game in Original Mode on Easy difficulty",
           start = mode_indicator() == 0 && game_difficulty() == 0 && stages_beaten_32bits_combo() == 0 && prev(game_time_frames()) == 0x00 && game_time_frames() > prev(game_time_frames()),
           cancel = music_id() == 0xc2ed || music_id() == 0x6220 || music_id() == 0x941b,
           submit = __ornext(music_id() == 50868 || music_id() == 29335) && current_stage() == 15 && stage_screen() == 6,
           value = game_time_frames(),
           format = "FRAMES", lower_is_better=true
           )

leaderboard("Original Mode Speedrun - Normal", "Best time to finish the game in Original Mode on Normal difficulty",
           start = mode_indicator() == 0 && game_difficulty() == 1 && stages_beaten_32bits_combo() == 0 && prev(game_time_frames()) == 0x00 && game_time_frames() > prev(game_time_frames()),
           cancel = music_id() == 0xc2ed || music_id() == 0x6220 || music_id() == 0x941b,
           submit = __ornext(music_id() == 50868 || music_id() == 29335) && current_stage() == 15 && stage_screen() == 6,
           value = game_time_frames(),
           format = "FRAMES", lower_is_better=true
           )

leaderboard("Original Mode Speedrun - Hard", "Best time to finish the game in Original Mode on Hard difficulty",
           start = mode_indicator() == 0 && game_difficulty() == 2 && stages_beaten_32bits_combo() == 0 && prev(game_time_frames()) == 0x00 && game_time_frames() > prev(game_time_frames()),
           cancel = music_id() == 0xc2ed || music_id() == 0x6220 || music_id() == 0x941b,
           submit = __ornext(music_id() == 50868 || music_id() == 29335) && current_stage() == 15 && stage_screen() == 6,
           value = game_time_frames(),
           format = "FRAMES", lower_is_better=true
           )


// NAVI
leaderboard("Navi Mode Speedrun - Easy", "Best time to finish the game in Navi Mode on Easy difficulty",
           start = mode_indicator() == 1 && game_difficulty() == 0 && stages_beaten_32bits_combo() == 0 && prev(game_time_frames()) == 0x00 && game_time_frames() > prev(game_time_frames()),
           cancel = music_id() == 0xc2ed || music_id() == 0x6220 || music_id() == 0x941b,
           submit = __ornext(music_id() == 50868 || music_id() == 29335) && current_stage() == 15 && stage_screen() == 6,
           value = game_time_frames(),
           format = "FRAMES", lower_is_better=true
           )

leaderboard("Navi Mode Speedrun - Normal", "Best time to finish the game in Navi Mode on Normal difficulty",
           start = mode_indicator() == 1 && game_difficulty() == 1 && stages_beaten_32bits_combo() == 0 && prev(game_time_frames()) == 0x00 && game_time_frames() > prev(game_time_frames()),
           cancel = music_id() == 0xc2ed || music_id() == 0x6220 || music_id() == 0x941b,
           submit = __ornext(music_id() == 50868 || music_id() == 29335) && current_stage() == 15 && stage_screen() == 6,
           value = game_time_frames(),
           format = "FRAMES", lower_is_better=true
           )

leaderboard("Navi Mode Speedrun - Hard", "Best time to finish the game in Navi Mode on Hard difficulty",
           start = mode_indicator() == 1 && game_difficulty() == 2 && stages_beaten_32bits_combo() == 0 && prev(game_time_frames()) == 0x00 && game_time_frames() > prev(game_time_frames()),
           cancel = music_id() == 0xc2ed || music_id() == 0x6220 || music_id() == 0x941b,
           submit = __ornext(music_id() == 50868 || music_id() == 29335) && current_stage() == 15 && stage_screen() == 6,
           value = game_time_frames(),
           format = "FRAMES", lower_is_better=true
           )