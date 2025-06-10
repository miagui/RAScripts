// King of Fighters '95, The
// #ID = 12029

// =========================================
//             Memory Accessors              
// =========================================

// Settings
function soft_dip_setup_difficulty() => byte(0x00FD8F)
function soft_dip_setup_gamemode() => byte(0x00FD90)
function soft_dip_setup_mode_mvs() => byte(0x00FD91)

function settings_difficulty_aes() => byte(0x00D873)

// General
function game_unibios() => dword(0x00FE30)
function game_mvs_flag() => byte(0x00FD83)

function game_ending_flag_0x85() => byte(0x000B87)
function game_ending_flag_0x10() => byte(0x000B88)
function game_mode_aes() => byte(0x00A83E)
function game_screen() => dword(0x8114)
         SCREEN_CHAR_SELECT = 0x43544c45
         SCREEN_INGAME = 0x20314552

function arcade_team_defeated() => byte(0x00A7E8)
function arcade_team_defeated_total() => bitcount(0x00A7E8)
function round_timer() => byte(0x00A837)


// P1
function p1_active_state() => byte(0x00FDB7)

function p1_team() => byte(0x00A840)
function p1_character_1() => byte(0x00A842)
function p1_character_2() => byte(0x00A845)
function p1_character_3() => byte(0x00A844)

function p1_characters_selected() => byte(0xa843)

function p1_current_character() => byte(0x008170)
function p1_animation() => word(0x008172)
function p1_gauge() => byte(0x008218)
function p1_hp() => byte(0x008220)
function p1_characters_defeated() => byte(0x008269)

function p1_moving_speed() => word(0x008150)
function p1_move_state() => byte(0x008201)
function p1_move_type() => byte(0x0082B3)


// P2
function p2_active_state() => byte(0x00FDB6)

function p2_team() => byte(0x00A850)
function p2_character_1() => byte(0x00A852)
function p2_character_2() => byte(0x00A855)
function p2_character_3() => byte(0x00A854)

function p2_current_character() => byte(0x008370)
function p2_animation() => word(0x008372)
function p2_gauge() => byte(0x008418)
function p2_hp() => byte(0x008420)
function p2_characters_defeated() => byte(0x8469)


// =========================================
//                  Utility              
// =========================================

function no_unibios() => never(game_unibios() != 0)
function p1_only() => never(p1_active_state() == 0) && never(p2_active_state() > 0)
function p1_only_globalreset() => (always_false() || never(p1_active_state() == 0) && never(p2_active_state() > 0))

function p1_team_has_char(char_id) => p1_character_1() == char_id || p1_character_2() == char_id || p1_character_3() == char_id
function p1_dont_have_char(char_id) => p1_character_1() != char_id && p1_character_2() != char_id && p1_character_3() != char_id

function game_beaten_team_play() {
    return(
            arcade_team_defeated_total() == 8 &&
            p2_character_3() == 25 &&
            game_ending_flag_0x10() == 16 && 
            game_ending_flag_0x85() == 133
    )
}

// TODO: Need to block rounds? probably not
function game_beaten_single_play() { 
    return(
            game_ending_flag_0x10() == 16 && 
            game_ending_flag_0x85() == 133 &&
            arcade_team_defeated_total() == 8
    )
}

// =========================================
//                Story Teams              
// =========================================

