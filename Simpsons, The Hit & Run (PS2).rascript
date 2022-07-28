// Simpsons, The: Hit & Run
// #ID = 19010

// =========================================
//             Memory Acessors              
// =========================================

function game_context() => dword(0x652B68)
         ctx_booting = 1
         ctx_main_menu = 2
         ctx_demo_loading = 3
         ctx_demo_playing = 4
         ctx_bonus_game_lobby = 5
         ctx_bonus_game_loading = 6
         ctx_bonus_game_playing = 7
         ctx_normal_game_loading = 8
         ctx_normal_game_playing = 9
         ctx_paused = 10

function cheats_bitflag1() => byte(0x4244F4)
function cheats_bitflag2() => byte(0x4244F5)
function cheats_bitflag3() => byte(0x4244F6)

function pointer_player() => dword(0x42d7b8)
         offset_char_surfing_on_vehicle = 0x9a
         offset_char_vel_x = 0x110
         offset_char_vel_y = 0x114
         offset_char_vel_z = 0x118
         offset_char_inside_vehicle = 0x120
         offset_char_kickwaving = 0x369
         offset_char_position_x = 0x390
         offset_char_position_y = 0x394
         offset_char_position_z = 0x398

function pointer_mission() => dword(0x5d43f8)
function pointer_bonus_game() => dword(0x433358)
         offset_bonus_game_state = 0x19B4
         offset_bonus_game_p1_lap_time = 0x1A48
         offset_bonus_game_p1_best_lap = 0x1A4C
         offset_bonus_game_total_time = 0x1A50
         offset_bonus_game_p1_num_laps = 0x1A54
         offset_bonus_game_p1_position = 0x1A55
         offset_bonus_game_p1_points = 0x1A56
         offset_bonus_game_p1_wins = 0x1A57
         offset_bonus_game_active_humans = 0x1B9C
         offset_bonus_game_level_laps = 0x1BA8

// entity array stuff
max_entities = 64
array_characters_pointer_start = 0x5febe0
array_characters_name_start = 0x5fece0 // 64 bytes string
array_characters_loaded_start = 0x600ce0

// Player
function player_name() => byte(0x5E5BE4)
function player_surfing_on_vehicle() => bit0(pointer_player() + offset_char_surfing_on_vehicle)
function player_inside_vehicle() => bit0(pointer_player() + offset_char_inside_vehicle)
function player_velocity_x() => float(pointer_player() + offset_char_vel_x)
function player_velocity_y() => float(pointer_player() + offset_char_vel_y)
function player_velocity_z() => float(pointer_player() + offset_char_vel_z)
function player_position_x() => float(pointer_player() + offset_char_position_x)
function player_position_y() => float(pointer_player() + offset_char_position_y)
function player_position_z() => float(pointer_player() + offset_char_position_z)

// Mission
function mission_stage() => dword(pointer_mission() + 0x70)
function mission_name_2bytes() => word(pointer_mission() + 0x78)
         m_name_wager = 0x7267
         m_name_race = 0x7273
         
function mission_remaining_time() => dword(pointer_mission() + 0x90)
function mission_super_state() => dword(0x5fdd50)
function mission_state() => dword(pointer_mission() + 0x98)
         m_state_waiting = 0
         m_state_inprogress = 1
         m_state_failed = 2
         m_state_success = 3

function mission_stage_state() => dword(pointer_mission() + 0x9c)
function mission_outside_mission() => bit0(pointer_mission() + 0xb8)


function current_level() => dword(0x610378)
function current_mission() => dword(0x5E6CEC)
function highest_level_played() => dword(0x5E6CF0)
function highest_mission_played() => dword(0x5E6CF4)
function coins() => dword(0x5E6CFC)
function total_cars_owned() => dword(0x5E72A0)
function current_vehicle() => byte(0x61026C)

