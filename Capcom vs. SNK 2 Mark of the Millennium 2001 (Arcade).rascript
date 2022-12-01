// Capcom vs. SNK 2: Mark of the Millennium 2001
// #ID = 19429

// =========================================
//               Memory Acessors              
// =========================================

function settings_difficulty() => byte(0x2941B8)
function settings_difficulty_4stars() => byte(0x2941B8) >= 3
function settings_damage() => byte(0x2941B9)
function settings_damage_default() => byte(0x2941B9) == 1
function settings_timer() => byte(0x2941BA)

// Game
function game_state() => byte(0x2258B8)
         gs_intro = 0x01
         gs_game = 0x02

function game_state_32bits() => dword(0x2258B8)
         gs_player_select = 0x01010102
         gs_fighting = 0x02020102

function game_sub_mode() => byte(0x225906)
         gm_sub_ratio = 0x00
         gm_sub_single = 0x01
         gm_sub_3v3 = 0x02

function players_active() => byte(0x2258E4)

function match_state() => word(0x2258BC)
function match_current_round() => byte(0x2259B9)
function match_victory_type() => byte(0x2259BE)

// Arcade
function arcade_match() => byte(0x2259B8)
function arcade_game_beaten_flag() => byte(0x2259C0)
function arcade_ending_cutscene_flag() => bit0(0x2259ca)
function arcade_sc_finishes() => byte(0x225A02)
function arcade_finest_kos() => byte(0x225A04)
function arcade_boss_battle_mode() => byte(0x241D7E)

// P1
function p1_current_character() => byte(0x241861)
function p1_hp() => word(0x2419A8)
function p1_current_ratio() => byte(0x2419C0)

function p1_hit_combo() => byte(0x241FB4)
function p1_state() => byte(0x241866)
function p1_state_16bits() => word(0x241866)
         move_type_special = 0x07
         move_type_sc = 0x08
         move_type_just_defend = 0x0012
         move_type_parry = 0x000d

function p1_move() => byte(0x241A64)
function p1_sub_move() => byte(0x241aa0)
function p1_custom_combo_timer() => byte(0x2419be)
function p1_strength() => byte(0x2419a6)
function p1_parry_recovery() => byte(0x241A60)

function p1_char1() => byte(0x241D80)
function p1_char2() => byte(0x241D81)
function p1_char3() => byte(0x241D82)
function p1_groove() => byte(0x241D90)
         groove_c = 0x00
         groove_a = 0x01
         groove_p = 0x02
         groove_s = 0x03
         groove_n = 0x04
         groove_k = 0x05

function p1_team_size() => byte(0x241D91)
function p1_groove_points() => dword(0x241D94)

// P2
function p2_current_character() => byte(0x241E2D)
function p2_state() => byte(0x241E32)
function p2_hp() => word(0x241F74)
function p2_attack_frames() => byte(0x241f7e)

function p2_hit_combo() => byte(0x2419E8)
function p2_char1() => byte(0x24234C)
function p2_char2() => byte(0x24234D)
function p2_char3() => byte(0x24234E)
function p2_team_size() => byte(0x24235D)

grooves = {
    "C-Groove": 0,
    "A-Groove": 1,
    "P-Groove": 2,
    "S-Groove": 3,
    "N-Groove": 4,
    "K-Groove": 5
}

characters = {
   "Ryu": 0,
   "Ken": 1,
   "Chun-Li": 2,
   "Guile": 3,
   "Zangief": 4,
   "Dhalsim": 5,
   "E. Honda": 6,
   "Blanka": 7,
   "Vega": 8,
   "Sagat": 9,
   "M. Bison": 10,
   "Sakura": 11,
   "Cammy": 12,
   "Akuma": 13,
   "Morrigan": 14,
   "Evil Ryu": 15,
   "Kyo": 16,
   "Iori": 17,
   "Terry": 18,
   "Ryo": 19,
   "Mai": 20,
   "Kim": 21,
   "Geese": 22,
   "Yamazaki": 23,
   "Raiden": 24,
   "Rugal": 25,
   "Vice": 26,
   "Benimaru": 27,
   "Yuri": 28,
   "King": 29,
   "Nakoruru": 30,
   "Orochi Iori": 31,
   "Balrog": 32,
   "Dan": 33,
   "Joe": 34,
   "Eagle": 35,
   "Maki": 36,
   "Kyosuke": 37,
   "Athena": 38,
   "Chang": 39,
   "Todoh": 40,
   "Rock": 41,
   "Hibiki": 42,
   "Haohmaru": 43,
   "Yun": 44,
   "Shin Akuma": 45,
   "Ultimate Rugal": 46,
   "Rolento": 47
}

