// Street Fighter Alpha 3 | Street Fighter Zero 3
// #ID = 11812

function game_credits() => byte(0x008077)
function game_active_players_char_select() => byte(0x00808C)


// Settings
function settings_damage() => byte(0x0080A0)
//       0x01 = Normal (Default)

function settings_difficulty() => byte(0x0080A1)
//       0x04 = Hard 3 (Default)

function settings_game_speed() => byte(0x0080A2)
//       0x04 = Free Select 1 (Default)

function settings_timer_speed() => byte(0x0080A3)
//       0x01 = Normal (Default)

function settings_p2_max_round() => byte(0x0080DE)
function settings_p1_max_round() => byte(0x0080DF)
//       0x01 = 3 Rounds (Default)

// Game
function game_playing() => byte(0x0080A6)
function game_active_players_connected() => byte(0x0080A9)
function game_active_players_ingame() => byte(0x0080AD)
function game_ko_related() => byte(0x0080BC)
function game_screen() => byte(0x00812D)

// Ladder
function ladder_match() => byte(0x008114)
function ladder_opponents_defeated() => byte(0x00816C)
function ladder_opponents_defeated_bitflag() => dword(0x008540)
function ladder_rival() => byte(0x813e)
         rival_last_boss = 0x0c

function unlockable_title_screen_color() => byte(0x0080EF)

// Round
function round_timer() => byte(0x008108)
function round_started() => byte(0x00812C)
function round_first_attack() => byte(0x008134) == 0xff
function match_super_combo_timer() => byte(0x008125)

// Game Mode
function dramatic_battle() => bit0(0x008169) == 1
function survival_mode() => byte(0x00854A) == 0xff

function playing_dramatic_battle() => unless(!dramatic_battle()) 
function playing_survival_mode() => unless(!survival_mode()) 
function playing_last_battle() => prior(ladder_opponents_defeated_bitflag()) == 0 && ladder_opponents_defeated_bitflag() == 0xFFFFFFFF
function playing_arcade() => unless(playing_dramatic_battle()) && unless(playing_survival_mode())

// Fighting Mode
function p1_saikyou_flag() => bit0(0x008530) == 1
function p1_mazi_flag() => bit0(0x00855B) == 1
function p1_classic_flag() => bit0(0x00855F) == 1

// P1
function p1_hp() => word(0x008450) // P1 Char or P1 Char Slot 1 on Dramatic Battle
function p1_state() => byte(0x855a)
function p1_char() => byte(0x008503)
function p1_round_wins() => byte(0x8527)
function p1_state() => byte(0x00855A)
function p1_matches_won_row() => byte(0x008136)
function p1_score_full() => dword(0x8510)
function p1_score_xx000000() => byte(0x008511)
function p1_score_00xx0000() => byte(0x008510)
function p1_score_0000xx00() => byte(0x008513)

function p1_hit_combo() => byte(0x00885F)
function p1_move() => byte(0x0084AB)
function p1_animation() => word(0x841e)
function p1_taunts_remaining() => byte(0x0084BD)
function p1_max_combo() => byte(0x008514)
function p1_gauge() => byte(0x00851E)

function p1_fighting_style_1() => byte(0x008522)
function p1_fighting_style_2() => byte(0x008533)
         fighting_style_xism = 0xff
         fighting_style_aism = 0x00
         fighting_style_vism = 0x01

function p1_round_victory_type() => low4(0x0084B5)
function p1_1st_victory_type() => low4(0x00852B)
function p1_2nd_victory_type() => low4(0x00852A)

function p1_throwing_flag() => bit1(0x008466)
function p1_projectile_thrown_flag() => byte(0x0084A5)
function p1_attacking_flag() => bit0(0x0084A8)
function p1_in_air_flag() => bit0(0x86d9)
function p1_special_move_flag() => bit0(0x0084CF)
function p1_vism_active_flag() => bit0(0x0084B8)
function p1_vism_timer() => word(0x0084BA)
// function p1_super_combo_flag_1() => bit0(0x008617)
// function p1_super_combo_flag_2() => bit3(0x0086A0)
function p1_move_type() => byte(0x8407)
         move_type_super_combo = 0x10

