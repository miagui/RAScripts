// King of Fighters '95, The
// #ID = 2409

function dip_cheat_maximum() => bit3(0x00C602)
function dip_cheat_power_attacks() => bit4(0x00C602)
function dip_unlock_rugal() => bit6(0x00C602)
function dip_unlock_nakoruru() => bit7(0x00C602)

function no_cheats() => dip_cheat_maximum() == false && dip_cheat_power_attacks() == false

function dipswitch_byte() => byte(0x00C602)

function game_mode() => byte(0x00CB50)
function ending_flag() => byte(0x00CB62)
function character() => byte(0x00CB89)
function player_hp() => byte(0x00D847)
function player_negative_hp() => byte(0x00D849)
function cpu_hp() => byte(0x00D947)

achievement(
    title = "Saisyu Kusanagi", description = "Finish the game in Single Play mode using Saisyu", points = 5,
    id = 29843, badge = "30570", published = "10/11/2015 17:37:55", modified = "06/06/2021 23:00:24",
    trigger = character() == 15 && game_mode() == 0 && ending_flag() == 17 && dip_unlock_rugal() == 1 && 
              dip_cheat_maximum() == 0
)

achievement(
    title = "Maximum", description = "Fill your special bar to the maximum", points = 1,
    id = 29857, badge = "30587", published = "11/11/2015 03:42:59", modified = "07/04/2021 02:43:29",
    trigger = player_negative_hp() == 56 && no_cheats()
)

achievement(
    title = "Perfect", description = "Defeat an opponent without getting hit or letting the timer run out", points = 4,
    id = 29856, badge = "30589", published = "11/11/2015 03:42:48", modified = "19/05/2022 01:42:24",
    trigger = trigger_when(cpu_hp() == 0) && player_hp() == 72 && no_cheats()
)

achievement(
    title = "Secret Team", description = "Finish the game in Team Play mode using Saisyu [P1], Rugal [P2] and Nakoruru [P3]", points = 5,
    id = 29855, badge = "30586", published = "11/11/2015 03:11:44", modified = "07/04/2021 02:43:37",
    trigger = game_mode() == 1 && ending_flag() == 17 && character() == 15 && byte(0x00CB8A) == 16 && 
              byte(0x00CB8B) == 17 && dipswitch_byte() == 192 && unless(dipswitch_byte() != 192)
)

achievement(
    title = "Iori Team", description = "Finish the game in Team Play mode using Iori [P1], Eiji [P2] and Billy [P3]", points = 5,
    id = 29854, badge = "30585", published = "11/11/2015 03:11:41", modified = "07/04/2021 02:43:41",
    trigger = game_mode() == 1 && ending_flag() == 17 && character() == 12 && byte(0x00CB8A) == 13 && 
              byte(0x00CB8B) == 14 && no_cheats()
)

achievement(
    title = "Fatal Fury Team", description = "Finish the game in Team Play mode using Terry [P1], Joe [P2] and Kim [P3]", points = 5,
    id = 29853, badge = "30584", published = "11/11/2015 03:11:37", modified = "07/04/2021 02:43:46",
    trigger = game_mode() == 1 && ending_flag() == 17 && character() == 4 && byte(0x00CB8A) == 5 && 
              byte(0x00CB8B) == 10 && no_cheats()
)

achievement(
    title = "Art of Fighting Team", description = "Finish the game in Team Play mode using Ryo [P1], Yuri [P2] and Eiji [P3]", points = 5,
    id = 29852, badge = "30583", published = "11/11/2015 03:11:34", modified = "07/04/2021 02:43:50",
    trigger = game_mode() == 1 && ending_flag() == 17 && character() == 2 && byte(0x00CB8A) == 3 && 
              byte(0x00CB8B) == 13 && no_cheats()
)

achievement(
    title = "Neo-Geo Freak Team", description = "Finish the game in Team Play mode using Kyo [P1], Billy [P2] and Mai [P3]", points = 5,
    id = 29851, badge = "30582", published = "11/11/2015 03:11:29", modified = "07/04/2021 02:44:00",
    trigger = game_mode() == 1 && ending_flag() == 17 && character() == 0 && byte(0x00CB8A) == 14 && 
              byte(0x00CB8B) == 11 && no_cheats()
)