// =========================================
//             Utility Functions             
// =========================================

function arcade_finished() => arcade_game_beaten_flag() == true && prev(arcade_game_beaten_flag()) == false
function arcade_finished_final_boss() {
    return (
        (p2_char1() == characters["Rugal"] || p2_char1() == characters["Akuma"] ||
        p2_char1() == characters["Ultimate Rugal"] || p2_char1() == characters["Shin Akuma"]) &&
        arcade_finished()
    )
}

function arcade_game_beaten_no_boss() {
    return (
        p2_char1() != characters["Rugal"] && p2_char1() != characters["Akuma"] &&
        p2_char1() != characters["Ultimate Rugal"] && p2_char1() != characters["Shin Akuma"] &&
        arcade_finished()
    )
}

function arcade_ending_cutscene() => arcade_game_beaten_flag() == true && match_state() == 0x00000706 && prev(match_state()) != 0x00000706

function is_arcade() => never(game_state() != gs_game) && arcade_boss_battle_mode() == false
function is_boss_battle() => never(game_state() != gs_game) && arcade_boss_battle_mode() == true

function super_combo_finished() => (arcade_sc_finishes() > prev(arcade_sc_finishes()) ||
                                    arcade_finest_kos() > prev(arcade_finest_kos()))

function p1_only() => never(players_active() != 1)
function p1_human() => bit0(0x332A18) == true

function p1_has_won() => match_victory_type() == 1 && prev(match_victory_type()) == 0
function p2_has_won() => match_victory_type() == 2 && prev(match_victory_type()) == 0

function p1_team_has_char(char_id) => p1_char1() == char_id || p1_char2() == char_id || p1_char3() == char_id
function p1_dont_have_char(char_id) => p1_char1() != char_id && p1_char2() != char_id && p1_char3() != char_id

// =========================================
//                Arcade Bosses              
// =========================================

function defeat_boss_arcade(title, boss, points, cheevo_id) {
    achievement(title, format("Defeat {0} during Arcade Mode (4 stars difficulty).", boss), points,
                trigger =   is_arcade() &&
                            p1_only() &&
                            settings_difficulty_4stars() &&
                            p2_char1() == characters[boss] && p2_char2() == 0xFF && p2_char3() == 0xFF &&
                            p1_has_won()
                )
}

defeat_boss_arcade("Dictator", "M. Bison", 5, 0)
defeat_boss_arcade("Yu Are Wig", "Geese", 5, 0)
defeat_boss_arcade("Satsui no Hado", "Akuma", 5, 0)
defeat_boss_arcade("God Complex", "Rugal", 5, 0)
defeat_boss_arcade("True Great Devil", "Shin Akuma", 10, 0)
defeat_boss_arcade("The Lord God", "Ultimate Rugal", 10, 0)

achievement("SNK Boss Syndrome", "Finish Boss Battle Mode (4 stars difficulty).", 25,
            trigger =   is_boss_battle() &&
                        p1_only() &&
                        settings_difficulty_4stars() &&
                        trigger_when(arcade_finished())
            )

// =========================================
//                Arcade Mode              
// =========================================

achievement("Mark of the Millennium 2001", "Finish Arcade Mode on 8 stars difficulty.", 10,
            trigger =   is_arcade() &&
                        p1_only() &&
                        settings_difficulty() == 7 &&
                        trigger_when(arcade_finished())
           )

