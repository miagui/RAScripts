// King of Fighters 2002, The: Challenge to Ultimate Battle
// #ID = 12035

function debug_dipswitches() => word(0x000000)

// Settings
function soft_dip_setup_time() => byte(0x00FD8B)
function soft_dip_setup_level_difficulty() => byte(0x00FD8C)
function soft_dip_setup_manual_event_setup() => byte(0x00FD8D)
function soft_dip_setup_team_mode() => byte(0x00FD8E)
function soft_dip_setup_indicator_setup() => byte(0x00FD8F)
function soft_dip_setup_blood_flash_setup() => byte(0x00FD90)
function soft_dip_setup_continue_game_setup() => byte(0x00FD91)
function soft_dip_setup_country() => byte(0x00FD92)
function soft_dip_setup_language() => byte(0x00FD93)

// works for both AES and MVS
function settings_difficulty() => byte(0x00009F)
function settings_rounds() => byte(0x00a7)

// Game
function game_unibios() => dword(0x00FE30)
function game_mvs_mode() => bit7(0x00FD83)

function game_mode() => byte(0x00A7E0)
         MODE_SINGLE_PLAY = 0x00
         MODE_TEAM_PLAY = 0x01
         MODE_SINGLE_VS = 0x02
         MODE_TEAM_VS = 0x03
         MODE_PRACTICE = 0x06

function game_screen() => byte(0x00858B)
function game_cutscenes() => byte(0x0005D0)
function game_timer_frames() => byte(0x00FE8A)

function arcade_current_match() => byte(0x00E232)
function arcade_team_defeated() => byte(0x00A798)
function arcade_team_defeated_total() => bitcount(0x00A798)

function match_timer() => byte(0x00A7D3)

function p1_and_p2_state_combo() => word(0x00FDB6)

function p1_active_state() => byte(0x00FDB7)
function p2_active_state() => byte(0x00FDB6)

// General 
function p1_rounds_won_match() => byte(0x00A80A)
function p2_rounds_won_match() => byte(0x00A7E4)

// P1
function p1_character_1() => byte(0x00A7E7)
function p1_character_2() => byte(0x00A7E6)
function p1_character_3() => byte(0x00A7E9)

function p1_orochi_flags() => byte(0x00A7E5)
function p1_character1_is_orochi() => bit0(0x00A7E5)
function p1_character2_is_orochi() => bit1(0x00A7E5)
function p1_character3_is_orochi() => bit2(0x00A7E5)

function p1_current_character() => byte(0x008170)
function p1_hp() => byte(0x008238)
function p1_ko_flag() => byte(0x008239)

function p1_inputs() => byte(0x00FEEB)
function p1_moves() => word(0x008172)
function p1_last_move_used() => word(0x0081EE)

function p1_hit_combo() => byte(0x0084B1)

function p1_leona_transformation() => byte(0x00E326)

function p1_special_move_indicator() => word(0x00E7C0) // janky but works, don't need to remove it

function p1_score_xx000000() => byte(0x0081FD)
function p1_score_000000xx() => byte(0x0081FE)
function p1_score_0000xx00() => byte(0x0081FF)
function p1_score_00xx0000() => byte(0x008200)
function p1_score_xx000000() => byte(0x008201)

// P2
function p2_character_1() => byte(0xa80d)
function p2_character_2() => byte(0xa80c)
function p2_character_3() => byte(0xa80f)

function p2_current_character() => byte(0x008370)
function p2_hp() => byte(0x008438)
function p2_ko_flag() => byte(0x008439)


// =========================================
//                  Utility              
// =========================================

function no_unibios() => never(game_unibios() != 0)
function p1_only() => never(p1_active_state() == 0) && never(p2_active_state() > 0)
function p1_only_globalreset() => (always_false() || never(p1_active_state() == 0) && never(p2_active_state() > 0))

function no_practice_mode() => never(game_mode() == 6)

function game_beaten_team_play() {
    return(
        arcade_current_match() >= 7 &&
        p2_current_character() == 39 &&
        p1_rounds_won_match() == 1 &&
        prev(p1_rounds_won_match()) == 0
    )
}

function game_beaten_single_play_2rounds() { 
    return(
        arcade_current_match() >= 7 &&
        p2_current_character() == 39 &&
        p1_rounds_won_match() == 2 &&
        prev(p1_rounds_won_match()) == 1 // I guess just change to 2 rounds
    )
}

function p1_team_has_char(char_id) => p1_character_1() == char_id || p1_character_2() == char_id || p1_character_3() == char_id
function p1_dont_have_char(char_id) => p1_character_1() != char_id && p1_character_2() != char_id && p1_character_3() != char_id

// DONE: Associação e organização das memory functions
// DONE: Correção de texto (majoritario)
// DONE: Refatoração de funções para fazer uso das utility functions (HSDM)
// DONE: Refatoração de funções para fazer uso das utility functions (Combos)
// DONE: Refatoração de funções para fazer uso das utility functions (Teams)
// TODO: Arrumar logica das conquistas de combo usando memória antiga de moves
// DONE: Refazer logicas das conquistas de time (resetar apenas se ganhar round com o time errado)
// DONE: Adicionar trigger em conquistas de time
// DONE: Arrumar conquistas usando flag de orochi do jeito errado
// DONE: Testar as conquistas de times, orochis
// TODO: Testar combos geral (e Takuma especificamente)


// =========================================
//                  HSDM              
// =========================================

achievement(
    title = "Style 524 Holy Dust", points = 5,
    description = "Hit an opponent with Kyo's Hidden Super Desperation Move during Arcade mode.",
    id = 115614, badge = "123661", published = "27/06/2020 00:58:30", modified = "12/08/2020 03:12:04",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 0 && 
              p1_moves() == 231 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Heaven Blast Flash", points = 5,
    description = "Hit an opponent with Benimaru's Hidden Super Desperation Move during Arcade mode (4 hits).",
    id = 115615, badge = "123663", published = "27/06/2020 00:58:33", modified = "12/08/2020 03:25:58",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              never(p1_current_character() != 1) && 
              once(p1_moves() == 187) &&
              (p1_hit_combo() > 5 || p2_ko_flag() == 0xff)
)

achievement(
    title = "The Elemental Four", points = 5,
    description = "Hit an opponent with Goro's Hidden Super Desperation Move during Arcade mode.",
    id = 115616, badge = "123668", published = "27/06/2020 00:58:37", modified = "12/08/2020 03:22:11",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 2 && 
              p1_moves() == 205 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Crimson Star Road", points = 5,
    description = "Hit an opponent with K's Hidden Super Desperation Move during Arcade mode.",
    id = 115617, badge = "123673", published = "27/06/2020 00:58:40", modified = "12/08/2020 03:22:11",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 30 && 
              p1_moves() != 480 && 
              prev(p1_moves()) == 480 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "ARC Enemy", points = 5,
    description = "Hit an opponent with Maxima's Hidden Super Desperation Move during Arcade mode.",
    id = 115618, badge = "123682", published = "27/06/2020 00:58:45", modified = "12/08/2020 03:22:13",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 31 && 
              p1_moves() != 207 && 
              prev(p1_moves()) == 207 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Super Black Hawk", points = 5,
    description = "Hit an opponent with Whip's Hidden Super Desperation Move during Arcade mode.",
    id = 115619, badge = "123685", published = "27/06/2020 00:59:00", modified = "12/08/2020 03:22:14",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 32 &&
              ((p1_moves() != 222 && prev(p1_moves()) == 222 && (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)) ||
               (p1_moves() != 220 && prev(p1_moves()) == 220 && (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)))
)

