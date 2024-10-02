// King of Fighters 2002, The: Challenge to Ultimate Battle
// #ID = 24058

// Settings
function settings_difficulty() => byte(0x912378)
function settings_power_gauge_1p() => dword(0x912358)
function settings_power_gauge_2p() => dword(0x912350)
function settings_single_point() => dword(0x912338)
function settings_play_time() => dword(0x912370)

function default_settings() {
    return (
        settings_difficulty() >= 2 &&
        settings_power_gauge_1p() == 0 &&
        settings_power_gauge_2p() == 0 &&
        settings_single_point() == 1 &&
        settings_play_time() == 0x02
    )
}

function default_settings_lv8() {
    return (
        settings_difficulty() == 7 &&
        settings_power_gauge_1p() == 0 &&
        settings_power_gauge_2p() == 0 &&
        settings_single_point() == 1 &&
        settings_play_time() == 0x02
    )
}

// Game
function game_context() => byte(0x915DD8)
function game_state() => byte(0x921ED2)
         GS_CHAR_SELECT = 0x12
         GS_CHAR_SELECT_2 = 0x13
         GS_FIGHTING = 0x1b

function game_mode() => byte(0x915CD0)
         MODE_SINGLE_PLAY = 0x00
         MODE_TEAM_PLAY = 0x01
         MODE_SINGLE_VS = 0x02
         MODE_TEAM_VS = 0x03
         MODE_PRACTICE = 0x06
         MODE_TEAM_ATTACK = 0x07
         MODE_SINGLE_ATTACK = 0x08
         MODE_CHALLENGE = 0x0a

function game_players_active() => byte(0x915D80)

function game_continue_service() => byte(0x9126B0)
function game_hsdm_background_flag() => byte(0x9126C8)

function challenge_mode_remaining_fighters_counter() => dword(0x9130E0)
function challenge_mode_timer() => dword(0x913140)

function challenge_mode_challenges_unlocked() => byte(0x9245F0)
function challenge_mode_challenges_finished() => byte(0x9245F6)
function challenge_mode_current_challenge() => dword(0x924650)

function arcade_team_defeated() => bitcount(0x915DD0)

function match_timer() => byte(0x915D28)

// P1
function p1_character_1() => byte(0x915CA4)
function p1_character_2() => byte(0x915CA5)
function p1_character_3() => byte(0x915CA6)

function p1_character_1_is_random() => bit7(0x915CC0)
function p1_character_2_is_random() => bit7(0x915CC1)
function p1_character_3_is_random() => bit7(0x915CC2)

function p1_orochi_flags_slot_1() => bit0(0x915CA2)
function p1_orochi_flags_slot_2() => bit1(0x915CA2)
function p1_orochi_flags_slot_3() => bit2(0x915CA2)

function p1_character_1_color() => byte(0x915CA8)
function p1_character_2_color() => byte(0x915CA9)
function p1_character_3_color() => byte(0x915CAA)

function p1_current_character() => byte(0x921B20)
function p1_rounds_won() => byte(0x915C73)
function p1_hp() => word(0x921BE8)
function p1_gauge() => byte(0x921B99)
function p1_gauge_level() => byte(0x921C93)
function p1_hit_combo() => byte(0x921E70)
function p1_score() => dword(0x921BAC)

function p1_moves() => word(0x921B22)
function p1_state_hsdm_max2() => bit4(0x921B91)
function p1_desperation_move_bit0() => byte(0x921B93)
function p1_max_dm_bit0() => byte(0x921B95)
function p1_last_damage_dealt() => word(0x921E98)

// P2
function p2_character_1() => byte(0x915C74)
function p2_character_2() => byte(0x915C75)
function p2_character_3() => byte(0x915C76)

function p2_moves() => word(0x921D32)
function p2_rounds_won() => byte(0x915CA3)
function p2_state_in_hit_stun() => bit2(0x921DA3)
function p2_hp() => word(0x921DF8)
function p2_practice_regen_timer() => byte(0x921EAF)