vehicles = {
   "Ferrini - Red": 0, // Level 6 default
   "Longhorn": 1, // Level 5 default
   "Bandit": 2,
   "70's Sports Car": 3, // Level 7 default
   "Family Sedan": 4, // Level 1 default
   "WWII Vehicle": 5,
   "Pickup Truck": 6,
   "Police Car 1": 7,
   "Canyonero": 9, // Level 4 default
   "Mr. Burns' Limo": 12,
   "Zombie Car": 16,
   "Surveillance Van": 19,
   "Compact Car": 20,
   "Kremlin": 21,
   "Sedan": 22,
   "Cola Truck": 23,
   "Chase Sedan": 24,
   "Police Car 2": 25,
   "Cell Phone Car A": 26,
   "Cell Phone Car B": 27,
   "Cell Phone Car C": 28,
   "Cell Phone Car D": 29,
   "Minivan": 30,
   "Pickup": 31,
   "Taxi": 32,
   "Sports Car A": 33,
   "Sports Car B": 34,
   "SUV": 35,
   "Station Wagon": 36,
   "Hover Bike": 37,
   "36 Stutz Bearcat": 38,
   "Honor Roller": 39, // Level 2 default
   "Armored Truck": 40,
   "Curator": 41,
   "Hearse": 42,
   "Krusty's Limo": 43,
   "Limo": 44,
   "Nerd Car": 45,
   "Hover Car": 46,
   "Milk Truck": 47,
   "Donut Truck": 48,
   "El Carro Loco": 49,
   "Book Burning Van": 50,
   "Car Built For Homer": 51,
   "Electaurus": 52,
   "Open Wheel Race Car": 53,
   "WWII Vehicle w/Rocket": 54,
   "Moe's Sedan": 55,
   "Mr. Plow": 56,
   "School Bus": 57,
   "Plow King": 58,
   "Globex Super Villain Car": 59,
   "Tractor": 60,
   "Sedan A": 61,
   "Sedan B": 62,
   "Ferrini - Black": 63,
   "Cube Van": 64,
   "Duff Truck": 65,
   "Nonuplets Minivan": 66,
   "Malibu Stacy Car": 67, // Level 3 default
   "Clown Car": 68,
   "Coffin Car": 69,
   "Hallo Hearse": 70,
   "Ghost Ship": 71,
   "Witch Broom": 72,
   "Charred Husk": 73,
   "ATV": 74,
   "R/C Buggy": 75,
   "Planet Hype 50's Car": 76,
   "Knight Boat": 77,
   "Monorail Car": 78,
   "Obliteratatron Big Wheel Truck": 79,
   "Speed Rocket": 80,
   "Ambulance": 81,
   "Burns Armored Truck": 82,
   "Fish Van": 83,
   "Garbage Truck": 84,
   "Ice Cream Truck": 85,
   "Itchy and Scratchy Movie Truck": 86,
   "Nuclear Waste Truck": 87,
   "Pizza Van": 88,
   "Mini School Bus": 89,
   "'Vote Quimby' Truck": 90,
   "Glass Truck": 91,
   "Fire Truck": 92,
   "Bone Truck": 93,
   "Redbrick": 94,
}

// =========================================
//            Utility Functions            
// =========================================

function cheat_protection() => sum_of(range(7, 22), b => bit(b,0x4244f4)) == 0 // block all cheats except Unlockables and Drunken Driving.
function in_game() => game_context() >= ctx_normal_game_playing

// =========================================
//                Achievements              
// =========================================

// Mission Offsets
mission1_offset = 0x00
mission2_offset = 0x20
mission3_offset = 0x40
mission4_offset = 0x60
mission5_offset = 0x80
mission6_offset = 0xa0
mission7_offset = 0xc0
missionbonus_offset = 0x140

function achiev_finish_mission(mission_name, level_start_address, mission_offset, points, cheevo_id) {
    achievement(mission_name, format("Finish {0}.", mission_name), points,
                trigger =   in_game() &&
                            cheat_protection() &&
                            bit0(level_start_address + mission_offset) == true && prev(bit0(level_start_address + mission_offset)) == false,
                    id = cheevo_id
               )
}

