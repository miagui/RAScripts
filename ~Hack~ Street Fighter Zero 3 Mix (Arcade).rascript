// ~Hack~ Street Fighter Zero 3 Mix
// #ID = 19391

// Settings
function settings_damage_level() => byte(0x0080A0)
function settings_difficulty() => byte(0x0080A1)
function settings_game_speed() => byte(0x0080A2)
function settings_game_mode() => byte(0x0080DF)
		 MODE_SINGLE1R = 0x00
		 MODE_SINGLE3R = 0x01
		 MODE_TEAMPLAY = 0x02

function default_difficulty() => settings_difficulty() >= 1

function default_settings() {
    return(
        settings_damage_level() >= 1 &&
        settings_difficulty() >= 1
    )
}

// Game State
function game_state() => byte(0x008004)
         GS_TITLE_SCREEN = 0x00
         GS_CHARACTER_SELECT = 0x02
         GS_FIGHTING = 0x04
         GS_GAME_OVER = 0x08

function game_state_complement_1() => byte(0x008008)
function game_state_complement_2() => byte(0x00800C)
function game_state_complement_3() => byte(0x008000)

function game_active_players_connected() => byte(0x0080A9)
function game_active_players_in_game() => byte(0x0080AD)


// Match Information
function game_ladder_match() => byte(0x008114)
function arcade_ladder_opponents_defeated() => dword(0x008540)
function arcade_mbison_defeated() => bit2(0x008543)

function match_current_round() => byte(0x008102)
function match_super_combo_finisher_timer() => byte(0x008125)
function round_timer() => byte(0x008108)
function round_started() => byte(0x00812C)

// Players
function p1_character_slot_1() => byte(0x007F11)
function p1_character_slot_2() => byte(0x007F15)
function p1_character_slot_3() => byte(0x007F19)

function p2_character_slot_1() => byte(0x007F21)
function p2_character_slot_2() => byte(0x007F25)
function p2_character_slot_3() => byte(0x007F29)

// P1
function p1_current_character() => byte(0x008503)
function p1_health() => byte(0x008450)
function p1_gauge() => byte(0x00851E)
function p1_guard_bar() => byte(0x00864C)
function p1_cpu_controlled_flag() => byte(0x008524)
function p1_rounds_won() => byte(0x008527)
function p1_hit_combo() => byte(0x00885F)

function p1_score_00xx0000() => byte(0x008510)
function p1_score_xx000000() => byte(0x008511)
function p1_score_000000xx_continues() => byte(0x008512)
function p1_score_0000xx00() => byte(0x008513)

function p1_actions_state() => byte(0x008404)
         ACTION_DAMAGE_TAKING = 0x02
         ACTION_THROW = 0x04
         ACTION_PLAYER_WON = 0x08
         ACTION_ENEMY_WON = 0x0C
         ACTION_GROUND_RECOVERY = 0x10
         ACTION_ROLL_RECOVERY = 0x12
         ACTION_ROLL_OR_ESCAPE = 0x14

function p1_actions_state_complement() => byte(0x8406)

function p1_move_type() => byte(0x008407)
         MOVE_IDLE = 0x00
         MOVE_CROUCHING = 0x02
         MOVE_WALKING = 0x04
         MOVE_JUMPING = 0x06
         MOVE_NORMAL = 0x0A
         MOVE_SPECIAL_MOVE = 0x0E
         MOVE_SUPER_COMBO = 0x10
         MOVE_BACKDASH = 0x12

function p1_normal_move_type() => byte(0x8480)
         NORMAL_PUNCH = 0x00
         NORMAL_KICK = 0x02

function p1_move_strength() => byte(0x8483)
         STRENGTH_LIGHT = 0x00
         STRENGTH_MEDIUM = 0x02
         STRENGTH_HARD = 0x04
         
function p1_movement_flags() => byte(0x843d)
         
function p1_animation_frame() => word(0x00841E)
function p1_air_flag_state() => byte(0x008430)

function p1_attacking() => byte(0x0084A8)
function p1_super_pause() => byte(0x0084AA)
function p1_moves() => byte(0x0084AB)
function p1_current_victory_type() => byte(0x0084B5)
function p1_performing_special_move() => byte(0x0084CF)

function p1_v_ism_active() => byte(0x0084B8)
function p1_daigo_mode_active() => p1_v_ism_active() == 0x00 && p1_v_ism_timer() > 0
function p1_v_ism_timer() => word(0x0084BA)


function p1_short_jump_flag() => byte(0x008522)
function p1_transformation_0xff() => byte(0x008533)

function p1_recovery_mode() => byte(0x00854A)
function p1_super_move_active() => byte(0x008617)
function p1_projectile_has_hit_opponent() => byte(0x008638)
function p1_taking_damage() => byte(0x00863A)
function p1_super_move_level() => byte(0x008649)
function p1_custom_combo_delay() => byte(0x0086A6)

