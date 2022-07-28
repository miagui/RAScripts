// Marvel vs. Capcom: Clash of Super Heroes
// #ID = 11314

function game_mode() => byte(0x07B6F4)
function game_score() => dword(0x07C168)
function game_mode_select() => byte(0x07C16D)
function game_stage() => byte(0x07BDF2)

function game_versus_flag() => byte(0x07CAFB)
function game_ending_flag() => byte(0x07CF10)

function options_difficulty() => byte(0x07B71C)

function p1_character() => byte(0x07B8AA)
function p1_ryu_form() => byte(0x07B8E4)
function p1_state() => byte(0x07BDC8)

function p1_hp() => byte(0x07C124)
function p1_hit_combo() => byte(0x07C828)

function p1_round_1_flag() => byte(0x07B770)
function p1_round_2_flag() => byte(0x07B772)

function p1_rounds() => byte(0x07B82A)
function p2_rounds() => byte(0x07B82B)

function p2_hp() => byte(0x07C534)

function match_overkill_flag() => byte(0x07B84C)

achievement(
    title = "Brave Example", description = "Finish Battle mode with Ryu your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112445, badge = "122867", published = "05/06/2020 20:57:30", modified = "05/06/2020 23:32:26",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 18 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Boiling Delicacy", description = "Finish Battle mode with Chun-Li your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112446, badge = "122871", published = "05/06/2020 20:57:34", modified = "05/06/2020 20:57:34",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 22 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Uncontrollable Wrestler", description = "Finish Battle mode with Zangief your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112447, badge = "122876", published = "05/06/2020 20:57:37", modified = "05/06/2020 20:57:37",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 26 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Lady Nightmare", description = "Finish Battle mode with Morrigan your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112448, badge = "122879", published = "05/06/2020 20:57:40", modified = "05/06/2020 20:57:40",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 30 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Space Adventurer", description = "Finish Battle mode with C.Commando your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112449, badge = "122880", published = "05/06/2020 20:57:43", modified = "05/06/2020 20:57:43",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 20 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Absorption Skills", description = "Finish Battle mode with Megaman your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112450, badge = "122882", published = "05/06/2020 20:57:45", modified = "05/06/2020 20:57:45",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 32 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Rebel Swordsman", description = "Finish Battle mode with Strider your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112451, badge = "122883", published = "05/06/2020 20:57:48", modified = "05/06/2020 20:57:48",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 28 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "With Great Responsibility", description = "Finish Battle mode with Spider-Man your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112452, badge = "122884", published = "05/06/2020 20:57:51", modified = "05/06/2020 20:57:51",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 14 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Illuminated Powers", description = "Finish Battle mode with Jin your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112453, badge = "122886", published = "05/06/2020 20:57:57", modified = "05/06/2020 20:57:57",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 24 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Patriarchal Warrior", description = "Finish Battle mode with C.America your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112454, badge = "122888", published = "05/06/2020 20:58:00", modified = "05/06/2020 20:58:00",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 4 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Cosmic Energy Parasite", description = "Finish Battle mode with Venom your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112455, badge = "122889", published = "05/06/2020 20:58:02", modified = "05/06/2020 20:58:02",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 12 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Brutamont Scientist", description = "Finish Battle mode with Hulk your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112456, badge = "122890", published = "05/06/2020 20:58:05", modified = "05/06/2020 20:58:05",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 6 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Masterful illusion", description = "Finish Battle mode with Gambit your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112457, badge = "122891", published = "05/06/2020 20:58:09", modified = "05/06/2020 20:58:09",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 10 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Battery Operable", description = "Finish Battle mode with W.Machine your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112458, badge = "122893", published = "05/06/2020 20:58:11", modified = "05/06/2020 20:58:11",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 2 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Immortal, however ... I'm X-MEN", description = "Finish Battle mode with Wolverine your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112459, badge = "122894", published = "05/06/2020 20:58:14", modified = "05/06/2020 20:58:14",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 8 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Reason for Becoming Dark", description = "Finish Battle mode with S.Lady your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112460, badge = "122896", published = "05/06/2020 20:58:17", modified = "05/06/2020 20:58:17",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 42 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Roll Roll-Chan", description = "Finish Battle mode with Roll your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112461, badge = "122897", published = "05/06/2020 20:58:22", modified = "05/06/2020 20:58:22",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 16 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Envy is my Strong Point", description = "Finish Battle mode with Lillity your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112462, badge = "122902", published = "05/06/2020 20:58:25", modified = "05/06/2020 20:58:25",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 44 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Golden Armor", description = "Finish Battle mode with A.W.Machine your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112463, badge = "122905", published = "05/06/2020 20:58:29", modified = "05/06/2020 20:58:29",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 40 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Alternative Prague", description = "Finish Battle mode with A.R.Venom your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112465, badge = "122920", published = "05/06/2020 20:58:36", modified = "05/06/2020 20:58:36",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 36 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Extremely Alternative", description = "Finish Battle mode with A.R.Hulk your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112466, badge = "122999", published = "05/06/2020 20:58:40", modified = "05/06/2020 20:58:40",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 38 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Just with the Look of Penance", description = "Finish Battle mode with Onslaught your main character [Option Default,Default difficulty or above, No Beginner Mode-Select]", points = 10,
    id = 112464, badge = "122918", published = "05/06/2020 20:58:32", modified = "05/06/2020 20:58:32",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && p1_character() == 34 && game_stage() >= 7 && 
              game_ending_flag() == 2
)

