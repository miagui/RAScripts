// King of Fighters 2003, The
// #ID = 21020

function settings_difficulty() => byte(0x9eda40)

function settings_default_defense_level() => word(0x9edc1c) == 0x0303
function settings_default_gauge_level() => word(0x9edc1e) == 0x0000
function settings_default_time() => byte(0x009eda30) == 0x01

function game_mode() => byte(0x9d6870)
         MODE_SINGLE_ARCADE = 0x00
         MODE_TEAM_ARCADE = 0x01
         MODE_SINGLE_VERSUS = 0x02
         MODE_ARCADE_VERSUS = 0x03
         MODE_SINGLE_PRACTICE = 0x04
         MODE_TEAM_PRACTICE = 0x05
         MODE_SINGLE_SURVIVAL = 0x20
         MODE_TEAM_SURVIVAL = 0x21
         MODE_TEAM_PLAY = 0x41
         MODE_TEAM_VERSUS = 0x43

function game_continue_service() => byte(0x9e58d8)
function game_arcade_match() => byte(0x9e57f8)
function game_bgm() => byte(0x3c5358)
         BGM_CHAR_SELECT = 0x36
         BGM_FIGHT_INTRO = 0x37 
         BGM_FIGHT_INTRO_ADEL = 0x30
         BGM_FIGHT_INTRO_MUKAI = 0x3d
         BGM_FIGHT_ENDED = 0x4B
         BGM_POST_FIGHT_DIALOGUE = 0x38
         BGM_ENDING_MUKAI = 0x3E
         BGM_ENDING_ADEL = 0x41

function unlockable_mukai() => bit0(0x9edc15)
function unlockable_adel() => bit1(0x9edc15)
function survival_wins_bcd() => word(0x9e5828) 

function arcade_score() => tbyte_be(0x9d68a1)

function p1_active_state() => byte(0x9d68d0)
function p2_active_state() => byte(0x9d68d1)
function players_active_combo() => word(0x9d68d0)

function p1_character_slot_1() {
    return(
        bit0(0x9e58b8) * 1 + 
        bit1(0x9e58b8) * 2 + 
        bit2(0x9e58b8) * 4 +
        bit3(0x9e58b8) * 8 +
        bit4(0x9e58b8) * 16 +
        bit5(0x9e58b8) * 32
    )
}

function p1_character_slot_2() {
    return(
        bit0(0x9e58b9) * 1 + 
        bit1(0x9e58b9) * 2 + 
        bit2(0x9e58b9) * 4 +
        bit3(0x9e58b9) * 8 +
        bit4(0x9e58b9) * 16 +
        bit5(0x9e58b9) * 32
    )
}

function p1_character_slot_3() {
    return(
        bit0(0x9e58ba) * 1 + 
        bit1(0x9e58ba) * 2 + 
        bit2(0x9e58ba) * 4 +
        bit3(0x9e58ba) * 8 +
        bit4(0x9e58ba) * 16 +
        bit5(0x9e58ba) * 32
    )
}

function p2_character_slot_1() {
    return(
        bit0(0x9e58b0) * 1 + 
        bit1(0x9e58b0) * 2 + 
        bit2(0x9e58b0) * 4 +
        bit3(0x9e58b0) * 8 +
        bit4(0x9e58b0) * 16 +
        bit5(0x9e58b0) * 32
    )
}

function p2_character_slot_2() {
    return(
        bit0(0x9e58b1) * 1 + 
        bit1(0x9e58b1) * 2 + 
        bit2(0x9e58b1) * 4 +
        bit3(0x9e58b1) * 8 +
        bit4(0x9e58b1) * 16 +
        bit5(0x9e58b1) * 32
    )
}

function p2_character_slot_3() {
    return(
        bit0(0x9e58b2) * 1 + 
        bit1(0x9e58b2) * 2 + 
        bit2(0x9e58b2) * 4 +
        bit3(0x9e58b2) * 8 +
        bit4(0x9e58b2) * 16 +
        bit5(0x9e58b2) * 32
    )
}





function p1_current_character_slot() => byte(0x9e5888)
function p1_current_leader_slot() => byte(0x9e5898)

