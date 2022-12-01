// King of Fighters 2002, The: Unlimited Match
// #ID = 20602

// =========================================
//              Memory Accessors              
// =========================================

// Settings
function settings_cpu_level() => byte(0x5E07B2)
function settings_cpu_level_default() => byte(0x5E07B2) >= 0x03
function settings_playtime() => byte(0x5E07B3)
function settings_single_round() => byte(0x5E07B4)
function settings_single_round_default() => byte(0x5E07B4) == 1
function settings_defense_level_p1() => byte(0x5E07B5)
function settings_defense_level_p2() => byte(0x5E07B6)
function settings_power_gauge_p1() => byte(0x5E07B7)
function settings_power_gauge_p2() => byte(0x5E07B8)

// Game
function game_is_fighting() => byte(0x5BCE6B)
function game_human_players_active() => byte(0x5BE350)
function game_mode_selected() => byte(0x5CD5E4)
function game_mode() => byte(0x5F4C70)
         gm_team_play = 0x00
         gm_team_play_2pvs = 0x01
         gm_team_play_cpuvs = 0x02
         gm_single_play = 0x03
         gm_single_play_2pvs = 0x04
         gm_single_play_cpuvs = 0x05
         gm_endless = 0x06
         gm_challenge = 0x07
         gm_practice = 0x08
         gm_gallery = 0x09
         gm_neogeo_mode = 0x0b

// Arcade
function arcade_finishing_move_type() => byte(0x5B98F3)
function arcade_rounds_lost() => byte(0x5B98F4)
function arcade_continues_used() => byte(0x5B98F5)
function arcade_opponent_id() => byte(0x5BE390)
function arcade_matches_won() => sum_of(range(0, 31), b => bit(b,0x5BE3A0))

function match_hsdm_bg() => byte(0x5B9CD8)
function match_current_round() => byte(0x5BE358)

function p1_input_human() => byte(0x5b4e42)
function p1_input() => byte(0x5bacd0)

// P1
function p1_team() => byte(0x5BE271)

function p1_alt_char_bit0() => bit0(0x5be272)
function p1_alt_char_bit1() => bit1(0x5be272)
function p1_alt_char_bit2() => bit2(0x5be272)
function p1_alt_char() => byte(0x5be272)
function p1_1st_char() => byte(0x5BE274)
function p1_2nd_char() => byte(0x5BE275)
function p1_3rd_char() => byte(0x5BE276)

function p1_rounds_wins() => byte(0x5BE280)
function p1_rounds_losses() => byte(0x5BE281)

function p1_current_move_type() => byte(0x5B98E8)

function p1_current_char() => byte(0x5CD140)
function p1_current_char_orochi() => byte(0x5cd2a6)
function p1_moves() => word(0x5CD142)
function p1_hp() => byte(0x5CD208)
function p1_hit_combo() => byte(0x5CD4A0)

// P2
function p2_current_char() => byte(0x5CD360)
function p2_moves() => word(0x5CD362)
function p2_hp() => byte(0x5CD428)
function p2_hit_combo() => byte(0x5CD280)

characters = {
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
   "Nameless": 37,
   "Angel": 38,
   "Omega Rugal": 39,
   "Kusanagi": 40,
   "Shingo": 41,
   "King": 42,
   "Xiangfei": 43,
   "Hinako": 44,
   "Heidern": 45,
   "Lin": 46,
   "EX Takuma": 47,
   "Bao": 48,
   "Jhun": 49,
   "Kyo-1": 50,
   "Foxy": 51,
   "Kasumi": 52,
   "Geese": 53,
   "Nightmare Geese": 54,
   "EX Robert": 55,
   "EX Kensou": 56,
   "Kyo-2": 57,
   "Goenitz": 58,
   "Krizalid": 59,
   "C-Zero": 60,
   "Zero": 61,
   "Igniz": 62,
   "Orochi Yashiro": 64,
   "Orochi Shermie": 65,
   "Orochi Chris": 66
}

// =========================================
//                 Utilities              
// =========================================