achievement(
    title = "Shinku Charged with Energy", description = "Finish the opponent with Hyper Ryu moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112467, badge = "123000", published = "05/06/2020 21:01:12", modified = "05/06/2020 23:32:20",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 18 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Kikosho", description = "Finish the opponent with Hyper Chun-Li moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112476, badge = "123010", published = "05/06/2020 21:01:34", modified = "05/06/2020 21:01:34",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 22 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Iron Body", description = "Finish the opponent with Hyper Zangief moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112481, badge = "123015", published = "05/06/2020 21:01:47", modified = "05/06/2020 21:01:47",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) &&
game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 26 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Eternal Slumber", description = "Finish the opponent with Hyper Morrigan moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112479, badge = "123013", published = "05/06/2020 21:01:42", modified = "05/06/2020 21:01:42",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 30 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Captain Beam", description = "Finish the opponent with Hyper C.Commando moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112475, badge = "123009", published = "05/06/2020 21:01:32", modified = "05/06/2020 21:01:32",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 20 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Magnetic Shockave", description = "Finish the opponent with Hyper Mega Man moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112478, badge = "123012", published = "05/06/2020 21:01:40", modified = "05/06/2020 21:01:40",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 32 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Ragnarok", description = "Finish the opponent with Hyper Strider moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112480, badge = "123014", published = "05/06/2020 21:01:45", modified = "05/06/2020 21:01:45",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 28 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Ultimate Web Throw", description = "Finish the opponent with Hyper Spider-Man moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112471, badge = "123005", published = "05/06/2020 21:01:22", modified = "05/06/2020 21:01:22",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 14 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Saotome Cyclone", description = "Finish the opponent with Hyper Jin moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112477, badge = "123011", published = "05/06/2020 21:01:37", modified = "05/06/2020 21:01:37",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 24 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Hyper Charging Star", description = "Finish the opponent with Hyper C.America moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112468, badge = "123001", published = "05/06/2020 21:01:15", modified = "05/06/2020 21:01:15",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 4 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Death Bite", description = "Finish the opponent with Hyper Venom moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112472, badge = "123006", published = "05/06/2020 21:01:24", modified = "05/06/2020 21:01:24",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 12 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Gamma Wave", description = "Finish the opponent with Hyper Hulk moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112470, badge = "123004", published = "05/06/2020 21:01:20", modified = "05/06/2020 21:01:20",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 6 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Royal Flush", description = "Finish the opponent with Hype Gambit moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112469, badge = "123003", published = "05/06/2020 21:01:17", modified = "05/06/2020 21:07:23",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 10 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Proton Cannon", description = "Finish the opponent with Hyper W.Machine moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112473, badge = "123007", published = "05/06/2020 21:01:26", modified = "05/06/2020 21:01:26",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 2 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Berserker Barrage X", description = "Finish the opponent with Hyper Wolverine moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112474, badge = "123008", published = "05/06/2020 21:01:29", modified = "05/06/2020 21:01:29",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 8 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Venom Web", description = "Finish the opponent with Hyper A.R.Venom moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112482, badge = "123016", published = "05/06/2020 21:01:50", modified = "05/06/2020 21:01:50",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 36 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "War Destroyer", description = "Finish the opponent with Hyper A.W.Machine moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112483, badge = "123017", published = "05/06/2020 21:01:53", modified = "05/06/2020 21:01:53",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 40 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Brilliant Shower", description = "Finish the opponent with Hyper Lilith moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112484, badge = "123018", published = "05/06/2020 21:01:55", modified = "05/06/2020 21:01:55",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 44 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Hulk Smash", description = "Finish the opponent with Hyper R.Hulk moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112485, badge = "123019", published = "05/06/2020 21:01:58", modified = "05/06/2020 21:01:58",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 38 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Hyper Roll", description = "Finish the opponent with Hyper Roll moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112486, badge = "123020", published = "05/06/2020 21:02:00", modified = "05/06/2020 21:02:00",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 16 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Sky Counter Crash", description = "Finish the opponent with Hyper S.Lady moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112487, badge = "123021", published = "05/06/2020 21:02:02", modified = "05/06/2020 21:02:02",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 42 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Galaxy Energy", description = "Finish the opponent with Hyper Onslaught moves [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112488, badge = "123022", published = "05/06/2020 21:02:05", modified = "05/06/2020 21:02:05",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && p1_character() == 34 &&
              ((p1_round_1_flag() == 6 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 6 && p1_rounds() == 2))
)