function p1_projectile_hit_opponent() => byte(0x008638)
         projectile_hit = 0x01
         projectile_blocked = 0xff

// function p1_alpha_counter_flag() => byte(0x008680)
//          alpha_counter_p1_got_hit = 0x02
//          alpha_counter_p2_got_hit = 0x01

// P2
function p2_char() => byte(0x008903)
function p2_hp() => byte(0x8850)
function p2_round_wins() => byte(0x8927)
function p2_taking_damage() => bit0(0x8a3a)
function p2_got_hit_by_alpha_counter() => bit0(0x8a53)

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

// Utility Functions

// function p1_only() => always_true() // Debug
function p1_only() => unless(game_active_players_connected() != 0x01) // Normal

function p1_hit_with_move(move) {
    return  (p1_move_type() == move_type_super_combo || p1_projectile_hit_opponent() == projectile_hit) && 
            p1_hit_combo() > prev(p1_hit_combo()) && 
            p1_move() == move
} 

function p1_hit_with_move_grab(move) {
    return  (p1_move_type() == move_type_super_combo || p1_projectile_hit_opponent() == projectile_hit) && 
            p2_hp() < prev(p2_hp()) && 
            p1_move() == move
} 

function p1_team_contains_char(char) => p1_char() == char || p2_char() == char

function p1_has_won_arcade_match() => ladder_opponents_defeated() > prev(ladder_opponents_defeated())
function beaten_arcade_mode() => ladder_match() == 0x09 && ladder_rival() == rival_last_boss && p1_has_won_arcade_match()

function default_diff_rounds() {
    return  settings_difficulty() >= 0x01 &&
            settings_p1_max_round() == 0x01
}

// =========================================
//                  Misc 1              
// =========================================

achievement("Alpha Counter", "Hit your opponent with an Alpha Counter 3 times during a match (Arcade Mode).", 3,
            trigger =   p1_only() &&
                        playing_arcade() &&
                        measured(repeated(3, p2_got_hit_by_alpha_counter() == 1 && prev(p2_got_hit_by_alpha_counter()) == 0)) &&
                        never(p1_has_won_arcade_match())
                        )

achievement("Shun Goku Satsu", "Win a round with a Shun Goku Satsu (Arcade Mode).", 2,
            trigger =   p1_only() &&
                        playing_arcade() &&
                        p1_char() == characters["Akuma"] &&
                        p1_move() == 0x16 &&
                        p1_round_victory_type() == 0x0c)

achievement("魔奴 義亜", "Play as Katana.", 1,
            trigger =   p1_only() &&
                        game_active_players_ingame() > 0 &&
                        playing_arcade() &&
                        p1_char() == characters["Sodom"] &&
                        p1_fighting_style_1() == fighting_style_xism
            )

achievement("X-ISM Scorer", "Get a Score of 750.000 using only X-ISM on Arcade Mode (2-Normal difficulty, 3 rounds).", 5,
            trigger =   p1_only() &&
                        playing_arcade() &&
                        prior(ladder_opponents_defeated_bitflag()) > 0 &&
                        (p1_score_00xx0000() >= 0x75 || p1_score_xx000000() >= 0x01) &&
                        p1_fighting_style_1() == fighting_style_xism &&
                        once(p1_score_full() == 0 && p1_fighting_style_1() == fighting_style_xism) &&
                        never(p1_fighting_style_1() != fighting_style_xism && p1_score_full() != prev(p1_score_full())) &&
                        default_diff_rounds(),
            id = 78390 
            )

