// Mortal Kombat: Armageddon
// #ID = 19131

// Settings
function settings_kombat_cpu() => dword(0x6B6FF8)
function settings_kombat_cpu_default() => dword(0x6B6FF8) >= 2
function settings_motor_kombat_cpu() => dword(0x6B6FFC)
function settings_motor_kombat_cpu_default() => dword(0x6B6FFC) >= 2
function settings_rounds_to_win() => dword(0x6B7000)
function settings_rounds_to_win_default() => dword(0x6B7000) == 2
function settings_round_time() => dword(0x6B7004)
function settings_round_time_default() => dword(0x6B7004) == 90

function game_code() => dword(0x100220)
function game_mode() => dword(0x64df24)
function game_current_fmv() => dword(0x82D390)
function game_koins() => dword(0x6AF730)
function game_total_koins_wasted() => dword(0x6AF738)

function game_stage() => dword(0x660114)
function death_trap(value) => dword(0x66035C) == value // this wasn't necessary here but I'm lazy to adjust the sheet macro
function not_death_trap(value) => dword(0x66035C) != value
function arcade_current_match() => dword(0x64EE0C)
function arcade_timer() => dword(0x660368)

// P1
function p1_character() => dword(0x6601D8)
function p1_active_state() => dword(0x6601B4)
function p1_hp() => float(0x6601b8)
function p1_alternate_costume() => byte(0x6601C0)
function p1_rounds_won() => dword(0x6601C8)
function p1_battles_won() => dword(0x6601cc)

function p1_fatality_hits() => dword(0x64F47C)
function p1_breakers() => dword(0x65C3DC)
function p1_hit_combo() => dword(0x65D0D4)
function p1_damage_combo() => float(0x65D10C)

// P2
function p2_character() => dword(0x660220)
function p2_active_state() => dword(0x6601FC)
function p2_hp() => float(0x660200)

// Motor
function motor_ptr() => dword(0x64F26C)
function motor_p1_character() => dword(0x7C4240)
function motor_p2_character() => dword(0x7C424C)
function motor_p1_laps() => dword(dword(motor_ptr() + 0x24c) + 0xb8)
function motor_p1_race_position() => dword(dword(motor_ptr() + 0x24c) + 0x14c)

// UMK3
function umk3_p1_state() => word(0x555034)
function umk3_p2_state() => word(0x5551aa)
function umk3_p1_character() => byte(0x555046)
function umk3_p1_hp() => byte(0x55504C)
function umk3_p1_wins_rounds() => byte(0x555052)
function umk3_p2_character() => byte(0x5551BC)
function umk3_p2_hp() => byte(0x5551C2)
function umk3_ladder_current_match() => byte(0x55535A)
function umk3_round_finishing_move_type() => byte(0x5553E6)


characters = {
   "Ashrah": 0,
   "Baraka": 1,
   "Bo' Rai Cho": 2,
   "Blaze": 3,
   "Cage": 4,
   "Chameleon": 5,
   "Cyrax": 6,
   "Daegon": 7,
   "Dairou": 8,
   "Darrius": 9,
   "Onaga": 10,
   "Drahmin": 11,
   "Ermac": 12,
   "Frost": 13,
   "Fujin": 14,
   "Goro": 15,
   "Havik": 16,
   "Hotaru": 17,
   "Hsu Hao": 18,
   "Jade": 19,
   "Jarek": 20,
   "Jax": 21,
   "Kabal": 22,
   "Kai": 23,
   "Kano": 24,
   "Kenshi": 25,
   "Kintaro": 26,
   "Kira": 27,
   "Kitana": 28,
   "Kobra": 29,
   "Kung Lao": 30,
   "Li Mei": 31,
   "Liu Kang": 32,
   "Mavado": 33,
   "Meat": 34,
   "Mileena": 35,
   "Mokap": 36,
   "Moloch": 37,
   "Motaro": 38,
   "Nightwolf": 39,
   "Nitara": 40,
   "Noob": 41,
   "Quan Chi": 42,
   "Raiden": 43,
   "Rain": 44,
   "Reiko": 45,
   "Reptile": 46,
   "Sareena": 47,
   "Scorpion": 48,
   "Sektor": 49,
   "Shang Tsung": 50,
   "Shao Kahn": 51,
   "Sheeva": 52,
   "Shinnok": 53,
   "Shujinko": 54,
   "Sindel": 55,
   "Smoke": 56,
   "Sonya": 57,
   "Stryker": 58,
   "Sub-Zero": 59,
   "Tanya": 60,
   "Taven": 61,
   "Kreate a Fighter": 62
}

