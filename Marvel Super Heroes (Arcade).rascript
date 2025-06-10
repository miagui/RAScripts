// Marvel Super Heroes
// #ID = 11822

// =========================================
//             Memory Accessors              
// =========================================

// Settings
function settings_difficulty() => byte(0x00FB41)
function settings_max_rounds() => byte(0x00FB47)

// Game

function game_players_active() => byte(0x004880)
function game_playing() => bit0(0x004881)
function game_versus_mode_flag() => bit0(0x00489D)

function arcade_match() => byte(0x004851)
function match_round_state() => byte(0x00480E)

// P1
function p1_playing() => bit0(0x004002)
function p1_rounds_won() => byte(0x004803)
function p1_credits_used() => byte(0x4186)

function p1_infinity_gem_state() => byte(0x002553)
function p1_character() => byte(0x004050)
function p1_move_type_confirmed() => byte(0x004112)

function p1_infinity_gem_remaining_time() => byte(0x004151)
function p1_hp() => byte(0x004190)
function p1_infinity_gauge_level() => byte(0x004199)
function p1_super_move_finishes_global() => byte(0x0041D8)
function p1_consecutive_round_wins() => byte(0x0041D9)
function p1_rounds_passed_consecutive() => byte(0x0041DA)

function p1_victories_type_special_move() => byte(0x0042E0)
function p1_victories_type_regular_victory() => byte(0x0042E1)
function p1_victories_type_infinity_finish() => byte(0x0042E3)
function p1_victories_type_cheese() => byte(0x0042E5)
function p1_victories_type_cherry() => byte(0x0042E6)
function p1_victories_type_perfect() => byte(0x0042E7)
function p1_match_damage_dealt_total_damage() => word(0x0042F0)
function p1_match_damage_dealt_normal_attacks() => word(0x0042F2)
function p1_match_damage_dealt_special_moves() => word(0x0042F4)
function p1_match_damage_dealt_infinity() => word(0x0042F6)

function p1_infinity_finish() => bit0(0x004549)

// P2
function p2_playing() => bit0(0x004402)
function p2_rounds_won() => byte(0x004802)

function p2_infinity_gem_state() => byte(0x002552)
function p2_character() => byte(0x004450)
function p2_hp() => byte(0x004590)
function p2_attack_types() => byte(0x004598)
function p2_infinity_gauge_level() => byte(0x004599)
function p2_infinity_gem_equipped() => byte(0x0045B7)
function p2_consecutive_round_wins() => byte(0x0045D9)
function p2_rounds_passed_consecutive() => byte(0x0045DA)

function p2_infinity_finish() => bit0(0x004149)

// =========================================
//             Arcade Progression              
// =========================================

achievement(
    title = "Spider Instinct", points = 10, type="win_condition",
    description = "Finish the entire Arcade Mode as Spider-Man on Medium difficulty (3 rounds).",
    id = 58815, badge = "270447", published = "27/03/2018 00:56:05", modified = "28/08/2022 20:20:51",
    trigger = never(game_playing() != 1) &&
              p1_character() == 0 && 
              once(arcade_match() == 0 && game_playing() == 1) &&
              never(p1_character() != 0 && p1_rounds_won() > prev(p1_rounds_won())) &&
              trigger_when(arcade_match() == 8 && p2_character() == 22 && p1_rounds_won() == 2) &&
              settings_difficulty() >= 3 && 
              settings_max_rounds() >= 1
)

achievement(
    title = "Freedom Prevail!", points = 10, type="win_condition",
    description = "Finish the entire Arcade Mode as Captain America on Medium difficulty (3 rounds).",
    id = 58816, badge = "270448", published = "27/03/2018 00:56:06", modified = "28/08/2022 20:20:52",
    trigger = never(game_playing() != 1) &&
              p1_character() == 2 && 
              once(arcade_match() == 0 && game_playing() == 1) &&
              never(p1_character() != 2 && p1_rounds_won() > prev(p1_rounds_won())) &&
              trigger_when(arcade_match() == 8 && p2_character() == 22 && p1_rounds_won() == 2) &&
              settings_difficulty() >= 3 && 
              settings_max_rounds() >= 1
)

