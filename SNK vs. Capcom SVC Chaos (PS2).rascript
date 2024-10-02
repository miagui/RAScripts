// SNK vs. Capcom: SVC Chaos
// #ID = 20826

function settings_rounds_wins() => byte(0x8CD0C8)
function settings_exceed_2p() => byte(0x8CD0D8)
function settings_exceed_1p() => byte(0x8CD0E0)
function settings_power_gauge_2p() => byte(0x8CD0E8)
function settings_power_gauge_1p() => byte(0x8CD0F0)
function settings_difficulty() => byte(0x8CD110)

function settings_default_and_normal_diff() {
    return(
        settings_difficulty() >= 2 &&
        settings_rounds_wins() == 1 &&
        settings_exceed_2p() == 0 &&
        settings_exceed_1p() == 0 &&
        settings_power_gauge_2p() == 0 &&
        settings_power_gauge_1p() == 0
    )
}

function settings_default_and_expert_diff() {
    return(
        settings_difficulty() == 7 &&
        settings_rounds_wins() == 1 &&
        settings_exceed_2p() == 0 &&
        settings_exceed_1p() == 0 &&
        settings_power_gauge_2p() == 0 &&
        settings_power_gauge_1p() == 0
    )
    
}

function game_context() => byte(0x8C8110)

function game_mode() => byte(0x8D0C28)
function game_players_active() => word(0x8D0CD0)

function game_arcade_match() => byte(0x8D0D10)
function game_arcade_timer() => tbyte(0x8DFF9C)
function game_stage() => byte(0x8D0D18)
function game_continues_services_active() => byte(0x8CCF18)
function game_continues_services() => byte(0x8CCF20)

function round_state_flags() => byte(0x8D0C58)
function round_timer() => byte(0x8D0C78)

function p1_hp() => word(0x8DFFD8)
function p2_hp() => word(0x8E0258)

function p1_character() => byte(0x8d0c0c)
function p2_character() => byte(0x8d0bdc)

function p1_active_state() => byte(0x8c8100)
function p2_active_state() => byte(0x8c8101)

function p1_wins() => byte(0x8CD218)
function p2_wins() => byte(0x8CD210)

function p1_rounds_wins() => byte(0x8d0c10)
function p2_rounds_wins() => byte(0x8d0be0)
function p2_rounds_losses() => byte(0x8D0BD3)
function p1_rounds_losses() => byte(0x8D0C03)

function p1_victory_1_win_type() => lower4(0x8D0C14)
function p1_victory_2_win_type() => lower4(0x8D0C15)
function p1_victory_3_win_type() => lower4(0x8D0C16)
         victory_type_normal_move = 0x01
         victory_type_special_move = 0x02
         victory_type_super_move = 0x03
         victory_type_exceed_move = 0x04

function p1_hit_combo() => byte(0x8e02d0)
function p1_super_move() => bit0(0x8dff83)
function p1_move_cancelled() => bit3(0x8dff80)
function p1_exceed_move() => bit0(0x8DFF85)

characters = {
   "Kyo": 0,
   "Iori": 1,
   "Ryo": 2,
   "Terry": 3,
   "Mai": 4,
   "Kasumi": 5,
   "Kim": 6,
   "Mr. Karate": 7,
   "Choi": 8,
   "Earthquake": 9,
   "Genjuro": 10,
   "Shiki": 11,
   "Geese": 12,
   "Mars People": 13,
   "Goenitz": 14,
   "Athena": 15,
   "Ryu": 16,
   "Ken": 17,
   "Chun-Li": 18,
   "Guile": 19,
   "Dhalsim": 20,
   "Balrog (Boxer)": 21,
   "Vega (Claw)": 22,
   "Sagat": 23,
   "M. Bison (Dictator)": 24,
   "Akuma": 25,
   "Hugo": 26,
   "Tessa": 27,
   "Zero": 28,
   "Demitri": 29,
   "Dan": 30,
   "Red Arremer": 31,
   "Orochi Iori": 32,
   "Serious Mr. Karate": 33,
   "Violent Ken": 34,
   "Shin Akuma": 35
}

// =========================================
//                  Utility              
// =========================================

function is_arcade() => game_mode() == 0x00

function p1_only() => never(game_players_active() > 1) && game_players_active() == 1
function in_game() => word(0x8c8100) > 0
function in_game_2() => word(0x8d0d70) == 2
function outside_game() => word(0x8c8100) == 0

function arcade_match_won() => game_arcade_match() > prev(game_arcade_match())
function stage_8_beaten() => game_arcade_match() == 8 && prev(game_arcade_match()) == 7




