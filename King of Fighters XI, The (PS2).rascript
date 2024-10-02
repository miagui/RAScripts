// King of Fighters XI, The
// #ID = 20531

function settings_sound_bgm() => byte(0x8B6DA9)
function settings_battle_system() => byte(0x8B6DB0)

function settings_battle_cpu_level() => byte(0x8B6DB1)
function settings_battle_play_time() => byte(0x8B6DB2)
function settings_battle_single_round() => byte(0x8B6DB4)
function settings_battle_defense_level_1p() => byte(0x8B6DB5)
function settings_battle_defense_level_2p() => byte(0x8B6DB6)
function settings_battle_power_gauge_1p() => byte(0x8B6DB7)
function settings_battle_power_gauge_2p() => byte(0x8B6DB8)
function settings_battle_skill_gauge_1p() => byte(0x8B6DB9)
function settings_battle_skill_gauge_2p() => byte(0x8B6DBA)

function settings_default() {
    return(
        settings_battle_cpu_level() >= 3 &&
        settings_battle_play_time() == 2 &&
        settings_battle_single_round() == 1 &&
        settings_battle_defense_level_1p() == 3 &&
        settings_battle_defense_level_2p() == 3 &&
        settings_battle_power_gauge_1p() == 0 &&
        settings_battle_power_gauge_2p() == 0 &&
        settings_battle_skill_gauge_1p() == 0 &&
        settings_battle_skill_gauge_2p() == 0
    )
}

function settings_default_level8() {
    return(
        settings_battle_cpu_level() == 7 &&
        settings_battle_play_time() == 2 &&
        settings_battle_single_round() == 1 &&
        settings_battle_defense_level_1p() == 3 &&
        settings_battle_defense_level_2p() == 3 &&
        settings_battle_power_gauge_1p() == 0 &&
        settings_battle_power_gauge_2p() == 0 &&
        settings_battle_skill_gauge_1p() == 0 &&
        settings_battle_skill_gauge_2p() == 0
    )
}

function game_bgm() => byte(0x2863D8)
function game_continue_service() => byte(0x8A9510)
function game_arcade_match() => byte(0x8A9530)

function game_mode() => byte(0x8D5248)
         MODE_ARCADE_PLAY = 0x00
         MODE_ARCADE_VS = 0x01
         MODE_SINGLE_PLAY = 0x02
         MODE_SINGLE_VS = 0x03
         MODE_TEAM_PLAY = 0x04
         MODE_TEAM_VS = 0x05
         MODE_ENDLESS = 0x06
         MODE_CHALLENGE = 0x07
         MODE_PRACTICE = 0x08
         MODE_GALLERY = 0x0a
         MODE_GAME_OPTIONS = 0x0b

function game_context() => byte(0x8A95E9)
function game_current_state() => word(0x8a95e8)
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

function endless_wins() => byte(0x8A9548)
function challenge_mode_current_mission() => byte(0x1DA2C40)

function p1_active_state() => byte(0x8A95F0)
function p2_active_state() => byte(0x8A95F1)

function p1_consecutive_wins() => byte(0x8A98D2)
function p1_current_leader() => byte(0x8A9691)
function p1_macro_flag() => byte(0x8D4630)
function p1_hit_combo() => byte(0x8A9697)

function p1_super_cancel() => bit3(0x8A969C)
function p1_dream_cancel() => bit4(0x8A969C)
function p1_desperation_move_bg() => bit2(0x8A96A2)
function p1_ko() => bit5(0x8A96A3)
function p1_move_type_hit() => byte(0x8A96BB)

function p1_power_gauge() => word(0x8A96C8)
function p1_skill_gauge() => word(0x8A96CE)
function p1_score() => dword(0x8A96D4)

function p1_current_character_pointer() => dword(0x8A96F4)
function p1_move() => word(dword(p1_current_character_pointer() + 0x10) + 0xec)