motor_characters = {
   "Baraka": 0,
   "Bo' Rai Cho": 1,
   "Cage": 2,
   "Cyrax": 3,
   "Jax": 4,
   "Kitana": 5,
   "Mileena": 6,
   "Raiden": 7,
   "Scorpion": 8,
   "Sub-Zero": 9
}

stages = {
   "Subway": 0,
   "Tekunin Prison": 1,
   "Armory": 2,
   "Bell Tower": 3,
   "Goro's Lair": 5,
   "Battle Arena": 6,
   "Wastelands": 7,
   "Reptile's Lair": 8,
   "Hell": 9,
   "Lumbermill": 10,
   "Pyramid of Argus": 11,
   "Sky Temple": 12,
   "Falling Cliffs": 13,
   "Hell's Foundry": 14,
   "Nethership Interior": 15,
   "Meteor Storm": 16,
   "Firewell": 17,
   "Soul Chamber": 18,
   "Evil Tower": 19,
   "Outworld Spire": 20
}

// =========================================
//             Utility Functions              
// =========================================

function is_umk3() => never(game_code() != 0x0c055464)
function is_mka() => never(game_code() != 0x24030023)

function p1_only() => p1_active_state() > 0 && p2_active_state() == 0

function is_arcade() => game_mode() == 0x00
function is_motor() => game_mode() == 0x07

function game_beaten() => arcade_current_match() == 7 && p1_battles_won() > prev(p1_battles_won())

function umk3_p1_only() => umk3_p1_state() > 0 && umk3_p2_state() == 0
function umk3_game_beaten() => umk3_p2_character() == 0x19 && umk3_p1_wins_rounds() == 2 && prev(umk3_p1_wins_rounds()) == 1

// =========================================
//               Beat the game              
// =========================================

function achiev_arcade_character(title, char, points, cheevo_id) {
   achievement(title, format("Finish Arcade Mode using only {0} (Medium Kombat CPU, Round Time 90).", char), points,
               trigger =   is_mka() &&
                           is_arcade() &&
                           p1_only() &&
                           once(p1_active_state() == 0x01 && arcade_current_match() == 0) &&
                           never(p1_rounds_won() > prev(p1_rounds_won()) && p1_character() != characters[char]) &&
                           p1_character() == characters[char] &&
                           settings_kombat_cpu_default() &&
                           settings_round_time_default() &&
                           trigger_when(game_beaten())
               )
}

