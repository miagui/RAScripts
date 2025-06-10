// SNK vs. Capcom: The Match of the Millennium
// #ID = 10236

function game_mode() => byte(0x0007E5)
function game_screen_16bits() => word(0x00085C)
function game_screen() => byte(0x00085D)

function p1_character_slot_1_ingame() => byte(0x0008A0)
function p1_character_slot_2_ingame() => byte(0x0008A1)
function p1_character_slot_3_ingame() => byte(0x0008A2)

function game_teammode_select() => byte(0x0008E3)
function game_ladder_position() => byte(0x0008EA)
function game_rival_defeated_on_tourney_rival_defeated() => bit0(0x0008FE)

function settings_level() => byte(0x000FCA)
function settings_winning_point_rounds() => byte(0x000FCC)
function settings_stage() => byte(0x000FD9)

function record_single_wins() => word(0x00100E)
function record_tag_wins() => word(0x001010)
function record_team_wins() => word(0x001012)

// =========================================
//                 Utility              
// =========================================

function p1_tag_has_char(char_id) => __ornext(p1_character_slot_1_ingame() == char_id || p1_character_slot_2_ingame() == char_id)
function p1_team_has_char(char_id) => __ornext(p1_character_slot_1_ingame() == char_id || p1_character_slot_2_ingame() == char_id || p1_character_slot_3_ingame() == char_id)

function p1_won_match() {
    return (
        __ornext(record_single_wins() != prev(record_single_wins()) ||
                 record_tag_wins() != prev(record_tag_wins()) ||
                 record_team_wins() != prev(record_team_wins())
        )
        
    )
}

achievement(
    title = "The Soldiers", points = 10, type="progression",
    description = "Beat the entire game with Leona and Guile (Normal difficulty).",
    id = 156249, badge = "175979", published = "31/05/2021 02:25:42", modified = "03/10/2024 18:35:09",
    trigger = once(game_ladder_position() == 0 && game_screen() == 0x7e) &&
              game_mode() == 0 && 
              game_teammode_select() == 1 &&
              never((p1_won_match() && p1_character_slot_1_ingame() != 4 && p1_character_slot_1_ingame() != 17)) &&
              never((p1_won_match() && p1_character_slot_2_ingame() != 4 && p1_character_slot_2_ingame() != 17)) &&
              trigger_when(p1_won_match()) && 
              p1_tag_has_char(4) &&
              p1_tag_has_char(17) &&
              settings_level() >= 2 &&
              settings_stage() == 0 &&
              (
                (trigger_when(p1_won_match() && game_ladder_position() == 7 && game_rival_defeated_on_tourney_rival_defeated() == 0)) ||
                (trigger_when(p1_won_match() && game_ladder_position() == 8 && game_rival_defeated_on_tourney_rival_defeated() == 1))
              )
)

achievement(
    title = "Heroines", points = 10, type="progression",
    description = "Beat the entire game with Athena and Sakura (Normal difficulty).",
    id = 156250, badge = "175980", published = "31/05/2021 02:25:42", modified = "03/10/2024 18:35:10",
    trigger = once(game_ladder_position() == 0 && game_screen() == 0x7e) &&
              game_mode() == 0 && 
              game_teammode_select() == 1 &&
              never((p1_won_match() && p1_character_slot_1_ingame() != 14 && p1_character_slot_1_ingame() != 5)) &&
              never((p1_won_match() && p1_character_slot_2_ingame() != 14 && p1_character_slot_2_ingame() != 5)) &&
              p1_tag_has_char(14) &&
              p1_tag_has_char(5) &&
              settings_level() >= 2 &&
              settings_stage() == 0 &&
              (
                (trigger_when(p1_won_match() && game_ladder_position() == 7 && game_rival_defeated_on_tourney_rival_defeated() == 0)) ||
                (trigger_when(p1_won_match() && game_ladder_position() == 8 && game_rival_defeated_on_tourney_rival_defeated() == 1))
              )
)