achievement(
    title = "Shine Knuckle", points = 5,
    description = "Hit an opponent with Terry's Hidden Super Desperation Move during Arcade mode.",
    id = 115620, badge = "123767", published = "27/06/2020 01:09:37", modified = "12/08/2020 03:22:15",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 3 && 
              p1_moves() != 206 && 
              prev(p1_moves()) == 206 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Exploding Dragon Blast", points = 5,
    description = "Hit an opponent with Andy's Hidden Super Desperation Move during Arcade mode (Two Secret Moves).",
    id = 115621, badge = "123769", published = "27/06/2020 01:09:41", modified = "12/08/2020 03:25:43",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 4 && 
              p1_moves() != 200 && 
              prev(p1_moves()) == 200 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Double Cyclone", points = 5,
    description = "Hit an opponent with Joe's Hidden Super Desperation Move during Arcade mode.",
    id = 115622, badge = "123770", published = "27/06/2020 01:09:47", modified = "12/08/2020 03:22:17",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 5 && 
              p1_moves() != 205 && 
              prev(p1_moves()) == 205 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Conqueror's Blast", points = 5,
    description = "Hit an opponent with Ryo's Hidden Super Desperation Move during Arcade mode.",
    id = 115623, badge = "123771", published = "27/06/2020 01:10:28", modified = "12/08/2020 03:22:19",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 15 && 
              p1_moves() != 203 && 
              prev(p1_moves()) == 203 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Chivalrous! Furious Fandango", points = 5,
    description = "Hit an opponent with Robert's Hidden Super Desperation Move during Arcade mode.",
    id = 115624, badge = "123772", published = "27/06/2020 01:10:35", modified = "12/08/2020 03:22:20",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 16 && 
              p1_moves() != 254 && 
              prev(p1_moves()) == 254 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Tiger Skirmish Stance", points = 5,
    description = "Hit an opponent with Takuma's Hidden Super Desperation Move during Arcade mode.",
    id = 115625, badge = "123773", published = "27/06/2020 01:10:39", modified = "12/08/2020 03:22:22",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 17 && 
              p1_moves() != 252 && 
              prev(p1_moves()) == 252
)

achievement(
    title = "Phycho Medley", points = 5,
    description = "Hit an opponent with Athena's Hidden Super Desperation Move during Arcade mode (Full Combo).",
    id = 115626, badge = "123783", published = "27/06/2020 01:10:47", modified = "12/08/2020 03:25:29",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 9 && 
              p1_moves() != 503 && 
              prev(p1_moves()) == 503 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Immortal Spirit", points = 5,
    description = "Hit an opponent with Kensou's Hidden Super Desperation Move during Arcade mode.",
    id = 115627, badge = "123806", published = "27/06/2020 01:10:50", modified = "12/08/2020 03:22:24",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 10 && 
              p1_moves() != 215 && 
              prev(p1_moves()) == 215 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Invitation to The Furnace", points = 5,
    description = "Hit an opponent with Chin's Hidden Super Desperation Move during Arcade mode.",
    id = 115628, badge = "123807", published = "27/06/2020 01:10:52", modified = "12/08/2020 03:22:25",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 11 && 
              p1_moves() == 172 && 
              prev(p1_moves()) == 170 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Shiranui Nine-Taled Fox", points = 5,
    description = "Hit an opponent with Mai's Hidden Super Desperation Move during Arcade mode.",
    id = 115629, badge = "123808", published = "27/06/2020 01:12:48", modified = "12/08/2020 03:22:26",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 18 &&
              ((p1_moves() != 177 && prev(p1_moves()) == 177 && (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)) ||
               (p1_moves() != 178 && prev(p1_moves()) == 178 && (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)))
)

achievement(
    title = "Crimson Firebird Kick", points = 5,
    description = "Hit an opponent with Yuri's Hidden Super Desperation Move during Arcade mode.",
    id = 115630, badge = "123809", published = "27/06/2020 01:12:53", modified = "12/08/2020 03:22:27",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 19 && 
              p1_moves() != 236 && 
              prev(p1_moves()) == 236 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Key of Victory", points = 5,
    description = "Hit an opponent with May Lee's Hidden Super Desperation Move during Arcade mode.",
    id = 115631, badge = "123810", published = "27/06/2020 01:12:56", modified = "12/08/2020 03:22:28",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 20 && 
              p1_moves() != 197 && 
              prev(p1_moves()) == 197 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Error... Code 2002", points = 5,
    description = "Hit an opponent with Yashiro's Hidden Super Desperation Move during Arcade mode.",
    id = 115632, badge = "123811", published = "27/06/2020 01:12:59", modified = "12/08/2020 03:22:30",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 27 && 
              p1_moves() != 159 && 
              prev(p1_moves()) == 159 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Thunder Leg Lariat", points = 5,
    description = "Hit an opponent with Shermie's Hidden Super Desperation Move during Arcade mode.",
    id = 115633, badge = "123812", published = "27/06/2020 01:13:02", modified = "12/08/2020 03:22:30",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 28 && 
              p1_moves() != 233 && 
              prev(p1_moves()) == 233 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Orochi Awakening", points = 5,
    description = "Perform Chris Hidden Super Desperation Move during Arcade mode.",
    id = 115634, badge = "123813", published = "27/06/2020 01:13:05", modified = "12/08/2020 03:25:15",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 29 && 
              p1_moves() == 158 && prev(p1_moves()) == 157
)

achievement(
    title = "Style 1219 Burning Blood Riot", points = 5,
    description = "Hit an opponent with Iori's Hidden Super Desperation Move during Arcade mode.",
    id = 115635, badge = "123814", published = "27/06/2020 01:13:55", modified = "12/08/2020 03:22:32",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 21 && 
              p1_moves() != 170 && 
              prev(p1_moves()) == 170
)

achievement(
    title = "Ecstasy 816", points = 5,
    description = "Hit an opponent with Mature's Hidden Super Desperation Move during Arcade mode.",
    id = 115636, badge = "123815", published = "27/06/2020 01:13:57", modified = "12/08/2020 03:22:35",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 22 && 
              p1_moves() == 232 && 
              prev(p1_moves()) == 231 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Over-Kill", points = 5,
    description = "Hit an opponent with Vice's Hidden Super Desperation Move during Arcade mode.",
    id = 115637, badge = "123816", published = "27/06/2020 01:14:00", modified = "12/08/2020 03:22:33",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 23 && 
              p1_moves() == 233 && prev(p1_moves()) == 232
)

achievement(
    title = "HuaHuaHua...!!", points = 5,
    description = "Hit an opponent with Yamazaki's Hidden Super Desperation Move during Arcade mode.",
    id = 115638, badge = "123872", published = "27/06/2020 01:14:02", modified = "12/08/2020 03:22:36",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 24 && 
              p1_moves() != 239 && 
              prev(p1_moves()) == 239
)

achievement(
    title = "M.Typhoon", points = 5,
    description = "Hit an opponent with Mary's Hidden Super Desperation Move during Arcade mode.",
    id = 115639, badge = "123873", published = "27/06/2020 01:14:06", modified = "12/08/2020 03:22:37",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 25 && 
              p1_moves() == 178 && 
              prev(p1_moves()) == 177
)