chars = {
   "Kyo": 0,
   "Benimaru": 1,
   "Daimon": 2,
   "Terry": 3,
   "Andy": 4,
   "Joe": 5,
   "Kim": 6,
   "Chang": 7,
   "Choi": 8,
   "Athena": 9,
   "Kensou": 10,
   "Chin": 11,
   "Leona": 12,
   "Ralf": 13,
   "Clark": 14,
   "Ryo": 15,
   "Robert": 16,
   "Takuma": 17,
   "Mai": 18,
   "Yuri": 19,
   "May Lee": 20,
   "Iori": 21,
   "Mature": 22,
   "Vice": 23,
   "Yamazaki": 24,
   "Blue Mary": 25,
   "Billy": 26,
   "Yashiro": 27,
   "Shermie": 28,
   "Chris": 29,
   "K'": 30,
   "Maxima": 31,
   "Whip": 32,
   "Vanessa": 33,
   "Seth": 34,
   "Ramon": 35,
   "Kula": 36,
   "K9999": 37,
   "Angel": 38,
   "Rugal": 39,
   "Kusanagi": 40,
   "Shingo": 46,
   "King": 47,
   "Orochi Iori": 48,
   "Geese": 49,
   "Goenitz": 50
}

// =========================================
//                  Utility              
// =========================================

function p1_only() => game_players_active() == 1
function in_char_select() => game_state() == GS_CHAR_SELECT_2
function is_fighting() => game_state() == GS_FIGHTING
function reset_main_menu() => never(game_state() == 0x1c)

function game_beaten_team_play() {
    return(
        arcade_team_defeated() == 7 &&
        p1_rounds_won() == 1 &&
        prev(p1_rounds_won()) == 0
    )
}

function game_beaten_single_play() { 
    return(
        arcade_team_defeated() == 7 &&
        p1_rounds_won() == 2 &&
        prev(p1_rounds_won()) == 1 // I guess just change to 2 rounds
    )
}

function no_continue_services() => never(game_continue_service() > 0)

function p1_team_has_char(char_id) => p1_character_1() == char_id || p1_character_2() == char_id || p1_character_3() == char_id
function p1_dont_have_char(char_id) => p1_character_1() != char_id && p1_character_2() != char_id && p1_character_3() != char_id

// =========================================
//                Arcade Mode               
// =========================================