function p1_slot_1_character() => byte(0x8A97E0)
function p1_slot_2_character() => byte(0x8A9800)
function p1_slot_3_character() => byte(0x8A9820)
function p1_slot_1_hp() => word(0x8A97E4)
function p1_slot_2_hp() => word(0x8A9804)
function p1_slot_3_hp() => word(0x8A9824)
function p1_slot_1_order() => byte(0x8A97EC)
function p1_slot_2_order() => byte(0x8A980C)
function p1_slot_3_order() => byte(0x8A982C)

function p2_slot_1_character() => byte(0x8A9A28)
function p2_slot_2_character() => byte(0x8A9A48)
function p2_slot_3_character() => byte(0x8A9A68)
function p2_slot_1_hp() => word(0x8A9A2C)
function p2_slot_2_hp() => word(0x8A9A4C)
function p2_slot_3_hp() => word(0x8A9A6C)
function p2_slot_1_order() => byte(0x8A9A34)
function p2_slot_2_order() => byte(0x8A9A54)
function p2_slot_3_order() => byte(0x8A9A74)

characters = {
   "Ash": 0,
   "Oswald": 1,
   "Shen": 2,
   "Elisabeth": 3,
   "Duolon": 4,
   "Benimaru": 5,
   "Terry": 6,
   "Kim": 7,
   "Duck": 8,
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
   "Silver": 36,
   "Jazu": 37,
   "Shion": 38,
   "Magaki": 39,
   "Mai": 41,
   "Robert": 42,
   "Mr. Big": 43,
   "Geese": 44,
   "Hotaru": 45,
   "Tung Fu Rue": 46,
   "EX Kyo": 47
}

// =========================================
//                 Utility              
// =========================================

function p1_only() => p1_active_state() > 0 && p2_active_state() == 0
function in_game() => game_context() == 0x03
function in_char_select() => game_current_state() == GS_CHARACTER_SELECT
function is_fighting() => game_current_state() == GS_FIGHTING
function in_winners() => game_current_state() == GS_WINNERS_ANNOUNCEMENT

function is_any_team_mode() => never(game_mode() != MODE_ARCADE_PLAY && game_mode() != MODE_TEAM_PLAY) 
function is_any_arcade_mode() => never(game_mode() != MODE_ARCADE_PLAY && game_mode() != MODE_TEAM_PLAY && game_mode() != MODE_SINGLE_PLAY) 

function p1_won_match() => p2_slot_1_hp() == 0xFFFF && p2_slot_2_hp() == 0xFFFF && p2_slot_3_hp() == 0xFFFF && p1_ko() > prev(p1_ko())

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
    achievement(title, format("Beat the game using only {0}, {1} and {2} (default settings).", char1, char2, char3), 10,
                trigger = p1_only() &&
                          in_game() &&
                          is_any_team_mode() &&
                          once(game_arcade_match() == 0 && in_char_select() && p1_active_state() > 0) &&
                          never(p1_dont_have_char(characters[char1]) && p1_won_match()) &&
                          never(p1_dont_have_char(characters[char2]) && p1_won_match()) &&
                          never(p1_dont_have_char(characters[char3]) && p1_won_match()) &&
                          p1_team_has_char(characters[char1]) &&
                          p1_team_has_char(characters[char2]) &&
                          p1_team_has_char(characters[char3]) &&
                          settings_default() &&
                          trigger_when(game_beaten())
                )
}

achiev_beat_game_team("Hero Team", "Ash", "Oswald", "Shen")
achiev_beat_game_team("Rivals Team", "Elisabeth", "Duolon", "Benimaru")
achiev_beat_game_team("Fatal Fury Team", "Terry", "Kim", "Duck")
achiev_beat_game_team("Art of Fighting Team", "Ryo", "King", "Yuri")
achiev_beat_game_team("Ikari Warriors Team", "Ralf", "Clark", "Whip")
achiev_beat_game_team("Psycho Soldier Team", "Athena", "Kensou", "Momoko")
achiev_beat_game_team("Mark of the Wolves Team", "B. Jenet", "Gato", "Griffon")
achiev_beat_game_team("Agents Team", "Vanessa", "Blue Mary", "Ramon")
achiev_beat_game_team("Anti-Kyokugenryu Team", "Eiji", "Kasumi", "Malin")
achiev_beat_game_team("K' Team", "K'", "Kula", "Maxima")
achiev_beat_game_team("Kyo & Iori Team", "Kyo", "Iori", "Shingo")