achievement(
    title = "Nightmares", points = 10,
    description = "Beat the entire game with Orochi Iori and Evil Ryu (Normal difficulty).",
    id = 156251, badge = "175981", published = "31/05/2021 02:25:42", modified = "03/10/2024 18:35:10",
    trigger = once(game_ladder_position() == 0 && game_screen() == 0x7e) &&
              game_mode() == 0 && 
              game_teammode_select() == 1 &&
              never((p1_won_match() && p1_character_slot_1_ingame() != 22 && p1_character_slot_1_ingame() != 23)) &&
              never((p1_won_match() && p1_character_slot_2_ingame() != 22 && p1_character_slot_2_ingame() != 23)) &&
              p1_tag_has_char(22) &&
              p1_tag_has_char(23) &&
              settings_level() >= 2 &&
              settings_stage() == 0 &&
              (
                (trigger_when(p1_won_match() && game_ladder_position() == 7 && game_rival_defeated_on_tourney_rival_defeated() == 0)) ||
                (trigger_when(p1_won_match() && game_ladder_position() == 8 && game_rival_defeated_on_tourney_rival_defeated() == 1))
              )
)

achievement(
    title = "Team Mighty", points = 10, type="progression",
    description = "Beat the entire game with Kyo and Ryu (Normal difficulty).",
    id = 156252, badge = "175982", published = "31/05/2021 02:25:43", modified = "03/10/2024 18:35:10",
    trigger = once(game_ladder_position() == 0 && game_screen() == 0x7e) &&
              game_mode() == 0 && 
              game_teammode_select() == 1 &&
              never((p1_won_match() && p1_character_slot_1_ingame() != 0 && p1_character_slot_1_ingame() != 9)) &&
              never((p1_won_match() && p1_character_slot_2_ingame() != 0 && p1_character_slot_2_ingame() != 9)) &&
              p1_tag_has_char(0) &&
              p1_tag_has_char(9) &&
              settings_level() >= 2 &&
              settings_stage() == 0 &&
              (
                (trigger_when(p1_won_match() && game_ladder_position() == 7 && game_rival_defeated_on_tourney_rival_defeated() == 0)) ||
                (trigger_when(p1_won_match() && game_ladder_position() == 8 && game_rival_defeated_on_tourney_rival_defeated() == 1))
              )
)

achievement(
    title = "USA Heroes", points = 10, type="progression",
    description = "Beat the entire game with Terry and Ken (Normal difficulty).",
    id = 156253, badge = "175983", published = "31/05/2021 02:25:43", modified = "03/10/2024 18:35:11",
    trigger = once(game_ladder_position() == 0 && game_screen() == 0x7e) &&
              game_mode() == 0 && 
              game_teammode_select() == 1 &&
              never((p1_won_match() && p1_character_slot_1_ingame() != 1 && p1_character_slot_1_ingame() != 12)) &&
              never((p1_won_match() && p1_character_slot_2_ingame() != 1 && p1_character_slot_2_ingame() != 12)) &&
              p1_tag_has_char(1) &&
              p1_tag_has_char(12) &&
              settings_level() >= 2 &&
              settings_stage() == 0 &&
              (
                (trigger_when(p1_won_match() && game_ladder_position() == 7 && game_rival_defeated_on_tourney_rival_defeated() == 0)) ||
                (trigger_when(p1_won_match() && game_ladder_position() == 8 && game_rival_defeated_on_tourney_rival_defeated() == 1))
              )
)

achievement(
    title = "Fight Queens", points = 10, type="progression",
    description = "Beat the entire game with Mai and Chun-Li (Normal difficulty).",
    id = 156254, badge = "175984", published = "31/05/2021 02:25:43", modified = "03/10/2024 18:35:11",
    trigger = once(game_ladder_position() == 0 && game_screen() == 0x7e) &&
              game_mode() == 0 && 
              game_teammode_select() == 1 &&
              never((p1_won_match() && p1_character_slot_1_ingame() != 3 && p1_character_slot_1_ingame() != 10)) &&
              never((p1_won_match() && p1_character_slot_2_ingame() != 3 && p1_character_slot_2_ingame() != 10)) &&
              p1_tag_has_char(3) &&
              p1_tag_has_char(10) &&
              settings_level() >= 2 &&
              settings_stage() == 0 &&
              (
                (trigger_when(p1_won_match() && game_ladder_position() == 7 && game_rival_defeated_on_tourney_rival_defeated() == 0)) ||
                (trigger_when(p1_won_match() && game_ladder_position() == 8 && game_rival_defeated_on_tourney_rival_defeated() == 1))
              )
)

