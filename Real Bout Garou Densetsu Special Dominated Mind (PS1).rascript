// Real Bout Garou Densetsu Special: Dominated Mind
// #ID = 13920

// Settings
function settings_round_timer() => byte(0x19AD6C)
function settings_difficulty() => byte(0x19AD6D)
function settings_p1_simple_special_move() => byte(0x19AD70)
function settings_p2_simple_special_move() => byte(0x19AD71)

function default_settings() => settings_round_timer() == 1 && settings_difficulty() >= 2

// Game
function game_state() => byte(0x1A000C)
		 GS_BOOTING_THE_GAME = 0x00
		 GS_BEST_PLAYERS = 0x03
		 GS_WATCHING_THE_INTRO = 0x01
		 GS_CHARACTER_SELECT = 0x07
		 GS_SELECTING_A_OPPONENT = 0x08
		 GS_LOADING = 0x0B
		 GS_FIGHTING = 0x0D
	 	 GS_ROUND_END = 0x0E
		 GS_ROUND_RESULTS = 0x10
		 GS_WINNER_SCREEN = 0x12
		 GS_CONTINUE = 0x14
		 GS_GAME_BEATEN_FMV = 0x16
		 GS_RANKING_SCREEN = 0x17
		 GS_MAIN_MENU = 0x18

function game_mode() => byte(0x1A134E)
		 MODE_ARCADE = 0x00
		 MODE_VERSUS = 0x01
		 MODE_SURVIVAL = 0x02
		 MODE_PRACTICE = 0x03

function game_player_mode() => byte(0x1A0012)
function game_arcade_match() => word(0x1A1262)
function game_total_arcade_grade_score() => word(0x1A12C2)
function survival_timer_seconds() => word(0x1A20C8)
function survival_timer_milliseconds() => word(0x1a20ca)
function survival_rounds_passed() => byte(0x1a12d0)

function round_count() => byte(0x1A1264)
function round_timer() => byte(0x1A12E6)
function round_best_time() => word(0x1A12E8)

// Match Results

function p1_rounds_won() => byte(0x1A12B4)
function p2_rounds_won() => byte(0x1A12B5)
function p1_score() => dword(0x1A1334)

function p1_fighting_level_1st_round() => byte(0x1A12DC)
function p1_fighting_level_2nd_round() => byte(0x1A12DD)
function p2_fighting_level_1st_round() => byte(0x1A12DE)
function p2_fighting_level_2nd_round() => byte(0x1A12DF)
function p1_round_finishing_move() => byte(0x1A1319)

// P1

function p1_character() => byte(0x1A1252)
function p1_active_state() => byte(0x19AD2C)
function p1_hp() => byte(0x19B5BD)
function p1_hit_combo() => byte(0x1A2008)
function p1_controller() => byte(0x19FFCF)
function p1_macro_buttons() => low4(0x19FFCF)

function p1_animation() => tbyte(0x19B4FC)
function p1_moves() => byte(0x19B5E8)
function p1_special_moves() => word(0x19B5FC)
function p1_command_normals() => word(0x19b5fe)

function p1_move_hit_type() => byte(0x1A20C2)
function p1_final_impact() => byte(0x1A20C4)

function p1_breakshot() => bit0(0x19B5BA)
function p1_quick_approach() => bit0(0x19B5F6)
function p1_action() => word(0x19b5f4)

function p1_action_flags_1() => byte(0x19B600)
function p1_action_flags_2() => byte(0x19B601)

function p1_quick_approach_parry() => bit6(0x19b601)
function p1_performing_special_move() => bit5(0x19b601)

// P2
function p2_character() => byte(0x1A1254)
function p2_active_state() => byte(0x19AD2D)
function p2_hp() => byte(0x19B6F5)

function p2_animation() => tbyte(0x19B634)
function p2_special_moves() => word(0x19B734)

characters = {
    "Terry": 0x01,
    "Andy": 0x02,
    "Joe": 0x03,
    "Mai": 0x04,
    "Geese": 0x05,
    "Sokaku": 0x06,
    "Bob Wilson": 0x07,
    "Hon-Fu": 0x08,
    "Blue Mary": 0x09,
    "Franco Bash": 0x0A,
    "Yamazaki": 0x0B,
    "Chonshu": 0x0C,
    "Chonrei": 0x0D,
    "Duck King": 0x0E,
    "Kim": 0x0F,
    "Billy": 0x10,
    "Cheng": 0x11,
    "Tung Fu Rue": 0x12,
    "Laurence": 0x13,
    "Krauser": 0x14,
    "Alfred": 0x15,
    "White": 0x16
}

// Utility Functions