function achiev_finish_all_street_races(title, level_start_address, level_number, points, cheevo_id) {
    achievement(title, format("Finish all races from Level {0}.", level_number), points,
                trigger =   in_game() &&
                            cheat_protection() &&
                            measured(bit0(level_start_address + 0xE0) + bit0(level_start_address + 0x100) + bit0(level_start_address + 0x120) == 3) &&
                            prev(bit0(level_start_address + 0xE0)) + prev(bit0(level_start_address + 0x100)) + prev(bit0(level_start_address + 0x120)) == 2,
                    id = cheevo_id
               )
}

function achiev_unlock_all_vehicles(title, level_start_address, vehicle_address, level_number, points, cheevo_id) {
    achievement(title, format("Unlock all vehicles from Level {0}.", level_number), points,
                trigger =   in_game() &&
                            cheat_protection() &&
                            bit0(level_start_address + 0xE0) + bit0(level_start_address + 0x100) + bit0(level_start_address + 0x120) +
                                    dword(level_start_address + 0x140) + dword(vehicle_address) == 7 &&
                            prev(bit0(level_start_address + 0xE0) + bit0(level_start_address + 0x100) + bit0(level_start_address + 0x120) +
                                  dword(level_start_address + 0x140) + dword(vehicle_address)) == 6,
                    id = cheevo_id
               )
}

function achiev_unlock_all_clothings(title, clothing_address, level_number, points, cheevo_id) {
    achievement(title, format("Buy all clothings from Level {0}.", level_number), points,
                trigger =   in_game() &&
                            cheat_protection() &&
                            measured(dword(clothing_address) == 3) &&
                            prev(dword(clothing_address)) == 2,
                    id = cheevo_id
               )
}


function achiev_destroy_all_wasps(title, wasps_address, level_number, max_wasps, points, cheevo_id) {
    achievement(title, format("Destroy all wasps from Level {0}.", level_number), points,
                trigger =   in_game() &&
                            measured(dword(wasps_address) == max_wasps) &&
                            prev(dword(wasps_address)) == (max_wasps - 1),
                    id = cheevo_id
               )
}


function achiev_find_all_gags(title, gags_address, level_number, max_gags, points, cheevo_id) {
    achievement(title, format("Find all gags from Level {0}.", level_number), points,
                trigger =   in_game() &&
                            measured(dword(gags_address) == max_gags) &&
                            prev(dword(gags_address)) == (max_gags - 1),
                    id = cheevo_id
               )
}

function achiev_find_all_cards(title, level_number, points, cheevo_id) {
    achievement(title, format("Collect all cards from Level {0}.", level_number), points,
                trigger =   in_game() &&
                            measured(dword(0x5e5a08 + (32 * (level_number - 1) )) == 7) &&
                            prev(dword(0x5e5a08 + (32 * (level_number - 1))) ) == 6,
                    id = cheevo_id
               )
}

function achiev_beat_wager_times(title, level_number, time_text, time_seconds, wager_address, points, cheevo_id) {
    achievement(title, format("Get a time of {0} or less on Level {1} wager race.", time_text, level_number), points,
                trigger =   in_game() &&
                            cheat_protection() &&
                            dword(wager_address) <= time_seconds &&
                            prev(dword(wager_address)) != dword(wager_address),
                    id = cheevo_id
               )
}

// Level 1
achiev_finish_mission("The Cola Caper", 0x5e5c9c, -0x20, 2, 0)
achiev_finish_mission("S-M-R-T", 0x5e5c9c, 0x00, 3, 0)
achiev_finish_mission("Petty Theft Homer", 0x5e5c9c, 0x20, 3, 0)
achiev_finish_mission("Office Spaced", 0x5e5c9c, 0x40, 3, 0)
achiev_finish_mission("Blind Big Brother", 0x5e5c9c, 0x60, 3, 0)
achiev_finish_mission("Flower by Irene", 0x5e5c9c, 0x80, 3, 0)
achiev_finish_mission("Bonestorm Storm", 0x5e5c9c, 0xa0, 3, 0)
achiev_finish_mission("The Fat and Furious", 0x5e5c9c, 0xc0, 4, 0)