achiev_beat_game_team("Unrequited Love Team", "Kensou", "Ramon", "Robert")
achiev_beat_game_team("Justice Team", "Athena", "Kim", "Griffon")
achiev_beat_game_team("KOF Heroes Team", "Kyo", "K'", "Ash")
achiev_beat_game_team("KOF 2003 Heroes Team", "Ash", "Duolon", "Shen")
achiev_beat_game_team("Girls Team", "Athena", "Kula", "Momoko")
achiev_beat_game_team("Birds Team", "Jazu", "Duck", "Griffon")
achiev_beat_game_team("KOF '96 Art of Fighting Team", "Ryo", "Robert", "Yuri")
achiev_beat_game_team("Punishment Team", "Elisabeth", "B. Jenet", "Whip")
achiev_beat_game_team("Older Brothers Team", "Ryo", "Adelheid", "Gato")
achiev_beat_game_team("Womens Team", "Vanessa", "Elisabeth", "King")
achiev_beat_game_team("Buriki One Team", "Ryo", "Silver", "Gai")
achiev_beat_game_team("Ninja Team", "Eiji", "Mai", "Jazu")
// achiev_beat_game_team("Currently Reforming Team", "Kim", "", "")
// achiev_beat_game_team("New Challengers Team", "", "", "")

// achiev_beat_game_team("Savage Reign Team", "Sho Hayate", "Jazu", "")
achiev_beat_game_team("Androgynous Team", "Shion", "Ash", "King")
achiev_beat_game_team("SNK Boss Team", "Magaki", "Geese", "Mr. Big")

achiev_beat_game_team("Alternative MOTW Team", "Terry", "Hotaru", "Griffon")
achiev_beat_game_team("Flames Team", "EX Kyo", "Iori", "K'")
achiev_beat_game_team("Masters Team", "Tung Fu Rue", "Kim", "Ryo")

achievement("Savage Reign Team", "Beat the game using only Hayate, Jazu and other (default settings).", 10,
                trigger = p1_only() &&
                          in_game() &&
                          is_any_team_mode() &&
                          once(game_arcade_match() == 0 && in_char_select() && p1_active_state() > 0) &&
                          never(p1_dont_have_char(characters["Hayate"]) && p1_won_match()) &&
                          never(p1_dont_have_char(characters["Jazu"]) && p1_won_match()) &&
                          p1_team_has_char(characters["Hayate"]) &&
                          p1_team_has_char(characters["Jazu"]) &&
                          settings_default() &&
                          trigger_when(game_beaten())
                )

