// Mortal Kombat II
// #ID = 17727

// =========================================
//              Memory Acessors              
// =========================================

function game_difficulty() => byte(0x1BDB44)
function game_state() => byte(0x1BE1B4)
         gs_fighting = 0x02
         gs_selecting_character = 0x04
         gs_prefight_setup = 0x06

function ladder_battle() => byte(0x1BEA98)

function fight_finishing_move() => byte(0x1be7a4)
         finishing_fatality_1 = 1
         finishing_fatality_2 = 2 
         finishing_fatality_3 = 3
         finishing_babality =  5
         finishing_friendship = 7
         finishing_pit2 = 6 
         finishing_kombat_tomb = 8

function p1_state() => word(0x1BDB62)
function p2_state() => byte(0x1BDCF6)
         ps_inactive = 0x00
         ps_fighting = 0x01
         ps_selecting_character = 0x03
         ps_character_selected = 0x04

function p1_character() => byte(0x1BDB6A)
function p1_hp() => word(0x1BDB70)
function p1_consecutive_rounds() => word(0x1BDB7A)
function p1_consecutive_matches() => word(0x1BDB7E)
function p1_rounds_wins() => word(0x1BDB86)
function p1_flawless_flag() => byte(0x1BDB8A)

function p2_character() => byte(0x1BDCFE)
function p2_hp() => word(0x1BDD04)
function p2_rounds_wins() => word(0x1bdd1a)

characters = {
    "Kung Lao": 0x00,
    "Liu Kang": 0x01,
    "Cage": 0x02,
    "Baraka": 0x03,
    "Kitana": 0x04,
    "Mileena": 0x05,
    "Shang Tsung": 0x06,
    "Rayden": 0x07,
    "Sub-Zero": 0x08,
    "Reptile": 0x09,
    "Scorpion": 0x0a,
    "Jax": 0x0b,
    "Kintaro": 0x0c,
    "Shao Kahn": 0x0d,
    "Smoke": 0x0e,
    "Noob Saibot": 0x0f,
    "Jade": 0x10
}

// =========================================
//             Utility Functions              
// =========================================

function game_beaten() => ladder_battle() == 0x0e && p2_character() == characters["Shao Kahn"] && p1_rounds_wins() == 2 && prev(p1_rounds_wins()) == 1
function p1_only() => p1_state() > 0 && p2_state() == ps_inactive

// =========================================
//               Beat The Game              
// =========================================

function achiev_beat_the_game(name, cheevo_id) {
    achievement(name, format("Beat the game using only {0}.", name), 10,
                trigger =   once(p1_character() == characters[name] && p1_state() == ps_character_selected && ladder_battle() == 0x00) &&
                            never(p1_character() != characters[name] && p1_state() == ps_character_selected) &&
                            p1_character() == characters[name] &&
                            p1_only() &&
                            trigger_when(game_beaten()) 
                )
}

achiev_beat_the_game("Kung Lao", 0)
achiev_beat_the_game("Liu Kang", 0)
achiev_beat_the_game("Cage", 0)
achiev_beat_the_game("Baraka", 0)
achiev_beat_the_game("Kitana", 0)
achiev_beat_the_game("Mileena", 0)
achiev_beat_the_game("Shang Tsung", 0)
achiev_beat_the_game("Rayden", 0)
achiev_beat_the_game("Sub-Zero", 0)
achiev_beat_the_game("Reptile", 0)
achiev_beat_the_game("Scorpion", 0)
achiev_beat_the_game("Jax", 0)

achievement("MK2 Champion", "Beat the game on Very Hard.", 10,
            trigger =   game_difficulty() == 0x04 &&
                        p1_only() &&
                        trigger_when(game_beaten()))

achievement("MK2 1CC", "Beat the game without using continues.", 25,
            trigger =   once(p1_state() == ps_character_selected && ladder_battle() == 0x00) &&
                        never(p2_rounds_wins() == 2) &&
                        p1_only() &&
                        trigger_when(game_beaten()))

// =========================================
//              Finishing Moves              
// =========================================

function achiev_finishing_move(title, name, cheevo_id) {
    achievement(title, format("Perform any finishing move as {0}.", name), 2,
                trigger =   p1_character() == characters[name] &&
                            p1_hp() > 0 &&
                            p2_hp() == 0 &&
                            fight_finishing_move() == 0xFF && prev(fight_finishing_move()) != 0xFF &&
                            p1_only()
                )
}