achievement("A-ISM Scorer", "Get a Score of 750.000 using only A-ISM on Arcade Mode (2-Normal difficulty, 3 rounds).", 5,
            trigger =   p1_only() &&
                        playing_arcade() &&
                        prior(ladder_opponents_defeated_bitflag()) > 0 &&
                        (p1_score_00xx0000() >= 0x75 || p1_score_xx000000() >= 0x01) &&
                        p1_fighting_style_1() == fighting_style_aism &&
                        once(p1_score_full() == 0 && p1_fighting_style_1() == fighting_style_aism) &&
                        never(p1_fighting_style_1() != fighting_style_aism && p1_score_full() != prev(p1_score_full())) &&
                        default_diff_rounds(),
            id = 78391
            )

achievement("V-ISM Scorer", "Get a Score of 750.000 using only V-ISM on Arcade Mode (2-Normal difficulty, 3 rounds).", 5,
            trigger =   p1_only() &&
                        playing_arcade() &&
                        prior(ladder_opponents_defeated_bitflag()) > 0 &&
                        (p1_score_00xx0000() >= 0x75 || p1_score_xx000000() >= 0x01) &&
                        p1_fighting_style_1() == fighting_style_vism &&
                        once(p1_score_full() == 0 && p1_fighting_style_1() == fighting_style_vism) &&
                        never(p1_fighting_style_1() != fighting_style_vism && p1_score_full() != prev(p1_score_full())) &&
                        default_diff_rounds(),
            id = 78392
            )

// =========================================
//          Beat the game (Arcade)              
// =========================================

function achievement_beat_game_char(title, char, id) {
    achievement(title, format("Finish Arcade Mode as {0}.", char), 5,
                trigger = p1_only() &&
                          playing_arcade() &&
                          prior(ladder_opponents_defeated_bitflag()) > 0 &&
                          p1_char() == characters[char] && 
                          beaten_arcade_mode()
                )
}

achievement_beat_game_char("The Road", "Ryu", 0)
achievement_beat_game_char("Active Red", "Ken", 0)
achievement_beat_game_char("Feel the Cool", "Akuma", 0)
achievement_beat_game_char("Decisive Bout", "Charlie", 0)
// achievement_beat_game_char("Resolution", "Chun-Li", 0)
achievement_beat_game_char("Proof of Divinity", "Adon", 0)
achievement_beat_game_char("Tower of Shogun", "Sodom", 0)
achievement_beat_game_char("No More Swingin'", "Guy", 0)
achievement_beat_game_char("Behind You", "Birdie", 0)
achievement_beat_game_char("Scala", "Rose", 0)
achievement_beat_game_char("Fatal Depth", "M. Bison", 0)
achievement_beat_game_char("Shining One", "Sagat", 0)
achievement_beat_game_char("Perfomance", "Dan", 0)
achievement_beat_game_char("Breeze", "Sakura", 0)
achievement_beat_game_char("Gimmick", "Rolento", 0)
achievement_beat_game_char("Praying", "Dhalsim", 0)
achievement_beat_game_char("Heavy Swell", "Zangief", 0)
// achievement_beat_game_char("Moments", "Gen", 0)

achievement("Moments", "Finish Arcade Mode as Gen.", 5,
                trigger = p1_only() &&
                          playing_arcade() &&
                          (p1_char() == characters["Gen"] || p1_char() == characters["Gen (Crane)"]) && 
                          beaten_arcade_mode()
            )

achievement("Resolution", "Finish Arcade Mode as Chun-Li.", 5,
                trigger = p1_only() &&
                          playing_arcade() &&
                          p1_char() == characters["Chun-Li"] && 
                          p1_fighting_style_1() != fighting_style_xism &&
                          beaten_arcade_mode(),
            id = 217593
            )

achievement("Spinning Bird Kick", "Finish Arcade Mode using only Chun-Li SF2.", 5,
                trigger = p1_only() &&
                          playing_arcade() &&
                          p1_char() == characters["Chun-Li"] && 
                          p1_fighting_style_1() == fighting_style_xism &&
                          once(ladder_match() == 0 && p1_char() == characters["Chun-Li"] && p1_fighting_style_1() == fighting_style_xism) &&
                          never(p1_has_won_arcade_match() && p1_char() != characters["Chun-Li"]) &&
                          never(p1_has_won_arcade_match() && p1_fighting_style_1() != fighting_style_xism) &&
                          trigger_when(beaten_arcade_mode()),
            id = 217607
            )