achievement("Currently Reforming Team", "Beat the game using only Kim and two other evil characters (default settings).", 10,
                trigger = p1_only() &&
                          in_game() &&
                          is_any_team_mode() &&
                          once(game_arcade_match() == 0 && game_current_state() == GS_ORDER_SELECT && p1_active_state() > 0) &&
                          never(p1_dont_have_char(characters["Kim"]) && p1_won_match()) &&
                          p1_team_has_char(characters["Kim"]) &&

                          never(p1_slot_1_character() != characters["Kim"] &&
                                p1_slot_1_character() != characters["Ash"] &&
                                p1_slot_1_character() != characters["Iori"] &&
                                p1_slot_1_character() != characters["Shion"] &&
                                p1_slot_1_character() != characters["Magaki"] &&
                                p1_slot_1_character() != characters["Silver"] &&
                                p1_slot_1_character() != characters["Jazu"] &&
                                p1_slot_1_character() != characters["Geese"] &&
                                p1_slot_1_character() != characters["Mr. Big"] &&
                                is_fighting()
                               ) &&

                          never(p1_slot_2_character() != characters["Kim"] &&
                                p1_slot_2_character() != characters["Ash"] &&
                                p1_slot_2_character() != characters["Iori"] &&
                                p1_slot_2_character() != characters["Shion"] &&
                                p1_slot_2_character() != characters["Magaki"] &&
                                p1_slot_2_character() != characters["Silver"] &&
                                p1_slot_2_character() != characters["Jazu"] &&
                                p1_slot_2_character() != characters["Geese"] &&
                                p1_slot_2_character() != characters["Mr. Big"] &&
                                is_fighting()
                               ) &&
                               
                          never(p1_slot_3_character() != characters["Kim"] &&
                                p1_slot_3_character() != characters["Ash"] &&
                                p1_slot_3_character() != characters["Iori"] &&
                                p1_slot_3_character() != characters["Shion"] &&
                                p1_slot_3_character() != characters["Magaki"] &&
                                p1_slot_3_character() != characters["Silver"] &&
                                p1_slot_3_character() != characters["Jazu"] &&
                                p1_slot_3_character() != characters["Geese"] &&
                                p1_slot_3_character() != characters["Mr. Big"] &&
                                is_fighting()
                               ) &&






                          never(p1_slot_1_character() != characters["Kim"] &&
                                p1_slot_1_character() != characters["Ash"] &&
                                p1_slot_1_character() != characters["Iori"] &&
                                p1_slot_1_character() != characters["Shion"] &&
                                p1_slot_1_character() != characters["Magaki"] &&
                                p1_slot_1_character() != characters["Silver"] &&
                                p1_slot_1_character() != characters["Jazu"] &&
                                p1_slot_1_character() != characters["Geese"] &&
                                p1_slot_1_character() != characters["Mr. Big"] &&
                                game_arcade_match() == 0 && game_current_state() == GS_ORDER_SELECT
                               ) &&

                          never(p1_slot_2_character() != characters["Kim"] &&
                                p1_slot_2_character() != characters["Ash"] &&
                                p1_slot_2_character() != characters["Iori"] &&
                                p1_slot_2_character() != characters["Shion"] &&
                                p1_slot_2_character() != characters["Magaki"] &&
                                p1_slot_2_character() != characters["Silver"] &&
                                p1_slot_2_character() != characters["Jazu"] &&
                                p1_slot_2_character() != characters["Geese"] &&
                                p1_slot_2_character() != characters["Mr. Big"] &&
                                game_arcade_match() == 0 && game_current_state() == GS_ORDER_SELECT
                               ) &&
                               
                          never(p1_slot_3_character() != characters["Kim"] &&
                                p1_slot_3_character() != characters["Ash"] &&
                                p1_slot_3_character() != characters["Iori"] &&
                                p1_slot_3_character() != characters["Shion"] &&
                                p1_slot_3_character() != characters["Magaki"] &&
                                p1_slot_3_character() != characters["Silver"] &&
                                p1_slot_3_character() != characters["Jazu"] &&
                                p1_slot_3_character() != characters["Geese"] &&
                                p1_slot_3_character() != characters["Mr. Big"] &&
                                game_arcade_match() == 0 && game_current_state() == GS_ORDER_SELECT
                               ) &&

                          settings_default() &&
                          trigger_when(game_beaten())
                )

