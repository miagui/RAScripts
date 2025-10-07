// Fatal Fury F-Contact
// #ID = 14249

// Settings

function settings_difficulty() => byte(0x0013D2)
function settings_time() => byte(0x0013D3)
function settings_com_win_point() => byte(0x0013D4)

function default_settings() => settings_time() == 1 && settings_com_win_point() == 0 && settings_difficulty() >= 1

// Game

function game_program_state() => word(0x000008)
         PS_SETTINGS = 0x6631
         PS_FOUND_ALFRED = 0x6CBA
         PS_FIGHTING = 0xa25b

function game_last_bgm() => byte(0x001316)
         BGM_PLAYER_SELECT = 0x01
         BGM_MODE_SELECT = 0x02
         BGM_GET_IN_THE_RING = 0x03
         BGM_CONGRATULATIONS = 0x04
         BGM_ENDING = 0x06

function game_last_sfx() => byte(0x00131A)
function game_arcade_match() => byte(0x001322)
function game_continues_service() => byte(0x14e2)

function game_current_round() => byte(0x0b04)
function round_started() => byte(0x131f)
function round_timer() => byte(0x001324)

function arcade_s_power_finishes() => byte(0x0015E8)
function arcade_p_power_finishes() => byte(0x0015E9)

// Players

function p1_special_move_flag() => bit0(0x000991)
function p1_throwing_flag() => bit1(0x000991)

function p1_s_power_flag() => bit3(0x000992)
function p1_p_power_flag() => bit4(0x000992)

function p1_moves() => byte(0x0009D7)
function p1_special_moves() => byte(0x0009DC)
function p1_special_moves_sequence() => byte(0x09d9)
function p1_hit_combo() => byte(0x0009E9)
function p1_special_action() => byte(0x000A00)

function p1_character() => low4(0x001340)
function p2_character() => low4(0x001341)
function p1_rounds_won() => byte(0x001342)
function p2_rounds_won() => byte(0x001343)
function p1_hp() => byte(0x001344)
function p2_hp() => byte(0x001346)
function p1_power_gauge() => byte(0x001348)

characters = {
    "Alfred": 0x00,
    "Terry": 0x01,
    "Andy": 0x02,
    "Joe": 0x03,
    "Mai": 0x04,
    "Geese": 0x05,
    "Yamazaki": 0x06,
    "Kim": 0x07,
    "Billy": 0x08,
    "Krauser": 0x09,
    "Rick": 0x0A,
    "Xiangfei": 0x0B,
    "Lao": 0x0C
}


// Utility Functions

function arcade_mode_just_started() {
    return(
        game_arcade_match() == 0x00 && 
        game_current_round() == 0x00 &&
        round_started() > prev(round_started())
    )
}

function p2_hp_depleted() => p2_hp() == 0 && prev(p2_hp()) > 0

function p1_landed_a_hit() => p1_hit_combo() > prev(p1_hit_combo())
function p1_won_a_round() => p1_rounds_won() > prev(p1_rounds_won())
function p1_won_a_match() => p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1
function game_beaten() => game_last_bgm() == BGM_CONGRATULATIONS && prev(game_last_bgm()) != BGM_CONGRATULATIONS

function in_match_fighting() => game_program_state() == PS_FIGHTING
function not_in_settings() => game_program_state() != 0x6631
function soft_reboot() => game_program_state() == 0x407a || game_program_state() == 0x1c38
function continues_service_used() => game_continues_service() != 0 && game_continues_service() != 4

// =========================================
//                Progression              
// =========================================

// Repurpose all these into a "Beat the game using only X on default settings." and rescore to 10 points
achievement(
    title = "Kung Fu Queen", points = 10, type="win_condition",
    description = "Beat the game using only Xiangfei on default settings.",
    id = 156094, published = "30/05/2021 17:16:30", modified = "28/07/2022 10:50:06",
    trigger =   not_in_settings() &&
                default_settings() &&   
                once(game_arcade_match() == 0x00 && game_last_bgm() == BGM_PLAYER_SELECT && game_program_state() == 0x2b72) &&
                never(p1_character() != characters["Xiangfei"] && p1_won_a_round()) &&
                p1_character() == characters["Xiangfei"] &&
                trigger_when(game_beaten())

)