// achievement_beat_game_char("Spinning Bird Kick", "Chun-Li SF2", 0)
achievement_beat_game_char("Untamable Fists", "Balrog", 0)
achievement_beat_game_char("Doll Eyes", "Cammy", 0)
achievement_beat_game_char("Mach-Smasher", "E. Honda", 0)
achievement_beat_game_char("Wild Nature", "Blanka", 0)
achievement_beat_game_char("Prismatic Star", "R. Mika", 0)
achievement_beat_game_char("Stripes", "Cody", 0)
achievement_beat_game_char("Crimson", "Vega", 0)
achievement_beat_game_char("Simple Rating", "Karin", 0)
achievement_beat_game_char("High-Tech I", "Juli", 0)
achievement_beat_game_char("High-Tech II", "Juni", 0)


// =========================================
//          Beat the game (Dramatic)              
// =========================================

function achievement_beat_dramatic_team(title, char1, char2, id) {
    achievement(title, format("Finish Dramatic Battle using only {0} and {1} (2-Normal difficulty, 3 rounds, Normal timer).", char1, char2), 5,
                trigger = p1_only() &&
                          playing_dramatic_battle() &&
                          once(ladder_match() == 0) &&
                          unless(!p1_team_contains_char(characters[char1]) && !p1_team_contains_char(characters[char2])) &&
                          trigger_when(ladder_match() == 0x05 && p1_has_won_arcade_match()) &&
                          default_diff_rounds() &&
                          settings_timer_speed() == 0x01 &&
                          (
                            always_false() || 
                            never(p1_char() != characters[char1] && p2_char() != characters[char1] && p1_has_won_arcade_match()) &&
                            never(p1_char() != characters[char2] && p2_char() != characters[char2] && p1_has_won_arcade_match()) &&
                            never(p1_char() != characters[char1] && p2_char() != characters[char1] && ladder_match() == 0) &&
                            never(p1_char() != characters[char2] && p2_char() != characters[char2] && ladder_match() == 0)
                          )
                          ,
                id = id)
}

achievement_beat_dramatic_team("Shadaloo", "M. Bison", "Cammy", 0)
achievement_beat_dramatic_team("Anti-Shadaloo Investigators", "Charlie", "Chun-Li", 0)
achievement_beat_dramatic_team("Muay Thai Fighters", "Sagat", "Adon", 0)
achievement_beat_dramatic_team("Hibiki and Jimmy", "Dan", "Blanka", 0)
achievement_beat_dramatic_team("Wrestling Fanatics", "R. Mika", "Zangief", 0)
achievement_beat_dramatic_team("Tough and Short Tempered", "Birdie", "Balrog", 0)
achievement_beat_dramatic_team("The Devils", "Akuma", "Gen", 0)
achievement_beat_dramatic_team("Ansatsuken Art", "Ryu", "Ken", 0)
achievement_beat_dramatic_team("Japanese Martial Arts", "E. Honda", "Sodom", 0)
achievement_beat_dramatic_team("Schoolgirls Rivalry", "Karin", "Sakura", 0)
achievement_beat_dramatic_team("Acrobatics Experts", "Vega", "Rolento", 0)
achievement_beat_dramatic_team("Mystical Powers", "Dhalsim", "Rose", 0)
achievement_beat_dramatic_team("Psycho Dolls", "Juli", "Juni", 0)

// =========================================
//                  Misc 2               
// =========================================



achievement("SF2 Mode", "Finish Arcade Mode on Classic Mode (2-Normal difficulty, 3 rounds, Normal timer).", 10,
            trigger =   p1_only() &&
                        playing_arcade() &&
                        p1_classic_flag() &&
                        once(ladder_match() == 0 && p1_classic_flag()) &&
                        never(!p1_classic_flag() && p1_has_won_arcade_match()) &&
                        trigger_when(beaten_arcade_mode()) &&
                        default_diff_rounds() &&
                        settings_timer_speed() == 0x01,
            id = 0)