function p1_only() => never(p1_active_state() == 0) && never(p2_active_state() > 0)

function arcade_beaten() {
    return(
        game_state() == GS_GAME_BEATEN_FMV &&
        prev(game_state())  == GS_ROUND_RESULTS &&
        game_arcade_match() == 9
    )
}

function survival_beaten() {
    return(
        survival_rounds_passed() == 0x15 &&
        prev(survival_rounds_passed()) == 0x14 &&
        p1_rounds_won() == 1
    )
}

function arcade_mode_start() => game_arcade_match() == 1 && game_state() == 7
function arcade_mode_has_started() => game_arcade_match() == 1 && round_count() == 1 && round_best_time() > 0 && prev(round_best_time() == 0)

function p1_won_a_round() => p1_rounds_won() > prev(p1_rounds_won())
function p1_won_a_match() => p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1

// uses "p1_special_move" memory
function p1_hit_with_dm_sp(desp_move_id) {
    return(
        p1_special_moves() == desp_move_id &&
        p1_hit_combo() > prev(p1_hit_combo())
    )
}

// uses "p1_moves" memory
function p1_hit_with_dm_range(move1, move2) {
    return(
        p1_moves() >= move1 &&
        p1_moves() <= move2 &&
        p1_hit_combo() > prev(p1_hit_combo())
    )
}

function pause_used_simple_command() {
    return(
        disable_when(p1_special_moves() > 0 && prev(p1_macro_buttons()) > 0 && settings_p1_simple_special_move() == 0x01,
                     p1_special_moves() == 0
                     )
    )
}

function reset_used_simple_command() => never(p1_macro_buttons() > prev(p1_macro_buttons()) && settings_p1_simple_special_move() == 0x01)
    
function reset_jumpin_action() {
    return (
        never(p1_action() == 0x4000 && p1_action() != prev(p1_action()) && p1_special_moves() == 0x00) &&
        never(p1_action() == 0x8000 && p1_action() != prev(p1_action()) && p1_special_moves() == 0x00) &&
        never(p1_action() == 0x2000 && p1_action() != prev(p1_action()) && p1_special_moves() == 0x00) &&
        never(p1_action() == 0x1000 && p1_action() != prev(p1_action()) && p1_special_moves() == 0x00) &&
        never(p1_action() == 0x0800 && p1_action() != prev(p1_action()) && p1_special_moves() == 0x00) &&
        never(p1_action() == 0x0400 && p1_action() != prev(p1_action()) && p1_special_moves() == 0x00)
    )
} 

// =========================================
//             Arcade Progression              
// =========================================

achievement("Dominated Mind", "Beat the game.", 5, type="win_condition",
            trigger = p1_only() &&
                      game_mode() == MODE_ARCADE &&
                      arcade_beaten()
            )

function achiev_beat_the_game(title, char) {
    achievement(title, format("Beat the game using only {0} on default settings.", char), 10,
                trigger =   p1_only() &&
                            game_mode() == MODE_ARCADE &&
                            default_settings() &&
                            once(arcade_mode_start()) &&
                            never(p1_character() != characters[char] && p1_won_a_round()) &&
                            p1_character() == characters[char] &&
						    trigger_when(arcade_beaten())
                )
}

achiev_beat_the_game("The Beloved Eternal Hungry Wolf", "Terry")
achiev_beat_the_game("The Disciplined Fist of Elegance", "Andy")
achiev_beat_the_game("The Smiling Hurricane of Muay Thai", "Joe")
achiev_beat_the_game("The Fiery Beauty of the Shiranui Flame", "Mai")
achiev_beat_the_game("The Great Dance Fighter", "Duck King")
achiev_beat_the_game("The Iron Sage of South Town", "Tung Fu Rue")
achiev_beat_the_game("The Rhythmic Whirlwind of Capoeira", "Bob Wilson")
achiev_beat_the_game("The Man Who Battles the Shura Inside", "Sokaku")
achiev_beat_the_game("The Street Demon with the Flaming Reach", "Billy")
achiev_beat_the_game("The Tyrant King of South Town", "Geese")
achiev_beat_the_game("The Proud Peak of Fighters", "Krauser")
achiev_beat_the_game("The Crimson Matador of Vengeance", "Laurence")
achiev_beat_the_game("The Crimson Light of the Emperial Fist", "Chonrei")
achiev_beat_the_game("The Dark Seal of Emperial Power", "Chonshu")
achiev_beat_the_game("The Clumsy Cop with Fiery Justice", "Hon-Fu")
achiev_beat_the_game("The Deranged Fang of Chaos", "Yamazaki")
achiev_beat_the_game("The Silent Agent of Unbreakable Resolve", "Blue Mary")
achiev_beat_the_game("The Relentless Powerhouse Dad", "Franco Bash")
achiev_beat_the_game("The Righteous Kicker of Justice", "Kim")
achiev_beat_the_game("The Rolling Tycoon of Greed and Might", "Cheng")
achiev_beat_the_game("The Soaring Hero with the Sky’s Blessing", "Alfred")

