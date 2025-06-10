// ~Hack~ Mortal Kombat II Plus
// #ID = 17539

// Game
function game_state() => word(0x00C03A)
         GS_FIGHTING = 0x02
         GS_SELECTING_CHARACTER = 0x04
         GS_PREFIGHT_SETUP = 0x06

function game_survival_mode() => bit0(0x07FF26)
function game_endurance_mode() => bit1(0x07FF28)
function game_arena() => word(0x00C358)
function game_difficulty_relative() => word(0x00C35A)
function game_human_perfomance_vs_cpu() => word(0x00C35C)

function arcade_fastest_time_seconds() => word(0x07FFA4)
function arcade_ladder_position() => word(0x00C366)
function arcade_current_battle() => word(0x00C368)

function survival_total_score() => word(0x07FFD8)
function survival_round_score() => word(0x00C354)

function endurance_p1_original_character() => byte(0x07FFA2)
function endurance_p2_original_character() => byte(0x07FFA6)
function endurance_type() => word(0x07FFAC)

function game_silhouttes() => word(0x07FFB0)
function game_jade_or_hornbuckle_beaten() => word(0x07FFC4)
function game_special_message() => bit0(0x00C340)


// Match
function fight_round() => word(0x00C35E)
function fight_winner_state() => word(0x00C360)
function fight_ladder_pointer() => word(0x00C362)

function fight_finishing_move() => word(0x00C338)
         FINISHING_FATALITY_1 = 1
         FINISHING_FATALITY_2 = 2 
         FINISHING_FATALITY_3 = 3
         FINISHING_BABALITY =  5
         FINISHING_FRIENDSHIP = 7
         FINISHING_PIT2 = 6 
         FINISHING_KOMBAT_TOMB = 8

function fight_round_end() => bit0(0x00C352)

function fight_timer_left_side() => word(0x00BD74)
function fight_timer_right_side() => word(0x00BD76)

function fight_finishing_type_announcer() => word(0x00C3EC)
function fight_stage_fatality_special_flag() => word(0x00C3EE)

function game_frames_not_constant() => byte(0x00BA12)

function sprites_object_array() => byte(0x00B766)

function audits_matches_won() => word(0x07FFC0)
function audit_double_flawless_victory() => word(0x07FFA0)

function pointer_p1_table_pointer_start_1() => tbyte(0x006DB0)

function debug_display_hitboxes() => word(0x00C3F6)
function ending_control_thread_data_pointer() => tbyte(0x00D1C6)

function pong_p1_score() => word(0x01638C)
function pong_p2_score() => word(0x01638E)

function temporary_ascii_stuff_1() => dword(0x017080)
function temporary_ascii_stuff_2() => dword(0x017084)

// Players
function p1_active_state() => word(0x00C03E)
function p2_active_state() => word(0x00C1B8)
         PS_INACTIVE = 0x00
         PS_FIGHTING = 0x01
         PS_SELECTING_CHARACTER = 0x03
         PS_CHARACTER_SELECTED = 0x04

// P1
function p1_object_data_pointer() => tbyte(0x00C044) / 8
function p1_control_data_pointer() => tbyte(0x00C04C) / 8
function p1_character() => word(0x00C050)
function p1_hp() => word(0x00C05E)

function p1_flawless_victories() => word(0x00C060)
function p1_rounds_wins() => word(0x00C062)
function p1_consecutive_wins() => word(0x00C36A)

function p1_hit_queue_array() => word(0x00C372)

// P1 control pointer
function p1_actual_character() => word(p1_object_data_pointer() + 0x3e)
function p1_action_state() => byte(p1_control_data_pointer() + 0x42)
function p1_human_controlled() => bit0(p1_control_data_pointer() + 0x42)
function p1_finish_him() => bit1(p1_control_data_pointer() + 0x42)

