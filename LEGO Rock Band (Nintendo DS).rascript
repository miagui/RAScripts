// LEGO Rock Band
// #ID = 15981

// $16B24E: Music - Song Finished Indicator
//          
//          01=Quickplay song finished
//          02=Tour song finished
function music_finished() => word(0x16B24E)

// $174F94: Game - In-Music Indicator [0x00/0x01)
function game_inside_music() => word(0x174F94)

function pointer_music1() => word(0x17B744)
function pointer_music2() => tbyte(0x17B744)
function pointer_music3() => word(0x17B746)

function game_difficulty() => byte(0x295238)

// =========================================
//                100% Notes              
// =========================================

// achievement(
//     title = "We Will Rock You 100%", description = "Complete We Will Rock You without missing notes on Expert.", points = 25,
//     id = 128929, badge = "141787",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 3929777056) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "We Are the Champions 100%", description = "Complete We Are the Champions without missing notes on Expert.", points = 25,
//     id = 128930, badge = "141788",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2770645661) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Let's Dance 100%", description = "Complete Let's Dance without missing notes on Expert.", points = 25,
//     id = 128931, badge = "141791",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 3016712890) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "So What 100%", description = "Complete So What without missing notes on Expert.", points = 25,
//     id = 128932, badge = "141851",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2912727528) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Check Yes Juliet 100%", description = "Complete Check Yes Juliet without missing notes on Expert.", points = 25,
//     id = 128933, badge = "141792",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 4061417512) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Song 2 100%", description = "Complete Song 2 without missing notes on Expert.", points = 25,
//     id = 128934, badge = "141793",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2451569639) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Free Fallin' 100%", description = "Complete Free Fallin' without missing notes on Expert.", points = 25,
//     id = 128935, badge = "141794",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 1734149620) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "In Too Deep 100%", description = "Complete In Too Deep without missing notes on Expert.", points = 25,
//     id = 128936, badge = "141795",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 3547676851) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Swing Swing 100%", description = "Complete Swing Swing without missing notes on Expert.", points = 25,
//     id = 128937, badge = "141796",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 3922685756) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Accidentally in Love 100%", description = "Complete Accidentally in Love without missing notes on Expert.", points = 25,
//     id = 128938, badge = "141797",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 574522356) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Crash 100%", description = "Complete Crash without missing notes on Expert.", points = 25,
//     id = 128939, badge = "141798",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 64383879) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Ruby 100%", description = "Complete Ruby without missing notes on Expert.", points = 25,
//     id = 128940, badge = "141799",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2526682) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Girls and Boys 100%", description = "Complete Girls and Boys without missing notes on Expert.", points = 25,
//     id = 128941, badge = "141800",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 632551701) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "The Final Countdown 100%", description = "Complete The Final Countdown without missing notes on Expert.", points = 25,
//     id = 128942, badge = "141801",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 1200848440) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Ghostbusters 100%", description = "Complete Ghostbusters without missing notes on Expert.", points = 25,
//     id = 128943, badge = "141853",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 3329479043) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Walking on Sunshine 100%", description = "Complete Walking on Sunshine without missing notes on Expert.", points = 25,
//     id = 128944, badge = "141803",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2529911673) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Monster 100%", description = "Complete Monster without missing notes on Expert.", points = 25,
//     id = 128945, badge = "141804",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 1954599866) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "I Want you Back 100%", description = "Complete I Want you Back without missing notes on Expert.", points = 25,
//     id = 128946, badge = "141805",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 695918785) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Life is a Highway 100%", description = "Complete Life is a Highway without missing notes on Expert.", points = 25,
//     id = 128947, badge = "141806",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 911727708) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Kung Fu Fighting 100%", description = "Complete Kung Fu Fighting without missing notes on Expert.", points = 25,
//     id = 128948, badge = "141807",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2968197638) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Suddenly I See 100%", description = "Complete Suddenly I See without missing notes on Expert.", points = 25,
//     id = 128949, badge = "141808",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 1206394708) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "A-Punk 100%", description = "Complete A-Punk without missing notes on Expert.", points = 25,
//     id = 128950, badge = "141809",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 1863362273) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Two Princes 100%", description = "Complete Two Princes without missing notes on Expert.", points = 25,
//     id = 128951, badge = "141810",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2610945622) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "The Passenger 100%", description = "Complete The Passenger without missing notes on Expert.", points = 25,
//     id = 128952, badge = "141811",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 4234164107) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Grace 100%", description = "Complete Grace without missing notes on Expert.", points = 25,
//     id = 128953, badge = "141812",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 68077464) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
//               game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )


// achievement(
//     title = "We Will Rock You 100%", description = "Complete We Will Rock You without missing notes on Expert.", points = 25,
//     id = 128929, badge = "141787", published = "13/10/2020 00:18:15", modified = "25/10/2020 18:03:49",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 3929777056) && (music_finished() == 1 || music_finished()
//                == 2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "We Are the Champions 100%", description = "Complete We Are the Champions without missing notes on Expert.", points = 25,
//     id = 128930, badge = "141788", published = "13/10/2020 00:18:19", modified = "25/10/2020 18:03:49",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2770645661) && (music_finished() == 1 || music_finished()
//                == 2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )   

// achievement(
//     title = "Let's Dance 100%", description = "Complete Let's Dance without missing notes on Expert.", points = 25,
//     id = 128931, badge = "141791", published = "13/10/2020 00:18:20", modified = "25/10/2020 18:03:51",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 3016712890) && (music_finished() == 1 || music_finished()
//                == 2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "So What 100%", description = "Complete So What without missing notes on Expert.", points = 25,
//     id = 128932, badge = "141851", published = "13/10/2020 00:18:21", modified = "25/10/2020 18:03:51",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2912727528) && (music_finished() == 1 || music_finished()
//                == 2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Check Yes Juliet 100%", description = "Complete Check Yes Juliet without missing notes on Expert.", points = 25,
//     id = 128933, badge = "141792", published = "13/10/2020 00:18:22", modified = "25/10/2020 18:03:52",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 4061417512) && (music_finished() == 1 || music_finished()
//                == 2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Song 2 100%", description = "Complete Song 2 without missing notes on Expert.", points = 25,
//     id = 128934, badge = "141793", published = "13/10/2020 00:18:23", modified = "25/10/2020 18:03:53",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2451569639) && (music_finished() == 1 || music_finished()
//                == 2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Free Fallin' 100%", description = "Complete Free Fallin' without missing notes on Expert.", points = 25,
//     id = 128935, badge = "141794", published = "13/10/2020 00:18:25", modified = "25/10/2020 18:03:54",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 1734149620) && (music_finished() == 1 || music_finished()
//                == 2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "In Too Deep 100%", description = "Complete In Too Deep without missing notes on Expert.", points = 25,
//     id = 128936, badge = "141795", published = "13/10/2020 00:18:26", modified = "25/10/2020 18:03:55",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 3547676851) && (music_finished() == 1 || music_finished()
//                == 2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Swing Swing 100%", description = "Complete Swing Swing without missing notes on Expert.", points = 25,
//     id = 128937, badge = "141796", published = "13/10/2020 00:18:27", modified = "25/10/2020 18:03:56",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 3922685756) && (music_finished() == 1 || music_finished()
//                == 2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Accidentally in Love 100%", description = "Complete Accidentally in Love without missing notes on Expert.", points = 25,
//     id = 128938, badge = "141797", published = "13/10/2020 00:18:28", modified = "25/10/2020 18:03:57",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 574522356) && (music_finished() == 1 || music_finished() ==
//                2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Crash 100%", description = "Complete Crash without missing notes on Expert.", points = 25,
//     id = 128939, badge = "141798", published = "13/10/2020 00:18:29", modified = "25/10/2020 18:03:58",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 64383879) && (music_finished() == 1 || music_finished() ==
//                2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Ruby 100%", description = "Complete Ruby without missing notes on Expert.", points = 25,
//     id = 128940, badge = "141799", published = "13/10/2020 00:18:30", modified = "25/10/2020 18:03:59",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2526682) && (music_finished() == 1 || music_finished() ==
//                2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Girls and Boys 100%", description = "Complete Girls and Boys without missing notes on Expert.", points = 25,
//     id = 128941, badge = "141800", published = "13/10/2020 00:18:34", modified = "25/10/2020 18:04:00",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 632551701) && (music_finished() == 1 || music_finished() ==
//                2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "The Final Countdown 100%", description = "Complete The Final Countdown without missing notes on Expert.", points = 25,
//     id = 128942, badge = "141801", published = "13/10/2020 00:18:36", modified = "25/10/2020 18:04:02",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 1200848440) && (music_finished() == 1 || music_finished()
//                == 2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Ghostbusters 100%", description = "Complete Ghostbusters without missing notes on Expert.", points = 25,
//     id = 128943, badge = "141853", published = "13/10/2020 00:18:37", modified = "25/10/2020 18:04:03",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 3329479043) && (music_finished() == 1 || music_finished()
//                == 2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Walking on Sunshine 100%", description = "Complete Walking on Sunshine without missing notes on Expert.", points = 25,
//     id = 128944, badge = "141803", published = "13/10/2020 00:18:38", modified = "25/10/2020 18:04:03",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2529911673) && (music_finished() == 1 || music_finished()
//                == 2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Monster 100%", description = "Complete Monster without missing notes on Expert.", points = 25,
//     id = 128945, badge = "141804", published = "13/10/2020 00:18:39", modified = "25/10/2020 18:04:05",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 1954599866) && (music_finished() == 1 || music_finished()
//                == 2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "I Want you Back 100%", description = "Complete I Want you Back without missing notes on Expert.", points = 25,
//     id = 128946, badge = "141805", published = "13/10/2020 00:18:41", modified = "25/10/2020 18:04:06",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 695918785) && (music_finished() == 1 || music_finished() ==
//                2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Life is a Highway 100%", description = "Complete Life is a Highway without missing notes on Expert.", points = 25,
//     id = 128947, badge = "141806", published = "13/10/2020 00:18:42", modified = "25/10/2020 18:04:07",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 911727708) && (music_finished() == 1 || music_finished() ==
//                2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Kung Fu Fighting 100%", description = "Complete Kung Fu Fighting without missing notes on Expert.", points = 25,
//     id = 128948, badge = "141807", published = "13/10/2020 00:18:43", modified = "25/10/2020 18:04:09",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2968197638) && (music_finished() == 1 || music_finished()
//                == 2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Suddenly I See 100%", description = "Complete Suddenly I See without missing notes on Expert.", points = 25,
//     id = 128949, badge = "141808", published = "13/10/2020 00:18:44", modified = "25/10/2020 18:04:10",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 1206394708) && (music_finished() == 1 || music_finished()
//                == 2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "A-Punk 100%", description = "Complete A-Punk without missing notes on Expert.", points = 25,
//     id = 128950, badge = "141809", published = "13/10/2020 00:18:46", modified = "25/10/2020 18:04:11",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 1863362273) && (music_finished() == 1 || music_finished()
//                == 2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Two Princes 100%", description = "Complete Two Princes without missing notes on Expert.", points = 25,
//     id = 128951, badge = "141810", published = "13/10/2020 00:18:47", modified = "25/10/2020 18:04:12",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2610945622) && (music_finished() == 1 || music_finished()
//                == 2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "The Passenger 100%", description = "Complete The Passenger without missing notes on Expert.", points = 25,
//     id = 128952, badge = "141811", published = "13/10/2020 00:18:48", modified = "25/10/2020 18:04:13",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 4234164107) && (music_finished() == 1 || music_finished()
//                == 2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )

// achievement(
//     title = "Grace 100%", description = "Complete Grace without missing notes on Expert.", points = 25,
//     id = 128953, badge = "141812", published = "13/10/2020 00:18:49", modified = "25/10/2020 18:04:14",
//     trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 68077464) && (music_finished() == 1 || music_finished() ==
//                2) && game_difficulty() == 4 && never(game_inside_music() != 1) &&
//               ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
//                  == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
//                (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
//                  == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
// )


// =========================================
//                Golden Star              
// =========================================

function obtained_gold_stars_ptr1() => word(pointer_music1() + 0x29FF58) == 6 && prev(word(pointer_music1() + 0x29FF58)) == 5
function obtained_gold_stars_ptr2() => word(pointer_music1() + 0x2AFF58) == 6 && prev(word(pointer_music1() + 0x2AFF58)) == 5

achievement(
    title = "We Will Star You", description = "Achieve Gold Stars on We Will Rock You.", points = 25,
    id = 128954, badge = "141813", published = "13/10/2020 00:18:50", modified = "25/10/2020 18:04:16",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 3929777056) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "We Are the Stars", description = "Achieve Gold Stars on We Are the Champions.", points = 25,
    id = 128955, badge = "141815", published = "13/10/2020 00:18:51", modified = "25/10/2020 18:04:16",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2770645661) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "And Tremble Like A Star", description = "Achieve Gold Stars on Let's Dance.", points = 25,
    id = 128956, badge = "141816", published = "13/10/2020 00:18:52", modified = "25/10/2020 18:04:17",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 3016712890) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "I'm Still a Rock Star", description = "Achieve Gold Stars on So What.", points = 25,
    id = 128957, badge = "141817", published = "13/10/2020 00:18:53", modified = "25/10/2020 18:04:19",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2912727528) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "Check Yes Star", description = "Achieve Gold Stars on Check Yes Juliet.", points = 25,
    id = 128958, badge = "141818", published = "13/10/2020 00:18:54", modified = "25/10/2020 18:04:18",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 4061417512) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "Star 2", description = "Achieve Gold Stars on Song 2.", points = 25,
    id = 128959, badge = "141819", published = "13/10/2020 00:18:55", modified = "25/10/2020 18:04:20",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2451569639) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "Free Starring", description = "Achieve Gold Stars on Free Fallin'.", points = 25,
    id = 128960, badge = "141849", published = "13/10/2020 00:18:56", modified = "25/10/2020 18:04:23",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 1734149620) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "Cause I'm in Too Star, and I'm Trying to Keep", description = "Achieve Gold Stars on In Too Deep.", points = 25,
    id = 128961, badge = "141848", published = "13/10/2020 00:18:58", modified = "25/10/2020 18:04:24",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 3547676851) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "My Star Is Crushed by a Former Love.", description = "Achieve Gold Stars on Swing Swing.", points = 25,
    id = 128962, badge = "141823", published = "13/10/2020 00:18:58", modified = "25/10/2020 18:04:25",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 3922685756) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "Accidentaly in Star", description = "Achieve Gold Stars on Accidentally in Love.", points = 25,
    id = 128963, badge = "141822", published = "13/10/2020 00:19:00", modified = "25/10/2020 18:04:26",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 574522356) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "Don't Lookout, Gonna Break Your Star", description = "Achieve Gold Stars on Crash.", points = 25,
    id = 128964, badge = "141843", published = "13/10/2020 00:19:01", modified = "25/10/2020 18:04:27",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 64383879) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "Know What You're Doing, Doing to Star", description = "Achieve Gold Stars on Ruby.", points = 25,
    id = 128965, badge = "141845", published = "13/10/2020 00:19:02", modified = "25/10/2020 18:04:28",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2526682) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "Girls and Stars", description = "Achieve Gold Stars on Girls and Boys.", points = 25,
    id = 128966, badge = "141846", published = "13/10/2020 00:19:03", modified = "25/10/2020 18:04:31",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 632551701) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "The Final Star", description = "Achieve Gold Stars on The Final Countdown.", points = 25,
    id = 128967, badge = "141827", published = "13/10/2020 00:19:04", modified = "25/10/2020 18:04:32",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 1200848440) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "Starbusters", description = "Achieve Gold Stars on Ghostbusters.", points = 25,
    id = 128968, badge = "141828", published = "13/10/2020 00:19:06", modified = "25/10/2020 18:04:34",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 3329479043) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "Walking on Star", description = "Achieve Gold Stars on Walking on Sunshine.", points = 25,
    id = 128969, badge = "141829", published = "13/10/2020 00:19:07", modified = "25/10/2020 18:04:35",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2529911673) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "Is It a Star? Is It a Star?", description = "Achieve Gold Stars on Monster.", points = 25,
    id = 128970, badge = "141831", published = "13/10/2020 00:19:13", modified = "25/10/2020 18:04:37",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 1954599866) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "Oh, Star, Give Me One More Chance", description = "Achieve Gold Stars on I Want you Back.", points = 25,
    id = 128971, badge = "141832", published = "13/10/2020 00:19:14", modified = "25/10/2020 18:04:40",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 695918785) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "Star is a Highway", description = "Achieve Gold Stars on Life is a Highway.", points = 25,
    id = 128972, badge = "141833", published = "13/10/2020 00:19:15", modified = "25/10/2020 18:04:41",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 911727708) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "Star Fighting", description = "Achieve Gold Stars on Kung Fu Fighting.", points = 25,
    id = 128973, badge = "141842", published = "13/10/2020 00:19:16", modified = "25/10/2020 18:04:41",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2968197638) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "Her Star Is a Map of the World", description = "Achieve Gold Stars on Suddenly I See.", points = 25,
    id = 128974, badge = "141835", published = "13/10/2020 00:19:17", modified = "25/10/2020 18:04:42",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 1206394708) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "A-Star", description = "Achieve Gold Stars on A-Punk.", points = 25,
    id = 128975, badge = "141836", published = "13/10/2020 00:19:18", modified = "25/10/2020 18:04:43",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 1863362273) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "Two Stars", description = "Achieve Gold Stars on Two Princes.", points = 25,
    id = 128976, badge = "141839", published = "13/10/2020 00:19:19", modified = "25/10/2020 18:04:44",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2610945622) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "I'm the Star", description = "Achieve Gold Stars on The Passenger.", points = 25,
    id = 128977, badge = "141840", published = "13/10/2020 00:19:21", modified = "25/10/2020 18:04:45",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 4234164107) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)

achievement(
    title = "Save Your Money for the Stars", description = "Achieve Gold Stars on Grace.", points = 25,
    id = 128978, badge = "141841", published = "13/10/2020 00:19:23", modified = "25/10/2020 18:04:47",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 68077464) && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && obtained_gold_stars_ptr1() ||
               (unless(pointer_music3() != 555) && obtained_gold_stars_ptr2())))
)