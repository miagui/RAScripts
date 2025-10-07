// Street Fighter III: 3rd Strike - Fight for the Future
// #ID = 20691

// =========================================
//              Memory Acessors              
// =========================================

// Settings
function default_extra_options() {
    return (
        dword(0x63415C) == 0x30301 && word(0x634160) == 0x100 &&
        dword(0x634164) == 0x2020000 && 
        word(0x634168) == 0x808 && extra_options_sa_gauge_increase_speed() == 0x02 &&
        dword(0x63416C) == 0x2020202 &&
        dword(0x634174) == 0x1010101 && word(0x634178) == 0x101
    )
}

function default_settings() {
    return (
        settings_difficulty() >= 2 &&
        settings_time_limit() == 2 &&
        settings_rounds_1p() == 1 &&
        settings_rounds_vs() == 1 &&
        settings_damage_level() == 1 &&
        settings_system_direction() == 0 &&
        default_extra_options()
    )
}

function default_settings_level8() {
    return (
        settings_difficulty() == 7 &&
        settings_time_limit() == 2 &&
        settings_rounds_1p() == 1 &&
        settings_rounds_vs() == 1 &&
        settings_damage_level() == 1 &&
        settings_system_direction() == 0 &&
        default_extra_options()
    )
}

function default_settings_any_rounds() {
    return (
        settings_difficulty() >= 2 &&
        settings_time_limit() == 2 &&
        settings_damage_level() == 1 &&
        settings_system_direction() == 0 &&
        default_extra_options()
    )
}

function settings_system_direction() => byte(0x4F9BA1)
function settings_extra_option_unlocked() => byte(0x634133)
function settings_difficulty() => byte(0x4F9C00)
function settings_time_limit() => byte(0x4F9C01)
function settings_rounds_1p() => byte(0x4F9C02)
function settings_rounds_vs() => byte(0x4F9C03)
function settings_damage_level() => byte(0x4F9C04)

function extra_options_life_gauge_type() => byte(0x63415C)
function extra_options_1p_vitality() => byte(0x63415D)
function extra_options_2p_vitality() => byte(0x63415E)
function extra_options_guard_type() => byte(0x63415F)
function extra_options_automatic_rapid_shot() => byte(0x634160)
function extra_options_bonus_stage() => byte(0x634161)
function extra_options_1p_sa_gauge_type() => byte(0x634164)
function extra_options_2p_sa_gauge_type() => byte(0x634165)
function extra_options_1p_sa_gauge_stocks() => byte(0x634166)
function extra_options_2p_sa_gauge_stocks() => byte(0x634167)
function extra_options_1p_sa_gauge_length() => byte(0x634168)
function extra_options_2p_sa_gauge_length() => byte(0x634169)
function extra_options_sa_gauge_increase_speed() => byte(0x63416A)
function extra_options_1p_stun_gauge_length() => byte(0x63416C)
function extra_options_2p_stun_gauge_length() => byte(0x63416D)
function extra_options_stun_gauge_increase_speed() => byte(0x63416E)
function extra_options_stun_gauge_recovery() => byte(0x63416F)
function extra_options_screen_text_display() => byte(0x634174)
function extra_options_life_gauge_display() => byte(0x634175)
function extra_options_timer_display() => byte(0x634176)
function extra_options_stun_gauge_display() => byte(0x634177)
function extra_options_sa_gauge_display() => byte(0x634178)
function extra_options_press_start_display() => byte(0x634179)

// Game
function game_mode() => byte(0x4F9BC4)
function game_state() => byte(0x4F9D94)
function game_state_16bits() => word(0x4F9D94)
function game_state_32bits() => dword(0x4F9D94)
function game_bgm() => byte(0x4F9394)
function game_parry_bonus_game_balls_parried() => byte(0x4F999C)
function game_arcade_match() => byte(0x4F9A70)

function match_state() => word(0x4F9D9C)
function match_current_round() => byte(0x4FA1BC)
function match_fighting() => byte(0x4FA1C0)

function round_timer() => byte(0x4FA1D0)
function round_finishing_type_super_finish() => bit7(0x4F9B34)
function round_finishing_type() => byte(0x4F9B34)
function round_finishing_type_shun_goku_satsu() => bit3(0x4F9B35)
function round_finishing_type() => byte(0x4F9B35)

function arcade_perfects() => byte(0x4F9EF4)
function arcade_super_finishes() => byte(0x4F9EFC)
function arcade_p1_continues_used() => byte(0x4FA080)