achievement("Serious Mode", "Finish Arcade Mode on Mazi Mode (2-Normal difficulty, 3 rounds, Normal timer).", 25,
            trigger =   p1_only() &&
                        playing_arcade() &&
                        p1_mazi_flag() &&
                        once(ladder_match() == 0 && p1_mazi_flag()) &&
                        never(!p1_mazi_flag() && p1_has_won_arcade_match()) &&
                        trigger_when(beaten_arcade_mode()) &&
                        default_diff_rounds() &&
                        settings_timer_speed() == 0x01,
            id = 0)

achievement("Strongest Mode", "Finish Arcade Mode on Saikyou Mode (2-Normal difficulty, 3 rounds, Normal timer).", 25,
            trigger =   p1_only() &&
                        playing_arcade() &&
                        p1_saikyou_flag() &&
                        once(ladder_match() == 0 && p1_saikyou_flag()) &&
                        never(!p1_saikyou_flag() && p1_has_won_arcade_match()) &&
                        trigger_when(beaten_arcade_mode()) &&
                        default_diff_rounds() &&
                        settings_timer_speed() == 0x01,
            id = 0)

achievement("Simple Fighting Style", "Finish Arcade Mode using only X-ISM on Normal Mode (2-Normal difficulty, 3 rounds, Normal timer).", 10,
            trigger =   p1_only() &&
                        playing_arcade() &&
                        !p1_classic_flag() &&
                        p1_fighting_style_2() == fighting_style_xism && game_active_players_ingame() == 1 &&
                        once(p1_state() == 0x07 && ladder_match() == 0 && p1_fighting_style_1() == fighting_style_xism) &&
                        never(p1_fighting_style_1() != fighting_style_xism && p1_has_won_arcade_match()) &&
                        trigger_when(beaten_arcade_mode()) &&
                        default_diff_rounds() &&
                        settings_timer_speed() == 0x01,
            id = 0)


achievement("Standard Fighting Style", "Finish Arcade Mode using only A-ISM (2-Normal difficulty, 3 rounds, Normal timer).", 10,
            trigger =   p1_only() &&
                        playing_arcade() &&
                        p1_fighting_style_2() == fighting_style_aism && game_active_players_ingame() == 1 &&
                        once(p1_state() == 0x07 && ladder_match() == 0 && p1_fighting_style_1() == fighting_style_aism) &&
                        never(p1_fighting_style_1() != fighting_style_aism && p1_has_won_arcade_match()) &&
                        trigger_when(beaten_arcade_mode()) &&
                        default_diff_rounds() &&
                        settings_timer_speed() == 0x01,
            id = 0)


achievement("Variable Fighting Style", "Finish Arcade Mode using only V-ISM (2-Normal difficulty, 3 rounds, Normal timer).", 10,
            trigger =   p1_only() &&
                        playing_arcade() &&
                        p1_fighting_style_2() == fighting_style_vism && game_active_players_ingame() == 1 &&
                        once(ladder_match() == 0 && p1_fighting_style_1() == fighting_style_vism) &&
                        never(p1_state() == 0x07 && p1_fighting_style_1() != fighting_style_vism && p1_has_won_arcade_match()) &&
                        trigger_when(beaten_arcade_mode()) &&
                        default_diff_rounds() &&
                        settings_timer_speed() == 0x01,
            id = 0)


achievement("Brave or Grave", "Defeat M. Bison in Final Battle Mode on 8-Expert difficulty and 5 rounds settings (Normal timer).", 5,
            trigger =   p1_only() &&
                        p2_char() == characters["M. Bison"] &&
                        playing_last_battle() &&
                        trigger_when(p1_has_won_arcade_match()) &&
                        settings_difficulty() == 0x07 &&
                        settings_p1_max_round() == 0x02 &&
                        settings_p2_max_round() == 0x02 &&
                        settings_timer_speed() == 0x01,
            id = 0)