achievement("Millionaire Fighting 2001", "Finish Arcade Mode [Ratio/3 on 3] by defeating any last boss without using a continue (4 stars difficulty).", 10,
            trigger =   is_arcade() &&
                        never(game_sub_mode() == gm_sub_single) &&
                        p1_only() &&
                        settings_difficulty_4stars() &&
                        once(arcade_match() == 0 && game_state_32bits() == gs_player_select) &&
                        never(p2_has_won()) &&
                        never(arcade_game_beaten_no_boss()) &&
                        trigger_when(arcade_finished_final_boss())
           )

achievement("Single Champion", "Finish Arcade Mode [Single Match] by defeating any last boss without using a continue (4 stars difficulty).", 10,
            trigger =   is_arcade() &&
                        never(game_sub_mode() != gm_sub_single) &&
                        p1_only() &&
                        settings_difficulty_4stars() &&
                        once(arcade_match() == 0 && game_state_32bits() == gs_player_select) &&
                        never(p2_has_won()) &&
                        never(arcade_game_beaten_no_boss()) &&
                        trigger_when(arcade_finished_final_boss())
           )

achievement("Groove!", "Finish Arcade Mode with 2000.000 Groove points or higher (4 stars difficulty)", 25,
            trigger =   is_arcade() &&
                        p1_only() &&
                        settings_difficulty_4stars() &&
                        p1_groove_points() >= 2000000 &&
                        trigger_when(arcade_ending_cutscene())
           )

// =========================================
//              Arcade Grooves              
// =========================================

function beat_arcade_team_groove(char1, char2, char3, groove_name, title, cheevo_id) {
    achievement(title, format("{3}: Finish Arcade Mode by defeating any last boss using only {0}, {1}, and {2} (4 stars difficulty).", char1, char2, char3, groove_name), 10,
            trigger =   is_arcade() &&
                        p1_only() &&
                        settings_difficulty_4stars() &&
                        once(arcade_match() == 0 && game_state_32bits() == gs_player_select) &&
                        p1_team_size() == 3 &&
                        never(p1_dont_have_char(characters[char1]) && p1_has_won()) &&
                        never(p1_dont_have_char(characters[char2]) && p1_has_won()) &&
                        never(p1_dont_have_char(characters[char3]) && p1_has_won()) &&
                        p1_team_has_char(characters[char1]) &&
                        p1_team_has_char(characters[char2]) &&
                        p1_team_has_char(characters[char3]) &&
                        once(arcade_match() == 0 && game_state_32bits() == gs_player_select && p1_groove() == grooves[groove_name]) &&
                        p1_groove() == grooves[groove_name] &&
                        never(p1_has_won() && p1_groove() != grooves[groove_name]) &&
                        never(arcade_game_beaten_no_boss()) &&
                        trigger_when(arcade_finished_final_boss())
           )
}

function beat_arcade_tag_groove(char1, char2, groove_name, title, cheevo_id) {
    achievement(title, format("{2}: Finish Arcade Mode by defeating any last boss using only {0} and {1} (4 stars difficulty).", char1, char2, groove_name), 10,
            trigger =   is_arcade() &&
                        p1_only() &&
                        settings_difficulty_4stars() &&
                        once(arcade_match() == 0 && game_state_32bits() == gs_player_select) &&
                        p1_team_size() == 2 &&
                        never(p1_dont_have_char(characters[char1]) && p1_has_won()) &&
                        never(p1_dont_have_char(characters[char2]) && p1_has_won()) &&
                        p1_team_has_char(characters[char1]) &&
                        p1_team_has_char(characters[char2]) &&
                        once(arcade_match() == 0 && game_state_32bits() == gs_player_select && p1_groove() == grooves[groove_name]) &&
                        p1_groove() == grooves[groove_name] &&
                        never(p1_has_won() && p1_groove() != grooves[groove_name]) &&
                        never(arcade_game_beaten_no_boss()) &&
                        trigger_when(arcade_finished_final_boss())
           )
}

