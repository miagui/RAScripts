// NeoGeo Battle Coliseum
// #ID = 18726

// Settings
function settings_timer() => byte(0x43C708)
function settings_difficulty() => byte(0x43C709)
function settings_difficulty_lv4() => byte(0x43C709) >= 3
function settings_default() => byte(0x43C709) >= 3 && byte(0x43C708) == 0

// Game
function game_battle_bonus() => byte(0x340852)
function game_continue_services() => byte(0x340853)
function game_state() => word(0x3408E6)
         GS_CHARACTER_SELECT = 0x0301
         GS_ORDER_SELECT = 0x0302
         GS_FIGHTING = 0x0303

function game_context() => byte(0x3408E7)

function p1_active_state() => byte(0x3408EA)
function p2_active_state() => byte(0x3408EB)

function match_timer() => word(0x3408FA)

function p1_survival_wins() => word(0x340938)
function p1_double_assaults_hit() => word(0x34093C)
function p1_partner_swaps() => word(0x34093E)

function p1_normal_move_finishes() => word(0x340940)
function p1_special_move_finishes() => word(0x340942)
function p1_desperation_move_finishes() => word(0x340944)
function p1_d_assault_finishes() => word(0x340946)

function p1_move_type_hit() => byte(0x34094C)
function p1_gauge() => word(0x34095A)
function p1_hit_combo() => byte(0x34092B)

function p1_char_ptr() => tbyte(0x34096C)
function p1_current_char() => word(tbyte(p1_char_ptr() + 0x10) + 0xea)
function p1_move() => word(tbyte(p1_char_ptr() + 0x10) + 0xec)
function p1_special_d_assault_condition() => word(tbyte(p1_char_ptr() + 0x10) + 0xf8)
function p1_current_move_type() => word(tbyte(p1_char_ptr() + 0x10) + 0x3f0)

function p1_char_id_entity(char_ptr) => byte(tbyte(tbyte(char_ptr) + 0x10) + 0xea)
function p1_move_entity(char_ptr) => word(tbyte(tbyte(char_ptr) + 0x10) + 0xec)
function p1_hit_type_entity(char_ptr) => low4(tbyte(tbyte(char_ptr) + 0x10) + 0x49a)

function p1_slot1_character() => byte(0x340A05)
function p1_slot1_hp() => word(0x340A0C)
function p1_slot2_character() => byte(0x340A21)
function p1_slot2_hp() => word(0x340A28)

function p1_normal_move_hits() => word(0x340A3C)
function p1_special_move_hits() => word(0x340A5A)
function p1_desperation_move_hits() => word(0x340A66)
function p1_d_assaults_hits() => word(0x340A72)

function p1_matches_fought() => word(0x340AA6)
function p1_losses() => word(0x340AA8)
function p1_wins() => word(0x340AAC)

// P2
function p2_slot1_character() => byte(0x340BB5)
function p2_slot1_hp() => word(0x340BBC)
function p2_slot2_character() => byte(0x340BD1)
function p2_slot2_hp() => word(0x340BD8)

characters = {
   "Yuki": 0,
   "Ai": 1,
   "Kyo": 2,
   "Iori": 3,
   "Mr. Karate": 4,
   "Terry": 5,
   "Haohmaru": 6,
   "Genjyuro": 7,
   "Kaede": 8,
   "Moriya": 9,
   "K'": 10,
   "Rock": 11,
   "Mai": 12,
   "Shermie": 13,
   "Geese": 14,
   "Mr. Big": 15,
   "Nakoruru": 16,
   "Hotaru": 17,
   "Washizuka": 18,
   "Kim": 19,
   "Akari": 20,
   "Shiki": 21,
   "Hanzo": 22,
   "Fuuma": 23,
   "Mudman": 24,
   "Tung Fu Rue": 25,
   "Marco": 26,
   "Mars People": 27,
   "King Lion": 28,
   "Cyber Woo": 29,
   "Athena": 30,
   "Kisarah": 31,
   "Chonrei": 32,
   "Chonshu": 33,
   "Neo-Dio": 34,
   "Asura": 35,
   "Mizuchi": 36,
   "Robert": 37,
   "Lee": 38,
   "Goodman": 39
}

