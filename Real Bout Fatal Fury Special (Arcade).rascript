// Real Bout Fatal Fury Special
// #ID = 12662

// Settings

function settings_difficulty() => byte(0x00E014) 
function settings_timer() => byte(0x00E017) 

// Game
function unibios_mode() => word(0x00FE30)
function mvs_mode() => byte(0x00FD83)
function start_game_protection() => word(0x00FE50)

function game_screen() => word(0x000002)
         GS_CHARACTER_SELECTION = 0xA562
         GS_GAME_OVER = 0xB9BA
         GS_TITLE_SCREEN = 0x99FC
         GS_RANKING = 0x9DD2
         GS_DEMONSTRATION = 0x9C78
         GS_CONGRATULATIONS = 0xB6B2
         GS_RANKING_NAME_SCREEN = 0xB888
         GS_HOW_TO = 0xA43C
         GS_FIGHTING = 0xAC5C

function game_state() => word(0x41d0)

function game_mode() => byte(0x0041D6)
         MODE_TITLE_SCREEN = 0x00
         MODE_ARCADE_MODE_P1 = 0x01
         MODE_ARCADE_MODE_P2 = 0x02
         MODE_VERSUS_MODE = 0x03
         MODE_DEMO_MODE = 0x04
         MODE_CHARACTER_SELECT = 0x05

function game_arcade_match() => byte(0x006A34)


// Match and rounds

function round_count() => byte(0x006A36)
function round_frame_time() => word(0x6ab6)

// P1
function p1_active_state() => byte(0x00FDB7)
function p1_character() => byte(0x006A24)
function p1_character_selected_in_char_select() => byte(0x0041F6)
function p1_shadow_secret_character() => byte(0x00E046)

function p1_rounds_won_bit0() => bit0(0x006A82)
function p1_rounds_won_bit1() => bit1(0x006A82)
function p1_rounds_won() => byte(0x006A82)
function p1_fighting_level_1st_round() => byte(0x006AA9)
function p1_fighting_level_2nd_round() => byte(0x006AA8)

function p1_health() => byte(0x00048A)
function p1_break_shot_flag() => bit0(0x000489)
function p1_moves_type_3() => byte(0x0004B7)
function p1_special_moves_flags_1() => byte(0x04c8) // super moves
function p1_special_moves_flags_2() => byte(0x04c9) // special moves
function p1_taunt() => bit0(0x0004BF)
function p1_hit_combo() => byte(0x00A33D)

function p1_score_xx000000() => byte(0x00E00B)
function p1_score_00xx0000() => byte(0x00E00A)
function p1_score_0000xx00() => byte(0x00e00d)
function p1_score_000000xx() => byte(0x00e00c)
function p1_buttons_bit5() => bit5(0x00FD97)
function p1_buttons_bit6() => bit6(0x00FD97)

// P2

function p2_active_state() => byte(0x00FDB6)
function p2_health() => byte(0x00058A)
function p2_ring_out() => byte(0x00A36C)
function p2_rounds_won() => byte(0x006A83)

function p1_and_p2_start_button() => bit0(0x00FEDD)

// Utility Functions

function p1_only() => never(p1_active_state() == 0) && never(p2_active_state() > 0)
function no_unibios() => unibios_mode() == 0
function arcade_krauser_defeated() {
    return(
        p1_rounds_won() == 2 &&
        prev(p1_rounds_won()) == 1 &&
        game_arcade_match() == 9
    )
}

function arcade_mode_has_started() => game_arcade_match() == 1 && game_state() == 8 && prev(game_state()) == 7

function p1_won_a_round() => p1_rounds_won() > prev(p1_rounds_won())
function p1_won_a_match() => p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1

function p1_finished_with_dm() {
    return (
        once(__ornext(p1_special_moves_flags_1() == 0x02 || 
                      p1_special_moves_flags_1() == 0x08 ||
                      p1_special_moves_flags_1() == 0x01 ||
                      p1_special_moves_flags_1() == 0x04 
                )) &&
        never(p1_moves_type_3() > 0 && prev(p1_moves_type_3()) == 0) &&
        p1_won_a_round() &&
        p2_health() == 0xFF
    )
}

function p1_finished_with_dm_duck_king() {
    return (
        once(__ornext(p1_special_moves_flags_1() == 0x02 ||
                       p1_special_moves_flags_1() == 0x40 ||
                       p1_special_moves_flags_1() == 0x20 ||
                       p1_special_moves_flags_1() == 0x80 ||
                       p1_special_moves_flags_1() == 0x01 ||
                       p1_special_moves_flags_1() == 0x08)) &&
        never(p1_moves_type_3() > 0 && prev(p1_moves_type_3()) == 0) &&
        p1_won_a_round() &&
        p2_health() == 0xFF
    )
}

// DONE: Arrumado a escrita e capitalização
// DONE: Reescrever a lógica de todos DMs para usarem "p1_special_moves_flags_1", e adicionar exceções para os personagens que tem DMs únicos (Blue Mary, Duck King, e mais?)
// TODO: Arrumar conquista de finalizar Krauser com Super Move, talvez seja dificil
// TODO: Revisar "Have beautiful dreams" https://retroachievements.org/achievement/122099
// DONE: Arrumado "Victory is just the beginning..." https://retroachievements.org/ticket/82197
// DONE: Arrumado "Is it just that or is there more?" https://retroachievements.org/ticket/87734
// TODO: Adicionar triggers onde necessário
// TODO: Organizar as ordens das conquistas

// =========================================
//                   Misc              
// =========================================

achievement(
    title = "Bipolar Disorder", points = 1,
    description = "Select a secret character in MVS mode",
    id = 122053, badge = "135188", published = "18/08/2020 03:01:10", modified = "25/09/2020 22:02:13",
    trigger = p1_and_p2_start_button() == 1 && 
              p1_buttons_bit5() == 1 && 
              p1_buttons_bit6() == 1 &&
              mvs_mode() == 0x80 && 
              game_screen() == 42338 && 
              p1_active_state() == 1 &&
              p2_active_state() != 1 &&
              p1_character_selected_in_char_select() == 151 && 
              no_unibios() &&
              ((p1_character() == 2 && p1_shadow_secret_character() == 2) ||
               (p1_character() == 16 && p1_shadow_secret_character() == 8) ||
               (p1_character() == 18 && p1_shadow_secret_character() == 16) ||
               (p1_character() == 9 && p1_shadow_secret_character() == 4))
)