achievement("Soy Sauce on Geese", "Challenge Geese and defeat him during Arcade mode on default settings.", 10,
            trigger =   p1_only() &&
                        game_mode() == MODE_ARCADE &&
                        default_settings() &&
                        p2_character() == characters["Geese"] &&
                        p1_won_a_match()
            )

achievement("The Devil's Pleasure", "Beat the game on Expert difficulty and default settings.", 25,
            trigger =   p1_only() &&
                        game_mode() == MODE_ARCADE &&
                        default_settings() &&
                        settings_difficulty() == 7 &&
                        trigger_when(arcade_beaten())
            )

achievement("A Clockwork Orange", "Beat the game without using a continue on default settings.", 25,
                trigger =   p1_only() &&
                            game_mode() == MODE_ARCADE &&
                            default_settings() &&
                            once(arcade_mode_start()) &&
                            never(p1_active_state() == 2) &&
						    trigger_when(arcade_beaten())
                )

achievement("Surviving Mind", "Finish Survival mode.", 25,
            trigger =   game_player_mode() == 0x01 &&
                        game_mode() == MODE_SURVIVAL &&
                        survival_beaten()
            )

achievement("Always Zooming", "Finish Survival mode within 7 minutes.", 25,
            trigger =   game_player_mode() == 0x01 &&
                        game_mode() == MODE_SURVIVAL &&
                        survival_timer_seconds() <= 420 &&
                        trigger_when(survival_beaten())
            )

// =========================================
//                   Misc              
// =========================================

achievement("Final Impact", "Defeat your opponent with a Final Impact.", 5,
            trigger =   p1_only() &&
                        p1_move_hit_type() == 0x04 &&
                        p1_move_hit_type() != prev(p1_move_hit_type()) &&
                        p2_hp() == 0xff
            )

achievement("Recovery Roll", "Perform a Recovery Roll.", 2,
            trigger =   never(p1_active_state() == 0) &&
                        p1_animation() == 0x44930 &&
                        prev(p1_animation()) != 0x44930
            )

achievement("Quick Approach", "Parry a hit three times with Quick Approach.", 3,
            trigger =   never(p1_active_state() == 0) &&
                        measured(tally(3, p1_quick_approach_parry() > prev(p1_quick_approach_parry())))
            )

achievement("Break Shot", "Perform a Break Shot three times.", 3,
            trigger =   never(p1_active_state() == 0) &&
                        measured(tally(3, p1_breakshot() > prev(p1_breakshot())))
            )

achievement("The Best Offense Is a Good Defense", "Parry a hit during Quick Approach and then cancel it into a 5-hit combo with a Special Move.", 5,
            trigger =   never(p1_active_state() == 0) &&
                        once(p1_quick_approach_parry() > prev(p1_quick_approach_parry())) &&
                        never(dword(0x19B730) == 0 && tbyte(0x19b734) == 0 && p1_hit_combo() == 0) &&
                        trigger_when(p1_hit_combo() >= 5 &&
                                     p1_hit_combo() > prev(p1_hit_combo()) &&
                                     p1_performing_special_move() == 1
                                     ) 
            )

achievement("Jaguar Combo", "Perform all six sequences from Bob Wilson's throw.", 10,
            trigger =   never(p1_active_state() == 0) &&
                        unless(p1_character() != characters["Bob Wilson"]) &&
                        measured(tally(6, 
                                       once(p1_moves() == 0xb2 && p1_moves() != prev(p1_moves())),
                                       once(p1_moves() == 0x7c && p1_moves() != prev(p1_moves())),
                                       once(p1_moves() == 0xb3 && p1_moves() != prev(p1_moves())),
                                       once(p1_moves() == 0xad && p1_moves() != prev(p1_moves())),
                                       once(p1_moves() == 0xa6 && p1_moves() != prev(p1_moves())),
                                       once(p1_moves() == 0xb5 && p1_moves() != prev(p1_moves()))
                        ))
            
            )

achievement("Deadly Rave", "Perform the entire sequence of Deadly Rave as Geese.", 3,
            trigger =   never(p1_active_state() == 0) &&
                        p1_character() == characters["Geese"] &&
                        p1_moves() == 0xce &&
                        prev(p1_moves()) == 0xcd
            )