achievement(
    title = "Liar Elemental", points = 5,
    description = "Hit an opponent with Billy's Hidden Super Desperation Move during Arcade mode.",
    id = 115640, badge = "123874", published = "27/06/2020 01:14:08", modified = "12/08/2020 03:22:38",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 26 && 
              p1_moves() == 213 && 
              prev(p1_moves()) == 212 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Revolver Spark", points = 5,
    description = "Hit an opponent with Leona's Hidden Super Desperation Move during Arcade mode.",
    id = 115641, badge = "123875", published = "27/06/2020 01:14:10", modified = "12/08/2020 03:22:39",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 12 && 
              p1_moves() != 482 && 
              prev(p1_moves()) == 482
)

achievement(
    title = "Barek Galactica Phantom", points = 5,
    description = "Hit an opponent with Ralf's Hidden Super Desperation Move during Arcade mode.",
    id = 115642, badge = "123876", published = "27/06/2020 01:14:13", modified = "12/08/2020 03:22:39",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 13 && 
              p1_moves() != 213 && 
              prev(p1_moves()) == 213
)

achievement(
    title = "Running Pirates", points = 5,
    description = "Hit an opponent with Clark's Hidden Super Desperation Move during Arcade mode.",
    id = 115643, badge = "123877", published = "27/06/2020 01:14:15", modified = "12/08/2020 03:22:41",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 14 && 
              p1_moves() == 231 && 
              prev(p1_moves()) == 233
)

achievement(
    title = "Phoenix Flattener Zero", points = 5,
    description = "Hit an opponent with Kim's Hidden Super Desperation Move during Arcade mode.",
    id = 115644, badge = "123965", published = "27/06/2020 01:14:18", modified = "12/08/2020 03:22:44",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 6 && 
              p1_moves() == 219 && 
              prev(p1_moves()) == 218 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Iron Ball of the World", points = 5,
    description = "Hit an opponent with Chang's Hidden Super Desperation Move during Arcade mode.",
    id = 115645, badge = "123966", published = "27/06/2020 01:14:20", modified = "12/08/2020 03:22:44",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 7 && 
              p1_moves() == 206 && 
              prev(p1_moves()) == 205
)