achievement(
    title = "Wood Carving Wolf", points = 10, type="win_condition",
    description = "Beat the game using only Rick on default settings.",
    id = 156100, published = "30/05/2021 17:17:02", modified = "28/07/2022 10:50:08",
    trigger =   not_in_settings() &&
                default_settings() &&   
                once(game_arcade_match() == 0x00 && game_last_bgm() == BGM_PLAYER_SELECT && game_program_state() == 0x2b72) &&
                never(p1_character() != characters["Rick"] && p1_won_a_round()) &&
                p1_character() == characters["Rick"] &&
                trigger_when(game_beaten())
)

achievement(
    title = "Power Dunk", points = 10, type="win_condition",
    description = "Beat the game using only Terry on default settings.",
    id = 156106, published = "30/05/2021 17:18:26", modified = "28/07/2022 10:50:10",
    trigger =   not_in_settings() &&
                default_settings() &&   
                once(game_arcade_match() == 0x00 && game_last_bgm() == BGM_PLAYER_SELECT && game_program_state() == 0x2b72) &&
                never(p1_character() != characters["Terry"] && p1_won_a_round()) &&
                p1_character() == characters["Terry"] &&
                trigger_when(game_beaten())
)

achievement(
    title = "Bojutsu", points = 10, type="win_condition",
    description = "Beat the game using only Billy on default settings.",
    id = 156112, published = "30/05/2021 17:21:17", modified = "28/07/2022 10:50:12",
    trigger =   not_in_settings() &&
                default_settings() &&   
                once(game_arcade_match() == 0x00 && game_last_bgm() == BGM_PLAYER_SELECT && game_program_state() == 0x2b72) &&
                never(p1_character() != characters["Billy"] && p1_won_a_round()) &&
                p1_character() == characters["Billy"] &&
                trigger_when(game_beaten())
)

achievement(
    title = "Shiranui-ryuu Ninjutsu", points = 10, type="win_condition",
    description = "Beat the game using only Andy on default settings.",
    id = 156118, published = "30/05/2021 17:22:50", modified = "28/07/2022 10:50:14",
    trigger =   not_in_settings() &&
                default_settings() &&   
                once(game_arcade_match() == 0x00 && game_last_bgm() == BGM_PLAYER_SELECT && game_program_state() == 0x2b72) &&
                never(p1_character() != characters["Andy"] && p1_won_a_round()) &&
                p1_character() == characters["Andy"] &&
                trigger_when(game_beaten())
)

achievement(
    title = "Drunken Brawling", points = 10, type="win_condition",
    description = "Beat the game using only Joe on default settings.",
    id = 156124, published = "30/05/2021 17:24:19", modified = "28/07/2022 10:50:16",
    trigger =   not_in_settings() &&
                default_settings() &&   
                once(game_arcade_match() == 0x00 && game_last_bgm() == BGM_PLAYER_SELECT && game_program_state() == 0x2b72) &&
                never(p1_character() != characters["Joe"] && p1_won_a_round()) &&
                p1_character() == characters["Joe"] &&
                trigger_when(game_beaten())
)

achievement(
    title = "Aiki-Jujutsu", points = 10, type="win_condition",
    description = "Beat the game using only Geese on default settings.",
    id = 156130, published = "30/05/2021 17:26:46", modified = "28/07/2022 10:50:18",
    trigger =   not_in_settings() &&
                default_settings() &&   
                once(game_arcade_match() == 0x00 && game_last_bgm() == BGM_PLAYER_SELECT && game_program_state() == 0x2b72) &&
                never(p1_character() != characters["Geese"] && p1_won_a_round()) &&
                p1_character() == characters["Geese"] &&
                trigger_when(game_beaten())
)


achievement(
    title = "Butterfly Fan", points = 10, type="win_condition",
    description = "Beat the game using only Mai on default settings.",
    id = 156136, published = "30/05/2021 17:28:38", modified = "28/07/2022 10:50:20",
    trigger =   not_in_settings() &&
                default_settings() &&   
                once(game_arcade_match() == 0x00 && game_last_bgm() == BGM_PLAYER_SELECT && game_program_state() == 0x2b72) &&
                never(p1_character() != characters["Mai"] && p1_won_a_round()) &&
                p1_character() == characters["Mai"] &&
                trigger_when(game_beaten())
)