function p1_only() => game_human_players_active() == 1
function team_play_arcade_beaten() {
    return (
            (
                p2_current_char() == characters["Krizalid"] ||
                p2_current_char() == characters["C-Zero"] ||
                p2_current_char() == characters["Zero"] ||
                p2_current_char() == characters["Igniz"]
            ) &&
            p1_has_won() 
    )
}

function single_play_arcade_beaten() {
    return (
            (
                p2_current_char() == characters["Krizalid"] ||
                p2_current_char() == characters["C-Zero"] ||
                p2_current_char() == characters["Zero"] ||
                p2_current_char() == characters["Igniz"]
            ) &&
            settings_single_round_default() &&
            p1_rounds_wins() == 2 && prev(p1_rounds_wins()) == 1
    )
}

function p1_team_has_char(char_id) => p1_1st_char() == char_id || p1_2nd_char() == char_id || p1_3rd_char() == char_id
function p1_dont_have_char(char_id) => p1_1st_char() != char_id && p1_2nd_char() != char_id && p1_3rd_char() != char_id

function p1_has_won() => p1_rounds_wins() > prev(p1_rounds_wins())
function arcade_match_won() => arcade_matches_won() > prev(arcade_matches_won())

function macro_protection() => never(byte(0x5f45f0) == 3) && repeated(900, always_true())

// =========================================
//               Beat the Game             
// =========================================

achievement("Lone Wolf", "Reach and defeat St-Boss on Single Play (Level-4 difficulty).", 10,
                trigger =   game_mode() == gm_single_play &&
                            game_is_fighting() == true &&
                            p1_only() &&
                            settings_cpu_level_default() &&
                            trigger_when(single_play_arcade_beaten())
            )


function beat_arcade_team(char1, char2, char3, title, cheevo_id) {
    achievement(title, format("Reach and defeat St-Boss using only {0}, {1} and {2} (Level-4 difficulty).", char1, char2, char3), 10,
                trigger =   game_mode() == gm_team_play &&
                            game_is_fighting() == true &&
                            p1_only() &&
                            once(arcade_matches_won() == 0) &&
                            never(p1_dont_have_char(characters[char1]) && p1_has_won()) &&
                            never(p1_dont_have_char(characters[char2]) && p1_has_won()) &&
                            never(p1_dont_have_char(characters[char3]) && p1_has_won()) &&
                            never(p1_alt_char() != 0x00 && p1_has_won()) &&
                            p1_team_has_char(characters[char1]) &&
                            p1_team_has_char(characters[char2]) &&
                            p1_team_has_char(characters[char3]) &&
                            p1_alt_char() == 0x00 &&
                            settings_cpu_level_default() &&
                            trigger_when(team_play_arcade_beaten())
                )
}

