// Mortal Kombat Trilogy
// #ID = 10114

function cheat_1_round() => byte(0x0A4076)

function game_difficulty() => byte(0x25768E)
function game_state() => byte(0x169926)
         gs_booting_rom = 0x00
         gs_attract = 0x01
         gs_fighting = 0x02
         gs_kontinue_screen = 0x03
         gs_char_select = 0x04
         gs_round_end = 0x05
         gs_pre_fight_setup = 0x06
         gs_round_intro = 0x07
         gs_diagnostic_menu = 0x08
         gs_vs_screen = 0x09
         gs_game_over = 0x0b
         gs_post_char_select = 0x0d
         gs_rellim_ohcanep = 0x12

function ladder_tower() => byte(0x2576BC)
function ladder_match() => byte(0x2576b6)

function p1_state() => byte(0x16993a)
function p2_state() => byte(0x169bd2)
         ps_inactive = 0
         ps_fighting = 1
         ps_char_selecting = 3
         ps_char_selected = 4

function p1_only() => p1_state() > 0 && p2_state() == 0

function p1_char() => byte(0x16997E)
function p1_rounds_wins() => byte(0x1699BA)
function p1_active() => byte(0x169B80)

function p2_char() => byte(0x169C52)
function p2_rounds_won() => byte(0x169C88)
function p2_active() => byte(0x169B96)

function p1_consecutive_wins() => byte(0x2576C2)
function p2_consecutive_wins() => byte(0x2576C6)

achievement(
    title = "Novice Ladder", description = "Complete Novice Ladder on Normal difficulty (3 Rounds)", points = 5,
    id = 66977, badge = "70530", published = "19/10/2018 21:44:15", modified = "30/06/2020 13:32:12",
    trigger =   p1_only() && 
                once(ladder_match() == 0 && game_state() == gs_fighting) &&
                ladder_tower() == 0 && 
                never(cheat_1_round() != 0) && never(game_difficulty() < 2) &&
                trigger_when(p1_rounds_wins() == 2 && p2_char() == 31)
)

achievement(
    title = "Warrior Ladder", description = "Complete Warrior Ladder on Hard Difficulty (3 Rounds)", points = 10,
    id = 66978, badge = "70529", published = "19/10/2018 21:44:18", modified = "30/06/2020 13:32:11",
    trigger =   p1_only() && 
                once(ladder_match() == 0 && game_state() == gs_fighting) &&
                ladder_tower() == 1 && 
                never(cheat_1_round() != 0) && never(game_difficulty() < 3) &&
                trigger_when(p1_rounds_wins() == 2 && p2_char() == 31)
)

achievement(
    title = "Master Ladder", description = "Complete Master Ladder on Hard difficulty (3 Rounds)", points = 10,
    id = 66979, badge = "70532", published = "19/10/2018 21:44:20", modified = "07/10/2019 12:29:01",
    trigger =   p1_only() && 
                once(ladder_match() == 0 && game_state() == gs_fighting) &&
                ladder_tower() == 2 && 
                never(cheat_1_round() != 0) && never(game_difficulty() < 3) &&
                trigger_when(p1_rounds_wins() == 2 && p2_char() == 31)
)

achievement(
    title = "Champion Ladder", description = "Complete Champion Ladder on Very Hard difficulty (3 Rounds)", points = 25,
    id = 66980, badge = "70531", published = "19/10/2018 21:44:22", modified = "30/06/2020 13:32:10",
    trigger =   p1_only() && 
                once(ladder_match() == 0 && game_state() == gs_fighting) &&
                ladder_tower() == 3 && 
                never(cheat_1_round() != 0) && never(game_difficulty() < 4) &&
                trigger_when(p1_rounds_wins() == 2 && p2_char() == 31)
)