// P2
function p2_current_character() => byte(0x008903)
function p2_health() => byte(0x008850)
function p2_cpu_controlled_flag() => byte(0x008924)
function p2_rounds_wins() => byte(0x008927)
function p2_stun_bar() => byte(0x008ACD)

function p2_damage_type_suffered() => byte(0x008854)
function p2_push_block_type() => byte(0x008856)
function p2_health_before_combo_started() => byte(0x00895F)
function p2_damage_source_hit_type() => byte(0x008A6B)
function p2_crushed_guard() => byte(0x008A6F)
function p2_juggle_counter() => byte(0x008A71)
function p2_dizzied() => byte(0x008ACE)

// Message Display
function p1_message_display_id() => word(0x00AE1E)
function p1_message_display_timer() => word(0x00AE3B)

characters = {
   "Ryu": 0,
   "Ken": 1,
   "Akuma": 2,
   "Charlie": 3,
   "Chun-Li": 4,
   "Adon": 5,
   "Sodom": 6,
   "Guy": 7,
   "Birdie": 8,
   "Rose": 9,
   "M. Bison": 10,
   "Sagat": 11,
   "Dan": 12,
   "Sakura": 13,
   "Rolento": 14,
   "Dhalsim": 15,
   "Zangief": 16,
   "Gen": 17,
   "Gen (Crane)": 19,
   "Katana": 20,
   "Balrog": 21,
   "Cammy": 22,
   "E. Honda": 24,
   "Blanka": 25,
   "R. Mika": 26,
   "Cody": 27,
   "Vega": 28,
   "Karin": 29,
   "Juli": 30,
   "Juni": 31,
}

// =========================================
//                  Utility              
// =========================================

// resets if not in-game
function in_game() => never(game_state_complement_3() != 0x02)

// resets only if P2 is active
function p1_only() => never(game_active_players_connected() > 1)

function p1_hit_with_special_move(move_id) {
    return  (p1_move_type() == MOVE_SPECIAL_MOVE || p1_projectile_has_hit_opponent() == 0x01) && 
            p1_hit_combo() > prev(p1_hit_combo()) && 
            p1_moves() == move_id
}

function p1_use_special_move(move_id) {
    return  (p1_move_type() == MOVE_SPECIAL_MOVE || p1_projectile_has_hit_opponent() == 0x01) && 
            p1_moves() == move_id
}

function p1_hit_with_super_move(move_id) {
    return  (p1_move_type() == MOVE_SUPER_COMBO || p1_projectile_has_hit_opponent() == 0x01) && 
            p1_hit_combo() > prev(p1_hit_combo()) && 
            p1_moves() == move_id
}

function p1_hit_with_special_move_strength(move_id, special_strength) {
    return  (p1_move_type() == MOVE_SPECIAL_MOVE || p1_projectile_has_hit_opponent() == 0x01) && 
			p1_move_strength() == special_strength &&
            p1_hit_combo() > prev(p1_hit_combo()) && 
            p1_moves() == move_id
}

function p1_hit_with_super_move_strength(move_id, super_level) {
    return  (p1_move_type() == MOVE_SUPER_COMBO || p1_projectile_has_hit_opponent() == 0x01) && 
			p1_super_move_level() == super_level &&
            p2_health() < prev(p2_health()) && 
            p1_moves() == move_id
}

function p1_hit_with_any_normal_move() {
    return  p1_move_type() == MOVE_NORMAL && 
            p1_hit_combo() > prev(p1_hit_combo())
}

function p1_hit_with_specific_normal_move(normal_type_id, move_strength) {
    return  p1_move_type() == MOVE_NORMAL &&
            p1_normal_move_type() == normal_type_id &&
            p1_move_strength() == move_strength &&
            p1_hit_combo() > prev(p1_hit_combo())
}


function p1_team_has_char(char_id) => p1_character_slot_1() == char_id || p1_character_slot_2() == char_id || p1_character_slot_3() == char_id
function p1_dont_have_char(char_id) => p1_character_slot_1() != char_id && p1_character_slot_2() != char_id && p1_character_slot_3() != char_id

function game_beaten() => game_ladder_match() == 0x09 && arcade_ladder_opponents_defeated() > prev(arcade_ladder_opponents_defeated())



// =========================================
//                 Progression              
// =========================================