achievement(
    title = "The Return of the Nightmare", points = 5,
    description = "Unlock Nightmare Geese in AES mode",
    id = 122056, badge = "135273", published = "18/08/2020 03:01:46", modified = "29/08/2020 22:40:37",
    trigger = p1_shadow_secret_character() == 31 && 
              mvs_mode() != 128 && 
              no_unibios()
)

achievement(
    title = "You Can’t Touch Me!", points = 5,
    description = "Win a match without taking damage against the CPU on Level-3 difficulty",
    id = 123739, badge = "135957", published = "01/09/2020 02:50:23", modified = "01/09/2020 21:46:25",
    trigger = settings_difficulty() >= 2 && 
              game_mode() == MODE_ARCADE_MODE_P1 && 
              p1_rounds_won() == 2 &&
              prev(p1_rounds_won()) == 1 && 
              once(p1_health() == 192 && round_count() == 1) &&
              never(p1_health() != 192) && 
              no_unibios()
)

achievement(
    title = "The Best Defense Is a Good Offense", points = 2,
    description = "Counter attack your opponent with a Break Shot",
    id = 123223, badge = "135304", published = "26/08/2020 23:10:30", modified = "29/08/2020 22:40:24",
    trigger = game_mode() == MODE_ARCADE_MODE_P1 && 
              p1_break_shot_flag() == 1 && 
              no_unibios()
)

achievement(
    title = "The King of Taunts", points = 3,
    description = "Throw the CPU opponent out of the ring and taunt him while he is away",
    id = 122057, badge = "135276", published = "18/08/2020 03:01:52", modified = "29/08/2020 22:40:40",
    trigger = game_mode() == MODE_ARCADE_MODE_P1 && 
              once(p2_ring_out() == 149) && 
              once(p1_taunt() == 1 && prev(p1_taunt()) == 0) &&
              never(p1_hit_combo() == 1) && 
              never(p2_ring_out() == 255) && 
              no_unibios()
)

// DONE: FUNCIONA
achievement(
    title = "Victory Is Just the Beginning...", points = 25,
    description = "Achieve an SSS Fighting Level Ranking against the CPU on Level-4 difficulty",
    id = 122100, badge = "133893", published = "18/08/2020 03:05:59", modified = "29/08/2020 22:40:05",
    trigger = game_mode() == MODE_ARCADE_MODE_P1 && 
              settings_difficulty() >= 3 && 
              p2_health() == 0xFF &&
              (
                (p1_fighting_level_2nd_round() == 0 && prev(p1_fighting_level_2nd_round()) == 0xFF) ||
                (p1_fighting_level_1st_round() == 0 && prev(p1_fighting_level_1st_round()) == 0xFF)
              ) &&
              no_unibios()
)

achievement(
    title = "Get Outta Here! Go Burn!", points = 5,
    description = "Perform a 10-hit combo against the CPU",
    id = 123735, badge = "135952", published = "01/09/2020 02:50:01", modified = "01/09/2020 02:50:01",
    trigger = game_mode() == MODE_ARCADE_MODE_P1 && 
              p1_hit_combo() >= 16 && 
              settings_difficulty() >= 3 &&
              no_unibios()
)

achievement(
    title = "You’re Unlucky to Have to Fight Me", points = 10,
    description = "Perform a 15-hit combo against the CPU",
    id = 123736, badge = "136437", published = "01/09/2020 02:50:07", modified = "04/04/2021 23:09:16",
    trigger = game_mode() == MODE_ARCADE_MODE_P1 && 
              p1_hit_combo() >= 21 && 
              settings_difficulty() >= 3 &&
              no_unibios()
)

achievement(
    title = "The Fall of the Earl of Stroheim", points = 5, type="progression",
    description = "Defeat Wolfgang Krauser on Level-4 difficulty",
    id = 122054, badge = "135187", published = "18/08/2020 03:01:24", modified = "22/07/2024 20:05:28",
    trigger = game_mode() == MODE_ARCADE_MODE_P1 && 
              game_arcade_match() == 9 && 
              settings_difficulty() >= 3 && 
              p1_rounds_won() == 2 &&
              prev(p1_rounds_won()) == 1 && 
              no_unibios()
)

achievement(
    title = "The Castle Is a Witness", points = 5,
    description = "Defeat Wolfgang Krauser with a Super Move against the CPU on Level-4 difficulty",
    id = 122055, badge = "135303", published = "18/08/2020 03:01:41", modified = "02/09/2020 21:38:11",
    trigger = settings_difficulty() >= 3 && 
              game_arcade_match() == 9 && 
              game_mode() == MODE_ARCADE_MODE_P1 && 
              (
                (p1_character() != 0x0e && 
                 p1_finished_with_dm()
                ) ||
                (p1_character() == 0x0e && 
                 p1_finished_with_dm_duck_king())
              ) &&
              no_unibios()
)

achievement(
    title = "Don’t Poke the Bear", points = 10,
    description = "Taunt Krauser 5 times in a round without taking damage on Level-4 difficulty",
    id = 122098, badge = "135183", published = "18/08/2020 03:05:47", modified = "04/04/2021 23:09:12",
    trigger = game_arcade_match() == 9 && 
              settings_difficulty() >= 3 && 
              game_mode() == MODE_ARCADE_MODE_P1 &&
              measured(repeated(5, p1_taunt() == 1 && prev(p1_taunt()) == 0)) && 
              never(p1_health() != 192) &&
              no_unibios()
)


// =========================================
//                    1CC              
// =========================================

achievement(
    title = "The Battle of the Wolf", points = 10,
    description = "Finish the game by defeating Krauser using only Terry Bogard without using a continue on Level-4 difficulty",
    id = 122058, badge = "135277", published = "18/08/2020 03:02:05", modified = "31/08/2020 19:44:38",
    trigger = settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              p1_character() == 1 && 
              never(p1_character() != 1 && p1_won_a_round()) &&
              trigger_when(arcade_krauser_defeated()) &&
              never(p1_active_state() == 2) && 
              never(game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) && 
              no_unibios()
)