function p1_order_select_slot_1() {
    return(
        bit0(0x9e58a8) * 1 + 
        bit1(0x9e58a8) * 2 + 
        bit2(0x9e58a8) * 4 +
        bit3(0x9e58a8) * 8 +
        bit4(0x9e58a8) * 16 +
        bit5(0x9e58a8) * 32
    )
}

function p1_order_select_slot_2() {
    return(
        bit0(0x9e58a9) * 1 + 
        bit1(0x9e58a9) * 2 + 
        bit2(0x9e58a9) * 4 +
        bit3(0x9e58a9) * 8 +
        bit4(0x9e58a9) * 16 +
        bit5(0x9e58a9) * 32
    )
}

function p1_order_select_slot_3() {
    return(
        bit0(0x9e58aa) * 1 + 
        bit1(0x9e58aa) * 2 + 
        bit2(0x9e58aa) * 4 +
        bit3(0x9e58aa) * 8 +
        bit4(0x9e58aa) * 16 +
        bit5(0x9e58aa) * 32
    )
}

function p2_current_character_slot() => byte(0x9e5880)

// P1 Char 1
function p1_hit_combo() => byte(0x9d704f)
function p1_current_move() => word(dword(0x9e5860) + 0x48)
function p1_move_type() => byte(dword(0x9e5860) + 0xd5)
function p1_normal_attack() => byte(dword(0x9e5860) + 0xd5) <= 0x1f
function p1_special() => bit5(dword(0x9e5860) + 0xd5)
function p1_shift() => bit6(dword(0x9e5860) + 0xd5)
function p1_leader_dm() => bit7(dword(0x9e5860) + 0xd5)
function p1_target_damaged() => bit3(dword(0x9e5860) + 0xda)
function p1_target_grabbed() => bit7(dword(0x9e5860) + 0xda)
function p1_target_state() => byte(dword(0x9e5860) + 0xda)

// P2
function p2_player_hit() => bit0(dword(0x9e5840) + 0xd8)
function p2_player_damaged_1() => word(0x9d6b5c) < prev(word(0x9d6b5c))
function p2_player_damaged_2() => word(0x9d6a5c) < prev(word(0x9d6a5c))
function p2_player_damaged_3() => word(0x9d695c) < prev(word(0x9d695c))

characters = {
   "Ash": 0,
   "Duo Lon": 1,
   "Shen Woo": 2,
   "Terry": 3,
   "Joe": 4,
   "Tizoc": 5,
   "Ryo": 6,
   "Robert": 7,
   "Yuri": 8,
   "Kim": 9,
   "Chang": 10,
   "Jhun": 11,
   "Leona": 12,
   "Ralf": 13,
   "Clark": 14,
   "Gato": 15,
   "Billy": 16,
   "Yamazaki": 17,
   "King": 18,
   "Mai": 19,
   "Blue Mary": 20,
   "Benimaru": 21,
   "Shingo": 22,
   "Daimon": 23,
   "Athena": 24,
   "Hinako": 25,
   "Malin": 26,
   "K'": 27,
   "Maxima": 28,
   "Whip": 29,
   "Kyo": 30,
   "Iori": 31,
   "Chizuru": 32,
   "Kusanagi": 33,
   "Adel": 34, 
   "Mukai": 35,
   "Maki": 36
}

// =========================================
//                  Utility              
// =========================================

function default_settings_level3() => settings_difficulty() >= 2 && settings_default_defense_level() && settings_default_gauge_level() && settings_default_time()
function default_settings_level8() => settings_difficulty() == 7 && settings_default_defense_level() && settings_default_gauge_level() && settings_default_time()



function is_any_arcade() => __ornext(game_mode() <= MODE_TEAM_ARCADE || game_mode() == MODE_TEAM_PLAY)
function is_any_team_play() => __ornext(game_mode() == MODE_TEAM_ARCADE || game_mode() == MODE_TEAM_PLAY)
function p1_only() => p1_active_state() >= 1 && p2_active_state() == 0

function p1_team_has_char(char_id) => p1_character_slot_1() == char_id || p1_character_slot_2() == char_id || p1_character_slot_3() == char_id
function p1_dont_have_char(char_id) => p1_character_slot_1() != char_id && p1_character_slot_2() != char_id && p1_character_slot_3() != char_id


