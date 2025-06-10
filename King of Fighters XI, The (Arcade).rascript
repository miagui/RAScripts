// King of Fighters XI, The
// #ID = 17685

function settings_difficulty() => byte(0x369E11)
function settings_difficulty_level4() => settings_difficulty() >= 3
function settings_difficulty_level8() => settings_difficulty() == 7

function game_current_state() => word(0x27CB64)
function game_previous_state() => word(0x27CB66)
         GS_GAME_INTRO = 0x0100
         GS_TITLE_SCREEN = 0x0201
         GS_HOW_TO_PLAY = 0x0300
         GS_CHARACTER_SELECT = 0x0301
         GS_ORDER_SELECT = 0x0302
         GS_FIGHTING = 0x0303
         GS_CONTINUE = 0x0304
         GS_CONTINUE_SERVICE = 0x0305
         GS_CUTSCENE = 0x0307
         GS_WINNERS_ANNOUNCEMENT = 0x0308
         GS_HERE_COMES_CHALLENGER = 0x030a

function game_context() => byte(0x27CB65)

function game_arcade_match() => byte(0x27CA9D)
function game_continue_service() => byte(0x27CAA2)

function match_timer() => byte(0x27CB78)

function p1_active_state() => byte(0x27CB68)
function p2_active_state() => byte(0x27CB69)

function p1_score() => dword(0x27cbe8)

function p1_total_hit_combo() => byte(0x27CBAA)
function p1_hit_combo() => byte(0x27CBAB)
function p1_super_cancel() => bit3(0x27CBB0)
function p1_dream_cancel() => bit4(0x27CBB0)
function p1_desperation_move_bg() => bit2(0x27CBB6)
function p1_ko() => bit5(0x27CBB7)

function p1_current_character_pointer() => tbyte(0x27CBF8)
function p1_move() => word(tbyte(p1_current_character_pointer() + 0x10) + 0xf0)

function p1_current_leader() => byte(0x27CBA5)
function p1_character_1st() => byte(0x27CBCC)
function p1_character_2nd() => byte(0x27CBCD)
function p1_character_3rd() => byte(0x27CBCE)

function p1_move_type_hit() => byte(0x27CBCF)
function p1_power_gauge() => word(0x27CBDC)
function p1_skill_gauge() => word(0x27CBE0)

function p1_slot_1_character() => byte(0x27CCA4)
function p1_slot_2_character() => byte(0x27CCC4)
function p1_slot_3_character() => byte(0x27CCE4)
function p1_slot_1_color() => byte(0x27CCA5)
function p1_slot_2_color() => byte(0x27CCC5)
function p1_slot_3_color() => byte(0x27CCE5)
function p1_slot_1_hp() => word(0x27CCA8)
function p1_slot_2_hp() => word(0x27CCC8)
function p1_slot_3_hp() => word(0x27CCE8)
function p1_slot_1_order() => byte(0x27CCB0)
function p1_slot_2_order() => byte(0x27CCD0)
function p1_slot_3_order() => byte(0x27CCF0)
function p1_slot_1_rounds_wins() => byte(0x27CCB8)
function p1_slot_2_rounds_wins() => byte(0x27CCD8)
function p1_slot_3_rounds_wins() => byte(0x27CCF8)

function p2_slot_1_character() => byte(0x27CE9C)
function p2_slot_2_character() => byte(0x27CEBC)
function p2_slot_3_character() => byte(0x27CEDC)
function p2_slot_1_hp() => word(0x27CEA0)
function p2_slot_2_hp() => word(0x27CEC0)
function p2_slot_3_hp() => word(0x27CEE0)