achievement(
    title = "One Eye Champ", description = "Beat the game using only Kano (3 Rounds | Medium difficulty)", points = 10,
    id = 66944, badge = "70472", published = "19/10/2018 21:42:22", modified = "30/06/2020 13:32:09",
    trigger = p1_char() == 0 &&
              never(game_state() == gs_fighting && p1_char() != 0) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "General Blade", description = "Beat the game using only Sonya (3 Rounds | Medium difficulty)", points = 10,
    id = 66945, badge = "70473", published = "19/10/2018 21:42:24", modified = "30/06/2020 13:32:08",
    trigger = p1_char() == 1 &&
              never(game_state() == gs_fighting && p1_char() != 1) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Major Jackson", description = "Beat the game using only Jax (3 Rounds | Medium difficulty)", points = 10,
    id = 66946, badge = "70474", published = "19/10/2018 21:42:27", modified = "30/06/2020 13:32:07",
    trigger = p1_char() == 2 &&
              never(game_state() == gs_fighting && p1_char() != 2) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Nightdog", description = "Beat the game using only Nightwolf (3 Rounds | Medium difficulty)", points = 10,
    id = 66947, badge = "70475", published = "19/10/2018 21:42:29", modified = "30/06/2020 13:32:05",
    trigger = p1_char() == 3 &&
              never(game_state() == gs_fighting && p1_char() != 3) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Johnny Bravo", description = "Beat the game using only Johnny Cage (3 Rounds | Medium difficulty)", points = 10,
    id = 66948, badge = "70476", published = "19/10/2018 21:42:30", modified = "30/06/2020 13:32:04",
    trigger = p1_char() == 4 &&
              never(game_state() == gs_fighting && p1_char() != 4) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Donuts Eater", description = "Beat the game using only Striker (3 Rounds | Medium difficulty)", points = 10,
    id = 66949, badge = "70477", published = "19/10/2018 21:42:32", modified = "30/06/2020 13:32:02",
    trigger = p1_char() == 5 &&
              never(game_state() == gs_fighting && p1_char() != 5) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Sinderella", description = "Beat the game using only Sindel (3 Rounds | Medium difficulty)", points = 10,
    id = 66950, badge = "70478", published = "19/10/2018 21:42:34", modified = "30/06/2020 13:32:01",
    trigger = p1_char() == 6 &&
              never(game_state() == gs_fighting && p1_char() != 6) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Ketchup", description = "Beat the game using only Sektor (3 Rounds | Medium difficulty)", points = 10,
    id = 66951, badge = "70479", published = "19/10/2018 21:42:35", modified = "30/06/2020 13:32:00",
    trigger = p1_char() == 7 &&
              never(game_state() == gs_fighting && p1_char() != 7) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Mustard", description = "Beat the game using only Cyrax (3 Rounds | Medium difficulty)", points = 10,
    id = 66952, badge = "70480", published = "19/10/2018 21:42:37", modified = "30/06/2020 13:31:59",
    trigger = p1_char() == 8 &&
              never(game_state() == gs_fighting && p1_char() != 8) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Mycorobotium Tuberculosis", description = "Beat the game using only Smoke (3 Rounds | Medium difficulty)", points = 10,
    id = 66953, badge = "70481", published = "19/10/2018 21:42:38", modified = "30/06/2020 13:31:57",
    trigger = p1_char() == 14 &&
              never(game_state() == gs_fighting && p1_char() != 14) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Kung Fu Lao", description = "Beat the game using only Kung Lao (3 Rounds | Medium difficulty)", points = 10,
    id = 66954, badge = "70482", published = "19/10/2018 21:42:41", modified = "30/06/2020 13:31:57",
    trigger = p1_char() == 9 &&
              never(game_state() == gs_fighting && p1_char() != 9) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Pretty Face", description = "Beat the game using only Kabal (3 Rounds | Medium difficulty)", points = 10,
    id = 66955, badge = "70483", published = "19/10/2018 21:42:43", modified = "30/06/2020 13:31:55",
    trigger = p1_char() == 10 &&
              never(game_state() == gs_fighting && p1_char() != 10) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Shegoro", description = "Beat the game using only Sheeva (3 Rounds | Medium difficulty)", points = 10,
    id = 66956, badge = "70484", published = "19/10/2018 21:42:44", modified = "30/06/2020 13:31:54",
    trigger = p1_char() == 11 &&
              never(game_state() == gs_fighting && p1_char() != 11) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Soul Sucker", description = "Beat the game using only Shang Tsung (3 Rounds | Medium difficulty)", points = 10,
    id = 66957, badge = "70485", published = "19/10/2018 21:42:46", modified = "30/06/2020 13:31:53",
    trigger = p1_char() == 12 &&
              never(game_state() == gs_fighting && p1_char() != 12) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Fei Long on Steroids", description = "Beat the game using only Liu Kang (3 Rounds | Medium difficulty)", points = 10,
    id = 66958, badge = "70486", published = "19/10/2018 21:42:48", modified = "30/06/2020 13:31:52",
    trigger = p1_char() == 13 &&
              never(game_state() == gs_fighting && p1_char() != 13) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Edenia Princess", description = "Beat the game using only Kitana (3 Rounds | Medium difficulty)", points = 10,
    id = 66959, badge = "70487", published = "19/10/2018 21:42:49", modified = "30/06/2020 13:31:51",
    trigger = p1_char() == 15 &&
              never(game_state() == gs_fighting && p1_char() != 15) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Poledancer", description = "Beat the game using only Jade (3 Rounds | Medium difficulty)", points = 10,
    id = 66960, badge = "70488", published = "19/10/2018 21:42:51", modified = "30/06/2020 13:31:50",
    trigger = p1_char() == 16 &&
              never(game_state() == gs_fighting && p1_char() != 16) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Maneater", description = "Beat the game using only Mileena (3 Rounds | Medium difficulty)", points = 10,
    id = 66961, badge = "70489", published = "19/10/2018 21:42:53", modified = "30/06/2020 13:31:49",
    trigger = p1_char() == 17 &&
              never(game_state() == gs_fighting && p1_char() != 17) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Get over...", description = "Beat the game using only Scorpion (3 Rounds | Medium difficulty)", points = 10,
    id = 66962, badge = "70490", published = "19/10/2018 21:42:55", modified = "30/06/2020 13:31:48",
    trigger = p1_char() == 18 &&
              never(game_state() == gs_fighting && p1_char() != 18) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Definitely not a Reptile", description = "Beat the game using only Reptile (3 Rounds | Medium difficulty)", points = 10,
    id = 66963, badge = "70491", published = "19/10/2018 21:42:57", modified = "30/06/2020 13:31:44",
    trigger = p1_char() == 19 &&
              never(game_state() == gs_fighting && p1_char() != 19) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Ermac OS", description = "Beat the game using only Ermac (3 Rounds | Medium difficulty)", points = 10,
    id = 66964, badge = "70492", published = "19/10/2018 21:42:59", modified = "30/06/2020 13:31:46",
    trigger = p1_char() == 20 &&
              never(game_state() == gs_fighting && p1_char() != 20) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Ninja Sub-Zero", description = "Beat the game using only Sub-Zero (3 Rounds | Medium difficulty)", points = 10,
    id = 66965, badge = "70493", published = "19/10/2018 21:43:01", modified = "30/06/2020 13:31:40",
    trigger = p1_char() == 21 &&
              never(game_state() == gs_fighting && p1_char() != 21) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "SMOKE ALLOWED", description = "Beat the game using only H. Smoke (3 Rounds | Medium difficulty)", points = 10,
    id = 66966, badge = "70504", published = "19/10/2018 21:43:09", modified = "30/06/2020 13:31:41",
    trigger = p1_char() == 22 &&
              never(game_state() == gs_fighting && p1_char() != 22) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(cheat_1_round() != 0) &&
              never(game_difficulty() < 2) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Loser", description = "Beat the game using only Noob Saibot (3 Rounds | Medium difficulty)", points = 10,
    id = 66967, badge = "70494", published = "19/10/2018 21:43:28", modified = "30/06/2020 13:31:38",
    trigger = p1_char() == 23 &&
              never(game_state() == gs_fighting && p1_char() != 23) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Thunder God", description = "Beat the game using only Raiden (3 Rounds | Medium difficulty)", points = 10,
    id = 66968, badge = "70495", published = "19/10/2018 21:43:30", modified = "30/06/2020 13:31:37",
    trigger = p1_char() == 24 &&
              never(game_state() == gs_fighting && p1_char() != 24) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Crazy Alien", description = "Beat the game using only Baraka (3 Rounds | Medium difficulty)", points = 10,
    id = 66969, badge = "70496", published = "19/10/2018 21:43:37", modified = "30/06/2020 13:31:36",
    trigger = p1_char() == 25 &&
              never(game_state() == gs_fighting && p1_char() != 25) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Rainy Ninja", description = "Beat the game using only Raiden (3 Rounds | Medium difficulty)", points = 10,
    id = 66970, badge = "70497", published = "19/10/2018 21:43:39", modified = "30/06/2020 13:31:35",
    trigger = p1_char() == 26 &&
              never(game_state() == gs_fighting && p1_char() != 26) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(game_difficulty() < 2) &&
              never(cheat_1_round() != 0) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Triple Sensuality", description = "Beat the game using only Khameleon (3 Rounds | Medium difficulty)", points = 10,
    id = 66971, badge = "70508", published = "19/10/2018 21:43:44", modified = "30/06/2020 13:31:34",
    trigger = p1_char() == 27 &&
              never(game_state() == gs_fighting && p1_char() != 27) &&
              p1_only() &&
              trigger_when(p1_rounds_wins() == 2 && p2_char() == 31) &&
              never(cheat_1_round() != 0) &&
              never(game_difficulty() < 2) &&
              once(ladder_match() == 0 && game_state() == gs_fighting)
)