achievement(
    title = "Spiritual Rival", description = "Select Ryu in Ken form", points = 1,
    id = 112494, badge = "123172", published = "05/06/2020 21:10:58", modified = "06/06/2020 00:16:24",
    trigger = never(game_mode() != 0) && never(p1_state() != 1) && p1_ryu_form() == 2 && p1_character() == 18
)

achievement(
    title = "Spiritual Archrival", description = "Select Ryu in Akuma form", points = 1,
    id = 112495, badge = "123173", published = "05/06/2020 21:11:05", modified = "06/06/2020 00:16:35",
    trigger = never(game_mode() != 0) && never(p1_state() != 1) && p1_ryu_form() == 4 && p1_character() == 18
)

achievement(
    title = "No Mercy", description = "Perform an OverKill", points = 3,
    id = 112491, badge = "123174", published = "05/06/2020 21:09:08", modified = "05/06/2020 21:09:08",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && p1_rounds() == 2 && p2_hp() == 0 && 
              match_overkill_flag() == 2
)

achievement(
    title = "Breaking Defense Barriers", description = "Defeat your opponent while he defends [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112489, badge = "123175", published = "05/06/2020 21:08:57", modified = "05/06/2020 21:08:57",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && game_mode_select() <= 1 && p2_hp() == 0 &&
              ((p1_round_1_flag() == 1 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 1 && p1_rounds() == 2))
)

achievement(
    title = "Prohibiting Jumping", description = "Perform an Aerial finish [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112490, badge = "123288", published = "05/06/2020 21:09:03", modified = "05/06/2020 21:09:03",
    trigger = never(game_mode() != 0) && never(p1_state() != 1) && never(game_versus_flag() != 0) && game_mode_select()
               <= 1 && p2_hp() == 0 &&
              ((p1_round_1_flag() == 7 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 7 && p1_rounds() == 2))
)