achievement("New Challengers", "Beat the game using only PS2 exclusive characters (default settings).", 10,
                trigger = p1_only() &&
                          in_game() &&
                          is_any_team_mode() &&
                          once(game_arcade_match() == 0 && game_current_state() == GS_ORDER_SELECT && p1_active_state() > 0) &&

                          never(p1_slot_1_character() != characters["Mai"] &&
                                p1_slot_1_character() != characters["Robert"] &&
                                p1_slot_1_character() != characters["Mr. Big"] &&
                                p1_slot_1_character() != characters["Geese"] &&
                                p1_slot_1_character() != characters["Hotaru"] &&
                                p1_slot_1_character() != characters["Tung Fu Rue"] &&
                                p1_slot_1_character() != characters["EX Kyo"] &&
                                is_fighting()
                               ) &&

                          never(p1_slot_2_character() != characters["Mai"] &&
                                p1_slot_2_character() != characters["Robert"] &&
                                p1_slot_2_character() != characters["Mr. Big"] &&
                                p1_slot_2_character() != characters["Geese"] &&
                                p1_slot_2_character() != characters["Hotaru"] &&
                                p1_slot_2_character() != characters["Tung Fu Rue"] &&
                                p1_slot_2_character() != characters["EX Kyo"] &&
                                is_fighting()
                               ) &&
                               
                          never(p1_slot_3_character() != characters["Mai"] &&
                                p1_slot_3_character() != characters["Robert"] &&
                                p1_slot_3_character() != characters["Mr. Big"] &&
                                p1_slot_3_character() != characters["Geese"] &&
                                p1_slot_3_character() != characters["Hotaru"] &&
                                p1_slot_3_character() != characters["Tung Fu Rue"] &&
                                p1_slot_3_character() != characters["EX Kyo"] &&
                                is_fighting()
                               ) &&
                          




                          never(p1_slot_1_character() != characters["Mai"] &&
                                p1_slot_1_character() != characters["Robert"] &&
                                p1_slot_1_character() != characters["Mr. Big"] &&
                                p1_slot_1_character() != characters["Geese"] &&
                                p1_slot_1_character() != characters["Hotaru"] &&
                                p1_slot_1_character() != characters["Tung Fu Rue"] &&
                                p1_slot_1_character() != characters["EX Kyo"] &&
                                game_arcade_match() == 0 && game_current_state() == GS_ORDER_SELECT
                               ) &&

                          never(p1_slot_2_character() != characters["Mai"] &&
                                p1_slot_2_character() != characters["Robert"] &&
                                p1_slot_2_character() != characters["Mr. Big"] &&
                                p1_slot_2_character() != characters["Geese"] &&
                                p1_slot_2_character() != characters["Hotaru"] &&
                                p1_slot_2_character() != characters["Tung Fu Rue"] &&
                                p1_slot_2_character() != characters["EX Kyo"] &&
                                game_arcade_match() == 0 && game_current_state() == GS_ORDER_SELECT
                               ) &&
                               
                          never(p1_slot_3_character() != characters["Mai"] &&
                                p1_slot_3_character() != characters["Robert"] &&
                                p1_slot_3_character() != characters["Mr. Big"] &&
                                p1_slot_3_character() != characters["Geese"] &&
                                p1_slot_3_character() != characters["Hotaru"] &&
                                p1_slot_3_character() != characters["Tung Fu Rue"] &&
                                p1_slot_3_character() != characters["EX Kyo"] &&
                                game_arcade_match() == 0 && game_current_state() == GS_ORDER_SELECT
                               ) &&

                          settings_default() &&
                          trigger_when(game_beaten())
                )

achievement("An Improvised Concerto", "Beat the game on Level-8 difficulty (default settings).", 25,
                trigger = p1_only() &&
                          in_game() &&
                          is_any_team_mode() &&
                          once(game_arcade_match() == 0 && in_char_select() && p1_active_state() > 0) &&
                          settings_default_level8() &&
                          trigger_when(game_beaten())
                )


achievement("Arcade Play", "Beat the game on Arcade Play (default settings).", 10,
                trigger = p1_only() &&
                          in_game() &&
                          game_mode() == MODE_ARCADE_PLAY &&
                          settings_default() &&
                          game_beaten()
                )

achievement("Team Play", "Beat the game on Team Play (default settings).", 10,
                trigger = p1_only() &&
                          in_game() &&
                          game_mode() == MODE_TEAM_PLAY &&
                          settings_default() &&
                          game_beaten()
                )