function p1_move() => word(p1_control_data_pointer() + 0x3e) // can be used as move ID
function p1_next_location_thread() => dword(p1_control_data_pointer() + 0x1c) // can be used as move ID
function p1_hit_combo() => word(p1_control_data_pointer() + 0x64)
function p1_combo_damage() => word(p1_control_data_pointer() + 0x68)

// P2
function p2_object_data_pointer() => tbyte(0x00C1BE) / 8
function p2_control_data_pointer() => tbyte(0x00C1C6) / 8
function p2_character() => word(0x00C1CA)
function p2_hp() => word(0x00C1D8)

function p2_rounds_wins() => word(0xc1dc)
function p2_consecutive_wins() => word(0x00C36C)
function p2_hit_queue_array() => word(0x00C37E)

// P2 control pointer
function p2_human_controlled() => bit0(p2_control_data_pointer() + 0x42)
function p2_being_attacked() => bit2(p2_control_data_pointer() + 0x42)

function p2_next_location_thread() => dword(p2_control_data_pointer() + 0x1c) // can be used as move ID
function p2_hit_combo() => word(p2_control_data_pointer() + 0x64)
function p2_combo_damage() => word(p2_control_data_pointer() + 0x68)

// Cheat codes
function cheat_string_display() => byte(0x060000)
function cheat_faster_uppercuts() => byte(0x060002)
function cheat_explosive_kombat() => byte(0x060004)
function cheat_blocking_disabled() => byte(0x060006)
function cheat_display_hitboxes() => byte(0x060008)
function cheat_going_back_in_time() => byte(0x06000A)
function cheat_disable_round_timer() => byte(0x06000C)
function cheat_disable_health_bars() => byte(0x06000E)
function cheat_throwing_disabled() => byte(0x060010)
function cheat_super_uppercuts() => byte(0x060012)
function cheat_randper_kombat() => byte(0x060014)
function cheat_tug_of_war() => byte(0x060016)
function cheat_la_luna_mode() => byte(0x060018)
function cheat_outworld_weather() => byte(0x06001A)
function cheat_tiny_fighters_unused() => byte(0x06001C)
function cheat_big_projectiles_unused() => byte(0x06001E)
function cheat_tiny_projectiles_unused() => byte(0x060020)
function cheat_finishing_tags_allowed_unused() => byte(0x060022)
function cheat_player_1_as_kintaro() => byte(0x060024)
function cheat_player_1_as_kintaro() => word(0x060024)
function cheat_player_1_as_shao_kahn() => byte(0x060026)
function cheat_player_1_as_shao_kahn() => word(0x060026)
function cheat_player_2_as_kintaro() => byte(0x060028)
function cheat_player_2_as_kintaro() => word(0x060028)
function cheat_player_2_as_shao_kahn() => byte(0x06002A)
function cheat_player_2_as_shao_kahn() => word(0x06002A)

// Turbo Spam
function turbo_spam_ram_uppercut_counters() => word(0x062400)
function turbo_spam_ram_spear_counters() => word(0x062402)
function turbo_spam_ram_slide_counters() => word(0x062404)
function turbo_spam_ram_forceball_counters() => word(0x062406)

characters = {
    "Kung Lao": 0x00,
    "Liu Kang": 0x01,
    "Cage": 0x02,
    "Baraka": 0x03,
    "Kitana": 0x04,
    "Mileena": 0x05,
    "Shang Tsung": 0x06,
    "Raiden": 0x07,
    "Sub-Zero": 0x08,
    "Reptile": 0x09,
    "Scorpion": 0x0a,
    "Jax": 0x0b,
    "Kintaro": 0x0c,
    "Shao Kahn": 0x0d,
    "Smoke": 0x0e,
    "Noob Saibot": 0x0f,
    "Jade": 0x10,
    "Hornbuckle": 0x11
}

// =========================================
//             Utility Functions              
// =========================================

function game_beaten() => arcade_ladder_position() == 0x0e && p2_character() == characters["Shao Kahn"] && p1_rounds_wins() == 2 && prev(p1_rounds_wins()) == 1
function reset_p1_only() => never(p1_active_state() == 0 && p1_human_controlled() == 0) && never(p2_active_state() != PS_INACTIVE)
function reset_cheat_protection() => never(cheat_string_display() == 1)