beat_arcade_team("K'", "Maxima", "Whip", "K' Team", 0)
beat_arcade_team("Kyo", "Benimaru", "Daimon", "Japan Team", 0)
beat_arcade_team("Terry", "Andy", "Joe", "Fatal Fury Team", 0)
beat_arcade_team("Ryo", "Robert", "Yuri", "Art of Fighting Team", 0)
beat_arcade_team("Leona", "Ralf", "Clark", "Ikari Warriors Team", 0)
beat_arcade_team("Athena", "Kensou", "Bao", "Psycho Soldier Team", 0)
beat_arcade_team("King", "Mai", "Kasumi", "Women Fighters Team", 0)
beat_arcade_team("Xiangfei", "Hinako", "May Lee", "Pretty Girls Fighters Team", 0)
beat_arcade_team("Kim", "Chang", "Choi", "Korea Justice Team", 0)
beat_arcade_team("Jhun", "Lin", "Shingo", "Asian Triple Alliance Team", 0)
beat_arcade_team("Yashiro", "Shermie", "Chris", "KOF '97 New Faces Team", 0)
// beat_arcade_team("Orochi Yashiro", "Orochi Shermie", "Orochi Chris", "Awakened Orochi Team", 0)
beat_arcade_team("Yamazaki", "Blue Mary", "Billy", "KOF '97 Special Team", 0)
beat_arcade_team("Iori", "Mature", "Vice", "Yagami Team", 0)
beat_arcade_team("Vanessa", "Seth", "Ramon", "Agents Team", 0)
beat_arcade_team("Heidern", "Takuma", "Chin", "Masters Team", 0)
beat_arcade_team("Kula", "Foxy", "Angel", "NESTS Team", 0)
beat_arcade_team("Kusanagi", "Kyo-1", "Kyo-2", "Clones Team", 0)
beat_arcade_team("Nameless", "K'", "Kyo", "KOF '02 UM Team", 0)
beat_arcade_team("Ryo", "Robert", "Takuma", "Former Art of Fighting Team", 0)
beat_arcade_team("Athena", "Kensou", "Chin", "Former Psycho Soldier Team", 0)
beat_arcade_team("Mai", "Yuri", "May Lee", "Former Women Fighters Team", 0)
beat_arcade_team("Mai", "Blue Mary", "Xiangfei", "Fatal Fury's Women Team", 0)
beat_arcade_team("King", "Yuri", "Kasumi", "Art of Fighting's Women Team", 0)
beat_arcade_team("Athena", "Kim", "May Lee", "Justice Team", 0)
beat_arcade_team("Heidern", "Ralf", "Clark", "Classic Ikari Warriors Team", 0)
beat_arcade_team("Kula", "Bao", "Chris", "Kids Team", 0)
beat_arcade_team("Chang", "Daimon", "Maxima", "Giants Team", 0)
beat_arcade_team("Daimon", "Kasumi", "Hinako", "Japanese National Sports Team", 0)
beat_arcade_team("Terry", "Ryo", "Billy", "Older Brothers Team", 0)
beat_arcade_team("K'", "Clark", "Choi", "Sunglasses Team", 0)
beat_arcade_team("Mai", "Shermie", "Angel", "Glamorous Team", 0)
beat_arcade_team("Mature", "Vice", "Vanessa", "Mature Ladies Team", 0)
beat_arcade_team("Kim", "Takuma", "Daimon", "Fathers Team", 0)
beat_arcade_team("Joe", "Choi", "Goenitz", "Hurricane Team", 0)
beat_arcade_team("Geese", "Billy", "Yamazaki", "Fatal Fury Villains Team", 0)
beat_arcade_team("Goenitz", "Omega Rugal", "Geese", "Orochi Saga Bosses Team", 0)
// beat_arcade_team("", "", "", "NESTS Bosses Team", 0)
beat_arcade_team("Geese", "Nightmare Geese", "Goenitz", "Challenge Mode Bosses Team", 0)
beat_arcade_team("EX Robert", "EX Kensou", "EX Takuma", "EX Team", 0)


achievement("Awakened Orochi Team", "Reach and defeat St-Boss using only Orochi Yashiro, Orochi Shermie and Orochi Chris (Level-4 difficulty).", 10,
                trigger =   game_mode() == gm_team_play &&
                            game_is_fighting() == true &&
                            p1_only() &&
                            once(arcade_matches_won() == 0) &&
                            never(p1_dont_have_char(characters["Yashiro"]) && p1_has_won()) &&
                            never(p1_dont_have_char(characters["Shermie"]) && p1_has_won()) &&
                            never(p1_dont_have_char(characters["Chris"]) && p1_has_won()) &&
                            never(p1_alt_char() != 0x07 && p1_has_won()) &&
                            p1_team_has_char(characters["Yashiro"]) &&
                            p1_team_has_char(characters["Shermie"]) &&
                            p1_team_has_char(characters["Chris"]) &&
                            p1_alt_char() == 0x07 &&
                            settings_cpu_level_default() &&
                            trigger_when(team_play_arcade_beaten()),
                id = 257054
                )