beat_arcade_tag_groove("Ryu", "Sagat", "C-Groove", "Warriors' Dreams", 0)
beat_arcade_tag_groove("Ken", "Sakura", "A-Groove", "Street Fighter Alpha 2", 0)
beat_arcade_team_groove("Ryu", "Chun-Li", "Yun", "P-Groove", "Street Fighter III", 0)
beat_arcade_tag_groove("Kyo", "Benimaru", "S-Groove", "KOF 94", 0)
beat_arcade_team_groove("Rugal", "Yamazaki", "Vice", "N-Groove", "KOF 98 Dream Match", 0)
beat_arcade_team_groove("Haohmaru", "Nakoruru", "Hibiki", "K-Groove", "Samurai Shodown", 0)

// =========================================
//                Arcade Teams              
// =========================================

function beat_arcade_team(char1, char2, char3, title, cheevo_id) {
    achievement(title, format("Finish Arcade Mode by defeating any last boss using only {0}, {1}, and {2} (4 stars difficulty).", char1, char2, char3), 10,
            trigger =   is_arcade() &&
                        p1_only() &&
                        settings_difficulty_4stars() &&
                        once(arcade_match() == 0 && game_state_32bits() == gs_player_select) &&
                        p1_team_size() == 3 &&
                        never(p1_dont_have_char(characters[char1]) && p1_has_won()) &&
                        never(p1_dont_have_char(characters[char2]) && p1_has_won()) &&
                        never(p1_dont_have_char(characters[char3]) && p1_has_won()) &&
                        p1_team_has_char(characters[char1]) &&
                        p1_team_has_char(characters[char2]) &&
                        p1_team_has_char(characters[char3]) &&
                        never(arcade_game_beaten_no_boss()) &&
                        trigger_when(arcade_finished_final_boss())
           )
}

function beat_arcade_tag(char1, char2, title, cheevo_id) {
    achievement(title, format("Finish Arcade Mode by defeating any last boss using only {0} and {1} (4 stars difficulty).", char1, char2), 10,
            trigger =   is_arcade() &&
                        p1_only() &&
                        settings_difficulty_4stars() &&
                        once(arcade_match() == 0 && game_state_32bits() == gs_player_select) &&
                        p1_team_size() == 2 &&
                        never(p1_dont_have_char(characters[char1]) && p1_has_won()) &&
                        never(p1_dont_have_char(characters[char2]) && p1_has_won()) &&
                        p1_team_has_char(characters[char1]) &&
                        p1_team_has_char(characters[char2]) &&
                        never(arcade_game_beaten_no_boss()) &&
                        trigger_when(arcade_finished_final_boss())
           )
}

// Teams
beat_arcade_team("Kyo", "Terry", "Ryo", "SNK Heroes", 0)
beat_arcade_team("Mai", "Yuri", "Athena", "SNK Heroines", 0)
beat_arcade_team("Ken", "Terry", "Guile", "USA Dream Team", 0)
beat_arcade_team("Terry", "Mai", "Geese", "Team Fatal", 0)
beat_arcade_team("Terry", "Chun-Li", "Dan", "Vendettors", 0)
beat_arcade_team("Kyo", "Iori", "Athena", "Band Power", 0)
beat_arcade_team("M. Bison", "Geese", "Rugal", "Crime Bosses", 0)
beat_arcade_team("Sagat", "King", "Joe", "Muay Thai", 0)
beat_arcade_team("Zangief", "Raiden", "Chang", "Dumb Muscles", 0)
beat_arcade_team("Ryo", "Yuri", "King", "Art of Fighting XI", 0)
beat_arcade_team("Dan", "Yuri", "Todoh", "Bootleg Art of Fighting", 0)
beat_arcade_team("Kyosuke", "Blanka", "Benimaru", "Electric Feel", 0)
beat_arcade_team("Ryu", "Ryo", "Morrigan", "Shotoclones", 0)
beat_arcade_team("Dan", "Sakura", "Blanka", "Saikyo Friendship", 0)
beat_arcade_team("E. Honda", "Dhalsim", "Zangief", "World Warriors", 0)
beat_arcade_team("Balrog", "Vega", "Sagat", "Grand Masters", 0)
beat_arcade_team("Chun-Li", "Cammy", "Sakura", "Capcom Heroines", 0)
beat_arcade_team("Chun-Li", "Mai", "Morrigan", "Fighting Game Waifus", 0)