function mukai_ending() => game_bgm() == BGM_ENDING_MUKAI && prev(game_bgm()) != BGM_ENDING_MUKAI && game_arcade_match() > 8
function adel_ending() => game_bgm() == BGM_ENDING_ADEL && prev(game_bgm()) != BGM_ENDING_ADEL && game_arcade_match() > 8

function all_char_pictures() => sum_of(range(0, 31), b => bit(b,0x9eda10)) + // 32 +
                                sum_of(range(0, 4), b => bit(b,0x9eda14)) // 5 = 37

function all_team_pictures() => sum_of(range(5, 7), b => bit(b,0x9eda14)) + // 3 +
                                sum_of(range(0, 7), b => bit(b,0x9eda15)) // 8 = 11

// =========================================
//               Beat the game             
// =========================================

function beat_game_team_progression(title, char1, char2, char3) {
    achievement(title, format("Beat the game by defeating Mukai using only {0}, {1} and {2} (default settings).", char1, char2, char3), 10, type="progression",
                trigger =   is_any_arcade() &&
                            p1_only() &&
                            once(game_arcade_match() == 0 && game_bgm() == BGM_CHAR_SELECT && p1_active_state() > 0) &&
                            never(p2_character_slot_1() == characters["Adel"]) && // reset if find Adel to remove the challenge indicator
                            never(p1_dont_have_char(characters[char1]) && game_bgm() == BGM_FIGHT_INTRO) &&
                            never(p1_dont_have_char(characters[char2]) && game_bgm() == BGM_FIGHT_INTRO) &&
                            never(p1_dont_have_char(characters[char3]) && game_bgm() == BGM_FIGHT_INTRO) &&
                            p1_team_has_char(characters[char1]) &&
                            p1_team_has_char(characters[char2]) &&
                            p1_team_has_char(characters[char3]) &&
                            default_settings_level3() &&
                            trigger_when(mukai_ending())
                
                )
}

function beat_game_team(title, char1, char2, char3) {
    achievement(title, format("Beat the game by defeating Mukai using only {0}, {1} and {2} (default settings).", char1, char2, char3), 10,
                trigger =   is_any_arcade() &&
                            p1_only() &&
                            once(game_arcade_match() == 0 && game_bgm() == BGM_CHAR_SELECT && p1_active_state() > 0) &&
                            never(p2_character_slot_1() == characters["Adel"]) && // reset if find Adel to remove the challenge indicator
                            never(p1_dont_have_char(characters[char1]) && game_bgm() == BGM_FIGHT_INTRO) &&
                            never(p1_dont_have_char(characters[char2]) && game_bgm() == BGM_FIGHT_INTRO) &&
                            never(p1_dont_have_char(characters[char3]) && game_bgm() == BGM_FIGHT_INTRO) &&
                            p1_team_has_char(characters[char1]) &&
                            p1_team_has_char(characters[char2]) &&
                            p1_team_has_char(characters[char3]) &&
                            default_settings_level3() &&
                            trigger_when(mukai_ending())
                
                )
}

beat_game_team_progression("Splendid Evil", "Ash", "Duo Lon", "Shen Woo")
beat_game_team_progression("Prolongation", "Terry", "Joe", "Tizoc")
beat_game_team_progression("Kyoku-gen", "Ryo", "Robert", "Yuri")
beat_game_team_progression("Inside Skinny", "Leona", "Ralf", "Clark")
beat_game_team_progression("Hot For You", "King", "Mai", "Blue Mary")
beat_game_team_progression("Seoul Love", "Kim", "Chang", "Jhun")
beat_game_team_progression("Villaionous", "Yamazaki", "Billy", "Gato")
beat_game_team_progression("Joyrider", "Benimaru", "Daimon", "Shingo")
beat_game_team_progression("You Feel for Me", "Athena", "Hinako", "Malin")
beat_game_team_progression("KD", "K'", "Maxima", "Whip")
beat_game_team("Cool Jam 2", "Kyo", "Iori", "Chizuru")
beat_game_team("Blaze", "Kyo", "Benimaru", "Daimon")
beat_game_team("Hot For You II", "King", "Mai", "Yuri")
beat_game_team("ESAKA? 03", "Chizuru", "Maki", "Kusanagi")
beat_game_team("The Final Door", "Mukai", "Adel", "Kusanagi")