achievement("Alpha 3 Survivor", "Finish Survival Mode (2-Normal difficulty)", 50,
                trigger = p1_only() &&
                          playing_survival_mode() &&
                          trigger_when(ladder_match() == 0x1a && p1_has_won_arcade_match())
            )

achievement("Way to the Glory", "Finish Arcade Mode without using a continue (2-Normal difficulty, 3 rounds, Normal timer).", 10,
            trigger =   p1_only() &&
                        playing_arcade() &&
                        once(ladder_match() == 0) &&
                        never(p2_round_wins() == 2 && prev(p2_round_wins()) == 1) &&
                        trigger_when(beaten_arcade_mode()) &&
                        default_diff_rounds() &&
                        settings_timer_speed() == 0x01,
            id = 0)


// =========================================
//               Super Combo              
// =========================================

function achievement_all_super_combo(char, title, points, move_array, id) {
    moves_logic = []
    for move in move_array {
        array_push(moves_logic, once((p2_taking_damage() > prev(p2_taking_damage()) || p1_hit_combo() > prev(p1_hit_combo())) && p1_move() == move))
    }
    
    achievement(title, format("{0}: Hit your opponent with all Super Combos during an Arcade playthrough.", char), points,
                trigger =   p1_only() &&
                            playing_arcade() &&
                            unless(p1_char() != characters[char]) &&
                            unless(p1_move_type() != move_type_super_combo && p1_projectile_hit_opponent() != projectile_hit) &&
                            measured(tally(length(moves_logic), moves_logic)),
                id = id
                )
}

achievement_all_super_combo("Ryu", "Shinkuu Hadouken", 5, [0x08, 0x0a, 0x16], 217639)
achievement_all_super_combo("Ken", "Shinryuuken", 5, [0x08, 0x0a, 0x16], 217640	)
achievement_all_super_combo("Akuma", "Messatsu Gou Hadou", 5, [0x0a, 0x0e, 0x12, 0x16], 217641)
achievement_all_super_combo("Charlie", "Somersault Justice", 5, [0x06, 0x08, 0x04], 217642)
achievement_all_super_combo("Chun-Li", "Senretsu Kyaku", 5, [0x0c, 0x10, 0x0e], 217643)
achievement_all_super_combo("Adon", "Jaguar Revolver", 5, [0x08, 0x0a], 217644)
achievement_all_super_combo("Sodom", "Meido no Miyage", 5, [0x02, 0x06], 217645)
achievement_all_super_combo("Guy", "Bushin Hassou Ken", 5, [0x0a, 0x04, 0x14], 217646)
achievement_all_super_combo("Birdie", "The Birdie", 5, [0x08, 0x06], 217647)
achievement_all_super_combo("M. Bison", "Psycho Crusher", 5, [0x08, 0x0a], 217648)
achievement_all_super_combo("Dan", "Hisshou Buraiken", 5, [0x16, 0x08, 0x0c], 217649)
achievement_all_super_combo("Sakura", "Haru Ichiban", 5, [0x0c, 0x10, 0x0e], 217650)
achievement_all_super_combo("Rolento", "Take no Prisoner", 5, [0x0c, 0x08, 0x0a], 217651)
achievement_all_super_combo("Dhalsim", "Yoga Inferno", 5, [0x0e, 0x10, 0x1a], 217652)
achievement_all_super_combo("Zangief", "Final Atomic Buster", 5, [0x16, 0x14], 217653)
achievement_all_super_combo("Balrog", "Crazy Buffalo", 5, [0x12, 0x14], 217654)
achievement_all_super_combo("Cammy", "Spin Drive Smasher", 5, [0x0c, 0x10, 0x14], 217655)
achievement_all_super_combo("E. Honda", "Oni Musou", 5, [0x02, 0x04, 0x12], 217656)
achievement_all_super_combo("Blanka", "Ground Shave Rolling", 5, [0x0a, 0x10], 217657)
achievement_all_super_combo("R. Mika", "Heavenly Dynamite", 5, [0x1e, 0x1c, 0x10], 217658)
achievement_all_super_combo("Cody", "Final Destruction", 5, [0x18, 0x1a], 217659)
achievement_all_super_combo("Vega", "Flying Barcelona Special", 5, [0x12, 0x14, 0x1a, 0x1c], 217660)
achievement_all_super_combo("Karin", "Kanzuki-ryuu Shinpikaibyaku", 5, [0x10, 0x12], 217661)
achievement_all_super_combo("Juli", "Reverse Shaft Breaker", 5, [0x1e, 0x0c], 217662)
achievement_all_super_combo("Juni", "Psycho Streak", 5, [0x26, 0x0c], 217663)