achievement(
    title = "Mere Mortal", description = "Reach 3 wins streak (3 Rounds | Medium difficulty)", points = 5,
    id = 66985, badge = "70537", published = "19/10/2018 21:44:41", modified = "30/06/2020 13:31:33",
    trigger =   never(!p1_only()) &&
                once(ladder_match() == 0 && game_state() == gs_fighting && p1_consecutive_wins() == 0 && p1_only()) &&
                never(cheat_1_round() != 0) &&
                never(game_difficulty() < 2) &&
                measured(p1_consecutive_wins() == 3)
)

achievement(
    title = "Fatal Mortal", description = "Reach 6 wins streak (3 Rounds | Medium difficulty)", points = 10,
    id = 66986, badge = "70470", published = "19/10/2018 21:44:44", modified = "30/06/2020 13:31:29",
    trigger =   never(!p1_only()) &&
                once(ladder_match() == 0 && game_state() == gs_fighting && p1_consecutive_wins() == 0 && p1_only()) &&
                never(cheat_1_round() != 0) &&
                never(game_difficulty() < 2) &&
                measured(p1_consecutive_wins() == 6)
)

achievement(
    title = "Supreme Mortal", description = "Reach 10 wins streak (3 Rounds | Medium difficulty)", points = 25,
    id = 66987, badge = "70520", published = "19/10/2018 21:44:46", modified = "22/10/2019 16:24:01",
    trigger =   never(!p1_only()) &&
                once(ladder_match() == 0 && game_state() == gs_fighting && p1_consecutive_wins() == 0 && p1_only()) &&
                never(cheat_1_round() != 0) &&
                never(game_difficulty() < 2) &&
                measured(p1_consecutive_wins() == 10)
)