// Level 2
achiev_finish_mission("Detention Deficit Disorder", 0x5e5ee8, 0x00, 4, 0)
achiev_finish_mission("Weapons of Mass Deliquency", 0x5e5ee8, 0x20, 4, 0)
achiev_finish_mission("Vox Nerduli", 0x5e5ee8, 0x40, 4, 0)
achiev_finish_mission("Bart 'n' Frink", 0x5e5ee8, 0x60, 4, 0)
achiev_finish_mission("Better Than Beef", 0x5e5ee8, 0x80, 4, 0)
achiev_finish_mission("Monkey See Monkey D'oh", 0x5e5ee8, 0xa0, 4, 0)
achiev_finish_mission("Cell-Outs", 0x5e5ee8, 0xc0, 4, 0)

// Level 3
achiev_finish_mission("Nerd Race Queen", 0x5e6154, 0x00, 4, 0)
achiev_finish_mission("Clueless", 0x5e6154, 0x20, 4, 0)
achiev_finish_mission("Bonfire of the Manatees", 0x5e6154, 0x40, 4, 0)
achiev_finish_mission("Operation Hellfish", 0x5e6154, 0x60, 4, 0)
achiev_finish_mission("Slithery Sleuthing", 0x5e6154, 0x80, 4, 0)
achiev_finish_mission("Fishy Deals", 0x5e6154, 0xa0, 4, 0)
achiev_finish_mission("The Old Pirate and the Sea", 0x5e6154, 0xc0, 5, 0)

// Level 4
achiev_finish_mission("For a Few Donuts More", 0x5e63c0, 0x00, 5, 0)
achiev_finish_mission("Redneck Roundup", 0x5e63c0, 0x20, 5, 0)
achiev_finish_mission("Ketchup Logic", 0x5e63c0, 0x40, 5, 0)
achiev_finish_mission("Return of the Nearly Dead", 0x5e63c0, 0x60, 5, 0)
achiev_finish_mission("Wolves Stole My Pills", 0x5e63c0, 0x80, 5, 0)
achiev_finish_mission("The Cola Wars", 0x5e63c0, 0xa0, 5, 0)
achiev_finish_mission("From Outer Space", 0x5e63c0, 0xc0, 5, 0)

// Level 5
achiev_finish_mission("Incriminating Caffeine", 0x5e662c, 0x00, 5, 0)
achiev_finish_mission("...And Baby Makes 8", 0x5e662c, 0x20, 5, 0)
achiev_finish_mission("Eight is Too Much", 0x5e662c, 0x40, 5, 0)
achiev_finish_mission("This Little Piggy", 0x5e662c, 0x60, 5, 0)
achiev_finish_mission("Never Trust a Snake", 0x5e662c, 0x80, 5, 0)
achiev_finish_mission("Kwik Cash", 0x5e662c, 0xa0, 5, 0)
achiev_finish_mission("Curious Curator", 0x5e662c, 0xc0, 5, 0)

// Level 6
achiev_finish_mission("Going to the Lu'", 0x5e6898, 0x00, 5, 0)
achiev_finish_mission("Getting Down with the Clown", 0x5e6898, 0x20, 5, 0)
achiev_finish_mission("Lab Coat Caper", 0x5e6898, 0x40, 5, 0)
achiev_finish_mission("Duff for Me, Duff for You", 0x5e6898, 0x60, 5, 0)
achiev_finish_mission("Full Metal Jackass", 0x5e6898, 0x80, 5, 0)
achiev_finish_mission("Set to Kill", 0x5e6898, 0xa0, 5, 0)
achiev_finish_mission("Kang and Kodos Strike Back", 0x5e6898, 0xc0, 5, 0)