achievement("Unlimited Desire", "Perform the entire sequence of Unlimited Desire, finishing with Gigatec Cyclone as Krauser.", 5,
            trigger =   never(p1_active_state() == 0) &&
                        p1_character() == characters["Krauser"] &&
                        p1_moves() == 0xcf &&
                        prev(p1_moves()) == 0xcd
            )

achievement("Francisco Batedor", "Hit your enemy 10 times after the round is over as Franco Bash.", 5,
            trigger =   never(p1_active_state() == 0) &&
                        never(p1_character() != characters["Franco Bash"]) &&
                        never(game_state() != GS_ROUND_END) &&
                        measured(tally(10, p1_hit_combo() > prev(p1_hit_combo()))) 
            )

achievement("Not Jebaited", "Parry White's projectile after the round is over.", 3,
            trigger =   p1_only() &&
                        p2_hp() == 0x00 &&
                        never(p2_character() != characters["White"]) &&
                        never(game_arcade_match() != 0x09) &&
                        never(round_count() != prev(round_count())) &&
                        never(p2_hp() == 0xff) &&
                        once(p2_animation() == 0x1c2a24) &&
                        trigger_when(p1_quick_approach_parry() > prev(p1_quick_approach_parry()))
            )

// =========================================
//             Desperation Moves              
// =========================================

achievement("High Angle Geyser", "Hit your opponent with all Desperation Moves as Terry against the CPU (no Simple Command).", 5,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Terry"]) &&
                        measured(tally(3,
                                       once(p1_hit_with_dm_sp(0x0800)),
                                       once(p1_hit_with_dm_sp(0x0200)),
                                       once(p1_hit_with_dm_sp(0x0100))
                                      )) &&
                        pause_used_simple_command()
            )

achievement("Hexadrive", "Hit your opponent with all Desperation Moves as Alfred against the CPU (no Simple Command).", 5,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Alfred"]) &&
                        measured(tally(3,
                                       once(p1_hit_with_dm_range(0xb8, 0xba)),
                                       once(p1_hit_with_dm_sp(0x0200)),
                                       once(p1_hit_with_dm_range(0xbe, 0xcf))
                                      )) &&
                        pause_used_simple_command()
            )

achievement("Crimson Explosion", "Hit your opponent with all Desperation Moves as Mai against the CPU (no Simple Command).", 5,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Mai"]) &&
                        measured(tally(2,
                                       once(p1_hit_with_dm_sp(0x0800)),
                                       once(p1_hit_with_dm_sp(0x0200))
                                      )) &&
                        pause_used_simple_command()
            )

achievement("Collapse of Creation", "Hit your opponent with all Desperation Moves as Cheng against the CPU (no Simple Command).", 5,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Cheng"]) &&
                        measured(tally(3,
                                       once(p1_hit_with_dm_sp(0x0800)),
                                       once(p1_hit_with_dm_sp(0x0200)),
                                       once(p1_move_hit_type() == 0x03 && prev(p1_move_hit_type()) == 0x01 && p1_special_moves() == 0)
                                      )) &&
                        pause_used_simple_command()
            )

achievement("Phoenix Kick Dance", "Hit your opponent with all Desperation Moves as Kim against the CPU (no Simple Command).", 4,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Kim"]) &&
                        measured(tally(2,
                                       once(p1_hit_with_dm_sp(0x0800)),
                                       once(p1_hit_with_dm_sp(0x0200))
                                      )) &&
                        pause_used_simple_command()
            )

achievement("Emperor Reverse Scale Fist", "Hit your opponent with all Desperation Moves as Chonrei against the CPU (no Simple Command).", 5,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Chonrei"]) &&
                        measured(tally(3,
                                       once(p1_hit_with_dm_sp(0x0800)),
                                       once(p1_hit_with_dm_sp(0x0200)),
                                       once(p1_hit_with_dm_sp(0x0100))
                                      )) &&
                        pause_used_simple_command()
            )

achievement("G-G-G-Guts Dunk!!", "Hit your opponent with all Desperation Moves as Franco Bash against the CPU (no Simple Command).", 5,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Franco Bash"]) &&
                        measured(tally(3,
                                       once(p1_hit_with_dm_sp(0x0800)),
                                       once(p1_moves() == 0xc5 && p1_hit_combo() > prev(p1_hit_combo())),
                                       once(__ornext(p1_moves() == 0xce || p1_animation() == 0x04104c) && p1_hit_combo() > prev(p1_hit_combo()))
                                      )) &&
                        pause_used_simple_command()
            )

