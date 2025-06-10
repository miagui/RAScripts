// Arcana Heart
// #ID = 20524

// Game
function p1_active() => bit0(0x465DC0)
function p2_active() => bit1(0x465DC0)
function game_players_active() => byte(0x465DC0)
function game_mode() => byte(0x465E00)
         MODE_STORY = 0x01
         MODE_ARCADE = 0x02
         MODE_VERSUS_1P = 0x03
         MODE_VERSUS_2P = 0x04
         MODE_TRAINING = 0x05

function arcade_match() => byte(0x465E14)
function arcade_score() => dword(0x465e6c) 
function story_dialogue() => byte(0x465e24)

function game_char_selected_flag() => byte(0x465e3c)
function game_arcana_selected_flag() => byte(0x465e40)

function match_round_timer() => dword(0x46900C)

// Settings
function settings_difficulty() => byte(0x465DDC)
function settings_time_limit() => byte(0x465DE0)
function settings_cpu_matches() => byte(0x465DE8)

function default_settings_lv4() {
   return(
      settings_difficulty() >= 4 &&
      settings_time_limit() == 0 &&
      settings_cpu_matches() == 6
   )
}

function default_settings_lv8() {
   return(
      settings_difficulty() == 8 &&
      settings_time_limit() == 0 &&
      settings_cpu_matches() == 6
   )
}

// Training
function training_total_damage() => dword(0x4919F8)
function training_damage() => dword(0x491A00)
function training_recovery() => byte(0x4919c8)

// P1
function p1_character() => byte(0x465E04)
function p1_arcana() => byte(0x465E08)
function p1_hp() => dword(0x469FA8)
function p1_total_hp() => dword(0x469fac)
function p1_rounds_won() => byte(0x46B25C)
function p1_continues_used() => dword(0x465e2c)

function p1_hit_combo() => dword(0x46B22C)
function p1_round_finishing_move() => dword(0x46B268)

function p1_move() => word(0x1FCA5BC)
function p1_state_bitflags() => byte(0x469EF3)
function p1_arcana_state() => byte(0x469EF4)

// P2
function p2_character() => byte(0x465E18)
function p2_hp() => dword(0x46B094)
function p2_rounds_won() => byte(0x46B2AC)

chars = {
   "Heart Aino": 0,
   "Saki Tsuzura": 1,
   "Kamui Tokinomiya": 2,
   "Konoha": 3,
   "Maori Kasuga": 4,
   "Mei-Fang": 5,
   "Lilica Felchenerow": 6,
   "Lieselotte Achenbach": 7,
   "Yoriko Yasuzumi": 8,
   "Kira Daidohji": 9,
   "Fiona Mayfield": 10,
}

// =========================================
//                  Utility              
// =========================================

function p1_only() => never(game_players_active() != 0x01)

function reset_main_menu() => never(game_mode() == 0x00)

function story_beaten() {
   return(
      prev(arcade_match()) == 0x07 &&
      arcade_match() == 0x08 &&
      story_dialogue() == 0x0a
      )
}

// =========================================
//                  Arcade              
// =========================================

function achiev_story(title, char, points) {
   achievement(title, format("Finish Story Mode as {0}.", char), 10, type="win_condition",
               trigger = p1_only() &&
                         game_mode() == MODE_STORY &&
                         p1_character() == chars[char] &&
                         story_beaten()                      
               )
}

achiev_story("The Extraordinarily Rare Maiden", "Heart Aino", 5)
achiev_story("Sa-Sa", "Saki Tsuzura", 5)
achiev_story("The Millennial Guardian", "Kamui Tokinomiya", 5)
achiev_story("Retainer of the Millenial Guardian", "Konoha", 3)
achiev_story("Mao-Mao", "Maori Kasuga", 5)
achiev_story("Mei-Mei ", "Mei-Fang", 5)
achiev_story("Lili-Lili ", "Lilica Felchenerow", 5)
achiev_story("Liesy-Poo", "Lieselotte Achenbach", 5)
achiev_story("Yori-Poo", "Yoriko Yasuzumi", 5)
achiev_story("Swimsuit Scientist", "Kira Daidohji", 5)
achiev_story("Maid Lady", "Fiona Mayfield", 5)

achievement("Take the Breath of God", "Finish Story Mode on Level-8 difficulty (default settings).", 10,
               trigger = p1_only() &&
                         game_mode() == MODE_STORY &&
                         trigger_when(story_beaten()) &&                 
                         default_settings_lv8()
            )

