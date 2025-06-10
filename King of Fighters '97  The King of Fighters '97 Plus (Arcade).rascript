// The King of Fighters '97 | The King of Fighters '97 Plus
// #ID = 12031

// Settings
function unibios() => dword(0x00FE30)
function settings_difficulty_aes() => byte(0x00DBA1)
function soft_dip_setup_difficulty() => byte(0xfd8f)

function game_region() => byte(0x000500)

// Game
function mvs_flag() => bit7(0x00FD83)

function game_mode() => byte(0x00A847)
         MODE_SINGLEPLAY = 0x00
         MODE_TEAMPLAY = 0x01
         MODE_SINGLEVS = 0x02
         MODE_TEAMVS = 0x03
         MODE_SURVIVOR_SCORE = 0x05
         MODE_SURVIVOR_TIME = 0x09
         
function game_arena() => byte(0x00A7EB)
function game_bgm() => byte(0x00D938)
function game_sfx() => byte(0x00D93A)

function fight_round() => byte(0x00A7F0)
function fight_state() => byte(0x00A787)

function arcade_teams_defeated() => byte(0x00A798)
function arcade_teams_defeated_16bits() => word(0x00A798)

function survival_timer_2() => byte(0x00EC3C)
function survival_timer_1() => word(0x00EC3E)

// P1
function p1_active_state() => byte(0x00FDB7)
function p2_active_state() => byte(0x00FDB6)

function p1_1st_character() => byte(0x00A84A)
function p1_3rd_character() => byte(0x00A84C)
function p1_2nd_character() => byte(0x00A84D)
function p1_rounds_lost() => byte(0x00A84B)

function p1_special_character_bit0() => bit0(0x00A856)
function p1_special_character_bit1() => bit1(0x00A856)
function p1_special_character_bit2() => bit2(0x00A856)
function p1_special_character_bit3() => bit3(0x00A856)
function p1_special_character_bitflags() => byte(0x00A856)

function p1_active_character() => byte(0x008170)
function p1_health() => byte(0x008238)
function p1_fight_mode() => byte(0x00A848)

function p1_moves() => byte(0x008172)
function p1_moves_16bits() => word(0x008172)
function p1_action_additional() => word(0x0081E2)
function p1_score_00xx0000() => byte(0x0081FC)
function p1_hits() => byte(0x0084B1)

// P2
function p2_active_character() => byte(0x008370)
function p2_health() => byte(0x008438)
function p2_damage() => byte(0x00843A)
function p2_rounds_lost() => byte(0x00A85A)



// Utility Functions
function team_play_game_beaten() {
    return(
        game_bgm() != 0x23 && 
        game_arena() == 7 && 
        p2_active_character() == 30 && 
        p1_rounds_lost() < 3 && 
        p2_rounds_lost() > prev(p2_rounds_lost())
    )
}

function global_resetif_notplaying() {
    return(
        (always_false()) ||
        (never(p1_active_state() == 0 && p2_active_state() == 0))
    )
}

function global_resetif_p1_only() {
    return(
        (always_false()) ||
        (never(p1_active_state() == 0) && never(p2_active_state() > 0))
    )
}

function no_unibios() => never(unibios() != 0)
function p1_only() => never(p1_active_state() == 0) && never(p2_active_state() > 0)


// =========================================
//              Team Achievements              
// =========================================

achievement(
    title = "Esaka Forever '97", points = 10, type="win_condition",
    description = "Finish the game playing only as a team (initial select): 1-Kyo, 2-Benimaru, 3-Goro (P1)",
    id = 72563, badge = "78409", published = "25/02/2019 03:21:10", modified = "01/12/2021 05:19:02",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 &&
                  p1_1st_character() == 0 && p1_2nd_character() == 1 && p1_3rd_character() == 2
              ) && never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 0)) &&
              never((fight_state() == 26 && p1_2nd_character() != 1)) &&
              never((fight_state() == 26 && p1_3rd_character() != 2)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten())
)

achievement(
    title = "Rumbling on the City '97", points = 10, type="win_condition",
    description = "Finish the game playing only as a team (initial select): 1-Leona, 2-Ralf, 3-Clark (P1)",
    id = 72564, badge = "78416", published = "25/02/2019 03:21:35", modified = "01/12/2021 05:19:01",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 &&
                  p1_1st_character() == 9 && p1_2nd_character() == 10 && p1_3rd_character() == 11
              ) && never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 9)) &&
              never((fight_state() == 26 && p1_2nd_character() != 10)) &&
              never((fight_state() == 26 && p1_3rd_character() != 11)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten())
)

achievement(
    title = "Seoul Road '97", points = 10, type="win_condition",
    description = "Finish the game playing only as a team (initial select): 1-Kim, 2-Chang, 3-Choi (P1)",
    id = 72565, badge = "78417", published = "25/02/2019 03:21:38", modified = "01/12/2021 05:19:01",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 &&
                  p1_1st_character() == 18 && p1_2nd_character() == 19 && p1_3rd_character() == 20
              ) && never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 18)) &&
              never((fight_state() == 26 && p1_2nd_character() != 19)) &&
              never((fight_state() == 26 && p1_3rd_character() != 20)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten())
)

achievement(
    title = "Chestnuts and Forever '97", points = 10, type="win_condition",
    description = "Finish the game playing only as a team (initial select): 1-Terry, 2-Andy, 3-Joe (P1)",
    id = 72566, badge = "78410", published = "25/02/2019 03:21:40", modified = "01/12/2021 05:19:01",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 &&
                  p1_1st_character() == 3 && p1_2nd_character() == 4 && p1_3rd_character() == 5
              ) && never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 3)) &&
              never((fight_state() == 26 && p1_2nd_character() != 4)) &&
              never((fight_state() == 26 && p1_3rd_character() != 5)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten())
)

achievement(
    title = "Psycho Soldier Remix 97", points = 10, type="win_condition",
    description = "Finish the game playing only as a team (initial select): 1-Athena, 2-Sie, 3-Chin (P1)",
    id = 72567, badge = "78413", published = "25/02/2019 03:21:42", modified = "01/12/2021 05:19:00",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 &&
                  p1_1st_character() == 12 && p1_2nd_character() == 13 && p1_3rd_character() == 14
              ) && never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 12)) &&
              never((fight_state() == 26 && p1_2nd_character() != 13)) &&
              never((fight_state() == 26 && p1_3rd_character() != 14)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten())
)

achievement(
    title = "Bloody '97", points = 10, type="win_condition",
    description = "Finish the game playing only as a team (initial select): 1-Yashiro, 2-Shermie, 3-Chris (P1)",
    id = 72568, badge = "78415", published = "25/02/2019 03:21:43", modified = "17/09/2023 08:34:10",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 &&
                  p1_1st_character() == 21 && p1_2nd_character() == 22 && p1_3rd_character() == 23
              ) && never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 21)) &&
              never((fight_state() == 26 && p1_2nd_character() != 22)) &&
              never((fight_state() == 26 && p1_3rd_character() != 23)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten()) && never((fight_state() == 26 && p1_special_character_bitflags() != 0))
)

achievement(
    title = "Kamikirimushi '97", points = 10, type="win_condition",
    description = "Finish the game playing only as a team (initial select): 1-Ryo, 2-Robert, 3-Yuri (P1)",
    id = 72569, badge = "78411", published = "25/02/2019 03:21:45", modified = "01/12/2021 05:18:59",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 &&
                  p1_1st_character() == 6 && p1_2nd_character() == 7 && p1_3rd_character() == 8
              ) && never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 6)) &&
              never((fight_state() == 26 && p1_2nd_character() != 7)) &&
              never((fight_state() == 26 && p1_3rd_character() != 8)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten())
)

achievement(
    title = "Fairy '97", points = 10, type="win_condition",
    description = "Finish the game playing only as a team (initial select): 1-Chizuru, 2-Mai, 3-King (P1)",
    id = 72570, badge = "78414", published = "25/02/2019 03:21:47", modified = "01/12/2021 05:18:58",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 &&
                  p1_1st_character() == 15 && p1_2nd_character() == 16 && p1_3rd_character() == 17
              ) && never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 15)) &&
              never((fight_state() == 26 && p1_2nd_character() != 16)) &&
              never((fight_state() == 26 && p1_3rd_character() != 17)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten())
)