achievement("Single Play", "Beat the game on Single Play (default settings).", 10,
                trigger = p1_only() &&
                          in_game() &&
                          game_mode() == MODE_SINGLE_PLAY &&
                          settings_default() &&
                          game_beaten()
                )

achievement("PS2 Edition", "Beat the game on Arranged system (default settings).", 5,
                trigger = p1_only() &&
                          is_any_arcade_mode() &&
                          in_game() &&
                          settings_battle_system() == 0 &&
                          settings_default() &&
                          game_beaten()
                )


// =========================================
//                    Misc              
// =========================================

achievement("Leader of the Pack", "Finish a match with a Leader Desperation Move against the CPU (default settings).", 3,
            trigger =   p1_only() &&
                        is_fighting() &&
                        p1_move_type_hit() == 3 &&
                        p1_won_match() &&
                        settings_default()
            )

achievement("Awakening", "Win a match with a perfect against the CPU (default settings).", 5,
            trigger =   p1_only() &&
                        is_fighting() &&
                        p1_slot_1_hp() == 0x70 &&
                        p1_slot_2_hp() == 0x70 &&
                        p1_slot_3_hp() == 0x70 &&
                        p1_won_match() &&
                        settings_default()
            )


achievement("Mustard For Geese", "Perform the full sequence of Deadly Rave.", 2,
                  trigger =   p1_active_state() > 0 &&
                              is_fighting() &&
                              p1_current_char_is("Geese") &&
                              never(p1_hit_combo() == 0) &&
                              p1_move() == 0xdd &&
                              prev(p1_move()) != 0xdd
                  )





// =========================================
//                Dream Cancel              
// =========================================

function achiev_dream_cancel_char(char) {
      achievement(format("Dream Cancel - {0}", char), format("Perform a combo using a Super Cancel and Dream Cancel as {0} (no command macros).", char), 5,
                  trigger =   p1_active_state() > 0 &&
                              is_fighting() &&
                              p1_current_char_is(char) &&
                              never(p1_hit_combo() == 0) &&
                              never(p1_macro_flag() == 3) && // macro protection
                              once(p1_super_cancel() > prev(p1_super_cancel())) &&
                              once(p1_dream_cancel() > prev(p1_dream_cancel())) &&
                              p1_hit_combo() > prev(p1_hit_combo())
                  )
}

function achiev_dream_cancel_char_no_hit(char) {
      achievement(format("Dream Cancel - {0}", char), format("Perform a combo using a Super Cancel and Dream Cancel as {0} (no command macros).", char), 5,
                  trigger =   p1_active_state() > 0 &&
                              is_fighting() &&
                              p1_current_char_is(char) &&
                              never(p1_hit_combo() == 0) &&
                              never(p1_macro_flag() == 3) && // macro protection
                              once(p1_super_cancel() > prev(p1_super_cancel())) &&
                              once(p1_dream_cancel() > prev(p1_dream_cancel()))
                  )
}

function achiev_only_dream_cancel_char(char) {
      achievement(format("Dream Cancel - {0}", char), format("Perform a combo using a Dream Cancel as {0} (no command macros).", char), 5,
                  trigger =   p1_active_state() > 0 &&
                              is_fighting() &&
                              p1_current_char_is(char) &&
                              never(p1_hit_combo() == 0) &&
                              never(p1_macro_flag() == 3) && // macro protection
                              once(p1_dream_cancel() > prev(p1_dream_cancel())) &&
                              p1_hit_combo() > prev(p1_hit_combo())
                  )
}

function achiev_only_dream_cancel_char_no_hit(char) {
      achievement(format("Dream Cancel - {0}", char), format("Perform a combo using a Dream Cancel as {0} (no command macros).", char), 5,
                  trigger =   p1_active_state() > 0 &&
                              is_fighting() &&
                              p1_current_char_is(char) &&
                              never(p1_hit_combo() == 0) &&
                              never(p1_macro_flag() == 3) && // macro protection
                              once(p1_dream_cancel() > prev(p1_dream_cancel()))
                  )
}

