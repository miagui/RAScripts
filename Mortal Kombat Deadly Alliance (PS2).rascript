// Mortal Kombat: Deadly Alliance
// #ID = 19020

// =========================================
//              Memory Acessors              
// =========================================

// General
function option_difficulty() => dword(0x588EC4)
function option_rounds_to_win() => dword(0x588EC8)

function game_mode() => dword(0x40A02C)
         g_mode_arcade = 0x00
         g_mode_versus = 0x01
         g_mode_konquest = 0x02
         g_mode_krypt = 0x03
         g_mode_kontent = 0x07
         g_mode_main_menu = 0x08

function game_screen() => dword(0x408E48)
         g_screen_tym = 0x10
         g_screen_tys = 0x11
         g_screen_konquest = 0x12
         g_screen_krypt = 0x13
         g_screen_main_menu = 0x15
         g_screen_char_select = 0x19
         
function game_current_fmv1() => dword(0x40E0A5)
function game_current_fmv2() => dword(0x529a71)

function profile_plat_koins() => dword(0x550e90)
function profile_onyx_koins() => dword(0x550e94)

// Arcade and match
function arcade_player_side() => dword(0x35CD58)
function arcade_current_match() => dword(0x40AF10)

function arcade_tym_difficulty() => byte(0x551044)
function arcade_tys_difficulty() => byte(0x551045)

function tym_finished() => dword(0x40adb4)
function tys_finished() => dword(0x40ae8c)

function arcade_timer() => dword(0x0040a3cc)

function match_fatality_perfomed() => byte(0x40A35C)
function match_ended() => byte(0x40A370)

// Player
function p1_hp() => dword(0x40A394)
function p2_hp() => dword(0x40A390)
function p1_char() => byte(0x408E08)
function p2_char() => byte(0x408E0C)
function p1_state() => dword(0x40A11C)
function p2_state() => dword(0x40A120)

function p1_consecutive_wins() => dword(0x40A384)
function p2_consecutive_wins() => dword(0x40A380)
function p1_rounds_wins() => dword(0x40A38C)
function p2_rounds_wins() => dword(0x40A388)

function p1_using_costume() => bit0(0x40A5E0)

// Unlockables

unlocked_char_bits_start = 0x527650 // 
unlocked_costume_bits_start = 0x527654 // 24 bits, total 21
unlocked_krypt_bits_start = 0x550f08 // 676 bits
unlocked_konquest_missions_start = 0x550e74 // 24 bytes
unlocked_konquest_tutorial = 0x550e8c // 1 byte, duh
function krypt_epic_ruby() => bit0(0x550f41)

unlockable_chars_array = ["Jax", "Cyrax", "Hsu Hao", "Raiden", "Frost", "Kitana", "Reptile", "Nitara", "Drahmin", "Blaze", "Mokap"]

// Dictionaries

characters = {
   "Scorpion": 0,
   "Jax": 1,
   "Shang Tsung": 2,
   "Kung Lao": 3,
   "Li Mei": 4,
   "Kenshi": 5,
   "Cyrax": 6,
   "Hsu Hao": 7,
   "Moloch": 8,
   "Sonya": 9,
   "Raiden": 10,
   "Frost": 11,
   "Quan Chi": 12,
   "Mavado": 13,
   "Johnny Cage": 14,
   "Kitana": 15,
   "Reptile": 16,
   "Nitara": 17,
   "Drahmin": 18,
   "Sub-Zero": 19,
   "Bo Rai Cho": 20,
   "Kano": 21,
   "Blaze": 22,
   "Mokap": 23
}


// =========================================
//                  Utility              
// =========================================

function in_the_krypt() => game_mode() == g_mode_krypt
function in_konquest() => game_mode() == g_mode_konquest
function in_arcade() => game_mode() == g_mode_arcade

function in_tym() => game_screen() == g_screen_tym
function in_tys() => game_screen() == g_screen_tys

function p1_only() => p1_state() >= 0x02 && p2_state() == 0x00
function p1_won_round_hp() => p1_hp() > 0 && p2_hp() == 0

function game_beaten() {
    return  prev(arcade_current_match()) == 10 && // value is changed on last frame, so use as prev (delta)
            p1_rounds_wins() == option_rounds_to_win() && 
            match_ended() > prev(match_ended())
} 