function is_arcade_mode() => game_survival_mode() == 0 && game_endurance_mode() == 0
function is_survival_mode() => game_survival_mode() == 1

function sweep_spam_protection() => never(repeated(2, p1_move() == 0x0106 && p1_move() != prev(p1_move())))

// =========================================
//               Progression              
// =========================================

achievement("Mortal Kombat II Plus", "Finish Arcade mode.", 10, type="win_condition",
            trigger =   reset_p1_only() &&
                        is_arcade_mode() &&
                        game_beaten()
            )

function achiev_beat_the_game(name, cheevo_id) {
    achievement(name, format("Finish Arcade mode using only {0}.", name), 10,
                trigger =   reset_p1_only() &&
                            is_arcade_mode() &&
                            once(p1_character() == characters[name] && p1_active_state() == PS_CHARACTER_SELECTED && arcade_ladder_position() == 0x00) &&
                            never(p1_character() != characters[name] && p1_rounds_wins() > prev(p1_rounds_wins())) &&
                            p1_character() == characters[name] &&
                            trigger_when(game_beaten()) 
                )
}

achiev_beat_the_game("Noob Saibot", 0)
achiev_beat_the_game("Smoke", 0)
achiev_beat_the_game("Jade", 0)

achievement("Like a Sub-Boss!!!", "Finish Arcade mode using only Kintaro.", 5,
            trigger =   reset_p1_only() &&
                        is_arcade_mode() &&
                        once(p1_character() == characters["Kintaro"] && arcade_ladder_position() == 0x00) &&
                        never(p1_character() != characters["Kintaro"] && p1_rounds_wins() > prev(p1_rounds_wins())) &&
                        p1_character() == characters["Kintaro"] &&
                        trigger_when(game_beaten())
            )

achievement("Like a Boss!!!", "Finish Arcade mode using only Shao Kahn.", 5,
            trigger =   reset_p1_only() &&
                        is_arcade_mode() &&
                        once(p1_character() == characters["Shao Kahn"] && arcade_ladder_position() == 0x00) &&
                        never(p1_character() != characters["Shao Kahn"] && p1_rounds_wins() > prev(p1_rounds_wins())) &&
                        p1_character() == characters["Shao Kahn"] &&
                        trigger_when(game_beaten())
            )


// =========================================
//               Challenge Run              
// =========================================

achievement("Arcade God", "Finish Arcade mode on Ultimate difficulty. No cheats allowed.", 25,
            trigger =   reset_p1_only() &&
                        is_arcade_mode() &&
                        reset_cheat_protection() &&
                        once(p1_active_state() == PS_CHARACTER_SELECTED && arcade_ladder_position() == 0x00 && game_difficulty_relative() == 0x09) &&
                        game_difficulty_relative() == 0x09 &&
                        trigger_when(game_beaten())
            )

achievement("MKII Survivalist", "Finish Survival mode.", 25,
            trigger =   reset_p1_only() &&
                        is_survival_mode() &&
                        game_beaten()
            )

achievement("Quick Survival", "Finish Survival mode in under 7m30s.", 50,
            trigger =   reset_p1_only() &&
                        is_survival_mode() &&
                        arcade_fastest_time_seconds() <= 450 &&
                        game_beaten()
            )

achievement("Survival Master", "Finish Survival mode with 850 points or higher.", 50,
            trigger =   reset_p1_only() &&
                        is_survival_mode() &&
                        survival_total_score() >= 850 &&
                        game_beaten()
            )

// =========================================
//               Unlock Miscs              
// =========================================

achievement("Chun Who?", "Finish the game without losing a match and having defeated Jade during Arcade mode.", 50,
            trigger =   reset_p1_only() &&
                        is_arcade_mode() &&
                        __ornext(p1_consecutive_wins() == 0x0e || p1_consecutive_wins() == 0x0f) &&
                        trigger_when(game_beaten())
            )

