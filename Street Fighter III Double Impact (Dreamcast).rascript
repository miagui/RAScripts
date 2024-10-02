// Street Fighter III: Double Impact
// #ID = 10850

// =========================================
//              Memory Acessors              
// =========================================

function general_current_game() => dword(0xFFFE04)
function is_newgen() => never(general_current_game() != 0x01) 
function is_secondimpact() => never(general_current_game() != 0x02) 

// ===================
// 1. NeW Generation
// ===================

// Settings
function g1_settings_difficulty() => dword(0x61003C)
function g1_settings_time_limit() => dword(0x610040)
function g1_settings_rounds() => word(0x610044)
function g1_settings_damage_level() => dword(0x610048)
function g1_settings_speed() => dword(0x61004C)
function g1_settings_s_a_gauge() => dword(0x610054)
function g1_settings_life_gauge() => dword(0x61005C)

function g1_default_settings() {
  return(
    g1_settings_difficulty() >= 1 &&
    g1_settings_rounds() == 1 &&
    g1_settings_time_limit() == 2 &&
    g1_settings_damage_level() == 3 &&
    g1_settings_s_a_gauge() == 0 &&
    g1_settings_life_gauge() == 0
  )
}

function g1_default_settings_level8() {
  return(
    g1_settings_difficulty() == 7 &&
    g1_settings_time_limit() == 2 &&
    g1_settings_rounds() == 1 &&
    g1_settings_damage_level() == 3 &&
    g1_settings_s_a_gauge() == 0 &&
    g1_settings_life_gauge() == 0
  )
}

// Game
function g1_game_bgm_value() => dword(0x733424)
function g1_game_arcade_match() => word(0x54940C)
function g1_game_mode() => dword(0x549E94)
function g1_p1_human_controlled() => bit0(0x543ECB)
function g1_p2_human_controlled() => bit0(0x5442A3)

function g1_arcade_mode_flag() => bit0(0x549e8a)
function g1_game_mode_flags() => dword(0x549e8a)


// Rounds
function g1_round_k_o() => bit0(0x54528A)
function g1_round_p2_is_round_winner() => bit0(0x54528B)
function g1_round_p1_is_round_winner() => bit0(0x54528C)
function g1_current_round() => byte(0x545296)

// P1
function g1_p1_character() => byte(0x545293)
function g1_p1_hp() => word(0x543F66)
function g1_p1_super_art() => byte(0x545297)
function g1_p1_rounds_won() => word(0x54528E)
function g1_p1_score() => dword(0x5452a8)
function g1_p1_special_moves() => word(0x543EF0)
function g1_p1_moves() => word(0x543F76)
function g1_p1_hit_combo() => word(0x544788)


// P2
function g1_p2_character() => byte(0x545294)
function g1_p2_hp() => word(0x54433E)
function g1_p2_super_art() => byte(0x545298)
function g1_p2_rounds_won() => word(0x545290)
function g1_p2_score() => dword(0x5452B8)


// ===================
// 2.   2nd Impact
// ===================

// Settings
function g2_settings_difficulty() => dword(0x72CCDC)
function g2_settings_time_limit() => dword(0x72CCE0)
function g2_settings_rounds() => word(0x72CCE4)
function g2_settings_damage_level() => dword(0x72CCE8)
function g2_settings_speed() => dword(0x72CCEC)
function g2_settings_s_a_gauge() => dword(0x72CCF4)
function g2_settings_life_gauge() => dword(0x72CCFC)

function g2_default_settings() {
  return(
    g2_settings_difficulty() >= 1 &&
    g2_settings_time_limit() == 2 &&
    g2_settings_rounds() == 1 &&
    g2_settings_damage_level() == 3 &&
    g2_settings_s_a_gauge() == 0 &&
    g2_settings_life_gauge() == 0
  )
}

function g2_default_settings_level8() {
  return(
    g2_settings_difficulty() == 7 &&
    g2_settings_time_limit() == 2 &&
    g2_settings_rounds() == 1 &&
    g2_settings_damage_level() == 3 &&
    g2_settings_s_a_gauge() == 0 &&
    g2_settings_life_gauge() == 0
  )
}