function achiev_beat_game_team(title, char1, char2, char3) {
    achievement(title, format("Finish Team Play using only {0}, {1} and {2} on Normal difficulty.", char1, char2, char3), 10,
                trigger = p1_only() &&
                          in_game() &&
                          settings_game_mode() == MODE_TEAMPLAY &&
                          default_difficulty() &&
                          once(game_ladder_match() == 0 && game_state() == GS_CHARACTER_SELECT) &&
                          never(p1_dont_have_char(characters[char1]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_dont_have_char(characters[char2]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_dont_have_char(characters[char3]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          p1_team_has_char(characters[char1]) &&
                          p1_team_has_char(characters[char2]) &&
                          p1_team_has_char(characters[char3]) &&
                          trigger_when(game_beaten())
                )
}

achiev_beat_game_team("Saikyo Friendship Team", "Dan", "Sakura", "Blanka")
achiev_beat_game_team("Psycho Dolls Team", "Cammy", "Juni", "Juli")
achiev_beat_game_team("Ansatsuken Arts Team", "Ryu", "Ken", "Akuma")
achiev_beat_game_team("World Wrestlers Team", "Zangief", "R. Mika", "E. Honda")
achiev_beat_game_team("Youthful Spirit Team", "Sakura", "Karin", "R. Mika")
achiev_beat_game_team("Street Fighter One Team", "Sagat", "Adon", "Ryu")
achiev_beat_game_team("World Warriors Team", "Dhalsim", "E. Honda", "Blanka")
achiev_beat_game_team("Grandmasters Team", "M. Bison", "Vega", "Balrog")
achiev_beat_game_team("Anti-Shadaloo Team", "Charlie", "Chun-Li", "Rose")

// exceptions
// achiev_beat_game_team("Street Fighter Alpha Team", "Birdie", "Gen", "Adon")
// achiev_beat_game_team("Final Fight Team", "Guy", "Cody", "Rolento, Sodom")

achievement("Street Fighter Alpha Team", "Finish Team Play using only Birdie, Gen and Adon on Normal difficulty.", 10,
                trigger = p1_only() &&
                          in_game() &&
                          settings_game_mode() == MODE_TEAMPLAY &&
                          default_difficulty() &&
                          once(game_ladder_match() == 0 && game_state() == GS_CHARACTER_SELECT) &&
                          never(p1_dont_have_char(characters["Birdie"]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_dont_have_char(characters["Gen"]) && p1_dont_have_char(characters["Gen (Crane)"]) && p1_rounds_won() > prev(p1_rounds_won()) ) &&
                          never(p1_dont_have_char(characters["Adon"]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          p1_team_has_char(characters["Birdie"]) &&
                          __ornext(p1_team_has_char(characters["Gen"]) || p1_team_has_char(characters["Gen (Crane)"])) &&
                          p1_team_has_char(characters["Adon"]) &&
                          trigger_when(game_beaten())
                )

achievement("Final Fight Team", "Finish Team Play using only Guy, Cody, Sodom or Rolento on Normal difficulty.", 10,
                trigger = p1_only() &&
                          in_game() &&
                          settings_game_mode() == MODE_TEAMPLAY &&
                          default_difficulty() &&
                          once(game_ladder_match() == 0 && game_state() == GS_CHARACTER_SELECT) &&
                          never(p1_character_slot_1() != characters["Guy"] && p1_character_slot_1() != characters["Cody"] && 
                                p1_character_slot_1() != characters["Sodom"] && p1_character_slot_1() != characters["Rolento"] &&
                                p1_rounds_won() > prev(p1_rounds_won())
                                ) &&
                          never(p1_character_slot_2() != characters["Guy"] && p1_character_slot_2() != characters["Cody"] && 
                                p1_character_slot_2() != characters["Sodom"] && p1_character_slot_2() != characters["Rolento"] &&
                                p1_rounds_won() > prev(p1_rounds_won())
                                ) &&
                          never(p1_character_slot_3() != characters["Guy"] && p1_character_slot_3() != characters["Cody"] && 
                                p1_character_slot_3() != characters["Sodom"] && p1_character_slot_3() != characters["Rolento"] &&
                                p1_rounds_won() > prev(p1_rounds_won())
                                ) &&
                          __ornext(p1_character_slot_1() == characters["Guy"] || p1_character_slot_1() == characters["Cody"] || 
                                   p1_character_slot_1() == characters["Sodom"] || p1_character_slot_1() == characters["Rolento"]) &&
                          __ornext(p1_character_slot_2() == characters["Guy"] || p1_character_slot_2() == characters["Cody"] || 
                                   p1_character_slot_2() == characters["Sodom"] || p1_character_slot_2() == characters["Rolento"]) &&
                          __ornext(p1_character_slot_3() == characters["Guy"] || p1_character_slot_3() == characters["Cody"] || 
                                   p1_character_slot_3() == characters["Sodom"] || p1_character_slot_3() == characters["Rolento"]) &&
                          trigger_when(game_beaten())
                )

achievement("Street Fighter Meets KOF", "Beat the game on Team Play mode.", 5, type="win_condition",
            trigger = p1_only() &&
                      in_game() &&
                      settings_game_mode() == MODE_TEAMPLAY &&
                      game_beaten()
            )

achievement("Single Warrior", "Beat the game on Single Play mode (3 rounds).", 5, type="win_condition",
            trigger = p1_only() &&
                      in_game() &&
                      settings_game_mode() == MODE_SINGLE3R &&
                      game_beaten()
            )

achievement("The King of SFZ3 Mix", "Beat the game on Expert difficulty.", 25,
            trigger = p1_only() &&
                      in_game() &&
                      settings_difficulty() == 0x07 &&
                      game_beaten()
            )


// =========================================
//                   Misc              
// =========================================

achievement("Satsui no Hadou", "Transform into Evil Ryu and finish your opponent with a Raging Demon against the CPU.", 5,
            trigger = p1_only() &&
                      in_game() &&
                      p1_current_character() == characters["Ryu"] &&
                      p1_moves() == 0x1c &&
                      p1_current_victory_type() == 0x0c && 
                      prev(p1_current_victory_type()) != 0x0c
            )

achievement("Ultimate Psycho Crusher", "Transform into Shin Bison and finish off your opponent with a Ultimate Psycho Crusher against the CPU.", 5,
            trigger = p1_only() &&
                      in_game() &&
                      p1_current_character() == characters["M. Bison"] &&
                      p1_moves() == 0x08 &&
                      p1_attacking() == 0x03 &&
                      p1_current_victory_type() == 0x0c && 
                      prev(p1_current_victory_type()) != 0x0c
            )

achievement("Saikyo's Hidden Super Desperation Move", "Defeat your opponent with a Gadou Shoukou Ken as Dan against the CPU.", 5,
            trigger = p1_only() &&
                      in_game() &&
                      p1_current_character() == characters["Dan"] &&
                      p1_moves() == 0x08 &&
                      p1_attacking() == 0x03 &&
                      p1_current_victory_type() == 0x0c && 
                      prev(p1_current_victory_type()) != 0x0c
            )

achievement("Just Defended", "Perform three Just Defenses without using Daigo Mode.", 4,
            trigger =   in_game() &&
                        never(p1_cpu_controlled_flag() == 0x01) &&
                        unless(p1_daigo_mode_active()) &&
                        measured(repeated(3, p1_super_pause() == 0x01 && prev(p1_super_pause()) == 0x00))
            )


achievement("The Beast Within", "Parry 5 times within the duration of Daigo Mode.", 5,
            trigger =   in_game() &&
                        never(p1_cpu_controlled_flag() == 0x01) &&
                        never(!p1_daigo_mode_active()) &&
                        measured(repeated(5, p1_super_pause() == 0x01 && prev(p1_super_pause()) == 0x00))
            )

achievement("SFZ3 Mix Primer", "Perform all newly introduced mechanics of SFZ3 Mix (Escape, Roll, Short Jump, Long Jump, Back Step and Run).", 3,
            trigger =   in_game() &&
                        never(p1_cpu_controlled_flag() == 0x01) &&
                        measured(tally(6,
                            once(p1_actions_state() == ACTION_ROLL_OR_ESCAPE && p1_actions_state_complement() == 0x06), // escape
                            once(p1_actions_state() == ACTION_ROLL_OR_ESCAPE && p1_actions_state_complement() == 0x02),// roll
                            once(p1_short_jump_flag() == 0xff && prev(p1_short_jump_flag()) != 0xff && __ornext(p1_movement_flags() == 0x00 || p1_movement_flags() == 0x01 || p1_movement_flags() == 0xff)),
                            once(p1_short_jump_flag() == 0x80),
                            once(p1_move_type() == MOVE_BACKDASH),
                            once(p1_movement_flags() == 0x08)
                        )) &&
                        disable_when(repeated(3, p1_short_jump_flag() == 0x01), p1_move_type() != MOVE_JUMPING)
            )

// =========================================
//                  Combos              
// =========================================

// OLD

// achievement("Shinkuu Hadouken Trial", "Perform a 10-hit combo using 4x normals > HK Tatsumaki Senpuukyaku > Lv. 1 Shinkuu Hadouken as Ryu (no dizzy).", 5,
//             trigger =   in_game() &&
//                         never(p1_cpu_controlled_flag() == 0x01) &&
//                         never(p1_hit_combo() == 0x00) &&
//                         never(p2_dizzied() == 0x01) &&
//                         p1_hit_combo() > prev(p1_hit_combo()) &&
//                         p1_current_character() == characters["Ryu"] &&
//                         p1_hit_combo() >= 10 &&
//                         tally(4, p1_hit_with_any_normal_move()) &&
//                         once(p1_hit_with_special_move_strength(0x04, STRENGTH_HARD)) &&
//                         once(p1_hit_with_super_move_strength(0x08, STRENGTH_LIGHT))
//             )

// achievement("Saba Ori Trial", "Perform a 14-hit combo using Saba Ori > HP Hyakuretsu Harite > Lv. 1 Oni Musou (SC) as E. Honda (no dizzy).", 5,
//             trigger =   in_game() &&
//                         never(p1_cpu_controlled_flag() == 0x01) &&
//                         never(p1_hit_combo() == 0x00) &&
//                         never(p2_dizzied() == 0x01) &&
//                         p1_hit_combo() > prev(p1_hit_combo()) &&
//                         p1_current_character() == characters["E. Honda"] &&
//                         p1_hit_combo() >= 14 &&
//                         once(p1_actions_state() == ACTION_THROW) &&
//                         once(p1_hit_with_special_move_strength(0x0C, STRENGTH_HARD)) &&
//                         once(p1_hit_with_super_move_strength(0x02, STRENGTH_LIGHT))
//             )

// achievement("Tropical Hazard Trial", "Perform a 7-hit combo using 4x normals > Rolling Attack > Lv. 1 Tropical Hazard (SC) as Blanka (no dizzy).", 5,
//             trigger =   in_game() &&
//                         never(p1_cpu_controlled_flag() == 0x01) &&
//                         never(p1_hit_combo() == 0x00) &&
//                         never(p2_dizzied() == 0x01) &&
//                         p1_hit_combo() > prev(p1_hit_combo()) &&
//                         p1_current_character() == characters["Blanka"] &&
//                         p1_hit_combo() >= 7 &&
//                         tally(4, p1_hit_with_any_normal_move()) &&
//                         once(p1_hit_with_special_move(0x08)) &&
//                         once(p1_hit_with_super_move_strength(0x10, STRENGTH_LIGHT))
//             )

// achievement("Knee Bazooka Trial", "Perform a 7-hit combo using Knee Bazooka > standing MP > Sonic Boom > Lv. 1 Cross Fire Blitz > HK Sommersault Shell as Charlie (no dizzy).", 5,
//             trigger =   in_game() &&
//                         never(p1_cpu_controlled_flag() == 0x01) &&
//                         never(p1_hit_combo() == 0x00) &&
//                         never(p2_dizzied() == 0x01) &&
//                         p1_hit_combo() > prev(p1_hit_combo()) &&
//                         p1_current_character() == characters["Charlie"] &&
//                         p1_hit_combo() >= 7 &&
//                         once(p1_hit_with_special_move(0x12)) &&
//                         once(p1_hit_with_specific_normal_move(NORMAL_PUNCH, STRENGTH_MEDIUM)) &&
//                         once(p1_moves() == 0x02) && // projectile, so needs to check that?
//                         once(p1_hit_with_super_move_strength(0x08, STRENGTH_LIGHT)) &&
//                         once(p1_hit_with_special_move_strength(0x00, STRENGTH_HARD))
//             )

// achievement("Shinryuuken Trial", "Perform a 20-hit combo using 1x normals > Hadouken > Lv. 1 Shinryuuken (SC) > Tatsumaki Senpuukyaku > Lv. 1 Shinryuuken as Ken.", 10,
//             trigger =   in_game() &&
//                         never(p1_cpu_controlled_flag() == 0x01) &&
//                         never(p1_hit_combo() == 0x00) &&
//                         never(p2_dizzied() == 0x01) &&
//                         p1_hit_combo() > prev(p1_hit_combo()) &&
//                         p1_current_character() == characters["Ken"] &&
//                         p1_hit_combo() >= 20 &&
//                         once(p1_hit_with_any_normal_move()) &&
//                         once(p1_hit_with_special_move(0x02)) &&
//                         once(p1_hit_with_super_move_strength(0x08, STRENGTH_LIGHT)) &&
//                         once(p1_hit_with_special_move(0x04)) &&
//                         repeated(2, p1_moves() == 0x08 && prev(p1_moves()) != 0x08) &&
//                         never(p1_moves() == 0x08 && p1_super_move_level() != STRENGTH_LIGHT)
//             )

// achievement("Yoga Strike Trial", "Perform a 5-hit combo using close MP > MP Yoga Fire > Lv. 1 Yoga Inferno (SC) > close HK > Lv. 1 Yoga Strike as Dhalsim (no dizzy).", 10,
//             trigger =   in_game() &&
//                         never(p1_cpu_controlled_flag() == 0x01) &&
//                         never(p1_hit_combo() == 0x00) &&
//                         never(p2_dizzied() == 0x01) &&
//                         p1_current_character() == characters["Dhalsim"] &&
//                         p1_hit_combo() >= 5 &&
//                         once(p1_hit_with_specific_normal_move(NORMAL_PUNCH, STRENGTH_MEDIUM)) &&
//                         once(p1_hit_with_special_move_strength(0x02, STRENGTH_MEDIUM)) &&
//                         once(p1_hit_with_super_move_strength(0x0e, STRENGTH_LIGHT)) &&
//                         once(p1_hit_with_specific_normal_move(NORMAL_KICK, STRENGTH_HARD)) &&
//                         once(p1_hit_with_super_move_grab_strength(0x10, STRENGTH_LIGHT))
//             )

// achievement("Jasen Trial", "Perform a 10-hit combo using crouching MP > HP Jasen > Lv. 1 Zan'ei (SC) > close HK as Gen (no dizzy).", 5,
//             trigger =   in_game() &&
//                         never(p1_cpu_controlled_flag() == 0x01) &&
//                         never(p1_hit_combo() == 0x00) &&
//                         never(p2_dizzied() == 0x01) &&
//                         __ornext(p1_current_character() == characters["Gen"] || p1_current_character() == characters["Gen (Crane)"]) &&
//                         p1_hit_combo() >= 10 &&
//                         once(p1_hit_with_specific_normal_move(NORMAL_PUNCH, STRENGTH_MEDIUM)) &&
//                         once(p1_hit_with_special_move_strength(0x04, STRENGTH_HARD)) &&
//                         once(p1_hit_with_super_move_strength(0x0a, STRENGTH_LIGHT)) &&
//                         once(p1_hit_with_specific_normal_move(NORMAL_KICK, STRENGTH_HARD))
//             )

// achievement("Kuuchuu Dankuukyaku Trial", "Perform a 6-hit combo using LK Kuuchuu Dankuukyaku > 1x normal > Gadouken > Lv. 1 Kouryuu Rekka as Dan (no dizzy).", 5,
//             trigger =   in_game() &&
//                         never(p1_cpu_controlled_flag() == 0x01) &&
//                         never(p1_hit_combo() == 0x00) &&
//                         never(p2_dizzied() == 0x01) &&
//                         p1_hit_combo() > prev(p1_hit_combo()) &&
//                         p1_current_character() == characters["Dan"] &&
//                         p1_hit_combo() >= 6 &&
//                         once(p1_hit_with_special_move_strength(0x1a, STRENGTH_LIGHT)) &&
//                         once(p1_hit_with_any_normal_move()) &&
//                         once(p1_hit_with_special_move(0x02)) &&
//                         once(p1_hit_with_super_move_strength(0x0c, STRENGTH_LIGHT))
//             )

damage_dict = {
    "0%": 0,
    "5%": 8,
    "10%": 16,
    "15%": 24,
    "20%": 32,
    "25%": 40,
    "30%": 48,
    "32%": 51,
    "34%": 54,
    "35%": 56,
    "36%": 58,
    "38%": 61,
    "40%": 64,
    "45%": 72,
    "50%": 80,
    "55%": 88,
    "60%": 96,
    "65%": 104,
    "70%": 112,
    "75%": 120,
    "80%": 128,
    "85%": 136,
    "90%": 144,
    "95%": 152,
    "100%": 160
}

move_level_dict = {
    "1": 0x00,
    "2": 0x02,
    "3": 0x04
}

function achiev_hit_combo(character, hit_combo, special_move_id, special_move_name, super_combo_id, super_combo_name, super_level_string, points) {
    achievement(format("{0} Confirm", super_combo_name), format("Perform a {0}-hit combo using {1} and Lv. {3} {2} as {4}.", hit_combo, special_move_name, super_combo_name, super_level_string, character), points,
                    trigger =   in_game() &&
                                never(p1_cpu_controlled_flag() == 0x01) &&
                                never(p1_hit_combo() == 0x00) &&
                                never(p2_dizzied() == 0x01) &&
                                p1_current_character() == characters[character] &&
                                p1_hit_combo() >= hit_combo &&
                                once(p1_hit_with_special_move(special_move_id)) &&
                                once(p1_hit_with_super_move_strength(super_combo_id, move_level_dict[super_level_string])) &&
                                p2_health() < prev(p2_health())
                    )
}

function achiev_hit_combo_projectile(character, hit_combo, special_move_id, special_move_name, super_combo_id, super_combo_name, super_level_string, points) {
    achievement(format("{0} Confirm", super_combo_name), format("Perform a {0}-hit combo using {1} and Lv. {3} {2} as {4}.", hit_combo, special_move_name, super_combo_name, super_level_string, character), points,
                    trigger =   in_game() &&
                                never(p1_cpu_controlled_flag() == 0x01) &&
                                never(p1_hit_combo() == 0x00) &&
                                never(p2_dizzied() == 0x01) &&
                                p1_current_character() == characters[character] &&
                                p1_hit_combo() >= hit_combo &&
                                once(p1_hit_with_special_move(special_move_id)) &&
                                once(p1_hit_with_super_move_strength(super_combo_id, move_level_dict[super_level_string])) &&
                                p2_health() < prev(p2_health())
                    )
}

achiev_hit_combo_projectile("Ryu", 6, 0x02, "Hadouken", 0x08, "Shinkuu Hadouken", "1", 5)
achiev_hit_combo("E. Honda", 12, 0x0c, "Hyakuretsu Harite", 0x04, "Fuji Oroshi", "2", 5)
achiev_hit_combo("Blanka", 7, 0x08, "Rolling Attack", 0x10, "Tropical Hazard", "1", 5)
achiev_hit_combo_projectile("Charlie", 8, 0x02, "Sonic Boom", 0x06, "Somersault Justice", "1", 5)
achiev_hit_combo_projectile("Ken", 12, 0x00, "Shoryuken", 0x08, "Shinryuuken", "1", 5)
achiev_hit_combo_projectile("Dhalsim", 6, 0x02, "Yoga Fire", 0x0e, "Yoga Inferno", "1", 5)
achiev_hit_combo("Gen (Crane)", 5, 0x04, "Jasen", 0x0c, "Jakouha", "2", 10)
achiev_hit_combo_projectile("Dan", 6, 0x02, "Gadouken", 0x08, "Shinkuu Gadouken", "1", 5)
achiev_hit_combo("Adon", 4, 0x00, "Jaguar Kick", 0x08, "Jaguar Revolver", "1", 5)
achiev_hit_combo("Zangief", 6, 0x0c, "Banishing Flat", 0x16, "Final Atomic Buster", "1", 5)
achiev_hit_combo("Sakura", 10, 0x08, "Shou'ouken", 0x0e, "Midare-zakura", "1", 5)
achiev_hit_combo_projectile("Chun-Li", 6, 0x06, "Kikouken", 0x0a, "Senretsu Kyaku", "1", 5)
achiev_hit_combo_projectile("Chun-Li", 7, 0x08, "Tenshoukyaku", 0x0e, "Kikoushou", "1", 5)
achiev_hit_combo_projectile("Rose", 8, 0x14, "Soul Spiral", 0x0a, "Aura Soul Spark", "1", 5)
achiev_hit_combo("R. Mika", 5, 0x22, "Double Smash", 0x1c, "Rainbow Hip Rush", "1", 3)
achiev_hit_combo("Karin", 9, 0x14, "Guren Chuu", 0x10, "Kanzuki-ryuu Shinpikaibyaku", "1", 5)
achiev_hit_combo("Karin", 7, 0x08, "Mujin Kyaku", 0x12, "Kanzuki-ryuu Kou'ou Ken", "1", 5)
achiev_hit_combo("Guy", 6, 0x12, "Houzantou", 0x0a, "Bushin Hassou Ken", "1", 5)
achiev_hit_combo("Sodom", 5, 0x04, "Jigoku Scrape", 0x06, "Ten Chuu Satsu", "1", 5)
achiev_hit_combo("Birdie", 5, 0x14, "Chain Earthquake", 0x08, "The Birdie", "2", 5)
achiev_hit_combo("Rolento", 13, 0x0e, "Patriot Circle", 0x0c, "Take no Prisoner", "1", 5)
achiev_hit_combo("Cody", 11, 0x08, "Criminal Upper", 0x1a, "Dead End Irony", "1", 5)
achiev_hit_combo_projectile("Akuma", 8, 0x14, "Shakunetsu Hadouken", 0x0e, "Gou Shoryuken", "1", 5)
achiev_hit_combo("Balrog", 7, 0x00, "Dash Straight", 0x12, "Crazy Buffalo", "1", 5)
achiev_hit_combo("Vega", 6, 0x04, "Rolling Crystal Flash", 0x1a, "Scarlet Mirage", "1", 5)
achiev_hit_combo("Sagat", 8, 0x06, "Tiger Crush", 0x0c, "Tiger Cannon", "1", 5)
achiev_hit_combo("M. Bison", 8, 0x00, "Double Knee Press", 0x08, "Psycho Crusher", "1", 5)
achiev_hit_combo("Juli", 7, 0x06, "Spiral Arrow", 0x26, "Super Psycho Shot", "1", 5)
achiev_hit_combo("Cammy", 10, 0x06, "Spiral Arrow", 0x10, "Reverse Shaft Breaker", "1", 5)
achiev_hit_combo("Juni", 9, 0x06, "Spiral Arrow", 0x26, "Psychic Knife", "1", 5)

// achievement("Tenshoukyaku Confirm", "Perform a 8-hit combo using Tenshoukyaku and Kaku Kyaku Raku as Chun-Li.", 5,
//                     trigger =   in_game() &&
//                                 never(p1_cpu_controlled_flag() == 0x01) &&
//                                 never(p1_hit_combo() == 0x00) &&
//                                 never(p2_dizzied() == 0x01) &&
//                                 p1_current_character() == characters["Chun-Li"] &&
//                                 p1_hit_combo() >= 8 &&
//                                 once(p1_hit_with_special_move(0x08)) &&
//                                 once(p1_animation_frame() >= 0x0cd0 && p1_animation_frame() <= 0x0d0c && p1_hit_combo() > prev(p1_hit_combo()) ) &&
//                                 p2_health() < prev(p2_health())
//             )

// achievement("Ressen Ha Confirm", "Perform a 5-hit combo using Mujin Kyaku and Ressen Ha as Karin.", 5,
//                     trigger =   in_game() &&
//                                 never(p1_cpu_controlled_flag() == 0x01) &&
//                                 never(p1_hit_combo() == 0x00) &&
//                                 never(p2_dizzied() == 0x01) &&
//                                 p1_current_character() == characters["Karin"] &&
//                                 p1_hit_combo() >= 5 &&
//                                 once(p1_hit_with_special_move(0x08)) &&
//                                 once(p1_hit_with_special_move(0x04)) &&
//                                 p2_health() < prev(p2_health())
//             )

// achievement("Criminal Upper Confirm", "Perform a 12-hit combo using a weak Criminal Upper and strong Criminal Upper as Cody.", 5,
//                     trigger =   in_game() &&
//                                 never(p1_cpu_controlled_flag() == 0x01) &&
//                                 never(p1_hit_combo() == 0x00) &&
//                                 never(p2_dizzied() == 0x01) &&
//                                 p1_current_character() == characters["Cody"] &&
//                                 p1_hit_combo() >= 12 &&
//                                 once(p1_hit_with_special_move_strength(0x08, STRENGTH_LIGHT)) &&
//                                 once(p1_hit_with_special_move_strength(0x08, STRENGTH_HARD)) &&
//                                 p2_health() < prev(p2_health())
//             )

// achievement("Multiple Juggles Confirm", "Perform a 18-hit combo using both Tatsumaki Zankuukyaku and Gou Shoryuken three times each as Akuma.", 5,
//                     trigger =   in_game() &&
//                                 never(p1_cpu_controlled_flag() == 0x01) &&
//                                 never(p1_hit_combo() == 0x00) &&
//                                 never(p2_dizzied() == 0x01) &&
//                                 p1_current_character() == characters["Akuma"] &&
//                                 p1_hit_combo() >= 18 &&
//                                 repeated(3, p1_animation_frame() == 0xb3f4 && prev(p1_animation_frame()) != 0xb3f4) &&
//                                 repeated(3, p1_animation_frame() == 0xb790 && prev(p1_animation_frame()) != 0xb790)
//             )

achievement("Crazy Buffalo Confirm", "Perform a 8-hit combo using Dash Straight two times and a Crazy Buffalo as Balrog.", 5,
                    trigger =   in_game() &&
                                never(p1_cpu_controlled_flag() == 0x01) &&
                                never(p1_hit_combo() == 0x00) &&
                                never(p2_dizzied() == 0x01) &&
                                p1_current_character() == characters["Balrog"] &&
                                p1_hit_combo() >= 8 &&
                                repeated(2, p1_hit_with_special_move(0x00)) &&
                                once(p1_hit_with_super_move(0x12))
            )

            


// =========================================
//                Leaderboard              
// =========================================

leaderboard("SFZ3 Mix Highest Score (Team Play)", "Highest score during an Arcade run on default settings (1CC).",
           start =  default_settings() &&
                    p1_only() &&
                    in_game() &&
                    settings_game_mode() == MODE_TEAMPLAY &&
                    arcade_mbison_defeated() == 1 &&
                    game_ladder_match() == 9 &&
                    game_state() == GS_GAME_OVER &&
                    p1_score_000000xx_continues() == 0,
           cancel = always_false(),
           submit = always_true(),
           value = bcd(p1_score_xx000000()) * 1000000 + bcd(p1_score_00xx0000()) * 10000 + bcd(p1_score_0000xx00()) * 100 + bcd(p1_score_000000xx_continues()),
           format = "VALUE", lower_is_better=false)

leaderboard("SFZ3 Mix Highest Score (Single Play 3 Rounds)", "Highest score during an Arcade run on default settings (1CC).",
           start =  default_settings() &&
                    p1_only() &&
                    in_game() &&
                    settings_game_mode() == MODE_SINGLE3R &&
                    arcade_mbison_defeated() == 1 &&
                    game_ladder_match() == 9 &&
                    game_state() == GS_GAME_OVER &&
                    p1_score_000000xx_continues() == 0,
           cancel = always_false(),
           submit = always_true(),
           value = bcd(p1_score_xx000000()) * 1000000 + bcd(p1_score_00xx0000()) * 10000 + bcd(p1_score_0000xx00()) * 100 + bcd(p1_score_000000xx_continues()),
           format = "VALUE", lower_is_better=false)