achievement(
    title = "C62 ~White Country Ver.2~ KOF97", points = 10, type="win_condition",
    description = "Finish the game playing only as a team (initial select): 1-Ryuji, 2-Mary, 3-Billy (P1)",
    id = 72571, badge = "78418", published = "25/02/2019 03:21:49", modified = "01/12/2021 05:18:58",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 &&
                  p1_1st_character() == 24 && p1_2nd_character() == 25 && p1_3rd_character() == 26
              ) && never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 24)) &&
              never((fight_state() == 26 && p1_2nd_character() != 25)) &&
              never((fight_state() == 26 && p1_3rd_character() != 26)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten())
)

achievement(
    title = "Cool JAM ~Arashi no Saxophone 3~", points = 10, type="win_condition",
    description = "Finish the game playing only as a team (initial select): 1-Iori (both others free of choice) (P1)",
    id = 72572, badge = "78419", published = "25/02/2019 03:21:51", modified = "26/07/2023 18:44:00",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 && p1_1st_character() == 27) &&
              never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 27)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten())
)

achievement(
    title = "Still Green", points = 10, type="win_condition",
    description = "Finish the game playing only as a team (initial select): 1-Shingo, 2-Kyo (3rd one free of choice) (P1)",
    id = 72573, badge = "78420", published = "25/02/2019 03:21:53", modified = "01/12/2021 05:18:57",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 &&
                  p1_1st_character() == 31 && p1_2nd_character() == 0
              ) && never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 31)) &&
              never((fight_state() == 26 && p1_2nd_character() != 0)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten())
)

achievement(
    title = "Control Crisis", points = 10,
    description = "Finish the game playing only as a team (initial select): 1-Orochi Iori, 2-Orochi Leona (3rd one free of choice) (P1)",
    id = 72574, badge = "78421", published = "25/02/2019 03:21:57", modified = "01/12/2021 05:18:57",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 &&
                  p1_1st_character() == 28 && p1_2nd_character() == 29
              ) && never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 28)) &&
              never((fight_state() == 26 && p1_2nd_character() != 29)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten())
)

achievement(
    title = "Rhythmic Hallucination", points = 10,
    description = "Finish the game playing only as a team (initial select): 1-Orochi Yashiro, 2-Orochi Shermie, 3-Orochi Chris (P1)",
    id = 72575, badge = "78422", published = "25/02/2019 03:21:59", modified = "17/09/2023 08:38:54",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 &&
                  p1_1st_character() == 21 && p1_2nd_character() == 22 && p1_3rd_character() == 23
              ) && never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 21)) &&
              never((fight_state() == 26 && p1_2nd_character() != 22)) &&
              never((fight_state() == 26 && p1_3rd_character() != 23)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten()) && never((fight_state() == 26 && p1_special_character_bitflags() != 7))
)

achievement(
    title = "The Mix of Fighters '97 - Sacred Force", points = 10,
    description = "Finish the game playing only as a team (initial select): 1-Kyo, 2-Iori, 3-Chizuru (P1)",
    id = 72576, badge = "78423", published = "25/02/2019 03:22:01", modified = "20/11/2022 20:25:55",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 &&
                  p1_1st_character() == 0 && p1_2nd_character() == 27 && p1_3rd_character() == 15
              ) && never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 0)) &&
              never((fight_state() == 26 && p1_2nd_character() != 27)) &&
              never((fight_state() == 26 && p1_3rd_character() != 15)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten()) &&
              (p2_health() > 217 || p2_health() < 1)
)

achievement(
    title = "The Mix of Fighters '97 - '94 Females", points = 10,
    description = "Finish the game playing only as a team (initial select): 1-King, 2-Mai, 3-Yuri (P1)",
    id = 72577, badge = "78424", published = "25/02/2019 03:22:02", modified = "01/12/2021 05:18:56",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 &&
                  p1_1st_character() == 17 && p1_2nd_character() == 16 && p1_3rd_character() == 8
              ) && never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 17)) &&
              never((fight_state() == 26 && p1_2nd_character() != 16)) &&
              never((fight_state() == 26 && p1_3rd_character() != 8)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten())
)

achievement(
    title = "The Mix of Fighters '97 - Old SNK", points = 10,
    description = "Finish the game playing only as a team (initial select): 1-Ralf, 2-Clark, 3-Athena (P1)",
    id = 72578, badge = "78425", published = "25/02/2019 03:22:05", modified = "01/12/2021 05:18:55",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 &&
                  p1_1st_character() == 10 && p1_2nd_character() == 11 && p1_3rd_character() == 12
              ) && never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 10)) &&
              never((fight_state() == 26 && p1_2nd_character() != 11)) &&
              never((fight_state() == 26 && p1_3rd_character() != 12)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten())
)

achievement(
    title = "The Mix of Fighters '97 - Sidekick", points = 10,
    description = "Finish the game playing only as a team (initial select): 1-Benimaru, 2-Joe, 3-Kim (P1)",
    id = 72579, badge = "78426", published = "25/02/2019 03:22:07", modified = "01/12/2021 05:18:55",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 &&
                  p1_1st_character() == 1 && p1_2nd_character() == 5 && p1_3rd_character() == 18
              ) && never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 1)) &&
              never((fight_state() == 26 && p1_2nd_character() != 5)) &&
              never((fight_state() == 26 && p1_3rd_character() != 18)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten())
)

achievement(
    title = "The Mix of Fighters '97 - Superstar", points = 10,
    description = "Finish the game playing only as a team (initial select): 1-Kyo, 2-Terry, 3-Ryo (P1)",
    id = 72580, badge = "78427", published = "25/02/2019 03:22:08", modified = "01/12/2021 05:18:55",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 &&
                  p1_1st_character() == 0 && p1_2nd_character() == 3 && p1_3rd_character() == 6
              ) && never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 0)) &&
              never((fight_state() == 26 && p1_2nd_character() != 3)) &&
              never((fight_state() == 26 && p1_3rd_character() != 6)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten())
)

achievement(
    title = "The Mix of Fighters '97 - Distant Desire", points = 10,
    description = "Finish the game playing only as a team (initial select): 1-Terry, 2-Mary, 3-Joe (P1)",
    id = 72581, badge = "78428", published = "25/02/2019 03:22:10", modified = "01/12/2021 05:18:54",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 &&
                  p1_1st_character() == 3 && p1_2nd_character() == 25 && p1_3rd_character() == 5
              ) && never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 3)) &&
              never((fight_state() == 26 && p1_2nd_character() != 25)) &&
              never((fight_state() == 26 && p1_3rd_character() != 5)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten())
)

achievement(
    title = "The Mix of Fighters '97 - Famitsu", points = 10,
    description = "Finish the game playing only as a team (initial select): 1-Chang, 2-Choi, 3-Ryuji (P1)",
    id = 72582, badge = "78429", published = "25/02/2019 03:22:12", modified = "01/12/2021 05:18:54",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 &&
                  p1_1st_character() == 19 && p1_2nd_character() == 20 && p1_3rd_character() == 24
              ) && never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 19)) &&
              never((fight_state() == 26 && p1_2nd_character() != 20)) &&
              never((fight_state() == 26 && p1_3rd_character() != 24)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten())
)

achievement(
    title = "The Mix of Fighters '97 - Fiery Vigor", points = 10,
    description = "Finish the game playing only as a team (initial select): 1-Kyo, 2-Billy, 3-Mai (P1)",
    id = 72583, badge = "78430", published = "25/02/2019 03:22:15", modified = "01/12/2021 05:18:53",
    trigger = no_unibios() && unless(p2_active_state() != 0) &&
              once(fight_state() == 26 && arcade_teams_defeated_16bits() == 0 && fight_round() == 0 &&
                  p1_1st_character() == 0 && p1_2nd_character() == 26 && p1_3rd_character() == 16
              ) && never(p1_active_state() == 0) && never(p1_active_state() == 3) &&
              never((fight_state() == 26 && p1_1st_character() != 0)) &&
              never((fight_state() == 26 && p1_2nd_character() != 26)) &&
              never((fight_state() == 26 && p1_3rd_character() != 16)) &&
              trigger_when(repeated(8, prev(arcade_teams_defeated_16bits()) < arcade_teams_defeated_16bits())) &&
              trigger_when(team_play_game_beaten())
)

// =========================================
//                   Misc              
// =========================================

achievement(
    title = "The Origin of Mind", points = 10,
    description = "Finish the game in Single Play mode (P1)",
    id = 72584, badge = "78431", published = "25/02/2019 03:22:27", modified = "18/07/2019 02:57:36",
    trigger = no_unibios() && never(p2_active_state() != 0) && never(game_mode() != MODE_SINGLEPLAY) &&
              game_arena() == 7 && p2_active_character() == 30 && p2_rounds_lost() == 2 && unless(game_region() != 7)
)