// Tags
beat_arcade_tag("Kim", "Chang", "Korea Justice", 0)
beat_arcade_tag("Maki", "Mai", "Ninjutsu Fighters", 0)
beat_arcade_tag("Akuma", "Iori", "Anti-Heroes", 0)
beat_arcade_tag("Sakura", "Yuri", "Wild Flowers", 0)
beat_arcade_tag("Ken", "Benimaru", "No. 2", 0)
beat_arcade_tag("Terry", "Rock", "Mark of the Wolves", 0)
beat_arcade_tag("Guile", "Rolento", "Army Patriots", 0)
beat_arcade_tag("Eagle", "Vega", "The Gentlemen", 0)

// =========================================
//          Super Combos and Techs             
// =========================================


achievement("Alpha Cancel", "C-Groove: Cancel a Level 2 Super Combo into a Level 1 Super Combo (Arcade Mode).", 3,
            trigger =   is_arcade() &&
                        p1_only() &&
                        p1_groove() == groove_c &&
                        never(p1_hit_combo() < prev(p1_hit_combo())) &&
                        once(p1_hit_combo() > prev(p1_hit_combo()) && p1_state() == move_type_sc && p1_strength() == 0x01) &&
                        p1_hit_combo() > prev(p1_hit_combo()) && p1_state() == move_type_sc && p1_strength() == 0x00
           )

achievement("Custom Combo Finish", "A-Groove: Finish off your opponent with a Custom Combo (Arcade Mode).", 3,
            trigger =   is_arcade() &&
                        p1_only() &&
                        p1_groove() == groove_a &&
                        p1_custom_combo_timer() > 0 &&
                        super_combo_finished()
           )

achievement("Is This 3rd Strike Now?", "P-Groove: Perform a Parry 3 times (Arcade Mode).", 3,
            trigger =   is_arcade() &&
                        p1_only() &&
                        p1_groove() == groove_p &&
                        measured(tally(3, p1_state_16bits() == move_type_parry && prev(p1_state_16bits()) != move_type_parry) )
           )

achievement("Comeback Finish", "S-Groove: Finish off your opponent with a Level 3 Super Combo (Arcade Mode).", 3,
            trigger =   is_arcade() &&
                        p1_only() &&
                        p1_groove() == groove_s &&
                        p1_state() == move_type_sc &&
                        p1_strength() == 2 &&
                        super_combo_finished()
           )

achievement("POW Finish", "N-Groove: Finish off your opponent with a Level 3 Super Combo (Arcade Mode)", 3,
            trigger =   is_arcade() &&
                        p1_only() &&
                        p1_groove() == groove_n &&
                        p1_state() == move_type_sc &&
                        p1_strength() == 2 &&
                        super_combo_finished()
           )

achievement("Samurai Parry", "K-Groove: Perform a Just Defend 3 times (Arcade Mode).", 3,
            trigger =   is_arcade() &&
                        p1_only() &&
                        p1_groove() == groove_k &&
                        measured(tally(3, p1_state_16bits() == move_type_just_defend && prev(p1_state_16bits()) != move_type_just_defend) )
           )

achievement("Finest K.O", "Get a Finest K.O (Arcade Mode).", 4,
            trigger =   is_arcade() &&
                        p1_only() &&
                        arcade_finest_kos() > prev(arcade_finest_kos())
           )

achievement("Dark Power (Akuma)", "Leave my sight! (Arcade Mode).", 4,
            trigger =   is_arcade() &&
                        p1_only() &&
                        p1_current_character() == characters["Akuma"] &&
                        p1_move() == 0x0b &&
                        super_combo_finished()
           )