// =========================================
//                  Utility              
// =========================================

function p1_only() => p1_active_state() > 0 && p2_active_state() == 0
function in_game() => game_context() == 0x03
function in_char_select() => game_state() == GS_CHARACTER_SELECT
function is_fighting() => game_state() == GS_FIGHTING

function p1_won_match_hp() => __ornext(p2_slot1_hp() == 0xFFFF && p2_slot1_hp() != prev(p2_slot1_hp()) || p2_slot2_hp() == 0xFFFF && p2_slot2_hp() != prev(p2_slot2_hp()))

function is_boss() {
    __ornext(p2_slot1_character() == characters["Neo-Dio"] ||
            p2_slot1_character() == characters["Mizuchi"] ||
            p2_slot1_character() == characters["Goodman"] ||
            p2_slot1_character() == characters["King Lion"])
}

function game_beaten() {
    return(
        __ornext(p2_slot1_character() == characters["Neo-Dio"] ||
                p2_slot1_character() == characters["Mizuchi"] ||
                p2_slot1_character() == characters["Goodman"] ||
                p2_slot1_character() == characters["King Lion"]
               ) &&
        p1_wins() > prev(p1_wins())
    )
}

function no_continue_services() => never(game_continue_services() > 0) && never(game_battle_bonus() > 0) 

function p1_team_has_char(char_id) => p1_slot1_character() == char_id || p1_slot2_character() == char_id
function p1_dont_have_char(char_id) => p1_slot1_character() != char_id && p1_slot2_character() != char_id

// =========================================
//                Arcade Mode               
// =========================================

function achiev_beat_game_team(title, char1, char2) {
    achievement(title, format("Beat the game using only {0} and {1}.", char1, char2), 10,
                trigger = p1_only() &&
                          in_game() &&
                          once(p1_survival_wins() == 0 && in_char_select() && p1_active_state() > 0) &&
                          never(p1_dont_have_char(characters[char1]) && p1_wins() > prev(p1_wins())) &&
                          never(p1_dont_have_char(characters[char2]) && p1_wins() > prev(p1_wins())) &&
                          p1_team_has_char(characters[char1]) &&
                          p1_team_has_char(characters[char2]) &&
                          trigger_when(game_beaten())
                )
}

achiev_beat_game_team("Heroes of the NEOGEO World", "Yuki", "Ai")
achiev_beat_game_team("Anti-Orochis", "Kyo", "Iori")
achiev_beat_game_team("Art of Fighting", "Mr. Karate", "Robert")
achiev_beat_game_team("Mark of the Wolves", "Terry", "Rock")
achiev_beat_game_team("Samurai Showdown", "Haohmaru", "Genjyuro")
achiev_beat_game_team("Legendary Warriors", "Kaede", "Moriya")
achiev_beat_game_team("World Heroes", "Hanzo", "Fuuma")
achiev_beat_game_team("King of Fighters", "K'", "Shermie")
achiev_beat_game_team("Crime Bosses", "Geese", "Mr. Big")
achiev_beat_game_team("Garou Dentetsu", "Mai", "Kim")
achiev_beat_game_team("The Jin Brothers", "Chonrei", "Chonshu")
achiev_beat_game_team("Martial Arts Masters", "Tung Fu Rue", "Lee")
achiev_beat_game_team("Samurai Showdown 64", "Shiki", "Asura")
achiev_beat_game_team("The Shamans", "Nakoruru", "Mudman")
achiev_beat_game_team("Heavy Machinery", "Marco", "Cyber Woo")
achiev_beat_game_team("Soft Girls", "Nakoruru", "Hotaru")
achiev_beat_game_team("The Last Blade", "Akari", "Washizuka")
achiev_beat_game_team("Gaia's Will", "Mizuchi", "Shermie")
achiev_beat_game_team("Franchise Fighters Bosses", "King Lion", "Neo-Dio")
achiev_beat_game_team("Inspiring Schoolgirls", "Athena", "Kisarah")
achiev_beat_game_team("Metal Slug", "Marco", "Mars People")