// Level 7
achiev_finish_mission("Rigor Motors", 0x5e6b04, 0x00, 5, 0)
achiev_finish_mission("Long Black Probes", 0x5e6b04, 0x20, 5, 0)
achiev_finish_mission("Pocket Protector", 0x5e6b04, 0x40, 5, 0)
achiev_finish_mission("There's Something About Monty", 0x5e6b04, 0x60, 5, 0)
achiev_finish_mission("Alien \"Auto\"topsy Part I", 0x5e6b04, 0x80, 5, 0)
achiev_finish_mission("Alien \"Auto\"topsy Part II", 0x5e6b04, 0xa0, 5, 0)
achiev_finish_mission("Alien \"Auto\"topsy Part III", 0x5e6b04, 0xc0, 5, 0)

// Bonus
achiev_finish_mission("This Old Shanty", 0x5e5c9c, missionbonus_offset, 5, 0)
achiev_finish_mission("Dial B for Blood", 0x5e5ee8, missionbonus_offset, 5, 0)
achiev_finish_mission("Princi-Pal", 0x5e6154, missionbonus_offset, 5, 0)
achiev_finish_mission("Beached Love", 0x5e63c0, missionbonus_offset, 5, 0)
achiev_finish_mission("Kinky Frinky", 0x5e662c, missionbonus_offset, 5, 0)
achiev_finish_mission("Milking the Pigs", 0x5e6898, missionbonus_offset, 5, 0)
achiev_finish_mission("Flaming Tires", 0x5e6b04, missionbonus_offset, 5, 0)

// Street Races
achiev_finish_all_street_races("Daytime Suburb Racing", 0x5e5c9c, 1, 10, 0)
achiev_finish_all_street_races("Daytime Downtown Racing", 0x5e5ee8, 2, 10, 0)
achiev_finish_all_street_races("Daytime Squidport Racing", 0x5e6154, 3, 10, 0)
achiev_finish_all_street_races("Night Suburb Racing", 0x5e63c0, 4, 10, 0)
achiev_finish_all_street_races("Night Downtown Racing", 0x5e662c, 5, 10, 0)
achiev_finish_all_street_races("Night Squidport Racing", 0x5e6898, 6, 10, 0)
achiev_finish_all_street_races("Halloween Racing", 0x5e6b04, 7, 10, 0)

// Unlock all vehicles
achiev_unlock_all_vehicles("Surveillance Van", 0x5e5c9c, 0x5e5e10, 1, 10, 0)
achiev_unlock_all_vehicles("WWII Vehicle", 0x5e5ee8, 0x5e607c, 2, 10, 0)
achiev_unlock_all_vehicles("Book Burning Van", 0x5e6154, 0x5e62e8, 3, 10, 0)
achiev_unlock_all_vehicles("Krusty's Limo", 0x5e63c0, 0x5e6554, 4, 10, 0)
achiev_unlock_all_vehicles("El Carro Loco", 0x5e662c, 0x5e67c0, 5, 10, 0)
achiev_unlock_all_vehicles("36 Stutz Bearcat", 0x5e6898, 0x5e6a2c, 6, 10, 0)
achiev_unlock_all_vehicles("Hearse", 0x5e6b04, 0x5e6c98, 7, 10, 0)

// Unlock all clothings
achiev_unlock_all_clothings("King Size Homer", 0x5e5e14, 1, 10, 0)
achiev_unlock_all_clothings("Bart Star", 0x5e6080, 2, 10, 0)
achiev_unlock_all_clothings("Summer of 4 ft.2", 0x5e62ec, 3, 10, 0)
achiev_unlock_all_clothings("Scenes from the Class Struggle in Springfield", 0x5e6558, 4, 10, 0)
achiev_unlock_all_clothings("Much Apu About Nothing", 0x5e67c4, 5, 10, 0)
achiev_unlock_all_clothings("Bartman #1", 0x5e6a30, 6, 10, 0)
achiev_unlock_all_clothings("Tree House of Horror - 4", 0x5e6c9c, 7, 10, 0)