achievement(
    title = "No Surname Needed", points = 10, type="win_condition",
    description = "Beat the game using only Kim on default settings.",
    id = 156206, published = "30/05/2021 20:05:29", modified = "28/07/2022 10:50:22",
    trigger =   not_in_settings() &&
                default_settings() &&   
                once(game_arcade_match() == 0x00 && game_last_bgm() == BGM_PLAYER_SELECT && game_program_state() == 0x2b72) &&
                never(p1_character() != characters["Kim"] && p1_won_a_round()) &&
                p1_character() == characters["Kim"] &&
                trigger_when(game_beaten())
)

achievement(
    title = "Kampfringen", points = 10, type="win_condition",
    description = "Beat the game using only Krauser on default settings.",
    id = 156212, published = "30/05/2021 20:05:31", modified = "28/07/2022 10:50:24",
    trigger =   not_in_settings() &&
                default_settings() &&   
                once(game_arcade_match() == 0x00 && game_last_bgm() == BGM_PLAYER_SELECT && game_program_state() == 0x2b72) &&
                never(p1_character() != characters["Krauser"] && p1_won_a_round()) &&
                p1_character() == characters["Krauser"] &&
                trigger_when(game_beaten())
)

achievement(
    title = "Combative Homocide", points = 10, type="win_condition",
    description = "Beat the game using only Yamazaki on default settings.",
    id = 156218, published = "30/05/2021 20:05:33", modified = "28/07/2022 10:50:26",
    trigger =   not_in_settings() &&
                default_settings() &&   
                once(game_arcade_match() == 0x00 && game_last_bgm() == BGM_PLAYER_SELECT && game_program_state() == 0x2b72) &&
                never(p1_character() != characters["Yamazaki"] && p1_won_a_round()) &&
                p1_character() == characters["Yamazaki"] &&
                trigger_when(game_beaten())
)

achievement(
    title = "Love Machine", points = 10,
    description = "Beat the game using only Alfred on default settings.",
    id = 156224, published = "30/05/2021 20:07:59", modified = "28/07/2022 10:50:28",
    trigger =   not_in_settings() &&
                default_settings() &&   
                once(game_arcade_match() == 0x00 && game_last_bgm() == BGM_PLAYER_SELECT && game_program_state() == 0x2b72) &&
                never(p1_character() != characters["Alfred"] && p1_won_a_round()) &&
                p1_character() == characters["Alfred"] &&
                trigger_when(game_beaten())
)

// Repurpose into "Beat the game on Hard difficulty and default settings." and rescore to 10 points
achievement(
    title = "Over the Mind", points = 10,
    description = "Beat the game on Hard difficulty and default settings.",
    id = 156107, published = "30/05/2021 17:18:27", modified = "28/07/2022 10:50:10",
    trigger =   not_in_settings() &&
                default_settings() &&
                settings_difficulty() == 2 &&
                game_beaten()
)


// Repurpose into just "Defeat Alfred in the Bonus Game on default settings." and rescore to 25 points
achievement(
    title = "Get the Sky with Your Dream", points = 25,
    description = "Defeat Alfred in the Bonus Game on default settings.",
    id = 156110, badge = "175794", published = "30/05/2021 17:18:28", modified = "28/07/2022 10:50:11",
    trigger =   not_in_settings() &&
                default_settings() &&
                p2_character() == characters["Alfred"] &&
                p1_won_a_match()
)

// =========================================
//                   Misc              
// =========================================

achievement("First Contact", "Win a round with a Perfect on default settings.", 3,
            trigger =   default_settings() &&
                        p1_hp() == 0x60 &&
                        p1_won_a_round()            
            )

achievement("Hidden Ability Boopers", "Finish off your opponent with a P-Power.", 3,
            trigger =   in_match_fighting() &&
                        p1_p_power_flag() == 1 &&
                        p2_hp_depleted()
            )

achievement("Break Shot", "Perform a Break Shot.", 2,
            trigger =   in_match_fighting() &&
                        p1_special_action() == 0x02 &&
                        prev(p1_special_action()) != 0x02
            )

