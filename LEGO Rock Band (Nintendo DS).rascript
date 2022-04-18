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

achievement(
    title = "We Will Rock You 100%", description = "Complete We Will Rock You without missing notes on Expert.", points = 25,
    id = 128929, badge = "141787",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 3929777056) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "We Are the Champions 100%", description = "Complete We Are the Champions without missing notes on Expert.", points = 25,
    id = 128930, badge = "141788",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2770645661) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "Let's Dance 100%", description = "Complete Let's Dance without missing notes on Expert.", points = 25,
    id = 128931, badge = "141791",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 3016712890) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "So What 100%", description = "Complete So What without missing notes on Expert.", points = 25,
    id = 128932, badge = "141851",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2912727528) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "Check Yes Juliet 100%", description = "Complete Check Yes Juliet without missing notes on Expert.", points = 25,
    id = 128933, badge = "141792",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 4061417512) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "Song 2 100%", description = "Complete Song 2 without missing notes on Expert.", points = 25,
    id = 128934, badge = "141793",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2451569639) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "Free Fallin' 100%", description = "Complete Free Fallin' without missing notes on Expert.", points = 25,
    id = 128935, badge = "141794",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 1734149620) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "In Too Deep 100%", description = "Complete In Too Deep without missing notes on Expert.", points = 25,
    id = 128936, badge = "141795",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 3547676851) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "Swing Swing 100%", description = "Complete Swing Swing without missing notes on Expert.", points = 25,
    id = 128937, badge = "141796",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 3922685756) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "Accidentally in Love 100%", description = "Complete Accidentally in Love without missing notes on Expert.", points = 25,
    id = 128938, badge = "141797",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 574522356) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "Crash 100%", description = "Complete Crash without missing notes on Expert.", points = 25,
    id = 128939, badge = "141798",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 64383879) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "Ruby 100%", description = "Complete Ruby without missing notes on Expert.", points = 25,
    id = 128940, badge = "141799",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2526682) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "Girls and Boys 100%", description = "Complete Girls and Boys without missing notes on Expert.", points = 25,
    id = 128941, badge = "141800",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 632551701) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "The Final Countdown 100%", description = "Complete The Final Countdown without missing notes on Expert.", points = 25,
    id = 128942, badge = "141801",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 1200848440) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "Ghostbusters 100%", description = "Complete Ghostbusters without missing notes on Expert.", points = 25,
    id = 128943, badge = "141853",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 3329479043) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "Walking on Sunshine 100%", description = "Complete Walking on Sunshine without missing notes on Expert.", points = 25,
    id = 128944, badge = "141803",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2529911673) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "Monster 100%", description = "Complete Monster without missing notes on Expert.", points = 25,
    id = 128945, badge = "141804",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 1954599866) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "I Want you Back 100%", description = "Complete I Want you Back without missing notes on Expert.", points = 25,
    id = 128946, badge = "141805",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 695918785) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "Life is a Highway 100%", description = "Complete Life is a Highway without missing notes on Expert.", points = 25,
    id = 128947, badge = "141806",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 911727708) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "Kung Fu Fighting 100%", description = "Complete Kung Fu Fighting without missing notes on Expert.", points = 25,
    id = 128948, badge = "141807",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2968197638) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "Suddenly I See 100%", description = "Complete Suddenly I See without missing notes on Expert.", points = 25,
    id = 128949, badge = "141808",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 1206394708) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "A-Punk 100%", description = "Complete A-Punk without missing notes on Expert.", points = 25,
    id = 128950, badge = "141809",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 1863362273) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "Two Princes 100%", description = "Complete Two Princes without missing notes on Expert.", points = 25,
    id = 128951, badge = "141810",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 2610945622) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "The Passenger 100%", description = "Complete The Passenger without missing notes on Expert.", points = 25,
    id = 128952, badge = "141811",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 4234164107) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)

achievement(
    title = "Grace 100%", description = "Complete Grace without missing notes on Expert.", points = 25,
    id = 128953, badge = "141812",
    trigger = repeated(100, dword(pointer_music2() + 0x0004C0) == 68077464) && trigger_when(music_finished() == 1 || music_finished() == 2) &&
              game_difficulty() == 4 && never(game_inside_music() != 1) &&
              ((unless(pointer_music3() != 554) && word(pointer_music1() + 0x29FF3C) == 0 && word(pointer_music1() + 0x29FF40)
                 == 0 && word(pointer_music1() + 0x29FF44) == 0 && word(pointer_music1() + 0x29FF48) == 0) ||
               (unless(pointer_music3() != 555) && word(pointer_music1() + 0x2AFF3C) == 0 && word(pointer_music1() + 0x2AFF40)
                 == 0 && word(pointer_music1() + 0x2AFF44) == 0 && word(pointer_music1() + 0x2AFF48) == 0))
)


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