// P1 and P2
function p1_human_controlled() => bit0(0x563DA3)
function p2_human_controlled() => bit0(0x56420F)

function p1_rounds_won() => byte(0x4F9CEC)
function p2_rounds_won() => byte(0x4F9CED)

function p1_character() => byte(0x4FA1C4)
function p2_character() => byte(0x4FA1C5)

function p1_super_art() => byte(0x4FA1B0)
function p2_super_art() => byte(0x4FA1B1)

function p1_score() => dword(0x4FA250)
function p2_score() => dword(0x4FA260)

function p1_hp() => word(0x563E3E)
function p2_hp() => word(0x5642AA)

// P1
function p1_hit_combo() => word(0x563CF8)
function p1_special_moves() => word(0x563DC8)
function p1_moves() => dword(0x563E4C)
function p1_taunt_id() => byte(0x563E60)
function p1_state1() => byte(0x563FAC)
function p1_state2() => byte(0x563FAE)
function p1_state3() => byte(0x563FAF)
function p1_move_type() => byte(0x564084)
function p1_taunt_buff_stun_recovery() => word(0x5641AC)
function p1_taunt_buff_damage() => word(0x5641AE)
function p1_taunt_buff_throw_damage() => word(0x5641B0)
function p1_taunt_buff_stun() => word(0x5641B2)
function p1_taunt_buff_defense() => word(0x5641B4)
function p1_parry() => byte(0x5641E4)

// P2
function p2_dizzy_duration() => word(0x4F90A8)
function p2_stun() => word(0x4F90AE)
function p1_gauge_level() => byte(0x4F90E2)


// Rank Results
function p1_arcade_round_result_grade_score_offense_16_bits() => word(0x5623A0)
function p1_arcade_round_result_grade_score_defence_16_bits() => word(0x5623A2)
function p1_arcade_round_result_grade_score_tech_16_bits() => word(0x5623A4)
function p1_arcade_round_result_grade_score_ex_point_16_bits() => word(0x5623A6)
function p1_arcade_round_result_offense_dizzies_16_bits() => word(0x5623A8)
function p1_arcade_round_result_offense_highest_combo_16_bits() => word(0x5623AA)
function p1_arcade_round_result_offense_hits_16_bits() => word(0x5623AC)
function p1_arcade_round_result_offense_total_hits_16_bits() => word(0x5623AE)
function p1_arcade_round_result_blocked_attacks_16_bits_affects_nothing_on_score() => word(0x5623B0)
function p1_arcade_round_result_defense_remaining_hp_16_bits() => word(0x5623B2)
function p1_arcade_round_result_defense_parries_16_bits() => word(0x5623B4)
function p1_arcade_round_result_defense_consecutive_parries_16_bits() => byte(0x5623B6)
function p1_arcade_round_result_defense_consecutive_parries_16_bits() => word(0x5623B6)
function p1_arcade_round_result_defense_red_parries_16_bits() => byte(0x5623B8)
function p1_arcade_round_result_defense_red_parries_16_bits() => word(0x5623B8)
function p1_arcade_round_result_tech_first_attack_16_bits() => word(0x5623BC)
function p1_arcade_round_result_tech_universal_overheads_used_16_bits() => word(0x5623BE)
function p1_arcade_round_result_tech_throws_16_bits() => word(0x5623C2)
function p1_arcade_round_result_tech_tech_throw_16_bits() => word(0x5623C4)
function p1_arcade_round_result_tech_tech_roll_16_bits() => word(0x5623C6)
function p1_arcade_round_result_tech_taunts_perfomed_16_bits() => word(0x5623C8)
function p1_arcade_round_result_tech_reversals_perfomed_16_bits() => word(0x5623CA)
function p1_arcade_round_result_tech_special_moves_used_16_bits_dash_included() => word(0x5623CC)
function p1_arcade_round_result_tech_super_combos_used_16_bits() => word(0x5623CE)
function p1_arcade_round_result_ex_points_total_attacks_16_bits_used_for_hits_variation() => word(0x5623DE)
function p1_arcade_round_result_rank_16_bits() => word(0x5623E4)
function p1_vs_round_result_grade_score_offense_16_bits() => word(0x5623EC)
function p1_vs_round_result_grade_score_defence_16_bits() => word(0x5623EE)
function p1_vs_round_result_grade_score_tech_16_bits() => word(0x5623F0)
function p1_vs_round_result_grade_score_ex_point_16_bits() => word(0x5623F2)
function p1_vs_round_result_offense_dizzies_16_bits() => word(0x5623F4)
function p1_vs_round_result_offense_highest_combo_16_bits() => word(0x5623F6)
function p1_vs_round_result_offense_hits_16_bits() => word(0x5623F8)
function p1_vs_round_result_offense_total_hits_16_bits() => word(0x5623FA)
function p1_vs_round_result_blocked_attacks_16_bits_affects_nothing_on_score() => word(0x5623FC)
function p1_vs_round_result_defense_remaining_hp_16_bits() => word(0x5623FE)
function p1_vs_round_result_defense_parries_16_bits() => word(0x562400)
function p1_vs_round_result_defense_consecutive_parries_16_bits() => byte(0x562402)
function p1_vs_round_result_defense_consecutive_parries_16_bits() => word(0x562402)
function p1_vs_round_result_defense_red_parries_16_bits() => byte(0x562404)
function p1_vs_round_result_defense_red_parries_16_bits() => word(0x562404)
function p1_vs_round_result_tech_first_attack_16_bits() => word(0x562408)
function p1_vs_round_result_tech_universal_overheads_used_16_bits() => word(0x56240A)
function p1_vs_round_result_tech_throws_16_bits() => word(0x56240E)
function p1_vs_round_result_tech_tech_throw_16_bits() => word(0x562410)
function p1_vs_round_result_tech_tech_roll_16_bits() => word(0x562412)
function p1_vs_round_result_tech_taunts_perfomed_16_bits() => word(0x562414)
function p1_vs_round_result_tech_reversals_perfomed_16_bits() => word(0x562416)
function p1_vs_round_result_tech_special_moves_used_16_bits_dash_included() => word(0x562418)
function p1_vs_round_result_tech_super_combos_used_16_bits() => word(0x56241A)
function p1_vs_round_result_ex_points_total_attacks_16_bits_used_for_hits_variation() => word(0x56242A)
function p1_vs_round_result_rank_16_bits() => word(0x562430)