achievement("Break Spiral", "Hit your opponent with all Desperation Moves as Duck King against the CPU (no Simple Command).", 10,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Duck King"]) &&
                        measured(tally(5,
                                       once(p1_hit_with_dm_sp(0x0800)),
                                       once(p1_hit_with_dm_sp(0x2000)),
                                       once(p1_hit_with_dm_sp(0x4000) && p1_moves() == 0xac),
                                       once(p1_hit_with_dm_sp(0x4000) && p1_moves() == 0xa7),
                                       once(p1_hit_with_dm_sp(0x8000))
                                      )) &&
                        pause_used_simple_command()
            )

achievement("Cadenza Storm", "Hit your opponent with all Desperation Moves as Hon-Fu against the CPU (no Simple Command).", 5,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Hon-Fu"]) &&
                        measured(tally(2,
                                       once(p1_hit_with_dm_sp(0x0800)),
                                       once(p1_hit_with_dm_sp(0x0200))
                                      )) &&
                        pause_used_simple_command()
            )

achievement("Demonic Hurricane Fist", "Hit your opponent with Raging Storm and Demonic Hurricane Fist as Geese against the CPU (no Simple Command).", 5,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Geese"]) &&
                        measured(tally(2,
                                       once(p1_hit_with_dm_sp(0x0800)),
                                       once(p1_hit_with_dm_sp(0x0200))
                                      )) &&
                        pause_used_simple_command()
            )

achievement("Burn Tiger Heel", "Hit your opponent with all Desperation Moves as Joe against the CPU (no Simple Command).", 5,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Joe"]) &&
                        measured(tally(3,
                                       once(p1_hit_with_dm_sp(0x0800)),
                                       once(p1_hit_with_dm_sp(0x0200)),
                                       once(p1_hit_with_dm_sp(0x0100))
                                      )) &&
                        pause_used_simple_command()
            )

achievement("Mary Splash Rose", "Hit your opponent with all Desperation Moves as Blue Mary against the CPU (no Simple Command).", 5,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Blue Mary"]) &&
                        measured(tally(3,
                                       once(p1_hit_with_dm_sp(0x0400)),
                                       once(p1_hit_with_dm_sp(0x0200)),
                                       once(p1_hit_with_dm_sp(0x0100))
                                      )) &&
                        pause_used_simple_command()
            )

achievement("Gigatec Cyclone", "Hit your opponent with Kaiser Wave and Gigatec Cyclone as Krauser against the CPU (no Simple Command).", 5,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Krauser"]) &&
                        measured(tally(2,
                                       once(p1_hit_with_dm_sp(0x0800)),
                                       once(p1_hit_with_dm_sp(0x0200))
                                      )) &&
                        pause_used_simple_command()
            )

achievement("Yondan Drill", "Hit your opponent with all Desperation Moves as Yamazaki against the CPU (no Simple Command).", 4,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Yamazaki"]) &&
                        measured(tally(2,
                                       once(p1_hit_with_dm_sp(0x0800)),
                                       once(p1_hit_with_dm_sp(0x0200))
                                      )) &&
                        pause_used_simple_command()
            )

achievement("Emperor Dragon Fist", "Hit your opponent with all Desperation Moves as Chonshu against the CPU (no Simple Command).", 5,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Chonshu"]) &&
                        measured(tally(4,
                                       once(p1_hit_with_dm_sp(0x0800)),
                                       once(p1_hit_with_dm_sp(0x0400)),
                                       once(p1_hit_with_dm_sp(0x0200)),
                                       once(p1_hit_with_dm_sp(0x0100))
                                      )) &&
                        pause_used_simple_command()
            )

achievement("Burning Kane", "Hit your opponent with all Desperation Moves as Billy Kane against the CPU (no Simple Command).", 5,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Billy"]) &&
                        measured(tally(3,
                                       once(p1_hit_with_dm_sp(0x0800)),
                                       once(p1_special_moves() == 0x0100 && p1_hit_combo() > 0 && p1_animation() == 0x1ba484), 
                                       once(p1_special_moves() == 0x0100 && p1_hit_combo() > 0 && p1_animation() == 0x1b9f8c)
                                      )) &&
                        pause_used_simple_command()
            )

achievement("Mad Spin Wolf", "Hit your opponent with all Desperation Moves as Bob Wilson against the CPU (no Simple Command).", 4,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Bob Wilson"]) &&
                        measured(tally(2,
                                       once(p1_hit_with_dm_sp(0x0800)),
                                       once(p1_hit_with_dm_sp(0x0200))
                                      )) &&
                        pause_used_simple_command()
            )

achievement("Certain Death", "Hit your opponent with all Desperation Moves as Laurence against the CPU (no Simple Command).", 4,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Laurence"]) &&
                        measured(tally(2,
                                       once(p1_hit_with_dm_sp(0x0800)),
                                       once(p1_hit_with_dm_sp(0x0200))
                                      )) &&
                        pause_used_simple_command()
            )