achievement("Technical Rise", "Perform a Roll Recovery.", 2,
            trigger =   in_match_fighting() &&
                        p1_moves() == 0x46 &&
                        prev(p1_moves()) != 0x46
            )

// =========================================
//            Desperation Moves              
// =========================================

achievement("Triple Geyser", "Hit your opponent with all Desperation Moves as Terry during a playthrough.", 3,
            trigger =   never(soft_reboot()) &&
                        never(p1_character() != characters["Terry"]) &&
                        measured(tally(2, once(p1_special_moves() == 0x07 && p1_landed_a_hit()),
                                          once(p1_special_moves() == 0x08 && p1_landed_a_hit())
                                      ))
            )

achievement("Dan Da Dan", "Hit your opponent with all Desperation Moves as Andy during a playthrough.", 3,
            trigger =   never(soft_reboot()) &&
                        never(p1_character() != characters["Andy"]) &&
                        measured(tally(2, once(p1_special_moves() == 0x08 && p1_landed_a_hit()),
                                          once(p1_special_moves() == 0x09 && p1_landed_a_hit())
                                      ))
            )

achievement("Thunder Fire", "Hit your opponent with all Desperation Moves as Joe during a playthrough.", 3,
            trigger =   never(soft_reboot()) &&
                        never(p1_character() != characters["Joe"]) &&
                        measured(tally(2, once(p1_special_moves() == 0x08 && p1_landed_a_hit()),
                                          once(p1_special_moves() == 0x09 && p1_landed_a_hit())
                                      ))
            )

achievement("Hana Arashi", "Hit your opponent with all Desperation Moves as Mai during a playthrough.", 3,
            trigger =   never(soft_reboot()) &&
                        never(p1_character() != characters["Mai"]) &&
                        measured(tally(2, once(p1_special_moves() == 0x08 && p1_landed_a_hit()),
                                          once(p1_special_moves() == 0x09 && p1_landed_a_hit())
                                      ))
            )

achievement("Deadly Rave", "Hit your opponent with all Desperation Moves and Deadly Rave's full sequence as Geese during a playthrough.", 5,
            trigger =   never(soft_reboot()) &&
                        never(p1_character() != characters["Geese"]) &&
                        measured(tally(3, once(p1_special_moves() == 0x07 && p1_landed_a_hit()),
                                          once(p1_special_moves() == 0x06 && p1_special_moves_sequence() == 0x04),
                                          once(p1_special_moves() == 0x08 && p1_special_moves_sequence() == 0x0c)
                                      ))
            )

achievement("Drill", "Hit your opponent with Guillotine and Drill Lv. 5 as Yamazaki during a playthrough.", 4,
            trigger =   never(soft_reboot()) &&
                        never(p1_character() != characters["Yamazaki"]) &&
                        measured(tally(2, once(p1_special_moves() == 0x07 && p1_special_moves_sequence() == 0x05),
                                          once(p1_special_moves() == 0x0c && p1_landed_a_hit())
                                      ))
            )

achievement("Hou'ou Tenbu Kyaku	", "Hit your opponent with all Desperation Moves as Kim during a playthrough.", 3,
            trigger =   never(soft_reboot()) &&
                        never(p1_character() != characters["Kim"]) &&
                        measured(tally(2, once(p1_special_moves() == 0x06 && p1_landed_a_hit()),
                                          once(p1_special_moves() == 0x07 && p1_landed_a_hit())
                                      ))
            )

achievement("Salamander Stream", "Hit your opponent with all Desperation Moves as Billy during a playthrough.", 4,
            trigger =   never(soft_reboot()) &&
                        never(p1_character() != characters["Billy"]) &&
                        measured(tally(3, once(p1_special_moves() == 0x06 && p1_landed_a_hit()),
                                          once(p1_special_moves() == 0x07 && p1_landed_a_hit()),
                                          once(p1_special_moves() == 0x08 && p1_landed_a_hit())
                                      ))
            )

achievement("Gigatec Cyclone", "Hit your opponent with all Desperation Moves and Unlimited Desire's full sequence as Krauser during a playthrough.", 5,
            trigger =   never(soft_reboot()) &&
                        never(p1_character() != characters["Krauser"]) &&
                        measured(tally(3, once(p1_special_moves() == 0x06 && p1_landed_a_hit()),
                                          once(p1_special_moves() == 0x07 && p1_special_moves_sequence() == 0x05),
                                          once(p1_special_moves() == 0x08 && p1_special_moves_sequence() == 0x0b)
                                      ))
            )

