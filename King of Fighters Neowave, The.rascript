// King of Fighters Neowave, The
// #ID = 17684

// $39D3A4: P1 - Mode
//          
//          0x00 = Super Cancel
//          0x01 = Guard Break
//          0x02 = Max2
function p1_mode() => byte(0x39D3A4)

// $3A7DE6: P1 - Moves [2, Main]
//          
//          0x2b = Critical Wire/Just Defence
//          0x76 = Blowback
function p1_move() => byte(0x3A7DE6)

// $3A7DEC: P1 - Moves [3]

// $3A7E62: P1 - Last Move
function p1_last_move() => byte(0x3A7E62)

// $3A7EAC: P1 - HP [16 bits]
//          
//          0x66 = Full HP
//          Negative Value = Defeated
function p1_hp() => word(0x3A7EAC)

// $3A80B4: P2 - HP [16 bits]
//          
//          0x66 = Full HP
//          Negative Value = Defeated
function p2_hp() => word(0x3A80B4)

// $3A812C: P1 - Combo [BCD]
function p1_combo_bcd() => byte(0x3A812C)

// $3AA446: Round - State Bitflag
//          
//          Bit0 = KO
//          Bit1 = Fighting
//          
//          0x18 = Round Announcing
//          0x19 = K.O
//          0x1a = Fighting
//          0x1c = Round Announcing 2
//          0x1d = K.O 2
//          0x1e = Fighting 2
function ko_flag() => bit0(0x3AA446)
function fighting_flag() => bit1(0x3AA446)

// $3AA468: Match - Current Round
//          
//          0x03 can be used to check if player finished without losing any partner.
function current_round() => byte(0x3AA468)

// $3AA469: Game - Players Active [1, Main]
//          
//          Bit0 = P1
//          Bit1 = P2
function game_players_active() => byte(0x3AA469)

// $3AA49C: Round - Time
function round_time() => byte(0x3AA49C)

// $3AA4B7: P1 - Partner
//          
//          0x00 = First
//          0x02 = Last
//          0x03 = Lost Match
function p1_partner() => byte(0x3AA4B7)

// $3AA4C4: P1 - Rounds Wins
function p1_rounds_wins() => byte(0x3AA4C4)

// $3AA4C5: P1 - Rounds Loses
function p1_rounds_loses() => byte(0x3AA4C5)

// $3AA4D4: P1 - Character 1
function p1_char1() => byte(0x3AA4D4)

// $3AA4D5: P1 - Character 2
function p1_char2() => byte(0x3AA4D5)

// $3AA4D6: P1 - Character 3
function p1_char3() => byte(0x3AA4D6)

// $3AA4E7: P2 - Partner
//          
//          0x00 = First
//          0x02 = Last
//          0x03 = Lost Match
function p2_partner() => byte(0x3AA4E7)

// $3AA4F4: P2 - Rounds Wins
function p2_rounds_wins() => byte(0x3AA4F4)

// $3AA4F5: P2 - Rounds Loses
function p2_rounds_loses() => byte(0x3AA4F5)

// $3AA504: P2 - Character 1
function p2_char1() => byte(0x3AA504)

// $3AA505: P2 - Character 2
function p2_char2() => byte(0x3AA505)

// $3AA506: P2 - Character 3
function p2_char3() => byte(0x3AA506)

function p1_active_char() => byte(0x3a7de4)

// $3AE379: Round - HDSM Background Flag
//          
//          0x81 = P1 HDSM
//          0x82 = P2 HDSM
function hsdm_bg_flag() => byte(0x3AE379)

// $3AE384: Game - Continue Service
//          
//          0x00 = No Services
//          0x01 = Difficulty Level Down
//          0x02 = CPU Energy at 1/3
//          0x04 = Power Gauge
function game_continue_service() => byte(0x3AE384)

// $3AE490: Game - Ladder Match [3, Best Address]
function game_ladder_match() => byte(0x3AE490)

// $3B2650: P1 - State
//          
//          0x00 = Inactive
//          0x01 = Active
//          0x02 = Continue
//          0x03 = Game Over
function p1_state() => byte(0x3B2650)

// $3B2651: P2 - State
//          
//          0x00 = Inactive
//          0x01 = Active
//          0x02 = Continue
//          0x03 = Game Over
function p2_state() => byte(0x3B2651)

// $DCF620: Settings - Difficulty (Dipswitch)
//          
//          Range: 0x00 - 0x08
//          
//          0x03 = Level 4 (Default)
function settings_difficulty() => byte(0xDCF620)

// $DCF621: Settings - Time
//          
//          0x01 = 50 (Default)
function settings_time() => byte(0xDCF621)

// $DF0688: P1 - Inputs
//          
//          Bit3 = Start
function p1_inputs() => byte(0xDF0688)

