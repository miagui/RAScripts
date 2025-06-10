// NeoGeo Battle Coliseum
// #ID = 20678

//  Settings
function settings_difficulty() => byte(0x385910)
function settings_count_speed() => byte(0x385911)
function settings_defense_level_1p() => byte(0x385913)
function settings_defense_level_2p() => byte(0x385914)
function settings_power_gauge_1p() => byte(0x385915)
function settings_power_gauge_2p() => byte(0x385916)

function settings_default_lv4() {
    return(
        settings_defense_level_1p() == 3 &&
        settings_defense_level_2p() == 3 &&
        settings_power_gauge_1p() == 0 &&
        settings_power_gauge_2p() == 0 &&
        settings_count_speed() == 2 &&
        settings_difficulty() >= 3
    )
}

function settings_default_lv7() {
    return(
        settings_defense_level_1p() == 3 &&
        settings_defense_level_2p() == 3 &&
        settings_power_gauge_1p() == 0 &&
        settings_power_gauge_2p() == 0 &&
        settings_count_speed() == 2 &&
        settings_difficulty() == 6
    )
}

function settings_default_any_diff() {
    return(
        settings_defense_level_1p() == 3 &&
        settings_defense_level_2p() == 3 &&
        settings_power_gauge_1p() == 0 &&
        settings_power_gauge_2p() == 0 &&
        settings_count_speed() == 2
    )
}

// Game
function game_state() => word(0x385D04)
         GS_CHARACTER_SELECT = 0x0301
         GS_ORDER_SELECT = 0x0302
         GS_FIGHTING = 0x0303
function game_context() => byte(0x385D05)
function game_bgm() => byte(0x38578C)
function game_mode() => byte(0x385984)

function game_battle_bonus() => byte(0x385c98)
function game_continue_services() => byte(0x385c9c)

function match_timer() => word(0x385CD8)

// Players
function p1_active_state() => byte(0x385D08)
function p2_active_state() => byte(0x385D09)

function p1_survival_wins() => word(0x385CA8)
function p1_matches_fought() => word(0x439B82)
function p1_losses() => word(0x439B84)
function p1_wins() => word(0x439B88)

function p1_macro_flag() => byte(0x3b6be0)
function p1_hit_combo() => byte(0x439A07)
function p1_super_cancel_perfomed() => bit3(0x439A0C)
function p1_double_assault_hits() => word(0x439A18)
function p1_d_assault_finishes() => word(0x439a22)
function p1_move_type_hit() => byte(0x439A28)

function p1_char_ptr() => dword(0x439A48)
function p1_current_char() => word(dword(p1_char_ptr() + 0x10) + 0xea)
function p1_move() => word(dword(p1_char_ptr() + 0x10) + 0xec)
function p1_special_d_assault_condition() => word(dword(p1_char_ptr() + 0x10) + 0xf8)
function p1_current_move_type() => word(dword(p1_char_ptr() + 0x10) + 0x3f0)

function p1_slot1_character() => byte(0x439AE1)
function p1_slot1_hp() => word(0x439AE8)
function p1_slot2_character() => byte(0x439AFD)
function p1_slot2_hp() => word(0x439B04)

function p2_slot1_character() => byte(0x439C95)
function p2_slot1_hp() => word(0x439C9C)
function p2_slot2_character() => byte(0x439CB1)
function p2_slot2_hp() => word(0x439CB8)

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

function p1_only() => never(p1_active_state() == 0) && never(p2_active_state() > 0)
function in_game() => game_context() == 0x03
function in_char_select() => game_state() == GS_CHARACTER_SELECT
function is_fighting() => game_state() == GS_FIGHTING

function reset_if_macro_used() => never(p1_macro_flag() == 3)

function is_any_arcade() => __ornext(game_mode() == 0 || game_mode() == 2)
function is_arcade_play() => game_mode() == 0
function is_survival() => game_mode() == 3

function p1_won_match_hp() => __ornext(p2_slot1_hp() == 0xFFFF && p2_slot1_hp() != prev(p2_slot1_hp()) || p2_slot2_hp() == 0xFFFF && p2_slot2_hp() != prev(p2_slot2_hp()))

function is_boss() {
    return(
        __ornext(p2_slot1_character() == characters["Neo-Dio"] ||
            p2_slot1_character() == characters["Mizuchi"] ||
            p2_slot1_character() == characters["Goodman"] ||
            p2_slot1_character() == characters["King Lion"])
    )
    
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
    achievement(title, format("Beat the game using only {0} and {1} (default settings).", char1, char2), 5,
                trigger = p1_only() &&
                          is_any_arcade() &&
                          in_game() &&
                          once(p1_survival_wins() == 0 && in_char_select() && p1_active_state() > 0) &&
                          never(p1_dont_have_char(characters[char1]) && p1_wins() > prev(p1_wins())) &&
                          never(p1_dont_have_char(characters[char2]) && p1_wins() > prev(p1_wins())) &&
                          p1_team_has_char(characters[char1]) &&
                          p1_team_has_char(characters[char2]) &&
                          trigger_when(game_beaten()) &&
                          settings_default_lv4()
                )
}