achievement("Ascension Whirlwind Palm", "Hit your opponent with all Desperation Moves as Tung Fu Rue against the CPU (no Simple Command).", 5,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Tung Fu Rue"]) &&
                        measured(tally(3,
                                       once(p1_hit_with_dm_sp(0x0800)),
                                       once(p1_hit_with_dm_sp(0x0200)),
                                       once(p1_hit_with_dm_sp(0x0100))
                                      )) &&
                        pause_used_simple_command()
            )

achievement("Sokaku Splat", "Hit your opponent with all Desperation Moves as Sokaku against the CPU (no Simple Command).", 4,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Sokaku"]) &&
                        measured(tally(2,
                                       once(p1_hit_with_dm_sp(0x0800)),
                                       once(p1_hit_with_dm_sp(0x0200))
                                      )) &&
                        pause_used_simple_command()
            )

achievement("Rising Dragon Bullet", "Hit your opponent with all Desperation Moves as Andy against the CPU (no Simple Command).", 5,
            trigger =   p1_only() &&
                        never(game_mode() == MODE_PRACTICE) &&
                        never(p1_character() != characters["Andy"]) &&
                        measured(tally(3,
                                       once(p1_hit_with_dm_sp(0x0800)),
                                       once(p1_hit_with_dm_sp(0x0200)),
                                       once(p1_hit_with_dm_sp(0x0100))
                                      )) &&
                        pause_used_simple_command()
            )

// =========================================
//                   Combos              
// =========================================

achievement("Power Wave", "Perform a 13-hit combo with a Final Impact as Terry using no more than a single jump-in (no Simple Command).", 5,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Terry"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        once(p1_final_impact() == 1) &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x13 &&
                        reset_jumpin_action() &&
                        reset_used_simple_command()
            )

achievement("Critical Wing", "Perform a 12-hit combo with a Final Impact as Alfred using no more than a single jump-in (no Simple Command).", 5,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Alfred"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        p1_final_impact() == 1 &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x12 &&
                        reset_jumpin_action() &&
                        reset_used_simple_command()
            )

achievement("Riotous Butterfly Fan", "Perform a 12-hit + 1-hit combo (before full recovery) with a Final Impact as Mai using no more than a single jump-in (no Simple Command).", 5,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Mai"]) &&
                        never(p1_hit_combo() == 0x00 && p1_final_impact() == 0) &&
                        never(repeated(6, p1_hit_combo() == 0x00 && p1_final_impact() == 1)) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        p1_final_impact() == 1 &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        repeated(13, p1_hit_combo() > prev(p1_hit_combo())) &&
                        reset_jumpin_action() &&
                        reset_used_simple_command()
            )

achievement("Life's Great Journey", "Perform a 13-hit combo with a Final Impact using Life's Great Journey as Cheng (no Simple Command).", 4,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Cheng"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        once(p1_animation() == 0x1ba8a4) &&
                        p1_special_moves() == 0x0200 &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x13 &&
                        reset_jumpin_action() &&
                        reset_used_simple_command()
            )

achievement("Phoenix Flattner", "Perform a 19-hit combo with a Final Impact using Phoenix Flattner two times as Kim (no Simple Command).", 10,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Kim"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        once(p1_final_impact() == 1) &&
                        repeated(2, p1_special_moves() == 0x0800 && prev(p1_special_moves()) != 0x0800) &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x19 &&
                        reset_used_simple_command()
            )

achievement("Emperor Crunch", "Perform a 7-hit combo with a Final Impact by charging two hits of Empire Destiny Slash as Chonrei using no more than a single jump-in (no Simple Command).", 5,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Chonrei"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        repeated(2, p1_final_impact() == 1 && p1_hit_combo() > prev(p1_hit_combo())) &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x07 &&
                        reset_jumpin_action() &&
                        reset_used_simple_command()
            )

achievement("Double Kong", "Perform a 5-hit + 15-hit combo with a Final Impact as Franco Bash using no more than a single jump-in (no Simple Command).", 5,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Franco Bash"]) &&
                        never(p1_final_impact() == 0 && p1_hit_combo() == 0) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        repeated(20, p1_hit_combo() >  prev(p1_hit_combo())) &&
                        once(p1_final_impact() == 1) &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        reset_jumpin_action() &&
                        reset_used_simple_command()
            )

achievement("Beat Rush", "Perform a 25-hit combo with a Final Impact as Duck King using no more than a single jump-in (no Simple Command).", 5,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Duck King"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        once(p1_final_impact() == 1) &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x25 &&
                        reset_jumpin_action() &&
                        reset_used_simple_command()
            )