chars = {
   "Kyo": 0,
   "Benimaru": 1,
   "Goro": 2,
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
   "Iori": 21,
   "Mature": 22,
   "Vice": 23,
   "Yamazaki": 24,
   "Blue Mary": 25,
   "Billy Kane": 26,
   "Yashiro": 27,
   "Shermie": 28,
   "Chris": 29,
   "K'": 30,
   "Maxima": 31,
   "Whip": 32,
   "Vanessa": 33,
   "Ramon": 35,
   "Kula": 36,
   "Orochi Yashiro": 41,
   "Orochi Shermie": 42,
   "Orochi Chris": 43,
   "Shingo": 46,
   "King": 47,
   "Jhun Hoon": 48,
   "Saisyu": 49,
   "Geese": 50,
}

function beat_game_team(char1, char2, char3, team_title) {
    achievement(title = team_title,
                description = format("Beat the game with {0}, {1} and {2} (Level-4 difficulty, Time 50).", char1, char2, char3), 
                points = 10, 
                trigger =   game_players_active() == 0x01 &&
                            settings_difficulty() >= 0x03 &&
                            settings_time() == 0x01 &&
                            trigger_when(ko_flag() == 0x01 &&
                            p1_rounds_wins() == 0x01 &&
                            p1_rounds_wins() > prev(p1_rounds_wins()) &&
                            game_ladder_match() == 0x05) &&
                            once(game_ladder_match() == 0x00 && fighting_flag() == 0x01) &&
                            
                            never(fighting_flag() == 0x01 &&
                                  p1_char1() != chars[char1] &&
                                  p1_char1() != chars[char2] &&
                                  p1_char1() != chars[char3]) &&
                                  
                            never(fighting_flag() == 0x01 &&
                                  p1_char2() != chars[char1] &&
                                  p1_char2() != chars[char2] &&
                                  p1_char2() != chars[char3]) &&
                                  
                            never(fighting_flag() == 0x01 &&
                                  p1_char3() != chars[char1] &&
                                  p1_char3() != chars[char2] &&
                                  p1_char3() != chars[char3])
               )
}

beat_game_team("Kyo", "Benimaru", "Goro", "Japan Team")
beat_game_team("Yashiro", "Shermie", "Chris", "KOF '98 Team")
beat_game_team("Yamazaki", "Blue Mary", "Billy Kane", "KOF '97 Team")
beat_game_team("Saisyu", "Kula", "Shingo", "Dream Team")
beat_game_team("K'", "Maxima", "Whip", "KOF '99 Team")
beat_game_team("Terry", "Andy", "Joe", "Fatal Fury Team")
beat_game_team("Ryo", "Robert", "Takuma", "Art of Fighting Team")
beat_game_team("Jhun Hoon", "Choi", "Chang", "Korea Team")
beat_game_team("Iori", "Mature", "Vice", "KOF '96 Team")
beat_game_team("Athena", "Kensou", "Chin", "Psycho Soldier Team")
beat_game_team("Leona", "Ralf", "Clark", "Ikari Warriors Team")
beat_game_team("Mai", "Yuri", "King", "Women Fighters Team")
beat_game_team("Orochi Yashiro", "Orochi Shermie", "Orochi Chris", "Orochi Team")
beat_game_team("Ramon", "Vanessa", "Kim", "Hidden Team")
beat_game_team("Geese", "Yamazaki", "Billy Kane", "Southtown Team")


function hit_hsdm(char, cheevo_title) {
    achievement(title = cheevo_title,
                description = format("{0}: Hit your opponent with a Hidden Super Desperation Move during Arcade mode.", char),
                points = 4,
                trigger =   game_players_active() == 0x01 &&
                            p1_active_char() == chars[char] &&
                            hsdm_bg_flag() == 0x81 &&
                            p1_combo_bcd() > prev(p1_combo_bcd())             
    )
}