characters = {
   "Gill": 0,
   "Alex": 1,
   "Ryu": 2,
   "Yun": 3,
   "Dudley": 4,
   "Necro": 5,
   "Hugo": 6,
   "Ibuki": 7,
   "Elena": 8,
   "Oro": 9,
   "Yang": 10,
   "Ken": 11,
   "Sean": 12,
   "Urien": 13,
   "Akuma": 14,
   "Chun-Li": 15,
   "Makoto": 16,
   "Q": 17,
   "Twelve": 18,
   "Remy": 19
}

// =========================================
//             Utility Functions              
// =========================================

function player_won_match() => p1_rounds_won() == 2 && prev(p1_rounds_won()) == 1
function game_beaten() => game_arcade_match() == 0x0a && prev(game_arcade_match()) == 0x09
function p1_only() => p1_human_controlled() == 1 && p2_human_controlled() == 0

function is_ingame() => never(game_state() < 2) // basically a demo check
function is_arcade() => never(game_mode() != 0) 

// =========================================
//               Beat the game              
// =========================================

function achiev_beat_the_game(title, char) {
    achievement(title, format("Finish Arcade Mode using only {0} on any round settings and default settings.", char), 10, type="win_condition",
                trigger = p1_only() &&
                          is_arcade() &&
                          is_ingame() &&
                          once(p1_character() == characters[char] && game_arcade_match() == 0 && game_state_16bits() == 0x0102 && game_bgm() == 0x33) &&
                          never(p1_character() != characters[char] && game_arcade_match() > prev(game_arcade_match())) &&
                          p1_character() == characters[char] &&
                          trigger_when(game_beaten()) &&
                          default_settings_any_rounds()
                )
}

achiev_beat_the_game("Immortality Is Not a Gift. It Is a Responsibility.", "Gill")
achiev_beat_the_game("Use Your Head, or I Will!", "Alex")
achiev_beat_the_game("Trying Something New, Is to Explore Your True Potential.", "Ryu")
achiev_beat_the_game("Cheap? I Paid a Lot for This Hat!", "Yun")
achiev_beat_the_game("Fight like a Gentleman...  Live like a Gentleman!", "Dudley")
achiev_beat_the_game("A Little Battery Won't Kill Ya... Or Will It?", "Necro")
achiev_beat_the_game("I Am Number One!", "Hugo")
achiev_beat_the_game("Being a Shinobi Isn't Easy!", "Ibuki")
achiev_beat_the_game("Get Addicted to the Beat!", "Elena")
achiev_beat_the_game("Would You like to Meet My Pets?", "Oro")
achiev_beat_the_game("An Angry Fighter Is an Ineffective One...", "Yang")
achiev_beat_the_game("I Wish You Good Luck!", "Ken")
achiev_beat_the_game("Call the Fire Department, Cause I'm on Fire, Baby!", "Sean")
achiev_beat_the_game("How Can You Refuse to Bow to a Superior Being?", "Urien")
achiev_beat_the_game("Weakness Is a Disease... I Am the Cure!", "Akuma")
achiev_beat_the_game("Am I Still the Strongest Women in the World? Tell Me!", "Chun-Li")
achiev_beat_the_game("That Was a Lot Easier than I Thought It Would Be!", "Makoto")
achiev_beat_the_game("?!.........", "Q")
achiev_beat_the_game("00101.11010.01010.01111.00010", "Twelve")
achiev_beat_the_game("Why Am I Here, Anyway?", "Remy")


