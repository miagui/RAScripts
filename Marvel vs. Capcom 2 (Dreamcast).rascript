// Marvel vs. Capcom 2: New Age of Heroes
// #ID = 3452

function opt_difficulty() => byte(0x212bfc)
function opt_time() => byte(0x212bfd)
function opt_damage() => byte(0x212bfe)

function game_state() => byte(0x268240)
function game_complementary_state() => word(0x268242)
function game_players_active() => byte(0x268258)
function game_mode() => byte(0x26828c)
function game_match_ladder() => byte(0x2682c1)

function round_state() => byte(0x2895f0)
// 0x02 = Starting Round (Poses)
// 0x03 = Starting Round (Waiting)
// 0x04 = Fighting
// 0x05 = K.O.
// 0x06 = Win Message
// 0x08 = Results
// 0x09 = Freeze; transitioning to next match

function round_victory_flag() => byte(0x28962e)
// 0x00 = P1
// 0x01 = P2

function p1_combo() => byte(0x28963e)

function p1_slot1_assist_state() => byte(0x268596)
function p1_slot2_assist_state() => byte(0x2690de)
function p1_slot3_assist_state() => byte(0x269c26)

function p1_slot1_char() => byte(0x26886c)
function p1_slot2_char() => byte(0x2693b4)
function p1_slot3_char() => byte(0x269efc)

function p1_slot1_aircombo_knocked_flag() => byte(0x2685b2) == 0x01
function p1_slot2_aircombo_knocked_flag() => byte(0x2690fa) == 0x01
function p1_slot3_aircombo_knocked_flag() => byte(0x269c42) == 0x01

function p1_slot1_active_flag() => byte(0x268340) == 0x01
function p1_slot2_active_flag() => byte(0x268e88) == 0x01
function p1_slot3_active_flag() => byte(0x2699d0) == 0x01

chars = {
   "Ryu": 0,
   "Zangief": 1,
   "Guile": 2,
   "Morrigan": 3,
   "Anakaris": 4,
   "Strider Hiryu": 5,
   "Cyclops": 6,
   "Wolverine (Adamantium)": 7,
   "Psylocke": 8,
   "Iceman": 9,
   "Rogue": 10,
   "Captain America": 11,
   "Spider-Man": 12,
   "Hulk": 13,
   "Venom": 14,
   "Doctor Doom": 15,
   "Tron Bonne": 16,
   "Jill": 17,
   "Hayato": 18,
   "Ruby Heart": 19,
   "Sonson": 20,
   "Amingo": 21,
   "Marrow": 22,
   "Cable": 23,
   "Abyss 1st Form": 24,
   "Abyss 2nd Form": 25,
   "Abyss 3rd Form": 26,
   "Chun-Li": 27,
   "Mega Man": 28,
   "Roll": 29,
   "Akuma": 30,
   "B.B. Hood": 31,
   "Felicia": 32,
   "Charlie": 33,
   "Sakura": 34,
   "Dan": 35,
   "Cammy": 36,
   "Dhalsim": 37,
   "M. Bison": 38,
   "Ken": 39,
   "Gambit": 40,
   "Juggernaut": 41,
   "Storm": 42,
   "Sabretooth": 43,
   "Magneto": 44,
   "Shuma-Gorath": 45,
   "War Machine": 46,
   "Silver Samurai": 47,
   "Omega Red": 48,
   "Spiral": 49,
   "Colossus": 50,
   "Iron Man": 51,
   "Sentinel": 52,
   "Blackheart": 53,
   "Thanos": 54,
   "Jin": 55,
   "Captain Commando": 56,
   "Wolverine (Bone)": 57,
   "Servbot": 58
}

// function team_hardest_difficulty(char1, char2, char3, team_title) {
//     achievement(title = team_title,
//                 description = format("Beat the game in Arcade Mode with {0}, {1} and {2} on the hardest difficulty (Damage 2, Time 99).", char1, char2, char3), 
//                 points = 10, 
//                 trigger =   game_state() == 0x02 &&
//                             game_players_active() == 0x01 &&
//                             game_mode() == 0x00 &&
//                             unless(game_state() == 0x02 && game_complementary_state() != 0x0302) &&
//                             opt_difficulty() == 0x07 &&
//                             opt_damage() == 0x01 &&
//                             opt_time() == 0x02 &&
//                             trigger_when(round_state() == 0x08 &&
//                             round_victory_flag() == 0x00 &&
//                             game_match_ladder() == 0x07) &&
//                             once(game_match_ladder() == 0x00) &&
                            
//                             never(p1_slot1_char() != chars[char1] &&
//                                   p1_slot1_char() != chars[char2] &&
//                                   p1_slot1_char() != chars[char3]) &&
                                  