achievement(
    title = "The Human Weapon", points = 10,
    description = "Finish the game by defeating Krauser using only Andy Bogard without using a continue on Level-4 difficulty",
    id = 122059, badge = "135278", published = "18/08/2020 03:02:12", modified = "31/08/2020 19:44:35",
    trigger = settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              p1_character() == 2 && 
              never(p1_character() != 2 && p1_won_a_round()) &&
              trigger_when(arcade_krauser_defeated()) &&
              never(p1_active_state() == 2) && 
              never(game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) && 
              no_unibios()
)

achievement(
    title = "The Fury of Muay Thai", points = 10,
    description = "Finish the game by defeating Krauser using only Joe Higashi without using a continue on Level-4 difficulty",
    id = 122060, badge = "135279", published = "18/08/2020 03:02:17", modified = "31/08/2020 19:44:31",
    trigger = settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              p1_character() == 3 && 
              never(p1_character() != 3 && p1_won_a_round()) &&
              trigger_when(arcade_krauser_defeated()) &&
              never(p1_active_state() == 2) && 
              never(game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) && 
              no_unibios()
)

achievement(
    title = "The Secret of Ninjutsu", points = 10,
    description = "Finish the game by defeating Krauser using only Mai Shiranui without using a continue on Level-4 difficulty",
    id = 122061, badge = "135280", published = "18/08/2020 03:02:24", modified = "31/08/2020 19:44:25",
    trigger = settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              p1_character() == 4 && 
              never(p1_character() != 4 && p1_won_a_round()) &&
              trigger_when(arcade_krauser_defeated()) &&
              never(p1_active_state() == 2) && 
              never(game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) && 
              no_unibios()
)

achievement(
    title = "Disco Duck", points = 10,
    description = "Finish the game by defeating Krauser using only Duck King without using a continue on Level-4 difficulty",
    id = 122062, badge = "135281", published = "18/08/2020 03:02:28", modified = "31/08/2020 19:44:22",
    trigger = settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              p1_character() == 14 &&
              never(p1_character() != 14 && p1_won_a_round()) &&
              trigger_when(arcade_krauser_defeated()) &&
              never(p1_active_state() == 2) &&
              never(game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) && 
              no_unibios()
)

achievement(
    title = "Wisdom and Strength", points = 10,
    description = "Finish the game by defeating Krauser using only Tung Fu Rue without using a continue on Level-4 difficulty",
    id = 122063, badge = "135282", published = "18/08/2020 03:02:33", modified = "31/08/2020 19:44:17",
    trigger = settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              p1_character() == 18 &&
              never(p1_character() != 18 && p1_won_a_round()) &&
              trigger_when(arcade_krauser_defeated()) &&
              never(p1_active_state() == 2) &&
              never(game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) && 
              no_unibios()
)

achievement(
    title = "Brazilian Storm", points = 10,
    description = "Finish the game by defeating Krauser using only Bob Wilson without using a continue on Level-4 difficulty",
    id = 122064, badge = "135283", published = "18/08/2020 03:02:40", modified = "31/08/2020 19:44:14",
    trigger = settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              p1_character() == 7 &&
              never(p1_character() != 7 && p1_won_a_round()) &&
              trigger_when(arcade_krauser_defeated()) &&
              never(p1_active_state() == 2) &&
              never(game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) && 
              no_unibios()
)

achievement(
    title = "The Exorcist", points = 10,
    description = "Finish the game by defeating Krauser using only Sokaku without using a continue on Level-4 difficulty",
    id = 122065, badge = "135284", published = "18/08/2020 03:02:46", modified = "31/08/2020 19:44:10",
    trigger = settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              p1_character() == 6 &&
              never(p1_character() != 6 && p1_won_a_round()) &&
              trigger_when(arcade_krauser_defeated()) &&
              never(p1_active_state() == 2) &&
              never(game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) && 
              no_unibios()
)

achievement(
    title = "Jin Brothers Vol. 1", points = 10,
    description = "Finish the game by defeating Krasuser using only Jin Chonrei without using a continue on Level-4 difficulty",
    id = 122066, badge = "135270", published = "18/08/2020 03:02:52", modified = "31/08/2020 19:44:40",
    trigger = settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              p1_character() == 13 &&
              never(p1_character() != 13 && p1_won_a_round()) &&
              trigger_when(arcade_krauser_defeated()) &&
              never(p1_active_state() == 2) &&
              never(game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) && 
              no_unibios()
)

achievement(
    title = "Jin Brothers Vol. 2", points = 10,
    description = "Finish the game by defeating Krauser using only Jin Chonshu without using a continue on Level-4 difficulty",
    id = 122067, badge = "135286", published = "18/08/2020 03:02:57", modified = "31/08/2020 19:44:04",
    trigger = settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              p1_character() == 12 &&
              never(p1_character() != 12 && p1_won_a_round()) &&
              trigger_when(arcade_krauser_defeated()) &&
              never(p1_active_state() == 2) &&
              never(game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) && 
              no_unibios()
)

achievement(
    title = "The Nunchaku of Justice", points = 10,
    description = "Finish the game by defeating Krauser using only Hon-Fu without using a continue on Level-4 difficulty",
    id = 122068, badge = "135287", published = "18/08/2020 03:03:03", modified = "31/08/2020 19:44:00",
    trigger = settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              p1_character() == 8 &&
              never(p1_character() != 8 && p1_won_a_round()) &&
              trigger_when(arcade_krauser_defeated()) &&
              never(p1_active_state() == 2) &&
              never(game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) && 
              no_unibios()
)

achievement(
    title = "Cheaters Never Prosper", points = 10,
    description = "Finish the game by defeating Krauser using only Yamazaki without using a continue on Level-4 difficulty",
    id = 122069, badge = "135289", published = "18/08/2020 03:03:08", modified = "31/08/2020 19:43:53",
    trigger = settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              p1_character() == 11 &&
              never(p1_character() != 11 && p1_won_a_round()) &&
              trigger_when(arcade_krauser_defeated()) &&
              never(p1_active_state() == 2) &&
              never(game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) && 
              no_unibios()
)

achievement(
    title = "And I’m the Weaker Sex?", points = 10,
    description = "Finish the game by defeating Krauser using only Blue Mary without using a continue on Level-4 difficulty",
    id = 122070, badge = "135290", published = "18/08/2020 03:03:14", modified = "31/08/2020 19:43:49",
    trigger = settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              p1_character() == 9 &&
              never(p1_character() != 9 && p1_won_a_round()) &&
              trigger_when(arcade_krauser_defeated()) &&
              game_arcade_match() == 9 &&
              never(p1_active_state() == 2) &&
              never(game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) && 
              no_unibios()
)