achievement(
    title = "Teamwork: Marvel", description = "Finish the opponent with Special Double with Marvel Character [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112492, badge = "123030", published = "05/06/2020 21:09:18", modified = "05/06/2020 21:09:18",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && unless(p1_character() == 22) && unless(p1_character() == 18) && 
              unless(p1_character() == 26) && unless(p1_character() == 32) && unless(p1_character() == 20) && 
              unless(p1_character() == 30) && unless(p1_character() == 28) && unless(p1_character() == 24) && 
              unless(p1_character() == 16) && unless(p1_character() == 44) && unless(p1_character() == 42) &&
              ((p1_round_1_flag() == 8 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 8 && p1_rounds() == 2))
)

achievement(
    title = "Teamwork: Capcom", description = "Finish the opponent with Special Double with Capcom Character [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112493, badge = "123070", published = "05/06/2020 21:09:21", modified = "05/06/2020 21:09:21",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p2_hp() == 0 && unless(p1_character() == 14) && unless(p1_character() == 4) && 
              unless(p1_character() == 12) && unless(p1_character() == 6) && unless(p1_character() == 8) && 
              unless(p1_character() == 2) && unless(p1_character() == 10) && unless(p1_character() == 34) && 
              unless(p1_character() == 38) && unless(p1_character() == 36) && unless(p1_character() == 40) &&
              ((p1_round_1_flag() == 8 && p1_rounds() == 1) ||
               (p1_round_2_flag() == 8 && p1_rounds() == 2))
)

achievement(
    title = "Bitter Flavor of Dots", description = "Get 600,000 Score Points [Option Default, No Beginner Mode-Select]", points = 2,
    id = 112496, badge = "123125", published = "05/06/2020 21:12:29", modified = "05/06/2020 21:12:29",
    trigger = never(game_mode() != 0) && never(p1_state() == 0) && game_stage() > 1 && game_mode_select() <= 1 && 
              game_score() >= 600000
)

achievement(
    title = "To Vary a Good Score", description = "Get 800,000 Score Points [Option Default, No Beginner Mode-Select]", points = 3,
    id = 112497, badge = "123126", published = "05/06/2020 21:12:37", modified = "05/06/2020 21:12:37",
    trigger = never(game_mode() != 0) && never(p1_state() == 0) && game_stage() > 2 && game_mode_select() <= 1 && 
              game_score() >= 800000
)

achievement(
    title = "Mark these Points in History", description = "Get 1.000,000 Score Points [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112498, badge = "123127", published = "05/06/2020 21:12:40", modified = "05/06/2020 21:12:40",
    trigger = never(game_mode() != 0) && never(p1_state() == 0) && game_stage() > 3 && game_mode_select() <= 1 && 
              game_score() >= 1000000
)

achievement(
    title = "Marvel Perfect Fighter", description = "Win a fight without getting hit with Marvel character [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112499, badge = "123023", published = "05/06/2020 21:13:23", modified = "05/06/2020 21:13:23",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p1_hp() == 144 && p2_hp() == 0 &&
              ((p1_character() == 4) ||
               (p1_character() == 10) ||
               (p1_character() == 6) ||
               (p1_character() == 14) ||
               (p1_character() == 12) ||
               (p1_character() == 2) ||
               (p1_character() == 8) ||
               (p1_character() == 36) ||
               (p1_character() == 40) ||
               (p1_character() == 38))
)