// =========================================
//                   Arcade              
// =========================================

function achiev_arcade_char(title, char_name) {
    achievement(title, format("Reach and defeat the boss from the 8th stage using only {0} (default settings).", char_name), 10,
                trigger =   is_arcade() &&
                            p1_only() &&
                            never(outside_game()) &&
                            p1_character() == characters[char_name] &&
                            once(game_players_active() == 1 && game_arcade_match() == 0 && in_game_2()) &&
                            never(p1_character() != characters[char_name] && p1_rounds_wins() > prev(p1_rounds_wins())) &&
                            settings_default_and_normal_diff() &&
                            trigger_when(stage_8_beaten())
                )
}

achiev_arcade_char("Kyo Kusanagi", "Kyo")
achiev_arcade_char("Iori Yagami", "Iori")
achiev_arcade_char("Ryo Sakazaki", "Ryo")
achiev_arcade_char("Terry Bogard", "Terry")
achiev_arcade_char("Mai Shiranui", "Mai")
achiev_arcade_char("Kasumi Todoh", "Kasumi")
achiev_arcade_char("Kim Kaphwan", "Kim")
achiev_arcade_char("Mr. Karate", "Mr. Karate")
achiev_arcade_char("Choi Bounge", "Choi")
achiev_arcade_char("Earthquake", "Earthquake")
achiev_arcade_char("Genjuro Kibagami", "Genjuro")
achiev_arcade_char("Shiki", "Shiki")
achiev_arcade_char("Geese Howard", "Geese")
achiev_arcade_char("Mars People", "Mars People")
achiev_arcade_char("Goenitz", "Goenitz")
achiev_arcade_char("Goddess Athena", "Athena")
achiev_arcade_char("Ryu", "Ryu")
achiev_arcade_char("Ken Masters", "Ken")
achiev_arcade_char("Chun-Li", "Chun-Li")
achiev_arcade_char("Guile", "Guile")
achiev_arcade_char("Dhalsim", "Dhalsim")
achiev_arcade_char("Balrog", "Balrog (Boxer)")
achiev_arcade_char("Vega", "Vega (Claw)")
achiev_arcade_char("Sagat", "Sagat")
achiev_arcade_char("M. Bison", "M. Bison (Dictator)")
achiev_arcade_char("Akuma", "Akuma")
achiev_arcade_char("Hugo", "Hugo")
achiev_arcade_char("Tessa", "Tessa")
achiev_arcade_char("Zero", "Zero")
achiev_arcade_char("Demitri Maximoff", "Demitri")
achiev_arcade_char("Dan Hibiki", "Dan")
achiev_arcade_char("Firebrand", "Red Arremer")
achiev_arcade_char("Orochi Iori", "Orochi Iori")
achiev_arcade_char("Honki ni Natta Mr. Karate", "Serious Mr. Karate")
achiev_arcade_char("Violent Ken", "Violent Ken")
achiev_arcade_char("Shin Akuma", "Shin Akuma")

function achiev_defeat_opponent_arcade(title, char_name, points) {
    achievement(title, format("Defeat {0} on Arcade mode (default settings).", char_name), points,
                trigger =   is_arcade() &&
                            p1_only() &&
                            never(outside_game()) &&
                            p2_character() == characters[char_name] &&
                            arcade_match_won() &&
                            settings_default_and_normal_diff()
                )
}

achiev_defeat_opponent_arcade("Ciel, a Shortcut, Please...", "Zero", 5)
achiev_defeat_opponent_arcade("Tonight I Make a Toast... With Your Blood!", "Demitri", 5)
achiev_defeat_opponent_arcade("Beep Boop Badda Bing!", "Mars People", 5)
achiev_defeat_opponent_arcade("Humph! I Thought as Much.", "Geese", 5)
achiev_defeat_opponent_arcade("Saikyo Groove!", "Dan", 3)
achiev_defeat_opponent_arcade("The Power of the Orochi...!", "Goenitz", 3)
achiev_defeat_opponent_arcade("You're a Complete Washout!", "Serious Mr. Karate", 5)
achiev_defeat_opponent_arcade("God and Devil Live in the Power of My Fists!", "Shin Akuma", 5)
achiev_defeat_opponent_arcade("Protector of Heaven", "Athena", 10)
achiev_defeat_opponent_arcade("Delish! Fresh Meat Always Tastes Best!", "Red Arremer", 25)