characters = {
   "Ash": 0,
   "Oswald": 1,
   "Shen": 2,
   "Elisabeth": 3,
   "Duo Lon": 4,
   "Benimaru": 5,
   "Terry": 6,
   "Kim": 7,
   "Duck King": 8,
   "Ryo": 9,
   "Yuri": 10,
   "King": 11,
   "B. Jenet": 12,
   "Gato": 13,
   "Griffon": 14,
   "Ralf": 15,
   "Clark": 16,
   "Whip": 17,
   "Athena": 18,
   "Kensou": 19,
   "Momoko": 20,
   "Vanessa": 21,
   "Blue Mary": 22,
   "Ramon": 23,
   "Malin": 24,
   "Kasumi": 25,
   "Eiji": 26,
   "K'": 27,
   "Kula": 28,
   "Maxima": 29,
   "Kyo": 30,
   "Iori": 31,
   "Shingo": 32,
   "Gai": 33,
   "Hayate": 34,
   "Adelheid": 35,
   "Silber": 36,
   "Jazu": 37,
   "Shion": 38,
   "Magaki": 39,
}

// =========================================
//                 Utility              
// =========================================

function p1_only() => p1_active_state() > 0 && p2_active_state() == 0
function in_game() => game_context() == 0x03
function in_char_select() => game_current_state() == GS_CHARACTER_SELECT
function is_fighting() => game_current_state() == GS_FIGHTING
function in_winners() => game_current_state() == GS_WINNERS_ANNOUNCEMENT

function p1_won_match() => p1_ko() > prev(p1_ko()) && __ornext(p1_slot_1_hp() != 0xFFFF || p1_slot_2_hp() != 0xFFFF || p1_slot_3_hp() != 0xFFFF)

function p1_current_char_is(char) {
      return (
            (p1_slot_1_character() == characters[char] && p1_slot_1_order() == 0) ||
            (p1_slot_2_character() == characters[char] && p1_slot_2_order() == 0) ||
            (p1_slot_3_character() == characters[char] && p1_slot_3_order() == 0) 
      )
}

function game_beaten() => game_arcade_match() == 8 && prev(game_arcade_match()) == 7
function p1_team_has_char(char_id) => p1_slot_1_character() == char_id || p1_slot_2_character() == char_id || p1_slot_3_character() == char_id
function p1_dont_have_char(char_id) => p1_slot_1_character() != char_id && p1_slot_2_character() != char_id && p1_slot_3_character() != char_id

// =========================================
//                Arcade Mode               
// =========================================

function achiev_beat_game_team(title, char1, char2, char3) {
    achievement(title, format("Beat the game using only {0}, {1} and {2} (Level-4 difficulty).", char1, char2, char3), 10, type="win_condition",
                trigger = in_game() &&
                          p1_only() &&
                          once(game_arcade_match() == 0 && in_char_select() && p1_active_state() > 0) &&
                          never(p1_dont_have_char(characters[char1]) && p1_won_match()) &&
                          never(p1_dont_have_char(characters[char2]) && p1_won_match()) &&
                          never(p1_dont_have_char(characters[char3]) && p1_won_match()) &&
                          p1_team_has_char(characters[char1]) &&
                          p1_team_has_char(characters[char2]) &&
                          p1_team_has_char(characters[char3]) &&
                          settings_difficulty_level4() &&
                          trigger_when(game_beaten())
                )
}

achiev_beat_game_team("Hero Team", "Ash", "Oswald", "Shen")
achiev_beat_game_team("Rivals Team", "Elisabeth", "Duo Lon", "Benimaru")
achiev_beat_game_team("Fatal Fury Team", "Terry", "Kim", "Duck King")
achiev_beat_game_team("Art of Fighting Team", "Ryo", "King", "Yuri")
achiev_beat_game_team("Ikari Warriors Team", "Ralf", "Clark", "Whip")
achiev_beat_game_team("Psycho Soldier Team", "Athena", "Kensou", "Momoko")
achiev_beat_game_team("Mark of the Wolves Team", "B. Jenet", "Gato", "Griffon")
achiev_beat_game_team("Agents Team", "Vanessa", "Blue Mary", "Ramon")
achiev_beat_game_team("Anti-Kyokugenryu Team", "Eiji", "Kasumi", "Malin")
achiev_beat_game_team("K' Team", "K'", "Kula", "Maxima")
achiev_beat_game_team("Kyo & Iori Team", "Kyo", "Iori", "Shingo")