achievement("Sky of Fire Noogie", "Perform a 31-hit combo with a Final Impact as Hon-Fu using no more than a single jump-in (no Simple Command).", 4,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Hon-Fu"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        p1_final_impact() == 1 &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x31 &&
                        reset_jumpin_action() &&
                        reset_used_simple_command()
            )

achievement("Gale Fist", "Perform a 11-hit combo with a Final Impact using Deadly Rave and Raging Storm as Geese (no Simple Command).", 10,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Geese"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        once(p1_final_impact() == 1) &&
                        once(p1_special_moves() == 0x0800 && p1_hit_combo() > prev(p1_hit_combo())) &&
                        once(p1_special_moves() == 0x0100 && p1_hit_combo() > prev(p1_hit_combo())) &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x11 &&
                        reset_used_simple_command()
            )

achievement("Hurricane Upper", "Perform a 11-hit combo with a Final Impact as Joe using no more than a single jump-in (no Simple Command).", 4,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Joe"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        p1_final_impact() == 1 &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x11 &&
                        reset_jumpin_action() &&
                        reset_used_simple_command()
            )

achievement("Face Lock", "Perform a 12-hit combo with a Final Impact as Blue Mary using no more than a single jump-in (no Simple Command).", 5,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Blue Mary"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        p1_final_impact() == 1 &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x12 &&
                        reset_jumpin_action() &&
                        reset_used_simple_command()
            )

achievement("Hurricane Fist", "Perform a 18-hit combo as Geese using Hurricane Fist into Demonic Hurricane Fist (no Simple Command).", 10,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Geese"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        once(p1_special_moves() == 0x0008 && prev(p1_special_moves()) != 0x0008) &&
                        once(p1_special_moves() == 0x0200 && p1_hit_combo() > prev(p1_hit_combo())) &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x18 &&
                        reset_used_simple_command()
            )

achievement("Good Night Backbreaker", "Perform a 10-hit combo as Blue Mary using Leg Press into Good Night Backbreaker (no Simple Command).", 5,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Blue Mary"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        once(p1_moves() == 0x2a && p1_hit_combo() > prev(p1_hit_combo())) &&
                        once(p1_special_moves() == 0x2000 && p1_hit_combo() > prev(p1_hit_combo())) &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x10 &&
                        reset_used_simple_command()
            )

achievement("Blitz Ball", "Perform a 18-hit combo with a Final Impact using Deadly Rave and Kaiser Wave as Krauser (no Simple Command).", 10,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Krauser"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        once(p1_final_impact() == 1) &&
                        once(p1_special_moves() == 0x0800 && p1_hit_combo() > prev(p1_hit_combo())) &&
                        once(p1_special_moves() == 0x0100 && p1_hit_combo() > prev(p1_hit_combo())) &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x18 &&
                        reset_used_simple_command()
            )

achievement("Judgement Dagger", "Perform a 32-hit combo with a Final Impact into Hell Stomp as Yamazaki using no more than a single jump-in (no Simple Command).", 5,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Yamazaki"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        once(p1_final_impact() == 1) &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_moves() == 0x2a && p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x32 &&
                        reset_jumpin_action() &&
                        reset_used_simple_command()
            )

achievement("Sight Of Heaven Whop", "Perform a 19-hit combo with a Final Impact as Chonshu using no more than a single jump-in (no Simple Command).", 4,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Chonshu"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        p1_final_impact() == 1 &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x19 &&
                        reset_jumpin_action() &&
                        reset_used_simple_command()
            )

achievement("Cudgel Cruncher", "Perform a 3-hit combo with a Final Impact as Billy using no more than a single jump-in (no Simple Command).", 3,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Billy"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        p1_final_impact() == 1 &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x03 &&
                        reset_jumpin_action() &&
                        reset_used_simple_command()
            )

achievement("Bison Horn", "Perform a 18-hit combo with a Final Impact into Leg Drop as Bob Wilson (no Simple Command).", 5,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Bob Wilson"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        once(p1_final_impact() == 1) &&
                        p1_moves() == 0x2b && p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x18 &&
                        reset_used_simple_command()
            )

achievement("Bloody Saber", "Perform a 13-hit combo with a Final Impact as Laurence using no more than a single jump-in (no Simple Command).", 4,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Laurence"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        p1_final_impact() == 1 &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x13 &&
                        reset_jumpin_action() &&
                        reset_used_simple_command()
            )

achievement("Energy Wave", "Perform a 16-hit combo with a Final Impact as Tung Fu Rue using no more than a single jump-in (no Simple Command).", 5,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Tung Fu Rue"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        p1_final_impact() == 1 &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x16 &&
                        reset_jumpin_action() &&
                        reset_used_simple_command()
            )