achiev_dream_cancel_char("Ash")
achiev_dream_cancel_char("Oswald")
achiev_dream_cancel_char_no_hit("Shen")
achiev_dream_cancel_char("Elisabeth")
achiev_dream_cancel_char("Duolon")
achiev_dream_cancel_char("Benimaru")
achiev_dream_cancel_char("Terry")
achiev_dream_cancel_char("Kim")
achiev_dream_cancel_char("Duck")
achiev_dream_cancel_char("Ryo")
achiev_dream_cancel_char("Yuri")
achiev_dream_cancel_char("King")
achiev_dream_cancel_char("B. Jenet")
achiev_dream_cancel_char("Gato")
achiev_only_dream_cancel_char("Griffon")
achiev_dream_cancel_char("Ralf")
achiev_only_dream_cancel_char("Clark")
achiev_dream_cancel_char("Whip")
achiev_dream_cancel_char("Athena")
achiev_only_dream_cancel_char("Kensou")
achiev_dream_cancel_char("Momoko")
achiev_dream_cancel_char("Vanessa")
achiev_dream_cancel_char("Blue Mary")
achiev_dream_cancel_char("Ramon")
achiev_dream_cancel_char("Malin")
achiev_dream_cancel_char("Kasumi")
achiev_dream_cancel_char("Eiji")
achiev_dream_cancel_char("K'")
achiev_dream_cancel_char("Kula")
achiev_dream_cancel_char("Maxima")
achiev_dream_cancel_char("Kyo")
achiev_dream_cancel_char("Iori")
achiev_dream_cancel_char("Shingo")
achiev_dream_cancel_char("Gai")
achiev_dream_cancel_char("Hayate")
achiev_only_dream_cancel_char("Adelheid")
achiev_only_dream_cancel_char("Silver")
achiev_dream_cancel_char("Jazu")
achiev_only_dream_cancel_char_no_hit("Shion")
achiev_dream_cancel_char("Magaki")
achiev_dream_cancel_char("Mai")
achiev_dream_cancel_char("Robert")
achiev_only_dream_cancel_char("Mr. Big")
achiev_dream_cancel_char("Geese")
achiev_dream_cancel_char("Hotaru")
achiev_dream_cancel_char("Tung Fu Rue")
achiev_dream_cancel_char("EX Kyo")


// =========================================
//               Leaderboards              
// =========================================

leaderboard("KOF XI Hi-Score (Level-4)", "Best score on Arcade mode (default settings).",
           start = p1_only() && game_beaten() && settings_default() && is_any_arcade_mode(),
           cancel = p2_active_state() > 0,
           submit = p1_only() && game_beaten() && settings_default(),
           value = p1_score(),
           format = "SCORE", lower_is_better=false
           )


leaderboard("KOF XI Hi-Score (Level-8)", "Best score on Arcade mode (default settings).",
           start = p1_only() && game_beaten() && settings_default_level8() && is_any_arcade_mode(),
           cancel = p2_active_state() > 0,
           submit = p1_only() && game_beaten() && settings_default_level8(),
           value = p1_score(),
           format = "SCORE", lower_is_better=false
           )

leaderboard("KOF XI Endless Survival", "Highest wins on Endless mode.",
           start = p1_only() && game_mode() == MODE_ENDLESS && p1_slot_1_hp() == 0xFFFF && p1_ko() > prev(p1_ko()) && settings_default(),
           cancel = p2_active_state() > 0,
           submit = p1_only() && game_mode() == MODE_ENDLESS && p1_slot_1_hp() == 0xFFFF && p1_ko() > prev(p1_ko()) && settings_default(),
           value = endless_wins(),
           format = "VALUE", lower_is_better=false
           )