achiev_beat_game_team("Justice Team", "Athena", "Kim", "Griffon")
achiev_beat_game_team("KOF Heroes Team", "Kyo", "K'", "Ash")
achiev_beat_game_team("KOF 2003 Heroes Team", "Ash", "Duo Lon", "Shen")
achiev_beat_game_team("Girls Team", "Athena", "Kula", "Momoko")
achiev_beat_game_team("Birds Team", "Jazu", "Duck King", "Griffon")
achiev_beat_game_team("Punishment Team", "Elisabeth", "B. Jenet", "Whip")
achiev_beat_game_team("Older Brothers Team", "Ryo", "Adelheid", "Gato")
achiev_beat_game_team("Womens Team", "Vanessa", "Elisabeth", "King")
achiev_beat_game_team("Buriki One Team", "Ryo", "Silber", "Gai")
// achiev_beat_game_team("Currently Reforming Team", "Kim", "", "")

// achiev_beat_game_team("Savage Reign Team", "Sho Hayate", "Jazu", "")

achievement("Savage Reign Team", "Beat the game using only Hayate, Jazu and other (Level-4 difficulty).", 10, type="win_condition",
                trigger = in_game() &&
                          p1_only() &&
                          once(game_arcade_match() == 0 && in_char_select() && p1_active_state() > 0) &&
                          never(p1_dont_have_char(characters["Hayate"]) && p1_won_match()) &&
                          never(p1_dont_have_char(characters["Jazu"]) && p1_won_match()) &&
                          p1_team_has_char(characters["Hayate"]) &&
                          p1_team_has_char(characters["Jazu"]) &&
                          settings_difficulty_level4() &&
                          trigger_when(game_beaten())
                )

achievement("Currently Reforming Team", "Beat the game using only Kim and two other evil characters (Level-4 difficulty).", 10, type="win_condition",
                trigger = in_game() &&
                          p1_only() &&
                          once(game_arcade_match() == 0 && in_char_select() && p1_active_state() > 0) &&
                          never(p1_dont_have_char(characters["Kim"]) && p1_won_match()) &&
                          p1_team_has_char(characters["Kim"]) &&

                          never(p1_slot_1_character() != characters["Kim"] &&
                                p1_slot_1_character() != characters["Ash"] &&
                                p1_slot_1_character() != characters["Iori"] &&
                                // p1_slot_1_character() != characters["Shion"] &&
                                // p1_slot_1_character() != characters["Magaki"] &&
                                p1_slot_1_character() != characters["Silber"] &&
                                p1_slot_1_character() != characters["Jazu"] &&
                                // p1_slot_1_character() != characters["Geese"] &&
                                // p1_slot_1_character() != characters["Mr. Big"] &&
                                is_fighting()
                               ) &&

                          never(p1_slot_2_character() != characters["Kim"] &&
                                p1_slot_2_character() != characters["Ash"] &&
                                p1_slot_2_character() != characters["Iori"] &&
                                // p1_slot_2_character() != characters["Shion"] &&
                                // p1_slot_2_character() != characters["Magaki"] &&
                                p1_slot_2_character() != characters["Silber"] &&
                                p1_slot_2_character() != characters["Jazu"] &&
                                // p1_slot_2_character() != characters["Geese"] &&
                                // p1_slot_2_character() != characters["Mr. Big"] &&
                                is_fighting()
                               ) &&
                               
                          never(p1_slot_3_character() != characters["Kim"] &&
                                p1_slot_3_character() != characters["Ash"] &&
                                p1_slot_3_character() != characters["Iori"] &&
                                // p1_slot_3_character() != characters["Shion"] &&
                                // p1_slot_3_character() != characters["Magaki"] &&
                                p1_slot_3_character() != characters["Silber"] &&
                                p1_slot_3_character() != characters["Jazu"] &&
                                // p1_slot_3_character() != characters["Geese"] &&
                                // p1_slot_3_character() != characters["Mr. Big"] &&
                                is_fighting()
                               ) &&

                          settings_difficulty_level4() &&
                          trigger_when(game_beaten())
                )