//                             never(p1_slot2_char() != chars[char1] &&
//                                   p1_slot2_char() != chars[char2] &&
//                                   p1_slot2_char() != chars[char3]) &&
                                  
//                             never(p1_slot3_char() != chars[char1] &&
//                                   p1_slot3_char() != chars[char2] &&
//                                   p1_slot3_char() != chars[char3])
//                )
// }

// team_hardest_difficulty("Mega Man", "Roll", "Tron Bonne", "Team Mega Man")
// team_hardest_difficulty("Ryu", "Ken", "Akuma", "Team Shoto")
// team_hardest_difficulty("Jill", "Ryu", "Mega Man", "Team Capcom Stars")
// team_hardest_difficulty("Guile", "Charlie", "Captain America", "Team American Soldiers")
// team_hardest_difficulty("Iron Man", "War Machine", "Sentinel", "Team Iron Fist")
// team_hardest_difficulty("Ruby Heart", "Captain Commando", "Captain America", "Team Captains")
// team_hardest_difficulty("Colossus", "Hulk", "Juggernaut", "Team Big Guys")
// team_hardest_difficulty("Zangief", "Colossus", "Omega Red", "Team Communism")
// team_hardest_difficulty("M. Bison", "Magneto", "Thanos", "Team Badass Bosses")
// team_hardest_difficulty("Morrigan", "Felicia", "B.B. Hood", "Team Darkstalker Gals")
// team_hardest_difficulty("Dhalsim", "Anakaris", "Spiral", "Team Stretchy")
// team_hardest_difficulty("Wolverine (Bone)", "Wolverine (Adamantium)", "Sabretooth", "Team Weapon X")
// team_hardest_difficulty("Strider Hiryu", "Silver Samurai", "Psylocke", "Team Feudal Warriors")
// team_hardest_difficulty("Ruby Heart", "Amingo", "Sonson", "Team New Heroes")
// team_hardest_difficulty("Psylocke", "Rogue", "Storm", "Team X-Women")
// team_hardest_difficulty("Cyclops", "Iceman", "Wolverine (Adamantium)", "Team Children of the Atom")
// team_hardest_difficulty("Gambit", "Rogue", "Sabretooth", "Team X-Men Vs. SF")
// team_hardest_difficulty("Akuma", "Venom", "Blackheart", "Team Edgy")
// team_hardest_difficulty("Cable", "Marrow", "Psylocke", "Team X-Force Vol. 4")
// team_hardest_difficulty("Captain America", "Hulk", "Iron Man", "Team Avengers")
// team_hardest_difficulty("Shuma-Gorath", "Spiral", "Blackheart", "Team Extra-Dimensional Forces")
// team_hardest_difficulty("Spider-Man", "Spider-Man", "Spider-Man", "Team No Way Home")
// team_hardest_difficulty("Jin", "Hayato", "Strider Hiryu", "Team Arcade Protagonists")
// team_hardest_difficulty("Cammy", "Morrigan", "Psylocke", "Team Femme Fatale")
// team_hardest_difficulty("Charlie", "Dan", "Sakura", "Team Alpha")
// team_hardest_difficulty("Ryu", "Guile", "Zangief", "Team World Warrior")
// team_hardest_difficulty("Chun-Li", "Sakura", "Cammy", "Team SF Gals")
// team_hardest_difficulty("Tron Bonne", "Servbot", "Servbot", "Team Tron-Bonne")
// team_hardest_difficulty("B.B. Hood", "Jill", "Cable", "Team Armed to the Teeth")
// team_hardest_difficulty("Roll", "Servbot", "Dan", "Team Troll Tier")


for char in chars {
   achievement(title = format("Aerial Rave - {0}", char) ,
               description = format("Perform a 7-hit Magic Series Air Combo as {0} (no assists).", char), 
               points = 3, 
               trigger = game_state() == 0x02 &&
                         game_players_active() == 0x01 &&
                         once(p1_combo() == 1 && prev(p1_combo()) == 0) &&
                         never(p1_slot1_assist_state() == 0x07) &&
                         never(p1_slot2_assist_state() == 0x07) &&
                         never(p1_slot3_assist_state() == 0x07) &&
                         never(p1_slot1_assist_state() == 0x0b) &&
                         never(p1_slot2_assist_state() == 0x0b) &&
                         never(p1_slot3_assist_state() == 0x0b) &&
                         p1_combo() >= 0x07 &&
                         (
                         (p1_slot1_char() == chars[char] && p1_slot1_active_flag() && p1_slot1_aircombo_knocked_flag()) ||
                         (p1_slot2_char() == chars[char] && p1_slot2_active_flag() && p1_slot2_aircombo_knocked_flag()) ||
                         (p1_slot3_char() == chars[char] && p1_slot3_active_flag() && p1_slot3_aircombo_knocked_flag())
                         )
          
  )
}
    
    

    