achievement(
    title = "HULK SMASH!!", points = 10, type="win_condition",
    description = "Finish the entire Arcade Mode as Hulk on Medium difficulty (3 rounds).",
    id = 58817, badge = "270449", published = "27/03/2018 00:56:08", modified = "28/08/2022 20:20:52",
    trigger = never(game_playing() != 1) &&
              p1_character() == 4 && 
              once(arcade_match() == 0 && game_playing() == 1) &&
              never(p1_character() != 4 && p1_rounds_won() > prev(p1_rounds_won())) &&
              trigger_when(arcade_match() == 8 && p2_character() == 22 && p1_rounds_won() == 2) &&
              settings_difficulty() >= 3 && 
              settings_max_rounds() >= 1
)
achievement(
    title = "Superior Tech", points = 10, type="win_condition",
    description = "Finish the entire Arcade Mode as Iron Man on Medium difficulty (3 rounds).",
    id = 58818, badge = "270490", published = "27/03/2018 00:56:09", modified = "28/08/2022 20:26:19",
    trigger = never(game_playing() != 1) &&
              p1_character() == 6 && 
              once(arcade_match() == 0 && game_playing() == 1) &&
              never(p1_character() != 6 && p1_rounds_won() > prev(p1_rounds_won())) &&
              trigger_when(arcade_match() == 8 && p2_character() == 22 && p1_rounds_won() == 2) &&
              settings_difficulty() >= 3 && 
              settings_max_rounds() >= 1
)

achievement(
    title = "Adamantium Beast", points = 10, type="win_condition",
    description = "Finish the entire Arcade Mode as Wolverine on Medium difficulty (3 rounds).",
    id = 58819, badge = "270491", published = "27/03/2018 00:56:11", modified = "28/08/2022 20:26:19",
    trigger = never(game_playing() != 1) &&
              p1_character() == 8 && 
              once(arcade_match() == 0 && game_playing() == 1) &&
              never(p1_character() != 8 && p1_rounds_won() > prev(p1_rounds_won())) &&
              trigger_when(arcade_match() == 8 && p2_character() == 22 && p1_rounds_won() == 2) &&
              settings_difficulty() >= 3 && 
              settings_max_rounds() >= 1
)

achievement(
    title = "Ninjutsu!", points = 10, type="win_condition",
    description = "Finish the entire Arcade Mode as Psylocke on Medium difficulty (3 rounds).",
    id = 58820, badge = "270492", published = "27/03/2018 00:56:12", modified = "28/08/2022 20:26:19",
    trigger = never(game_playing() != 1) &&
              p1_character() == 10 && 
              once(arcade_match() == 0 && game_playing() == 1) &&
              never(p1_character() != 10 && p1_rounds_won() > prev(p1_rounds_won())) &&
              trigger_when(arcade_match() == 8 && p2_character() == 22 && p1_rounds_won() == 2) &&
              settings_difficulty() >= 3 && 
              settings_max_rounds() >= 1
)

achievement(
    title = "Lightning Inferno", points = 10, type="win_condition",
    description = "Finish the entire Arcade Mode as Black Heart on Medium difficulty (3 rounds).",
    id = 58821, badge = "270453", published = "27/03/2018 00:56:23", modified = "28/08/2022 20:20:53",
    trigger = never(game_playing() != 1) &&
              p1_character() == 12 && 
              once(arcade_match() == 0 && game_playing() == 1) &&
              never(p1_character() != 12 && p1_rounds_won() > prev(p1_rounds_won())) &&
              trigger_when(arcade_match() == 8 && p2_character() == 22 && p1_rounds_won() == 2) &&
              settings_difficulty() >= 3 && 
              settings_max_rounds() >= 1
)

