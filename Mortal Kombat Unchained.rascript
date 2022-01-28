// Mortal Kombat: Unchained
// #ID = 3951

// $C18FCC: Game - Battle
//          
//          Works for both Arcade and Puzzle Kombat.
//          
//          0x05 = [Puzzle] Last Battle
//          0x07 = [Arcade] Last Battle (Onaga)
function game_battle() => byte(0xC18FCC)

// $D953B4: Game - State
//          
//          0x01 = Select Your Character
//          0x02 = Playing
function game_state() => byte(0xD953B4)

// $D953BA: P1 - HP [16-bits]
//          
//          0x3f80 = Full
//          0x3c00 = No HP
//          0x0000 = Dead
function p1_hp() => word(0xD953BA)

// $D953EC: P1 - Rounds Wins
function p1_rounds_wins() => byte(0xD953EC)

function p1_puzzle_wins() => byte(0xd953f4)

function p1_wins() => byte(0xd953f0)

// $D95400: P1 - Character
function p1_char() => byte(0xD95400)

// $D95426: P2 - HP [16-bits]
//          
//          0x3f80 = Full
//          0x3c00 = No HP
//          0x0000 = Dead
function p2_hp() => word(0xD95426)

// $D95430: Pointer - Puzzle Kombat Block
function pointer_puzzle_kombat() => tbyte(0xD95430)

function p1_puzzle_rounds_wins() => byte(0xFBD8AC + pointer_puzzle_kombat())

// $D95458: P2 - Rounds Wins
function p2_rounds_wins() => byte(0xD95458)

// $D9546C: P2 - Character
function p2_char() => byte(0xD9546C)

// $D954F0: Round - Time
function round_time() => byte(0xD954F0)

// $D95898: Game - Game Mode
//          
//          0x00 = Arcade
//          0x03 = Managing a Profile
//          0x04 = Practice
//          0x05 = Gallery
//          0x06 = Puzzle Kombat
//          0x07 = Konquest
//          0x08 = Konquest (Fighting)
//          0x09 = Chess Kombat (Chess Board)
//          0x0a = Chess Kombat (Fighting)
//          0x0b = The Krypt
//          0x0c = Chess Kombat (Win Screen)
//          0x0d = Endurance
//          0x0e = Main Menu
function game_mode() => byte(0xD95898)

// $D95D78: Settings - Kombat CPU (Difficulty)
//          
//          0x00 = Novice
//          0x01 = Easy
//          0x02 = Medium (Default)
//          0x03 = Hard
//          0x04 = Max
function s_kombat_cpu() => byte(0xD95D78)

// $D95D7C: Settings - Chess CPU (Difficulty)
//          
//          0x00 = Novice
//          0x01 = Easy
//          0x02 = Medium (Default)
//          0x03 = Hard
//          0x04 = Max
function s_chess_cpu() => byte(0xD95D7C)

// $D95D80: Settings - Puzzle CPU (Difficulty)
//          
//          0x00 = Novice
//          0x01 = Easy
//          0x02 = Medium (Default)
//          0x03 = Hard
//          0x04 = Max
function s_puzzle_cpu() => byte(0xD95D80)

// $D95D84: Settings - Rounds To Win
//          
//          0x02 is default.
function s_rounds_to_win() => byte(0xD95D84)

// $D95D88: Settings - Puzzle Rounds
//          
//          0x02 is default
function s_puzzle_rounds() => byte(0xD95D88)

// $D95D8C: Settings - Round Time
//          
//          0x3c is default.
function s_round_time() => byte(0xD95D8C)


char_kombat = {
   "Scorpion": 0,
   "Baraka": 1,
   "Sub-Zero": 3,
   "Mileena": 4,
   "Nightwolf": 5,
   "Ermac": 6,
   "Ashrah": 7,
   "Sindel": 8,
   "Li Mei": 9,
   "Bo' Rai Cho": 10,
   "Hotaru": 11,
   "Kenshi": 12,
   "Havik": 14,
   "Tanya": 15,
   "Liu Kang": 16,
   "Kira": 18,
   "Kabal": 19,
   "Kobra": 20,
   "Jade": 21,
   "Dairou": 22,
   "Raiden": 23,
   "Darrius": 24,
   "Shujinko": 25,
   "Noob - Smoke": 27,
   "Goro": 30,
   "Shao Kahn": 31,
   "Frost": 32,
   "Kitana": 33,
   "Jax": 34,
   "Blaze": 35,
}