achievement("NESTS Bosses Team", "Reach and defeat St-Boss using only Krizalid, C-Zero, Zero or Igniz (Level-4 difficulty).", 10,
                trigger =   game_mode() == gm_team_play &&
                            game_is_fighting() == true &&
                            p1_only() &&
                            once(arcade_matches_won() == 0) &&
                            never((p1_1st_char() < 0x3b || p1_1st_char() > 0x3e) && p1_has_won()) &&
                            never((p1_2nd_char() < 0x3b || p1_2nd_char() > 0x3e) && p1_has_won()) &&
                            never((p1_3rd_char() < 0x3b || p1_3rd_char() > 0x3e) && p1_has_won()) &&
                            p1_1st_char() >= 0x3b && p1_1st_char() <= 0x3e &&
                            p1_2nd_char() >= 0x3b && p1_2nd_char() <= 0x3e &&
                            p1_3rd_char() >= 0x3b && p1_3rd_char() <= 0x3e &&
                            settings_cpu_level_default() &&
                            trigger_when(team_play_arcade_beaten())
                )


// =========================================
//               HSDM (Max 2)              
// =========================================

function hit_with_hsdm(title, character, does_hits, points, cheevo_id) {
    if does_hits == true {
        achievement(title, format("{0}: Hit your opponent with a Max 2 on Arcade Mode.", character), points,
                    trigger =   game_mode() != gm_practice &&
                                game_mode() != gm_neogeo_mode &&
                                game_is_fighting() == true &&
                                p1_only() &&
                                macro_protection() &&
                                p1_current_char() == characters[character] &&
                                p1_current_move_type() == 0x04 &&
                                p1_hit_combo() > prev(p1_hit_combo())
                    )
    }
    else {
        achievement(title, format("{0}: Hit your opponent with a Max 2 on Arcade Mode.", character), points,
                    trigger =   game_mode() != gm_practice &&
                                game_mode() != gm_neogeo_mode &&
                                game_is_fighting() == true &&
                                p1_only() &&
                                macro_protection() &&
                                p1_current_char() == characters[character] &&
                                p1_current_move_type() == 0x04 &&
                                (
                                    p2_hp() < prev(p2_hp()) || // lost hp
                                    p2_hp() > 0x80 && prev(p2_hp()) < 0x80 // lost round exception
                                )
                                
                    )
    }
    
}

function hit_with_hsdm_orochi(title, character, does_hits, points, cheevo_id) {
    if does_hits == true {
        achievement(title, format("{0}: Hit your opponent with a Max 2 on Arcade Mode.", character), points,
                    trigger =   game_mode() != gm_practice &&
                                game_mode() != gm_neogeo_mode &&
                                game_is_fighting() == true &&
                                p1_only() &&
                                macro_protection() &&
                                p1_current_char() == characters[character] &&
                                p1_current_char_orochi() != characters[character] &&
                                p1_current_move_type() == 0x04 &&
                                p1_hit_combo() > prev(p1_hit_combo())
                    )
    }
    else {
        achievement(title, format("{0}: Hit your opponent with a Max 2 on Arcade Mode.", character), points,
                    trigger =   game_mode() != gm_practice &&
                                game_mode() != gm_neogeo_mode &&
                                game_is_fighting() == true &&
                                p1_only() &&
                                macro_protection() &&
                                p1_current_char() == characters[character] &&
                                p1_current_char_orochi() != characters[character] &&
                                p1_current_move_type() == 0x04 &&
                                (
                                    p2_hp() < prev(p2_hp()) || // lost hp
                                    p2_hp() > 0x80 && prev(p2_hp()) < 0x80 // lost round exception
                                )
                    )
    }
    
}

