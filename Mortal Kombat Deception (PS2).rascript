// Mortal Kombat: Deception
// #ID = 19358

function code_arbitrary_code() => dword(0x100010)

function game_mode() => byte(0x5D629C)
         mode_arcade = 0x00
         mode_puzzle_kombat = 0x06
         mode_chess_kombat_fight = 0x0a

function arcade_timer() => dword(0x5e455c)
function game_match() => byte(0x5D72D4)
function game_stage() => byte(0x5E4368)

function round_starting() => bit6(0x5E4351)
function match_fatality() => dword(0x5E4550)

function p1_state() => byte(0x5E43FC)
function p2_state() => byte(0x5E4468)

function p1_hp() => float(0x5E4400)
function p1_alt_costume_active() => byte(0x5E4408)
function p1_rounds_wins() => byte(0x5E4434)
function p1_kombat_wins() => byte(0x5E4438)
function p1_puzzle_wins() => byte(0x5E443C)
function p1_character() => byte(0x5E4448)
function p1_hit_combo() => byte(0x5E20DC)

function p2_hp() => float(0x5E446C)
function p2_character() => byte(0x5E44B4)
function p2_hit_type() => word(0x5E2764)

function profile_platinum_koins() => dword(0x6225C0)
function profile_onyx_koins() => dword(0x6225C4)
function profile_sapphire_koins() => dword(0x6225C8)
function profile_jade_koins() => dword(0x6225CC)
function profile_ruby_koins() => dword(0x6225D0)
function profile_gold_koins() => dword(0x6225D4)

function settings_kombat_cpu() => byte(0x628F28)
function settings_kombat_cpu_default() => byte(0x628F28) >= 2
function settings_chess_cpu() => byte(0x628F2C)
function settings_puzzle_cpu() => byte(0x628F30)
function settings_puzzle_cpu_default() => byte(0x628F30) >= 2
function settings_rounds_to_win() => byte(0x628F34)
function settings_rounds_to_win_default() => byte(0x628F34) == 2
function settings_puzzles_rounds() => byte(0x628F38)
function settings_round_time() => byte(0x628F3C)
function settings_round_time_default() => byte(0x628F3C) == 0x3c

characters = {
   "Scorpion": 0,
   "Baraka": 1,
   "Noob (Single)": 2,
   "Sub-Zero": 3,
   "Mileena": 4,
   "Nightwolf": 5,
   "Ermac": 6,
   "Ashrah": 7,
   "Sindel": 8,
   "Li Mei": 9,
   "Bo' Rai Cho": 10,
   "Hotaru": 11,
   "Kenshi": 12,
   "Smoke (Single)": 13,
   "Havik": 14,
   "Tanya": 15,
   "Liu Kang": 16,
   "Ghost Liu Kang": 17,
   "Kira": 18,
   "Kabal": 19,
   "Kobra": 20,
   "Jade": 21,
   "Dairou": 22,
   "Raiden": 23,
   "Darrius": 24,
   "Shujinko": 25,
   "Kid Shujinko": 26,
   "Noob - Smoke": 27,
   "Monster": 28,
   "Onaga": 29,
   "Quan Chi": 32,
   "Kung Lao": 33,
   "Johnny Cage": 34,
   "Sonya": 35,
   "Nitara": 36,
   "Shang Tsung": 37,
   "Frost": 38,
   "Kitana": 39,
   "Drahmin": 40
}


// =========================================
//                 Utility              
// =========================================

function is_main_game() => code_arbitrary_code() == 0x70001c28
function is_premium_pack() => code_arbitrary_code() == 0x0c040c68

function is_arcade() => never(game_mode() != mode_arcade)
function is_puzzle() => never(game_mode() != mode_puzzle_kombat)

function p1_only() => never(p1_state() == 0) && never(p2_state() > 0)
function p1_won_match() => p1_kombat_wins() > prev(p1_kombat_wins())

function game_beaten() => game_match() == 0x07 && p1_won_match()


// =========================================
//                  Arcade              
// =========================================

function achiev_arcade_character(title, char_name, points) {
    achievement(title, format("Beat the game using only {0} on Medium Kombat CPU.", char_name), points,
                trigger =   is_arcade() &&
                            p1_only() &&
                            p1_character() == characters[char_name] &&
                            once(p1_state() == 1 && game_match() == 0) &&
                            never(p1_character() != characters[char_name] && p1_rounds_wins() > prev(p1_rounds_wins())) &&
                            settings_kombat_cpu_default() &&
                            trigger_when(game_beaten())
                )
}