achievement(
    title = "Armageddon Buster!", points = 10,
    description = "Finish the game by defeating Krauser using only Franco Bash without using a continue on Level-4 difficulty",
    id = 122071, badge = "135299", published = "18/08/2020 03:03:20", modified = "31/08/2020 19:43:46",
    trigger = settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              p1_character() == 10 &&
              never(p1_character() != 10 && p1_won_a_round()) &&
              trigger_when(arcade_krauser_defeated()) &&
              never(p1_active_state() == 2) &&
              never(game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) && 
              no_unibios()
)

achievement(
    title = "Aku Wa Yurusan!", points = 10,
    description = "Finish the game by defeating Krauser using only Kim without using a continue on Level-4 difficulty",
    id = 122072, badge = "135292", published = "18/08/2020 03:03:25", modified = "31/08/2020 19:43:43",
    trigger = settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              p1_character() == 15 &&
              never(p1_character() != 15 && p1_won_a_round()) &&
              trigger_when(arcade_krauser_defeated()) &&
              never(p1_active_state() == 2) &&
              never(game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) && 
              no_unibios()
)

achievement(
    title = "I Can't Go On! Food! Food!", points = 10,
    description = "Finish the game by defeating Krauser using only Cheng Sinzan without using a continue on Level-4 difficulty",
    id = 122073, badge = "135293", published = "18/08/2020 03:03:30", modified = "31/08/2020 19:43:40",
    trigger = settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              p1_character() == 17 &&
              never(p1_character() != 17 && p1_won_a_round()) &&
              trigger_when(arcade_krauser_defeated()) &&
              never(p1_active_state() == 2) &&
              never(game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) && 
              no_unibios()
)

achievement(
    title = "Hey, Hey, HEY!", points = 10,
    description = "Finish the game by defeating Krauser using only Billy Kane without using a continue on Level-4 difficulty",
    id = 122074, badge = "135294", published = "18/08/2020 03:03:36", modified = "31/08/2020 19:43:37",
    trigger = settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              p1_character() == 16 &&
              never(p1_character() != 16 && p1_won_a_round()) &&
              trigger_when(arcade_krauser_defeated()) &&
              never(p1_active_state() == 2) &&
              never(game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) && 
              no_unibios()
)

achievement(
    title = "Slicing a Fellow Matador Is Fun!", points = 10,
    description = "Finish the game by defeating Krauser using only Laurence without using a continue on Level-4 difficulty",
    id = 122075, badge = "135300", published = "18/08/2020 03:03:42", modified = "31/08/2020 19:43:33",
    trigger = settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              p1_character() == 19 &&
              never(p1_character() != 19 && p1_won_a_round()) &&
              trigger_when(arcade_krauser_defeated()) &&
              never(p1_active_state() == 2) &&
              never(game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) && 
              no_unibios()
)

achievement(
    title = "Ha Ha Ha! I’ll Chisel Your Gravestone. Sleep Well.", points = 10,
    description = "Finish the game by defeating Krauser using only Krauser without using a continue on Level-4 difficulty",
    id = 122076, badge = "135296", published = "18/08/2020 03:03:49", modified = "31/08/2020 19:43:30",
    trigger = settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              p1_character() == 20 &&
              never(p1_character() != 20 && p1_won_a_round()) &&
              trigger_when(arcade_krauser_defeated()) &&
              never(p1_active_state() == 2) &&
              never(game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) && 
              no_unibios()
)

achievement(
    title = "Come On, Yellow Belly!", points = 10,
    description = "Finish the game by defeating Krauser using only Geese without using a continue on Level-4 difficulty",
    id = 122077, badge = "135297", published = "18/08/2020 03:03:54", modified = "31/08/2020 19:43:24",
    trigger = settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              p1_character() == 5 &&
              never(p1_character() != 5 && p1_won_a_round()) &&
              trigger_when(arcade_krauser_defeated()) &&
              never(p1_active_state() == 2) &&
              never(game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) && 
              no_unibios()
)


// =========================================
//                Super Move              
// =========================================

achievement(
    title = "Overheat...GEYSER!", points = 5,
    description = "Defeat your opponent with a Super Move as Terry Bogard against the CPU on Level-4 difficulty",
    id = 122078, badge = "135173", published = "18/08/2020 03:04:00", modified = "29/08/2020 22:39:26",
    trigger = p1_character() == 1 &&
              settings_difficulty() >= 3 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_finished_with_dm() &&
              no_unibios()
)

achievement(
    title = "Wow! I Throb with Serious Power!", points = 5,
    description = "Defeat your opponent with a Super Move as Andy Bogard against the CPU on Level-4 difficulty",
    id = 122079, badge = "135298", published = "18/08/2020 03:04:05", modified = "02/09/2020 21:38:05",
    trigger = p1_character() == 2 &&
              settings_difficulty() >= 3 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_finished_with_dm() &&
              no_unibios()
)

achievement(
    title = "ORAORAORA! ASSHAORA!", points = 5,
    description = "Defeat your opponent with a Super Move as Joe Higashi against the CPU on Level-4 difficulty",
    id = 122080, badge = "135163", published = "18/08/2020 03:04:10", modified = "29/08/2020 22:37:52",
    trigger = p1_character() == 3 &&
              settings_difficulty() >= 3 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_finished_with_dm() &&
              no_unibios()
)

achievement(
    title = "Babe?! You’re About to Sing Soprano, Pal.", points = 5,
    description = "Defeat your opponent with a Super Move as Mai Shiranui against the CPU on Level-4 difficulty",
    id = 122081, badge = "135164", published = "18/08/2020 03:04:14", modified = "29/08/2020 22:37:57",
    trigger = p1_character() == 4 &&
              settings_difficulty() >= 3 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_finished_with_dm() &&
              no_unibios()
)

achievement(
    title = "I’m Nonstop! Whooo Baby!", points = 5,
    description = "Defeat your opponent with a Super Move as Duck King against the CPU on Level-4 difficulty",
    id = 122082, badge = "135165", published = "18/08/2020 03:04:19", modified = "29/08/2020 22:38:01",
    trigger = p1_character() == 14 &&
              settings_difficulty() >= 3 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_finished_with_dm_duck_king() &&
              no_unibios()
)