function hit_with_hsdm_no_orochi(title, character, does_hits, points, cheevo_id) {
    if does_hits == true {
        achievement(title, format("{0}: Hit your opponent with a Max 2 on Arcade Mode.", character), points,
                    trigger =   game_mode() != gm_practice &&
                                game_mode() != gm_neogeo_mode &&
                                game_is_fighting() == true &&
                                p1_only() &&
                                macro_protection() &&
                                p1_current_char() == characters[character] &&
                                p1_current_char_orochi() == characters[character] &&
                                p1_current_move_type() == 0x04 &&
                                p1_hit_combo() > prev(p1_hit_combo())
                    )
    }
    else {
        achievement(title, format("{0}: Hit your opponent with a Max 2 on Arcade Mode.", character), points,
                    trigger =   game_mode() != gm_practice &&
                                game_mode() != gm_neogeo_mode &&
                                game_is_fighting() == true &&
                                p1_only() &&
                                macro_protection() &&
                                p1_current_char() == characters[character] &&
                                p1_current_char_orochi() == characters[character] &&
                                p1_current_move_type() == 0x04 &&
                                (
                                    p2_hp() < prev(p2_hp()) || // lost hp
                                    p2_hp() > 0x80 && prev(p2_hp()) < 0x80 // lost round exception
                                )
                    )
    }
    
}

