// ~Homebrew~ Real Bout Fatal Fury Genesis
// #ID = 33062

// Settings
function settings_time() => byte(0x00003C)
function settings_difficulty() => byte(0x00003F)

// Game Stuff
function game_state() => byte(0x000045)
        GS_MAIN_MENU = 0x03
        GS_CHARACTER_SELECT = 0x04
        GS_STAGE_SELECT = 0x05
        GS_TRAINING_OPTIONS = 0x06
        GS_TRANSITION = 0x07
        GS_FIGHTING = 0x08
        GS_WINNER_ANNOUNCEMENT = 0x09
        GS_GAME_OVER = 0x0A
        GS_VERSUS_SCREEN = 0x13
        GS_VIEWING_ACHIEVEMENTS = 0x14
        GS_OPTIONS_MENU = 0x15
        GS_CONTROLLER_CONFIGURATION = 0x17
        GS_BAD_ENDING = 0x19
        GS_THANK_YOU_FOR_PLAYING = 0x1A
        ENDING_TERRY = 0x0B
        ENDING_MAI = 0x0C
        ENDING_BLUE_MARY = 0x0D
        ENDING_JOE = 0x0E
        ENDING_KRAUSER = 0x0F
        ENDING_CHONREI = 0x10
        ENDING_CHONSHU = 0x11
        ENDING_KIM = 0x12
        ENDING_GEESE = 0x18

function game_mode() => byte(0x0001E4)
         MODE_ARCADE = 0x01
         MODE_VERSUS = 0x02
         MODE_TRAINING = 0x03
         MODE_SURVIVAL = 0x04

function game_arcade_match() => byte(0x0001E5)

function survival_wins() => byte(0x0001d5)

// P1
function p1_character() => byte(0x0003D1)
function p1_cpu_controlled() => bit0(0x04f6)

function p1_hp() => word(0x0003DA)
function p1_gauge_bar() => word(0x0003DC)
function p1_moves() => word(0x0003DE)
function p1_rounds_won() => byte(0x0003E5)
function p1_last_movement_used() => byte(0x0003E9)
function p1_moves_2() => word(0x000420)
function p1_animation() => word(0x0004A6)
function p1_action_state() => byte(0x0004C4)


// P1 Training
function p1_hit_combo() => byte(0x000665)
function p1_training_button_presses_1() => byte(0x000FD0)
function p1_training_button_presses_2() => byte(0x000FD1)
function p1_training_combo_damage() => byte(0x000FD2)
function p1_training_max_combo_damage() => byte(0x000FD3)
function p1_training_total_hits() => byte(0x000FD5)

// P2
function p2_character() => byte(0x000563)
function p2_cpu_controlled() => bit0(0x0688)

function p2_hp() => word(0x00056C)
function p2_moves() => word(0x000570)
function p2_rounds_won() => byte(0x000577)

function desperation_moves_hit_terry() => byte(0x001002)
function desperation_moves_hit_blue_mary() => byte(0x001004)
function desperation_moves_hit_mai() => byte(0x001005)
function desperation_moves_hit_chonrei() => byte(0x001006)
function desperation_moves_hit_joe() => byte(0x001007)
function desperation_moves_hit_kim() => byte(0x001008)
function desperation_moves_hit_chonshu() => byte(0x001009)
function desperation_moves_hit_geese() => byte(0x00100A)
function desperation_moves_hit_krauser() => byte(0x00100B)

characters = {
    "Terry": 0x01,
    "Mai": 0x02,
    "Blue Mary": 0x03,
    "Joe": 0x04,
    "Krauser": 0x05,
    "Omega Krauser": 0x06,
    "Chonrei": 0x07,
    "Chonshu": 0x08,
    "Kim": 0x09,
    "Geese": 0x0A,
    "EX-Terry": 0x0B,
    "EX-Mai": 0x0C,
    "EX-Blue Mary": 0x0D,
    "EX-Joe": 0x0E
}

// Utility Functions
function p1_only() => p1_cpu_controlled() == 0 && p2_cpu_controlled() == 1 // probably won't use it much on this homebrew
function p1_active() => p1_cpu_controlled() == 0
function p1_won_a_match() => p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1

// =========================================
//              Beat the game              
// =========================================