achievement("Aura Soul Spark", "Rose: Hit your opponent with all Super Combos and use Soul Illusion once during an Arcade playthrough.", 5,
                trigger =   p1_only() &&
                            playing_arcade() &&
                            unless(p1_char() != characters["Rose"]) &&
                            measured(tally(3, once(p1_hit_with_move(0x0a)),
                                              once(p1_hit_with_move_grab(0x08)),
                                              once(p1_move() == 0x0c))),
            id = 0)

achievement("Tiger Cannon", "Sagat: Hit your opponent with all Super Combos and use Angry Charge once during an Arcade playthrough.", 5,
                trigger =   p1_only() &&
                            playing_arcade() &&
                            unless(p1_char() != characters["Sagat"]) &&
                            measured(tally(4, once(p1_hit_with_move(0x0c)),
                                              once(p1_hit_with_move(0x08)),
                                              once(p1_hit_with_move(0x0a)),
                                              once(p1_move() == 0x16))),
            id = 0)

achievement("Zan'ei and Kouga", "Gen: Hit your opponent with all Super Combos from Crane and Mantis form during an Arcade playthrough.", 5,
                trigger =   p1_only() &&
                            playing_arcade() &&
                            measured(tally(4, once(p1_char() == 0x11 && p1_hit_with_move(0x0a)),
                                              once(p1_char() == 0x11 && p1_hit_with_move(0x08)),
                                              once(p1_char() == 0x13 && p1_hit_with_move(0x0e)),
                                              once(p1_char() == 0x13 && p1_hit_with_move(0x0c)))),
            id = 0)

achievement("Death Cross Dancing", "Juli & Juni: Hit your opponent with all Super Combos during a Dramatic Battle playthrough.", 5,
                trigger =   p1_only() &&
                            playing_dramatic_battle() &&
                            ((measured(tally(2, once(p1_char() == characters["Juli"] && p1_hit_with_move(0x22)),
                                              once(p1_char() == characters["Juli"] && p1_move_type() == move_type_super_combo && p1_move() == 0x1c && p1_animation() == 0xef18)))) ||
                            (measured(tally(2, once(p1_char() == characters["Juni"] && p1_hit_with_move(0x22)),
                                              once(p1_char() == characters["Juni"] && p1_move_type() == move_type_super_combo && p1_move() == 0x1c && p1_animation() == 0xe5b0))))),
            id = 0)

achievement("The Actual Saikyou Style", "Dan: Use Chouhatsu Densetsu during a fight and let it play entirely (Arcade Mode).", 5,
            trigger =   p1_only() &&
                        playing_arcade() &&
                        unless(p1_char() != characters["Dan"]) &&
                        p1_animation() == 0xd978 &&
                        p1_move() == 0x18 &&
                        p1_move_type() == move_type_super_combo,
            id = 0)

achievement("Curse You, CPU!", "Dan: Taunt 10 times in mid air during Chouhatsu Shinwa (Arcade Mode).", 5,
            trigger =   p1_only() &&
                        playing_arcade() &&
                        unless(p1_char() != characters["Dan"]) &&
                        unless(p1_in_air_flag() == 0) &&
                        unless(word(0x843a) == 0) && // Chouhatsu Shinwa Timer (Dan) [16 bits]
                        measured(repeated(10, p1_attacking_flag() == 1 && prev(p1_attacking_flag()) == 0)),
            id = 0)