achiev_arcade_character("Divine Light", "Ashrah", 10, 0)
achiev_arcade_character("Lord Baraka", "Baraka", 10, 0)
achiev_arcade_character("MrGSTAR321's Favorite", "Bo' Rai Cho", 10, 0)
achiev_arcade_character("Shatterer of Reality", "Blaze", 10, 0)
achiev_arcade_character("Enlighted Super Star", "Cage", 10, 0)
achiev_arcade_character("Hidden From Sight", "Chameleon", 10, 0)
achiev_arcade_character("Mann vs. Machine", "Cyrax", 10, 0)
achiev_arcade_character("Evil Side of the Coin", "Daegon", 10, 0)
achiev_arcade_character("Emperor Dairou", "Dairou", 10, 0)
achiev_arcade_character("Golden Ring", "Darrius", 10, 0)
achiev_arcade_character("Emperor Onaga!", "Onaga", 10, 0)
achiev_arcade_character("Oni Bloodlust", "Drahmin", 10, 0)
achiev_arcade_character("Army of Ermacs", "Ermac", 10, 0)
achiev_arcade_character("Frozen Wasteland", "Frost", 10, 0)
achiev_arcade_character("Storm of Justice", "Fujin", 10, 0)
achiev_arcade_character("Shokan Victory", "Goro", 10, 0)
achiev_arcade_character("Ultimate Chaos", "Havik", 10, 0)
achiev_arcade_character("Pure Order", "Hotaru", 10, 0)
achiev_arcade_character("Demon of Emptiness", "Hsu Hao", 10, 0)
achiev_arcade_character("Sealed Darkness", "Jade", 10, 0)
achiev_arcade_character("Storm of Fatalities", "Jarek", 10, 0)
achiev_arcade_character("Full Cyborg", "Jax", 10, 0)
achiev_arcade_character("Black Dragon's Superiority", "Kabal", 10, 0)
achiev_arcade_character("Search of Knowledge", "Kai", 10, 0)
achiev_arcade_character("Black Dragon-Human Hybrid", "Kano", 10, 0)
achiev_arcade_character("Sensory Bombardment", "Kenshi", 10, 0)
achiev_arcade_character("Four Magic Swords", "Kintaro", 10, 0)
achiev_arcade_character("Black Dragon Way", "Kira", 10, 0)
achiev_arcade_character("All-Female Fighting Force", "Kitana", 10, 0)
achiev_arcade_character("Lord of the Realms", "Kobra", 10, 0)
achiev_arcade_character("Great Kung Lao", "Kung Lao", 10, 0)
achiev_arcade_character("Justice for Outworld", "Li Mei", 10, 0)
achiev_arcade_character("God Liu Kang", "Liu Kang", 10, 0)
achiev_arcade_character("Mind Control", "Mavado", 10, 0)
achiev_arcade_character("Shape-Shift", "Meat", 10, 0)
achiev_arcade_character("Princess Mileena", "Mileena", 10, 0)
achiev_arcade_character("Constellation Mokap", "Mokap", 10, 0)
achiev_arcade_character("Destroyer of Worlds", "Moloch", 10, 0)
achiev_arcade_character("Undone Curse", "Motaro", 10, 0)
achiev_arcade_character("The Ultimate Shaman", "Nightwolf", 10, 0)
achiev_arcade_character("Blood Good", "Nitara", 10, 0)
achiev_arcade_character("Sub-Zaibot", "Noob", 10, 0)
achiev_arcade_character("True Source of Disruption", "Quan Chi", 10, 0)
achiev_arcade_character("Deity of Unimaginable Power", "Raiden", 10, 0)
achiev_arcade_character("Protector of Edenia", "Rain", 10, 0)
achiev_arcade_character("Warlord of Outworld", "Reiko", 10, 0)
achiev_arcade_character("Zaterra's Glory", "Reptile", 10, 0)
achiev_arcade_character("Frozen Sareena", "Sareena", 10, 0)
achiev_arcade_character("Shirai Ryu's Army", "Scorpion", 10, 0)
achiev_arcade_character("Triborg", "Sektor", 10, 0)
achiev_arcade_character("Ruler of Outworld", "Shang Tsung", 10, 0)
achiev_arcade_character("The Konqueror", "Shao Kahn", 10, 0)
achiev_arcade_character("Goddess of Destruction", "Sheeva", 10, 0)
achiev_arcade_character("Shinnok vs. Shinnok", "Shinnok", 10, 0)
achiev_arcade_character("Kombatants Fusion", "Shujinko", 10, 0)
achiev_arcade_character("Triad of the Just", "Sindel", 10, 0)
achiev_arcade_character("Planet Smoke", "Smoke", 10, 0)
achiev_arcade_character("New Era of Peace", "Sonya", 10, 0)
achiev_arcade_character("Vigilante Stryker", "Stryker", 10, 0)
achiev_arcade_character("Ice God", "Sub-Zero", 10, 0)
achiev_arcade_character("Dragon Caller", "Tanya", 10, 0)
achiev_arcade_character("God Taven", "Taven", 10, 0)

achievement("You Win!", "Finish Arcade Mode with a character made on Kreate A Fighter (Medium Kombat CPU, Round Time 90).", 10,
            trigger =   is_mka() &&
                        is_arcade() &&
                        p1_only() &&
                        once(p1_active_state() == 0x01 && arcade_current_match() == 0) &&
                        never(p1_rounds_won() > prev(p1_rounds_won()) && p1_character() != 62) &&
                        never(p1_active_state() == 0x01 && arcade_current_match() == 0 && p1_character() != 62) &&
                        p1_character() == 62 &&
                        settings_kombat_cpu_default() &&
                        settings_round_time_default() &&
                        trigger_when(game_beaten())
            )