// Destroy all wasps
achiev_destroy_all_wasps("Wasp Killer I", 0x5e5e18, 1, 20, 10, 0)
achiev_destroy_all_wasps("Wasp Killer II", 0x5e6084, 2, 20, 10, 0)
achiev_destroy_all_wasps("Wasp Killer III", 0x5e62f0, 3, 20, 10, 0)
achiev_destroy_all_wasps("Wasp Killer IV", 0x5e655c, 4, 20, 10, 0)
achiev_destroy_all_wasps("Wasp Killer V", 0x5e67c8, 5, 20, 10, 0)
achiev_destroy_all_wasps("Wasp Killer VI", 0x5e6a34, 6, 20, 10, 0)
achiev_destroy_all_wasps("Wasp Killer VII", 0x5e6ca0, 7, 20, 10, 0)

// Find all gags
achiev_find_all_gags("Homer Loves Flanders", 0x5e5e2c, 1, 15, 10, 0)
achiev_find_all_gags("Bart on the Road", 0x5e6098, 2, 11, 10, 0)
achiev_find_all_gags("Three Men and a Comic Book", 0x5e6304, 3, 11, 10, 0)
achiev_find_all_gags("The Old Man and the Key", 0x5e6570, 4, 15, 10, 0)
achiev_find_all_gags("Flaming Moe's", 0x5e67dc, 5, 6, 10, 0)
achiev_find_all_gags("Krusty Gets Busted", 0x5e6a48, 6, 11, 10, 0)
achiev_find_all_gags("Treehouse of Herror", 0x5e6cb4, 7, 15, 10, 0)

// Find all cards
achiev_find_all_cards("Mr. Sparkle Box", 1, 10, 0)
achiev_find_all_cards("Head of Jebediah", 2, 10, 0)
achiev_find_all_cards("Soy Pop", 3, 10, 0)
achiev_find_all_cards("Boudoir Album", 4, 10, 0)
achiev_find_all_cards("Ganesh Costume", 5, 10, 0)
achiev_find_all_cards("Radioactive Man #1", 6, 10, 0)
achiev_find_all_cards("Soul Donut", 7, 10, 0)

// Beat Wager times
achiev_beat_wager_times("Wager Racing I", 1, "3:15", 195, 0x5e5e08, 3, 0)
achiev_beat_wager_times("Wager Racing II", 2, "2:10", 130, 0x5e6074, 3, 0)
achiev_beat_wager_times("Wager Racing III", 3, "2:20", 140, 0x5e62e0, 3, 0)
achiev_beat_wager_times("Wager Racing IV", 4, "2:30", 150, 0x5e654c, 3, 0)
achiev_beat_wager_times("Wager Racing V", 5, "2:05", 125, 0x5e67b8, 3, 0)
achiev_beat_wager_times("Wager Racing VI", 6, "1:55", 115, 0x5e6a24, 3, 0)
achiev_beat_wager_times("Wager Racing VII", 7, "1:30", 90, 0x5e6c90, 3, 0)

// =========================================
//                Bonus Game              
// =========================================

// TODO: Test if wins are resetted, and if is possible to change laps during a win streak.
function achiev_win_3_bonus_game(title, level, points, cheevo_id) {
        achievement(title, format("Win a race on Level {0} in Bonus Game (3 laps).", level), points,
                    trigger =   byte(pointer_bonus_game() + offset_bonus_game_level_laps) == 3 &&
                                game_context() == ctx_bonus_game_playing &&
                                current_level() == 7 + level &&
                                byte(pointer_bonus_game() + offset_bonus_game_p1_wins) == 1 &&
                                prev(byte(pointer_bonus_game() + offset_bonus_game_p1_wins)) == 0 &&
                                byte(pointer_bonus_game() + offset_bonus_game_active_humans) == 1,
                        id = cheevo_id
                   )
}