achievement("King", "Defeat Adelheid Bernstein during Arcade mode (Level-4 difficulty).", 5,
            trigger =   p1_only() &&
                        in_game() &&
                        p2_slot_1_character() == characters["Adelheid"] &&
                        p1_won_match() &&
                        settings_difficulty_level4()
            )

achievement("In High Gear", "Defeat Gai Tendo during Arcade mode (Level-4 difficulty).", 5,
            trigger =   p1_only() &&
                        in_game() &&
                        p2_slot_1_character() == characters["Gai"] &&
                        p1_won_match() &&
                        settings_difficulty_level4()
            )

achievement("Cha-Cha", "Defeat Sho Hayate during Arcade mode (Level-4 difficulty).", 10,
            trigger =   p1_only() &&
                        in_game() &&
                        p2_slot_1_character() == characters["Hayate"] &&
                        p1_won_match() &&
                        settings_difficulty_level4()
            )

achievement("Jack I", "Defeat Silber during Arcade mode (Level-4 difficulty).", 10,
            trigger =   p1_only() &&
                        in_game() &&
                        p2_slot_1_character() == characters["Silber"] &&
                        p1_won_match() &&
                        settings_difficulty_level4()
            )
            
achievement("Jack II", "Defeat Jazu during Arcade mode (Level-4 difficulty).", 10,
            trigger =   p1_only() &&
                        in_game() &&
                        p2_slot_1_character() == characters["Jazu"] &&
                        p1_won_match() &&
                        settings_difficulty_level4()
            )

achievement("Tales of Ash II", "Beat the game without using a continue (Level-4 difficulty).", 50,
                trigger = in_game() &&
                          p1_only() &&
                          once(game_arcade_match() == 0 && in_char_select() && p1_active_state() > 0) &&
                          never(p1_active_state() == 2) &&
                          settings_difficulty_level4() &&
                          trigger_when(game_beaten())
                )

achievement("Distorted World", "Beat the game on Level-8 difficulty without ever using continue services.", 25,
                trigger = in_game() &&
                          p1_only() &&
                          once(game_arcade_match() == 0 && in_char_select() && p1_active_state() > 0) &&
                          never(game_continue_service() > 0) &&
                          settings_difficulty_level8() &&
                          trigger_when(game_beaten())
                )


// =========================================
//                    Misc              
// =========================================

achievement("Dream Cancel", "Perform a Dream Cancel during Arcade mode.", 5,
            trigger =   p1_only() &&
                        is_fighting() &&
                        p1_dream_cancel() > prev(p1_dream_cancel())
            )
achievement("Super Cancel", "Perform a Super Cancel during Arcade mode.", 4,
            trigger =   p1_only() &&
                        is_fighting() &&
                        p1_super_cancel() > prev(p1_super_cancel())
            )

achievement("L. Finish", "Finish a match with a Leader Desperation Move during Arcade mode (Level-4 difficulty).", 5,
            trigger =   p1_only() &&
                        is_fighting() &&
                        p1_move_type_hit() == 3 &&
                        p1_won_match() &&
                        settings_difficulty_level4()
            )

achievement("Perfect XI", "Win a match with a perfect during Arcade mode (Level-4 difficulty).", 3,
            trigger =   p1_only() &&
                        is_fighting() &&
                        p1_slot_1_hp() == 0x70 &&
                        p1_slot_2_hp() == 0x70 &&
                        p1_slot_3_hp() == 0x70 &&
                        p1_won_match() &&
                        settings_difficulty_level4()
            )


// =========================================
//                 Leader DM              
// =========================================