achievement(
    title = "Capcom Perfect Fighter", description = "Win a fight without getting hit with Capcom character [Option Default, No Beginner Mode-Select]", points = 5,
    id = 112500, badge = "123026", published = "05/06/2020 21:13:26", modified = "05/06/2020 21:13:26",
    trigger = never(game_mode() != 0) && never(game_versus_flag() != 0) && never(p1_state() == 0) && game_mode_select()
               <= 1 && p1_hp() == 144 && p2_hp() == 0 &&
              ((p1_character() == 20) ||
               (p1_character() == 22) ||
               (p1_character() == 32) ||
               (p1_character() == 24) ||
               (p1_character() == 30) ||
               (p1_character() == 18) ||
               (p1_character() == 28) ||
               (p1_character() == 26) ||
               (p1_character() == 16) ||
               (p1_character() == 44) ||
               (p1_character() == 42))
)

achievement(
    title = "Hits Combinations 1 : Supreme Spell Loading", description = "Make 50 Hits with Ryu as your main character [Battle mode or Training, No Beginner Mode-Select]", points = 5,
    id = 112501, badge = "123176", published = "05/06/2020 21:14:29", modified = "05/06/2020 21:14:29",
    trigger = never(p1_character() != 18) && game_mode_select() <= 1 && p1_hit_combo() >= 50 && prev(p1_hit_combo()) == 49 &&
              ((game_mode() == 0) ||
               (game_mode() == 3))
)

achievement(
    title = "Hits Combinations 2 : Leg Turn", description = "Make 50 Hits with Chun-li as your main character [Battle mode or Training, No Beginner Mode-Select]", points = 5,
    id = 112502, badge = "123177", published = "05/06/2020 21:14:31", modified = "05/06/2020 21:14:31",
    trigger = never(p1_character() != 22) && game_mode_select() <= 1 && p1_hit_combo() >= 50 && prev(p1_hit_combo()) == 49 &&
              ((game_mode() == 0) ||
               (game_mode() == 3))
)

achievement(
    title = "Hits Combinations 3 : Ring Monster", description = "Make 30 Hits with Zangief as your main character [Battle mode or Training, No Beginner Mode-Select]", points = 5,
    id = 112503, badge = "123178", published = "05/06/2020 21:14:34", modified = "05/06/2020 21:14:34",
    trigger = never(p1_character() != 26) && game_mode_select() <= 1 && p1_hit_combo() >= 30 && prev(p1_hit_combo()) == 29 &&
              ((game_mode() == 0) ||
               (game_mode() == 3))
)

achievement(
    title = "Hits Combinations 4 : Bats Silhouette", description = "Make 50 Hits with Morrigan as your main character [Battle mode or Training, No Beginner Mode-Select]", points = 5,
    id = 112504, badge = "123181", published = "05/06/2020 21:14:37", modified = "05/06/2020 21:14:37",
    trigger = never(p1_character() != 30) && game_mode_select() <= 1 && p1_hit_combo() >= 50 && prev(p1_hit_combo()) == 49 &&
              ((game_mode() == 0) ||
               (game_mode() == 3))
)

achievement(
    title = "Hits Combinations 5 : Command in Action", description = "Make 30 Hits with C.Commando as your main character [Battle mode or Training, No Beginner Mode-Select]", points = 5,
    id = 112505, badge = "123182", published = "05/06/2020 21:14:42", modified = "05/06/2020 21:14:42",
    trigger = never(p1_character() != 20) && game_mode_select() <= 1 && p1_hit_combo() >= 30 && prev(p1_hit_combo()) == 29 &&
              ((game_mode() == 0) ||
               (game_mode() == 3))
)

achievement(
    title = "Hits Combinations 6 : Buster-X", description = "Make 50 Hits with Megaman as your main character [Battle mode or Training, No Beginner Mode-Select]", points = 5,
    id = 112506, badge = "123183", published = "05/06/2020 21:14:47", modified = "05/06/2020 21:14:47",
    trigger = never(p1_character() != 32) && game_mode_select() <= 1 && p1_hit_combo() >= 50 && prev(p1_hit_combo()) == 49 &&
              ((game_mode() == 0) ||
               (game_mode() == 3))
)