achievement(
    title = "The Origin of Collective Mind", points = 10, type="win_condition",
    description = "Finish the game in Team Play mode (P1)",
    id = 72585, badge = "78432", published = "25/02/2019 03:22:29", modified = "11/02/2025 19:01:30",
    trigger = no_unibios() && never(p2_active_state() != 0) && never(game_mode() != MODE_TEAMPLAY) &&
              unless(game_region() != 7) &&
              team_play_game_beaten()
)

// Basics
achievement(
    title = "The King of Basics '97 I", points = 1,
    description = "Perform a Quick Recovery (P1)",
    id = 72586, badge = "78433", published = "25/02/2019 03:22:35", modified = "09/03/2019 04:22:13",
    trigger = unibios() == 0 && p2_active_state() == 0 && p1_active_state() > 0 && p1_moves_16bits() == 69 &&
              fight_state() > 0
)

// DONE: https://retroachievements.org/ticket/84813
// DONE: The achievement very likely didn't worked because there's two different move IDs for the guard cancel roll (front and backwards),
// DONE: however, the achievement only checked for one side (front)
// DONE: Fixed by adding a alt condition for the backwards roll
achievement(
    title = "The King of Basics '97 II", points = 1,
    description = "Perform a Guard Cancel Roll (P1)",
    id = 72587, badge = "78434", published = "25/02/2019 03:22:37", modified = "09/03/2019 04:22:15",
    trigger = unibios() == 0 && p2_active_state() == 0 && p1_active_state() > 0 && 
              __ornext(p1_moves_16bits() == 0x39 || p1_moves_16bits() == 0x3c) &&
              fight_state() > 0
)

achievement(
    title = "The King of Basics '97 III", points = 2,
    description = "Perform a Guard Cancel Attack (P1)",
    id = 72588, badge = "78435", published = "25/02/2019 03:22:39", modified = "18/07/2019 02:57:41",
    trigger = unibios() == 0 && p2_active_state() == 0 && p1_active_state() > 0 && p1_moves_16bits() == 118 &&
              fight_state() > 0
)

achievement(
    title = "The King of Basics '97 IV", points = 1,
    description = "Perform a taunt (P1)",
    id = 72589, badge = "78436", published = "25/02/2019 03:22:42", modified = "09/03/2019 04:22:18",
    trigger = unibios() == 0 && p2_active_state() == 0 && p1_active_state() > 0 && p1_moves_16bits() == 70 &&
              fight_state() > 0
)

// DONE: https://retroachievements.org/achievement/72590
// DONE: Fixed by adding a Single Play and fight state check
achievement(
    title = "The King of Basics '97 V", points = 5,
    description = "Successfully perform Team Assistance while being stunned (can't get hit at the same time)",
    id = 72590, badge = "78437", published = "25/02/2019 03:22:44", modified = "01/10/2019 18:49:02",
    trigger = unibios() == 0 && p2_active_state() == 0 && p1_active_state() > 0 && p1_moves_16bits() == 71 &&
              game_mode() != MODE_SINGLEPLAY && game_mode() != 0x04 &&
              fight_state() > 0
)

// =========================================
//          Super Desperation Moves              
// =========================================

achievement(
    title = "Saishuu Kessen Ougi Orochi Nagi", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Kyo Kusanagi (P1)",
    id = 72591, badge = "78438", published = "25/02/2019 03:23:05", modified = "13/10/2019 21:32:01",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) && game_region() == 7 &&
              ((measured(tally(2, once(p1_moves_16bits() == 215), once(p1_moves_16bits() == 198))) &&
                unless(game_region() != 7) && unless(p1_active_character() != 0) && unless(p2_active_state() != 0) &&
                unless(p1_1st_character() != 0) && unless(p1_special_character_bit0() != 0) && unless(p2_damage() < 2)) ||
               (measured(tally(2, once(p1_moves_16bits() == 215), once(p1_moves_16bits() == 198))) &&
                unless(game_region() != 7) && unless(p1_active_character() != 0) && unless(p2_active_state() != 0) &&
                unless(p1_2nd_character() != 0) && unless(p1_special_character_bit1() != 0) && unless(p2_damage() < 2)) ||
               (measured(tally(2, once(p1_moves_16bits() == 215), once(p1_moves_16bits() == 198))) &&
                unless(game_region() != 7) && unless(p1_active_character() != 0) && unless(p2_active_state() != 0) &&
                unless(p1_3rd_character() != 0) && unless(p1_special_character_bit2() != 0) && unless(p2_damage() < 2)))
)

achievement(
    title = "Electro Raikoken", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Benimaru Nikaido (P1)",
    id = 72592, badge = "78439", published = "25/02/2019 03:23:08", modified = "28/09/2019 18:18:01",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(2, once(p1_moves_16bits() == 143), once(p1_moves_16bits() == 183)))  &&
              unless(game_region() != 7) && unless(p1_active_character() != 1) && unless(p2_damage() < 2)
)

achievement(
    title = "Jigoku Gokuraku Bukko Meki Ura Nage ", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Goro Daimon (P1)",
    id = 72593, badge = "78440", published = "25/02/2019 03:23:11", modified = "18/07/2019 02:58:02",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(2, once(p1_moves_16bits() == 159), once(p1_moves_16bits() == 188))) &&
              unless(game_region() != 7) && unless(p1_active_character() != 2)
)

achievement(
    title = "Power Angle Geyser ", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Terry Bogard (P1)",
    id = 72594, badge = "78441", published = "25/02/2019 03:23:13", modified = "18/07/2019 02:58:04",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(2, once(p1_moves_16bits() == 169), once(p1_moves_16bits() == 190))) &&
              unless(game_region() != 7) && unless(p1_active_character() != 3) && unless(p2_damage() < 2)
)

achievement(
    title = "Cho Reppa Ryusei Ken", points = 5,
    description = "Successfully perform all Super Desperation Moves (full combo) against the CPU as Andy Bogard (P1)",
    id = 72595, badge = "78442", published = "25/02/2019 03:23:16", modified = "18/07/2019 02:58:06",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(2, once(p1_moves_16bits() == 176), once(p1_moves_16bits() == 191))) &&
              unless(game_region() != 7) && unless(p1_active_character() != 4) && unless(p2_damage() < 2)
)

achievement(
    title = "Screw Hurricane Tiger Kakato", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Joe Higashi (P1)",
    id = 72596, badge = "78443", published = "25/02/2019 03:23:19", modified = "18/07/2019 02:58:10",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(2, once(p1_moves_16bits() == 209), once(p1_moves_16bits() == 189))) &&
              unless(game_region() != 7) && unless(p1_active_character() != 5) && unless(p2_damage() < 2)
)

achievement(
    title = "Haoh Ryu Ken", points = 5,
    description = "Successfully perform all Super Desperation Moves (full combo) against the CPU as Ryo Sakazaki (P1)",
    id = 72597, badge = "78444", published = "25/02/2019 03:23:56", modified = "18/07/2019 02:58:12",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(3, once(p1_moves_16bits() == 202), once(p1_moves_16bits() == 172), once(p1_moves_16bits() == 198))) && 
              unless(game_region() != 7) && unless(p1_active_character() != 6) &&
              unless(p2_damage() < 5) && unless(p2_damage() < 3)
)

achievement(
    title = "Shokoh Ko Juudan Kyaku", points = 5,
    description = "Successfully perform all Super Desperation Moves (full combo) against the CPU as Robert Garcia (P1)",
    id = 72598, badge = "78445", published = "25/02/2019 03:24:02", modified = "18/07/2019 02:58:13",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(3, once(p1_moves_16bits() == 172), once(p1_moves_16bits() == 218), once(p1_moves_16bits() == 197))) && 
              unless(game_region() != 7) && unless(p1_active_character() != 7) &&
              unless(p2_damage() < 3)
)

achievement(
    title = "Ken Houou Rekkou", points = 5,
    description = "Successfully perform all Super Desperation Moves (full combo) against the CPU as Yuri Sakazaki (P1)",
    id = 72599, badge = "78446", published = "25/02/2019 03:24:23", modified = "18/07/2019 02:58:16",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(3, once(p1_moves_16bits() == 233), once(p1_moves_16bits() == 205), once(p1_moves_16bits() == 227))) && 
              unless(game_region() != 7) && unless(p1_active_character() != 8) &&
              unless(p2_damage() < 3)
)