function all_super_combo_character(title, char, move_array, add_description, cheevo_id) {
    moves_logic = []
    for move in move_array {
        array_push(moves_logic, once((p1_hit_combo() > prev(p1_hit_combo())) && p1_move() == move))
    }

    if (length(moves_logic) == 2) {
        cheevo_points = 3
    }

    if (length(moves_logic) == 3) {
        cheevo_points = 5
    }

    if (length(moves_logic) >= 4) {
        cheevo_points = 10
    }

    achievement(title, format("{0}: Hit your opponent with all Super Combos{1} during an Arcade playthrough.", char, add_description), cheevo_points,
                trigger =   is_arcade() &&
                            p1_only() &&
                            unless(p1_current_character() != characters[char]) &&
                            unless(p1_state() != move_type_sc) &&
                            measured(tally(length(moves_logic), moves_logic)) 
        
                )
}

achievement("Shikabane o Koete Iku Nari", "Hibiki: Hit your opponent with all Super Combos and any \"Shikabane o Koete Iku Nari\" sequence during an Arcade playthrough.", 10,
            trigger =   is_arcade() &&
                        p1_only() &&
                        unless(p1_current_character() != characters["Hibiki"]) &&
                        unless(p1_state() != move_type_sc) &&
                        measured(tally(3, 
                            once((p1_hit_combo() > prev(p1_hit_combo())) && p1_move() == 0x05),
                            once((p1_hit_combo() > prev(p1_hit_combo())) && p1_move() == 0x06),
                            once((p1_hit_combo() > prev(p1_hit_combo())) && p1_move() == 0x07 && (p1_sub_move() == 0x31 || p1_sub_move() == 0x38 || p1_sub_move() == 0x35))
                        )) 
            )