achievement("Mysterious Smoke", "Defeat Hornbuckle.", 50,
            trigger =   reset_p1_only() &&
                        __ornext(p2_character() == characters["Hornbuckle"] ||
                                 game_silhouttes() == 1) && 
                        trigger_when(p2_character() == characters["Hornbuckle"] &&
                                     p1_rounds_wins() == 2 && 
                                     prev(p1_rounds_wins()) == 1)
            )

achievement("Noob Clues", "Beat the game in under 12m48s.", 25,
            trigger =   reset_p1_only() &&
                        is_arcade_mode() &&
                        arcade_fastest_time_seconds() <= 768 &&
                        arcade_fastest_time_seconds() > 0 &&
                        game_beaten()
            )

// =========================================
//                   Misc             
// =========================================

achievement("Double Trouble", "Defeat an endurance match.", 5,
            trigger =   reset_p1_only() &&
                        is_arcade_mode() &&
                        endurance_type() == 1 &&
                        p1_rounds_wins() == 2 && prev(p1_rounds_wins()) == 1
            )

achievement("Random Kombat II", "Win 5 matches with the Randper Kombat cheat activated during a Arcade playthrough.", 10,
            trigger =   reset_p1_only() &&
                        is_arcade_mode() &&
                        measured(repeated(5, p1_rounds_wins() == 2 && prev(p1_rounds_wins()) == 1 && 
                                             cheat_randper_kombat() == 1)) &&
                        never(game_state() == 0x13) // reset on mode select
            )

achievement("Acid Rain", "Win 5 matches with the Outworld Weather cheat activated during a Arcade playthrough.", 10,
            trigger =   reset_p1_only() &&
                        is_arcade_mode() &&
                        measured(repeated(5, p1_rounds_wins() == 2 && prev(p1_rounds_wins()) == 1 && 
                                             cheat_outworld_weather() == 1)) &&
                        never(game_state() == 0x13) // reset on mode select
            )

achievement("Tug of War", "Win a match with the Tug of War cheat activated.", 3,
            trigger =   reset_p1_only() &&
                        is_arcade_mode() &&
                        p1_rounds_wins() == 2 && prev(p1_rounds_wins()) == 1 && 
                        cheat_tug_of_war() == 1
            )


// =========================================
//              Finishing Moves              
// =========================================

achievement(
    title = "Flawless Victory", points = 2,
    description = "Defeat your opponent with a Flawless Victory.",
    trigger =   p1_flawless_victories() == 1 && prev(p1_flawless_victories()) == 0 && 
                p1_active_state() != 0 && 
                p2_active_state() == 0 &&
                game_state() == 5
)

achievement(
    title = "Double Flawless", points = 5,
    description = "Defeat your opponent with a Double Flawless Victory.",
    trigger =   p1_flawless_victories() == 2 && prev(p1_flawless_victories()) == 1 && 
                p1_active_state() != 0 && 
                p2_active_state() == 0 &&
                game_state() == 5
)

achievement("Invisible Explosion", "Perform every single finishing moves as Smoke during an Arcade playthrough.", 5,
            trigger =   reset_p1_only() &&
                        unless(p1_hp() == 0) &&
                        unless(p1_character() != characters["Smoke"]) &&
                        measured(tally(4, 
                                once(prev(fight_finishing_move()) == 1 && fight_finishing_move() == 0xFFFF),
                                once(prev(fight_finishing_move()) == 2 && fight_finishing_move() == 0xFFFF),
                                once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 0xFFFF),
                                once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 0xFFFF)
                              )) &&
                        (always_true() || never(game_state() == 0x13))
            )

achievement("Fan Decaptation", "Perform every single finishing moves as Jade during an Arcade playthrough.", 5,
            trigger =   reset_p1_only() &&
                        unless(p1_hp() == 0) &&
                        unless(p1_character() != characters["Jade"]) &&
                        measured(tally(4, 
                                once(p1_next_location_thread() == 0xff8bbf90),
                                once(p1_next_location_thread() == 0xff8cc9b0),
                                once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 0xFFFF),
                                once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 0xFFFF)
                              )) &&
                        (always_true() || never(game_state() == 0x13))
            )