achievement("Netherworld Chaos", "Reach and defeat the boss from the 8th stage on Expert difficulty without using X/Triangle continue services (default settings)", 25,
                trigger =   is_arcade() &&
                            p1_only() &&
                            never(outside_game()) &&
                            once(game_players_active() == 1 && game_arcade_match() == 0 && in_game_2()) &&
                            never(game_continues_services() > 1) &&
                            settings_default_and_expert_diff() &&
                            trigger_when(game_arcade_match() == 8 && prev(game_arcade_match()) == 7)
                )

achievement("Run to the Dark", "Reach and defeat the boss from the 8th stage within 10 minutes (default settings)", 25,
                trigger =   is_arcade() &&
                            p1_only() &&
                            in_game_2() &&
                            never(outside_game()) &&
                            game_arcade_timer() <= 36000 &&
                            settings_default_and_normal_diff() &&
                            trigger_when(stage_8_beaten())
                )

// =========================================
//                Exceed Moves              
// =========================================

function achiev_exceed_move_char(char_name, title) {
    achievement(title, format("Hit the CPU with an Exceed move as {0} during Arcade or Survival.", char_name), 4,
                trigger =   p1_only() &&
                            game_mode() != 0x06 &&
                            p1_character() == characters[char_name] &&
                            p1_exceed_move() == 1 &&
                            p1_hit_combo() > prev(p1_hit_combo())
                )
}

function achiev_exceed_dmg_move_char(char_name, title) {
    achievement(title, format("Hit the CPU with an Exceed move as {0} during Arcade or Survival.", char_name), 5,
                trigger =   p1_only() &&
                            game_mode() != 0x06 &&
                            p1_character() == characters[char_name] &&
                            p1_exceed_move() == 1 &&
                            (
                                p2_hp() < prev(p2_hp()) ||
                                (p2_hp() >= 0x8000 && prev(p2_hp()) < 0x8000)
                            )
                )
}

achiev_exceed_move_char("Kyo", "Saishu Kessen Ougi: Mu Shiki")
achiev_exceed_dmg_move_char("Iori", "Chi no Bousou")
achiev_exceed_move_char("Ryo", "Tenchi Haou Ken")
// achiev_exceed_move_char("", "Rising Beat")
achiev_exceed_move_char("Mai", "Hissatsu Shinobi Bachi")
achiev_exceed_dmg_move_char("Kasumi", "Shingan Kazura Otoshi")
achiev_exceed_move_char("Kim", "Hou'ou Kyaku")
achiev_exceed_move_char("Mr. Karate", "Chou Haou Shikou Ken")
achiev_exceed_move_char("Choi", "Shakushi")
achiev_exceed_move_char("Earthquake", "Fat Carnival")
achiev_exceed_move_char("Genjuro", "Ikari Bakuha")
achiev_exceed_move_char("Shiki", "Shikiju")
// achiev_exceed_move_char("", "Deadly Rave")
achiev_exceed_move_char("Mars People", "Tungus Incident")
achiev_exceed_move_char("Goenitz", "Shin Yaotome: Mizuchi")
achiev_exceed_move_char("Athena", "Pegasus Fantasy")
achiev_exceed_move_char("Ryu", "Shin Shouryuuken")
achiev_exceed_move_char("Ken", "Shinryuken")
achiev_exceed_move_char("Chun-Li", "Hazan Tenshou Kyaku")
achiev_exceed_move_char("Guile", "Sonic Hurricane")
achiev_exceed_move_char("Dhalsim", "Yoga Legend")
achiev_exceed_move_char("Balrog (Boxer)", "Ultimate Wild Smash")
achiev_exceed_move_char("Vega (Claw)", "Red Impact")
achiev_exceed_move_char("Sagat", "Tiger Genocide")
achiev_exceed_move_char("M. Bison (Dictator)", "Final Psycho Crusher")
achiev_exceed_dmg_move_char("Akuma", "Shun Goku Satsu")
achiev_exceed_dmg_move_char("Hugo", "Gigas Breaker")
achiev_exceed_move_char("Tessa", "Meteo Fall")
achiev_exceed_move_char("Zero", "Cyber Elf Force")
achiev_exceed_move_char("Demitri", "Demon Flare")
achiev_exceed_dmg_move_char("Dan", "Otoko Michi")
achiev_exceed_move_char("Red Arremer", "Suppertime")
achiev_exceed_dmg_move_char("Orochi Iori", "???!")
achiev_exceed_move_char("Serious Mr. Karate", "Chou Ryuuko Ranbu")
achiev_exceed_move_char("Violent Ken", "Shinbu Messatsu")
achiev_exceed_move_char("Shin Akuma", "Misogi")