// Game
function g2_game_bgm_value() => dword(0x8500A8)
function g2_game_arcade_match() => word(0x6a14c8)
function g2_game_mode() => dword(0x6A27FC)
function g2_arcade_mode_flag() => bit0(0x6a27f4)
function g2_game_mode_flags() => dword(0x6a27f4)

function g2_akuma_ending() => bit0(0x6a27da)

function g2_p1_human_controlled() => bit0(0x645593)
function g2_p2_human_controlled() => bit0(0x64599F)

function g2_match_super_finishes() => word(0x6a2788)
function g2_match_perfects() => word(0x6a27d0)

// Rounds
function g2_round_k_o() => bit0(0x69D33E)
function g2_round_p2_is_round_winner() => bit0(0x69D33F)
function g2_round_p1_is_round_winner() => bit0(0x69D340)
function g2_current_round() => byte(0x69d34a)

// P1
function g2_p1_character() => byte(0x69D347)
function g2_p1_hp() => word(0x64562E)
function g2_p1_super_art() => byte(0x69D34B)
function g2_p1_rounds_won() => word(0x69D342)
function g2_p1_score() => dword(0x69D35C)
function g2_p1_hit_combo() => word(0x645ED0)


// P2
function g2_p2_character() => byte(0x69D348)
function g2_p2_character_arcade() => byte(0x6a27c4) // used only for "Find Akuma" achievement
function g2_p2_hp() => word(0x645A3A)
function g2_p2_super_art() => byte(0x69D34C)
function g2_p2_rounds_won() => word(0x69D344)


characters = {
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
   "Shin Akuma": 15,
   "Gill": 0
}


// =========================================
//              Utility Functions              
// =========================================

// New Gen
function g1_no_extra_settings() => sum_of(range(0, 8), o => dword(0x610068 + (o * 4))) == 0 && g1_settings_life_gauge() == 0
function g1_player_won_match() => g1_p1_rounds_won() == g1_settings_rounds() + 1 && prev(g1_p1_rounds_won()) == g1_settings_rounds()
function g1_game_beaten() => g1_game_arcade_match() == 7 && prev(g1_game_arcade_match()) == 6
function g1_p1_only() => g1_p1_human_controlled() == 1 && g1_p2_human_controlled() == 0

function g1_is_ingame() => never(g1_game_mode_flags() == 0) // basically a demo check
function g1_is_arcade() => never(g1_game_mode() != 0) 

// 2nd Impact
function g2_no_extra_settings() => sum_of(range(0, 8), o => dword(0x72cd08 + (o * 4))) == 0 && g2_settings_life_gauge() == 0
function g2_no_opponents_defeated_yet() => sum_of(range(0, 16), o => dword(0x6a17bc + o)) == 0 && g2_settings_life_gauge() == 0
function g2_player_won_match() => g2_p1_rounds_won() == g2_settings_rounds() + 1 && prev(g2_p1_rounds_won()) == g2_settings_rounds()

function g2_game_beaten() => g2_game_arcade_match() == 8 && prev(g2_game_arcade_match()) == 7
function g2_game_beaten_akuma() => g2_game_arcade_match() == 7 && g2_changed_to_ending_bgm() && __ornext(g2_p2_character() == characters["Akuma"] || g2_p2_character() == characters["Shin Akuma"])
function g2_changed_to_ending_bgm() => __ornext(g2_game_bgm_value() == 0x14 || g2_game_bgm_value() == 0x15 || g2_game_bgm_value() == 0x16 || g2_game_bgm_value() == 0x17 || g2_game_bgm_value() == 0x18 || g2_game_bgm_value() == 0x19 || g2_game_bgm_value() == 0x1a || g2_game_bgm_value() == 0x1f || g2_game_bgm_value() == 0x1b) && g2_game_bgm_value() != prev(g2_game_bgm_value())