achievement(
    title = "Hits Combinations 7 : Fists of Fire", description = "Make 30 Hits with Jin as your main character [Battle mode or Training, No Beginner Mode-Select]", points = 5,
    id = 112507, badge = "123185", published = "05/06/2020 21:14:59", modified = "05/06/2020 21:14:59",
    trigger = never(p1_character() != 24) && game_mode_select() <= 1 && p1_hit_combo() >= 30 && prev(p1_hit_combo()) == 29 &&
              ((game_mode() == 0) ||
               (game_mode() == 3))
)

achievement(
    title = "Hits Combinations 8 : Hidden Blade", description = "Make 30 Hits with Strider as your main character [Battle mode or Training, No Beginner Mode-Select]", points = 5,
    id = 112508, badge = "123189", published = "05/06/2020 21:15:08", modified = "05/06/2020 21:15:08",
    trigger = never(p1_character() != 28) && game_mode_select() <= 1 && p1_hit_combo() >= 30 && prev(p1_hit_combo()) == 29 &&
              ((game_mode() == 0) ||
               (game_mode() == 3))
)

achievement(
    title = "Hits Combinations 9 : Armored Shield", description = "Make 30 Hits with C.America as your main character [Battle mode or Training, No Beginner Mode-Select]", points = 5,
    id = 112509, badge = "123192", published = "05/06/2020 21:15:11", modified = "05/06/2020 21:15:11",
    trigger = never(p1_character() != 4) && game_mode_select() <= 1 && p1_hit_combo() >= 30 && prev(p1_hit_combo()) == 29 &&
              ((game_mode() == 0) ||
               (game_mode() == 3))
)

achievement(
    title = "Hits Combinations 10 : Stuck in Webs", description = "Make 40 Hits with Venom as your main character [Battle mode or Training, No Beginner Mode-Select]", points = 5,
    id = 112510, badge = "123230", published = "05/06/2020 21:15:18", modified = "05/06/2020 21:15:18",
    trigger = never(p1_character() != 12) && game_mode_select() <= 1 && p1_hit_combo() >= 40 && prev(p1_hit_combo()) == 39 &&
              ((game_mode() == 0) ||
               (game_mode() == 3))
)

achievement(
    title = "Hits Combinations 11 : Destructive Earthquake", description = "Make 40 Hits with Hulk as your main character [Battle mode or Training, No Beginner Mode-Select]", points = 5,
    id = 112511, badge = "123274", published = "05/06/2020 21:15:24", modified = "05/06/2020 21:15:24",
    trigger = never(p1_character() != 6) && game_mode_select() <= 1 && p1_hit_combo() >= 40 && prev(p1_hit_combo()) == 39 &&
              ((game_mode() == 0) ||
               (game_mode() == 3))
)

achievement(
    title = "Hits Combinations 12 : Concentrated Plasma", description = "Make 30 Hits with W.Machine as your main character [Battle mode or Training, No Beginner Mode-Select]", points = 5,
    id = 112512, badge = "123282", published = "05/06/2020 21:15:31", modified = "05/06/2020 21:15:31",
    trigger = never(p1_character() != 2) && game_mode_select() <= 1 && p1_hit_combo() >= 30 && prev(p1_hit_combo()) == 29 &&
              ((game_mode() == 0) ||
               (game_mode() == 3))
)

achievement(
    title = "Hits Combinations 13 : Letter in the Sleeve", description = "Make 60 Hits with Gambit as your main character [Battle mode or Training, No Beginner Mode-Select]", points = 5,
    id = 112513, badge = "123280", published = "05/06/2020 21:15:39", modified = "05/06/2020 21:15:39",
    trigger = never(p1_character() != 10) && game_mode_select() <= 1 && p1_hit_combo() >= 60 && prev(p1_hit_combo()) == 59 &&
              ((game_mode() == 0) ||
               (game_mode() == 3))
)