achievement(
    title = "Dark Duo", points = 10,
    description = "Beat the entire game with Iori and Akuma (Normal difficulty).",
    id = 156255, badge = "175985", published = "31/05/2021 02:25:44", modified = "03/10/2024 18:35:12",
    trigger = once(game_ladder_position() == 0 && game_screen() == 0x7e) &&
              game_mode() == 0 && 
              game_teammode_select() == 1 &&
              never((p1_won_match() && p1_character_slot_1_ingame() != 6 && p1_character_slot_1_ingame() != 21)) &&
              never((p1_won_match() && p1_character_slot_2_ingame() != 6 && p1_character_slot_2_ingame() != 21)) &&
              p1_tag_has_char(6) &&
              p1_tag_has_char(21) &&
              settings_level() >= 2 &&
              settings_stage() == 0 &&
              (
                (trigger_when(p1_won_match() && game_ladder_position() == 7 && game_rival_defeated_on_tourney_rival_defeated() == 0)) ||
                (trigger_when(p1_won_match() && game_ladder_position() == 8 && game_rival_defeated_on_tourney_rival_defeated() == 1))
              )
)

achievement(
    title = "B&G Alliance", points = 10,
    description = "Beat the entire game with Geese and M. Bison (Normal difficulty).",
    id = 156256, badge = "175986", published = "31/05/2021 02:25:44", modified = "03/10/2024 18:35:12",
    trigger = once(game_ladder_position() == 0 && game_screen() == 0x7e) &&
              game_mode() == 0 && 
              game_teammode_select() == 1 &&
              never((p1_won_match() && p1_character_slot_1_ingame() != 24 && p1_character_slot_1_ingame() != 25)) &&
              never((p1_won_match() && p1_character_slot_2_ingame() != 24 && p1_character_slot_2_ingame() != 25)) &&
              p1_tag_has_char(24) &&
              p1_tag_has_char(25) &&
              settings_level() >= 2 &&
              settings_stage() == 0 &&
              (
                (trigger_when(p1_won_match() && game_ladder_position() == 7 && game_rival_defeated_on_tourney_rival_defeated() == 0)) ||
                (trigger_when(p1_won_match() && game_ladder_position() == 8 && game_rival_defeated_on_tourney_rival_defeated() == 1))
              )
)

achievement(
    title = "The Big Bros", points = 10, type="progression",
    description = "Beat the entire game with Ryo and Dan (Normal difficulty).",
    id = 156257, badge = "175987", published = "31/05/2021 02:25:44", modified = "03/10/2024 18:35:12",
    trigger = once(game_ladder_position() == 0 && game_screen() == 0x7e) &&
              game_mode() == 0 && 
              game_teammode_select() == 1 &&
              never((p1_won_match() && p1_character_slot_1_ingame() != 2 && p1_character_slot_1_ingame() != 13)) &&
              never((p1_won_match() && p1_character_slot_2_ingame() != 2 && p1_character_slot_2_ingame() != 13)) &&
              p1_tag_has_char(2) &&
              p1_tag_has_char(13) &&
              settings_level() >= 2 &&
              settings_stage() == 0 &&
              (
                (trigger_when(p1_won_match() && game_ladder_position() == 7 && game_rival_defeated_on_tourney_rival_defeated() == 0)) ||
                (trigger_when(p1_won_match() && game_ladder_position() == 8 && game_rival_defeated_on_tourney_rival_defeated() == 1))
              )
)

achievement(
    title = "Duo Kyokugen", points = 10,
    description = "Beat the entire game with Ryo and Yuri (Normal difficulty).",
    id = 156258, badge = "175988", published = "31/05/2021 02:25:45", modified = "03/10/2024 18:35:13",
    trigger = once(game_ladder_position() == 0 && game_screen() == 0x7e) &&
              game_mode() == 0 && 
              game_teammode_select() == 1 &&
              never((p1_won_match() && p1_character_slot_1_ingame() != 2 && p1_character_slot_1_ingame() != 18)) &&
              never((p1_won_match() && p1_character_slot_2_ingame() != 2 && p1_character_slot_2_ingame() != 18)) &&
              p1_tag_has_char(2) &&
              p1_tag_has_char(18) &&
              settings_level() >= 2 &&
              settings_stage() == 0 &&
              (
                (trigger_when(p1_won_match() && game_ladder_position() == 7 && game_rival_defeated_on_tourney_rival_defeated() == 0)) ||
                (trigger_when(p1_won_match() && game_ladder_position() == 8 && game_rival_defeated_on_tourney_rival_defeated() == 1))
              )
)