function g2_p1_only() => g2_p1_human_controlled() == 1 && g2_p2_human_controlled() == 0
function g2_p1_only_delta() => prev(g2_p1_human_controlled()) == 1 && prev(g2_p2_human_controlled()) == 0

function g2_is_ingame() => never(g2_game_mode_flags() == 0) // basically a demo check
function g2_is_arcade() => never(g2_game_mode() != 0)




// =========================================
//             [NG] Arcade Mode             
// =========================================

function achiev_ng_beat_the_game(title, char) {
    achievement(title, format("[New Gen] Finish Arcade Mode using only {0} on default time limit/damage (no Extra Settings).", char), 10,
                trigger = is_newgen() &&
                          g1_p1_only() &&
                          g1_is_arcade() &&
                          g1_is_ingame() &&
                          once(g1_p1_character() == characters[char] && g1_game_arcade_match() == 0 && g1_game_bgm_value() == 2) &&
                          never(g1_p1_character() != characters[char] && g1_game_arcade_match() > prev(g1_game_arcade_match())) &&
                          g1_p1_character() == characters[char] &&
                          trigger_when(g1_game_beaten()) &&
                          g1_settings_time_limit() == 2 &&
                          g1_settings_damage_level() == 3 &&
                          g1_no_extra_settings()
                )
}

achievement("The Twin Brothers", "[New Gen] Finish Arcade Mode using only Yun or Yang on default time limit/damage (no Extra Settings).", 10,
                trigger = is_newgen() &&
                          g1_p1_only() &&
                          g1_is_arcade() &&
                          g1_is_ingame() &&
                          once(__ornext(g1_p1_character() == characters["Yun"] || g1_p1_character() == characters["Yang"]) && g1_game_arcade_match() == 0 && g1_game_bgm_value() == 2) &&
                          never(g1_p1_character() != characters["Yun"] && g1_p1_character() != characters["Yang"] && g1_game_arcade_match() > prev(g1_game_arcade_match())) &&
                          __ornext(g1_p1_character() == characters["Yun"] || g1_p1_character() == characters["Yang"]) &&
                          trigger_when(g1_game_beaten()) &&
                          g1_settings_time_limit() == 2 &&
                          g1_settings_damage_level() == 3 &&
                          g1_no_extra_settings()
                )

achiev_ng_beat_the_game("The Young Blood", "Alex")
achiev_ng_beat_the_game("The Lone Fighter", "Ryu")
// achiev_ng_beat_the_game("The Twin Brothers", "Yun & Yang")
achiev_ng_beat_the_game("The Boxing Gentleman", "Dudley")
achiev_ng_beat_the_game("The Living Biohazard", "Necro")
achiev_ng_beat_the_game("The High School Ninja", "Ibuki")
achiev_ng_beat_the_game("The Nature Loving Fighter", "Elena")
achiev_ng_beat_the_game("The Senjutsu Master", "Oro")
achiev_ng_beat_the_game("The Flaming Dragon", "Ken")
achiev_ng_beat_the_game("The Cannonball Kid", "Sean")
achiev_ng_beat_the_game("The Greek God", "Gill")


achievement("Secret Society", "[New Gen] Finish Arcade Mode without using a continue on default settings (no Extra Settings).", 25,
                trigger = is_newgen() &&
                          g1_p1_only() &&
                          g1_is_arcade() &&
                          g1_is_ingame() &&
                          once(g1_game_arcade_match() == 0 && g1_game_bgm_value() == 2) &&
                          never(g1_p2_rounds_won() == 2 && prev(g1_p2_rounds_won()) == 1) &&
                          trigger_when(g1_game_beaten()) &&
                          g1_default_settings() &&
                          g1_no_extra_settings()
                )

achievement("Fighting is My Nature", "[New Gen] Finish Arcade Mode on max. difficulty and default settings (no Extra Settings).", 10,
                trigger = is_newgen() &&
                          g1_p1_only() &&
                          g1_is_arcade() &&
                          g1_is_ingame() &&
                          trigger_when(g1_game_beaten()) &&
                          g1_default_settings_level8() &&
                          g1_no_extra_settings()
                )