achievement(
    title = "I Feel like New!", points = 5,
    description = "Defeat your opponent with a Super Move as Tung Fu Rue against the CPU on Level-4 difficulty",
    id = 122083, badge = "135166", published = "18/08/2020 03:04:26", modified = "02/09/2020 21:38:35",
    trigger = p1_character() == 18 &&
              settings_difficulty() >= 3 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_finished_with_dm() &&
              no_unibios()
)

achievement(
    title = "Yeah! I’m the Star Now!", points = 5,
    description = "Defeat your opponent with a Super Move as Bob Wilson against the CPU on Level-4 difficulty",
    id = 122084, badge = "135162", published = "18/08/2020 03:04:31", modified = "29/08/2020 22:38:16",
    trigger = p1_character() == 7 &&
              settings_difficulty() >= 3 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_finished_with_dm() &&
              no_unibios()
)

achievement(
    title = "Quiet! You Stand Before a God!", points = 5,
    description = "Defeat your opponent with a Super Move as Sokaku Mochizuki against the CPU on Level-4 difficulty",
    id = 122085, badge = "135167", published = "18/08/2020 03:04:36", modified = "29/08/2020 22:38:37",
    trigger = p1_character() == 6 &&
              settings_difficulty() >= 3 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_finished_with_dm() &&
              no_unibios()
)

achievement(
    title = "My Imperial Bop Is Unbeatable!", points = 5,
    description = "Defeat your opponent with a Super Move as Jin Chonrei against the CPU on Level-4 difficulty",
    id = 122086, badge = "135168", published = "18/08/2020 03:04:42", modified = "29/08/2020 22:38:44",
    trigger = p1_character() == 13 &&
              settings_difficulty() >= 3 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_finished_with_dm() &&
              no_unibios()
)

achievement(
    title = "Chill, Defeat Is Your Destiny!", points = 5,
    description = "Defeat your opponent with a Super Move as Jin Chonshu against the CPU on Level-4 difficulty",
    id = 122087, badge = "135169", published = "18/08/2020 03:04:48", modified = "29/08/2020 22:38:50",
    trigger = p1_character() == 12 &&
              settings_difficulty() >= 3 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_finished_with_dm() &&
              no_unibios()
)

achievement(
    title = "Kimatta!!", points = 5,
    description = "Defeat your opponent with a Super Move as Hon-Fu against the CPU on Level-4 difficulty",
    id = 122088, badge = "135170", published = "18/08/2020 03:04:53", modified = "29/08/2020 22:38:56",
    trigger = p1_character() == 8 &&
              settings_difficulty() >= 3 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_finished_with_dm() &&
              no_unibios()
)

achievement(
    title = "Sharakuse, Kono Amachua GA!", points = 5,
    description = "Defeat your opponent with a Super Move as Ryuji Yamazaki against the CPU on Level-4 difficulty",
    id = 122089, badge = "135171", published = "18/08/2020 03:04:59", modified = "29/08/2020 22:39:10",
    trigger = p1_character() == 11 &&
              settings_difficulty() >= 3 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_finished_with_dm() &&
              no_unibios()
)

achievement(
    title = "Hey, Hey, Hey! Finish!", points = 5,
    description = "Defeat your opponent with a Super Move as Blue Mary against the CPU on Level-4 difficulty",
    id = 122090, badge = "135172", published = "18/08/2020 03:05:04", modified = "01/09/2020 19:19:30",
    trigger = p1_character() == 9 &&
              settings_difficulty() >= 3 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_finished_with_dm() &&
              no_unibios()
)

achievement(
    title = "Whaaaa! Junior!", points = 5,
    description = "Defeat your opponent with a Super Move as Franco Bash against the CPU on Level-4 difficulty",
    id = 122091, badge = "135161", published = "18/08/2020 03:05:09", modified = "29/08/2020 22:37:40",
    trigger = p1_character() == 10 &&
              settings_difficulty() >= 3 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_finished_with_dm() &&
              no_unibios()
)

achievement(
    title = "Hoh, Hoh! Keeyah! Cha, Cha!", points = 5,
    description = "Defeat your opponent with a Super Move as Kim Kaphwan against the CPU on Level-4 difficulty",
    id = 122092, badge = "135175", published = "18/08/2020 03:05:14", modified = "29/08/2020 22:39:37",
    trigger = p1_character() == 15 &&
              settings_difficulty() >= 3 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_finished_with_dm() &&
              no_unibios()
)

achievement(
    title = "Strong. Rich. I Am the Man!", points = 5,
    description = "Defeat your opponent with a Super Move as Cheng Sinzan against the CPU on Level-4 difficulty",
    id = 122093, badge = "135180", published = "18/08/2020 03:05:19", modified = "29/08/2020 22:39:41",
    trigger = p1_character() == 17 &&
              settings_difficulty() >= 3 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_finished_with_dm() &&
              no_unibios()
)

achievement(
    title = "Burn, Baby, and Burn Some More!", points = 5,
    description = "Defeat your opponent with a Super Move as Billy Kane against the CPU on Level-4 difficulty",
    id = 122094, badge = "135179", published = "18/08/2020 03:05:24", modified = "02/09/2020 21:38:29",
    trigger = p1_character() == 16 &&
              settings_difficulty() >= 3 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_finished_with_dm() &&
              no_unibios()
)

achievement(
    title = "Ha! Amigo!", points = 5,
    description = "Defeat your opponent with a Super Move as Laurence Blood against the CPU on Level-4 difficulty",
    id = 122095, badge = "135178", published = "18/08/2020 03:05:30", modified = "29/08/2020 22:39:47",
    trigger = p1_character() == 19 &&
              settings_difficulty() >= 3 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_finished_with_dm() &&
              no_unibios()
)

achievement(
    title = "Out of My Way, Pitiful Bug!", points = 5,
    description = "Defeat your opponent with a Super Move as Wolfgang Krauser against the CPU on Level-4 difficulty",
    id = 122096, badge = "135181", published = "18/08/2020 03:05:35", modified = "02/09/2020 21:38:22",
    trigger = p1_character() == 20 &&
              settings_difficulty() >= 3 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_finished_with_dm() &&
              no_unibios()
)