achievement("Boon Slice", "Perform every single finishing move as Noob Saibot during an Arcade playthrough.", 5,
            trigger =   reset_p1_only() &&
                        unless(p1_hp() == 0) &&
                        unless(p1_character() != characters["Noob Saibot"]) &&
                        measured(tally(4, 
                                once(p1_next_location_thread() == 0xff8c4930),
                                once(p1_next_location_thread() == 0xff8bc710),
                                once(prev(fight_finishing_move()) == 5 && fight_finishing_move() == 0xFFFF),
                                once(prev(fight_finishing_move()) == 7 && fight_finishing_move() == 0xFFFF)
                              )) &&
                        (always_true() || never(game_state() == 0x13))
            )

achievement("ROOOAAARRR!", "Perform a Fatality as Kintaro.", 3,
            trigger =   p1_active_state() > 0 &&
                        p1_rounds_wins() == 2 &&
                        never(p1_character() != characters["Kintaro"]) &&
                        (
                            (prev(fight_finishing_move()) == 1 && fight_finishing_move() == 0xFFFF) ||
                            (prev(fight_finishing_move()) == 2 && fight_finishing_move() == 0xFFFF)
                        )
            )

achievement("Feel the Power of Shao Kahn!", "Perform a Fatality as Shao Kahn.", 3,
            trigger =   p1_active_state() > 0 &&
                        p1_rounds_wins() == 2 &&
                        never(p1_character() != characters["Shao Kahn"]) &&
                        (
                            (prev(fight_finishing_move()) == 1 && fight_finishing_move() == 0xFFFF) ||
                            (prev(fight_finishing_move()) == 2 && fight_finishing_move() == 0xFFFF)
                        )
            )

achievement("Let The Bodies Hit The Floor", "Drop the body into the ground during the Kombat Tomb's Pit Fatality.", 3,
            trigger =   p1_active_state() > 0 &&
                        once(fight_finishing_move() == FINISHING_KOMBAT_TOMB) &&
                        never(fight_winner_state() == 0) &&
                        p2_next_location_thread() == 0xff8eb290 &&
                        p2_next_location_thread() != prev(p2_next_location_thread())            
            )

// =========================================
//                  Combos              
// =========================================

//   0x51 = 50% damage
//   0x61 = 60% damage
//   0x72 = 70% damage
//   0xa1 = 100% damage

achievement("Shredder", "Perform a 4-hit combo using Slice and Shredder as Baraka. No cheats allowed except Tug of War.", 5,
            trigger =   p1_active_state() > 0 &&
                        never(p1_character() != characters["Baraka"]) &&
                        never(p1_hit_combo() == 0) &&
                        once(p1_move() == 0x11d && p1_move() != prev(p1_move())) &&
                        once(p1_move() == 0x11e && p1_move() != prev(p1_move())) &&
                        p1_hit_combo() >= 4 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        (cheat_string_display() - cheat_tug_of_war()) != 1 &&
                        sweep_spam_protection() &&
                        never(p1_finish_him() == 1 && p2_being_attacked() == 0) &&
                        never(game_state() == 5)
            )

achievement("Roll", "Perform a 4-hit combo using Roll two times as Mileena. No cheats allowed except Tug of War.", 5,
            trigger =   p1_active_state() > 0 &&
                        never(p1_character() != characters["Mileena"]) &&
                        never(p1_hit_combo() == 0) &&
                        repeated(2, p1_move() == 0x020e && p1_move() != prev(p1_move())) &&
                        p1_hit_combo() >= 4 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        (cheat_string_display() - cheat_tug_of_war()) != 1 &&
                        sweep_spam_protection() &&
                        never(p1_finish_him() == 1 && p2_being_attacked() == 0) &&
                        never(game_state() == 5)
            )