achievement("Unbounded", "Beat the game on Single Play (default settings).", 10,
                trigger =   game_mode() == MODE_SINGLE_ARCADE &&
                            p1_only() &&
                            default_settings_level3() &&
                            (mukai_ending() || adel_ending())
            )

achievement("MvC Style", "Beat the game on Arcade Play (default settings).", 10,
                trigger =   game_mode() == MODE_TEAM_ARCADE &&
                            p1_only() &&
                            default_settings_level3() &&
                            (
                                adel_ending() || mukai_ending()
                            )
            )

achievement("KOF Style", "Beat the game on Team Play (default settings).", 10,
                trigger =   game_mode() == MODE_TEAM_PLAY &&
                            p1_only() &&
                            default_settings_level3() &&
                            (
                                adel_ending() || mukai_ending()
                            )
            )

achievement("Great Man", "Reach 36000 score on Arcade Play (default settings).", 10,
            trigger = game_mode() == MODE_TEAM_ARCADE &&
                      p1_only() &&
                      default_settings_level3() &&
                      arcade_score() >= 0x36000 &&
                      prev(arcade_score()) < 0x36000
            )

achievement("Those From the Past", "Beat the game by defeating Mukai without using a continue (default settings).", 25,
                trigger =   is_any_arcade() &&
                            p1_only() &&
                            once(game_arcade_match() == 0 && game_bgm() == BGM_CHAR_SELECT && p1_active_state() > 0) &&
                            never(p1_active_state() == 2) &&
                            default_settings_level3() &&
                            trigger_when(mukai_ending())
            )


// =========================================
//                Single Play              
// =========================================

function single_play(char, title) {
    achievement(title, format("Beat the game on Single Play Mode using only {0} (default settings).", char), 10,
                trigger =   never(game_mode() != MODE_SINGLE_ARCADE) &&
                            p1_only() &&
                            once(game_arcade_match() == 0 && p1_character_slot_1() == characters[char] && game_bgm() == BGM_CHAR_SELECT) &&
                            never(p1_character_slot_1() != characters[char] && game_bgm() != BGM_CHAR_SELECT) &&
                            default_settings_level3() &&
                            (mukai_ending() || adel_ending())
            )
}

// single_play("Ash", "Ash Crimson")
// single_play("Duo Lon", "Duo Lon")
// single_play("Shen Woo", "Shen Woo")
// single_play("Terry", "Terry Bogard")
// single_play("Joe", "Joe Higashi")
// single_play("Tizoc", "The Griffon")
// single_play("Ryo", "Ryo Sakazaki")
// single_play("Robert", "Robert Garcia")
// single_play("Yuri", "Yuri Sakazaki")
// single_play("Kim", "Kim Kaphwan")
// single_play("Chang", "Chang Koehan")
// single_play("Jhun", "Jhun Hoon")
// single_play("Leona", "Leona Heidern")
// single_play("Ralf", "Ralf Jones")
// single_play("Clark", "Clark Still")
// single_play("Gato", "Gato")
// single_play("Billy", "Billy Kane")
// single_play("Yamazaki", "Ryuji Yamazaki")
// single_play("King", "King")
// single_play("Mai", "Mai Shiranui")
// single_play("Blue Mary", "Blue Mary")
// single_play("Benimaru", "Benimaru Nikaido")
// single_play("Shingo", "Shingo Yabuki")
// single_play("Daimon", "Goro Daimon")
// single_play("Athena", "Athena Asamiya")
// single_play("Hinako", "Hinako Shijo")
// single_play("Malin", "Malin")
// single_play("K'", "K Dash")
// single_play("Maxima", "Maxima")
// single_play("Whip", "Seirah")
// single_play("Kyo", "Kyo Kusanagi")
// single_play("Iori", "Iori Yagami")
// single_play("Chizuru", "Chizuru Kagura")
// single_play("Kusanagi", "Kusanagi")
// single_play("Adel", "Adel Bernstein")
// single_play("Mukai", "Mukai")
// single_play("Maki", "Maki Kagura")

// =========================================
//            Combo Achievements             
// =========================================