function achiev_beat_the_game(title, character, ending_id) {
        achievement(title, format("Beat the game as {0}.", character), 25, type="win_condition",
                    trigger =   game_mode() == MODE_ARCADE &&
                                game_state() == ending_id &&
                                prev(game_state()) == 0x09
                    )
}

achiev_beat_the_game("Okay! Time to Party!", "Terry", ENDING_TERRY)
achiev_beat_the_game("All Right! Our Vacation Begins Now, Andy!", "Mai", ENDING_MAI)
achiev_beat_the_game("I Always Get the Post-battle Blues. Sob!", "Blue Mary", ENDING_BLUE_MARY)
achiev_beat_the_game("Now I Can Kick Back and Enjoy Life", "Joe", ENDING_JOE)
achiev_beat_the_game("Ho-Oh Kyaku! A-Chachachacha!", "Kim", ENDING_KIM)
achiev_beat_the_game("At Last! ‘Imperial First’ Rules All!", "Chonrei", ENDING_CHONREI)
achiev_beat_the_game("Ugh...m-My Head Hurts!", "Chonshu", ENDING_CHONSHU)
achiev_beat_the_game("Hmph. Farewell....", "Geese", ENDING_GEESE)

// Krauser Exception
achievement("I’m Really Pumped Now!", "Beat the game as Krauser.", 25, type="win_condition",
                    trigger =   game_mode() == MODE_ARCADE &&
                                game_state() == ENDING_KRAUSER &&
                                prev(game_state()) == 0x09 &&
                                p1_character() == characters["Krauser"]
            )

achievement("Omega Kaiser", "Beat the game as Omega Krauser.", 10, type="win_condition",
                    trigger =   game_mode() == MODE_ARCADE &&
                                game_state() == ENDING_KRAUSER &&
                                prev(game_state()) == 0x09 &&
                                p1_character() == characters["Omega Krauser"]
            )

achievement("The Proud Peak of Fighters", "Defeat Krauser.", 5,
                    trigger =   p1_only() &&
                                game_mode() == MODE_ARCADE &&
                                game_state() == GS_FIGHTING &&
                                p2_character() == characters["Krauser"] &&
                                p1_won_a_match()
            )

achievement("Nightmare Geese", "Defeat Geese.", 50,
                    trigger =   p1_only() &&
                                game_mode() == MODE_ARCADE &&
                                game_state() == GS_FIGHTING &&
                                p2_character() == characters["Geese"] &&
                                p1_won_a_match()
            )

achievement("Marathon Brawler", "Reach 12 wins in Survival on default difficulty.", 25,
            trigger =   p1_only() &&  
                        game_mode() == MODE_SURVIVAL &&
                        survival_wins() == 12 &&
                        prev(survival_wins()) == 11 &&
                        settings_difficulty() >= 0x04
            )

// =========================================
//                   Misc              
// =========================================

achievement("What a Workout!", "Win a round with a Perfect.", 3,
            trigger =   p1_only() &&  
                        p1_hp() == 0xc0 &&
                        p1_rounds_won() > prev(p1_rounds_won())
            )

achievement("Feint Cancel", "Extend your combo through the use of Feint Cancel.", 3,
            trigger =   p1_active() &&
                        once(p1_hit_combo() == 1 && prev(p1_hit_combo()) == 0) &&
                        once(p1_moves() == 0x316) &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        never(p1_hit_combo() == 0)
            )

achievement("Final Impact", "Defeat your opponent with a P-Power.", 4,
            trigger =   p1_active() &&
                        game_state() == GS_FIGHTING &&
                        bit4(0x100d) > prev(bit4(0x100d))
            )


// =========================================
//              Desperation Move              
// =========================================

function achiev_hit_desp_moves(character, dm_counter) {
         achievement(format("Super {0}", character), format("Hit your Desperation Move 10 times as {0} during Arcade or Survival.", character), 5,
                     trigger =  game_state() == GS_FIGHTING &&
                                measured(dm_counter == 10) &&
                                prev(dm_counter) == 9
                     )
}

achiev_hit_desp_moves("Terry", desperation_moves_hit_terry())
achiev_hit_desp_moves("Mai", desperation_moves_hit_mai())
achiev_hit_desp_moves("Mary", desperation_moves_hit_blue_mary())
achiev_hit_desp_moves("Joe", desperation_moves_hit_joe())
achiev_hit_desp_moves("Kim", desperation_moves_hit_kim())
achiev_hit_desp_moves("Chonrei", desperation_moves_hit_chonrei())
achiev_hit_desp_moves("Chonshu", desperation_moves_hit_chonshu())
achiev_hit_desp_moves("Krauser", desperation_moves_hit_krauser())
achiev_hit_desp_moves("Geese", desperation_moves_hit_geese())