achievement("Makibishi Masher", "Perform a 6-hit combo with a Final Impact into Lightning Strike as Sokaku using no more than a single jump-in (no Simple Command).", 5,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Sokaku"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        once(p1_final_impact() == 1) &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_moves() == 0x28 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x06 &&
                        reset_jumpin_action() &&
                        reset_used_simple_command()
            )

achievement("Flying Slice", "Perform a 15-hit combo with a Final Impact as Andy using no more than a single jump-in (no Simple Command).", 5,
            trigger =   p1_active_state() == 1 &&
                        never(p1_character() != characters["Andy"]) &&
                        never(p1_hit_combo() == 0x00) &&
                        once(p1_hit_combo() > 0 && prev(p1_hit_combo()) == 0) &&
                        p1_final_impact() == 1 &&
                        p1_hit_combo() > prev(p1_hit_combo()) &&
                        p1_hit_combo() >= 0x15 &&
                        reset_jumpin_action() &&
                        reset_used_simple_command()
            )

// Score
leaderboard("Dominated Score [Level-3]", "Highest score during an Arcade run on default settings (1CC).",
           start = p1_only() && game_mode() == MODE_ARCADE && arcade_mode_has_started() && default_settings() && settings_difficulty() < 7,
           cancel = p1_active_state() != 0x01 || game_player_mode() != 0x01,
           submit = arcade_beaten(),
           value = p1_score(),
           format = "VALUE", lower_is_better=false)

leaderboard("Dominated Score [Level-8]", "Highest score during an Arcade run on the hardest difficulty default settings (1CC).",
           start = p1_only() && game_mode() == MODE_ARCADE && arcade_mode_has_started() && default_settings() && settings_difficulty() == 7,
           cancel = p1_active_state() != 0x01 || game_player_mode() != 0x01,
           submit = arcade_beaten(),
           value = p1_score(),
           format = "VALUE", lower_is_better=false)

// Grade
leaderboard("Dominated Grade [Level-3]", "Highest grade score during an Arcade run on default settings.",
           start = p1_only() && game_mode() == MODE_ARCADE && arcade_mode_has_started() && default_settings() && settings_difficulty() < 7,
           cancel = p1_active_state() == 0x00 || game_player_mode() != 0x01,
           submit = arcade_beaten(),
           value = game_total_arcade_grade_score(),
           format = "VALUE", lower_is_better=false)

leaderboard("Dominated Grade [Level-8]", "Highest grade score during an Arcade run on the hardest difficulty default settings.",
           start = p1_only() && game_mode() == MODE_ARCADE && arcade_mode_has_started() && default_settings() && settings_difficulty() == 7,
           cancel = p1_active_state() == 0x00 || game_player_mode() != 0x01,
           submit = arcade_beaten(),
           value = game_total_arcade_grade_score(),
           format = "VALUE", lower_is_better=false)

// Speedrun
leaderboard("Dominated Speedrun [Level-3]", "Fastest time to finish Arcade mode on default settings.",
           start = p1_only() && game_mode() == MODE_ARCADE && arcade_mode_has_started() && default_settings() && settings_difficulty() < 7,
           cancel = p1_active_state() == 0x00 || game_player_mode() != 0x01,
           submit = arcade_beaten(),
           value = round_best_time() > prev(round_best_time()),
           format = "FRAMES", lower_is_better=true)

leaderboard("Dominated Speedrun [Level-8]", "Fastest time to finish Arcade mode on on the hardest difficulty and default settings.",
           start = p1_only() && game_mode() == MODE_ARCADE && arcade_mode_has_started() && default_settings() && settings_difficulty() == 7,
           cancel = p1_active_state() == 0x00 || game_player_mode() != 0x01,
           submit = arcade_beaten(),
           value = round_best_time() > prev(round_best_time()),
           format = "FRAMES", lower_is_better=true)

leaderboard("Survival Score", "Highest score on Survival mode.",
           start =  game_player_mode() == 0x01 &&
                    game_mode() == MODE_SURVIVAL &&
                    survival_beaten(),
           cancel = always_false(),
           submit = always_true(),
           value = p1_score(),
           format = "VALUE", lower_is_better=false)

leaderboard("Survival Speedrun", "Fastest time to finish Survival mode.",
           start =  game_player_mode() == 0x01 &&
                    game_mode() == MODE_SURVIVAL &&
                    survival_beaten(),
           cancel = always_false(),
           submit = always_true(),
           value = (survival_timer_seconds() * 60) + survival_timer_milliseconds(),
           format = "FRAMES", lower_is_better=true)