achievement("New Generation", "[New Gen] Win a round with a Perfect (no Extra Settings).", 2,
            trigger =   is_newgen() &&
                        g1_p1_only() &&
                        g1_is_arcade() &&
                        g1_is_ingame() &&
                        g1_p1_rounds_won() > prev(g1_p1_rounds_won()) &&
                        g1_p1_hp() == 0xa0 &&
                        g1_no_extra_settings()
            )



// =========================================
//             [2ND] Arcade Mode             
// =========================================

function achiev_2nd_beat_the_game(title, char) {
    achievement(title, format("[2nd Impact] Finish Arcade Mode using only {0} on default time limit/damage (no Extra Settings).", char), 10,
                trigger = is_secondimpact() &&
                          g2_p2_human_controlled() == 0 &&
                          g2_is_arcade() &&
                          g2_is_ingame() &&
                          once(g2_p1_character() == characters[char] && g2_game_arcade_match() == 0 && g2_game_bgm_value() == 3 && g2_no_opponents_defeated_yet()) &&
                          never(g2_p1_character() != characters[char] && g2_game_arcade_match() > prev(g2_game_arcade_match())) &&
                          g2_p1_character() == characters[char] &&
                          (
                            (trigger_when(g2_game_beaten())) ||
                            (trigger_when(g2_game_beaten_akuma()))
                          ) &&
                          g2_settings_time_limit() == 2 &&
                          g2_settings_damage_level() == 3 &&
                          g2_no_extra_settings()
                ) 
}

achiev_2nd_beat_the_game("Jazzy NYC", "Alex")
achiev_2nd_beat_the_game("Good Fighter", "Ryu")
achiev_2nd_beat_the_game("Crowded Street ~ Action", "Yun")
achiev_2nd_beat_the_game("Leave Alone", "Dudley")
achiev_2nd_beat_the_game("Get on a Train", "Necro")
achiev_2nd_beat_the_game("Bottoms Up", "Hugo")
achiev_2nd_beat_the_game("Sharp Eyes", "Ibuki")
achiev_2nd_beat_the_game("Tomboy", "Elena")
achiev_2nd_beat_the_game("Cave Man", "Oro")
achiev_2nd_beat_the_game("Crowded Street ~ Cold", "Yang")
achiev_2nd_beat_the_game("Funky Bay", "Ken")
achiev_2nd_beat_the_game("São Paulo", "Sean")
achiev_2nd_beat_the_game("Nile", "Urien")
achiev_2nd_beat_the_game("The Flame", "Akuma")
achiev_2nd_beat_the_game("Giant Attack", "Shin Akuma")
achiev_2nd_beat_the_game("Book of Miraha", "Gill")

function achiev_hugo_ending(title, partner) {
    achievement(title, format("[2nd Impact] Get Hugo's ending with {0}.", partner), 5,
                trigger = is_secondimpact() &&
                          g2_is_arcade() &&
                          g2_is_ingame() &&
                          never(g2_p1_character() != characters["Hugo"]) &&
                          never(g2_p2_character() != characters[partner]) &&
                          g1_game_bgm_value() == 0x17
                )
}

// achiev_hugo_ending("Ragnarok Winners", "Gill")
// achiev_hugo_ending("Beauty and the Beast", "Elena")
// achiev_hugo_ending("Hugo & Thunderbolt", "Necro")
// achiev_hugo_ending("Soul Brothers", "Ryu")


achievement("Illuminati's Fall", "[2nd Impact] Finish Arcade Mode without using a continue on default settings (no Extra Settings).", 25,
                trigger = is_secondimpact() &&
                          g2_p2_human_controlled() == 0 &&
                          g2_is_arcade() &&
                          g2_is_ingame() &&
                          once(g2_game_arcade_match() == 0 && g2_game_bgm_value() == 2) &&
                          never(g2_p2_rounds_won() == 2 && prev(g2_p2_rounds_won()) == 1) &&
                          (
                            (trigger_when(g2_game_beaten())) ||
                            (trigger_when(g2_game_beaten_akuma()))
                          ) &&
                          g2_default_settings() &&
                          g2_no_extra_settings()
                )