achiev_win_3_bonus_game("Daytime Suburb Super Sprint", 1, 3, 0)
achiev_win_3_bonus_game("Daytime Downtown Super Sprint", 2, 3, 0)
achiev_win_3_bonus_game("Daytime Squidport Super Sprint", 3, 3, 0)
achiev_win_3_bonus_game("Night Suburb Super Sprint", 4, 3, 0)
achiev_win_3_bonus_game("Night Downtown Super Sprint", 5, 3, 0)
achiev_win_3_bonus_game("Night Squidport Super Sprint", 6, 3, 0)
achiev_win_3_bonus_game("Halloween Super Sprint", 7, 3, 0)

// =========================================
//                   Misc              
// =========================================

min_vel_required_to_surf = 7.0
achievement("Car Surfing", "Keep surfing on a vehicle for at least 5 seconds.", 2,
            trigger =   game_context() == ctx_normal_game_playing &&
                        tally(300, player_surfing_on_vehicle() == true && always_true()) &&
                        never(player_velocity_x() < 7.0 && player_velocity_x() > -7.0 && player_velocity_z() < 7.0 && player_velocity_z() > -7.0)
           )

function trig_marge_at_kwik_mart()
{
    trigger = always_false()
    
    // pointer check
    for i in range(0, 63)
    {
        character_ptr_address = dword(array_characters_pointer_start + i * 4)
        character_model_name = dword(array_characters_name_start + i * 64)
        character_loaded = bit0(array_characters_loaded_start + i * 1)

        // temporary variables for use in the loop
        char_pos_x = float(character_ptr_address + offset_char_position_x)
        char_pos_z = float(character_ptr_address + offset_char_position_z)
        trigger =       trigger || 
                        character_loaded == true &&
                        char_pos_x > 189.0 && char_pos_x < 234.0 && 
                        char_pos_z > -315.0 && char_pos_z < -284.0 &&
                        character_model_name == 0x6772616d // "Marg" 32 bits ASCII
    }
    return trigger
}

achievement("Matt Groening Gaming", "Kick Marge all the way to Kwik E-Mart during Level 1.", 3,
            trigger =   game_context() == ctx_normal_game_playing &&
                        current_level() == 0 &&
                        current_mission() != 5 &&
                        trig_marge_at_kwik_mart()
           )

function trig_push_milhouse_at_cliff()
{
    trigger = always_false()
    
    // pointer check
    for i in range(0, 63)
    {
        character_ptr_address = dword(array_characters_pointer_start + i * 4)
        character_model_name = dword(array_characters_name_start + i * 64)
        character_loaded = bit0(array_characters_loaded_start + i * 1)

        // temporary variables for use in the loop
        char_pos_y = float(character_ptr_address + offset_char_position_y)
        char_pos_x = float(character_ptr_address + offset_char_position_x)
        char_pos_z = float(character_ptr_address + offset_char_position_z)

        trigger =       trigger || 
                        character_loaded == true &&
                        char_pos_y < -75.0 &&
                        char_pos_x > -141.0 && char_pos_x < -43.0 && // ok
                        char_pos_z > 260.0 && char_pos_z < 323.0 && // ok
                        character_model_name == 0x686c696d // "Milh" 32 bits ASCII
    }
    
}

achievement("The Simp", "Push Milhouse to the cliff at the end of Clueless.", 2,
            trigger =   game_context() == ctx_normal_game_playing &&
                        current_level() == 2 && // Lisa level
                        current_mission() == 1 && // Clueless
                        mission_outside_mission() == false &&
                        mission_stage() == 10 &&
                        trig_push_milhouse_at_cliff()
           )

// achievement("Walking Simulator", "Finish Clueless without using cars.", 2,
//             trigger =   game_context() == ctx_normal_game_playing &&
//                         current_level() == 2 && // Lisa level
//                         current_mission() == 1 && // Clueless
//                         once(mission_state() == m_state_waiting) &&
//                         trigger_when(mission_state() == m_state_success && prev(mission_state()) == m_state_inprogress) &&
//                         never(player_inside_vehicle() == true && mission_stage() > 1)
//            )