hit_with_hsdm("God\'s Duster", "Kyo", true, 5, 0)
hit_with_hsdm("Heaven Blast Dress", "Benimaru", true, 5, 0)
hit_with_hsdm("Fu Rin Ka Zan", "Daimon", false, 5, 0)
hit_with_hsdm("Rising Force", "Terry", true, 5, 0)
hit_with_hsdm("Zan Ei Super Sonic Swirl", "Andy", true, 5, 0)
hit_with_hsdm("Cross Giganticness", "Joe", true, 5, 0)
hit_with_hsdm("Zero Distance Phoenix Flattener", "Kim", true, 5, 0)
hit_with_hsdm("Earth Sphere Smasher", "Chang", true, 5, 0)
hit_with_hsdm("Instant Death", "Choi", true, 5, 0)
// hit_with_hsdm("Psycho Medley", "Athena", exception, 5, 0)
hit_with_hsdm("Dragon Awakening ", "Kensou", true, 5, 0)
hit_with_hsdm("Manipulate Flame Dance", "Chin", true, 5, 0)
hit_with_hsdm("Dead End Inferno", "Leona", true, 5, 0)
hit_with_hsdm("Galactica Vanguard", "Ralf", false, 5, 0)
// hit_with_hsdm("Roaring Sphere", "Clark", exception, 5, 0)
hit_with_hsdm("Ryuko Ranbu: Rage", "Ryo", true, 5, 0)
hit_with_hsdm("Ryuko Ranbu: Absolute", "Robert", true, 5, 0)
hit_with_hsdm("Tiger Killer", "Takuma", false, 5, 0)
hit_with_hsdm("Shiranui Nine Tails Fox", "Mai", true, 5, 0)
hit_with_hsdm("Super! Ryuko Ranbu", "Yuri", true, 5, 0)
hit_with_hsdm("Key of Victory", "May Lee", true, 5, 0)
hit_with_hsdm("Flame Disentengle", "Iori", true, 5, 0)
hit_with_hsdm("ECSTASY 816", "Mature", true, 5, 0)
hit_with_hsdm("Corpse March", "Vice", true, 5, 0)
hit_with_hsdm("...!!", "Yamazaki", true, 5, 0)
hit_with_hsdm("M. Infinity Rose", "Blue Mary", false, 5, 0)
hit_with_hsdm("Liar's Element", "Billy", true, 5, 0)
hit_with_hsdm_no_orochi("\"ERROR...\"code**2002**", "Yashiro", true, 5, 0)
hit_with_hsdm_no_orochi("Lighting Leg Lariat", "Shermie", false, 5, 0)
hit_with_hsdm_no_orochi("Fate of Flame", "Chris", true, 5, 0)
hit_with_hsdm("Crimson Star Road", "K'", true, 5, 0)
hit_with_hsdm("End of the World", "Maxima", true, 5, 0)
hit_with_hsdm("Super Black Hawk", "Whip", true, 5, 0)
hit_with_hsdm("Gaea Gear", "Vanessa", true, 5, 0)
hit_with_hsdm("Bloom of Chrysanthemum", "Seth", true, 5, 0)
hit_with_hsdm("Hypnotic Tiger", "Ramon", true, 5, 0)
hit_with_hsdm("Freeze Completion", "Kula", true, 5, 0)
hit_with_hsdm("Rinkou", "Nameless", true, 5, 0)
hit_with_hsdm("Survivors Banquette", "Angel", true, 5, 0)
hit_with_hsdm("Kaiser Phoenix", "Omega Rugal", true, 5, 0)
hit_with_hsdm("Final Showdown Zero Style", "Kusanagi", true, 5, 0)
hit_with_hsdm("Shingo Style God's Duster", "Shingo", false, 5, 0)
hit_with_hsdm("Secret Mirage", "King", true, 5, 0)
hit_with_hsdm("Tenshin Zan Hou Ga", "Xiangfei", true, 5, 0)
hit_with_hsdm("Daisyarin Nodowa Otoshi", "Hinako", false, 5, 0)
hit_with_hsdm("Caliburn", "Heidern", true, 5, 0)
hit_with_hsdm("Dokusyu Kou", "Lin", false, 5, 0)
hit_with_hsdm("Lion Killer", "EX Takuma", true, 5, 0)
hit_with_hsdm("Psycho Ball Gravity", "Bao", true, 5, 0)
hit_with_hsdm("Zankou Haiki Jin", "Jhun", true, 5, 0)
hit_with_hsdm("Heavenly Feather Slash", "Kyo-1", true, 5, 0)
hit_with_hsdm("Honeybee", "Foxy", false, 5, 0)
hit_with_hsdm("Dual Ultimate Ecstasy Crunch", "Kasumi", true, 5, 0)
hit_with_hsdm("Thunder Break", "Geese", true, 5, 0)
hit_with_hsdm("Raging Dead End", "Nightmare Geese", true, 5, 0)
hit_with_hsdm("EX Ryuko Ranbu ", "EX Robert", true, 5, 0)
hit_with_hsdm("Arrow Dash Dragon Crunch", "EX Kensou", true, 5, 0)
hit_with_hsdm("Hi no Kaguzuchi", "Kyo-2", false, 5, 0)
hit_with_hsdm("Ibuki Nagayo", "Goenitz", true, 5, 0)
hit_with_hsdm("Lighting Disaster", "Krizalid", true, 5, 0)
hit_with_hsdm("Dark Stream Heaven Breaker I", "C-Zero", true, 5, 0)
hit_with_hsdm("Dark Stream Heaven Breaker II", "Zero", false, 5, 0)
hit_with_hsdm("Dis-integrational Universe", "Igniz", true, 5, 0)
hit_with_hsdm_orochi("Harmagedon", "Yashiro", true, 5, 0)
hit_with_hsdm_orochi("Unmei no Ya", "Shermie", true, 5, 0)
hit_with_hsdm_orochi("Emerges from a Chrysalis", "Chris", true, 5, 0)

achievement("Psycho Medley", "Athena: Hit your opponent with all hits from Max 2 on Arcade Mode.", 10,
            trigger =   game_mode() != gm_practice &&
                        game_mode() != gm_neogeo_mode &&
                        game_is_fighting() == true &&
                        p1_only() &&
                        macro_protection() &&
                        p1_current_char() == characters["Athena"] &&
                        p1_moves() == 0x90
            )

achievement("Roaring Sphere", "Clark: Hit your opponent with all hits from Max 2 on Arcade Mode.", 10,
            trigger =   game_mode() != gm_practice &&
                        game_mode() != gm_neogeo_mode &&
                        game_is_fighting() == true &&
                        p1_only() &&
                        macro_protection() &&
                        p1_current_char() == characters["Clark"] &&
                        p1_moves() == 0x209
            )

achievement("Ryoku Ranbu: Destroy", "Ryo: Hit your opponent with Ryuko Ranbu: Destroy (Geki Ryuuko Ranbu) on Arcade or Practice.", 10,
            trigger =   game_mode() != gm_neogeo_mode &&
                        game_is_fighting() == true &&
                        p1_only() &&
                        macro_protection() &&
                        p1_current_char() == characters["Ryo"] &&
                        p1_moves() == 0x1ed
            )