achievement("Howling Bull", "Hit your opponent with all Desperation Moves as Rick during a playthrough.", 3,
            trigger =   never(soft_reboot()) &&
                        never(p1_character() != characters["Rick"]) &&
                        measured(tally(2, once(p1_special_moves() == 0x07 && p1_landed_a_hit()),
                                          once(p1_special_moves() == 0x08 && p1_landed_a_hit())
                                      ))
            )

achievement("Majinga", "Hit your opponent with all Desperation Moves as Xiangfei during a playthrough.", 3,
            trigger =   never(soft_reboot()) &&
                        never(p1_character() != characters["Xiangfei"]) &&
                        measured(tally(2, once(__ornext((p1_special_moves() == 0x05 && p1_landed_a_hit()) || (p1_special_moves() == 0x06)) ),
                                          once(p1_special_moves() == 0x07 && p1_landed_a_hit())
                                      ))
            )

achievement("Shock Stall", "Hit your opponent with all Desperation Moves as Alfred during a playthrough.", 3,
            trigger =   never(soft_reboot()) &&
                        never(p1_character() != characters["Alfred"]) &&
                        measured(tally(2, once(p1_special_moves() == 0x09 && p1_landed_a_hit()),
                                          once(p1_special_moves() == 0x0a && p1_landed_a_hit())
                                      ))
            )



// =========================================
//                  Combos              
// =========================================

achievement("Power Geyser", "Perform a 4-hit combo using Power Geyser as Terry.", 4,
            trigger =   in_match_fighting() &&
                        p1_character() == characters["Terry"] &&
                        p1_hit_combo() >= 4 &&
                        p1_special_moves() == 0x07 &&
                        p1_landed_a_hit()
            )

achievement("Chou Reppa Dan", "Perform a 7-hit combo using Chou Reppa Dan as Andy.", 5,
            trigger =   in_match_fighting() &&
                        p1_character() == characters["Andy"] &&
                        p1_hit_combo() >= 7 &&
                        p1_special_moves() == 0x08 &&
                        p1_landed_a_hit()
            )

achievement("Kogane no Kakato", "Perform a 5-hit combo using Kogane no Kakato as Joe.", 4,
            trigger =   in_match_fighting() &&
                        p1_character() == characters["Joe"] &&
                        p1_hit_combo() >= 5 &&
                        p1_special_moves() == 0x03 &&
                        p1_landed_a_hit()
            )

achievement("Chou Hissatsu Shinobi Bachi", "Perform a 10-hit combo using Chou Hissatsu Shinobi Bachi as Mai.", 5,
            trigger =   in_match_fighting() &&
                        p1_character() == characters["Mai"] &&
                        p1_hit_combo() >= 10 &&
                        p1_special_moves() == 0x08 &&
                        p1_landed_a_hit()
            )

achievement("Raging Storm", "Perform a 4-hit combo using Raging Storm as Geese.", 5,
            trigger =   in_match_fighting() &&
                        p1_character() == characters["Geese"] &&
                        p1_hit_combo() >= 4 &&
                        p1_special_moves() == 0x07 &&
                        p1_landed_a_hit()
            )

achievement("Guillotine", "Perform a 5-hit combo using Guillotine into Todome as Yamazaki.", 5,
            trigger =   in_match_fighting() &&
                        p1_character() == characters["Yamazaki"] &&
                        p1_hit_combo() >= 5 &&
                        once(p1_special_moves() == 0x07 && p1_special_moves_sequence() == 0x04) &&
                        p1_special_moves() == 0x01 &&
                        never(p1_hit_combo() == 0x00) &&
                        p1_landed_a_hit()
            )

achievement("Hou'ou Kyaku", "Perform a 16-hit combo using Hou'ou Kyaku as Kim.", 5,
            trigger =   in_match_fighting() &&
                        p1_character() == characters["Kim"] &&
                        p1_hit_combo() >= 16 &&
                        p1_special_moves() == 0x07 &&
                        p1_landed_a_hit()
            )