achievement(
    title = "Mystic Smash", points = 10, type="win_condition",
    description = "Finish the entire Arcade Mode as Shuma-Gorath on Medium difficulty (3 rounds).",
    id = 58822, badge = "270454", published = "27/03/2018 00:56:25", modified = "28/08/2022 20:20:54",
    trigger = never(game_playing() != 1) &&
              p1_character() == 14 && 
              once(arcade_match() == 0 && game_playing() == 1) &&
              never(p1_character() != 14 && p1_rounds_won() > prev(p1_rounds_won())) &&
              trigger_when(arcade_match() == 8 && p2_character() == 22 && p1_rounds_won() == 2) &&
              settings_difficulty() >= 3 && 
              settings_max_rounds() >= 1
)

achievement(
    title = "I'm The JUGGERNAUT!", points = 10, type="win_condition",
    description = "Finish the entire Arcade Mode as Juggernaut on Medium difficulty (3 rounds).",
    id = 58823, badge = "270455", published = "27/03/2018 00:56:26", modified = "28/08/2022 20:20:54",
    trigger = never(game_playing() != 1) &&
              p1_character() == 16 && 
              once(arcade_match() == 0 && game_playing() == 1) &&
              never(p1_character() != 16 && p1_rounds_won() > prev(p1_rounds_won())) &&
              trigger_when(arcade_match() == 8 && p2_character() == 22 && p1_rounds_won() == 2) &&
              settings_difficulty() >= 3 && 
              settings_max_rounds() >= 1
)

achievement(
    title = "Eternal Emperor of Avalon", points = 10, type="win_condition",
    description = "Finish the entire Arcade Mode as Magneto on Medium difficulty (3 rounds).",
    id = 58824, badge = "270493", published = "27/03/2018 00:56:29", modified = "28/08/2022 20:26:20",
    trigger = never(game_playing() != 1) &&
              p1_character() == 18 && 
              once(arcade_match() == 0 && game_playing() == 1) &&
              never(p1_character() != 18 && p1_rounds_won() > prev(p1_rounds_won())) &&
              trigger_when(arcade_match() == 8 && p2_character() == 22 && p1_rounds_won() == 2) &&
              settings_difficulty() >= 3 && 
              settings_max_rounds() >= 1
)

achievement(
    title = "Now You Face Your DOOM!", points = 10,
    description = "Finish the entire Arcade Mode as Dr. Doom on Medium difficulty (3 rounds).",
    id = 59060, badge = "270494", published = "08/04/2018 23:34:15", modified = "28/08/2022 20:26:20",
    trigger = never(game_playing() != 1) &&
              p1_character() == 20 && 
              once(arcade_match() == 0 && game_playing() == 1) &&
              never(p1_character() != 20 && p1_rounds_won() > prev(p1_rounds_won())) &&
              trigger_when(arcade_match() == 8 && p2_character() == 22 && p1_rounds_won() == 2) &&
              settings_difficulty() >= 3 && 
              settings_max_rounds() >= 1
)

achievement(
    title = "Thanos Reigns!", points = 10,
    description = "Finish the entire Arcade Mode as Thanos on Medium difficulty (3 rounds).",
    id = 59059, badge = "270458", published = "08/04/2018 23:34:14", modified = "28/08/2022 20:20:55",
    trigger = never(game_playing() != 1) &&
              p1_character() == 22 && 
              once(arcade_match() == 0 && game_playing() == 1) &&
              never(p1_character() != 22 && p1_rounds_won() > prev(p1_rounds_won())) &&
              trigger_when(arcade_match() == 8 && p2_character() == 22 && p1_rounds_won() == 2) &&
              settings_difficulty() >= 3 && 
              settings_max_rounds() >= 1
)