achievement("500-Yard Gash", "Unlock the bonus movie.", 5,
            trigger =   in_game() &&
                        bit0(0x5e62e4) == true &&
                        prev(bit0(0x5e62e4)) == false
            )

// =========================================
//                Challenges              
// =========================================

// TODO: Test all these

// TODO: Add reset when leaving mission
function finish_mission_with_car(title, mission_name, level, mission, car, points, cheevo_id) {
    achievement(title, format("Finish {0} using only the {1}.", mission_name, car), points,
                trigger =   in_game() &&
                            cheat_protection() &&
                            never(current_level() != level - 1) &&
                            never(current_mission() != mission - 1) &&
                            never(mission_name_2bytes() == m_name_wager) && // mission type is identified through mission name
                            never(mission_name_2bytes() == m_name_race) &&
                            never(mission_outside_mission() == true) &&
                            once(mission_super_state() == 2) &&
                            trigger_when(mission_state() == m_state_success && prev(mission_state()) == m_state_inprogress) &&
                            current_vehicle() == vehicles[car] &&
                            never(player_inside_vehicle() == true && current_vehicle() != vehicles[car])
                )
}

// Unique Cars
finish_mission_with_car("1970 Blue Flame", "The Fat and the Furious", 1, 8, "Speed Rocket", 5, 0)
finish_mission_with_car("Marge vs. the Monorail", "Cell-Outs", 2, 7, "Monorail Car", 25, 0)
finish_mission_with_car("Knightboat: The Crime Solving Boat", "The Old Pirate and the Sea", 3, 7, "Knight Boat", 5, 0)
finish_mission_with_car("Quad Bike", "Return of the Nearly-Dead", 4, 4, "ATV", 10, 0)
finish_mission_with_car("Monster Truck", "...and Baby Makes 8", 5, 2, "Obliteratatron Big Wheel Truck", 5, 0)
finish_mission_with_car("Unfunny Pink Car", "Getting Down with the Clown", 6, 2, "Planet Hype 50's Car", 5, 0)
finish_mission_with_car("Radio-Controlled", "There's Something About Monty", 7, 4, "R/C Buggy", 10, 0)

// Other Cars
finish_mission_with_car("Fire Truck Challenge", "Fishy Deals", 3, 6, "Fire Truck", 10, 0)
finish_mission_with_car("Donut Challenge", "For A Few Donuts More", 4, 1, "Donut Truck", 10, 0)
finish_mission_with_car("Duff Challenge", "From Outer Space", 4, 7, "Duff Truck", 10, 0)
// finish_mission_with_car("Funny Pink Car Challenge", "Getting Down with the Clown", 6, 2, "Family Sedan", 10, 0)
finish_mission_with_car("Cola Challenge", "Duff For Me, Duff ", 6, 4, "Cola Truck", 10, 0)
finish_mission_with_car("Plow King Challenge", "Full Metal Jackass", 6, 5, "Plow King", 10, 0)
finish_mission_with_car("Armored Challenge", "Rigor Motors", 7, 1, "Armored Truck", 10, 0)

achievement("I Can't See Anything", "Finish Alien \"Auto\"topsy Part III with the drunk driving cheat enabled.", 10,
                trigger =   in_game() &&
                            cheat_protection() &&
                            never(current_level() != 6) &&
                            never(current_mission() != 6) &&
                            never(mission_name_2bytes() == m_name_wager) && // mission type is identified through mission name
                            never(mission_name_2bytes() == m_name_race) &&
                            never(mission_outside_mission() == true) &&
                            once(mission_super_state() == 2) &&
                            trigger_when(mission_state() == m_state_success && prev(mission_state()) == m_state_inprogress) &&
                            never(bit7(0x4244f6) == false)
                )