achievement(
    title = "RAGING STORM!", points = 5,
    description = "Defeat your opponent with a Super Move as Nightmare Geese against the CPU on Level-4 difficulty",
    id = 122097, badge = "135182", published = "18/08/2020 03:05:40", modified = "02/09/2020 21:38:16",
    trigger = p1_character() == 5 &&
              settings_difficulty() >= 3 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_finished_with_dm() &&
              no_unibios()
)


// =========================================
//                Challenges              
// =========================================

// TODO: Revisar essa conquista
achievement(
    title = "Have a Beautiful Dream", points = 10,
    description = "Win a round against Krauser with a Perfect on Level-3 difficulty",
    id = 122099, badge = "135269", published = "18/08/2020 03:05:54", modified = "29/08/2020 22:40:02",
    trigger = settings_difficulty() >= 2 &&
              game_arcade_match() == 9 &&
              game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_health() == 192 &&
              trigger_when(p1_won_a_round()) &&
              no_unibios()
)

// DONE: Arrumado https://retroachievements.org/ticket/87733
achievement(
    title = "The Untouchables", points = 50,
    description = "Finish the game by defeating Geese without losing any round on Level-4 difficulty",
    id = 122101, badge = "135185", published = "18/08/2020 03:06:04", modified = "29/08/2020 22:40:16",
    trigger = game_mode() == MODE_ARCADE_MODE_P1 &&
              settings_difficulty() >= 3 &&
              once(arcade_mode_has_started()) && 
              trigger_when(game_arcade_match() == 10 && p1_won_a_match()) &&
              never(p2_rounds_won() == 1) &&
              no_unibios()
)

// DONE: Arrumado https://retroachievements.org/ticket/82197
achievement(
    title = "Is It Just That or Is There More?", points = 10,
    description = "Get 500,000 points or more on Level-4 difficulty",
    id = 123738, badge = "135954", published = "01/09/2020 02:50:17", modified = "01/09/2020 22:22:18",
    trigger = game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_score_00xx0000() >= 80 &&
              settings_difficulty() >= 3 &&
              (start_game_protection() != 21845 ||
               start_game_protection() != 43690 ||
               start_game_protection() != 65104) &&
              no_unibios()
)

achievement(
    title = "The Sky Is the Limit!", points = 50,
    description = "Get 1,000,000 points or more on Level-8 difficulty",
    id = 122102, badge = "135186", published = "18/08/2020 03:06:10", modified = "29/08/2020 22:40:20",
    trigger = game_mode() == MODE_ARCADE_MODE_P1 &&
              p1_score_xx000000() >= 1 &&
              settings_difficulty() == 7 &&
              (start_game_protection() != 21845 ||
               start_game_protection() != 43690 ||
               start_game_protection() != 65104) &&
              no_unibios()
)




// achievement(
//     title = "Terry Finish", points = 5, type="progression",
//     description = "Beat the game having only used Terry in a run.  Continues OK.",
//     id = 449922, badge = "470185", published = "21/07/2024 19:21:31", modified = "21/07/2024 19:21:31",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 1 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 1)
// )

// achievement(
//     title = "Andy Finish", points = 5, type="progression",
//     description = "Beat the game having only used Andy in a run.  Continues OK.",
//     id = 449923, badge = "470186", published = "21/07/2024 19:21:31", modified = "21/07/2024 19:21:31",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 2 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 2)
// )

// achievement(
//     title = "Joe Finish", points = 5, type="progression",
//     description = "Beat the game having only used Joe in a run.  Continues OK.",
//     id = 449924, badge = "470187", published = "21/07/2024 19:21:31", modified = "21/07/2024 19:21:31",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 3 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 3)
// )

// achievement(
//     title = "Mai Finish", points = 5, type="progression",
//     description = "Beat the game having only used Mai in a run.  Continues OK.",
//     id = 449925, badge = "470188", published = "21/07/2024 19:21:32", modified = "21/07/2024 19:21:32",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 4 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 4)
// )

// achievement(
//     title = "Duck Finish", points = 5, type="progression",
//     description = "Beat the game having only used Duck in a run.  Continues OK.",
//     id = 449926, badge = "470189", published = "21/07/2024 19:21:32", modified = "21/07/2024 19:21:32",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 14 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 14)
// )

// achievement(
//     title = "Tung Finish", points = 5, type="progression",
//     description = "Beat the game having only used Tung in a run.  Continues OK.",
//     id = 449927, badge = "470190", published = "21/07/2024 19:21:32", modified = "21/07/2024 19:21:32",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 18 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 18)
// )

// achievement(
//     title = "Bob Finish", points = 5, type="progression",
//     description = "Beat the game having only used Bob in a run.  Continues OK.",
//     id = 449928, badge = "470191", published = "21/07/2024 19:21:33", modified = "21/07/2024 19:21:33",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 7 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 7)
// )

// achievement(
//     title = "Sokaku Finish", points = 5, type="progression",
//     description = "Beat the game having only used Sokaku in a run.  Continues OK.",
//     id = 449929, badge = "470192", published = "21/07/2024 19:21:33", modified = "21/07/2024 19:21:33",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 6 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 6)
// )

// achievement(
//     title = "Chonrei Finish", points = 5, type="progression",
//     description = "Beat the game having only used Chonrei in a run.  Continues OK.",
//     id = 449930, badge = "470193", published = "21/07/2024 19:21:33", modified = "21/07/2024 19:21:33",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 13 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 13)
// )

// achievement(
//     title = "Chonshu Finish", points = 5, type="progression",
//     description = "Beat the game having only used Chonshu in a run.  Continues OK.",
//     id = 449931, badge = "470194", published = "21/07/2024 19:21:34", modified = "21/07/2024 19:21:34",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 12 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 12)
// )

// achievement(
//     title = "Hon-Fu Finish", points = 5, type="progression",
//     description = "Beat the game having only used Hon-Fu in a run.  Continues OK.",
//     id = 449932, badge = "470195", published = "21/07/2024 19:21:34", modified = "21/07/2024 19:21:34",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 8 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 8)
// )

// achievement(
//     title = "Yamazaki Finish", points = 5, type="progression",
//     description = "Beat the game having only used Yamazaki in a run.  Continues OK.",
//     id = 449933, badge = "470196", published = "21/07/2024 19:21:34", modified = "21/07/2024 19:21:34",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 11 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 11)
// )