// =========================================
//                  Combo              
// =========================================

achievement("Power Charge", "Perform a 10-hit combo with a Super Cancel as Terry.", 5,
            trigger =   game_state() == GS_FIGHTING &&

                        p1_hit_combo() >= 10 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_character() == characters["Terry"] &&
                        once(p1_moves() == 0x302) && // special move

                        once(p1_moves() == 0x320 && p1_hit_combo() > prev(p1_hit_combo())) &&
                        never(p1_hit_combo() == 0)
            )

achievement("Straight Slice", "Perform a 20-hit combo with a Super Cancel as any Blue Mary.", 5,
            trigger =   game_state() == GS_FIGHTING &&

                        p1_hit_combo() >= 20 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        __ornext(p1_character() == characters["Blue Mary"] || p1_character() == characters["EX-Blue Mary"]) &&
                        once(p1_moves() == 0x2cb) && // special move

                        once(p1_moves() == 0x320 && p1_hit_combo() > prev(p1_hit_combo())) &&
                        never(p1_hit_combo() == 0)
            )

achievement("TNT Punch", "Perform a 30-hit combo using Screw Upper one time with a Super Cancel as any Joe.", 5,
            trigger =   game_state() == GS_FIGHTING &&

                        p1_hit_combo() >= 30 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        __ornext(p1_character() == characters["Joe"] || p1_character() == characters["EX-Joe"]) &&
                        once(p1_moves() == 0x2ee) && // special move
                        once(p1_moves() == 0x320 && p1_hit_combo() > prev(p1_hit_combo())) &&
                        never(tally(15, p1_moves() == 0x320 && p1_hit_combo() > prev(p1_hit_combo()))) &&
                        never(tally(2, p1_moves() == 0x320 && p1_moves() != prev(p1_moves()))) &&

                        never(p1_hit_combo() == 0)
            )

achievement("Riotous Butterfly Fan", "Perform a 18-hit combo with a Super Cancel as Mai.", 5,
            trigger =   game_state() == GS_FIGHTING &&

                        p1_hit_combo() >= 18 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_character() == characters["Mai"] &&
                        once(p1_moves() == 0x2f8) && // special move

                        once(p1_moves() == 0x320 && p1_hit_combo() > prev(p1_hit_combo())) &&
                        never(p1_hit_combo() == 0)
            )

achievement("E. God Bop I", "Perform a 10-hit combo with a Super Cancel as Chonrei.", 5,
            trigger =   game_state() == GS_FIGHTING &&

                        p1_hit_combo() >= 10 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_character() == characters["Chonrei"] &&
                        once(prev(p1_moves()) == 0x2da && p1_moves() == 0x320) && // specific super cancel check

                        once(p1_moves() == 0x320 && p1_hit_combo() > prev(p1_hit_combo())) &&
                        never(p1_hit_combo() == 0)
            )

achievement("E. God Bop II", "Perform a 18-hit combo with a Super Cancel as Chonshu.", 5,
            trigger =   game_state() == GS_FIGHTING &&

                        p1_hit_combo() >= 18 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_character() == characters["Chonshu"] &&
                        once(p1_moves() == 0x2e4) && // special move

                        once(p1_moves() == 0x320 && p1_hit_combo() > prev(p1_hit_combo())) &&
                        never(p1_hit_combo() == 0)
            )

achievement("Haki Kyaku", "Perform a 23-hit combo with a Super Cancel as Kim.", 5,
            trigger =   game_state() == GS_FIGHTING &&

                        p1_hit_combo() >= 23 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_character() == characters["Kim"] &&
                        once(p1_moves() == 0x2e4) && // special move

                        once(p1_moves() == 0x320 && p1_hit_combo() > prev(p1_hit_combo())) &&
                        never(p1_hit_combo() == 0)
            )

achievement("Kaiser Claw", "Perform a 12-hit combo with a Super Cancel as Krauser.", 5,
            trigger =   game_state() == GS_FIGHTING &&

                        p1_hit_combo() >= 12 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_character() == characters["Krauser"] &&
                        once(p1_moves() == 0x2c6) && // special move

                        once(p1_moves() == 0x320 && p1_hit_combo() > prev(p1_hit_combo())) &&
                        never(p1_hit_combo() == 0)
            )