achievement(
    title = "Ikari Warriors '95", points = 10, type="progression",
    description = "Finish Team Play mode using only Heidern, Ralf and Clark.",
    id = 59901, badge = "62621", published = "06/05/2018 15:16:45", modified = "31/10/2019 01:27:25",
    trigger = no_unibios() &&
              p1_only() &&
              p1_team() == 0 &&
              once(game_screen() == SCREEN_CHAR_SELECT && arcade_team_defeated() == 0 && p1_characters_selected() == 3) &&
              never(p1_team() != 0 && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              trigger_when(game_beaten_team_play())
)

achievement(
    title = "Psycho Soldiers '95", points = 10, type="progression",
    description = "Finish Team Play mode using only Athena, Sie and Chin.",
    id = 59900, badge = "62622", published = "06/05/2018 15:16:38", modified = "31/10/2019 01:27:26",
    trigger = no_unibios() &&
              p1_only() && 
              p1_team() == 1 &&
              once(game_screen() == SCREEN_CHAR_SELECT && arcade_team_defeated() == 0 && p1_characters_selected() == 3) &&
              never(p1_team() != 1 && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              trigger_when(game_beaten_team_play())
)

achievement(
    title = "Heroes '95", points = 10, type="progression",
    description = "Finish Team Play mode using only Kyo, Benimaru and Goro.",
    id = 59902, badge = "62628", published = "06/05/2018 15:16:54", modified = "31/10/2019 01:27:27",
    trigger = no_unibios() &&
              p1_only() && 
              p1_team() == 2 &&
              once(game_screen() == SCREEN_CHAR_SELECT && arcade_team_defeated() == 0 && p1_characters_selected() == 3) &&
              never(p1_team() != 2 && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              trigger_when(game_beaten_team_play())
)

achievement(
    title = "Rivals '95", points = 10, type="progression",
    description = "Finish Team Play mode using only Iori, Eiri and Billy K.",
    id = 59903, badge = "62623", published = "06/05/2018 15:16:56", modified = "31/10/2019 01:27:28",
    trigger = no_unibios() &&
              p1_only() && 
              p1_team() == 3 &&
              once(game_screen() == SCREEN_CHAR_SELECT && arcade_team_defeated() == 0 && p1_characters_selected() == 3) &&
              never(p1_team() != 3 && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              trigger_when(game_beaten_team_play())
)

achievement(
    title = "Korea Justice '95", points = 10, type="progression",
    description = "Finish Team Play mode using only Kim, Chang and Choi.",
    id = 59904, badge = "62624", published = "06/05/2018 15:16:57", modified = "31/10/2019 01:28:28",
    trigger = no_unibios() &&
              p1_only() && 
              p1_team() == 4 &&
              once(game_screen() == SCREEN_CHAR_SELECT && arcade_team_defeated() == 0 && p1_characters_selected() == 3) &&
              never(p1_team() != 4 && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              trigger_when(game_beaten_team_play())
)

achievement(
    title = "Fatal Fury '95", points = 10, type="progression",
    description = "Finish Team Play mode using only Terry, Andy and Joe.",
    id = 59905, badge = "62625", published = "06/05/2018 15:16:58", modified = "31/10/2019 01:27:30",
    trigger = no_unibios() &&
              p1_only() && 
              p1_team() == 5 &&
              once(game_screen() == SCREEN_CHAR_SELECT && arcade_team_defeated() == 0 && p1_characters_selected() == 3) &&
              never(p1_team() != 5 && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              trigger_when(game_beaten_team_play())
)

achievement(
    title = "Art of Fighting '95", points = 10, type="progression",
    description = "Finish Team Play mode using only Ryo, Robert Garcia and Takuma.",
    id = 59906, badge = "62626", published = "06/05/2018 15:16:59", modified = "31/10/2019 01:27:31",
    trigger = no_unibios() &&
              p1_only() && 
              p1_team() == 6 &&
              once(game_screen() == SCREEN_CHAR_SELECT && arcade_team_defeated() == 0 && p1_characters_selected() == 3) &&
              never(p1_team() != 6 && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              trigger_when(game_beaten_team_play())
)

achievement(
    title = "Women Fighters '95", points = 10, type="progression",
    description = "Finish Team Play mode using only Yuri, King and Mai.",
    id = 59907, badge = "62627", published = "06/05/2018 15:17:00", modified = "31/10/2019 01:27:33",
    trigger = no_unibios() &&
              p1_only() && 
              p1_team() == 7 &&
              once(game_screen() == SCREEN_CHAR_SELECT && arcade_team_defeated() == 0 && p1_characters_selected() == 3) &&
              never(p1_team() != 7 && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              trigger_when(game_beaten_team_play())
)

// =========================================
//               Custom Teams              
// =========================================

achievement(
    title = "Star Team", points = 10,
    description = "Finish Team Play mode using only Kyo, Terry and Ryo.",
    id = 59920, badge = "62710", published = "06/05/2018 15:17:34", modified = "31/10/2019 01:27:34",
    trigger = no_unibios() &&
              p1_only() && 
              p1_team() == 0xff && 
              once(game_screen() == SCREEN_CHAR_SELECT && arcade_team_defeated() == 0 && p1_characters_selected() == 3) &&
              p1_team_has_char(6) &&
              p1_team_has_char(15) &&
              p1_team_has_char(18) &&
              never(p1_dont_have_char(6) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              never(p1_dont_have_char(15) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              never(p1_dont_have_char(18) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              trigger_when(game_beaten_team_play())
)

achievement(
    title = "School Team", points = 10,
    description = "Finish Team Play mode using only Athena, Kensou and Kyo.",
    id = 59921, badge = "62630", published = "06/05/2018 15:17:35", modified = "31/10/2019 01:27:37",
    trigger = no_unibios() &&
              p1_only() && 
              p1_team() == 0xff && 
              once(game_screen() == SCREEN_CHAR_SELECT && arcade_team_defeated() == 0 && p1_characters_selected() == 3) &&
              p1_team_has_char(3) &&
              p1_team_has_char(4) &&
              p1_team_has_char(6) &&
              never(p1_dont_have_char(3) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              never(p1_dont_have_char(4) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              never(p1_dont_have_char(6) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              trigger_when(game_beaten_team_play())
)

achievement(
    title = "Justice Team", points = 10,
    description = "Finish Team Play mode using only Athena, Kim and Terry.",
    id = 59923, badge = "62631", published = "06/05/2018 15:17:37", modified = "31/10/2019 01:27:38",
    trigger = no_unibios() &&
              p1_only() && 
              p1_team() == 0xff && 
              once(game_screen() == SCREEN_CHAR_SELECT && arcade_team_defeated() == 0 && p1_characters_selected() == 3) &&
              p1_team_has_char(3) &&
              p1_team_has_char(12) &&
              p1_team_has_char(15) &&
              never(p1_dont_have_char(3) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              never(p1_dont_have_char(12) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              never(p1_dont_have_char(15) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              trigger_when(game_beaten_team_play())
)

achievement(
    title = "Boss Team", points = 10,
    description = "Finish Team Play mode using only Saisyu, Rugal and other.",
    id = 59924, badge = "62632", published = "06/05/2018 15:17:38", modified = "31/10/2019 01:27:39",
    trigger = no_unibios() &&
              p1_only() && 
              p1_team() == 0xff && 
              once(game_screen() == SCREEN_CHAR_SELECT && arcade_team_defeated() == 0 && p1_characters_selected() == 3) &&
              p1_team_has_char(24) &&
              p1_team_has_char(25) &&
              never(p1_dont_have_char(24) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              never(p1_dont_have_char(25) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              trigger_when(game_beaten_team_play())
)

achievement(
    title = "Ninja Team", points = 10,
    description = "Finish Team Play mode using only Eiji, Andy and Mai.",
    id = 59925, badge = "62633", published = "06/05/2018 15:17:39", modified = "31/10/2019 01:27:40",
    trigger = no_unibios() &&
              p1_only() && 
              p1_team() == 0xff && 
              once(game_screen() == SCREEN_CHAR_SELECT && arcade_team_defeated() == 0 && p1_characters_selected() == 3) &&
              p1_team_has_char(10) &&
              p1_team_has_char(16) &&
              p1_team_has_char(22) &&
              never(p1_dont_have_char(10) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              never(p1_dont_have_char(16) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              never(p1_dont_have_char(22) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              trigger_when(game_beaten_team_play())
)

achievement(
    title = "Master Team", points = 10,
    description = "Finish Team Play mode using only Chin, Goro and Takuma.",
    id = 59926, badge = "62634", published = "06/05/2018 15:17:40", modified = "31/10/2019 01:27:41",
    trigger = no_unibios() &&
              p1_only() && 
              p1_team() == 0xff && 
              once(game_screen() == SCREEN_CHAR_SELECT && arcade_team_defeated() == 0 && p1_characters_selected() == 3) &&
              p1_team_has_char(5) &&
              p1_team_has_char(8) &&
              p1_team_has_char(20) &&
              never(p1_dont_have_char(5) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              never(p1_dont_have_char(8) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              never(p1_dont_have_char(20) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              trigger_when(game_beaten_team_play())
)

achievement(
    title = "Guardian Team", points = 10,
    description = "Finish Team Play mode using only Kyo, Iori and Saisyu.",
    id = 59927, badge = "62635", published = "06/05/2018 15:17:42", modified = "31/10/2019 01:27:42",
    trigger = no_unibios() &&
              p1_only() && 
              p1_team() == 0xff && 
              once(game_screen() == SCREEN_CHAR_SELECT && arcade_team_defeated() == 0 && p1_characters_selected() == 3) &&
              p1_team_has_char(6) &&
              p1_team_has_char(9) &&
              p1_team_has_char(24) &&
              never(p1_dont_have_char(6) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              never(p1_dont_have_char(9) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              never(p1_dont_have_char(24) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              trigger_when(game_beaten_team_play())
)

achievement(
    title = "Nippon Team", points = 10,
    description = "Finish Team Play mode using only Goro, Joe and Mai.",
    id = 59928, badge = "62636", published = "06/05/2018 15:17:43", modified = "31/10/2019 01:27:45",
    trigger = no_unibios() &&
              p1_only() && 
              p1_team() == 0xff && 
              once(game_screen() == SCREEN_CHAR_SELECT && arcade_team_defeated() == 0 && p1_characters_selected() == 3) &&
              p1_team_has_char(8) &&
              p1_team_has_char(17) &&
              p1_team_has_char(22) &&
              never(p1_dont_have_char(8) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              never(p1_dont_have_char(17) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              never(p1_dont_have_char(22) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              trigger_when(game_beaten_team_play())
)

achievement(
    title = "Kick Boxing Team", points = 10,
    description = "Finish Team Play mode using only Benimaru, Joe and King.",
    id = 59929, badge = "62637", published = "06/05/2018 15:17:44", modified = "31/10/2019 01:27:46",
    trigger = no_unibios() &&
              p1_only() && 
              p1_team() == 0xff && 
              once(game_screen() == SCREEN_CHAR_SELECT && arcade_team_defeated() == 0 && p1_characters_selected() == 3) &&
              p1_team_has_char(7) &&
              p1_team_has_char(17) &&
              p1_team_has_char(23) &&
              never(p1_dont_have_char(7) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              never(p1_dont_have_char(17) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              never(p1_dont_have_char(23) && p2_characters_defeated() > prev(p2_characters_defeated()) && game_screen() == SCREEN_INGAME) &&
              trigger_when(game_beaten_team_play())
)

// =========================================
//                  Challenges              
// =========================================

achievement(
    title = "To the Top of the Hill", points = 25,
    description = "Beat the game on Single Play mode.",
    id = 59922, badge = "62703", published = "06/05/2018 15:17:36", modified = "09/10/2024 22:49:52",
    trigger = no_unibios() &&
              p1_only() && 
              game_beaten_single_play() &&
              p1_team() >= 254 && 
              (((game_mvs_flag() == 128 && soft_dip_setup_mode_mvs() == 0)) ||
               ((game_mvs_flag() == 0 && game_mode_aes() == 0)))
)

achievement(
    title = "KOF 95", points = 25,
    description = "Beat the game on Team Play without using a continue.",
    id = 59931, badge = "62640", published = "06/05/2018 15:17:46", modified = "09/10/2024 22:49:57",
    trigger = no_unibios() &&
              p1_only() && 
              trigger_when(game_beaten_team_play()) &&
              once(game_screen() == SCREEN_CHAR_SELECT && arcade_team_defeated() == 0 && p1_characters_selected() == 3) &&
              never(p1_active_state() == 2)
)