achievement("Armageddon of the Realms", "Finish Arcade Mode on Max Kombat CPU (2 Rounds, Round Time 90).", 10,
            trigger =   is_mka() &&
                        is_arcade() &&
                        p1_only() &&
                        settings_kombat_cpu() == 4 &&
                        settings_round_time_default() &&
                        settings_rounds_to_win_default() &&
                        trigger_when(game_beaten())
            )



// =========================================
//                Motor Kombat              
// =========================================

function achiev_motor_kombat(title, char, points, cheevo_id) {
   achievement(title, format("Finish a race on 1st place as {0} in Motor Kombat.", char), points,
               trigger =   is_mka() &&
                           is_motor() &&
                           p1_only() &&
                           motor_p1_character() == motor_characters[char] &&
                           (
                              (game_stage() == 0x2b && motor_p1_laps() == 4 && prev(motor_p1_laps()) == 3 && motor_p1_race_position() == 0) ||
                              (game_stage() == 0x2c && motor_p1_laps() == 8 && prev(motor_p1_laps()) == 7 && motor_p1_race_position() == 0) ||
                              (game_stage() == 0x2d && motor_p1_laps() == 5 && prev(motor_p1_laps()) == 4 && motor_p1_race_position() == 0) ||
                              (game_stage() == 0x2e && motor_p1_laps() == 4 && prev(motor_p1_laps()) == 3 && motor_p1_race_position() == 0) ||
                              (game_stage() == 0x2f && motor_p1_laps() == 4 && prev(motor_p1_laps()) == 3 && motor_p1_race_position() == 0)
                           )
               
               
               
               )
}

achiev_motor_kombat("Double Spark", "Baraka", 5, 0)
achiev_motor_kombat("Puke", "Bo' Rai Cho", 5, 0)
achiev_motor_kombat("Greengoo", "Cage", 5, 0)
achiev_motor_kombat("Bomb", "Cyrax", 5, 0)
achiev_motor_kombat("Ground Pound", "Jax", 5, 0)
achiev_motor_kombat("Shield", "Kitana", 5, 0)
achiev_motor_kombat("Special Boost", "Mileena", 5, 0)
achiev_motor_kombat("Lightning Shield", "Raiden", 5, 0)
achiev_motor_kombat("Spear", "Scorpion", 5, 0)
achiev_motor_kombat("Iceball", "Sub-Zero", 5, 0)


// =========================================
//                    Misc              
// =========================================

achievement("Armageddon Kostume", "Select an alternative costume.", 1,
            trigger =   is_mka() &&
                        game_mode() != 0x08 &&
                        game_mode() != 0x09 &&
                        game_mode() != 0x11 &&
                        p1_active_state() == 2 &&
                        p1_alternate_costume() > prev(p1_alternate_costume())
            )

achievement("Kombo Breaker", "Perform a breaker.", 1,
            trigger =   is_mka() &&
                        p1_active_state() == 2 &&
                        p1_breakers() == 2 &&
                        prev(p1_breakers()) == 3
            )

achievement("Armageddon Kombo", "Perform a combo with at least 7 hits and 30% damage.", 10,
            trigger =   is_mka() &&
                        p1_active_state() == 2 &&
                        p1_hit_combo() >= 7 &&
                        p1_damage_combo() >= 0.30 &&
                        p1_hit_combo() > prev(p1_hit_combo())
            )

achievement("Kreate a Fatality", "Perform a 11-hit fatality chain.", 10,
            trigger =   is_mka() &&
                        p1_active_state() == 2 &&
                        p1_fatality_hits() == 11 &&
                        prev(p1_fatality_hits()) == 10
            )

achievement("Flawless Armageddon", "Defeat Blaze with a Flawless Victory (Medium Kombat CPU).", 10,
            trigger =   is_mka() &&
                        p1_only() &&
                        p2_character() == characters["Blaze"] &&
                        p1_rounds_won() > prev(p1_rounds_won()) &&
                        p1_hp() == 1.0 &&
                        settings_kombat_cpu_default()
            )

function achiev_death_trap(stage, cond_death_trap, points, cheevo_id) {
   achievement(stage, format("Throw your opponent on a death trap in {0} during Arcade mode.", stage), points,
               trigger =   is_mka() &&
                           is_arcade() &&
                           p1_only() &&
                           game_stage() == stages[stage] &&
                           cond_death_trap &&
                           p1_hp() > 0.0 &&
                           p2_hp() == 0.0
               )
}