achievement(
    title = "Team Vampire", points = 10,
    description = "Beat the entire game with Morrigan, B. B. Hood and Felicia (Normal difficulty).",
    id = 156259, badge = "175989", published = "31/05/2021 02:25:45", modified = "03/10/2024 18:35:13",
    trigger = once(game_ladder_position() == 0 && game_screen() == 0x7e) &&
              game_mode() == 0 && 
              game_teammode_select() == 2 &&
              never((p1_won_match() && p1_character_slot_1_ingame() != 15 && p1_character_slot_1_ingame() != 20 &&
                  p1_character_slot_1_ingame() != 16)
              ) &&
              never((p1_won_match() && p1_character_slot_2_ingame() != 15 && p1_character_slot_2_ingame() != 20 &&
                  p1_character_slot_2_ingame() != 16)
              ) &&
              never((p1_won_match() && p1_character_slot_3_ingame() != 15 && p1_character_slot_3_ingame() != 20 &&
                  p1_character_slot_3_ingame() != 16)
              ) &&
              p1_team_has_char(15) &&
              p1_team_has_char(20) &&
              p1_team_has_char(16) &&
              settings_level() >= 2 &&
              settings_stage() == 0 &&
              (
                (trigger_when(p1_won_match() && game_ladder_position() == 7 && game_rival_defeated_on_tourney_rival_defeated() == 0)) ||
                (trigger_when(p1_won_match() && game_ladder_position() == 8 && game_rival_defeated_on_tourney_rival_defeated() == 1))
              )
)

achievement(
    title = "Team SF2", points = 10, type="progression",
    description = "Beat the entire game with Chun-Li, Zangief and Guile (Normal difficulty).",
    id = 156260, badge = "175990", published = "31/05/2021 02:25:46", modified = "03/10/2024 18:35:14",
    trigger = once(game_ladder_position() == 0 && game_screen() == 0x7e) &&
              game_mode() == 0 && 
              game_teammode_select() == 2 &&
              never((p1_won_match() && p1_character_slot_1_ingame() != 10 && p1_character_slot_1_ingame() != 11 &&
                  p1_character_slot_1_ingame() != 17)
              ) &&
              never((p1_won_match() && p1_character_slot_2_ingame() != 10 && p1_character_slot_2_ingame() != 11 &&
                  p1_character_slot_2_ingame() != 17)
              ) &&
              never((p1_won_match() && p1_character_slot_3_ingame() != 10 && p1_character_slot_3_ingame() != 11 &&
                  p1_character_slot_3_ingame() != 17)
              ) &&
              p1_team_has_char(10) &&
              p1_team_has_char(11) &&
              p1_team_has_char(17) &&
              settings_level() >= 2 &&
              settings_stage() == 0 &&
              (
                (trigger_when(p1_won_match() && game_ladder_position() == 7 && game_rival_defeated_on_tourney_rival_defeated() == 0)) ||
                (trigger_when(p1_won_match() && game_ladder_position() == 8 && game_rival_defeated_on_tourney_rival_defeated() == 1))
              )
)

achievement(
    title = "The Blades", points = 10,
    description = "Beat the entire game with Nakoruru, Haohmaru and Akari (Normal difficulty).",
    id = 156261, badge = "175991", published = "31/05/2021 02:25:46", modified = "03/10/2024 18:35:14",
    trigger = once(game_ladder_position() == 0 && game_screen() == 0x7e) &&
              game_mode() == 0 && 
              game_teammode_select() == 2 &&
              never((p1_won_match() && p1_character_slot_1_ingame() != 8 && p1_character_slot_1_ingame() != 7 &&
                  p1_character_slot_1_ingame() != 19)
              ) &&
              never((p1_won_match() && p1_character_slot_2_ingame() != 8 && p1_character_slot_2_ingame() != 7 &&
                  p1_character_slot_2_ingame() != 19)
              ) &&
              never((p1_won_match() && p1_character_slot_3_ingame() != 8 && p1_character_slot_3_ingame() != 7 &&
                  p1_character_slot_3_ingame() != 19)
              ) &&
              p1_team_has_char(8) &&
              p1_team_has_char(7) &&
              p1_team_has_char(19) &&
              settings_level() >= 2 &&
              settings_stage() == 0 &&
              (
                (trigger_when(p1_won_match() && game_ladder_position() == 7 && game_rival_defeated_on_tourney_rival_defeated() == 0)) ||
                (trigger_when(p1_won_match() && game_ladder_position() == 8 && game_rival_defeated_on_tourney_rival_defeated() == 1))
              )
)