achiev_arcade_character("True Champion", "Scorpion", 10)
achiev_arcade_character("Tarkatan", "Baraka", 10)
achiev_arcade_character("Cold Mastery", "Sub-Zero", 10)
achiev_arcade_character("Princess Mileena", "Mileena", 10)
achiev_arcade_character("Sin-Eater", "Nightwolf", 10)
achiev_arcade_character("Fusion of Souls", "Ermac", 10)
achiev_arcade_character("Demon Hunter", "Ashrah", 10)
achiev_arcade_character("Edenia Queen", "Sindel", 10)
achiev_arcade_character("Lust for Power", "Li Mei", 10)
achiev_arcade_character("Disgrace", "Bo' Rai Cho", 10)
achiev_arcade_character("Order Enjoyer", "Hotaru", 10)
achiev_arcade_character("Blind Warrior", "Kenshi", 10)
achiev_arcade_character("Chaos Enjoyer", "Havik", 10)
achiev_arcade_character("Deadly Alliance Ambassador", "Tanya", 10)
achiev_arcade_character("Earthrealm's Ghost", "Liu Kang", 10)
achiev_arcade_character("Blessed Anarchy", "Kira", 10)
achiev_arcade_character("Black Dragon Lives!", "Kabal", 10)
achiev_arcade_character("Street Fighter", "Kobra", 10)
achiev_arcade_character("Edenia Restorer", "Jade", 10)
achiev_arcade_character("Mercenary", "Dairou", 10)
achiev_arcade_character("Evil Raiden", "Raiden", 10)
achiev_arcade_character("Revolutionary", "Darrius", 10)
achiev_arcade_character("Old Fool", "Shujinko", 10)
achiev_arcade_character("Netherrealm Rulers", "Noob - Smoke", 10)

achievement("Dragon Slayer", "Beat the game on Max Kombat CPU on default settings.", 25,
                trigger =   is_arcade() &&
                            p1_only() &&
                            settings_kombat_cpu() == 4 &&
                            settings_round_time_default() &&
                            settings_rounds_to_win_default() &&
                            trigger_when(game_beaten())
                )

achievement("Deceptive Costume", "Beat the game from start to finish with an alternate costume.", 5,
                trigger =   is_arcade() &&
                            p1_only() &&
                            p1_alt_costume_active() == 1 &&
                            once(p1_state() == 2 && game_match() == 0 && p1_alt_costume_active() == 1) &&
                            never(p1_alt_costume_active() == 0 && p1_state() == 2) &&
                            trigger_when(game_beaten())
                )

achievement("Flawless Victory", "Win a round with a Flawless Victory on Medium Kombat CPU.", 3,
                trigger =   is_arcade() &&
                            p1_only() &&
                            p1_hp() == 1.0 &&
                            p2_hp() == 0.0  &&
                            p1_rounds_wins() > prev(p1_rounds_wins()) &&
                            settings_kombat_cpu_default()
                )


// =========================================
//                 Fatality              
// =========================================

function achiev_all_fatals(title, char_name, points) {
    achievement(title, format("Perform all Fatalities as {0} during an Arcade mode run.", char_name), points,
                trigger =   is_arcade() &&
                            p1_only() &&
                            unless(p1_character() != characters[char_name]) &&
                            unless(p2_hp() > 0) &&
                            once(match_fatality() == 1) &&
                            once(match_fatality() == 2)
                )
}

achiev_all_fatals("Spine Rip", "Scorpion", 5)
achiev_all_fatals("Mutant Dissection", "Baraka", 5)
achiev_all_fatals("Freeze and Throw", "Sub-Zero", 5)
achiev_all_fatals("Ferocious Bite", "Mileena", 5)
achiev_all_fatals("Axe, Meet Head", "Nightwolf", 5)
achiev_all_fatals("Telekinetic Slams", "Ermac", 5)
achiev_all_fatals("Voodoo Doll", "Ashrah", 5)
achiev_all_fatals("Sonic Screech", "Sindel", 5)
achiev_all_fatals("Brutality", "Li Mei", 5)
achiev_all_fatals("Fire Breath", "Bo' Rai Cho", 5)
achiev_all_fatals("Body Slam", "Hotaru", 5)
achiev_all_fatals("Katana Strike", "Kenshi", 5)
achiev_all_fatals("Batter Up", "Havik", 5)
achiev_all_fatals("Kneebone Knife", "Tanya", 5)
achiev_all_fatals("Focused Fireball", "Liu Kang", 5)
achiev_all_fatals("Torso Rip", "Kira", 5)
achiev_all_fatals("Tornado Cut", "Kabal", 5)
achiev_all_fatals("Heart Shallow", "Kobra", 5)
achiev_all_fatals("Head Kabob", "Jade", 5)
achiev_all_fatals("Stretch and Slam", "Dairou", 5)
achiev_all_fatals("Godly Essence", "Raiden", 5)
achiev_all_fatals("Arm Bash", "Darrius", 5)
achiev_all_fatals("Sword Plant", "Shujinko", 5)
achiev_all_fatals("Shuriken Slam", "Noob - Smoke", 5)