achievement("Wild Eyes", "[2nd Impact] Finish Arcade Mode on max. difficulty and default settings (no Extra Settings).", 10,
                trigger = is_secondimpact() &&
                          g2_p2_human_controlled() == 0 &&
                          g2_is_arcade() &&
                          g2_is_ingame() &&
                          (
                            (trigger_when(g2_game_beaten())) ||
                            (trigger_when(g2_game_beaten_akuma()))
                          ) &&
                          g2_default_settings_level8() &&
                          g2_no_extra_settings()
                )

achievement("I Am Power Made of Flesh!", "[2nd Impact] Find Akuma (no Extra Settings).", 10,
            trigger =   is_secondimpact() &&
                        g2_p1_only() &&
                        g2_is_arcade() &&
                        g2_is_ingame() &&
                        g2_p2_character_arcade() == characters["Akuma"] &&
                        prev(g2_p2_character_arcade()) != characters["Akuma"] &&
                        g2_game_arcade_match() == 7 &&
                        g2_no_extra_settings()
            )

achievement("Behold the True Power of My Fist!", "[2nd Impact] Defeat Shin Akuma (no Extra Settings).", 25,
            trigger =   is_secondimpact() &&
                        g2_p1_only() &&
                        g2_is_arcade() &&
                        g2_is_ingame() &&
                        g2_p2_character() == characters["Shin Akuma"] &&
                        g2_player_won_match() &&
                        g2_game_arcade_match() == 7 &&
                        g2_no_extra_settings()
            )

achievement("Fist is the Soul!", "[2nd Impact] Win a round with a Perfect (no Extra Settings).", 2,
            trigger =   is_secondimpact() &&
                        g2_p1_only() &&
                        g2_is_arcade() &&
                        g2_is_ingame() &&
                        g2_p1_hp() == 0xa0 &&
                        g2_p1_rounds_won() > prev(g2_p1_rounds_won()) &&
                        g2_no_extra_settings()
            )

// =========================================
//                  Rivals              
// =========================================

function achiev_2nd_defeat_rival(title, char, rival) {
    achievement(title, format("[2nd Impact] Find and defeat your rival as {0} (no Extra Settings).", char), 5,
                trigger = is_secondimpact() &&
                          g2_p1_only() &&
                          g2_is_arcade() &&
                          g2_is_ingame() &&
                          g2_game_arcade_match() >= 4 &&
                          g2_p1_character() == characters[char] &&
                          g2_p2_character() == characters[rival] &&
                          trigger_when(g2_player_won_match()) &&
                          g2_no_extra_settings()
                )
}

achiev_2nd_defeat_rival("There Is Nothing I Can Teach You!", "Ryu", "Sean")
achiev_2nd_defeat_rival("My Fighting Spirit Never Loses!", "Sean", "Yang")
achiev_2nd_defeat_rival("You Should Lose That Fake Shoryuken....", "Ken", "Dudley")
achiev_2nd_defeat_rival("Wha...? Who Are You?!", "Akuma", "Sean")
achiev_2nd_defeat_rival("Sparring Partner", "Alex", "Ken")
achiev_2nd_defeat_rival("Such Strange Clothes....", "Ibuki", "Elena")
achiev_2nd_defeat_rival("Hey Boxer Boy!", "Dudley", "Hugo")
achiev_2nd_defeat_rival("Capoeira Practice", "Elena", "Ryu")
achiev_2nd_defeat_rival("Huh? You Have Even Less Hair Than I Do!", "Oro", "Necro")
achiev_2nd_defeat_rival("How About Electromagnetic Power Instead?", "Necro", "Ibuki")
achiev_2nd_defeat_rival("Tremble Before Me!", "Urien", "Alex")
achiev_2nd_defeat_rival("\"Iron Freak\"!", "Yun", "Urien")
achiev_2nd_defeat_rival("Stupid Old Man!", "Yang", "Oro")
achiev_2nd_defeat_rival("Giant (Not So) Kung Fu", "Hugo", "Yun")
achiev_2nd_defeat_rival("Your Quest is Over; Permanently", "Gill", "Alex")