achievement("Psyche Out", "Finish Arcade Mode on 8-stars difficulty and default settings.", 10,
                trigger = p1_only() &&
                          is_arcade() &&
                          is_ingame() &&
                          trigger_when(game_beaten()) &&
                          default_settings() &&
                          settings_difficulty() == 7
            )


achievement("Live the Legend", "Finish Arcade Mode without using a continue on default settings.", 25,
                trigger = p1_only() &&
                          is_arcade() &&
                          is_ingame() &&
                          once(game_arcade_match() == 0 && game_state_16bits() == 0x0102) &&
                          never(p2_rounds_won() == 2 && prev(p2_rounds_won()) == 1) &&
                          trigger_when(game_beaten()) &&
                          default_settings()
                )

achievement("Third Strike", "Win a round with a Perfect on default settings.", 2,
            trigger =   p1_only() &&
                        is_arcade() &&
                        is_ingame() &&
                        p1_rounds_won() > prev(p1_rounds_won()) &&
                        p1_hp() == 0xa0 &&
                        default_settings()
            )


achievement("*heavy breathing*", "Defeat Q during Arcade Mode on default settings.", 25,
            trigger =   p1_only() &&
                        is_arcade() &&
                        is_ingame() &&
                        p2_character() == characters["Q"] &&
                        player_won_match() &&
                        default_settings()
            )

// =========================================
//               Leaderboards              
// =========================================

leaderboard(
    id = 87916, title = "Match - Best Fighting Grade Score",
    description = "Default settings.",
    start  = game_mode() == 0x00 && 
             p1_human_controlled() == 0x01 && p2_human_controlled() == 0x00 &&
             p1_rounds_won() == 0x02 && match_state() == 0x107 && prev(match_state()) != 0x107 &&
             default_settings(),
    cancel = always_false() &&
             ((p2_rounds_won() == 0x02 && prev(p2_rounds_won()) == 0x01) ||
              (game_state_16bits() != 0x202)),
    submit = always_true(),
    value = measured((p1_arcade_round_result_grade_score_offense_16_bits() + p1_arcade_round_result_grade_score_defence_16_bits() + p1_arcade_round_result_grade_score_tech_16_bits() + p1_arcade_round_result_grade_score_ex_point_16_bits())),
    format = "VALUE"
)

leaderboard(
    id = 87917, title = "Crush The Car - Best Time",
    description = "Default settings.",
    start  = game_mode() == 0x00 && game_bgm() == 0x3D && 
             p1_human_controlled() == 0x01 && p2_human_controlled() == 0x00 && 
             match_state() == 0x80B && prev(match_state()) != 0x80B &&
             default_settings(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(round_timer()),
    format = "SECS"
)

leaderboard(
    id = 87918, title = "Arcade - Best Score",
    description = "Default settings.",
    start  = game_mode() == 0x00 && p1_rounds_won() == 0x02 && __ornext(p2_character() == 0x00 || p2_character() == 0x01) && 
             game_arcade_match() == 0x0A && 
             game_state_32bits() == 0x10802 && prev(game_state_32bits()) != 0x10802 &&
             default_settings(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(p1_score()),
    format = "VALUE"
)

leaderboard(
    id = 87919, title = "Arcade - Best Score (1CC)",
    description = "Default settings.",
    start  = game_mode() == 0x00 && p1_rounds_won() == 0x02 && __ornext(p2_character() == 0x00 || p2_character() == 0x01) &&
             game_arcade_match() == 0x0A && 
             game_state_32bits() == 0x10802 && prev(game_state_32bits()) != 0x10802 &&
             default_settings() &&
             arcade_p1_continues_used() == 0x00,
    cancel = always_false(),
    submit = always_true(),
    value = measured(p1_score()),
    format = "VALUE"
)