achievement(
    title = "V Gravity Spark", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Leona Heidern (P1)",
    id = 72600, badge = "78447", published = "25/02/2019 03:24:25", modified = "28/09/2019 18:18:01",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(3, once(p1_moves_16bits() == 192), once(p1_moves_16bits() == 214), once(p1_moves_16bits() == 174))) && 
              unless(game_region() != 7) && unless(p1_active_character() != 9) &&
              unless(p2_damage() < 2)
)

achievement(
    title = "Bari Bari Umanori Phantom", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Ralf Jones (P1)",
    id = 72601, badge = "78448", published = "25/02/2019 03:24:29", modified = "13/10/2019 21:32:01",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(3, once(p1_moves_16bits() == 200), once(p1_moves_16bits() == 170), once(p1_moves_16bits() == 194))) &&
              unless(game_region() != 7) && unless(p1_active_character() != 10) &&
              unless(p2_damage() < 2)
)

achievement(
    title = "Ultra Argentine Three", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Clark Still (P1)",
    id = 72602, badge = "78449", published = "25/02/2019 03:24:32", modified = "13/10/2019 21:32:01",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(2, once(p1_moves_16bits() == 183), once(p1_moves_16bits() == 208))) &&
              unless(game_region() != 7) && unless(p1_active_character() != 11) && unless(p2_damage() < 2)
)

achievement(
    title = "Shining Crystal Arrow", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Athena Asamiya (P1)",
    id = 72603, badge = "78450", published = "25/02/2019 03:24:34", modified = "18/07/2019 02:58:23",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(2, once(p1_moves_16bits() == 214), once(p1_moves_16bits() == 183), once(p1_moves_16bits() == 204))) && 
              unless(p1_active_character() != 12) && unless(game_region() != 7) &&
              unless(p2_damage() < 3)
)

achievement(
    title = "Shin Ryuu Tenbu Seiou Man O Kuu", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Sie Kensou (P1)",
    id = 72604, badge = "78451", published = "25/02/2019 03:24:36", modified = "18/07/2019 02:58:25",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(2, once(p1_moves_16bits() == 182), once(p1_moves_16bits() == 190))) &&
              unless(game_region() != 7) && unless(p1_active_character() != 13) && unless(p2_damage() < 2)
)

achievement(
    title = "Gou Ran En Shourai", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Chin Gentsai (P1)",
    id = 72605, badge = "78452", published = "25/02/2019 03:24:38", modified = "18/07/2019 02:58:27",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(2, once(p1_moves_16bits() == 191), once(p1_moves_16bits() == 176))) &&
              unless(game_region() != 7) && unless(p1_active_character() != 14) && unless(p2_damage() < 2)
)

achievement(
    title = "Ichimen 85 Katsu Rai no Fui Jin", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Chizuru Kagura (P1)",
    id = 72606, badge = "78453", published = "25/02/2019 03:24:41", modified = "18/07/2019 02:58:28",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(2, once(p1_moves_16bits() == 183), once(p1_action_additional() == 644))) &&
              unless(game_region() != 7) && unless(p1_active_character() != 15) && unless(p1_hits() < 1)
)

achievement(
    title = "Cho Hissatsu Houou Chou no Mai", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Mai Shiranui (P1)",
    id = 72607, badge = "78454", published = "25/02/2019 03:24:44", modified = "18/07/2019 02:58:30",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(3, once(p1_moves_16bits() == 175), once(p1_moves_16bits() == 192), once(p1_moves_16bits() == 187))) && 
              unless(game_region() != 7) && unless(p1_active_character() != 16) &&
              unless(p2_damage() < 3)
)

achievement(
    title = "Illusion Flash", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as King (P1)",
    id = 72608, badge = "78455", published = "25/02/2019 03:24:47", modified = "18/07/2019 02:58:31",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(2, once(p1_moves_16bits() == 184), once(p1_moves_16bits() == 203))) &&
              unless(game_region() != 7) && unless(p1_active_character() != 17) && unless(p2_damage() < 2)
)

achievement(
    title = "Bai Houhoh Tenbu Kyaku", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Kim Kaphwan (P1)",
    id = 72609, badge = "78456", published = "25/02/2019 03:24:49", modified = "13/10/2019 21:32:01",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(2, once(p1_moves_16bits() == 194), once(p1_moves_16bits() == 212))) &&
              unless(game_region() != 7) && unless(p1_active_character() != 18) && unless(p2_damage() < 2)
)

achievement(
    title = "Shin! Chouzetsu Houou Kyaku", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Choi Bounge (P1)",
    id = 72610, badge = "78457", published = "25/02/2019 03:24:52", modified = "13/10/2019 21:32:01",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(2, once(p1_moves_16bits() == 177), once(p1_moves_16bits() == 198))) &&
              unless(game_region() != 7) && unless(p1_active_character() != 20)
)

achievement(
    title = "Million Bash Impact", points = 5,
    description = "Successfully perform all fully charged Super Desperation Moves against the CPU as Yashiro Nanakase (P1)",
    id = 72611, badge = "78458", published = "25/02/2019 03:24:55", modified = "01/10/2019 18:49:02",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              ((measured(tally(2, once(p1_moves_16bits() == 226), once(p1_moves_16bits() == 235))) &&
                unless(game_region() != 7) && unless(p1_active_character() != 21) && unless(p2_active_state() != 0) &&
                unless(p1_1st_character() != 21) && unless(p1_special_character_bit0() != 0) && unless(p2_damage() < 5)) ||
               (measured(tally(2, once(p1_moves_16bits() == 226), once(p1_moves_16bits() == 235))) &&
                unless(game_region() != 7) && unless(p1_active_character() != 21) && unless(p2_active_state() != 0) &&
                unless(p1_2nd_character() != 21) && unless(p1_special_character_bit1() != 0) && unless(p2_damage() < 5)) ||
               (measured(tally(2, once(p1_moves_16bits() == 226), once(p1_moves_16bits() == 235))) &&
                unless(game_region() != 7) && unless(p1_active_character() != 21) && unless(p2_active_state() != 0) &&
                unless(p1_3rd_character() != 21) && unless(p1_special_character_bit2() != 0) && unless(p2_damage() < 5)))
)

// DONE: https://retroachievements.org/ticket/84829
achievement(
    title = "Tekkyu Dai Bousou Assatsu", points = 5,
    description = "Successfully perform all Super Desperation Moves (full combo) against the CPU as Chang Koehan (P1)",
    id = 72612, badge = "78459", published = "25/02/2019 03:25:28", modified = "18/07/2019 02:58:39",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(2, 
                    once(p2_damage() >= 2 && p1_moves_16bits() == 0xb3),
                    once(p2_damage() >= 2 && p1_moves_16bits() >= 0xa0 && p1_moves_16bits() <= 0xa4))
              ) && unless(game_region() != 7) && unless(p1_active_character() != 19)
)

achievement(
    title = "Shermie Carnival Flash", points = 5,
    description = "Successfully perform all Super Desperation Moves (full combo) against the CPU as Shermie (P1)",
    id = 72613, badge = "78460", published = "25/02/2019 03:25:38", modified = "18/07/2019 02:58:41",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              ((measured(tally(2, once(p1_moves_16bits() == 198), once(p1_moves_16bits() == 212))) &&
                unless(game_region() != 7) && unless(p1_active_character() != 22) && unless(p2_active_state() != 0) &&
                unless(p1_1st_character() != 22) && unless(p1_special_character_bit0() != 0) && unless(p2_damage() < 5)) ||
               (measured(tally(2, once(p1_moves_16bits() == 198), once(p1_moves_16bits() == 212))) &&
                unless(game_region() != 7) && unless(p1_active_character() != 22) && unless(p2_active_state() != 0) &&
                unless(p1_2nd_character() != 22) && unless(p1_special_character_bit1() != 0) && unless(p2_damage() < 5)) ||
               (measured(tally(2, once(p1_moves_16bits() == 198), once(p1_moves_16bits() == 212))) &&
                unless(game_region() != 7) && unless(p1_active_character() != 22) && unless(p2_active_state() != 0) &&
                unless(p1_3rd_character() != 22) && unless(p1_special_character_bit3() != 0) && unless(p2_damage() < 5)))
)