achievement(
    title = "Hits Combinations 14 : Titanic Claws", description = "Make 50 Hits with Wolverine as your main character [Battle mode or Training, No Beginner Mode-Select]", points = 5,
    id = 112514, badge = "123285", published = "05/06/2020 21:15:44", modified = "05/06/2020 21:15:44",
    trigger = never(p1_character() != 8) && game_mode_select() <= 1 && p1_hit_combo() >= 50 && prev(p1_hit_combo()) == 49 &&
              ((game_mode() == 0) ||
               (game_mode() == 3))
)

achievement(
    title = "Hits Combinations 15 : Through the walls", description = "Make 40 Hits with Spider-Man as your main character [Battle mode or Training, No Beginner Mode-Select]", points = 5,
    id = 112515, badge = "123287", published = "05/06/2020 21:16:17", modified = "05/06/2020 21:16:17",
    trigger = never(p1_character() != 14) && game_mode_select() <= 1 && p1_hit_combo() >= 40 && prev(p1_hit_combo()) == 39 &&
              ((game_mode() == 0) ||
               (game_mode() == 3))
)

achievement(
    title = "Chronicles left from Capcom", description = "Finish Battle mode on lv8 difficulty, with a Capcom character [Option Default, No Beginner Mode, No Onslaught]", points = 25,
    id = 112516, badge = "122997", published = "05/06/2020 21:17:46", modified = "05/06/2020 21:17:46",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && game_stage() >= 7 && game_ending_flag() == 2 && 
              options_difficulty() == 7 &&
              ((p1_character() == 20) ||
               (p1_character() == 22) ||
               (p1_character() == 32) ||
               (p1_character() == 24) ||
               (p1_character() == 30) ||
               (p1_character() == 18) ||
               (p1_character() == 28) ||
               (p1_character() == 26) ||
               (p1_character() == 16) ||
               (p1_character() == 44) ||
               (p1_character() == 42))
)

achievement(
    title = "Chronicles left from Marvel", description = "Finish Battle mode on lv8 difficulty, with a Marvel character [Option Default, No Beginner Mode, No Onslaught]", points = 25,
    id = 112517, badge = "122998", published = "05/06/2020 21:17:48", modified = "05/06/2020 21:17:48",
    trigger = never(game_mode() != 0) && game_mode_select() <= 1 && game_stage() >= 7 && game_ending_flag() == 2 && 
              options_difficulty() == 7 &&
              ((p1_character() == 4) ||
               (p1_character() == 10) ||
               (p1_character() == 6) ||
               (p1_character() == 14) ||
               (p1_character() == 12) ||
               (p1_character() == 2) ||
               (p1_character() == 8) ||
               (p1_character() == 36) ||
               (p1_character() == 40) ||
               (p1_character() == 38))
)

achievement(
    title = "I'll Leave my Name", description = "End the game without using continue [Option Default, No Beginner Mode-Select]", points = 25,
    id = 112518, badge = "123102", published = "05/06/2020 21:17:53", modified = "05/06/2020 21:17:53",
    trigger = never(game_mode() != 0) && once(game_stage() == 0 && byte(0x07BDE9) == 0 && byte(0x07BDE9) == 0) && 
              never(byte(0x07BDE9) == 10) && game_stage() >= 7 && game_mode_select() <= 1 && game_ending_flag() == 2
)

achievement(
    title = "Super Hero", description = "End the game without losing any Round [Option Default, No Beginner Mode-Select]", points = 50,
    id = 112519, badge = "123099", published = "05/06/2020 21:18:06", modified = "05/06/2020 21:18:06",
    trigger = never(game_mode() != 0) && once(game_stage() == 0 && p2_rounds() == 0 && p2_rounds() == 0) && 
              never(p2_rounds() == 1) && game_mode_select() <= 1 && game_stage() >= 7 && game_ending_flag() == 2
)

leaderboard(
    id = 8291, title = "MvsC : Score Points",
    description = "Table of best scores",
    start  = game_score() > prev(game_score()) && p1_state() == 1,
    cancel = p2_rounds() == 2,
    submit = game_ending_flag() == 2,
    value = game_score() * 1,
    format = "SCORE"
)