// achievement(
//     title = "Blue-Mary Finish", points = 5, type="progression",
//     description = "Beat the game having only used Blue Mary in a run.  Continues OK.",
//     id = 449934, badge = "470197", published = "21/07/2024 19:21:35", modified = "21/07/2024 19:21:35",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 9 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 9)
// )

// achievement(
//     title = "Franco Finish", points = 5, type="progression",
//     description = "Beat the game having only used Franco in a run.  Continues OK.",
//     id = 449935, badge = "470198", published = "21/07/2024 19:21:35", modified = "21/07/2024 19:21:35",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 10 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 10)
// )

// achievement(
//     title = "Kim Finish", points = 5, type="progression",
//     description = "Beat the game having only used Kim in a run.  Continues OK.",
//     id = 449936, badge = "470199", published = "21/07/2024 19:21:35", modified = "21/07/2024 19:21:35",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 15 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 15)
// )

// achievement(
//     title = "Cheng Finish", points = 5, type="progression",
//     description = "Beat the game having only used Cheng in a run.  Continues OK.",
//     id = 449937, badge = "470200", published = "21/07/2024 19:21:36", modified = "21/07/2024 19:21:36",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 17 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 17)
// )

// achievement(
//     title = "Billy Finish", points = 5, type="progression",
//     description = "Beat the game having only used Billy in a run.  Continues OK.",
//     id = 449938, badge = "470201", published = "21/07/2024 19:21:36", modified = "21/07/2024 19:21:36",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 16 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 16)
// )

// achievement(
//     title = "Laurence Finish", points = 5, type="progression",
//     description = "Beat the game having only used Laurence in a run.  Continues OK.",
//     id = 449939, badge = "470202", published = "21/07/2024 19:21:36", modified = "21/07/2024 19:21:36",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 19 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 19)
// )

// achievement(
//     title = "Krauser Finish", points = 5, type="progression",
//     description = "Beat the game having only used Krauser in a run.  Continues OK.",
//     id = 449940, badge = "470203", published = "21/07/2024 19:21:37", modified = "21/07/2024 19:21:37",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 20 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 20)
// )

// achievement(
//     title = "Geese Finish", points = 5,
//     description = "Beat the game having only used Geese in a run.  Continues OK.",
//     id = 449941, badge = "470204", published = "21/07/2024 19:21:37", modified = "21/07/2024 19:21:37",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 5 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 5)
// )

// achievement(
//     title = "Why so much BRUTALITY?", points = 50,
//     description = "Perform a combo of 30 or more Hits",
//     id = 123737, badge = "135949", published = "01/09/2020 02:50:12", modified = "03/09/2020 23:57:06",
//     trigger = p1_hit_combo() >= 48 && game_mode() == MODE_ARCADE_MODE_P1 && settings_difficulty() >= 3 &&
//               no_unibios()
// )

// achievement(
//     title = "[do not promote - incomplete unlock transfer] Terry Finish", points = 5, type="progression",
//     description = "Beat the game having only used Terry in a run.  Continues OK.",
//     id = 416006, badge = "470185", published = "06/04/2024 08:41:37", modified = "21/07/2024 19:20:20",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 1 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 1)
// )

// achievement(
//     title = "[do not promote - incomplete unlock transfer] Andy Finish", points = 5, type="progression",
//     description = "Beat the game having only used Andy in a run.  Continues OK.",
//     id = 416007, badge = "470186", published = "06/04/2024 08:41:37", modified = "21/07/2024 19:20:20",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 2 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 2)
// )

// achievement(
//     title = "[do not promote - incomplete unlock transfer] Joe Finish", points = 5, type="progression",
//     description = "Beat the game having only used Joe in a run.  Continues OK.",
//     id = 416008, badge = "470187", published = "06/04/2024 08:41:37", modified = "21/07/2024 19:20:20",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 3 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 3)
// )

// achievement(
//     title = "[do not promote - incomplete unlock transfer] Mai Finish", points = 5, type="progression",
//     description = "Beat the game having only used Mai in a run.  Continues OK.",
//     id = 416009, badge = "470188", published = "06/04/2024 08:41:38", modified = "21/07/2024 19:20:21",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 4 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 4)
// )

// achievement(
//     title = "[do not promote - incomplete unlock transfer] Duck Finish", points = 5, type="progression",
//     description = "Beat the game having only used Duck in a run.  Continues OK.",
//     id = 416010, badge = "470189", published = "06/04/2024 08:41:38", modified = "21/07/2024 19:20:21",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 14 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 14)
// )

// achievement(
//     title = "[do not promote - incomplete unlock transfer] Tung Finish", points = 5, type="progression",
//     description = "Beat the game having only used Tung in a run.  Continues OK.",
//     id = 416011, badge = "470190", published = "06/04/2024 08:41:39", modified = "21/07/2024 19:20:21",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 18 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 18)
// )

// achievement(
//     title = "[do not promote - incomplete unlock transfer] Bob Finish", points = 5, type="progression",
//     description = "Beat the game having only used Bob in a run.  Continues OK.",
//     id = 416012, badge = "470191", published = "06/04/2024 08:41:39", modified = "21/07/2024 19:20:22",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 7 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 7)
// )

// achievement(
//     title = "[do not promote - incomplete unlock transfer] Sokaku Finish", points = 5, type="progression",
//     description = "Beat the game having only used Sokaku in a run.  Continues OK.",
//     id = 416013, badge = "470192", published = "06/04/2024 08:41:39", modified = "21/07/2024 19:20:22",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 6 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 6)
// )

// achievement(
//     title = "[do not promote - incomplete unlock transfer] Chonrei Finish", points = 5, type="progression",
//     description = "Beat the game having only used Chonrei in a run.  Continues OK.",
//     id = 416014, badge = "470193", published = "06/04/2024 08:41:40", modified = "21/07/2024 19:20:22",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 13 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 13)
// )

// achievement(
//     title = "[do not promote - incomplete unlock transfer] Chonshu Finish", points = 5, type="progression",
//     description = "Beat the game having only used Chonshu in a run.  Continues OK.",
//     id = 416015, badge = "470194", published = "06/04/2024 08:41:40", modified = "21/07/2024 19:20:23",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 12 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 12)
// )

// achievement(
//     title = "[do not promote - incomplete unlock transfer] Hon-Fu Finish", points = 5, type="progression",
//     description = "Beat the game having only used Hon-Fu in a run.  Continues OK.",
//     id = 416016, badge = "470195", published = "06/04/2024 08:41:40", modified = "21/07/2024 19:20:23",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 8 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 8)
// )