achiev_beat_game_team("NEOGEO Saviors", "Yuki", "Ai")
achiev_beat_game_team("Sacred Treasures", "Kyo", "Iori")
achiev_beat_game_team("Kyokugenryu Karate", "Mr. Karate", "Robert")
achiev_beat_game_team("Hungry Wolves", "Terry", "Rock")
achiev_beat_game_team("Samurai Showdown", "Haohmaru", "Genjyuro")
achiev_beat_game_team("The Last Blade", "Kaede", "Moriya")
achiev_beat_game_team("World Heroes", "Hanzo", "Fuuma")
achiev_beat_game_team("Ribbon Enjoyers", "Hotaru", "Akari")
achiev_beat_game_team("The Jin Brothers", "Chonrei", "Chonshu")
achiev_beat_game_team("Martial Arts Masters", "Tung Fu Rue", "Lee")
achiev_beat_game_team("Warriors Rage", "Shiki", "Asura")
achiev_beat_game_team("Jungle Warriors", "Cyber Woo", "Mudman")
achiev_beat_game_team("KoF Heroes", "K'", "Kyo")
achiev_beat_game_team("Inspiring Schoolgirls", "Athena", "Kisarah")
achiev_beat_game_team("SNK Stars", "Mai", "Nakoruru")
achiev_beat_game_team("Metal Slug", "Marco", "Mars People")
achiev_beat_game_team("The Howards Dichotomy", "Geese", "Rock")
achiev_beat_game_team("Big Money, Big Women", "Mr. Big", "Shermie")
achiev_beat_game_team("Justice Bringers", "Kim", "Washizuka")
achiev_beat_game_team("Proud Crime Lords", "King Lion", "Geese")
achiev_beat_game_team("Evil Experiments", "Mizuchi", "Neo-Dio")

achievement("Ambitious Man", "Beat the game using only Goodman on any difficulty (default settings).", 5,
                trigger = p1_only() &&
                          is_any_arcade() &&
                          in_game() &&
                          once(p1_survival_wins() == 0 && in_char_select() && p1_active_state() > 0) &&
                          never(p1_slot1_character() != characters["Goodman"] && p1_wins() > prev(p1_wins())) &&
                          p1_slot1_character() == characters["Goodman"] &&
                          trigger_when(game_beaten()) &&
                          settings_default_any_diff()
                )

achievement("King Is Falling", "Beat the game on Level-7 difficulty (default settings).", 10,
                trigger = p1_only() &&
                          is_any_arcade() &&
                          in_game() &&
                          trigger_when(game_beaten()) &&
                          settings_default_lv7()
                )

achievement("Maniac Sense", "Defeat Mizuchi (default settings).", 10, type="win_condition",
                trigger = p1_only() &&
                          is_any_arcade() &&
                          in_game() &&
                          p2_slot1_character() == characters["Mizuchi"] &&
                          p1_wins() > prev(p1_wins()) &&
                          settings_default_lv4()
                )

achievement("Murder D", "Defeat Neo-Dio (default settings).", 25, type="win_condition",
                trigger = p1_only() &&
                          is_any_arcade() &&
                          in_game() &&
                          p2_slot1_character() == characters["Neo-Dio"] &&
                          p1_wins() > prev(p1_wins()) &&
                          settings_default_lv4()
                )

achievement("Don't Make Me Angry", "Defeat King Leo (default settings).", 25, type="win_condition",
                trigger = p1_only() &&
                          is_any_arcade() &&
                          in_game() &&
                          p2_slot1_character() == characters["King Lion"] &&
                          p1_wins() > prev(p1_wins()) &&
                          settings_default_lv4()
                )

achievement("Spirit of the Gorilla King", "Defeat Goodman (default settings).", 25, type="win_condition",
                trigger = p1_only() &&
                          is_any_arcade() &&
                          in_game() &&
                          p2_slot1_character() == characters["Goodman"] &&
                          p1_wins() > prev(p1_wins()) &&
                          settings_default_lv4()
                )


achievement("Last K.O", "Defeat any final boss during Arcade/Tag Play without winning by a time-out and no continue services (default settings).", 10,
                trigger = p1_only() &&
                          is_any_arcade() &&
                          is_fighting() &&
                          is_boss() &&
                          no_continue_services() &&
                          trigger_when(p1_won_match_hp()) &&
                          settings_default_lv4()
            )