achievement(
    title = "Anita", points = 10,
    description = "Finish the entire Arcade Mode as Anita on Medium difficulty (3 rounds).",
    id = 59061, badge = "270459", published = "08/04/2018 23:34:17", modified = "28/08/2022 20:20:55",
    trigger = never(game_playing() != 1) &&
              p1_character() == 24 && 
              once(arcade_match() == 0 && game_playing() == 1) &&
              never(p1_character() != 24 && p1_rounds_won() > prev(p1_rounds_won())) &&
              trigger_when(arcade_match() == 8 && p2_character() == 22 && p1_rounds_won() == 2) &&
              settings_difficulty() >= 3 && 
              settings_max_rounds() >= 1
)


// =========================================
//              Infinity Combos              
// =========================================

achievement(
    title = "Maximum Spider", points = 3,
    description = "Finish an opponent with a Infinity Combo as Spider-Man.",
    id = 60269, badge = "270476", published = "19/05/2018 19:01:05", modified = "28/08/2022 20:21:02",
    trigger = p1_infinity_finish() == 1 &&
              ((p2_hp() == 0 && unless(p2_playing() == 1) && p1_character() == 0) ||
               (p1_hp() == 0 && unless(p1_playing() == 1) && p2_character() == 0))
)

achievement(
    title = "Final Justice", points = 3,
    description = "Finish an opponent with a Infinity Combo as Captain America.",
    id = 60270, badge = "270477", published = "19/05/2018 19:01:51", modified = "28/08/2022 20:21:03",
    trigger = p1_infinity_finish() == 1 &&
              ((p2_hp() == 0 && unless(p2_playing() == 1) && p1_character() == 2) ||
               (p1_hp() == 0 && unless(p1_playing() == 1) && p2_character() == 2))
)

achievement(
    title = "Gamma Rush", points = 3,
    description = "Finish an opponent with a Infinity Combo as Hulk.",
    id = 60271, badge = "270478", published = "19/05/2018 19:01:55", modified = "28/08/2022 20:21:03",
    trigger = p1_infinity_finish() == 1 &&
              ((p2_hp() == 0 && unless(p2_playing() == 1) && p1_character() == 4) ||
               (p1_hp() == 0 && unless(p1_playing() == 1) && p2_character() == 4))
)

achievement(
    title = "Proton Cannon", points = 3,
    description = "Finish an opponent with a Infinity Combo as Iron Man.",
    id = 60272, badge = "270479", published = "19/05/2018 19:02:03", modified = "28/08/2022 20:21:03",
    trigger = p1_infinity_finish() == 1 &&
              ((p2_hp() == 0 && unless(p2_playing() == 1) && p1_character() == 6) ||
               (p1_hp() == 0 && unless(p1_playing() == 1) && p2_character() == 6))
)

achievement(
    title = "Berseker Barrage", points = 3,
    description = "Finish an opponent with a Infinity Combo as Wolverine.",
    id = 60273, badge = "270480", published = "19/05/2018 19:02:07", modified = "28/08/2022 20:21:04",
    trigger = p1_infinity_finish() == 1 &&
              ((p2_hp() == 0 && unless(p2_playing() == 1) && p1_character() == 8) ||
               (p1_hp() == 0 && unless(p1_playing() == 1) && p2_character() == 8))
)

achievement(
    title = "Psi-Thrust", points = 3,
    description = "Finish an opponent with a Infinity Combo as Psylocke.",
    id = 60274, badge = "270481", published = "19/05/2018 19:02:19", modified = "28/08/2022 20:21:04",
    trigger = p1_infinity_finish() == 1 &&
              ((p2_hp() == 0 && unless(p2_playing() == 1) && p1_character() == 10) ||
               (p1_hp() == 0 && unless(p1_playing() == 1) && p2_character() == 10))
)

achievement(
    title = "Armageddon", points = 3,
    description = "Finish an opponent with a Infinity Combo as Black-Heart.",
    id = 60275, badge = "270482", published = "19/05/2018 19:02:28", modified = "28/08/2022 20:21:04",
    trigger = p1_infinity_finish() == 1 &&
              ((p2_hp() == 0 && unless(p2_playing() == 1) && p1_character() == 12) ||
               (p1_hp() == 0 && unless(p1_playing() == 1) && p2_character() == 12))
)