// achievement(
//     title = "[do not promote - incomplete unlock transfer] Yamazaki Finish", points = 5, type="progression",
//     description = "Beat the game having only used Yamazaki in a run.  Continues OK.",
//     id = 416017, badge = "470196", published = "06/04/2024 08:41:41", modified = "21/07/2024 19:20:23",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 11 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 11)
// )

// achievement(
//     title = "[do not promote - incomplete unlock transfer] Blue-Mary Finish", points = 5, type="progression",
//     description = "Beat the game having only used Blue Mary in a run.  Continues OK.",
//     id = 416018, badge = "470197", published = "06/04/2024 08:41:41", modified = "21/07/2024 19:20:23",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 9 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 9)
// )

// achievement(
//     title = "[do not promote - incomplete unlock transfer] Franco Finish", points = 5, type="progression",
//     description = "Beat the game having only used Franco in a run.  Continues OK.",
//     id = 416019, badge = "470198", published = "06/04/2024 08:41:42", modified = "21/07/2024 19:20:24",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 10 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 10)
// )

// achievement(
//     title = "[do not promote - incomplete unlock transfer] Kim Finish", points = 5, type="progression",
//     description = "Beat the game having only used Kim in a run.  Continues OK.",
//     id = 416020, badge = "470199", published = "06/04/2024 08:41:42", modified = "21/07/2024 19:20:24",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 15 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 15)
// )

// achievement(
//     title = "[do not promote - incomplete unlock transfer] Cheng Finish", points = 5, type="progression",
//     description = "Beat the game having only used Cheng in a run.  Continues OK.",
//     id = 416021, badge = "470200", published = "06/04/2024 08:41:42", modified = "21/07/2024 19:20:24",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 17 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 17)
// )

// achievement(
//     title = "[do not promote - incomplete unlock transfer] Billy Finish", points = 5, type="progression",
//     description = "Beat the game having only used Billy in a run.  Continues OK.",
//     id = 416022, badge = "470201", published = "06/04/2024 08:41:43", modified = "21/07/2024 19:20:25",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 16 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 16)
// )

// achievement(
//     title = "[do not promote - incomplete unlock transfer] Laurence Finish", points = 5, type="progression",
//     description = "Beat the game having only used Laurence in a run.  Continues OK.",
//     id = 416023, badge = "470202", published = "06/04/2024 08:41:43", modified = "21/07/2024 19:20:25",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 19 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 19)
// )

// achievement(
//     title = "[do not promote - incomplete unlock transfer] Krauser Finish", points = 5, type="progression",
//     description = "Beat the game having only used Krauser in a run.  Continues OK.",
//     id = 416024, badge = "470203", published = "06/04/2024 08:41:43", modified = "21/07/2024 19:20:25",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 20 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 20)
// )

// achievement(
//     title = "[do not promote - incomplete unlock transfer] Geese Finish", points = 5,
//     description = "Beat the game having only used Geese in a run.  Continues OK.",
//     id = 416025, badge = "470204", published = "06/04/2024 08:41:44", modified = "21/07/2024 19:20:26",
//     trigger = settings_difficulty() >= 3 && once(game_arcade_match() == 1) && game_arcade_match() == 9 &&
//               p1_character() == 5 && p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1 &&
//               never(game_mode() != MODE_ARCADE_MODE_P1) && no_unibios() &&
//               never(((p1_rounds_won() - prev(p1_rounds_won())) == 1) && p1_character() != 5)
// )


// =========================================
//               Leaderboards              
// =========================================

leaderboard("RBS Highest Score (Level-4)", "Highest score during an Arcade run (1CC).",
           start = game_screen() == GS_CONGRATULATIONS && prev(game_screen()) != GS_CONGRATULATIONS && game_arcade_match() >= 0x09 && settings_difficulty() >= 3 && settings_difficulty() < 7 && p1_score_000000xx() == 0,
           cancel = always_false(),
           submit = always_true(),
           value = bcd(p1_score_xx000000()) * 1000000 + bcd(p1_score_00xx0000()) * 10000 + bcd(p1_score_0000xx00()) * 100 + bcd(p1_score_000000xx()),
           format = "VALUE", lower_is_better=false)

leaderboard("RBS Highest Score (Level-8)", "Highest score during an Arcade run (1CC).",
           start = game_screen() == GS_CONGRATULATIONS && prev(game_screen()) != GS_CONGRATULATIONS && game_arcade_match() >= 0x09 && settings_difficulty() == 7 && p1_score_000000xx() == 0,
           cancel = always_false(),
           submit = always_true(),
           value = bcd(p1_score_xx000000()) * 1000000 + bcd(p1_score_00xx0000()) * 10000 + bcd(p1_score_0000xx00()) * 100 + bcd(p1_score_000000xx()),
           format = "VALUE", lower_is_better=false)


leaderboard("RBS Best Time (Level-4)", "Fastest time to finish Arcade mode on default settings.",
           start =  game_arcade_match() == 0x01 && round_frame_time() > 0 && prev(round_frame_time()) == 0 && settings_difficulty() >= 3 && settings_difficulty() < 7 && settings_timer() == 0x60,
           cancel = (game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) ||
                    (p1_active_state() == 0 && p2_active_state() == 0),
           submit = game_screen() == GS_CONGRATULATIONS && prev(game_screen()) != GS_CONGRATULATIONS && game_arcade_match() >= 0x09,
           value = round_frame_time() > prev(round_frame_time()),
           format = "FRAMES", lower_is_better=true)

leaderboard("RBS Best Time (Level-8)", "Fastest time to finish Arcade mode on default settings.",
           start =  game_arcade_match() == 0x01 && round_frame_time() > 0 && prev(round_frame_time()) == 0 && settings_difficulty() == 7 && settings_timer() == 0x60,
           cancel = (game_mode() != MODE_ARCADE_MODE_P1 && game_mode() != MODE_CHARACTER_SELECT) ||
                    (p1_active_state() == 0 && p2_active_state() == 0),
           submit = game_screen() == GS_CONGRATULATIONS && prev(game_screen()) != GS_CONGRATULATIONS && game_arcade_match() >= 0x09,
           value = round_frame_time() > prev(round_frame_time()),
           format = "FRAMES", lower_is_better=true)