function combo_dm(char, title) {
    achievement(title, format("{0}: Combo any attack into any Desperation Move.", char), 4,
                trigger =   p1_only() &&
                            tally(1, once(p1_normal_attack() && p1_hit_combo() > prev(p1_hit_combo())), once(p1_special() == 1 && p1_shift() == 0 && p1_leader_dm() == 0 && p1_hit_combo() > prev(p1_hit_combo()))) &&
                            never(p1_hit_combo() == 0) &&
                            never(p1_current_character_slot() != prev(p1_current_character_slot())) &&
                            ((p1_shift() == 1 && p1_special() == 1) || p1_leader_dm() == 1) && // is DM
                            __ornext(p1_target_damaged() > prev(p1_target_damaged()) || p1_target_grabbed() > prev(p1_target_grabbed()) || p1_hit_combo() > prev(p1_hit_combo())) &&
                            (
                                (p1_current_character_slot() == 0 && p1_order_select_slot_1() == characters[char]) ||
                                (p1_current_character_slot() == 1 && p1_order_select_slot_2() == characters[char]) ||
                                (p1_current_character_slot() == 2 && p1_order_select_slot_3() == characters[char])
                            )
                
                )
}

function combo_command_grab(char, title) {
    achievement(title, format("{0}: Combo any attack into any Command Throw.", char), 3,
                trigger =   p1_only() &&
                            once(p1_normal_attack() && p1_hit_combo() > prev(p1_hit_combo())) && // don't count normal specials
                            never(p1_hit_combo() == 0) &&
                            never(p1_current_character_slot() != prev(p1_current_character_slot())) &&
                            p1_special() == 1 && // is Special Moves
                            p1_target_grabbed() > prev(p1_target_grabbed()) &&
                            (
                                (p1_current_character_slot() == 0 && p1_order_select_slot_1() == characters[char]) ||
                                (p1_current_character_slot() == 1 && p1_order_select_slot_2() == characters[char]) ||
                                (p1_current_character_slot() == 2 && p1_order_select_slot_3() == characters[char])
                            )
                
                )
}


combo_dm("Ash", "Thermidor")
combo_dm("Duo Lon", "Hiden Genmu Juonshikon")
combo_dm("Shen Woo", "Tatsu! Gekiken")
combo_dm("Terry", "Power Geyser")
combo_dm("Joe", "Screw Upper")
combo_dm("Tizoc", "Daedalus Attack")
combo_dm("Ryo", "Haoh Shoukouken")
combo_dm("Robert", "Ryukou Ranbuu")
combo_dm("Yuri", "Shin! Chou Upper")
combo_dm("Kim", "Phoenix Kick")
combo_dm("Chang", "Wild Ball")
combo_dm("Jhun", "Phoenix Talon Tear")
combo_dm("Leona", "V Slasher")
combo_dm("Ralf", "Super Vulcan Punch")
combo_command_grab("Clark", "Super Argentine Backbreaker")
combo_dm("Gato", "Rei Kiba")
combo_dm("Billy", "Chou Kaen Senpuukon")
combo_dm("Yamazaki", "Guillotine")
combo_dm("King", "Illusion Dance")
combo_dm("Mai", "Chou Hissatsu Shinobi Bachi")
combo_dm("Blue Mary", "M • Typhoon")
combo_dm("Benimaru", "Gen'ei Hurricane")
combo_dm("Shingo", "Burning Shingo")
combo_command_grab("Daimon", "Stump Throw")
combo_dm("Athena", "Phoenix Fang Arrow")
combo_dm("Hinako", "Dai Ichiban")
combo_dm("Malin", "Kagerou")
combo_dm("K'", "Heat Drive")
combo_command_grab("Maxima", "Maxima Revenger")
combo_dm("Whip", "Sonic Slaughter \"Code:DP\"")
combo_dm("Kyo", "182 Shiki")
combo_dm("Iori", "Kin 1211 Shiki • Ya Otome")
combo_dm("Chizuru", "Rimen 85 Katsu • Reigi no Ishizue")
combo_dm("Kusanagi", "Ura 108 Shiki • Orochi Nagi")
combo_dm("Adel", "Grosse Kreis Kick")
combo_dm("Mukai", "Impact of Steel")
combo_dm("Maki", "Rimen 1 Katsu • Sanrai no Fuujin")

// =========================================
//                    Misc              
// =========================================