achievement(
    title = "SNK Heroines", points = 10,
    description = "Beat the entire game with Mai, Athena and Yuri (Normal difficulty).",
    id = 156265, badge = "175995", published = "31/05/2021 02:25:48", modified = "03/10/2024 18:35:14",
    trigger = once(game_ladder_position() == 0 && game_screen() == 0x7e) &&
              game_mode() == 0 && 
              game_teammode_select() == 2 &&
              never((p1_won_match() && p1_character_slot_1_ingame() != 3 && p1_character_slot_1_ingame() != 5 &&
                  p1_character_slot_1_ingame() != 18)
              ) &&
              never((p1_won_match() && p1_character_slot_2_ingame() != 3 && p1_character_slot_2_ingame() != 5 &&
                  p1_character_slot_2_ingame() != 18)
              ) &&
              never((p1_won_match() && p1_character_slot_3_ingame() != 3 && p1_character_slot_3_ingame() != 5 &&
                  p1_character_slot_3_ingame() != 18)
              ) &&
              p1_team_has_char(3) &&
              p1_team_has_char(5) &&
              p1_team_has_char(18) &&
              settings_level() >= 2 &&
              settings_stage() == 0 &&
              (
                (trigger_when(p1_won_match() && game_ladder_position() == 7 && game_rival_defeated_on_tourney_rival_defeated() == 0)) ||
                (trigger_when(p1_won_match() && game_ladder_position() == 8 && game_rival_defeated_on_tourney_rival_defeated() == 1))
              )
)

achievement(
    title = "SNK Heroes", points = 10, type="progression",
    description = "Beat the entire game with Kyo, Ryo and Terry (Normal difficulty).",
    id = 156266, badge = "175996", published = "31/05/2021 02:25:48", modified = "03/10/2024 18:35:15",
    trigger = once(game_ladder_position() == 0 && game_screen() == 0x7e) &&
              game_mode() == 0 && 
              game_teammode_select() == 2 &&
              never((p1_won_match() && p1_character_slot_1_ingame() != 0 && p1_character_slot_1_ingame() != 2 && p1_character_slot_1_ingame() != 1)) &&
              never((p1_won_match() && p1_character_slot_2_ingame() != 0 && p1_character_slot_2_ingame() != 2 && p1_character_slot_2_ingame() != 1)) &&
              never((p1_won_match() && p1_character_slot_3_ingame() != 0 && p1_character_slot_3_ingame() != 2 && p1_character_slot_3_ingame() != 1)) &&
              p1_team_has_char(0) &&
              p1_team_has_char(2) &&
              p1_team_has_char(1) &&
              settings_level() >= 2 &&
              settings_stage() == 0 &&
              (
                (trigger_when(p1_won_match() && game_ladder_position() == 7 && game_rival_defeated_on_tourney_rival_defeated() == 0)) ||
                (trigger_when(p1_won_match() && game_ladder_position() == 8 && game_rival_defeated_on_tourney_rival_defeated() == 1))
              )
)

achievement(
    title = "\"The most oppressed group of all, Gamers!\"", points = 25,
    description = "Beat the game on Gamer difficulty (Winning Point 2).",
    id = 156262, badge = "175992", published = "31/05/2021 02:25:47", modified = "03/10/2024 18:35:15",
    trigger = game_mode() == 0 &&
              p1_won_match() && settings_level() == 5 && settings_winning_point_rounds() >= 1 && settings_stage() == 0 &&
              (
                (trigger_when(p1_won_match() && game_ladder_position() == 7 && game_rival_defeated_on_tourney_rival_defeated() == 0)) ||
                (trigger_when(p1_won_match() && game_ladder_position() == 8 && game_rival_defeated_on_tourney_rival_defeated() == 1))
              )
)

achievement(
    title = "Match of the Millenium", points = 10,
    description = "Beat the game without using a continue (Normal difficulty, Winning Point 2).",
    id = 156298, badge = "176028", published = "31/05/2021 02:25:59", modified = "03/10/2024 18:35:15",
    trigger = once(game_ladder_position() == 0 && game_screen() == 0x7e) && 
              game_mode() == 0 && 
              never(game_screen_16bits() == 42404) &&
              settings_level() >= 2 && settings_winning_point_rounds() >= 1 && settings_stage() == 0 &&
              (
                ((trigger_when(p1_won_match() && game_rival_defeated_on_tourney_rival_defeated() == 0 && game_ladder_position() == 7))) ||
                ((trigger_when(p1_won_match() && game_rival_defeated_on_tourney_rival_defeated() == 1 && game_ladder_position() == 8)))
              )
)