// =========================================
//                   Arcade              
// =========================================

function achiev_beat_the_game(title, char_name, points, cheevo_id) {
    achievement(title, format("Finish Arcade Mode using only {0}.", char_name), points,
                trigger =   in_arcade() &&
                            p1_only() &&
                            p1_char() == characters[char_name] &&
                            once(p1_state() == 2 && arcade_current_match() == 0) &&
                            never(p1_char() != characters[char_name] && p1_rounds_wins() > prev(p1_rounds_wins())) &&
                            trigger_when(game_beaten())
                )
}

achiev_beat_the_game("Ninja Spectre", "Scorpion", 10, 0)
achiev_beat_the_game("Special Forces", "Jax", 10, 0)
achiev_beat_the_game("Sorcerer", "Shang Tsung", 10, 0)
achiev_beat_the_game("Shaolin Monk", "Kung Lao", 10, 0)
achiev_beat_the_game("Student", "Li Mei", 10, 0)
achiev_beat_the_game("Swordsman", "Kenshi", 10, 0)
achiev_beat_the_game("Mustard", "Cyrax", 10, 0)
achiev_beat_the_game("Mongolian Warrior", "Hsu Hao", 10, 0)
achiev_beat_the_game("General Blade", "Sonya", 10, 0)
achiev_beat_the_game("Thunder God", "Raiden", 10, 0)
achiev_beat_the_game("Lin Kuei", "Frost", 10, 0)
achiev_beat_the_game("Necromancer", "Quan Chi", 10, 0)
achiev_beat_the_game("Red Dragon Leader", "Mavado", 10, 0)
achiev_beat_the_game("Movie Star", "Johnny Cage", 10, 0)
achiev_beat_the_game("Edenian Princess", "Kitana", 10, 0)
achiev_beat_the_game("Saurian Warrior", "Reptile", 10, 0)
achiev_beat_the_game("Vampire", "Nitara", 10, 0)
achiev_beat_the_game("Oni Demon", "Drahmin", 10, 0)
achiev_beat_the_game("Grandmaster", "Sub-Zero", 10, 0)
achiev_beat_the_game("Trainer", "Bo Rai Cho", 10, 0)
achiev_beat_the_game("Mercenary", "Kano", 10, 0)
achiev_beat_the_game("Guardian", "Blaze", 10, 0)
achiev_beat_the_game("Motion Capture Specialist", "Mokap", 10, 0)

achievement("Deception Has Begun", "Finish Arcade Mode on Max Kombat CPU (2 rounds).", 10,
            trigger =   in_arcade() &&
                        p1_only() &&
                        game_beaten() &&
                        option_rounds_to_win() == 2 &&
                        option_difficulty() == 0x04
            )

achievement("Deadly Costume", "Finish Arcade Mode from start to finish with an alternate costume.", 5,
            trigger =   in_arcade() &&
                        p1_only() &&
                        p1_using_costume() == 1 &&
                        once(p1_state() == 2 && arcade_current_match() == 0) &&
                        never(p1_using_costume() == 0 && p1_rounds_wins() > prev(p1_rounds_wins())) &&
                        trigger_when(game_beaten())
            )

achievement("Might Master", "Break Diamond in Test Your Might.", 10,
            trigger =   in_tym() &&
                        tym_finished() == 1 &&
                        prev(tym_finished()) == 0 &&
                        arcade_tym_difficulty() == 7
            )

achievement("Vision Master", "Complete Test Your Sight in the max difficulty.", 10,
            trigger =   in_tys() &&
                        arcade_tys_difficulty() == 7 &&
                        trigger_when(tys_finished() == 1 && prev(tys_finished()) == 0)
            )

achievement("Average Hsu Hao Enjoyer", "Finish Arcade Mode using only Hsu Hao and without losing any match (Medium difficulty, 2 rounds).", 25,
            trigger =   in_arcade() &&
                        p1_only() &&
                        once(game_screen() == g_screen_char_select && arcade_current_match() == 0 && p1_char() == characters["Hsu Hao"]) &&
                        never(p1_char() != characters["Hsu Hao"] && p1_rounds_wins() == 1) &&
                        never(p1_consecutive_wins() < prev(p1_consecutive_wins())) &&
                        trigger_when(game_beaten()) &&
                        option_rounds_to_win() == 2 &&
                        option_difficulty() >= 2
            )