achievement(
    title = "Chain Slide Drive", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Chris (P1)",
    id = 72614, badge = "78462", published = "25/02/2019 03:25:40", modified = "18/07/2019 02:58:42",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              ((measured(tally(2, once(p1_moves_16bits() == 235), once(p1_moves_16bits() == 221))) &&
                unless(game_region() != 7) && unless(p1_active_character() != 23) && unless(p2_active_state() != 0) &&
                unless(p1_1st_character() != 23) && unless(p1_special_character_bit0() != 0) && unless(p2_damage() < 5)) ||
               (measured(tally(2, once(p1_moves_16bits() == 235), once(p1_moves_16bits() == 221))) &&
                unless(game_region() != 7) && unless(p1_active_character() != 23) && unless(p2_active_state() != 0) &&
                unless(p1_2nd_character() != 23) && unless(p1_special_character_bit1() != 0) && unless(p2_damage() < 5)) ||
               (measured(tally(2, once(p1_moves_16bits() == 235), once(p1_moves_16bits() == 221))) &&
                unless(game_region() != 7) && unless(p1_active_character() != 23) && unless(p2_active_state() != 0) &&
                unless(p1_3rd_character() != 23) && unless(p1_special_character_bit2() != 0) && unless(p2_damage() < 5)))
)

achievement(
    title = "Guillotine Drill", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Ryuji Yamazaki (P1)",
    id = 72615, badge = "78463", published = "25/02/2019 03:25:43", modified = "18/07/2019 02:58:44",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(2, once(p1_moves_16bits() == 184), once(p1_moves_16bits() == 193))) &&
              unless(game_region() != 7) && unless(p1_active_character() != 24) && unless(p2_damage() < 2)
)

achievement(
    title = "M. Typhoon Rose Swing", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Blue Mary (P1)",
    id = 72616, badge = "78464", published = "25/02/2019 03:25:45", modified = "18/07/2019 02:58:45",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(3, once(p1_moves_16bits() == 181), once(p1_moves_16bits() == 234), once(p1_moves_16bits() == 207))) && 
              unless(game_region() != 7) && unless(p1_active_character() != 25) &&
              unless(p2_damage() < 2)
)

achievement(
    title = "Cho Kaen Dai Senpuu", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Billy Kane (P1)",
    id = 72617, badge = "78465", published = "25/02/2019 03:25:50", modified = "01/10/2019 18:49:02",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(2, once(p1_moves_16bits() == 186), once(p1_moves_16bits() == 172))) &&
              unless(game_region() != 7) && unless(p1_active_character() != 26) && unless(p2_damage() < 2)
)

achievement(
    title = "Kin 1211 Shiki Ya Sakazuki", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Iori Yagami (P1)",
    id = 72618, badge = "78466", published = "25/02/2019 03:25:52", modified = "13/10/2019 21:32:01",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(2, once(p1_moves_16bits() == 177 && p2_damage() >= 2), once(p1_moves_16bits() == 204))) &&
              unless(game_region() != 7) && unless(p1_active_character() != 27)
)

achievement(
    title = "Ge Shiki Kake Burning Shingo", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Shingo Yabuki (P1)",
    id = 72619, badge = "78467", published = "25/02/2019 03:25:54", modified = "18/07/2019 02:58:52",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(2, once(p1_moves_16bits() == 168), once(p1_moves_16bits() == 180))) &&
              unless(game_region() != 7) && unless(p1_active_character() != 31) && unless(p2_damage() < 2)
)

achievement(
    title = "Ankoku Jigoku Araburu Hoeru Daichi", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Orochi Yashiro (P1)",
    id = 72620, badge = "78468", published = "25/02/2019 03:25:56", modified = "01/10/2019 18:49:02",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              ((measured(tally(2, once(p1_moves_16bits() == 240), once(p1_moves_16bits() == 187))) &&
                once(p1_moves_16bits() == 169) && unless(game_region() != 7) &&
                unless(p1_active_character() != 21) && unless(p2_active_state() != 0) && unless(p1_1st_character() != 21) &&
                unless(p1_special_character_bit0() != 1) && unless(p2_damage() < 2)) ||
               (measured(tally(2, once(p1_moves_16bits() == 240), once(p1_moves_16bits() == 187))) &&
                once(p1_moves_16bits() == 169) && unless(game_region() != 7) &&
                unless(p1_active_character() != 21) && unless(p2_active_state() != 0) && unless(p1_2nd_character() != 21) &&
                unless(p1_special_character_bit1() != 1) && unless(p2_damage() < 2)) ||
               (measured(tally(2, once(p1_moves_16bits() == 240), once(p1_moves_16bits() == 187))) &&
                once(p1_moves_16bits() == 169) && unless(game_region() != 7) &&
                unless(p1_active_character() != 21) && unless(p2_active_state() != 0) && unless(p1_3rd_character() != 21) &&
                unless(p1_special_character_bit2() != 1) && unless(p2_damage() < 2)))
)

achievement(
    title = "Ankoku Raiko Genei Shinshi", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Orochi Shermie (P1)",
    id = 72621, badge = "78469", published = "25/02/2019 03:25:58", modified = "18/07/2019 02:58:55",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              ((measured(tally(2, once(p1_moves_16bits() == 186), once(p1_moves_16bits() == 223))) &&
                unless(game_region() != 7) && unless(p1_active_character() != 22) && unless(p2_active_state() != 0) &&
                unless(p1_1st_character() != 22) && unless(p1_special_character_bit0() != 1) && unless(p2_damage() < 2)) ||
               (measured(tally(2, once(p1_moves_16bits() == 186), once(p1_moves_16bits() == 223))) &&
                unless(game_region() != 7) && unless(p1_active_character() != 22) && unless(p2_active_state() != 0) &&
                unless(p1_2nd_character() != 22) && unless(p1_special_character_bit1() != 1) && unless(p2_damage() < 2)) ||
               (measured(tally(2, once(p1_moves_16bits() == 186), once(p1_moves_16bits() == 223))) &&
                unless(game_region() != 7) && unless(p1_active_character() != 22) && unless(p2_active_state() != 0) &&
                unless(p1_3rd_character() != 22) && unless(p1_special_character_bit2() != 1) && unless(p2_damage() < 2)))
)

achievement(
    title = "Ankoku Orochi Gouka", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Orochi Chris (P1)",
    id = 72622, badge = "78470", published = "25/02/2019 03:26:00", modified = "26/07/2023 18:44:22",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              ((measured(tally(2, once(p1_moves_16bits() == 194), once(p1_moves_16bits() == 210))) &&
                unless(game_region() != 7) && unless(p1_active_character() != 23) && unless(p2_active_state() != 0) &&
                unless(p1_1st_character() != 23) && unless(p1_special_character_bit0() != 1) && unless(p2_damage() < 2)) ||
               (measured(tally(2, once(p1_moves_16bits() == 194), once(p1_moves_16bits() == 210))) &&
                unless(game_region() != 7) && unless(p1_active_character() != 23) && unless(p2_active_state() != 0) &&
                unless(p1_2nd_character() != 23) && unless(p1_special_character_bit1() != 1) && unless(p2_damage() < 2)) ||
               (measured(tally(2, once(p1_moves_16bits() == 194), once(p1_moves_16bits() == 210))) &&
                unless(game_region() != 7) && unless(p1_active_character() != 23) && unless(p2_active_state() != 0) &&
                unless(p1_3rd_character() != 23) && unless(p1_special_character_bit2() != 1) && unless(p2_damage() < 2)))
)

achievement(
    title = "Orochi Ura 108 Shiki Ya Otome", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Orochi Iori (P1)",
    id = 72623, badge = "78471", published = "25/02/2019 03:26:02", modified = "18/07/2019 02:59:00",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(2, once(p1_moves_16bits() == 177 && p2_damage() >= 2), once(p1_moves_16bits() == 204))) &&
              unless(game_region() != 7) && unless(p1_active_character() != 28)
)

achievement(
    title = "Orochi Rebel Slasher Storm", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as Orochi Leona (P1)",
    id = 72624, badge = "78472", published = "25/02/2019 03:26:06", modified = "18/07/2019 02:59:02",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              measured(tally(3, once(p1_moves_16bits() == 192), once(p1_moves_16bits() == 214), once(p1_moves_16bits() == 174))) && 
              unless(game_region() != 7) && unless(p1_active_character() != 29) &&
              unless(p2_damage() < 2)
)