achievement("NEOGEO Winner", "Reach 15 wins during Arcade Play (default settings).", 25,
                trigger = p1_only() &&
                          is_arcade_play() &&
                          in_game() &&
                          p1_survival_wins() == 15 && prev(p1_survival_wins()) == 14 &&
                          settings_default_lv4()
            )

// =========================================
//             Special D-Assaults              
// =========================================

achievement("ASO2 Last Guardian", "Hit your opponent with a Special D-Assault as Ai.", 3,
                trigger = p1_active_state() > 0 &&
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

achievement("Atomic Guy!", "Transform into Atomic Guy as Yuki.", 3,
                trigger = p1_active_state() > 0 &&
                          is_fighting() &&
                          p1_current_char() == characters["Yuki"] &&
                          p1_move() == 0x107 &&
                          prev(p1_move()) != 0x107
                )

function achiev_special_assault(title, char1, char2) {
    achievement(title, format("Hit your opponent with a Special D-Assault as {0}/{1}.", char1, char2), 4,
                trigger = p1_active_state() > 0 &&
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

// =========================================
//                   Miscs              
// =========================================

achievement("Double Assault", "Finish off your opponent with a D-Assault.", 5,
            trigger = p1_only() &&
                      game_mode() != 0x04 &&
                      is_fighting() &&
                      p1_d_assault_finishes() > prev(p1_d_assault_finishes())
            )

achievement("Perfect NEOGEO", "Win a match with a Perfect.", 5,
            trigger = p1_only() &&
                      game_mode() != 0x04 &&
                      is_fighting() &&
                      p1_wins() > prev(p1_wins()) &&
                      p1_slot1_hp() == 0xe0 && p1_slot2_hp() == 0xe0
            )

achievement("Saul Goodman", "Defeat Goodman on Survival Challenge (default settings)", 25,
            trigger = p1_only() &&
                      is_survival() &&
                      is_fighting() &&
                      p2_slot1_character() == characters["Goodman"] &&
                      p1_wins() > prev(p1_wins()) &&
                      settings_default_lv4()
            )

// =========================================
//               Super Cancel              
// =========================================

function achiev_super_cancel_combo(title, char, hitcombo, points) {
    achievement(title, format("Perform a {0}-hit combo with a Super Cancel as {1}.", hitcombo, char), points,
            trigger =   p1_active_state() == 1 &&
                        is_fighting() &&
                        once(p1_super_cancel_perfomed() > prev(p1_super_cancel_perfomed())) &&
                        reset_if_macro_used() &&
                        never(p1_hit_combo() == 0) &&
                        p1_hit_combo() >= hitcombo &&
                        prev(p1_hit_combo()) < hitcombo &&
                        never(p1_current_char() != characters[char])
            )
}

function achiev_super_cancel_no_hit(title, char, points) {
    achievement(title, format("Perform a Super Cancel as {0}.", char), points,
            trigger =   p1_active_state() == 1 &&
                        is_fighting() &&
                        once(p1_super_cancel_perfomed() > prev(p1_super_cancel_perfomed())) &&
                        reset_if_macro_used() &&
                        never(p1_current_char() != characters[char])
            )
}

achiev_super_cancel_combo("114 Shiki: Aragami", "Kyo", 3, 5)
achiev_super_cancel_combo("100 Shiki: Oniyaki", "Iori", 12, 5)
achiev_super_cancel_combo("Power Charge", "Terry", 5, 5)
achiev_super_cancel_combo("Hard Edge", "Rock", 10, 5)
achiev_super_cancel_combo("Kohou Shippuu Ken", "Mr. Karate", 17, 5)
achiev_super_cancel_combo("Ryu-Geki Ken", "Robert", 16, 5)
achiev_super_cancel_combo("Shinmei Renjin Zan", "Kaede", 5, 5)
achiev_super_cancel_combo("Ittou Tsukikage", "Moriya", 15, 5)
achiev_super_cancel_combo("Ougi Kogetsu Zan", "Haohmaru", 12, 5)
achiev_super_cancel_combo("Ouka Zan", "Genjyuro", 4, 5)
achiev_super_cancel_combo("TNT Punch", "Yuki", 14, 5)
achiev_super_cancel_combo("Baseball Stars Professional", "Ai", 7, 5)
achiev_super_cancel_combo("Crow Bite", "K'", 5, 5)
achiev_super_cancel_combo("Axle Spinning Kick", "Shermie", 2, 5)
achiev_super_cancel_combo("Ryu Enbu", "Mai", 9, 5)
achiev_super_cancel_combo("Hangetsu Zan", "Kim", 14, 5)
achiev_super_cancel_combo("100 Ren Ashi", "Lee", 7, 5)
achiev_super_cancel_combo("Ressen Kyaku", "Tung Fu Rue", 6, 10)
achiev_super_cancel_combo("Tenmon Hoshi No Meguri", "Akari", 8, 5)
achiev_super_cancel_combo("Rouga", "Washizuka", 18, 5)
achiev_super_cancel_combo("Rojeref", "Asura", 14, 5)
achiev_super_cancel_combo("Tsuyubarai", "Shiki", 14, 5)
achiev_super_cancel_no_hit("Mijin Komoru no Subi", "Hanzo", 3)
achiev_super_cancel_combo("Densosetsuka no Jotsu Kiri Mai", "Fuuma", 4, 5)
achiev_super_cancel_combo("Raging Storm", "Geese", 2 , 10)
achiev_super_cancel_combo("Californian Romance", "Mr. Big", 27, 5)
achiev_super_cancel_combo("Teiou Jinsoku Ken", "Chonrei", 2, 10)
achiev_super_cancel_combo("Teiou Tenji Ken", "Chonshu", 4, 5)
achiev_super_cancel_combo("Haigeki Shu", "Hotaru", 22, 5)
achiev_super_cancel_combo("Cheerleader Kick", "Kisarah", 9, 5)
achiev_super_cancel_combo("Metal Sliding", "Marco", 14, 5)
achiev_super_cancel_combo("Mudman Attack", "Mudman", 4, 5)
achiev_super_cancel_combo("Hamadrias Buster", "Athena", 6, 4)
achiev_super_cancel_combo("Plasma Spin", "Mars People", 2, 3)
achiev_super_cancel_no_hit("Annu Matsube", "Nakoruru", 3)
achiev_super_cancel_combo("Nightmare", "King Lion", 4, 5)
achiev_super_cancel_no_hit("Muteki no Teppeki", "Neo-Dio", 3)
achiev_super_cancel_combo("Seiyaku", "Mizuchi", 10, 5)

// =========================================
//                Leaderboards              
// =========================================

leaderboard("NGBC Winner - Normal", "Highest wins before reaching the boss on Level-4 difficulty (default settings).",
           start = is_arcade_play() && p1_survival_wins() == 0 && p1_active_state() > 0 && is_fighting() && settings_default_lv4(),
           cancel = p1_active_state() == 0 || p2_active_state() > 0,
           submit = is_boss(),
           value = p1_survival_wins(),
           format = "VALUE", lower_is_better=false
           )

leaderboard("NGBC Winner - Hard", "Highest wins before reaching the boss on Level-7 difficulty (default settings).",
           start = is_arcade_play() && p1_survival_wins() == 0 && p1_active_state() > 0 && is_fighting() && settings_default_lv7(),
           cancel = p1_active_state() == 0 || p2_active_state() > 0,
           submit = is_boss(),
           value = p1_survival_wins(),
           format = "VALUE", lower_is_better=false
           )

leaderboard("NGBC Runner - Normal", "Reach 10 wins with the least amount of time remaining on Level-4 difficulty (default settings).",
           start = is_arcade_play() && p1_survival_wins() == 10 && p1_survival_wins() > prev(p1_survival_wins()) && p1_only() && settings_default_lv4(),
           cancel = p1_active_state() == 0 || p2_active_state() > 0,
           submit = p1_survival_wins() == 10 && p1_survival_wins() > prev(p1_survival_wins()) && p1_only(),
           value = match_timer(),
           format = "VALUE", lower_is_better=true
           )

leaderboard("NGBC Runner - Hard", "Reach 10 wins with the least amount of time remaining on Level-7 difficulty (default settings).",
           start = is_arcade_play() && p1_survival_wins() == 10 && p1_survival_wins() > prev(p1_survival_wins()) && p1_only() && settings_default_lv7(),
           cancel = p1_active_state() == 0 || p2_active_state() > 0,
           submit = p1_survival_wins() == 10 && p1_survival_wins() > prev(p1_survival_wins()) && p1_only(),
           value = match_timer(),
           format = "VALUE", lower_is_better=true
           )

leaderboard("NGBC Survival", "Highest wins on Survival Challenge (default settings).",
           start = (is_survival() && p1_only() && settings_default_lv4() && p1_losses() > prev(p1_losses())) || game_mode() != 3,
           cancel = tally(120, p1_active_state() == 0) || tally(120, p2_active_state() > 0),
           submit = always_true(),
           value = p1_survival_wins(),
           format = "VALUE", lower_is_better=false
           )