function achiev_beat_game_team(title, char1, char2, char3) {
    achievement(title, format("Finish Team Play using only {0}, {1} and {2} (default settings).", char1, char2, char3), 10,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(arcade_team_defeated() == 0 && in_char_select()) &&
                          never(p1_dont_have_char(chars[char1]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_dont_have_char(chars[char2]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_dont_have_char(chars[char3]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          p1_team_has_char(chars[char1]) &&
                          p1_team_has_char(chars[char2]) &&
                          p1_team_has_char(chars[char3]) &&
                          never(p1_orochi_flags_slot_1() == 1) &&
                          never(p1_orochi_flags_slot_2() == 1) &&
                          never(p1_orochi_flags_slot_3() == 1) &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings()
                )
}

achiev_beat_game_team("Japan Team", "Kyo", "Benimaru", "Daimon")
achiev_beat_game_team("Fatal Fury Team", "Terry", "Andy", "Joe")
achiev_beat_game_team("Art of Fighting Team", "Ryo", "Robert", "Takuma")
achiev_beat_game_team("Ikari Warriors Team", "Leona", "Ralf", "Clark")
achiev_beat_game_team("Psycho Soldiers Team", "Athena", "Kensou", "Chin")
achiev_beat_game_team("Women Fighters Team", "Mai", "Yuri", "May Lee")
achiev_beat_game_team("Korea Justice Team", "Kim", "Chang", "Choi")
achiev_beat_game_team("KOF '96 Team", "Iori", "Mature", "Vice")
achiev_beat_game_team("KOF '97 Team", "Yamazaki", "Blue Mary", "Billy")
achiev_beat_game_team("KOF '98 Team", "Yashiro", "Shermie", "Chris")
achiev_beat_game_team("KOF 99' Team", "K'", "Maxima", "Whip")
achiev_beat_game_team("KOF 2000 Team", "Vanessa", "Seth", "Ramon")
achiev_beat_game_team("KOF 2001 Team", "Kula", "K9999", "Angel")
achiev_beat_game_team("Extra 2k2 Team", "Kusanagi", "Shingo", "King")
achiev_beat_game_team("PS2 Exclusive Team", "Orochi Iori", "Goenitz", "Geese")

achievement("Orochi Team", "Finish Team Play using only Orochi Yashiro, Orochi Shermie and Orochi Chris (default settings).", 10,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(arcade_team_defeated() == 0 && in_char_select()) &&
                          never(p1_dont_have_char(chars["Yashiro"]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_dont_have_char(chars["Shermie"]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_dont_have_char(chars["Chris"]) && p1_rounds_won() > prev(p1_rounds_won())) &&
                          p1_team_has_char(chars["Yashiro"]) &&
                          p1_team_has_char(chars["Shermie"]) &&
                          p1_team_has_char(chars["Chris"]) &&
                          never(p1_orochi_flags_slot_1() == 0 && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_orochi_flags_slot_2() == 0 && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_orochi_flags_slot_3() == 0 && p1_rounds_won() > prev(p1_rounds_won())) &&
                          p1_orochi_flags_slot_1() == 1 &&
                          p1_orochi_flags_slot_2() == 1 &&
                          p1_orochi_flags_slot_3() == 1 &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings()
                )

achievement("Revival", "Finish Team Play without using a continue (default settings, no boss characters).", 10,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          never(p1_team_has_char(chars["Rugal"])) &&
                          never(p1_team_has_char(chars["Goenitz"])) &&
                          never(p1_team_has_char(chars["Geese"])) &&
                          once(arcade_team_defeated() == 0 && in_char_select()) &&
                          never(p2_rounds_won() == 3) && // correct?
                          trigger_when(game_beaten_team_play()) &&
                          default_settings()
            )

achievement("Last Dance", "Finish Team Play without using continue services on Level-8 difficulty (default settings, no boss characters).", 25,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          never(p1_team_has_char(chars["Rugal"])) &&
                          never(p1_team_has_char(chars["Goenitz"])) &&
                          never(p1_team_has_char(chars["Geese"])) &&
                          once(arcade_team_defeated() == 0 && in_char_select()) &&
                          no_continue_services() &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings_lv8()
            )

achievement("The King of Roulette", "Finish Team Play using only a random select team (default settings).", 25,
                trigger = p1_only() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          reset_main_menu() &&
                          once(arcade_team_defeated() == 0 && in_char_select()) &&
                          never(p1_character_1_is_random() == 0 && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_character_2_is_random() == 0 && p1_rounds_won() > prev(p1_rounds_won())) &&
                          never(p1_character_3_is_random() == 0 && p1_rounds_won() > prev(p1_rounds_won())) &&
                          p1_character_1_is_random() == 1 &&
                          p1_character_2_is_random() == 1 &&
                          p1_character_3_is_random() == 1 &&
                          trigger_when(game_beaten_team_play()) &&
                          default_settings()
                )

achievement("¡PROHIBIDO JUGAR CON RUGAL!", "Finish Single Play without losing a round as Rugal (default settings).", 10,
                trigger = p1_only() &&
                          game_mode() == MODE_SINGLE_PLAY &&
                          reset_main_menu() &&
                          never(p1_character_1() != chars["Rugal"]) &&
                          once(arcade_team_defeated() == 0 && in_char_select()) &&
                          never(p2_rounds_won() > prev(p2_rounds_won())) && // correct?
                          trigger_when(game_beaten_single_play()) &&
                          default_settings()
            )

// =========================================
//              Challenge Mode              
// =========================================

function achiev_challenge(title, char, points) {
    achievement(title, format("Clear Challenge 10 or higher from Time Attack as {0}.", char), points,
                trigger = p1_only() &&
                          game_mode() == MODE_CHALLENGE &&
                          p1_character_1() == chars[char] &&
                          p1_orochi_flags_slot_1() == 0 &&
                          challenge_mode_current_challenge() >= 0x09 &&
                          trigger_when(challenge_mode_remaining_fighters_counter() == 0 && p1_rounds_won() > prev(p1_rounds_won())) 
                          
                )
}

function achiev_challenge_orochiflag(title, char, points) {
    achievement(title, format("Clear Challenge 10 or higher from Time Attack as Orochi {0}.", char), points,
                trigger = p1_only() &&
                          game_mode() == MODE_CHALLENGE &&
                          p1_character_1() == chars[char] &&
                          p1_orochi_flags_slot_1() == 1 &&
                          challenge_mode_current_challenge() >= 0x09 &&
                          trigger_when(challenge_mode_remaining_fighters_counter() == 0 && p1_rounds_won() > prev(p1_rounds_won())) 
                )
}

achiev_challenge("Kyo Kusanagi", "Kyo", 4)
achiev_challenge("Benimaru Nikaido", "Benimaru", 4)
achiev_challenge("Goro Daimon", "Daimon", 4)
achiev_challenge("Terry Bogard", "Terry", 4)
achiev_challenge("Andy Bogard", "Andy", 4)
achiev_challenge("Joe Higashi", "Joe", 4)
achiev_challenge("Kim Kaphwan", "Kim", 4)
achiev_challenge("Chang Koehan", "Chang", 4)
achiev_challenge("Choi Bounge", "Choi", 5)
achiev_challenge("Athena Asamiya", "Athena", 4)
achiev_challenge("Sie Kensou", "Kensou", 4)
achiev_challenge("Chin Gentsai", "Chin", 4)
achiev_challenge("Leona Heidern", "Leona", 4)
achiev_challenge("Ralf Jones", "Ralf", 4)
achiev_challenge("Clark Still", "Clark", 4)
achiev_challenge("Ryo Sakazaki", "Ryo", 4)
achiev_challenge("Robert Garcia", "Robert", 4)
achiev_challenge("Takuma Sakazaki", "Takuma", 4)
achiev_challenge("Mai Shiranui", "Mai", 4)
achiev_challenge("Yuri Sakazaki", "Yuri", 4)
achiev_challenge("May Lee Jinju", "May Lee", 5)
achiev_challenge("Iori Yagami", "Iori", 4)
achiev_challenge("Mature", "Mature", 4)
achiev_challenge("Vice", "Vice", 4)
achiev_challenge("Ryuji Yamazaki", "Yamazaki", 4)
achiev_challenge("Blue Mary", "Blue Mary", 4)
achiev_challenge("Billy Kane", "Billy", 4)
achiev_challenge("Yashiro Nanakase", "Yashiro", 4)
achiev_challenge("Shermie", "Shermie", 5)
achiev_challenge("Chris", "Chris", 4)
achiev_challenge_orochiflag("Orochi Yashiro", "Yashiro", 4)
achiev_challenge_orochiflag("Orochi Shermie", "Shermie", 4)
achiev_challenge_orochiflag("Orochi Chris", "Chris", 4)
achiev_challenge("K Dash", "K'", 4)
achiev_challenge("Maxima", "Maxima", 4)
achiev_challenge("Whip", "Whip", 4)
achiev_challenge("Vanessa", "Vanessa", 4)
achiev_challenge("Seth", "Seth", 4)
achiev_challenge("Rámon", "Ramon", 4)
achiev_challenge("Kula Diamond", "Kula", 4)
achiev_challenge("K9999", "K9999", 4)
achiev_challenge("Angel", "Angel", 5)
achiev_challenge("Omega Rugal", "Rugal", 4)
achiev_challenge("KUSANAGI", "Kusanagi", 4)
achiev_challenge("Shingo Yabuki", "Shingo", 4)
achiev_challenge("King ", "King", 4)
achiev_challenge("Orochi Iori", "Orochi Iori", 4)
achiev_challenge("Geese Howard", "Geese", 4)
achiev_challenge("Goenitz", "Goenitz", 4)