achiev_death_trap("Armory", __ornext(death_trap(0x11) || death_trap(0x12)), 3, 0)
achiev_death_trap("Evil Tower", death_trap(0x1a), 3, 0)
achiev_death_trap("Hell's Foundry", death_trap(0x19), 3, 0)
achiev_death_trap("Firewell", death_trap(0x1b), 3, 0)
achiev_death_trap("Falling Cliffs", death_trap(0x18), 3, 0)
achiev_death_trap("Lumbermill", death_trap(0x15), 3, 0)
achiev_death_trap("Outworld Spire", death_trap(0x0c), 3, 0)
achiev_death_trap("Sky Temple", death_trap(0x16), 3, 0)
achiev_death_trap("Subway", death_trap(0x08), 3, 0)
achiev_death_trap("Wastelands", death_trap(0x14), 3, 0)

achievement("Bell Tower", "Perform a Pit Fatality in Bell Tower during Arcade mode.", 3,
            trigger =   is_mka() &&
                        is_arcade() &&
                        p1_only() &&
                        game_stage() == stages["Bell Tower"] &&
                        death_trap(0x0c) &&
                        p1_hp() > 0.0 &&
                        p2_hp() == 0.0  
            )

achievement("Tekunin Prison", "Perform a Pit Fatality in Tekunin Prison during Arcade mode.", 4,
            trigger =   is_mka() &&
                        is_arcade() &&
                        p1_only() &&
                        game_stage() == stages["Tekunin Prison"] &&
                        death_trap(0x0c) &&
                        p1_hp() > 0.0 &&
                        p2_hp() == 0.0  
            )

achievement("Battle Arena", "Throw your opponent on two different death traps in a single match on Battle Arena during Arcade Mode.", 4,
            trigger =   is_mka() &&
                        is_arcade() &&
                        p1_only() &&
                        never(game_stage() != stages["Battle Arena"]) &&
                        tally(2, once(death_trap(0x0d) && p1_hp() > 0.0 && p2_hp() == 0.0),
                                 once(death_trap(0x0e) && p1_hp() > 0.0 && p2_hp() == 0.0),
                                 once(death_trap(0x0f) && p1_hp() > 0.0 && p2_hp() == 0.0),
                                 once(death_trap(0x10) && p1_hp() > 0.0 && p2_hp() == 0.0) 
                             )  
            )


// =========================================
//                   UMK3              
// =========================================


achievement("Ultimate Champion", "UMK3: Beat the game.", 10, 
                trigger =  is_umk3() &&
                           umk3_p1_only() &&
                           umk3_game_beaten()
            )

achievement("Ultimate Fatality", "UMK3: Perform a finishing move.", 2, 
                trigger =  is_umk3() &&
                           umk3_p1_only() &&
                           umk3_round_finishing_move_type() > 0 &&
                           prev(umk3_round_finishing_move_type()) == 0 &&
                           umk3_p1_hp() > 0
            )

achievement("Ultimate Victory", "UMK3: Win a round with a Flawless Victory.", 2, 
                trigger =  is_umk3() &&
                           umk3_p1_only() &&
                           umk3_p1_hp() == 0xa6 &&
                           umk3_p1_wins_rounds() > prev(umk3_p1_wins_rounds())
            )


leaderboard("MKA Arcade Speedrun - Medium", "Best time on Arcade Mode (Medium difficulty, 2 rounds)",
           start = is_mka() && is_arcade() && p1_only() && arcade_timer() > 0 && prev(arcade_timer()) == 0 && settings_kombat_cpu() == 2 && settings_rounds_to_win_default(),
           cancel = game_mode() != 0x00,
           submit = game_beaten(),
           value = arcade_timer() * 60,
           format = "FRAMES", lower_is_better=true)

leaderboard("MKA Arcade Speedrun - Max", "Best time on Arcade Mode (Max difficulty, 2 rounds)",
           start = is_mka() && is_arcade() && p1_only() && arcade_timer() > 0 && prev(arcade_timer()) == 0 && settings_kombat_cpu() == 4 && settings_rounds_to_win_default(),
           cancel = game_mode() != 0x00,
           submit = game_beaten(),
           value = arcade_timer() * 60,
           format = "FRAMES", lower_is_better=true)