char_title = {
   "Scorpion": "True Champion of the Elder Gods",
   "Baraka": "Tarkatan Blood",
   "Sub-Zero": "Ice Mastery",
   "Mileena": "Princess Mileena",
   "Nightwolf": "Free of Corruption",
   "Ermac": "Noble Outcome",
   "Ashrah": "Demon Huntress",
   "Sindel": "Edenia Queen",
   "Li Mei": "Corrupted For the Emperor",
   "Bo' Rai Cho": "Drunken Kombat",
   "Hotaru": "Justice of the Dragon King",
   "Kenshi": "Sense of Sight",
   "Havik": "Chaos Restorer",
   "Tanya": "Forever a Traitor",
   "Liu Kang": "Protector of Earthrealm",
   "Kira": "Anarchy Seeker",
   "Kabal": "Black Dragon Rise",
   "Kobra": "Ken Masters",
   "Jade": "Edenia Savior",
   "Dairou": "Former Seido Guard",
   "Raiden": "Wraith of the Thunder God",
   "Darrius": "Seido Revolutionary",
   "Shujinko": "Protagonist",
   "Noob - Smoke": "Ruler of the Netherrealm",
   "Goro": "Shokan Rules",
   "Shao Kahn": "Long Live Emperor Shao Kahn!",
   "Frost": "Apprentice's Revenge",
   "Kitana": "Unending Conflict",
   "Jax": "Raw Anger",
   "Blaze": "The Monitor",
}

char_puzzle = {
   "Scorpion": 0,
   "Baraka": 1,
   "Sub-Zero": 3,
   "Mileena": 4,
   "Nightwolf": 5,
   "Ermac": 6,
   "Sindel": 8,
   "Bo' Rai Cho": 10,
   "Kenshi": 12,
   "Kabal": 19,
   "Jade": 21,
   "Raiden": 23,
}

char_puzzle_title = {
   "Scorpion": "Jumble",
   "Baraka": "Edger",
   "Sub-Zero": "Freeze",
   "Mileena": "Drill",
   "Nightwolf": "Breaker Buster",
   "Ermac": "Levitate",
   "Sindel": "Arrange",
   "Bo' Rai Cho": "Collapse",
   "Kenshi": "Invisible",
   "Kabal": "Double Bomb",
   "Jade": "Stack",
   "Raiden": "Storm",
}

for character in char_kombat {
    achievement(title = char_title[character],
                description = format("Finish Arcade mode using only {0} (Medium Kombat CPU, Round Time 60).", character), 
                points = 5, 
                trigger =   never(p1_char() != char_kombat[character] && game_state() == 0x02) && 
                            never(game_mode() != 0x00) &&
                            once(game_battle() == 0x00) &&
                            p1_char() == char_kombat[character] &&
                            trigger_when(game_battle() == 0x07 &&
                                         game_state() == 0x02 &&
                                         p1_wins() > prev(p1_wins())) &&
                            s_kombat_cpu() >= 0x02 &&
                            s_round_time() >= 60
               )
}

for character in char_puzzle {
    achievement(title = char_puzzle_title[character],
                description = format("Finish Puzzle Kombat using only {0}.", character), 
                points = 10, 
                trigger =   never(p1_char() != char_kombat[character] && game_state() == 0x02) && 
                            never(game_mode() != 0x06) &&
                            once(game_battle() == 0x00) &&
                            p1_char() == char_puzzle[character] &&
                            trigger_when(p1_puzzle_wins() > prev(p1_puzzle_wins()) &&
                                         game_battle() == 0x05 && 
                                         game_state() == 0x02)
               )
}