achievement("Guren Sakkon", "Perform a 6-hit combo using Guren Sakkon as Billy.", 5,
            trigger =   in_match_fighting() &&
                        p1_character() == characters["Billy"] &&
                        p1_hit_combo() >= 6 &&
                        p1_special_moves() == 0x06 &&
                        p1_landed_a_hit()
            )

achievement("Unlimited Desire", "Perform a 13-hit combo using Unlimited Desire as Krauser.", 5,
            trigger =   in_match_fighting() &&
                        p1_character() == characters["Krauser"] &&
                        p1_hit_combo() >= 13 &&
                        p1_special_moves() == 0x08 &&
                        p1_landed_a_hit()
            )

achievement("Gaia Breath", "Perform a 3-hit combo using Gaia Breath as Rick.", 5,
            trigger =   in_match_fighting() &&
                        p1_character() == characters["Rick"] &&
                        p1_hit_combo() >= 3 &&
                        p1_special_moves() == 0x07 &&
                        p1_landed_a_hit()
            )

achievement("Dai Tetsujin", "Perform a 4-hit combo using Dai Tetsujin as Xiangfei.", 5,
            trigger =   in_match_fighting() &&
                        p1_character() == characters["Xiangfei"] &&
                        p1_hit_combo() >= 4 &&
                        p1_special_moves() == 0x07 &&
                        p1_landed_a_hit()
            )

achievement("Wave Rider", "Perform a 8-hit combo using Wave Rider as Alfred.", 5,
            trigger =   in_match_fighting() &&
                        p1_character() == characters["Alfred"] &&
                        p1_hit_combo() >= 8 &&
                        p1_special_moves() == 0x0a &&
                        p1_landed_a_hit()
            )

// =========================================
//                   Misc              
// =========================================

achievement("This’ll Be One for the Record Books!", "Beat the game by defeating any last boss in less than 7 minutes without using continue services on default settings.", 25,
            trigger =   not_in_settings() &&
                        default_settings() && 
                        once(arcade_mode_just_started()) &&
                        never(repeated(25200, once(arcade_mode_just_started()) && round_started() == 1)) &&
                        never((soft_reboot()) || (continues_service_used())) &&
                        trigger_when((game_arcade_match() == 0x07 && game_beaten()) ||
                                     (game_arcade_match() == 0x08 && prev(game_arcade_match()) == 0x07)
                                    )
            
            )

achievement("Feel the Geesester!", "Defeat Geese without losing a round and without using continue services on default settings.", 5,
            trigger =   default_settings() && 
                        p2_character() == characters["Geese"] &&
                        never(continues_service_used()) &&
                        p2_rounds_won() == 0x00 &&
                        trigger_when(p1_won_a_match())
            )

achievement("Lacrimosa", "Defeat Krauser without losing a round and without using continue services on default settings.", 5,
            trigger =   default_settings() && 
                        p2_character() == characters["Krauser"] &&
                        never(continues_service_used()) &&
                        p2_rounds_won() == 0x00 &&
                        trigger_when(p1_won_a_match())
            )

// =========================================
//               Leaderboards              
// =========================================

leaderboard("F-Contact Speedrun - Normal", "Fastest time to reach and defeat any last boss without using continue services on default settings.",
           start =  not_in_settings() &&
                    default_settings() && 
                    settings_difficulty() == 0x01 &&
                    arcade_mode_just_started(),
           cancel = (soft_reboot()) || (continues_service_used()),
           submit = (game_arcade_match() == 0x07 && game_beaten()) ||
                    (game_arcade_match() == 0x08 && prev(game_arcade_match()) == 0x07),
           value = round_started() == 1,
           format = "FRAMES", lower_is_better=true)

leaderboard("F-Contact Speedrun - Hard", "Fastest time to reach and defeat any last boss without using continue services on default settings.",
           start =  not_in_settings() &&
                    default_settings() && 
                    settings_difficulty() == 0x02 &&
                    arcade_mode_just_started(),
           cancel = (soft_reboot()) || (continues_service_used()),
           submit = (game_arcade_match() == 0x07 && game_beaten()) ||
                    (game_arcade_match() == 0x08 && prev(game_arcade_match()) == 0x07),
           value = round_started() == 1,
           format = "FRAMES", lower_is_better=true)