achievement(
    title = "Ura 108 Shiki Orochi Nagi", points = 5,
    description = "Successfully perform all Super Desperation Moves against the CPU as '94 Kyo Kusanagi (P1)",
    id = 72625, badge = "78473", published = "25/02/2019 03:26:09", modified = "18/07/2019 02:59:03",
    trigger = no_unibios() && global_resetif_p1_only() && never(game_mode() == 0x04) &&
              ((once(p1_moves_16bits() == 198) && unless(game_region() != 7) &&
                unless(p1_active_character() != 0) && unless(p2_active_state() != 0) && unless(p1_1st_character() != 0) &&
                unless(p1_special_character_bit0() != 1) && unless(p2_damage() < 2)) ||
               (once(p1_moves_16bits() == 198) && unless(game_region() != 7) &&
                unless(p1_active_character() != 0) && unless(p2_active_state() != 0) && unless(p1_2nd_character() != 0) &&
                unless(p1_special_character_bit1() != 1) && unless(p2_damage() < 2)) ||
               (once(p1_moves_16bits() == 198) && unless(game_region() != 7) &&
                unless(p1_active_character() != 0) && unless(p2_active_state() != 0) && unless(p1_3rd_character() != 0) &&
                unless(p1_special_character_bit2() != 1) && unless(p2_damage() < 2)))
)

// =========================================
//                Challenges              
// =========================================

// DONE: https://retroachievements.org/ticket/84689
// DONE: Added a reset for when the current round is 0, that way the perfects never carry between fights. 
achievement(
    title = "4th Fire", points = 5,
    description = "Win a match without taking damage in Team Play mode (P1)",
    id = 72626, badge = "78474", published = "25/02/2019 03:26:20", modified = "18/07/2019 02:59:06",
    trigger = no_unibios() && never(p2_active_state() != 0) && never(game_mode() != MODE_TEAMPLAY) && 
              p1_health() == 103 &&
              never(fight_round() == 0) &&
              measured(tally(3, 
                       once(p1_health() == 103 && prev(p2_rounds_lost()) == 0 && p2_rounds_lost() == 1),
                       once(p1_health() == 103 && prev(p2_rounds_lost()) == 1 && p2_rounds_lost() == 2),
                       once(p1_health() == 103 && prev(p2_rounds_lost()) == 2 && p2_rounds_lost() == 3))
              ) && 
              unless(game_region() != 7) && never(p1_rounds_lost() != 0)
)

achievement(
    title = "Teammates Are Bored", points = 10,
    description = "Beat a team without losing a round (P1)",
    id = 72627, badge = "78475", published = "25/02/2019 03:26:23", modified = "17/09/2023 12:00:53",
    trigger = no_unibios() && unless(p2_active_state() != 0) && p1_rounds_lost() == 0 && prev(p2_rounds_lost()) == 2 &&
              p2_rounds_lost() == 3 && prev(fight_round()) == 2 && fight_round() == 3
)

achievement(
    title = "Gaia's Disappointment", points = 10,
    description = "Defeat Orochi not losing any round (P1)",
    id = 72628, badge = "78476", published = "25/02/2019 03:26:26", modified = "18/07/2019 02:59:08",
    trigger = no_unibios() && never(p2_active_state() != 0) && game_arena() == 7 &&
              p2_active_character() == 30 && p2_rounds_lost() == 3 && never(p1_rounds_lost() != 0) &&
              unless(game_region() != 7)
)

achievement(
    title = "The Knockdown Fighters", points = 10,
    description = "Win a fight_round by KO using only Knockdown Attack (P1)",
    id = 72629, badge = "78482", published = "25/02/2019 03:26:31", modified = "13/10/2019 21:32:01",
    trigger = no_unibios() && never(p2_active_state() != 0) && never(game_region() != 7) &&
              unless(p2_damage() == 0) && never(p1_moves() != 116) && once(prev(p2_health()) > 90) &&
              p2_health() > 104
)

achievement(
    title = "The Ring of Fighters '97", points = 10,
    description = "Finish the game in Survivor mode (P1)",
    id = 72630, badge = "78478", published = "25/02/2019 03:26:38", modified = "18/07/2019 02:59:13",
    trigger = no_unibios() && never(p2_active_state() != 0) && never(game_mode() > 9) &&
              never(game_mode() < 5) && game_arena() == 7 && p2_active_character() == 30 && p2_rounds_lost() == 3 &&
              unless(game_region() != 7)
)

achievement(
    title = "The Quick of Fighters '97", points = 10,
    description = "Finish the game in Survivor mode within 10 minutes or less (P1)",
    id = 72631, badge = "78479", published = "25/02/2019 03:26:41", modified = "19/11/2022 21:57:24",
    trigger = no_unibios() && never(p2_active_state() != 0) && never(game_mode() > 9) &&
              never(game_mode() < 5) && game_arena() == 7 && p2_active_character() == 30 && p2_rounds_lost() == 3 &&
              unless(game_region() != 7) && never(survival_timer_2() != 0) && never(survival_timer_1() > 60000)
)

achievement(
    title = "Slick of Fighters '97", points = 10,
    description = "Score 400000 points or more in Survival mode (P1)",
    id = 72632, badge = "78480", published = "25/02/2019 03:26:44", modified = "01/10/2019 18:49:02",
    trigger = no_unibios() && never(p2_active_state() != 0) && p1_score_00xx0000() >= 64 &&
              never(game_mode() > 9) && never(game_mode() < 5)
)

achievement(
    title = "The King of Rankings '97", points = 10,
    description = "Score 400000 points or more in Team Play mode (P1)",
    id = 72633, badge = "78481", published = "25/02/2019 03:26:48", modified = "18/07/2019 02:59:29",
    trigger = no_unibios() && never(p2_active_state() != 0) && p1_score_00xx0000() >= 64 &&
              never(game_mode() != MODE_TEAMPLAY)
)

achievement(
    title = "The King of Strikers '97", points = 10,
    description = "Finish the game in Team Play mode without using roll (P1)",
    id = 72634, badge = "78477", published = "25/02/2019 03:26:50", modified = "09/06/2020 03:57:30",
    trigger = no_unibios() && global_resetif_notplaying() && never(p2_active_state() != 0) && 
              never(game_mode() != MODE_TEAMPLAY) &&
              once(arcade_teams_defeated() == 0 && game_bgm() == 0x25) && 
              never(p1_moves_16bits() == 52) &&
              never(p1_moves_16bits() == 55) && 
              trigger_when(team_play_game_beaten())
)

achievement(
    title = "The King of Radicals '97", points = 10,
    description = "Finish the game in Team Play mode without activating the POW gauge (P1)",
    id = 72635, badge = "78483", published = "25/02/2019 03:26:54", modified = "26/07/2023 18:45:05",
    trigger = no_unibios() && global_resetif_notplaying() && unless(p2_active_state() != 0) && 
              never(game_mode() != MODE_TEAMPLAY) &&
              once(arcade_teams_defeated() == 0 && game_bgm() == 0x25) && 
              never(p1_moves_16bits() == 77) &&
              trigger_when(team_play_game_beaten())
)

achievement(
    title = "Mirthless", points = 25,
    description = "Finish the game in Team Play mode on the expert level (P1)",
    id = 72636, badge = "78484", published = "25/02/2019 03:26:57", modified = "07/10/2019 20:06:01",
    trigger = no_unibios() && never(p2_active_state() != 0) && 
              never(game_mode() != MODE_TEAMPLAY) &&
              never(settings_difficulty_aes() != 7) &&
              team_play_game_beaten()
)

achievement(
    title = "The King of Fighters '97 1CC", points = 25,
    description = "Finish the game in Team Play mode using only 1 credit (P1)",
    id = 72637, badge = "78485", published = "25/02/2019 03:26:59", modified = "17/05/2020 00:44:25",
    trigger = no_unibios() && global_resetif_notplaying() && p1_active_state() > 0 && never(p2_active_state() != 0) && 
              never(game_mode() != MODE_TEAMPLAY) &&
              once(arcade_teams_defeated() == 0 && game_bgm() == 0x25) &&
              trigger_when(team_play_game_beaten()) &&
              never(p1_active_state() == 2)
)

achievement(
    title = "The Advanced of Fighters '97", points = 10,
    description = "Finish the game in Team Play mode using Advanced Mode (P1)",
    id = 73228, badge = "78487", published = "08/03/2019 01:41:21", modified = "17/05/2020 00:22:33",
    trigger = no_unibios() && never(p2_active_state() != 0) && 
              never(game_mode() != MODE_TEAMPLAY) &&
              once(arcade_teams_defeated() == 0 && game_bgm() == 0x25) && 
              trigger_when(team_play_game_beaten()) &&
              p1_fight_mode() == 0 &&
              never(p1_fight_mode() != 0 && arcade_teams_defeated_16bits() > prev(arcade_teams_defeated_16bits()))
)