hit_hsdm("Kyo", "524 Shiki: Kamukura")
// hit_hsdm("Benimaru", "Raijin Ten")
hit_hsdm("Goro", "Furinkazan")
hit_hsdm("Terry", "Rising Heat")
hit_hsdm("Andy", "Zan'ei Shitou Reppa Dan")
hit_hsdm("Joe", "Cross Gigantes")
hit_hsdm("Kim", "Zero Kyori Hou'ou Kyaku")
hit_hsdm("Chang", "Tekkyuu Dai Sekai")
hit_hsdm("Choi", "Shakushi")
// hit_hsdm("Athena", "Psycho Medley")
hit_hsdm("Kensou", "Seigan Rairyu")
hit_hsdm("Chin", "Suisou Enbu")
// hit_hsdm("Leona", "Revolver Spark")
// hit_hsdm("Ralf", "Umanori Galactica Phantom")
// hit_hsdm("Clark", "Running Pirates")
hit_hsdm("Ryo", "Tenchi Haou Ken")
hit_hsdm("Robert", "Zetsu!! Ryuko Ranbu")
// hit_hsdm("Takuma", "Kosatsu Jin")
hit_hsdm("Mai", "Shiranui-ryuu: Kubi no Kitsune")
hit_hsdm("Yuri", "\"Ee!\" Hien Hou'ou Kyaku")
// hit_hsdm("Iori", "Ura 1219 Shiki: En'ou")
hit_hsdm("Mature", "ECSTASY 816")
hit_hsdm("Vice", "Overkill")
hit_hsdm("Yamazaki", "...!!")
// hit_hsdm("Blue Mary", "M. Typhoon")
hit_hsdm("Billy Kane", "Liar Elemental")
// hit_hsdm("Yashiro", "\"ERROR...\"code**2002**")
// hit_hsdm("Shermie", "Thunder Leg Lariat")
// hit_hsdm("Chris", "Orochi Chris")
hit_hsdm("K'", "Crimson Star Road")
hit_hsdm("Maxima", "Arc Enemy")
hit_hsdm("Whip", "Super Black Hawk")
hit_hsdm("Vanessa", "Gaia Gear")
hit_hsdm("Ramon", "Hypnotic Tiger")
hit_hsdm("Kula", "Freeze Completion")
// hit_hsdm("Orochi Yashiro", "Armageddon")
// hit_hsdm("Orochi Shermie", "Unmei no Ya")
// hit_hsdm("Orochi Chris", "Sanagi wo yaburi, chou wa mau")
hit_hsdm("Shingo", "Shingo Kinsei Ore \"Mushiki\"")
hit_hsdm("King", "Surprise Rose")
hit_hsdm("Jhun Hoon", "Saishu Haiki Geki")
hit_hsdm("Saisyu", "<Chou Yami Barai>")

achievement(title = "Super Cancel",
            description = "Beat the game using only Super Cancel mode (Level-4 difficulty, Time 50).", 
            points = 10, 
            trigger =   game_players_active() == 0x01 &&
                        settings_difficulty() >= 0x03 &&
                        settings_time() == 0x01 &&
                        trigger_when(ko_flag() == 0x01 &&
                        p1_rounds_wins() == 0x01 &&
                        game_ladder_match() == 0x05) &&
                        once(game_ladder_match() == 0x00 && fighting_flag() == 0x01) &&
                        never(p1_mode() != 0x00 && fighting_flag() == 0x01)
)

achievement(title = "Guard Break",
            description = "Beat the game using only Guard Break mode (Level-4 difficulty, Time 50).", 
            points = 10, 
            trigger =   game_players_active() == 0x01 &&
                        settings_difficulty() >= 0x03 &&
                        settings_time() == 0x01 &&
                        trigger_when(ko_flag() == 0x01 &&
                        p1_rounds_wins() == 0x01 &&
                        game_ladder_match() == 0x05) &&
                        once(game_ladder_match() == 0x00 && fighting_flag() == 0x01) &&
                        never(p1_mode() != 0x01 && fighting_flag() == 0x01)
)

achievement(title = "Max 2",
            description = "Beat the game using only Max 2 mode (Level-4 difficulty, Time 50).", 
            points = 10, 
            trigger =   game_players_active() == 0x01 &&
                        settings_difficulty() >= 0x03 &&
                        settings_time() == 0x01 &&
                        trigger_when(ko_flag() == 0x01 &&
                        p1_rounds_wins() == 0x01 &&
                        game_ladder_match() == 0x05) &&
                        once(game_ladder_match() == 0x00 && fighting_flag() == 0x01) &&
                        never(p1_mode() != 0x02 && fighting_flag() == 0x01)
)

achievement(title = "Cool Killers",
            description = "Beat the game on the hardest difficulty (Level-9 difficulty, Time 50).", 
            points = 25, 
            trigger =   game_players_active() == 0x01 &&
                        settings_difficulty() == 0x08 &&
                        settings_time() == 0x01 &&
                        trigger_when(ko_flag() == 0x01 &&
                        p1_rounds_wins() == 0x01 &&
                        game_ladder_match() == 0x05)
)

achievement(title = "Sun God",
            description = "Beat the game without using a continue (Level-4 difficulty, Time 50).", 
            points = 25, 
            trigger =   game_players_active() == 0x01 &&
                        settings_difficulty() >= 0x03 &&
                        settings_time() == 0x01 &&
                        trigger_when(ko_flag() == 0x01 &&
                        p1_rounds_wins() == 0x01 &&
                        game_ladder_match() == 0x05) &&
                        once(game_ladder_match() == 0x00) &&
                        never(p1_partner() == 0x03)
)