// =========================================
//               Leaderboards              
// =========================================


// New Gen
leaderboard("New Generation - Best Score", "Default settings and no extra settings.",
           start =  is_newgen() &&
                    g1_is_arcade() &&
                    g1_is_ingame() &&
                    g1_game_arcade_match() == 7 &&
                    prev(g1_p1_human_controlled()) == 1 && g1_p1_human_controlled() == 0 && prev(g1_p2_human_controlled()) == 0 &&
                    g1_default_settings() &&
                    g1_no_extra_settings(),
           cancel = always_false(),
           submit = always_true(),
           value = g1_p1_score(),
           format = "VALUE", lower_is_better=false)


leaderboard("New Generation - Best Score (1CC)", "Default settings and no extra settings.",
           start =  is_newgen() &&
                    g1_p1_only() &&
                    g1_is_arcade() &&
                    g1_is_ingame() &&
                    g1_game_arcade_match() == 0 && g1_game_bgm_value() == 2 &&
                    g1_default_settings() &&
                    g1_no_extra_settings(),
           cancel = (g1_p2_rounds_won() == 2 && prev(g1_p2_rounds_won()) == 1) || g1_game_mode_flags() == 0,
           submit = is_newgen() &&
                    g1_p1_only() &&
                    g1_is_arcade() &&
                    g1_game_arcade_match() == 7 &&
                    prev(g1_p1_human_controlled()) == 1 && g1_p1_human_controlled() == 0 && prev(g1_p2_human_controlled()) == 0,
           value = g1_p1_score(),
           format = "VALUE", lower_is_better=false)



// 2nd Impact
leaderboard("2nd Impact - Best Score", "Default settings and no extra settings.",
           start =  is_secondimpact() &&
                    g2_p2_human_controlled() == 0 &&
                    g2_is_arcade() &&
                    g2_is_ingame() &&
                    g2_default_settings() &&
                    g2_no_extra_settings() &&
                    (
                      (g2_game_arcade_match() == 8 && prev(g2_p1_human_controlled()) == 1 && g2_p1_human_controlled() == 0 && prev(g2_p2_human_controlled()) == 0) || // scenario 1: defeated normal boss
                      (g2_game_beaten_akuma()) // scenario 2: defeated akuma
                    ),
           cancel = always_false(),
           submit = always_true(),
           value = g2_p1_score(),
           format = "VALUE", lower_is_better=false)


leaderboard("2nd Impact - Best Score (1CC)", "Default settings and no extra settings.",
           start =  is_secondimpact() &&
                    g2_p2_human_controlled() == 0 &&
                    g2_is_arcade() &&
                    g2_is_ingame() &&
                    g2_game_arcade_match() == 0 && g2_game_bgm_value() == 2 &&
                    g2_default_settings() &&
                    g2_no_extra_settings(),
           cancel = (g2_p2_rounds_won() == 2 && prev(g2_p2_rounds_won()) == 1) || g2_game_mode_flags() == 0,
           submit = is_secondimpact() &&
                    g2_p2_human_controlled() == 0 &&
                    g2_is_arcade() &&
                    g2_default_settings() &&
                    g2_no_extra_settings() &&
                    (
                      (g2_game_arcade_match() == 8 && prev(g2_p1_human_controlled()) == 1 && g2_p1_human_controlled() == 0 && prev(g2_p2_human_controlled()) == 0) || // scenario 1: defeated normal boss
                      (g2_game_beaten_akuma()) // scenario 2: defeated akuma
                    ),
           value = g2_p1_score(),
           format = "VALUE", lower_is_better=false)