achievement(
    title = "The Extra of Fighters '97", points = 10,
    description = "Finish the game in Team Play mode using only Extra Mode (P1)",
    id = 73229, badge = "78486", published = "08/03/2019 01:41:29", modified = "17/05/2020 03:20:56",
    trigger = no_unibios() && never(p2_active_state() != 0) && 
              never(game_mode() != MODE_TEAMPLAY) &&
              once(arcade_teams_defeated() == 0 && game_bgm() == 0x25) && 
              trigger_when(team_play_game_beaten()) &&
              p1_fight_mode() == 1 &&
              never(p1_fight_mode() != 1 && arcade_teams_defeated_16bits() > prev(arcade_teams_defeated_16bits()))
)

// =========================================
//                  Combos              
// =========================================

achievement(
    title = "The King of Kusanagi Kobujutsu Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 15 hits playing as Kyo Kusanagi (P1, could use P2 assistance)",
    id = 74692, badge = "560998", published = "03/04/2019 04:45:08", modified = "28/09/2019 18:18:01",
    trigger = no_unibios() && game_region() == 7 &&
              ((unless(game_region() != 7) && unless(p1_active_character() != 0) && unless(p1_1st_character() != 0) &&
                unless(p1_special_character_bit0() != 0) && p1_hits() == 21) ||
               (unless(game_region() != 7) && unless(p1_active_character() != 0) && unless(p2_active_state() != 0) &&
                unless(p1_2nd_character() != 0) && unless(p1_special_character_bit1() != 0) && p1_hits() == 21) ||
               (unless(game_region() != 7) && unless(p1_active_character() != 0) && unless(p2_active_state() != 0) &&
                unless(p1_3rd_character() != 0) && unless(p1_special_character_bit2() != 0) && p1_hits() == 21))
)

achievement(
    title = "The King of Electric Shoot Boxing Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 11 hits playing as Benimaru Nikaido (P1, could use P2 assistance)",
    id = 74693, badge = "561004", published = "03/04/2019 04:45:10", modified = "01/10/2019 18:49:02",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 1) && p1_hits() == 17
)

achievement(
    title = "The King of Powerful Judo Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 3 hits playing as Goro Daimon (P1, could use P2 assistance)",
    id = 74694, badge = "560999", published = "03/04/2019 04:45:13", modified = "28/09/2019 18:18:01",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 2) && p1_hits() == 3
)

achievement(
    title = "The King of Street Style Hakkyokuseiken Chi Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 13 hits playing as Terry Bogard (P1, could use P2 assistance)",
    id = 74695, badge = "561000", published = "03/04/2019 04:45:16", modified = "01/10/2019 18:49:02",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 3) && p1_hits() == 19
)

achievement(
    title = "The King of Shiranui-ryuu Hakkyokuseiken Chi Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 22 hits playing as Andy Bogard (P1, could use P2 assistance)",
    id = 74696, badge = "561001", published = "03/04/2019 04:45:18", modified = "01/10/2019 18:49:02",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 4) && p1_hits() == 34
)

achievement(
    title = "The King of Hurricane Muay Thai Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 13 hits playing as Joe Hagashi (P1, could use P2 assistance)",
    id = 74697, badge = "561002", published = "03/04/2019 04:45:20", modified = "13/10/2019 21:32:01",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 5) && p1_hits() == 19
)

achievement(
    title = "The King of Next Kyokugenryu Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 28 hits playing as Ryo Sakazaki (P1, could use P2 assistance)",
    id = 74698, badge = "561003", published = "03/04/2019 04:45:22", modified = "18/07/2019 02:59:49",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 6) && p1_hits() == 40
)

achievement(
    title = "The King of Latin Kyokugenryu Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 28 hits playing as Robert Garcia (P1, could use P2 assistance)",
    id = 74699, badge = "561005", published = "03/04/2019 04:45:25", modified = "18/07/2019 02:59:51",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 7) && p1_hits() == 40
)

achievement(
    title = "The King of Gymnastic Kyokugenryu Karate Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 28 hits playing as Yuri Sakazaki (P1, could use P2 assistance)",
    id = 74700, badge = "561006", published = "03/04/2019 04:45:28", modified = "18/07/2019 02:59:52",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 8) && p1_hits() == 40
)

achievement(
    title = "The King of Piercing Assassin Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 13 hits playing as Leona Haidern (P1, could use P2 assistance)",
    id = 74701, badge = "561007", published = "03/04/2019 04:45:31", modified = "17/09/2023 12:30:42",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 9) && p1_hits() == 19
)

achievement(
    title = "The King of Firework Assassin Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 13 hits playing as Ralf Jones (P1, could use P2 assistance)",
    id = 74702, badge = "561008", published = "03/04/2019 04:45:33", modified = "17/09/2023 12:30:42",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 10) && p1_hits() == 19
)

achievement(
    title = "The King of Wrestling Assassin Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 6 hits playing as Clark Still (P1, could use P2 assistance)",
    id = 74703, badge = "561009", published = "03/04/2019 04:45:36", modified = "28/09/2019 18:18:01",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 11) && p1_hits() == 6
)

achievement(
    title = "The King of Psychic Power Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 34 hits playing as Athena Asamiya (P1, could use P2 assistance)",
    id = 74704, badge = "561010", published = "03/04/2019 04:45:38", modified = "01/10/2019 18:49:02",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 12) && p1_hits() == 52
)

achievement(
    title = "The King of Wing Chun Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 21 hits playing as Sie Kensou (P1, could use P2 assistance)",
    id = 74705, badge = "561011", published = "03/04/2019 04:45:41", modified = "01/10/2019 18:49:02",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 13) && p1_hits() == 33
)

achievement(
    title = "The King of Zui Quan Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 27 hits playing as Chin Gentsai (P1, could use P2 assistance)",
    id = 74706, badge = "561012", published = "03/04/2019 04:45:43", modified = "01/10/2019 18:49:02",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 14) && p1_hits() == 39
)

achievement(
    title = "The King of Kagura Ancient Arts Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 28 hits playing as Chizuru Kagura (P1, could use P2 assistance)",
    id = 74707, badge = "561013", published = "03/04/2019 04:45:45", modified = "01/10/2019 18:49:02",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 15) && p1_hits() == 40
)

achievement(
    title = "The King of Shiranui-ryuu Ninjutsu Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 31 hits playing as Mai Shiranui (P1, could use P2 assistance)",
    id = 74708, badge = "561014", published = "03/04/2019 04:45:48", modified = "01/10/2019 18:49:02",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 16) && p1_hits() == 49
)

achievement(
    title = "The King of Illusion Muay Thai Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 20 hits playing as King (P1, could use P2 assistance)",
    id = 74709, badge = "561015", published = "03/04/2019 04:45:50", modified = "01/10/2019 18:49:02",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 17) && p1_hits() == 32
)

achievement(
    title = "The King of Sunsuhan Taekwondo Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 24 hits playing as Kim Kaphwan (P1, could use P2 assistance)",
    id = 74710, badge = "561016", published = "03/04/2019 04:45:52", modified = "01/10/2019 18:49:02",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 18) && p1_hits() == 36
)

achievement(
    title = "The King of Power Strike Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 18 hits playing as Chang Koehan (P1, could use P2 assistance)",
    id = 74711, badge = "561017", published = "03/04/2019 04:45:56", modified = "01/10/2019 18:49:02",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 19) && p1_hits() == 24
)

achievement(
    title = "The King of Speed Brawling Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 30 hits playing as Choi Bounge (P1, could use P2 assistance)",
    id = 74712, badge = "561018", published = "03/04/2019 04:46:15", modified = "18/07/2019 03:00:14",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 20) && p1_hits() == 48
)

achievement(
    title = "The King of Power Attack Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 27 hits playing as Yashiro Nanakase (P1, could use P2 assistance)",
    id = 74713, badge = "561019", published = "03/04/2019 04:46:18", modified = "18/07/2019 03:00:17",
    trigger = no_unibios() && game_region() == 7 &&
              ((unless(game_region() != 7) && unless(p1_active_character() != 21) && unless(p1_1st_character() != 21) &&
                unless(p1_special_character_bit0() != 0) && p1_hits() == 39) ||
               (unless(game_region() != 7) && unless(p1_active_character() != 21) && unless(p1_2nd_character() != 21) &&
                unless(p1_special_character_bit1() != 0) && p1_hits() == 39) ||
               (unless(game_region() != 7) && unless(p1_active_character() != 21) && unless(p1_3rd_character() != 21) &&
                unless(p1_special_character_bit2() != 0) && p1_hits() == 39))
)