// maybe need to check for morphs?
achievement("Flaming Skull", "Perform a 4-hit combo using Flaming Skull as Shang Tsung. No cheats allowed except Tug of War.", 3,
            trigger =   p1_active_state() > 0 &&
                        never(p1_actual_character() != characters["Shang Tsung"]) &&
                        never(p1_hit_combo() == 0) &&
                        once(p1_move() >= 0x000c && p1_move() <= 0x000e && p1_move() != prev(p1_move())) &&
                        p1_hit_combo() >= 4 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        (cheat_string_display() - cheat_tug_of_war()) != 1 &&
                        sweep_spam_protection() &&
                        never(p1_finish_him() == 1 && p2_being_attacked() == 0) &&
                        never(game_state() == 5)
            )

achievement("Torpedo", "Perform a 4-hit combo using Torpedo as Raiden. No cheats allowed except Tug of War.", 5,
            trigger =   p1_active_state() > 0 &&
                        never(p1_character() != characters["Raiden"]) &&
                        never(p1_hit_combo() == 0) &&
                        once(p1_move() == 0x0209 && p1_move() != prev(p1_move())) &&
                        p1_hit_combo() >= 4 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        (cheat_string_display() - cheat_tug_of_war()) != 1 &&
                        sweep_spam_protection() &&
                        never(p1_finish_him() == 1 && p2_being_attacked() == 0) &&
                        never(game_state() == 5)
            )

achievement("Teleport and Spear", "Perform a 7-hit combo using Teleport and Spear as Scorpion. No cheats allowed except Tug of War.", 5,
            trigger =   p1_active_state() > 0 &&
                        never(p1_character() != characters["Scorpion"]) &&
                        never(p1_hit_combo() == 0) &&
                        once(p1_move() == 0x020a && p1_move() != prev(p1_move())) &&
                        once(p1_move() == 0x0011 && p1_move() != prev(p1_move())) &&
                        p1_hit_combo() >= 7 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        (cheat_string_display() - cheat_tug_of_war()) != 1 &&
                        sweep_spam_protection() &&
                        never(p1_finish_him() == 1 && p2_being_attacked() == 0) &&
                        never(game_state() == 5)
            )

achievement("Backbreaker", "Perform a 3-hit combo using Backbreaker as Jax. No cheats allowed except Tug of War.", 5,
            trigger =   p1_active_state() > 0 &&
                        never(p1_character() != characters["Jax"]) &&
                        never(p1_hit_combo() == 0) &&
                        once(p1_move() == 0x0109 && p1_move() != prev(p1_move())) &&
                        p1_hit_combo() >= 3 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        (cheat_string_display() - cheat_tug_of_war()) != 1 &&
                        sweep_spam_protection() &&
                        never(p1_finish_him() == 1 && p2_being_attacked() == 0) &&
                        never(game_state() == 5)
            )

// can possibly be changed to 5-hit combo
achievement("Fan Throw", "Perform a 5-hit combo using Air Fan Throw as Kitana. No cheats allowed except Tug of War.", 5,
            trigger =   p1_active_state() > 0 &&
                        never(p1_character() != characters["Kitana"]) &&
                        never(p1_hit_combo() == 0) &&
                        once(p1_move() == 0x0009 && p1_move() != prev(p1_move())) &&
                        p1_hit_combo() >= 5 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        (cheat_string_display() - cheat_tug_of_war()) != 1 &&
                        sweep_spam_protection() &&
                        never(p1_finish_him() == 1 && p2_being_attacked() == 0) &&
                        never(game_state() == 5)
            )