achievement(
    title = "Classic Heroes Team", description = "Finish the game in Team Play mode using Ralf [P1], Athena [P2] and Kensou [P3]", points = 5,
    id = 29850, badge = "30581", published = "11/11/2015 03:11:23", modified = "07/04/2021 02:44:04",
    trigger = game_mode() == 1 && ending_flag() == 17 && character() == 7 && byte(0x00CB8A) == 8 && 
              byte(0x00CB8B) == 9 && no_cheats()
)

achievement(
    title = "Girl Team", description = "Finish the game in Team Play mode using Yuri [P1], Athena [P2] and Mai [P3]", points = 5,
    id = 29849, badge = "30580", published = "11/11/2015 03:11:19", modified = "07/04/2021 02:44:10",
    trigger = game_mode() == 1 && ending_flag() == 17 && character() == 3 && byte(0x00CB8A) == 8 && 
              byte(0x00CB8B) == 11 && no_cheats()
)

achievement(
    title = "Ego Team", description = "Finish the game in Team Play mode using Berimaru [P1], Joe [P2] and Kim [P3]", points = 5,
    id = 29848, badge = "30578", published = "11/11/2015 03:11:01", modified = "07/04/2021 02:44:15",
    trigger = game_mode() == 1 && ending_flag() == 17 && character() == 1 && byte(0x00CB8A) == 5 && 
              byte(0x00CB8B) == 10 && no_cheats()
)

achievement(
    title = "Main Men Team", description = "Finish the game in Team Play mode using Kyo [P1], Ryo [P2] and Terry [P3]", points = 5,
    id = 29847, badge = "30579", published = "11/11/2015 03:10:55", modified = "07/04/2021 02:44:20",
    trigger = game_mode() == 1 && ending_flag() == 17 && character() == 0 && byte(0x00CB8A) == 2 && 
              byte(0x00CB8B) == 4 && no_cheats()
)

achievement(
    title = "The King of Fighters", description = "Finish the game in Team Play mode", points = 5,
    id = 29846, badge = "30577", published = "11/11/2015 03:10:48", modified = "07/04/2021 02:44:25",
    trigger = game_mode() == 1 && ending_flag() == 17 && no_cheats()
)

achievement(
    title = "Nakoruru", description = "Finish the game in Single Play mode using Nakoruru", points = 5,
    id = 29845, badge = "30568", published = "10/11/2015 17:38:02", modified = "06/06/2021 23:00:15",
    trigger = character() == 17 && game_mode() == 0 && ending_flag() == 17 && dip_unlock_nakoruru() == 1 && 
              dip_cheat_maximum() == 0
)

achievement(
    title = "Rugal Bernstein", description = "Finish the game in Single Play mode using Rugal", points = 5,
    id = 29844, badge = "30569", published = "10/11/2015 17:37:59", modified = "06/06/2021 23:01:08",
    trigger = character() == 16 && game_mode() == 0 && ending_flag() == 17 && dip_unlock_rugal() == 1 && 
              dip_cheat_maximum() == 0
)

achievement(
    title = "Kyo Kusanagi", description = "Finish the game in Single Play mode using Kyo", points = 5,
    id = 29828, badge = "30541", published = "10/11/2015 17:36:32", modified = "07/04/2021 02:44:42",
    trigger = character() == 0 && game_mode() == 0 && ending_flag() == 17 && no_cheats()
)

achievement(
    title = "Billy Kane", description = "Finish the game in Single Play mode using Billy", points = 5,
    id = 29842, badge = "30571", published = "10/11/2015 17:37:27", modified = "07/04/2021 02:44:53",
    trigger = character() == 14 && game_mode() == 0 && ending_flag() == 17 && no_cheats()
)

achievement(
    title = "Eiji Kisaragi", description = "Finish the game in Single Play mode using Eiji", points = 5,
    id = 29841, badge = "30573", published = "10/11/2015 17:37:22", modified = "07/04/2021 02:45:00",
    trigger = character() == 13 && game_mode() == 0 && ending_flag() == 17 && no_cheats()
)