// need to test grapplers (Griffon)
function achiev_leader_dm(title, char) {
      achievement(title, format("Hit your oppponent with a Leader Desperation Move as {0} during Arcade mode (Level-4 difficulty).", char), 3,
                  trigger =   p1_only() &&
                              is_fighting() &&
                              p1_current_char_is(char) &&
                              p1_move_type_hit() == 3 &&
                              __ornext(p1_won_match() || p1_hit_combo() > prev(p1_hit_combo())) &&
                              settings_difficulty_level4()
                  )
}

achiev_leader_dm("Sans-Culottes", "Ash")
achiev_leader_dm("JOKER", "Oswald")
achiev_leader_dm("Bakuten", "Shen")
achiev_leader_dm("Noble Blanc", "Elisabeth")
achiev_leader_dm("Ougi • Tajuu Genmu Ankei", "Duo Lon")
achiev_leader_dm("Raikouken", "Benimaru")
achiev_leader_dm("Power Stream", "Terry")
achiev_leader_dm("Hiden Hou'oukyaku", "Kim")
achiev_leader_dm("High Bound Spiral", "Duck King")
achiev_leader_dm("Tenchi Haohken", "Ryo")
achiev_leader_dm("Aerial Hien Hou'oukyaku", "Yuri")
achiev_leader_dm("Phantom Strike", "King")
achiev_leader_dm("Ennui Mademoiselle", "B. Jenet")
achiev_leader_dm("Tenryu Retsu Kiba", "Gato")
achiev_leader_dm("Big Fall Griffon", "Griffon")
achiev_leader_dm("Galactica Phantom", "Ralf")
achiev_leader_dm("Ultra Argentine Back Breaker", "Clark")
achiev_leader_dm("Sonic Slaughter (Code:KW)", "Whip")
achiev_leader_dm("Super Phoenix Infinity", "Athena")
achiev_leader_dm("Seigan Rairyu", "Kensou")
achiev_leader_dm("Esper~!", "Momoko")
achiev_leader_dm("MAX Puncher", "Vanessa")
achiev_leader_dm("M • Typhoon", "Blue Mary")
achiev_leader_dm("Tiger Combination", "Ramon")
achiev_leader_dm("Mizuchi", "Malin")
achiev_leader_dm("Shingan Kazura Otoshi", "Kasumi")
achiev_leader_dm("Yamikari", "Eiji")
achiev_leader_dm("Chain Drive", "K'")
achiev_leader_dm("Freeze Execution", "Kula")
achiev_leader_dm("MX-II B Final Cannon", "Maxima")
achiev_leader_dm("524 Shiki • Kamigomi", "Kyo")
achiev_leader_dm("San Shingi no Ni", "Iori")
achiev_leader_dm("Shingo Kinsei Oreshiki • Rouka Guruma", "Shingo")
achiev_leader_dm("Grudge Match", "Gai")
achiev_leader_dm("Ougi • Musou Ranbuu", "Hayate")
achiev_leader_dm("G • Sklaven", "Adelheid")
achiev_leader_dm("Chouzetsu Sarugeri", "Silber")
achiev_leader_dm("Jyaga Zetsumeichuu", "Jazu")


// =========================================
//               Leaderboards              
// =========================================

leaderboard("KOF XI Hi-Score (Level-4)", "Best core on Arcade mode (Level-4 difficulty)",
           start = p1_only() && game_beaten() && settings_difficulty_level4(),
           cancel = p2_active_state() > 0,
           submit = p1_only() && game_beaten() && settings_difficulty_level4(),
           value = p1_score(),
           format = "SCORE", lower_is_better=false
           )


leaderboard("KOF XI Hi-Score (Level-8)", "Best core on Arcade mode (Level-8 difficulty)",
           start = p1_only() && game_beaten() && settings_difficulty_level8(),
           cancel = p2_active_state() > 0,
           submit = p1_only() && game_beaten() && settings_difficulty_level8(),
           value = p1_score(),
           format = "SCORE", lower_is_better=false
           )