// can possibly be changed to 6-hit combo
achievement("Air Freeze", "Perform a 6-hit combo using Air Freeze and Slide as Sub-Zero. No cheats allowed except Tug of War.", 5,
            trigger =   p1_active_state() > 0 &&
                        never(p1_character() != characters["Sub-Zero"]) &&
                        never(p1_hit_combo() == 0) &&
                        once(p1_move() == 0x020c && p1_move() != prev(p1_move())) &&
                        once(p1_next_location_thread() == 0xffff1d30 && p1_next_location_thread() != prev(p1_next_location_thread())) &&
                        p1_hit_combo() >= 6 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        (cheat_string_display() - cheat_tug_of_war()) != 1 &&
                        sweep_spam_protection() &&
                        never(p1_finish_him() == 1 && p2_being_attacked() == 0) &&
                        never(game_state() == 5)
            )

// can possibly be changed to 7-hit combo
achievement("Acid Ball", "Perform a 7-hit combo using Force Ball and Slide as Reptile. No cheats allowed except Tug of War.", 5,
            trigger =   p1_active_state() > 0 &&
                        never(p1_character() != characters["Reptile"]) &&
                        never(p1_hit_combo() == 0) &&
                        once(p1_move() == 0x020c && p1_move() != prev(p1_move())) &&
                        once(p1_move() == 0x0013 && p1_move() != prev(p1_move())) &&
                        p1_hit_combo() >= 7 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        (cheat_string_display() - cheat_tug_of_war()) != 1 &&
                        sweep_spam_protection() &&
                        never(p1_finish_him() == 1 && p2_being_attacked() == 0) &&
                        never(game_state() == 5)
            )

// can possibly be changed to 5-hit combo
achievement("Dash Throw", "Perform a 5-hit combo using Teleport, Spear and Dash Throw as Smoke. No cheats allowed except Tug of War.", 5,
            trigger =   p1_active_state() > 0 &&
                        never(p1_character() != characters["Smoke"]) &&
                        never(p1_hit_combo() == 0) &&
                        once(p1_move() == 0x0507 && p1_move() != prev(p1_move())) &&
                        once(p1_move() == 0x020a && p1_move() != prev(p1_move())) &&
                        once(p1_move() == 0x0011 && p1_move() != prev(p1_move())) &&
                        p1_hit_combo() >= 5 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        (cheat_string_display() - cheat_tug_of_war()) != 1 &&
                        sweep_spam_protection() &&
                        never(p1_finish_him() == 1 && p2_being_attacked() == 0) &&
                        never(game_state() == 5)
            )


// NOOB CAN BE 6 HIT
achievement("Noob Slide", "Perform a 6-hit combo using Spear and Slide as Noob. No cheats allowed except Tug of War.", 5,
            trigger =   p1_active_state() > 0 &&
                        never(p1_character() != characters["Noob Saibot"]) &&
                        never(p1_hit_combo() == 0) &&
                        once(p1_move() == 0x020c && p1_move() != prev(p1_move())) &&
                        once(p1_move() == 0x0011 && p1_move() != prev(p1_move())) &&
                        p1_hit_combo() >= 6 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        (cheat_string_display() - cheat_tug_of_war()) != 1 &&
                        sweep_spam_protection() &&
                        never(p1_finish_him() == 1 && p2_being_attacked() == 0) &&
                        never(game_state() == 5)
            )

achievement("Bronze Fan Throw", "Perform a 5-hit combo using Air Fan Throw as Jade. No cheats allowed except Tug of War.", 5,
            trigger =   p1_active_state() > 0 &&
                        never(p1_character() != characters["Jade"]) &&
                        never(p1_hit_combo() == 0) &&
                        once(p1_move() == 0x0009 && p1_move() != prev(p1_move())) &&
                        p1_hit_combo() >= 5 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        (cheat_string_display() - cheat_tug_of_war()) != 1 &&
                        sweep_spam_protection() &&
                        never(p1_finish_him() == 1 && p2_being_attacked() == 0) &&
                        never(game_state() == 5)
            )