achievement("Seppuku", "Perform a Hara Kiri.", 3,
               trigger =   is_main_game() &&
                           p1_state() >= 1 &&
                           match_fatality() == 0x03 &&
                           prev(match_fatality()) == 0xFFFFFFFF &&
                           p1_hp() == 0.0 &&
                           p2_hp() > 0.0
               )

// =========================================
//                Death Traps              
// =========================================

function achiev_death_trap_arena(stage_name, stage_id, points) {
   achievement(stage_name, format("Throw your opponent on a death trap in {0}.", stage_name), points,
               trigger =   is_main_game() &&
                           p1_only() &&
                           game_stage() == stage_id &&
                           match_fatality() != 0xFFFFFFFF &&
                           match_fatality() > 0x03 && // not a Fatality or Hara Kiri
                           p1_hp() > 0.0 &&
                           p2_hp() == 0.0 &&
                           __ornext(p2_hp() < prev(p2_hp()) || prev(match_fatality()) == 0xFFFFFFFF)
               )
}

achiev_death_trap_arena("Dead Pool", 0x03, 3)
achiev_death_trap_arena("Dark Prison", 0x02, 3)
achiev_death_trap_arena("Falling Cliffs", 0x06, 3)
achiev_death_trap_arena("Quan Chi Fortress", 0x07, 3)
achiev_death_trap_arena("Hell's Foundry", 0x08, 3)
achiev_death_trap_arena("Kuatan Palace", 0x0a, 3)
achiev_death_trap_arena("Lower Mines", 0x0d, 3)
achiev_death_trap_arena("Golden Desert", 0x0c, 3)
achiev_death_trap_arena("Nexus", 0x0f, 3)
achiev_death_trap_arena("The Pit", 0x14, 3)
achiev_death_trap_arena("Slaughterhouse", 0x13, 3)
achiev_death_trap_arena("Sky Temple", 0x12, 3)
achiev_death_trap_arena("Yin Yang Island", 0x15, 3)

// =========================================
//               Puzzle Kombat              
// =========================================

function achiev_puzzle_character(title, char_name, points) {
   achievement(title, format("Finish Puzzle Kombat using only {0}.", char_name), points,
                trigger =   is_puzzle() &&
                            p1_only() &&
                            p1_character() == characters[char_name] &&
                            once(p1_state() == 1 && game_match() == 0) &&
                            never(p1_character() != characters[char_name] && p1_puzzle_wins() > prev(p1_puzzle_wins())) &&
                            trigger_when(game_match() == 5 && p1_puzzle_wins() > prev(p1_puzzle_wins()))
                )
}

achiev_puzzle_character("Edger", "Baraka", 10)
achiev_puzzle_character("Collapse", "Bo' Rai Cho", 10)
achiev_puzzle_character("Levitate", "Ermac", 10)
achiev_puzzle_character("Stack", "Jade", 10)
achiev_puzzle_character("Double Bomb", "Kabal", 10)
achiev_puzzle_character("Invisible", "Kenshi", 10)
achiev_puzzle_character("Drill", "Mileena", 10)
achiev_puzzle_character("Breaker Buster", "Nightwolf", 10)
achiev_puzzle_character("Storm", "Raiden", 10)
achiev_puzzle_character("Jumble", "Scorpion", 10)
achiev_puzzle_character("Arrange", "Sindel", 10)
achiev_puzzle_character("Freeze", "Sub-Zero", 10)

// =========================================
//                Leaderboard              
// =========================================

leaderboard("MKD Arcade Speedrun - Medium", "Best time on Arcade Mode (Medium difficulty, 2 rounds)",
           start = is_main_game() && is_arcade() && p1_only() && arcade_timer() > 0 && prev(arcade_timer()) == 0 && settings_kombat_cpu() == 2 && settings_rounds_to_win_default(),
           cancel = game_mode() != 0x00,
           submit = game_beaten(),
           value = arcade_timer() * 60,
           format = "FRAMES", lower_is_better=true)

leaderboard("MKD Arcade Speedrun - Max", "Best time on Arcade Mode (Max difficulty, 2 rounds)",
           start = is_main_game() && is_arcade() && p1_only() && arcade_timer() > 0 && prev(arcade_timer()) == 0 && settings_kombat_cpu() == 4 && settings_rounds_to_win_default(),
           cancel = game_mode() != 0x00,
           submit = game_beaten(),
           value = arcade_timer() * 60,
           format = "FRAMES", lower_is_better=true)