achievement("Save The Future", "Finish Story Mode without using a continue (default settings).", 25,
               trigger = p1_only() &&
                         game_mode() == MODE_STORY &&
                         reset_main_menu() &&
                         once(arcade_match() == 0 && game_char_selected_flag() == 0) &&
                         never(p2_rounds_won() == 2) &&
                         never(story_dialogue() == 0x0c) &&
                         trigger_when(story_beaten()) &&                  
                         default_settings_lv4()
            )

achievement("The New World", "Finish Story Mode with a bad ending.", 5,
               trigger = p1_only() &&
                         game_mode() == MODE_STORY &&
                         arcade_match() == 0x08 &&
                         story_dialogue() == 0x0c &&
                         prev(story_dialogue()) != 0x0c
            )

achievement("Zoning Madness", "Defeat Mildred's first phase (default settings).", 5,
               trigger = p1_only() &&
                         game_mode() == MODE_STORY &&
                         prev(story_dialogue()) == 0x07 &&     
                         story_dialogue() == 0x08 &&
                         default_settings_lv4() 
            )

achievement("One Love Punch, Coming Right Up!", "Finish Arcade Mode (default settings).", 5, type="win_condition",
               trigger = p1_only() &&
                         game_mode() == MODE_ARCADE &&
                         prev(arcade_match()) == 0x09 &&   
                         arcade_match() == 0x0a &&
                         default_settings_lv4()   
            )

achievement("Hi Score Girl", "Finish Arcade Mode with over 1 million score (default settings).", 25,
               trigger = p1_only() &&
                         game_mode() == MODE_ARCADE &&
                         arcade_score() > prev(arcade_score()) &&
                         arcade_match() == 0x0a &&
                         arcade_score() >= 1000000 &&
                         default_settings_lv4()   
            )

// =========================================
//                   Misc              
// =========================================

achievement("Perfect Arcana", "Win a round with a Perfect (default settings).", 5,
               trigger = p1_only() &&
                         game_mode() != MODE_TRAINING &&
                         p1_hp() == p1_total_hp() &&
                         p1_rounds_won() > prev(p1_rounds_won()) &&
                         default_settings_lv4()
            )

// =========================================
//                  Combos              
// =========================================

function achiev_combo(title, char, hits, points) {
    achievement(title, format("Perform a {0}-hit combo with \"Recovery\" set to \"Aerial\" as {1} during Training mode (no Arcana moves).", hits, char), points,
                trigger =   p1_active() == 1 &&
                            game_mode() == 0x05 && // training
                            __ornext(training_recovery() == 1 || training_recovery() == 3) && // aerial or both
                            never(p1_character() != chars[char]) &&
                            never(p1_move() >= 0x300 && p1_move() != 0x337 && p1_move() != 0x338) && // arcana moves are above 0x300 apparently 
                            never(p1_arcana_state() > 0) &&
                            never(p1_hit_combo() == 0) &&
                            once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                            trigger_when(p1_hit_combo() >= hits)
                )
}


// achiev_combo("The Extraordinarily Rare Maiden", "Heart Aino", 20, 5)
// achiev_combo("Sa-Sa", "Saki Tsuzura", 15, 10)
// achiev_combo("The Millennial Guardian", "Kamui Tokinomiya", 9, 5)
// achiev_combo("Retainer of the Millenial Guardian", "Konoha", 104, 5)
// achiev_combo("Mao-Mao", "Maori Kasuga", 13, 5)
// achiev_combo("Mei-Mei", "Mei-Fang", 15, 5)
// achiev_combo("Lili-Lili", "Lilica Felchenerow", 15, 10)
// achiev_combo("Liesy-Poo", "Lieselotte Achenbach", 20, 5)
// achiev_combo("Yori-Poo", "Yoriko Yasuzumi", 17, 5)
// achiev_combo("Swimsuit Scientist", "Kira Daidohji", 6, 5)
// achiev_combo("Maid Lady", "Fiona Mayfield", 20, 5)

achiev_combo("Awesomely Heartful Punch", "Heart Aino", 20, 5)
achiev_combo("Liath Fail", "Saki Tsuzura", 15, 10)
achiev_combo("Seizan", "Kamui Tokinomiya", 9, 5)
achiev_combo("Doppelganger", "Konoha", 104, 5)
achiev_combo("Taima no Zuikaku", "Maori Kasuga", 13, 5)
achiev_combo("Four Emperors", "Mei-Fang", 15, 5)
achiev_combo("Hurricane Edge", "Lilica Felchenerow", 13, 10)
achiev_combo("Deception", "Lieselotte Achenbach", 20, 5)
achiev_combo("Demon King", "Yoriko Yasuzumi", 17, 5)
achiev_combo("Tokyo Launcher", "Kira Daidohji", 6, 5)
achiev_combo("Gae Bulg", "Fiona Mayfield", 20, 5)



// =========================================
//                Leaderboards              
// =========================================

