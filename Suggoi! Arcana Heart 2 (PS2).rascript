// Suggoi! Arcana Heart 2
// #ID = 22113

// Settings
function settings_difficulty() => dword(0x45E5E0)
function settings_vs_rounds() => dword(0x45E5E8)
function settings_cpu_matches() => dword(0x45E5F0)
function settings_round_time() => dword(0x45E5F8)

function default_settings_lv4() {
   return(
      settings_difficulty() >= 4 &&
      settings_round_time() == 0 &&
      settings_cpu_matches() == 6
   )
}

function default_settings_lv8() {
   return(
      settings_difficulty() == 8 &&
      settings_round_time() == 0 &&
      settings_cpu_matches() == 6
   )
}

// Game
function game_players_active() => byte(0x7A22E0)
function game_mode() => dword(0x7A2350)
         MODE_STORY = 0x01
         MODE_ARCADE = 0x02
         MODE_VERSUS_1P = 0x03
         MODE_VERSUS_2P = 0x04
         MODE_TRAINING = 0x05

function game_character_selected_flag() => byte(0x7A2390)
function game_arcana_selected_flag() => byte(0x7A2394)

function round_state() => dword(0x79425C)
function round_timer() => dword(0x79428C)

function arcade_match() => dword(0x7A2364)
function arcade_score() => dword(0x7A23F4)
function story_dialogue() => dword(0x7A2378)

// P1
function p1_character() => dword(0x794220)
function p1_arcana() => dword(0x794238)

function p1_hp() => dword(0x79614C)
function p1_total_hp() => dword(0x796150)
function p1_gauge() => dword(0x795EFC)
function p1_hit_combo() => dword(0x79847C)

function p1_rounds_won() => dword(0x798554)
function p1_round_finishing_move() => dword(0x798560)

function p1_move_cancel_sprite_flicker() => dword(0x795FD0)
function p1_arcana_blast_duration() => dword(0x796080)
function p1_arcana_blast() => bit3(0x796099)
function p1_move() => dword(0x1FCA540)

function p1_character_story() => dword(0x7A2354)
function p1_arcana_story() => dword(0x7A2358)

// P2
function p2_character() => dword(0x794224)
function p2_arcana() => dword(0x79423C)

function p2_hp() => dword(0x798220)
function p2_total_hp() => dword(0x798224)

function p2_rounds_won() => dword(0x79864C)

chars_full = {
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
   "Petra Johanna Lagerkvist": 12,
   "Zenia Valov": 13,
   "Angelia Avallone": 14,
   "Elsa la Conti": 15,
   "Clarice di Lanza": 16,
   "Catherine Kyoubashi": 17,
   "Dorothy Albright": 18,
   "Angelia Avallone (Boss)": 19,
   "Akane Inuwaka": 20,
   "Nazuna Inuwaka": 21,
   "Parace L'sia": 22,
}

chars = {
   "Heart": 0,
   "Saki": 1,
   "Kamui": 2,
   "Konoha": 3,
   "Maori": 4,
   "Mei-Fang": 5,
   "Lilica": 6,
   "Lieselotte": 7,
   "Yoriko": 8,
   "Kira": 9,
   "Fiona": 10,
   "Petra": 12,
   "Zenia": 13,
   "Angelia": 14,
   "Elsa": 15,
   "Clarice": 16,
   "Catherine": 17,
   "Dorothy": 18,
   "Angelia (Boss)": 19,
   "Akane": 20,
   "Nazuna": 21,
   "Parace L'sia": 22,
}

// =========================================
//                  Utility              
// =========================================

function p1_only() => never(game_players_active() != 0x01)
function reset_main_menu() => never(game_mode() == 0x00)

function story_beaten() {
   return(
      prev(arcade_match()) == 0x06 &&
      arcade_match() == 0x07 &&
      __ornext(story_dialogue() == 0x0c || story_dialogue() == 0x18) 
      )
}

// =========================================
//                  Arcade              
// =========================================

function achiev_story(title, char, points) {
   achievement(title, format("Finish Story Mode with the good ending as {0}.", char), 10,
               trigger = p1_only() &&
                         game_mode() == MODE_STORY &&
                         p1_character() == chars[char] &&
                         story_beaten()                      
               )
}