achievement(
    title = "The King of Throw Attack Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 4 hits playing as Shermie (P1, could use P2 assistance)",
    id = 74714, badge = "561020", published = "03/04/2019 04:46:20", modified = "18/07/2019 03:00:19",
    trigger = no_unibios() && game_region() == 7 &&
              ((unless(game_region() != 7) && unless(p1_active_character() != 22) && unless(p1_1st_character() != 22) &&
                unless(p1_special_character_bit0() != 0) && p1_hits() == 4) ||
               (unless(game_region() != 7) && unless(p1_active_character() != 22) && unless(p1_2nd_character() != 22) &&
                unless(p1_special_character_bit1() != 0) && p1_hits() == 4) ||
               (unless(game_region() != 7) && unless(p1_active_character() != 22) && unless(p1_3rd_character() != 22) &&
                unless(p1_special_character_bit2() != 0) && p1_hits() == 4))
)

achievement(
    title = "The King of Energetic Speedy Attack Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 15 hits playing as Chris (P1, could use P2 assistance)",
    id = 74715, badge = "561021", published = "03/04/2019 04:46:22", modified = "01/10/2019 18:49:02",
    trigger = no_unibios() && game_region() == 7 &&
              ((unless(game_region() != 7) && unless(p1_active_character() != 23) && unless(p1_1st_character() != 23) &&
                unless(p1_special_character_bit0() != 0) && p1_hits() == 21) ||
               (unless(game_region() != 7) && unless(p1_active_character() != 23) && unless(p1_2nd_character() != 23) &&
                unless(p1_special_character_bit1() != 0) && p1_hits() == 21) ||
               (unless(game_region() != 7) && unless(p1_active_character() != 23) && unless(p1_3rd_character() != 23) &&
                unless(p1_special_character_bit2() != 0) && p1_hits() == 21))
)

achievement(
    title = "The King of Personal Homicide Style Hits ''97", points = 5,
    description = "Perform a combination of attacks with at least 43 hits playing as Ryuji Yamazaki (P1, could use P2 assistance)",
    id = 74716, badge = "561022", published = "03/04/2019 04:46:24", modified = "18/07/2019 03:00:22",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 24) && p1_hits() == 67
)

achievement(
    title = "The King of Commando Sambo Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 31 hits playing as Blue Mary (P1, could use P2 assistance)",
    id = 74717, badge = "561023", published = "03/04/2019 04:46:27", modified = "18/07/2019 03:00:25",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 25) && p1_hits() == 49
)

achievement(
    title = "The King of Santetsukon Bojutsu Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 10 hits playing as Billy Kane (P1, could use P2 assistance)",
    id = 74718, badge = "561024", published = "03/04/2019 04:46:30", modified = "18/07/2019 03:00:26",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 26) && p1_hits() == 16
)

achievement(
    title = "The King of Yagami Style Pure Instinct Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 11 hits playing as Iori Yagami (P1, could use P2 assistance)",
    id = 74719, badge = "561025", published = "03/04/2019 04:46:32", modified = "18/07/2019 03:00:28",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 27) && p1_hits() == 17
)

achievement(
    title = "The King of Imitation Kusanagi Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 9 hits playing as Shingo Yabuki (P1, could use P2 assistance)",
    id = 74720, badge = "561026", published = "03/04/2019 04:46:37", modified = "17/09/2023 12:30:43",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 31) && p1_hits() == 9
)

achievement(
    title = "The King of Orochi Terra Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 3 hits playing as Orochi Yashiro (P1, could use P2 assistance)",
    id = 74721, badge = "561027", published = "03/04/2019 04:47:21", modified = "18/07/2019 03:00:31",
    trigger = no_unibios() && game_region() == 7 &&
              ((unless(game_region() != 7) && unless(p1_active_character() != 21) && unless(p1_1st_character() != 21) &&
                unless(p1_special_character_bit0() != 1) && p1_hits() == 3) ||
               (unless(game_region() != 7) && unless(p1_active_character() != 21) && unless(p1_2nd_character() != 21) &&
                unless(p1_special_character_bit1() != 1) && p1_hits() == 3) ||
               (unless(game_region() != 7) && unless(p1_active_character() != 21) && unless(p1_3rd_character() != 21) &&
                unless(p1_special_character_bit2() != 1) && p1_hits() == 3))
)

achievement(
    title = "The King of Orochi Lightning Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 10 hits playing as Orochi Shermie (P1, could use P2 assistance)",
    id = 74722, badge = "561028", published = "03/04/2019 04:47:23", modified = "01/10/2019 18:49:02",
    trigger = no_unibios() && game_region() == 7 &&
              ((unless(game_region() != 7) && unless(p1_active_character() != 22) && unless(p1_1st_character() != 22) &&
                unless(p1_special_character_bit0() != 1) && p1_hits() == 16) ||
               (unless(game_region() != 7) && unless(p1_active_character() != 22) && unless(p1_2nd_character() != 22) &&
                unless(p1_special_character_bit1() != 1) && p1_hits() == 16) ||
               (unless(game_region() != 7) && unless(p1_active_character() != 22) && unless(p1_3rd_character() != 22) &&
                unless(p1_special_character_bit2() != 1) && p1_hits() == 16))
)

achievement(
    title = "The King of Orochi Flame Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 11 hits playing as Orochi Chris (P1, could use P2 assistance)",
    id = 74723, badge = "561029", published = "03/04/2019 04:47:26", modified = "01/10/2019 18:49:02",
    trigger = no_unibios() && game_region() == 7 &&
              ((unless(game_region() != 7) && unless(p1_active_character() != 23) && unless(p1_1st_character() != 23) &&
                unless(p1_special_character_bit0() != 1) && p1_hits() == 17) ||
               (unless(game_region() != 7) && unless(p1_active_character() != 23) && unless(p1_2nd_character() != 23) &&
                unless(p1_special_character_bit1() != 1) && p1_hits() == 17) ||
               (unless(game_region() != 7) && unless(p1_active_character() != 23) && unless(p1_3rd_character() != 23) &&
                unless(p1_special_character_bit2() != 1) && p1_hits() == 17))
)

achievement(
    title = "The King of Orochi-Yagami Style Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 10 hits playing as Orochi Iori (P1, could use P2 assistance)",
    id = 74724, badge = "561030", published = "03/04/2019 04:47:28", modified = "01/10/2019 18:49:02",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 28) && p1_hits() == 16
)

achievement(
    title = "The King of Orochi Piercing Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 13 hits playing as Orochi Leona (P1, could use P2 assistance)",
    id = 74725, badge = "561031", published = "03/04/2019 04:47:30", modified = "01/10/2019 18:49:02",
    trigger = no_unibios() && unless(game_region() != 7) &&
              never(p1_active_character() != 29) && p1_hits() == 19
)

achievement(
    title = "The King of New Kusanagi Original Hits '97", points = 5,
    description = "Perform a combination of attacks with at least 6 hits playing as '94 Kyo Kusanagi (P1, could use P2 assistance)",
    id = 74726, badge = "561032", published = "03/04/2019 04:47:32", modified = "17/09/2023 12:30:43",
    trigger = no_unibios() && game_region() == 7 &&
              ((unless(game_region() != 7) && unless(p1_active_character() != 0) && unless(p1_1st_character() != 0) &&
                unless(p1_special_character_bit0() != 1) && p1_hits() == 6) ||
               (unless(game_region() != 7) && unless(p1_active_character() != 0) && unless(p1_2nd_character() != 0) &&
                unless(p1_special_character_bit1() != 1) && p1_hits() == 6) ||
               (unless(game_region() != 7) && unless(p1_active_character() != 0) && unless(p1_3rd_character() != 0) &&
                unless(p1_special_character_bit2() != 1) && p1_hits() == 6))
)



// =========================================
//               Leaderboards              
// =========================================

leaderboard("The King of Speedrun", "Best time in Survival mode",
           start = no_unibios() && never(p2_active_state() != 0) && game_mode() == MODE_SURVIVOR_TIME &&
                   game_arena() == 7 && p2_active_character() == 30 &&
                   p2_rounds_lost() == 3 && prev(p2_rounds_lost()) == 0,
           cancel = always_false(),
           submit = always_true(),
           value = (survival_timer_2() * 0x10000) + survival_timer_1() ,
           format = "CENTISECONDS", lower_is_better=true
           )3