// =========================================
//                Fatalities              
// =========================================

function achiev_fatality(title, char_name, points, cheevo_id) {
    achievement(title, format("Perform a Fatality as {0}.", char_name), points,
                trigger =   in_arcade() &&
                            p1_only() &&
                            p1_char() == characters[char_name] &&
                            p1_hp() > 0 &&
                            match_fatality_perfomed() == 1 &&
                            prev(match_fatality_perfomed()) == 0
                )
}

achiev_fatality("Spear Shot", "Scorpion", 3, 0)
achiev_fatality("Head Stomp", "Jax", 3, 0)
achiev_fatality("Soul Steal", "Shang Tsung", 3, 0)
achiev_fatality("Hat Toss", "Kung Lao", 3, 0)
achiev_fatality("Fatal Kicks", "Li Mei", 3, 0)
achiev_fatality("Telekinetic Contortion", "Kenshi", 3, 0)
achiev_fatality("Internal Grinder", "Cyrax", 3, 0)
achiev_fatality("Chest Laser", "Hsu Hao", 3, 0)
achiev_fatality("Kiss of Poisoness", "Sonya", 3, 0)
achiev_fatality("Electrocution", "Raiden", 3, 0)
achiev_fatality("Freeze Shatter", "Frost", 3, 0)
achiev_fatality("Neck Stretch", "Quan Chi", 3, 0)
achiev_fatality("Kick Thrust", "Mavado", 3, 0)
achiev_fatality("Brain Rip", "Johnny Cage", 3, 0)
achiev_fatality("Kiss of Death", "Kitana", 3, 0)
achiev_fatality("Acid Meal", "Reptile", 3, 0)
achiev_fatality("Feast of Blood", "Nitara", 3, 0)
achiev_fatality("Club Smash", "Drahmin", 3, 0)
achiev_fatality("Skeleton Rip", "Sub-Zero", 3, 0)
achiev_fatality("Belly Flop", "Bo Rai Cho", 3, 0)
achiev_fatality("Organ Donor", "Kano", 3, 0)

// =========================================
//              Konquest Missions              
// =========================================

achievement("Young Monk", "Finish the 8 tutorial missions from Konquest Mode.", 5,
                trigger =   in_konquest() &&
                            byte(unlocked_konquest_tutorial) == 8 &&
                            prev(byte(unlocked_konquest_tutorial)) == 7
                )

function achiev_konquest_missions(char_name, points, cheevo_id) {
    achievement(char_name + " Master", format("Finish all {0} missions from Konquest Mode.", char_name), points,
                trigger =   in_konquest() &&
                            byte(unlocked_konquest_missions_start + characters[char_name]) == 10 &&
                            prev(byte(unlocked_konquest_missions_start + characters[char_name])) == 9
                )
}


achiev_konquest_missions("Scorpion", 10, 0)
achiev_konquest_missions("Jax", 10, 0)
achiev_konquest_missions("Shang Tsung", 10, 0)
achiev_konquest_missions("Kung Lao", 10, 0)
achiev_konquest_missions("Li Mei", 10, 0)
achiev_konquest_missions("Kenshi", 10, 0)
achiev_konquest_missions("Cyrax", 10, 0)
achiev_konquest_missions("Hsu Hao", 10, 0)
achiev_konquest_missions("Sonya", 10, 0)
achiev_konquest_missions("Raiden", 10, 0)
achiev_konquest_missions("Frost", 10, 0)
achiev_konquest_missions("Quan Chi", 10, 0)
achiev_konquest_missions("Mavado", 10, 0)
achiev_konquest_missions("Johnny Cage", 10, 0)
achiev_konquest_missions("Kitana", 10, 0)
achiev_konquest_missions("Reptile", 10, 0)
achiev_konquest_missions("Nitara", 10, 0)
achiev_konquest_missions("Drahmin", 10, 0)
achiev_konquest_missions("Sub-Zero", 10, 0)
achiev_konquest_missions("Bo Rai Cho", 10, 0)
achiev_konquest_missions("Kano", 10, 0)


// =========================================
//                   Misc              
// =========================================


achievement("Flawless Victory", "Win a round with a Flawless Victory (Medium difficulty).", 3,
            trigger =   in_arcade() &&
                        p1_only() &&
                        p1_hp() == 0x3f800000 &&
                        p1_rounds_wins() > prev(p1_rounds_wins()) &&
                        option_difficulty() >= 2
            )