achievement(
    title = "Iori Yagami", description = "Finish the game in Single Play mode using Iori", points = 5,
    id = 29840, badge = "30572", published = "10/11/2015 17:37:19", modified = "07/04/2021 02:45:13",
    trigger = character() == 12 && game_mode() == 0 && ending_flag() == 17 && no_cheats()
)

achievement(
    title = "Mai Shiranui", description = "Finish the game in Single Play mode using Mai", points = 5,
    id = 29839, badge = "30556", published = "10/11/2015 17:37:14", modified = "07/04/2021 02:45:17",
    trigger = character() == 11 && game_mode() == 0 && ending_flag() == 17 && no_cheats()
)

achievement(
    title = "Kim Kaphwan", description = "Finish the game in Single Play mode using Kim", points = 5,
    id = 29838, badge = "30555", published = "10/11/2015 17:37:10", modified = "07/04/2021 02:45:22",
    trigger = character() == 10 && game_mode() == 0 && ending_flag() == 17 && no_cheats()
)

achievement(
    title = "Sei Kensou", description = "Finish the game in Single Play mode using Kensou", points = 5,
    id = 29837, badge = "30551", published = "10/11/2015 17:37:06", modified = "07/04/2021 02:45:28",
    trigger = character() == 9 && game_mode() == 0 && ending_flag() == 17 && no_cheats()
)

achievement(
    title = "Athena Asamiya", description = "Finish the game in Single Play mode using Athena", points = 5,
    id = 29836, badge = "30550", published = "10/11/2015 17:37:03", modified = "06/06/2021 23:01:58",
    trigger = character() == 8 && game_mode() == 0 && ending_flag() == 17 && no_cheats() && 
              dip_cheat_maximum() == 0
)

achievement(
    title = "Ralf Jones", description = "Finish the game in Single Play mode using Ralf", points = 5,
    id = 29835, badge = "30549", published = "10/11/2015 17:36:58", modified = "06/06/2021 23:02:02",
    trigger = character() == 7 && game_mode() == 0 && ending_flag() == 17 && no_cheats() && 
              dip_cheat_maximum() == 0
)

achievement(
    title = "Heidern", description = "Finish the game in Single Play mode using Heidern (Jeidern)", points = 5,
    id = 29834, badge = "30548", published = "10/11/2015 17:36:55", modified = "07/04/2021 02:45:46",
    trigger = character() == 6 && game_mode() == 0 && ending_flag() == 17 && no_cheats()
)

achievement(
    title = "Joe Higashi", description = "Finish the game in Single Play mode using Joe", points = 5,
    id = 29833, badge = "30547", published = "10/11/2015 17:36:51", modified = "07/04/2021 02:45:51",
    trigger = character() == 5 && game_mode() == 0 && ending_flag() == 17 && no_cheats()
)

achievement(
    title = "Terry Bogard", description = "Finish the game in Single Play mode using Terry", points = 5,
    id = 29832, badge = "30546", published = "10/11/2015 17:36:47", modified = "07/04/2021 02:45:55",
    trigger = character() == 4 && game_mode() == 0 && ending_flag() == 17 && no_cheats()
)

achievement(
    title = "Yuri Sakazaki", description = "Finish the game in Single Play mode using Yuri", points = 5,
    id = 29831, badge = "30545", published = "10/11/2015 17:36:44", modified = "07/04/2021 02:46:01",
    trigger = character() == 3 && game_mode() == 0 && ending_flag() == 17 && no_cheats()
)

achievement(
    title = "Ryo Sakazaki", description = "Finish the game in Single Play mode using Ryo", points = 5,
    id = 29830, badge = "30544", published = "10/11/2015 17:36:40", modified = "07/04/2021 02:46:06",
    trigger = character() == 2 && game_mode() == 0 && ending_flag() == 17 && no_cheats()
)

achievement(
    title = "Benimaru Nikaido", description = "Finish the game in Single Play mode using Benimaru", points = 5,
    id = 29829, badge = "30542", published = "10/11/2015 17:36:36", modified = "07/04/2021 02:46:13",
    trigger = character() == 1 && game_mode() == 0 && ending_flag() == 17 && no_cheats()
)