achievement("Desperation Finish", "Finish a match with a Leader Super Desperation Move.", 5,
                trigger =   is_any_arcade() &&
                            p1_only() &&
                            p1_leader_dm() == 1 && game_bgm() == BGM_FIGHT_ENDED && prev(game_bgm()) != BGM_FIGHT_ENDED
                
            )

achievement("Revolutionary Etude ~R2", "Unlock Adelheid Bernstein.", 5,
            trigger = game_bgm() == 0x4c && // game over
                      unlockable_adel() == 1 && prev(unlockable_adel()) == 0
            )

achievement("Styx", "Unlock Mukai.", 5,
            trigger = game_bgm() == 0x4c && // game over
                      unlockable_mukai() == 1 && prev(unlockable_mukai()) == 0
            )

achievement("Lone Wolf", "Defeat 37 opponents in Single Survival Mode (default settings).", 25,
            trigger =   game_mode() == MODE_SINGLE_SURVIVAL &&
                        survival_wins_bcd() == 0x37 &&
                        prev(survival_wins_bcd()) == 0x36 &&
                        default_settings_level3()
            
            )

achievement("My Team Is All I Need!", "Defeat 14 teams in Team Survival Mode (default settings).", 25,
            trigger =   game_mode() == MODE_TEAM_SURVIVAL &&
                        survival_wins_bcd() == 0x14 &&
                        prev(survival_wins_bcd()) == 0x13 &&
                        default_settings_level3()
            
            )

achievement("The Great Unveiling", "Unlock all character individual arts.", 5,
            trigger =   p1_only() &&
                        measured(all_char_pictures() == 37) &&
                        prev(all_char_pictures()) == 36
            )

achievement("The Whole Story", "Unlock all team endings.", 5,
            trigger =   p1_only() &&
                        measured(all_team_pictures() == 11) &&
                        prev(all_team_pictures()) == 10
            )

// =========================================
//               Leaderboards              
// =========================================

leaderboard("KOF 2003 - Team Play Best Score", "Best score on Team Play (default settings).",
           start = game_mode() == MODE_TEAM_ARCADE && p1_only() && default_settings_level3() && 
                   (
                        mukai_ending() ||
                        adel_ending() 
                   ),
           cancel = p2_active_state() > 0,
           submit =  game_mode() == MODE_TEAM_ARCADE && p1_only() && default_settings_level3() && 
                     (
                        mukai_ending() ||
                        adel_ending() 
                     ),
           value = bcd(arcade_score()) * 1,
           format = "SCORE", lower_is_better=false
           )
leaderboard("KOF 2003 - Single Play Best Score", "Best score on Single Play (default settings).",
           start = game_mode() == MODE_SINGLE_ARCADE && p1_only() && default_settings_level3() && 
                   (
                        mukai_ending() ||
                        adel_ending() 
                   ),
           cancel = p2_active_state() > 0,
           submit =  game_mode() == MODE_SINGLE_ARCADE && p1_only() && default_settings_level3() && 
                     (
                        mukai_ending() ||
                        adel_ending() 
                     ),
           value = bcd(arcade_score()) * 1,
           format = "SCORE", lower_is_better=false
           )

leaderboard("KOF 2003 - Survival Single Play", "Highest wins on Survival Single Play.",
           start = game_mode() == MODE_SINGLE_SURVIVAL && game_bgm() == 0x4c && prev(game_bgm()) != 0x4c,
           cancel = game_mode() != MODE_SINGLE_SURVIVAL,
           submit = game_mode() == MODE_SINGLE_SURVIVAL && game_bgm() == 0x4c && prev(game_bgm()) != 0x4c,
           value = bcd(survival_wins_bcd()),
           format = "VALUE", lower_is_better=false
           )

leaderboard("KOF 2003 - Survival Team Play", "Highest wins on Survival Team Play.",
           start = game_mode() == MODE_TEAM_SURVIVAL && game_bgm() == 0x4c && prev(game_bgm()) != 0x4c,
           cancel = game_mode() != MODE_TEAM_SURVIVAL,
           submit = game_mode() == MODE_TEAM_SURVIVAL && game_bgm() == 0x4c && prev(game_bgm()) != 0x4c,
           value = bcd(survival_wins_bcd()),
           format = "VALUE", lower_is_better=false
           )