achievement("Jaeiken", "Perform a 15-hit combo with a Super Cancel and Tiger-Killing Blow as Geese.", 5,
            trigger =   game_state() == GS_FIGHTING &&

                        p1_hit_combo() >= 15 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_character() == characters["Geese"] &&
                        once(p1_moves() == 0x2d5) && // special move
                        once(p1_moves() == 0x2da) && // special move

                        once(p1_moves() == 0x320 && p1_hit_combo() > prev(p1_hit_combo())) &&
                        never(p1_hit_combo() == 0)
            )

achievement("Vanishing Rush", "Perform a 15-hit combo using Kaiser Wave as Omega Krauser.", 5,
            trigger =   game_state() == GS_FIGHTING &&

                        p1_hit_combo() >= 15 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_character() == characters["Omega Krauser"] &&
                        once(p1_moves() == 0x320 && p1_hit_combo() > prev(p1_hit_combo())) &&

                        never(p1_hit_combo() == 0)
            )

// EX Characters
achievement("Fire Kick", "Perform a 10-hit combo with a Super Cancel as EX-Terry.", 5,
            trigger =   game_state() == GS_FIGHTING &&

                        p1_hit_combo() >= 10 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_character() == characters["EX-Terry"] &&
                        once(prev(p1_moves()) == 0x2df && p1_moves() == 0x320) && // specific super cancel check

                        once(p1_moves() == 0x320 && p1_hit_combo() > prev(p1_hit_combo())) &&
                        never(p1_hit_combo() == 0)
            )

achievement("Night Plover", "Perform a 15-hit combo with a Super Cancel as EX-Mai.", 5,
            trigger =   game_state() == GS_FIGHTING &&

                        p1_hit_combo() >= 15 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_character() == characters["EX-Mai"] &&
                        once(prev(p1_moves()) == 0x2ee) && // special moves

                        once(p1_moves() == 0x320 && p1_hit_combo() > prev(p1_hit_combo())) &&
                        never(p1_hit_combo() == 0)
            )

achievement("Rising Foot", "Perform a 14-hit combo using Mary Spider into M. Splash Rose and Rising Foot as EX-Blue Mary.", 5,
            trigger =   game_state() == GS_FIGHTING &&

                        p1_hit_combo() >= 14 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_character() == characters["EX-Blue Mary"] &&
                        once(p1_moves() == 0x397) && // special move
                        once(p1_moves() == 0x320 && p1_hit_combo() > prev(p1_hit_combo())) &&
                        p1_moves() == 0xa0 &&

                        never(p1_hit_combo() == 0)
            )


// Different Combos
achievement("Master of Extending Combos I", "Perform a 18-hit combo as EX-Terry.", 5,
            trigger =   game_state() == GS_FIGHTING &&

                        p1_hit_combo() >= 18 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_character() == characters["EX-Terry"] &&

                        never(p1_hit_combo() == 0)
            )

achievement("Master of Extending Combos II", "Perform a 9-hit combo using only normal attacks and Transcendent Dragon + E. Tashin Slash mid-combo as Chonrei.", 10,
            trigger =   game_state() == GS_FIGHTING &&

                        p1_hit_combo() >= 9 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_character() == characters["Chonrei"] &&

                        once(p1_moves() == 0x2ee || p1_moves() == 0x2ef) && // special move
                        once(p1_moves() == 0x2e4) && // special move

                        never(p1_moves() == 0x2bc) &&
                        never(p1_moves() == 0x2d0) &&
                        never(p1_moves() == 0x2da) &&
                        never(p1_moves() == 0x320) &&

                        never(p1_hit_combo() == 0)
            )


// =========================================
//                Leaderboards              
// =========================================

leaderboard("Real Bout Genesis Survivor", "Highest wins in Survival mode on default difficulty.",
           start = p1_only() && game_mode() == MODE_SURVIVAL && game_state() == GS_FIGHTING && p2_rounds_won() > prev(p2_rounds_won()) && settings_difficulty() >= 4,
           cancel = always_false(),
           submit = always_true(),
           value = survival_wins(),
           format = "VALUE", lower_is_better=false
           )