achievement("The Mind of Origin", "Defeat Mizuchi (Level-4, Normal Time).", 10,
                trigger = p1_only() &&
                          in_game() &&
                          settings_default() &&
                          p2_slot1_character() == characters["Mizuchi"] &&
                          p1_wins() > prev(p1_wins())
                )

achievement("The Devil of Incarnation", "Defeat Neo-Dio (Level-4, Normal Time).", 25,
                trigger = p1_only() &&
                          in_game() &&
                          settings_default() &&
                          p2_slot1_character() == characters["Neo-Dio"] &&
                          p1_wins() > prev(p1_wins())
                )


achievement("Understand Don't You", "Defeat King Leo (Level-4, Normal Time).", 25,
                trigger = p1_only() &&
                          in_game() &&
                          settings_default() &&
                          p2_slot1_character() == characters["King Lion"] &&
                          p1_wins() > prev(p1_wins())
                )

achievement("Hell or Heaven", "Defeat Goodman (Level-4, Normal Time).", 25,
                trigger = p1_only() &&
                          in_game() &&
                          settings_default() &&
                          p2_slot1_character() == characters["Goodman"] &&
                          p1_wins() > prev(p1_wins())
                )
                
achievement("Mightiest Warrior From the Coliseum", "Defeat any final boss without winning by a time-out and no continue services (Level-4, Normal Time).", 25,
                trigger = p1_only() &&
                          is_fighting() &&
                          settings_default() &&
                          is_boss() &&
                          no_continue_services() &&
                          trigger_when(p1_won_match_hp())
                )

achievement("Spirit of Gorilla King", "Beat the game without using continue services on Level-7 difficulty (Normal Time).", 25,
                trigger = p1_only() &&
                          in_game() &&
                          once(p1_survival_wins() == 0 && in_char_select() && p1_active_state() > 0) &&
                          no_continue_services() &&
                          settings_timer() == 0 &&
                          settings_difficulty() == 6  &&
                          trigger_when(game_beaten())
                )

achievement("Maniac Sense", "Beat the game without using a continue (Level-4, Normal Time).", 25,
                trigger = p1_only() &&
                          in_game() &&
                          once(p1_survival_wins() == 0 && in_char_select() && p1_active_state() > 0) &&
                          never(p1_losses() > prev(p1_losses()))  &&
                          settings_default() &&
                          trigger_when(game_beaten())
                )

achievement("NEOGEO Winner", "Reach 15 wins during Arcade mode (Level-4, Normal Time).", 25,
                trigger = p1_only() &&
                          in_game() &&
                          p1_survival_wins() == 15 && prev(p1_survival_wins()) == 14 &&
                          settings_default()
            )


// =========================================
//             Special D-Assaults              
// =========================================


function achiev_special_assault(title, char1, char2) {
    achievement(title, format("Hit your opponent with a Special D-Assault as {0}/{1}.", char1, char2), 5,
                trigger = p1_only() &&
                          is_fighting() &&
                          __ornext(p1_current_char() == characters[char1] || p1_current_char() == characters[char2]) &&
                          never(p1_move() == 0x94) &&
                          never(p1_move() == 0x97) &&
                          never(p1_move() == 0x98) &&
                          never(p1_move() == 0x9f) &&
                          once(p1_special_d_assault_condition() > prev(p1_special_d_assault_condition())) &&
                          never(p1_current_move_type() != 0x60 && p1_special_d_assault_condition() == 0) &&
                          trigger_when(p1_move_type_hit() == 0x03 && p1_hit_combo() > prev(p1_hit_combo())) 
                          
                )
} 

achiev_special_assault("Spontaneous Final Judgement", "Kyo", "Iori")
achiev_special_assault("Vehement Fandango", "Mr. Karate", "Robert")
achiev_special_assault("Buster Stream", "Terry", "Rock")
achiev_special_assault("Single Flash", "Haohmaru", "Genjyuro")
achiev_special_assault("Almighty Failure", "Kaede", "Moriya")
achiev_special_assault("Slash of the Cursed Mantra", "Hanzo", "Fuuma")