all_super_combo_character("Shin Shouryuuken", "Ryu", [0x04, 0x05, 0x0a], "", 0)
all_super_combo_character("Shinryuken", "Ken", [0x05, 0x04, 0x09], "", 0)
all_super_combo_character("Houyoku Sen", "Chun-Li", [0x05, 0x03], "", 0)
all_super_combo_character("Somersault Strike", "Guile", [0x03, 0x02, 0x05], "", 0)
all_super_combo_character("Final Atomic Buster", "Zangief", [0x05, 0x08], "", 0)
all_super_combo_character("Yoga Volcano", "Dhalsim", [0x08, 0x0a, 0x09], "", 0)
all_super_combo_character("Orochi Kudaki", "E. Honda", [0x04, 0x06], "", 0)
all_super_combo_character("Ground Shave Rolling", "Blanka", [0x06, 0x04, 0x07], "", 0)
all_super_combo_character("Rolling Izuna Drop", "Vega", [0x06, 0x07, 0x08, 0x09], "", 0)
all_super_combo_character("Tiger Raid", "Sagat", [0x05, 0x06, 0x07, 0x08], "", 0)
all_super_combo_character("Mega Psycho Crusher", "M. Bison", [0x06, 0x0e], "", 0)
all_super_combo_character("Midare Zakura", "Sakura", [0x05, 0x07, 0x06], "", 0)
all_super_combo_character("Reverse Shaft Breaker", "Cammy", [0x06, 0x07], "", 0)
all_super_combo_character("Messatsu Gou Shouryuu", "Akuma", [0x05, 0x07, 0x09, 0x0b], "", 0)
all_super_combo_character("Soul Phoenix", "Morrigan", [0x00, 0x09, 0x0d, 0x07, 0x06], "", 0)
// all_super_combo_character("Messatsu Goushouryu", "Evil Ryu", [0x04, 0x0b, 0x0e, 0x07], "", 0)
all_super_combo_character("Saishuu Kessen Ougi \"Mu Shiki\"", "Kyo", [0x05, 0x06], "", 0)
all_super_combo_character("Ura 108 Shiki: Ya Sakazuki", "Iori", [0x06, 0x07], "", 0)
all_super_combo_character("Buster Wolf", "Terry", [0x05, 0x06], "", 0)
all_super_combo_character("Haou Shoukou Ken", "Ryo", [0x07, 0x00, 0x08], "", 0)
all_super_combo_character("Beni Suzaku", "Mai", [0x05, 0x09, 0x03], "", 0)
all_super_combo_character("Hou'ou Kyaku", "Kim", [0x07, 0x08, 0x0a], "", 0)
all_super_combo_character("Deadly Rave", "Geese", [0x03, 0x07, 0x08], " and Deadly Rave full sequence", 0)
all_super_combo_character("Drill", "Yamazaki", [0x09, 0x0a], "", 0)
all_super_combo_character("Destruction Drop", "Raiden", [0x0a, 0x01, 0x0c], "", 0)
all_super_combo_character("Total Annihilation", "Rugal", [0x07, 0x09], "", 0)
all_super_combo_character("Withering Force", "Vice", [0x03, 0x0a], "", 0)
all_super_combo_character("Denei Spark", "Benimaru", [0x03, 0x07, 0x0a], "", 0)
all_super_combo_character("Hien Rekkou", "Yuri", [0x07, 0x08, 0x09], "", 0)
all_super_combo_character("Silent Flash", "King", [0x08, 0x07], "", 0)
// **** all_super_combo_character("Elerush Kamui Rimse", "Nakoruru", [0x09, 0x0b, 0x02], "", 0) // Different treatment, change only in emulator
// all_super_combo_character("Ura 100 Shiki: Oni Honou", "Orochi Iori", [0x06, 0x07], "", 0)
all_super_combo_character("Gigaton Blow", "Balrog", [0x08, 0x07], "", 0)
all_super_combo_character("Kouryurekka", "Dan", [0x04, 0x05, 0x07], "", 0)
all_super_combo_character("Bakuretsu Hurricane Tiger Kakato", "Joe", [0x03, 0x04, 0x08], "", 0)
all_super_combo_character("Union Jack Platinum", "Eagle", [0x05, 0x06], "", 0)
all_super_combo_character("Tesshin Hou", "Maki", [0x05, 0x07, 0x06], "", 0)
all_super_combo_character("Super Raijin Upper", "Kyosuke", [0x05, 0x09, 0x0b, 0x07], "", 0)
all_super_combo_character("Crystal Shoot", "Athena", [0x06, 0x07, 0x08], " (including Crystal Shoot)", 0)
all_super_combo_character("Shin! Chouzetsu Tatsumaki Shinkuu Zan", "Chang", [0x06, 0x07], "", 0)
all_super_combo_character("Shingan: Kuzu Otoshi", "Todoh", [0x04, 0x05], "", 0)
all_super_combo_character("Neo Deadly Rave", "Rock", [0x07, 0x06, 0x08, 0x09], " and Neo Deadly Rave full sequence", 0)
// all_super_combo_character("Shikabane o koete iku nari ", "Hibiki", [], "", 0) // Need special treatment because of roots
all_super_combo_character("Tenha Danku Retsu Zan", "Haohmaru", [0x04, 0x05], "", 0)
all_super_combo_character("Raishin Mahhaken", "Yun", [0x05, 0x08, 0x06, 0x09], "", 0)
// all_super_combo_character("Misogi", "Shin Akuma", [0x05, 0x07, 0x09, 0x0b, 0x0c], "", 0)
// all_super_combo_character("G. END", "Ultimate Rugal", [0x07, 0x09, 0x0d, 0x0c], "", 0)
// **** all_super_combo_character("Steel Rain", "Rolento", [0x00, 0x02, 0x01], "", 0) // Different treatment, change only in emulator

// =========================================
//               Leaderboards              
// =========================================

leaderboard("CvS2 Groover", "Finish Arcade Mode with the highest Groove points as possible (4 stars difficulty).",
           start = game_state() == gs_game && p1_only(),
           cancel = game_state() != gs_game || players_active() != 1,
           submit = arcade_ending_cutscene(),
           value = p1_groove_points(),
           format = "VALUE", lower_is_better=false
           )