achiev_story("Heart Aino", "Heart", 10)
achiev_story("Saki Tsuzura", "Saki", 10)
achiev_story("Kamui Tokinomiya", "Kamui", 10)
achiev_story("Konoha", "Konoha", 10)
achiev_story("Maori Kasuga", "Maori", 10)
achiev_story("Mei-Fang", "Mei-Fang", 10)
achiev_story("Lilica Felchenerow", "Lilica", 10)
achiev_story("Lieselotte Achenbach", "Lieselotte", 10)
achiev_story("Yoriko Yasuzumi", "Yoriko", 10)
achiev_story("Kira Daidohji", "Kira", 10)
achiev_story("Fiona Mayfield", "Fiona", 10)
achiev_story("Petra Johanna Lagerkvist", "Petra", 10)
achiev_story("Zenia Valov", "Zenia", 10)
achiev_story("Angelia Avallone", "Angelia", 10)
achiev_story("Elsa la Conti", "Elsa", 10)
achiev_story("Clarice di Lanza", "Clarice", 10)
achiev_story("Catherine Kyoubashi", "Catherine", 10)
achiev_story("Dorothy Albright", "Dorothy", 10)
achiev_story("Akane Inuwaka", "Akane", 10)
achiev_story("Nazuna Inuwaka", "Nazuna", 10)

achievement("Lovable Merlin", "Finish Story Mode on Level-8 difficulty (default settings).", 10,
               trigger = p1_only() &&
                         game_mode() == MODE_STORY &&
                         trigger_when(story_beaten()) &&                 
                         default_settings_lv8()
            )

achievement("Holy Spirit of Disaster", "Finish Story Mode without using a continue (default settings).", 25,
               trigger = p1_only() &&
                         game_mode() == MODE_STORY &&
                         reset_main_menu() &&
                         once(arcade_match() == 0 && game_character_selected_flag() == 0) &&
                         never(p2_rounds_won() == 2) &&
                         never(story_dialogue() == 0x0d) &&
                         trigger_when(story_beaten()) &&                  
                         default_settings_lv4()
            )

achievement("Great Kanto Collapse", "Finish Story Mode with the bad ending.", 5,
               trigger = p1_only() &&
                         game_mode() == MODE_STORY &&
                         arcade_match() == 0x07 &&
                         story_dialogue() == 0x0d &&
                         prev(story_dialogue()) != 0x0d
            )

achievement("Millennium Keeper", "Defeat Parace L'sia and finish Story Mode (default settings).", 50,
               trigger = p1_only() &&
                         game_mode() == MODE_STORY &&
                         prev(arcade_match()) == 0x06 &&
                         arcade_match() == 0x07 &&
                         story_dialogue() == 0x18 &&
                         default_settings_lv4()
            )

achievement("Arcana Arcade Adventure!!", "Finish Arcade Mode (default settings).", 5,
               trigger = p1_only() &&
                         game_mode() == MODE_ARCADE &&
                         prev(arcade_match()) == 0x07 &&   
                         arcade_match() == 0x08 &&
                         default_settings_lv4()   
            )

achievement("One Million Hearts!!", "Finish Arcade Mode with over 1 million score (default settings).", 25,
               trigger = p1_only() &&
                         game_mode() == MODE_ARCADE &&
                         prev(arcade_match()) == 0x07 &&
                         arcade_match() == 0x08 &&
                         arcade_score() >= 1000000 &&
                         default_settings_lv4()   
            )

// =========================================
//              Critical Heart              
// =========================================

function achiev_critical_finish(title, char, points) {
   achievement(title, format("{0}: Defeat the CPU with a Critical Heart finish.", char), points,
               trigger =   p1_only() &&
                           game_mode() != MODE_TRAINING &&
                           p1_character() == chars[char] &&
                           p1_round_finishing_move() == 0x08 &&
                           prev(p1_round_finishing_move()) == 0xFFFFFFFF
               )
}

achiev_critical_finish("Shimatsuri", "Kamui", 10)
achiev_critical_finish("Konoha Special", "Konoha", 5)

achiev_critical_finish("Funha", "Mei-Fang", 5)
achiev_critical_finish("Cross Edge Typhoon", "Lilica", 5)
achiev_critical_finish("Crimson Metzeln Stained Night", "Lieselotte", 5)
achiev_critical_finish("The Inferno from the Demon World that Scorches Both Heaven and Earth", "Yoriko", 5)
achiev_critical_finish("Last Armageddon Drop", "Kira", 10)

achiev_critical_finish("L.G.A Superior Fire", "Petra", 5)
achiev_critical_finish("Final Razdelerie", "Zenia", 5)
achiev_critical_finish("A Maiden's Heart is Fickle!", "Angelia", 5)
achiev_critical_finish("Requiem", "Elsa", 5)
achiev_critical_finish("Il Risveglio", "Clarice", 5)

achiev_critical_finish("Magician's Choice", "Dorothy", 5)