achievement(
    title = "Chaos Dimension", points = 3,
    description = "Finish an opponent with a Infinity Combo as Shuma-Gorath.",
    id = 60276, badge = "270483", published = "19/05/2018 19:02:49", modified = "28/08/2022 20:21:05",
    trigger = p1_infinity_finish() == 1 &&
              ((p2_hp() == 0 && unless(p2_playing() == 1) && p1_character() == 14) ||
               (p1_hp() == 0 && unless(p1_playing() == 1) && p2_character() == 14))
)

achievement(
    title = "Juggernaut Headcrush", points = 3,
    description = "Finish an opponent with a Infinity Combo as Juggernaut.",
    id = 60277, badge = "270484", published = "19/05/2018 19:02:57", modified = "28/08/2022 20:21:05",
    trigger = p1_infinity_finish() == 1 &&
              ((p2_hp() == 0 && unless(p2_playing() == 1) && p1_character() == 16) ||
               (p1_hp() == 0 && unless(p1_playing() == 1) && p2_character() == 16))
)

achievement(
    title = "Magnetic Shockwave", points = 3,
    description = "Finish an opponent with a Infinity Combo as Magneto.",
    id = 60278, badge = "270485", published = "19/05/2018 19:02:59", modified = "28/08/2022 20:21:05",
    trigger = p1_infinity_finish() == 1 &&
              ((p2_hp() == 0 && unless(p2_playing() == 1) && p1_character() == 18) ||
               (p1_hp() == 0 && unless(p1_playing() == 1) && p2_character() == 18))
)

achievement(
    title = "Photon Array", points = 3,
    description = "Finish an opponent with a Infinity Combo as Dr. Doom.",
    id = 60279, badge = "270486", published = "19/05/2018 19:03:04", modified = "28/08/2022 20:21:06",
    trigger = p1_infinity_finish() == 1 &&
              ((p2_hp() == 0 && unless(p2_playing() == 1) && p1_character() == 20) ||
               (p1_hp() == 0 && unless(p1_playing() == 1) && p2_character() == 20))
)

achievement(
    title = "Infinity Gem", points = 3,
    description = "Finish an opponent with a Infinity Combo as Thanos.",
    id = 60280, badge = "270487", published = "19/05/2018 19:03:06", modified = "28/08/2022 20:21:06",
    trigger = p1_infinity_finish() == 1 &&
              ((p2_hp() == 0 && unless(p2_playing() == 1) && p1_character() == 22) ||
               (p1_hp() == 0 && unless(p1_playing() == 1) && p2_character() == 22))
)

achievement(
    title = "Love For You", points = 3,
    description = "Finish an opponent with a Infinity Combo as Anita.",
    id = 60281, badge = "270488", published = "19/05/2018 19:03:08", modified = "28/08/2022 20:21:06",
    trigger = p1_infinity_finish() == 1 &&
              ((p2_hp() == 0 && unless(p2_playing() == 1) && p1_character() == 24) ||
               (p1_hp() == 0 && unless(p1_playing() == 1) && p2_character() == 24))
)

// =========================================
//                 Challenges              
// =========================================

achievement(
    title = "Infinity Gauntlet", points = 25,
    description = "Finish the game without losing a match on Medium difficulty (3 rounds).",
    id = 58832, badge = "270489", published = "27/03/2018 00:57:08", modified = "28/08/2022 20:21:07",
    trigger = never(game_playing() != 1) &&
              once(arcade_match() == 0 && game_playing() == 1) &&
              never(p1_credits_used() > prev(p1_credits_used())) &&
              trigger_when(arcade_match() == 8 && p2_character() == 22 && p1_rounds_won() == 2) &&
              settings_difficulty() >= 3 && 
              settings_max_rounds() >= 1
)