achievement(
    title = "Fatal Eviscerator", points = 5,
    description = "Hit an opponent with Choi's Hidden Super Desperation Move during Arcade mode (3 hits or K.O).",
    id = 115646, badge = "123967", published = "27/06/2020 01:14:24", modified = "12/08/2020 03:24:53",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 8 && 
              p1_moves() == 247 &&
              (p1_hit_combo() >= 3 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Gaia Press", points = 5,
    description = "Hit an opponent with Vanessa's Hidden Super Desperation Move during Arcade mode.",
    id = 115647, badge = "123968", published = "27/06/2020 01:14:28", modified = "12/08/2020 03:22:46",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 33 && 
              p1_moves() == 199 && 
              prev(p1_moves()) == 198 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Chrysan Themum Drizzle", points = 5,
    description = "Hit an opponent with Seth's Hidden Super Desperation Move during Arcade mode.",
    id = 115648, badge = "123969", published = "27/06/2020 01:14:31", modified = "12/08/2020 03:22:47",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 34 && 
              p1_moves() == 246 && 
              prev(p1_moves()) == 247
)

achievement(
    title = "Hypnotic Tiger", points = 5,
    description = "Hit an opponent with Ramon's Hidden Super Desperation Move during Arcade mode.",
    id = 115649, badge = "123970", published = "27/06/2020 01:14:34", modified = "12/08/2020 03:22:51",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 35 && 
              p1_moves() != 234 && 
              prev(p1_moves()) == 234
)

achievement(
    title = "Freeze Completion", points = 5,
    description = "Hit an opponent with Kula's Hidden Super Desperation Move during Arcade mode.",
    id = 115650, badge = "124020", published = "27/06/2020 01:14:37", modified = "12/08/2020 03:22:50",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 36 && 
              p1_moves() == 197 && 
              prev(p1_moves()) == 184 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "This is Like...!!", points = 5,
    description = "Hit an opponent with K9999's Hidden Super Desperation Move during Arcade mode.",
    id = 115651, badge = "124021", published = "27/06/2020 01:14:40", modified = "12/08/2020 03:22:52",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 37 && 
              p1_moves() == 182 && 
              prev(p1_moves()) == 180 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Survivor's Banquet", points = 10,
    description = "Hit an opponent with Angel's Hidden Super Desperation Move during Arcade mode.",
    id = 115652, badge = "124022", published = "27/06/2020 01:14:44", modified = "12/08/2020 03:22:53",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 38 && 
              p1_moves() != 239 && 
              prev(p1_moves()) == 239
)


// Orochi Characters Start
achievement(
    title = "Armageddon", points = 5,
    description = "Hit an opponent with Orochi Yashiro's Hidden Super Desperation Move during Arcade mode.",
    id = 115653, badge = "124082", published = "27/06/2020 01:15:05", modified = "12/08/2020 03:22:54",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              (((p1_current_character() == 27 && p1_current_character() == p1_character_1() &&
                    p1_character1_is_orochi() == 1
                )) ||
               ((p1_current_character() == 27 && p1_current_character() == p1_character_2() &&
                    p1_character2_is_orochi() == 1
                )) ||
               ((p1_current_character() == 27 && p1_current_character() == p1_character_3() &&
                    p1_character3_is_orochi() == 1
                ))) &&
              p1_moves() != 147 &&
              prev(p1_moves()) == 147 && (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Fated Arrow", points = 5,
    description = "Hit an opponent with Orochi Shermie's Hidden Super Desperation Move during Arcade mode.",
    id = 115654, badge = "124083", published = "27/06/2020 01:15:12", modified = "12/08/2020 03:22:55",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              (((p1_current_character() == 28 && p1_current_character() == p1_character_1() &&
                    p1_character1_is_orochi() == 1
                )) ||
               ((p1_current_character() == 28 && p1_current_character() == p1_character_2() &&
                    p1_character2_is_orochi() == 1
                )) ||
               ((p1_current_character() == 28 && p1_current_character() == p1_character_3() &&
                    p1_character3_is_orochi() == 1
                ))) &&
              p1_moves() == 476 &&
              prev(p1_moves()) == 475 && (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)

achievement(
    title = "From the Chrysalis Emerges a Butterfly", points = 5,
    description = "Perform Orochi Chris Hidden Super Desperation Move during Arcade mode.",
    id = 115655, badge = "124084", published = "27/06/2020 01:15:17", modified = "12/08/2020 03:24:21",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              (((p1_current_character() == 29 && p1_current_character() == p1_character_1() &&
                    p1_character1_is_orochi() == 1
                )) ||
               ((p1_current_character() == 29 && p1_current_character() == p1_character_2() &&
                    p1_character2_is_orochi() == 1
                )) ||
               ((p1_current_character() == 29 && p1_current_character() == p1_character_3() &&
                    p1_character3_is_orochi() == 1
                ))) &&
              p1_moves() == 477 &&
              prev(p1_moves()) == 226 && (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)
// Orochi Characters End

achievement(
    title = "Kaiser Phoenix", points = 5,
    description = "Hit an opponent with Rugal's Hidden Super Desperation Move during Arcade mode (3 hits or K.O).",
    id = 115656, badge = "124086", published = "27/06/2020 01:15:21", modified = "12/08/2020 03:22:58",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 39 && 
              p1_moves() != 176 && 
              prev(p1_moves()) == 176 &&
              (p1_hit_combo() >= 3 || p2_ko_flag() == 0xff)
)

achievement(
    title = "Freestyle Enigmatic End Game", points = 5,
    description = "Hit an opponent with Kusanagi's Hidden Super Desperation Move during Arcade mode.",
    id = 115657, badge = "124257", published = "27/06/2020 01:15:24", modified = "12/08/2020 03:22:59",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && 
              p1_current_character() == 40 && 
              p1_moves() == 219 && 
              prev(p1_moves()) == 218 &&
              (p1_hit_combo() > 0 || p2_ko_flag() == 0xff)
)


// =========================================
//                  Combos              
// =========================================

// TODO: Test achievements that use the Special Move indicator

achievement(
    title = "2002 Combo - Kyo", points = 5,
    description = "Perform a 6-hit combo as Kyo using Ura 108 Shiki.",
    id = 115667, badge = "126193", published = "27/06/2020 01:18:07", modified = "27/06/2020 12:54:57",
    trigger = p1_current_character() == 0 && p1_hit_combo() >= 6 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 566 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Benimaru", points = 5,
    description = "Perform a 10-hit combo as Benimaru using Phantom Hurricane.",
    id = 115668, badge = "126194", published = "27/06/2020 01:18:08", modified = "27/06/2020 12:54:56",
    trigger = p1_current_character() == 1 && p1_hit_combo() >= 16 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 561 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Goro", points = 5,
    description = "Perform a 3-hit combo as Goro using Kirikabu Kaeshi.",
    id = 115693, badge = "126466", published = "27/06/2020 01:19:05", modified = "27/06/2020 12:54:54",
    trigger = p1_current_character() == 2 && p1_hit_combo() >= 3 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 571 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Terry", points = 5,
    description = "Perform a 5-hit combo as Terry with Power Geyser.",
    id = 115664, badge = "126190", published = "27/06/2020 01:18:03", modified = "27/06/2020 12:54:53",
    trigger = p1_current_character() == 3 && p1_hit_combo() >= 5 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 550 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Andy", points = 5,
    description = "Perform a 9-hit combo as Andy with Chou Rappadan.",
    id = 115665, badge = "126191", published = "27/06/2020 01:18:04", modified = "27/06/2020 12:54:52",
    trigger = p1_current_character() == 4 && p1_hit_combo() >= 9 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 554 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Joe", points = 5,
    description = "Perform a 11-hit combo as Joe using Explosion Hurricane.",
    id = 115666, badge = "126192", published = "27/06/2020 01:18:06", modified = "27/06/2020 12:54:51",
    trigger = p1_current_character() == 5 && p1_hit_combo() >= 17 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 554 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Kim", points = 5,
    description = "Perform a 13-hit combo as Kim using Hou'ou Kyaku.",
    id = 115669, badge = "126195", published = "27/06/2020 01:18:10", modified = "27/06/2020 12:54:49",
    trigger = p1_current_character() == 6 && p1_hit_combo() >= 19 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 553 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Chang", points = 5,
    description = "Perform a 3-hit combo as Chang using Tekkyu Dai-Assatsu.",
    id = 115670, badge = "126196", published = "27/06/2020 01:18:11", modified = "28/07/2020 19:18:37",
    trigger = p1_current_character() == 7 && p1_hit_combo() >= 3 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 552 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Choi", points = 5,
    description = "Perform a 17-hit combo as Choi using Hou Ou Kyaku.",
    id = 115671, badge = "126197", published = "27/06/2020 01:18:12", modified = "27/06/2020 12:54:46",
    trigger = p1_current_character() == 8 && p1_hit_combo() >= 23 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 552 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Athena", points = 5,
    description = "Perform a 6-hit combo as Athena using Shining Crystal Bit.",
    id = 115672, badge = "126444", published = "27/06/2020 01:18:14", modified = "28/07/2020 19:29:32",
    trigger = p1_current_character() == 9 && p1_hit_combo() >= 6 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 552 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Kensou", points = 5,
    description = "Perform a 13-hit combo as Kensou using Shinnryu Seioh Rekkyaku.",
    id = 115673, badge = "126445", published = "27/06/2020 01:18:15", modified = "27/06/2020 12:54:44",
    trigger = p1_current_character() == 10 && p1_hit_combo() >= 19 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 553 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Chin", points = 5,
    description = "Perform a 4-hit combo as Chin using Gouran Enpou.",
    id = 115674, badge = "126446", published = "27/06/2020 01:18:17", modified = "27/06/2020 12:54:43",
    trigger = p1_current_character() == 11 && p1_hit_combo() >= 4 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 551 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Leona", points = 5,
    description = "Perform a 4-hit combo as Leona using V-Slash.",
    id = 115694, badge = "126467", published = "27/06/2020 01:19:06", modified = "23/08/2020 15:01:07",
    trigger = p1_current_character() == 12 && once(p1_hit_combo() >= 4) && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 548 &&
              never((p1_special_move_indicator() == 0 && p1_hit_combo() == 0))
)

achievement(
    title = "2002 Combo - Ralf", points = 5,
    description = "Perform a 18-hit combo as Ralf using Exploding Vulcan Punch.",
    id = 115675, badge = "126448", published = "27/06/2020 01:18:19", modified = "27/06/2020 12:54:40",
    trigger = p1_current_character() == 13 && p1_hit_combo() >= 24 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 553 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Clark", points = 5,
    description = "Perform a 4-hit combo as Clark using Mount Tackle.",
    id = 115695, badge = "126486", published = "27/06/2020 01:19:07", modified = "23/08/2020 15:04:02",
    trigger = p1_current_character() == 14 && once(p1_hit_combo() >= 4) && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 0x23b &&
              never((p1_special_move_indicator() == 0 && p1_hit_combo() == 0))
)

achievement(
    title = "2002 Combo - Ryo", points = 5,
    description = "Perform a 17-hit combo as Ryo with Ryoku Ranbu.",
    id = 115661, badge = "126441", published = "27/06/2020 01:17:59", modified = "27/06/2020 12:54:37",
    trigger = p1_current_character() == 15 && p1_hit_combo() >= 23 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 546 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Robert", points = 5,
    description = "Perform a 18-hit combo as Robert.",
    id = 115662, badge = "126442", published = "27/06/2020 01:18:01", modified = "27/06/2020 12:54:36",
    trigger = p1_current_character() == 16 && p1_hit_combo() >= 0x18 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 555 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Takuma", points = 5,
    description = "Perform a 13-hit combo as Takuma.",
    id = 115663, badge = "126443", published = "27/06/2020 01:18:02", modified = "27/06/2020 12:54:35",
    trigger = p1_current_character() == 17 && p1_hit_combo() >= 19 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 553 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Mai", points = 5,
    description = "Perform a 8-hit combo as Mai using Chou Hissatsu Shinobi Bachi.",
    id = 115676, badge = "126449", published = "27/06/2020 01:18:20", modified = "27/06/2020 12:54:33",
    trigger = p1_current_character() == 18 && p1_hit_combo() >= 8 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 550 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Yuri", points = 5,
    description = "Perform a 15-hit combo as Yuri using Hien Hou Ou Kyaku.",
    id = 115677, badge = "126450", published = "27/06/2020 01:18:21", modified = "27/06/2020 12:54:32",
    trigger = p1_current_character() == 19 && p1_hit_combo() >= 21 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 554 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - May Lee", points = 5,
    description = "Perform a 6-hit combo as May Lee using Shinjuu Kyaku God Leg.",
    id = 115678, badge = "126451", published = "27/06/2020 01:18:23", modified = "23/08/2020 13:53:47",
    trigger = p1_current_character() == 20 && p1_hit_combo() >= 6 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 548 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Hero May Lee", points = 5,
    description = "Perform a 5-hit combo as Hero May Lee using Key of Victory.",
    id = 115679, badge = "126488", published = "27/06/2020 01:18:24", modified = "17/07/2022 01:30:15",
    trigger = p1_current_character() == 20 && p1_hit_combo() >= 5 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 566 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Iori", points = 5,
    description = "Perform a 18-hit combo as Iori using Ura 316 Shiki Saika.",
    id = 115680, badge = "126452", published = "27/06/2020 01:18:26", modified = "27/06/2020 12:54:27",
    trigger = p1_current_character() == 21 && p1_hit_combo() >= 24 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 554 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Mature", points = 5,
    description = "Perform a 3-hit combo as Mature using Heaven's Gate.",
    id = 115696, badge = "126472", published = "27/06/2020 01:19:09", modified = "27/06/2020 12:54:25",
    trigger = p1_current_character() == 22 && p1_hit_combo() >= 3 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 571 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Vice", points = 5,
    description = "Perform a 3-hit combo as Vice using Negative Gain.",
    id = 115697, badge = "126473", published = "27/06/2020 01:19:12", modified = "27/06/2020 12:54:24",
    trigger = p1_current_character() == 23 && once(p1_hit_combo() >= 3) && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 549 &&
              never((p1_special_move_indicator() == 0 && p1_hit_combo() == 0))
)

achievement(
    title = "2002 Combo - Yamazaki", points = 5,
    description = "Perform a 5-hit combo as Yamazaki using Guillotine.",
    id = 115681, badge = "126453", published = "27/06/2020 01:18:33", modified = "23/08/2020 15:20:17",
    trigger = p1_current_character() == 24 && once(p1_hit_combo() >= 5) && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 549 &&
              never((p1_special_move_indicator() == 0 && p1_hit_combo() == 0))
)

achievement(
    title = "2002 Combo - Mary", points = 5,
    description = "Perform a 12-hit combo as Mary using M. Splash Rose.",
    id = 115682, badge = "126454", published = "27/06/2020 01:18:34", modified = "27/06/2020 12:54:21",
    trigger = p1_current_character() == 25 && p1_hit_combo() >= 18 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 552 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Billy", points = 5,
    description = "Perform a 4-hit combo as Billy using Dai Senpuu.",
    id = 115683, badge = "126455", published = "27/06/2020 01:18:36", modified = "27/06/2020 12:54:20",
    trigger = p1_current_character() == 26 && p1_hit_combo() >= 4 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 554 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Yashiro", points = 5,
    description = "Perform a 5-hit combo as Yashiro using Final Impact.",
    id = 115684, badge = "126456", published = "27/06/2020 01:18:37", modified = "27/06/2020 12:54:18",
    trigger = p1_current_character() == 27 && p1_hit_combo() >= 5 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 564 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Shermie", points = 5,
    description = "Perform a 3-hit combo as Shermie using Shermie Flash.",
    id = 115685, badge = "126457", published = "27/06/2020 01:18:39", modified = "27/06/2020 12:54:17",
    trigger = p1_current_character() == 28 && once(p1_hit_combo() >= 3) && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 564 &&
              never((p1_special_move_indicator() == 0 && p1_hit_combo() == 0))
)

achievement(
    title = "2002 Combo - Chris", points = 5,
    description = "Perform a 12-hit combo as Chris using Twister Drive.",
    id = 115686, badge = "126459", published = "27/06/2020 01:18:40", modified = "27/06/2020 12:54:15",
    trigger = p1_current_character() == 29 && p1_hit_combo() >= 18 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 560 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - K'", points = 5,
    description = "Perform a 17-hit combo as K Dash with Chain Drive.",
    id = 115658, badge = "126187", published = "27/06/2020 01:17:53", modified = "27/06/2020 12:54:13",
    trigger = p1_current_character() == 30 && p1_hit_combo() >= 23 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 554 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Maxima", points = 5,
    description = "Perform a 6-hit combo as Maxima with Bunker Buster.",
    id = 115659, badge = "126188", published = "27/06/2020 01:17:54", modified = "29/06/2020 05:47:03",
    trigger = p1_current_character() == 31 && p1_hit_combo() >= 6 && once(p1_last_move_used() == 557) &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Whip", points = 5,
    description = "Perform a 22-hit combo as Whip with Sonic Slaughter.",
    id = 115660, badge = "126189", published = "27/06/2020 01:17:56", modified = "27/06/2020 12:54:11",
    trigger = p1_current_character() == 32 && p1_hit_combo() >= 34 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 552 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Vanessa", points = 5,
    description = "Perform a 7-hit combo as Vanessa using Champion Puncher.",
    id = 115687, badge = "126460", published = "27/06/2020 01:18:42", modified = "27/06/2020 12:54:09",
    trigger = p1_current_character() == 33 && p1_hit_combo() >= 7 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 551 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Seth", points = 5,
    description = "Perform a 9-hit combo as Seth using Irimi Nadazuki.",
    id = 115688, badge = "126461", published = "27/06/2020 01:18:51", modified = "27/06/2020 12:54:06",
    trigger = p1_current_character() == 34 && p1_hit_combo() >= 9 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 555 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Ramon", points = 5,
    description = "Perform a 15-hit combo as Ramon using El Diablo Amarillo.",
    id = 115689, badge = "126462", published = "27/06/2020 01:18:53", modified = "23/08/2020 19:43:05",
    trigger = p1_current_character() == 35 && p1_hit_combo() >= 21 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 550 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Kula", points = 5,
    description = "Perform a 10-hit combo as Kula using Freeze Execution.",
    id = 115690, badge = "126463", published = "27/06/2020 01:19:00", modified = "27/06/2020 12:54:04",
    trigger = p1_current_character() == 36 && p1_hit_combo() >= 16 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 549 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - K9999", points = 5,
    description = "Perform a 5-hit combo as K9999 using Moon....",
    id = 115691, badge = "126464", published = "27/06/2020 01:19:01", modified = "27/06/2020 12:54:03",
    trigger = p1_current_character() == 37 && p1_hit_combo() >= 5 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 542 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Angel", points = 5,
    description = "Perform a 14-hit combo as Angel using Loyalty Test For Rebelist.",
    id = 115692, badge = "126465", published = "27/06/2020 01:19:03", modified = "27/06/2020 12:54:02",
    trigger = p1_current_character() == 38 && p1_hit_combo() >= 20 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 557 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Orochi Yashiro", points = 5,
    description = "Perform a 4-hit combo as Orochi Yashiro using Ankoku Jigoku Gokuraku Otoshi.",
    id = 115699, badge = "126475", published = "27/06/2020 01:19:21", modified = "25/08/2020 22:07:27",
    trigger = once(p1_hit_combo() >= 3) && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 555 &&
              never((p1_special_move_indicator() == 0 && p1_hit_combo() == 0)) &&
              (((p1_current_character() == 27 && p1_current_character() == p1_character_1() &&
                    p1_character1_is_orochi() == 1
                )) ||
               ((p1_current_character() == 27 && p1_current_character() == p1_character_2() &&
                    p1_character2_is_orochi() == 1
                )) ||
               ((p1_current_character() == 27 && p1_current_character() == p1_character_3() &&
                    p1_character3_is_orochi() == 1
                )))
)

achievement(
    title = "2002 Combo - Orochi Shermie", points = 5,
    description = "Perform a 7-hit combo as Orochi Shermie using Ankoku Raikou Ken.",
    id = 115700, badge = "126477", published = "27/06/2020 01:19:23", modified = "27/06/2020 12:53:58",
    trigger = p1_hit_combo() >= 7 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 562 &&
              never((p1_special_move_indicator() == 0 && p1_hit_combo() == 0)) &&
              (((p1_current_character() == 28 && p1_current_character() == p1_character_1() &&
                    p1_character1_is_orochi() == 1
                )) ||
               ((p1_current_character() == 28 && p1_current_character() == p1_character_2() &&
                    p1_character2_is_orochi() == 1
                )) ||
               ((p1_current_character() == 28 && p1_current_character() == p1_character_3() &&
                    p1_character3_is_orochi() == 1
                )))
)

achievement(
    title = "2002 Combo - Orochi Chris", points = 5,
    description = "Perform a 4-hit combo as Orochi Chris using Ankoku Orochinagi.",
    id = 115701, badge = "126478", published = "27/06/2020 01:19:24", modified = "27/06/2020 12:53:57",
    trigger = p1_hit_combo() >= 4 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 566 &&
              never((p1_special_move_indicator() == 0 && p1_hit_combo() == 0)) &&
              (((p1_current_character() == 29 && p1_current_character() == p1_character_1() &&
                    p1_character1_is_orochi() == 1
                )) ||
               ((p1_current_character() == 29 && p1_current_character() == p1_character_2() &&
                    p1_character2_is_orochi() == 1
                )) ||
               ((p1_current_character() == 29 && p1_current_character() == p1_character_3() &&
                    p1_character3_is_orochi() == 1
                )))
)

achievement(
    title = "2002 Combo - Rugal", points = 5,
    description = "Perform a 7-hit combo as Rugal using Gigantic Presser.",
    id = 115698, badge = "126474", published = "27/06/2020 01:19:14", modified = "27/06/2020 12:53:56",
    trigger = p1_current_character() == 39 && p1_hit_combo() >= 7 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 571 &&
              never(p1_hit_combo() == 0)
)

achievement(
    title = "2002 Combo - Kusanagi", points = 5,
    description = "Perform a 4-hit combo as Kusanagi using Ura 108 Orochinagi.",
    id = 115702, badge = "126481", published = "27/06/2020 01:19:26", modified = "27/06/2020 12:53:54",
    trigger = p1_current_character() == 40 && p1_hit_combo() >= 4 && __ornext(p1_hit_combo() > prev(p1_hit_combo()) || p2_hp() < prev(p2_hp())) && p1_last_move_used() == 566 &&
              never((p1_special_move_indicator() == 0 && p1_hit_combo() == 0))
)

// =========================================
//           Beat the game (Teams)              
// =========================================

achievement(
    title = "The Official 2002: Japan Team", points = 10, type="win_condition",
    description = "Beat the game with Kyo, Benimaru and Daimon (Level-3 difficulty).",
    id = 115712, badge = "123536", published = "27/06/2020 03:04:29", modified = "27/06/2020 03:04:29",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(0) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(1) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(2) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(0) &&
              p1_team_has_char(1) &&
              p1_team_has_char(2) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Official 2002: KOF '99 Team", points = 10, type="win_condition",
    description = "Beat the game with K', Maxima and Whip (Level-3 difficulty).",
    id = 115714, badge = "123538", published = "27/06/2020 03:04:35", modified = "27/06/2020 03:04:35",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(30) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(31) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(32) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(30) &&
              p1_team_has_char(31) &&
              p1_team_has_char(32) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Official 2002: Fatal Fury Team", points = 10, type="win_condition",
    description = "Beat the game with Terry, Andy and Joe (Level-3 difficulty).",
    id = 115713, badge = "123537", published = "27/06/2020 03:04:32", modified = "28/06/2020 18:44:12",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(3) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(4) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(5) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(3) &&
              p1_team_has_char(4) &&
              p1_team_has_char(5) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Official 2002: Art of Fighting Team", points = 10, type="win_condition",
    description = "Beat the game with Ryo, Robert and Takuma (Level-3 difficulty).",
    id = 115715, badge = "123539", published = "27/06/2020 03:04:37", modified = "27/06/2020 03:04:37",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(15) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(16) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(17) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(15) &&
              p1_team_has_char(16) &&
              p1_team_has_char(17) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Official 2002: Psycho Soldier Team", points = 10, type="win_condition",
    description = "Beat the game with Athena, Kensou and Chin (Level-3 difficulty).",
    id = 115716, badge = "123540", published = "27/06/2020 03:04:40", modified = "27/06/2020 03:04:40",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(9) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(10) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(11) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(9) &&
              p1_team_has_char(10) &&
              p1_team_has_char(11) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Official 2002: Women Fighters Team", points = 10, type="win_condition",
    description = "Beat the game with Mai, Yuri and May Lee (Level-3 difficulty).",
    id = 115717, badge = "123541", published = "27/06/2020 03:04:42", modified = "27/06/2020 03:04:42",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(18) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(19) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(20) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(18) &&
              p1_team_has_char(19) &&
              p1_team_has_char(20) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Official 2002: KOF '98 Team", points = 10, type="win_condition",
    description = "Beat the game with Yashiro, Shermie and Chris (Level-3 difficulty).",
    id = 115718, badge = "123545", published = "27/06/2020 03:04:45", modified = "27/06/2020 03:04:45",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              p1_orochi_flags() == 0 &&
              never(p1_orochi_flags() != 0 && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(27) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(28) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(29) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(27) &&
              p1_team_has_char(28) &&
              p1_team_has_char(29) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Official 2002: KOF '96 Team", points = 10, type="win_condition",
    description = "Beat the game with Iori, Mature and Vice (Level-3 difficulty).",
    id = 115719, badge = "123562", published = "27/06/2020 03:05:39", modified = "27/06/2020 03:05:39",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(21) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(22) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(23) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(21) &&
              p1_team_has_char(22) &&
              p1_team_has_char(23) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Official 2002: KOF '97 Team", points = 10, type="win_condition",
    description = "Beat the game with Yamazaki, Blue Mary and Billy (Level-3 difficulty).",
    id = 115720, badge = "123564", published = "27/06/2020 03:05:41", modified = "27/06/2020 03:05:41",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(24) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(25) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(26) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(24) &&
              p1_team_has_char(25) &&
              p1_team_has_char(26) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Official 2002: Ikari Team", points = 10, type="win_condition",
    description = "Beat the game with Leona, Ralf and Clark (Level-3 difficulty).",
    id = 115721, badge = "123565", published = "27/06/2020 03:05:43", modified = "27/06/2020 03:05:43",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(12) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(13) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(14) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(12) &&
              p1_team_has_char(13) &&
              p1_team_has_char(14) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Official 2002: Korea Team", points = 10, type="win_condition",
    description = "Beat the game with Kim, Chang and Choi (Level-3 difficulty).",
    id = 115722, badge = "123566", published = "27/06/2020 03:05:45", modified = "27/06/2020 03:05:45",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(6) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(7) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(8) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(6) &&
              p1_team_has_char(7) &&
              p1_team_has_char(8) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Official 2002: KOF 2000 Team", points = 10, type="win_condition",
    description = "Beat the game with Vanessa, Seth and Ramon (Level-3 difficulty).",
    id = 115723, badge = "123567", published = "27/06/2020 03:05:47", modified = "27/06/2020 03:05:47",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(33) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(34) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(35) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(33) &&
              p1_team_has_char(34) &&
              p1_team_has_char(35) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Official 2002: KOF 2001 Team", points = 10, type="win_condition",
    description = "Beat the game with Kula, K9999 and Angel (Level-3 difficulty).",
    id = 115724, badge = "123568", published = "27/06/2020 03:05:50", modified = "27/06/2020 03:05:50",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(36) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(37) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(38) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(36) &&
              p1_team_has_char(37) &&
              p1_team_has_char(38) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Official 2002: New Faces Orochi Team", points = 10, type="win_condition",
    description = "Beat the game with Orochi Yashiro, Orochi Shermie and Orochi Chris (Level-3 difficulty).",
    id = 115725, badge = "123569", published = "27/06/2020 03:05:52", modified = "27/06/2020 03:05:52",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              p1_orochi_flags() == 7 && 
              never(p1_orochi_flags() != 7 && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(27) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(28) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(29) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(27) &&
              p1_team_has_char(28) &&
              p1_team_has_char(29) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Official 2002: Reverence Boss Team", points = 5, type="win_condition",
    description = "Beat the game with Rugal on your team (Level-3 difficulty).",
    id = 115726, badge = "123570", published = "27/06/2020 03:05:55", modified = "27/06/2020 03:05:55",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(39) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(39) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Official 2002: Secret Team", points = 5, type="win_condition",
    description = "Beat the game with Kusanagi on your team (Level-3 difficulty).",
    id = 115727, badge = "123571", published = "27/06/2020 03:05:58", modified = "27/06/2020 03:05:58",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(40) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(40) &&
              settings_difficulty() >= 2
)

// =========================================
//          Beat the game (Custom)              
// =========================================

achievement(
    title = "The Ex 2002: Where's Bao", points = 10,
    description = "Beat the game with Athena, Kensou and Chris (Level-3 difficulty).",
    id = 115728, badge = "123572", published = "27/06/2020 03:07:42", modified = "19/08/2022 21:03:02",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(9) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(10) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(29) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(9) &&
              p1_team_has_char(10) &&
              p1_team_has_char(29) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Ex 2002: Where's Gato 03", points = 10,
    description = "Beat the game with Billy, Yamazaki and Terry (Level-3 difficulty).",
    id = 115729, badge = "123573", published = "27/06/2020 03:07:45", modified = "19/08/2022 21:03:20",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(26) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(24) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(3) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(26) &&
              p1_team_has_char(24) &&
              p1_team_has_char(3) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Ex 2002: Where's King 94", points = 10,
    description = "Beat the game with Mai, Yuri and Blue Mary (Level-3 difficulty).",
    id = 115730, badge = "123574", published = "27/06/2020 03:07:47", modified = "19/08/2022 21:03:37",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(18) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(19) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(25) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(18) &&
              p1_team_has_char(19) &&
              p1_team_has_char(25) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Ex 2002: Earth Team", points = 10,
    description = "Beat the game with Daimon, Seth and Yashiro (Level-3 difficulty).",
    id = 115731, badge = "123575", published = "27/06/2020 03:07:48", modified = "27/06/2020 03:07:48",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(2) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(34) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(27) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(2) &&
              p1_team_has_char(34) &&
              p1_team_has_char(27) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Ex 2002: Weapon Team", points = 10,
    description = "Beat the game with K9999, Whip and Maxima (Level-3 difficulty).",
    id = 115732, badge = "123583", published = "27/06/2020 03:07:51", modified = "27/06/2020 03:07:51",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(37) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(32) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(31) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(37) &&
              p1_team_has_char(32) &&
              p1_team_has_char(31) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Ex 2002: Masters Team", points = 10,
    description = "Beat the game with Takuma, Chin and Kim (Level-3 difficulty).",
    id = 115733, badge = "123584", published = "27/06/2020 03:07:53", modified = "27/06/2020 03:07:53",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(17) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(11) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(6) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(17) &&
              p1_team_has_char(11) &&
              p1_team_has_char(6) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Ex 2002: Shock Team", points = 10,
    description = "Beat the game with Orochi Shermie, May Lee and Benimaru (Level-3 difficulty).",
    id = 115734, badge = "123587", published = "27/06/2020 03:07:55", modified = "27/06/2020 03:07:55",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              p1_orochi_flags() == 1 && 
              never(p1_dont_have_char(28) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(20) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(1) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(28) &&
              p1_team_has_char(20) &&
              p1_team_has_char(1) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Ex 2002: Colored Hair Team", points = 10,
    description = "Beat the game with Mature, Kula and Vanessa (Level-3 difficulty).",
    id = 115735, badge = "123588", published = "27/06/2020 03:07:58", modified = "27/06/2020 03:07:58",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(22) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(36) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(33) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(22) &&
              p1_team_has_char(36) &&
              p1_team_has_char(33) &&
              settings_difficulty() >= 2
)

achievement(
    title = "The Ex 2002: Flames Team", points = 10,
    description = "Beat the game with K', Iori and Kyo (Level-3 difficulty).",
    id = 115736, badge = "123589", published = "27/06/2020 03:08:00", modified = "27/06/2020 03:08:00",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p1_dont_have_char(30) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(21) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              never(p1_dont_have_char(0) && p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              p1_team_has_char(30) &&
              p1_team_has_char(21) &&
              p1_team_has_char(0) &&
              settings_difficulty() >= 2
)

// =========================================
//          Beat the game (Others)              
// =========================================

achievement(
    title = "The Path of a Lone Warrior", points = 10,
    description = "Beat the game in Single Play mode (Level-3 difficulty, 3 rounds).",
    id = 115751, badge = "124288", published = "27/06/2020 03:16:59", modified = "27/06/2020 03:16:59",
    trigger = no_unibios() && p1_only() &&
              never(game_mode() != 0) && 
              game_beaten_single_play_2rounds() &&
              settings_rounds() == 1 &&
              settings_difficulty() >= 2
)

achievement(
    title = "My Legacy is My Clan", points = 25,
    description = "Beat the game in Team Play using only one credit (Level-3 difficulty).",
    id = 115750, badge = "124267", published = "27/06/2020 03:16:57", modified = "27/06/2020 03:16:57",
    trigger = no_unibios() && p1_only() &&
              never(game_mode() != 1) && 
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && prev(p1_character_1()) == 0xff && p1_character_1() != prev(p1_character_1())) &&
              never(p2_rounds_won_match() == 3) && 
              trigger_when(game_beaten_team_play()) &&
              settings_difficulty() >= 2
)

achievement(
    title = "My Time to Show What I've Learned", points = 25,
    description = "Beat the game in Team Play on the hardest difficulty.",
    id = 115752, badge = "124293", published = "27/06/2020 03:17:02", modified = "27/06/2020 03:17:02",
    trigger = never(game_mode() != 1) && no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              settings_difficulty() == 7
)

achievement(
    title = "Button Masher", points = 25,
    description = "Beat the game as Chang, using only Tekkyuu Dai-Kaiten as his Special Move on Single Play (Level-3 difficulty, 3 rounds).",
    id = 116009, badge = "126705", published = "28/06/2020 14:58:37", modified = "29/06/2020 18:14:54",
    trigger = no_unibios() &&
              p1_character_1() == 7 && 
              unless(p1_character_1() != 7) &&
              never(p1_last_move_used() == 0x21a) &&
              never(p1_last_move_used() == 540) && never(p1_last_move_used() == 571) &&
              never(p1_last_move_used() == 548) && never(p1_last_move_used() == 543) &&
              never(p1_last_move_used() == 549) && never(p1_last_move_used() == 552) &&
              never(p1_last_move_used() == 560) && 
              (always_false() || never(p1_dont_have_char(7) && p1_rounds_won_match() > prev(p1_rounds_won_match())) || p1_only()) &&
              once(arcade_current_match() == 0 && arcade_team_defeated() == 0 && p1_character_1() == 0x07 && prev(p1_character_1()) == 0xff) &&
              trigger_when(game_beaten_single_play_2rounds()) &&
              settings_difficulty() >= 2
)

// =========================================
//                   Misc              
// =========================================

achievement(
    title = "I-Basic KOF Move 2002: GC Body Blow", points = 1,
    description = "Perform a Guard Cancel in body blow during Arcade mode.",
    id = 115737, badge = "124290", published = "27/06/2020 03:09:12", modified = "27/06/2020 03:09:12",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && once(p1_moves() == 118) && never(once(p1_moves() != 118))
)

achievement(
    title = "II-Basic KOF Move 2002: GC Evade", points = 1,
    description = "Perform a Guard Cancel evade during Arcade mode.",
    id = 115738, badge = "124291", published = "27/06/2020 03:09:16", modified = "27/06/2020 03:09:16",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && (p1_moves() == 61 || p1_moves() == 59)
)

achievement(
    title = "III-Basic KOF Move 2002: Recovery", points = 1,
    description = "Perform a Recovery Roll during Arcade mode.",
    id = 115739, badge = "124292", published = "27/06/2020 03:09:20", modified = "27/06/2020 03:09:20",
    trigger = no_unibios() && p1_only() &&
              no_practice_mode() && once(p1_moves() == 69) && never(p1_moves() != 69)
)

achievement(
    title = "is This the Maximum I Can Get? I Think Not...", points = 2,
    description = "Reach 100.000 score during Team Play.",
    id = 115740, badge = "124214", published = "27/06/2020 03:13:34", modified = "27/06/2020 03:13:34",
    trigger = no_unibios() && p1_only() &&
              game_mode() == 1 && never(p1_score_00xx0000() < 16) && never(p1_score_00xx0000() > 25)
)

achievement(
    title = "Well, That's It. Maybe a Little More", points = 3,
    description = "Reach 200.000 score during Team Play.",
    id = 115741, badge = "124216", published = "27/06/2020 03:13:36", modified = "27/06/2020 03:13:36",
    trigger = no_unibios() && p1_only() &&
              game_mode() == 1 && never(p1_score_00xx0000() < 32) && never(p1_score_00xx0000() > 41)
)

achievement(
    title = "That's Right! That's What I Was Talking About", points = 5,
    description = "Reach 300.000 score during Team Play.",
    id = 115742, badge = "124217", published = "27/06/2020 03:13:39", modified = "27/06/2020 03:13:39",
    trigger = no_unibios() && p1_only() &&
              game_mode() == 1 && never(p1_score_00xx0000() < 48) && never(p1_score_00xx0000() > 57)
)

achievement(
    title = "Crossing the Line", points = 3,
    description = "Tease your opponent 15 times during Arcade mode.",
    id = 115743, badge = "124270", published = "27/06/2020 03:13:49", modified = "28/06/2020 15:09:50",
    trigger = no_unibios() && p1_only_globalreset() &&
              measured(repeated(15, p1_moves() == 70)) && unless(prev(p1_moves()) == 70)
)

achievement(
    title = "Eating Fast", points = 5,
    description = "Eat 5 rice balls as Kensou in one round.",
    id = 115744, badge = "126129", published = "27/06/2020 03:15:13", modified = "27/06/2020 03:15:13",
    trigger = no_unibios() && p1_only_globalreset() &&
              never(p1_current_character() != 10) && measured(repeated(5, p1_moves() == 153)) && unless(prev(p1_moves()) == 153) &&
              never(match_timer() == 96)
)

achievement(
    title = "Fervent Blood", points = 5,
    description = "As Leona, transform on Orochi form during the first 5 seconds and then win the round on Arcade mode.",
    id = 116010, badge = "126706", published = "28/06/2020 14:58:44", modified = "28/06/2020 16:30:10",
    trigger = p1_current_character() == 12 && 
              trigger_when(p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              once(match_timer() >= 85 && p1_leona_transformation() == 8 && p1_leona_transformation() != prev(p1_leona_transformation())) && 
              never(p1_and_p2_state_combo() == 257) &&
              never(p1_ko_flag() == 255) && 
              never(p2_rounds_won_match() > prev(p2_rounds_won_match())) &&
              no_unibios()
)

achievement(
    title = "Hit'n Run", points = 3,
    description = "Win a round by a time-out on Arcade mode.",
    id = 116011, badge = "126704", published = "28/06/2020 14:58:47", modified = "28/06/2020 16:30:11",
    trigger = match_timer() == 0 && p1_rounds_won_match() > prev(p1_rounds_won_match()) &&
              never(p1_and_p2_state_combo() == 257) && no_unibios()
)

achievement(
    title = "Do You Taste The Angel's Extraordinary Skill!?", points = 3,
    description = "Defeat Angel on Team Play (Level-3 difficulty).",
    id = 116012, badge = "126507", published = "28/06/2020 14:58:52", modified = "28/06/2020 16:30:12",
    trigger = once(arcade_current_match() == 5) && never(arcade_current_match() < 5) &&
              once(p2_current_character() == 38) && p1_rounds_won_match() == 1 && game_mode() == 1 &&
              no_unibios() &&
              settings_difficulty() >= 2
)

achievement(
    title = "The 9999th Clone", points = 5,
    description = "Defeat K9999 on Team Play (Level-3 difficulty).",
    id = 116013, badge = "126508", published = "28/06/2020 14:58:55", modified = "28/06/2020 16:30:13",
    trigger = once(arcade_current_match() == 5) && never(arcade_current_match() < 5) &&
              once(p2_current_character() == 37) && p1_rounds_won_match() == 1 && game_mode() == 1 &&
              no_unibios() &&
              settings_difficulty() >= 2
)

achievement(
    title = "Shine On You Crazy Diamond", points = 10,
    description = "Defeat Kula Diamond on Team Play (Level-3 difficulty).",
    id = 116014, badge = "126509", published = "28/06/2020 14:58:57", modified = "28/06/2020 16:30:15",
    trigger = arcade_current_match() == 5 && never(arcade_current_match() < 5) && p2_current_character() == 36 &&
              p1_rounds_won_match() == 1 && game_mode() == 1 && no_unibios() &&
              settings_difficulty() >= 2
)

achievement(
    title = "Without Losing Adrenaline", points = 10,
    description = "Get a perfect victory against any of the challengers (Level-3 difficulty).",
    id = 115747, badge = "124238", published = "27/06/2020 03:16:50", modified = "27/06/2020 03:16:50",
    trigger = no_unibios() && p1_only() &&
              arcade_team_defeated() == 31 && arcade_current_match() == 5 && p1_hp() == 102 &&
              trigger_when(p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              settings_difficulty() >= 2
)

achievement(
    title = "Breaking out in a Cold Sweat", points = 25,
    description = "Get a perfect win against Rugal (Level-3 difficulty).",
    id = 115748, badge = "124239", published = "27/06/2020 03:16:52", modified = "27/06/2020 03:16:52",
    trigger = no_unibios() && p1_only() &&
              arcade_current_match() == 7 && p2_current_character() == 39 && p1_hp() == 102 &&
              trigger_when(p1_rounds_won_match() > prev(p1_rounds_won_match())) &&
              settings_difficulty() >= 2
)

achievement(
    title = "Hold Firm Partners", points = 10,
    description = "Beat three teams without losing any partner (Level-3 difficulty).",
    id = 115749, badge = "124258", published = "27/06/2020 03:16:54", modified = "23/08/2020 16:19:29",
    trigger = no_unibios() && p1_only() &&
              never(game_mode() != 1) && once(arcade_current_match() == 0 && arcade_current_match() == 0) &&
              never(p2_rounds_won_match() > 0) && arcade_team_defeated() == 7 &&
              settings_difficulty() >= 2
)