achievement("Diving Kick", "Perform a 3-hit combo using Diving Kick as Kung Lao. No cheats allowed except Tug of War.", 5,
            trigger =   p1_active_state() > 0 &&
                        never(p1_character() != characters["Kung Lao"]) &&
                        never(p1_hit_combo() == 0) &&
                        once(p1_move() == 0x020d && p1_move() != prev(p1_move())) &&
                        p1_hit_combo() >= 3 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        (cheat_string_display() - cheat_tug_of_war()) != 1 &&
                        sweep_spam_protection() &&
                        never(p1_finish_him() == 1 && p2_being_attacked() == 0) &&
                        never(game_state() == 5)
            )

achievement("Bicycle Kick", "Perform a 3-hit combo using Air Fire Ball and Bicycle Kick as Liu Kang. No cheats allowed except Tug of War.", 5,
            trigger =   p1_active_state() > 0 &&
                        never(p1_character() != characters["Liu Kang"]) &&
                        never(p1_hit_combo() == 0) &&
                        once(p1_move() == 0x0204 && p1_move() != prev(p1_move())) &&
                        once(p1_move() == 0x0004 && p1_move() != prev(p1_move())) &&
                        p1_hit_combo() >= 3 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        (cheat_string_display() - cheat_tug_of_war()) != 1 &&
                        sweep_spam_protection() &&
                        never(p1_finish_him() == 1 && p2_being_attacked() == 0) &&
                        never(game_state() == 5)
            )

achievement("Shadow Kick", "Perform a 4-hit combo using Split Punch and Shadow Kick as Johnny Cage. No cheats allowed except Tug of War.", 5,
            trigger =   p1_active_state() > 0 &&
                        never(p1_character() != characters["Cage"]) &&
                        never(p1_hit_combo() == 0) &&
                        once(p2_hit_queue_array() == 0x010a && p2_hit_queue_array() != prev(p2_hit_queue_array())) &&
                        once(p1_move() == 0x0205 && p1_move() != prev(p1_move())) &&
                        p1_hit_combo() >= 4 && p1_hit_combo() > prev(p1_hit_combo()) &&
                        (cheat_string_display() - cheat_tug_of_war()) != 1 &&
                        sweep_spam_protection() &&
                        never(p1_finish_him() == 1 && p2_being_attacked() == 0) &&
                        never(game_state() == 5)
            )

achievement("Outworld's Secrets", "Perform a 100% damage combo against a regular opponent. No cheats allowed except Tug of War.", 10,
            trigger =   p1_active_state() > 0 &&
                        game_state() == GS_FIGHTING &&
                        never(p1_hit_combo() == 0) &&
                        p2_character() != characters["Kintaro"] &&
                        once(p1_hit_combo() == 1 && prev(p1_hit_combo()) == 0) &&
                        p1_combo_damage() >= 0xa1 && p1_combo_damage() > prev(p1_combo_damage()) &&
                        (cheat_string_display() - cheat_tug_of_war()) != 1 &&
                        sweep_spam_protection() &&
                        never(p1_finish_him() == 1 && p2_being_attacked() == 0) &&
                        never(game_state() == 5)
            )

// =========================================
//                Leaderboard              
// =========================================

leaderboard("Arcade - Best Time", "Best time on Arcade mode.",
           start =  reset_p1_only() &&
                    is_arcade_mode() &&
                    arcade_fastest_time_seconds() != 0 &&
                    game_beaten(),
           cancel = always_false(),
           submit = always_true(),
           value = arcade_fastest_time_seconds() * 60,
           format = "FRAMES", lower_is_better=true)

leaderboard("Survival - Highest Score", "Best score on Survival mode.",
           start =  reset_p1_only() &&
                    is_survival_mode() &&
                    game_beaten(),
           cancel = always_false(),
           submit = always_true(),
           value = survival_total_score(),
           format = "VALUE", lower_is_better=false)

leaderboard("Survival - Best time", "Best time on Survival mode.",
           start =  reset_p1_only() &&
                    is_survival_mode() &&
                    arcade_fastest_time_seconds() != 0 &&
                    game_beaten(),
           cancel = always_false(),
           submit = always_true(),
           value = arcade_fastest_time_seconds() * 60,
           format = "FRAMES", lower_is_better=true)