achiev_finishing_move("Body Slice", "Kung Lao", 0)
achiev_finishing_move("Dragon Morph", "Liu Kang", 0)
achiev_finishing_move("Deadly Uppercut", "Cage", 0)
achiev_finishing_move("Blade Lift", "Baraka", 0)
achiev_finishing_move("Kiss of Death", "Kitana", 0)
achiev_finishing_move("Man Eater", "Mileena", 0)
achiev_finishing_move("Soul Steal", "Shang Tsung", 0)
achiev_finishing_move("Electrocution", "Rayden", 0)
achiev_finishing_move("Deep Freeze", "Sub-Zero", 0)
achiev_finishing_move("Hidden Chomp", "Reptile", 0)
achiev_finishing_move("Spear Slice", "Scorpion", 0)
achiev_finishing_move("Head Clap", "Jax", 0)

achievement("Fatality", "Perform a Fatality.", 2,
            trigger =   p1_hp() > 0 &&
                        p2_hp() == 0 &&
                        p1_only() &&
                        (
                            (fight_finishing_move() == 0xFF && prev(fight_finishing_move()) == finishing_fatality_1) ||
                            (fight_finishing_move() == 0xFF && prev(fight_finishing_move()) == finishing_fatality_2) ||
                            (fight_finishing_move() == 0xFF && prev(fight_finishing_move()) == finishing_fatality_3)
                        )
            )

achievement("Babality", "Perform a Babality.", 2,
            trigger =   p1_hp() > 0 &&
                        p2_hp() == 0 &&
                        p1_only() &&
                        fight_finishing_move() == 0xFF && prev(fight_finishing_move()) == finishing_babality
            )

achievement("Friendship", "Perform a Friendship.", 2,
            trigger =   p1_hp() > 0 &&
                        p2_hp() == 0 &&
                        p1_only() &&
                        fight_finishing_move() == 0xFF && prev(fight_finishing_move()) == finishing_friendship
            )
achievement("Dead Pool", "Perform a Stage Fatality on Dead Pool.", 2,
            trigger =   p1_hp() > 0 &&
                        p2_hp() == 0 &&
                        p1_only() &&
                        fight_finishing_move() == 0xFF && prev(fight_finishing_move()) == 0x00
            )

achievement("Kombat Tomb", "Perform a Stage Fatality on Kombat Tomb.", 2,
            trigger =   p1_hp() > 0 &&
                        p2_hp() == 0 &&
                        p1_only() &&
                        fight_finishing_move() == 0xFF && prev(fight_finishing_move()) == finishing_kombat_tomb
            )

achievement("The Pit II", "Perform a Stage Fatality on The Pit II.", 2,
            trigger =   p1_hp() > 0 &&
                        p2_hp() == 0 &&
                        p1_only() &&
                        fight_finishing_move() == 0xFF && prev(fight_finishing_move()) == finishing_pit2
            )


achievement("Kintaro Morph", "As Shang Tsung, transform into Kintaro and finish off your opponent.", 3,
            trigger =   p1_hp() > 0 &&
                        p2_hp() == 0 &&
                        p1_only() &&
                        fight_finishing_move() == 0xFF && prev(fight_finishing_move()) == finishing_fatality_3
            )
                        

// =========================================
//               Secret Fights              
// =========================================

achievement("Find Smoke", "Find Smoke.", 5,
            trigger =   p2_character() == characters["Smoke"] &&
                        game_state() > 1 &&
                        p1_only()) 

achievement("Find Noob", "Find Noob.", 5,
            trigger =   p2_character() == characters["Noob Saibot"] &&
                        game_state() > 1 &&
                        p1_only()) 

achievement("Find Jade", "Find Jade.", 5,
            trigger =   p2_character() == characters["Jade"] &&
                        game_state() > 1 &&
                        p1_only()) 



achievement("Defeat Smoke", "Defeat Smoke.", 10,
            trigger =   p2_character() == characters["Smoke"] &&
                        p1_rounds_wins() == 2 && prev(p1_rounds_wins()) == 1 &&
                        game_state() > 1 &&
                        p1_only()) 

achievement("Defeat Noob", "Defeat Noob.", 10,
            trigger =   p2_character() == characters["Noob Saibot"] &&
                        p1_rounds_wins() == 2 && prev(p1_rounds_wins()) == 1 &&
                        game_state() > 1 &&
                        p1_only()) 

achievement("Defeat Jade", "Defeat Jade.", 10,
            trigger =   p2_character() == characters["Jade"] &&
                        p1_rounds_wins() == 2 && prev(p1_rounds_wins()) == 1 &&
                        game_state() > 1 &&
                        p1_only()) 