achievement("ASO2 Last Guardian", "Hit your opponent with a Special D-Assault as Ai.", 5,
                trigger = p1_only() &&
                          is_fighting() &&
                          p1_current_char() == characters["Ai"] &&
                          never(p1_move() == 0x94) &&
                          never(p1_move() == 0x97) &&
                          never(p1_move() == 0x98) &&
                          never(p1_move() == 0x9f) &&
                          once(p1_special_d_assault_condition() > prev(p1_special_d_assault_condition())) &&
                          never(p1_current_move_type() != 0x60 && p1_special_d_assault_condition() == 0) &&
                          p1_move_type_hit() == 0x03 &&
                          p1_hit_combo() > prev(p1_hit_combo())
                )

achievement("Atomic Guy!", "Transform into Atomic Guy as Yuki.", 5,
                trigger = p1_only() &&
                          is_fighting() &&
                          p1_current_char() == characters["Yuki"] &&
                          p1_move() == 0x107 &&
                          prev(p1_move()) != 0x107
                )

achievement("Mendigo", "As Marco, call Hyokutaro and let him hit your opponent.", 5,
                trigger = p1_only() &&
                          is_fighting() &&
                          (
                            (p1_char_id_entity(0x3409bc) == characters["Marco"] && p1_move_entity(0x3409bc) == 0x1a && p1_hit_type_entity(0x3409bc) == 0x03) ||
                            (p1_char_id_entity(0x3409c0) == characters["Marco"] && p1_move_entity(0x3409c0) == 0x1a && p1_hit_type_entity(0x3409c0) == 0x03) ||
                            (p1_char_id_entity(0x3409c4) == characters["Marco"] && p1_move_entity(0x3409c4) == 0x1a && p1_hit_type_entity(0x3409c4) == 0x03)
                          )                      
                )

achievement("Double Assault", "Finish off your opponent with a D-Assault.", 5,
            trigger = p1_only() &&
                      is_fighting() &&
                      p1_d_assault_finishes() > prev(p1_d_assault_finishes())
            )

achievement("Perfect NEOGEO", "Win a match with a Perfect.", 5,
            trigger = p1_only() &&
                      is_fighting() &&
                      p1_wins() > prev(p1_wins()) &&
                      p1_slot1_hp() == 0xe0 && p1_slot2_hp() == 0xe0
            )


// =========================================
//                Leaderboards            
// =========================================

leaderboard("NGBC Winner - Normal", "Highest wins before reaching the boss (Level-4).",
           start = p1_survival_wins() == 0 && p1_active_state() > 0 && is_fighting() && settings_difficulty_lv4(),
           cancel = p1_active_state() == 0 || p2_active_state() > 0,
           submit = is_boss(),
           value = p1_survival_wins(),
           format = "VALUE", lower_is_better=false
           )

leaderboard("NGBC Winner - Hard", "Highest wins before reaching the boss (Level-7).",
           start = p1_survival_wins() == 0 && p1_active_state() > 0 && is_fighting() && settings_difficulty() == 6,
           cancel = p1_active_state() == 0 || p2_active_state() > 0,
           submit = is_boss(),
           value = p1_survival_wins(),
           format = "VALUE", lower_is_better=false
           )

leaderboard("NGBC Runner - Normal", "Reach 10 wins with the least amount of time remaining (Level-4)",
           start = p1_survival_wins() == 10 && p1_survival_wins() > prev(p1_survival_wins()) && p1_only() && settings_difficulty_lv4(),
           cancel = p1_active_state() == 0 || p2_active_state() > 0,
           submit = p1_survival_wins() == 10 && p1_survival_wins() > prev(p1_survival_wins()) && p1_only(),
           value = match_timer(),
           format = "VALUE", lower_is_better=true
           )

leaderboard("NGBC Runner - Hard", "Reach 10 wins with the least amount of time remaining (Level-4)",
           start = p1_survival_wins() == 10 && p1_survival_wins() > prev(p1_survival_wins()) && p1_only() && settings_difficulty() == 6,
           cancel = p1_active_state() == 0 || p2_active_state() > 0,
           submit = p1_survival_wins() == 10 && p1_survival_wins() > prev(p1_survival_wins()) && p1_only(),
           value = match_timer(),
           format = "VALUE", lower_is_better=true
           )