achievement("Flawless Against the Sorcerer", "Defeat Shang Tsung with a Flawless Victory (Medium difficulty).", 5,
            trigger =   in_arcade() &&
                        p1_only() &&
                        p1_hp() == 0x3f800000 &&
                        p1_rounds_wins() > prev(p1_rounds_wins()) &&
                        p2_char() == characters["Shang Tsung"] &&
                        option_difficulty() >= 2
            )

achievement("Flawless Against the Necromancer", "Defeat Quan Chi with a Flawless Victory (Medium difficulty).", 5,
            trigger =   in_arcade() &&
                        p1_only() &&
                        p1_hp() == 0x3f800000 &&
                        p1_rounds_wins() > prev(p1_rounds_wins()) &&
                        p2_char() == characters["Quan Chi"] &&
                        option_difficulty() >= 2
            )

achievement("Flawless Against the Oni", "Defeat Moloch with a Flawless Victory (Medium difficulty).", 5,
            trigger =   in_arcade() &&
                        p1_only() &&
                        p1_hp() == 0x3f800000 &&
                        p1_rounds_wins() > prev(p1_rounds_wins()) &&
                        p2_char() == characters["Moloch"] &&
                        option_difficulty() >= 2
            )

achievement("Deadly Alliance DLC", "Unlock all 11 characters.", 25,
            trigger =   measured(sum_of(unlockable_chars_array, char_name => bit(characters[char_name], unlocked_char_bits_start)) == 11) &&
                        (
                            prev(sum_of(unlockable_chars_array, char_name => bit(characters[char_name], unlocked_char_bits_start))) == 9 ||
                            prev(sum_of(unlockable_chars_array, char_name => bit(characters[char_name], unlocked_char_bits_start))) == 10
                        )

                        
            )

achievement("Kombat Fashionista", "Unlock all the 21 costumes.", 25,
            trigger =   in_the_krypt() &&
                        measured(sum_of(characters, char_name => bit(characters[char_name], unlocked_costume_bits_start)) == 21) &&
                        prev(sum_of(characters, char_name => bit(characters[char_name], unlocked_costume_bits_start)))  == 20
            )

achievement("Krypt Keeper", "Unlock all the 676 koffins from the Krypt.", 50,
            trigger =   in_the_krypt() &&
                        measured(sum_of(range(0, 84), index => bitcount(unlocked_krypt_bits_start + index)) == 676) &&
                        prev(sum_of(range(0, 84), index => bitcount(unlocked_krypt_bits_start + index))) == 675
            )

achievement("Epic Koin", "Obtain 1 Shiny Ruby Koin!!11!", 2,
            trigger =   in_the_krypt() &&
                        krypt_epic_ruby() == 1 &&
                        prev(krypt_epic_ruby()) == 0
            )

achievement("Cooking With Scorpion", "Chopping!", 2,
            trigger =   game_mode() == g_mode_kontent &&
                        game_current_fmv1() == 0x4b4f4f43 &&
                        game_current_fmv2() != 0x4b4f4f43 &&
                        prev(game_current_fmv2()) == 0x4b4f4f43
            )

// =========================================
//                Leaderboard              
// =========================================

leaderboard("MKDA Arcade Speedrun - Medium", "Best time on Arcade Mode (Medium difficulty, 2 rounds)",
           start =  in_arcade() && p1_only() && arcade_timer() > 0 &&  prev(arcade_timer()) == 0 && option_difficulty() == 2 && option_rounds_to_win() == 2,
           cancel = game_mode() != g_mode_arcade,
           submit = game_beaten(),
           value = arcade_timer() * 60,
           format = "FRAMES", lower_is_better=true)

leaderboard("MKDA Arcade Speedrun - Max", "Best time on Arcade Mode (Max difficulty, 2 rounds)",
           start =  in_arcade() && p1_only() && arcade_timer() > 0 &&  prev(arcade_timer()) == 0 && option_difficulty() == 4 && option_rounds_to_win() == 2,
           cancel = game_mode() != g_mode_arcade,
           submit = game_beaten(),
           value = arcade_timer() * 60,
           format = "FRAMES", lower_is_better=true)