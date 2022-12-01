// Rock Band 3
// #ID = 17140

function current_music() => dword(0x15028C)
function difficulty() => byte(0x150294)
function in_music_flag() => byte(0x150738)
function pointer_music() => word(0x1551D4)

function has_obtained_gold_stars() => word(pointer_music() + 0x24FEBC) == 5 && prev(word(pointer_music() + 0x24FEBC)) == 4

achievement(
    title = "Easy Tap", description = "Achieve 5 stars on \"The Hardest Button to Button\" on Hard or higher.", points = 10,
    id = 136183, badge = "151357", published = "28/12/2020 21:03:43", modified = "02/11/2022 04:57:34",
    trigger = current_music() == 2874207901 && has_obtained_gold_stars() && repeated(100, in_music_flag() ==
               1) && never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "Going Around in Circles", description = "Achieve 5 stars on \"Here I Go Again\" on Hard or higher.", points = 10,
    id = 136184, badge = "151358", published = "28/12/2020 21:03:44", modified = "02/11/2022 04:57:35",
    trigger = current_music() == 1853692431 && has_obtained_gold_stars() && repeated(100, in_music_flag() ==
               1) && never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "You're Perfect, Yes", description = "Achieve 5 stars on \"Midlife Crisis\" on Hard or higher.", points = 10,
    id = 136185, badge = "151359", published = "28/12/2020 21:03:45", modified = "02/11/2022 04:57:35",
    trigger = current_music() == 3699039007 && has_obtained_gold_stars() && repeated(100, in_music_flag() ==
               1) && never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "Oh the Time Has Come", description = "Achieve 5 stars on \"Sister Christian\" on Hard or higher.", points = 10,
    id = 136186, badge = "151360", published = "28/12/2020 21:03:46", modified = "02/11/2022 04:57:35",
    trigger = current_music() == 2083317117 && has_obtained_gold_stars() && repeated(100, in_music_flag() ==
               1) && never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "Spice for the Recipe", description = "Achieve 5 stars on \"Walkin' On The Sun\" on Hard or higher.", points = 10,
    id = 136187, badge = "151361", published = "28/12/2020 21:03:48", modified = "02/11/2022 04:57:36",
    trigger = current_music() == 1310217070 && has_obtained_gold_stars() && repeated(100, in_music_flag() ==
               1) && never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "Is This the Real Life?", description = "Achieve 5 stars on \"Bohemian Rhapsody\" on Hard or higher.", points = 10,
    id = 136188, badge = "151362", published = "28/12/2020 21:03:49", modified = "02/11/2022 04:57:36",
    trigger = current_music() == 1411986403 && has_obtained_gold_stars() && repeated(100, in_music_flag() ==
               1) && never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "Jukebox Baby", description = "Achieve 5 stars on \"I Love Rock n' Roll\" on Hard or higher.", points = 10,
    id = 136189, badge = "151381", published = "28/12/2020 21:03:50", modified = "02/11/2022 04:57:36",
    trigger = current_music() == 3212604723 && has_obtained_gold_stars() && repeated(100, in_music_flag() ==
               1) && never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "Sexy Night", description = "Achieve 5 stars on \"Need You Tonight\" on Hard or higher.", points = 10,
    id = 136190, badge = "151363", published = "28/12/2020 21:03:53", modified = "02/11/2022 04:57:37",
    trigger = current_music() == 1977020146 && has_obtained_gold_stars() && repeated(100, in_music_flag() ==
               1) && never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "For Fox Sake", description = "Achieve 5 stars on \"Portions For Foxes\" on Hard or higher.", points = 10,
    id = 136191, badge = "151364", published = "28/12/2020 21:03:55", modified = "02/11/2022 04:57:37",
    trigger = current_music() == 1050659314 && has_obtained_gold_stars() && repeated(100, in_music_flag() ==
               1) && never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "Weird Animal Sounds", description = "Achieve 5 stars on \"Rock Lobster\" on Hard or higher.", points = 10,
    id = 136192, badge = "151365", published = "28/12/2020 21:03:58", modified = "02/11/2022 04:57:38",
    trigger = current_music() == 129024210 && has_obtained_gold_stars() && repeated(100, in_music_flag() == 1) && 
              never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "Sleepy Little Town", description = "Achieve 5 stars on \"China Grove\" on Hard or higher.", points = 10,
    id = 136193, badge = "151366", published = "28/12/2020 21:04:00", modified = "02/11/2022 04:57:38",
    trigger = current_music() == 220591722 && has_obtained_gold_stars() && repeated(100, in_music_flag() == 1) && 
              never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "Cold Love", description = "Achieve 5 stars on \"Cold As Ice\" on Hard or higher.", points = 10,
    id = 136194, badge = "151367", published = "28/12/2020 21:04:01", modified = "02/11/2022 04:57:39",
    trigger = current_music() == 1780697657 && has_obtained_gold_stars() && repeated(100, in_music_flag() ==
               1) && never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "Don't Mind a Little Pain", description = "Achieve 5 stars on \"Crosstown Traffic\" on Hard or higher.", points = 10,
    id = 136195, badge = "151368", published = "28/12/2020 21:04:02", modified = "02/11/2022 04:57:39",
    trigger = current_music() == 1025625743 && has_obtained_gold_stars() && repeated(100, in_music_flag() ==
               1) && never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "Cyberpunk 2009", description = "Achieve 5 stars on \"Humanoid\" on Hard or higher.", points = 10,
    id = 136196, badge = "151369", published = "28/12/2020 21:04:03", modified = "02/11/2022 04:57:39",
    trigger = current_music() == 1323569533 && has_obtained_gold_stars() && repeated(100, in_music_flag() ==
               1) && never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "Strange as Angels", description = "Achieve 5 stars on \"Just Like Heaven\" on Hard or higher.", points = 10,
    id = 136197, badge = "151370", published = "28/12/2020 21:04:05", modified = "02/11/2022 04:57:40",
    trigger = current_music() == 1397159312 && has_obtained_gold_stars() && repeated(100, in_music_flag() ==
               1) && never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "Mindful Robber", description = "Achieve 5 stars on \"Been Caught Stealling\" on Hard or higher.", points = 10,
    id = 136198, badge = "151371", published = "28/12/2020 21:04:06", modified = "02/11/2022 04:57:40",
    trigger = current_music() == 1923784547 && has_obtained_gold_stars() && repeated(100, in_music_flag() ==
               1) && never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "Break the Barrier", description = "Achieve 5 stars on \"Break On Through (To the Other Side)\" on Hard or higher.", points = 10,
    id = 136199, badge = "151372", published = "28/12/2020 21:04:07", modified = "02/11/2022 04:57:41",
    trigger = current_music() == 193953605 && has_obtained_gold_stars() && repeated(100, in_music_flag() == 1) && 
              never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "Angry White Boy", description = "Achieve 5 stars on \"Get Free\" on Hard or higher.", points = 10,
    id = 136200, badge = "151373", published = "28/12/2020 21:04:08", modified = "02/11/2022 04:57:41",
    trigger = current_music() == 2700709110 && has_obtained_gold_stars() && repeated(100, in_music_flag() ==
               1) && never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "Not My Intention To Brag", description = "Achieve 5 stars on \"Misery Business\" on Hard or higher.", points = 10,
    id = 136201, badge = "151374", published = "28/12/2020 21:04:10", modified = "02/11/2022 04:57:41",
    trigger = current_music() == 1605265323 && has_obtained_gold_stars() && repeated(100, in_music_flag() ==
               1) && never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "OMG!", description = "Achieve 5 stars on \"Oh My God\" on Hard or higher.", points = 10,
    id = 136202, badge = "151375", published = "28/12/2020 21:04:11", modified = "02/11/2022 04:57:42",
    trigger = current_music() == 2160019471 && has_obtained_gold_stars() && repeated(100, in_music_flag() ==
               1) && never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "Ready For a Fight", description = "Achieve 5 stars on \"Combat Baby\" on Hard or higher.", points = 10,
    id = 136203, badge = "151376", published = "28/12/2020 21:04:12", modified = "02/11/2022 04:57:42",
    trigger = current_music() == 3105014370 && has_obtained_gold_stars() && repeated(100, in_music_flag() ==
               1) && never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "SHARON!!!!", description = "Achieve 5 stars on \"Crazy Train\" on Hard or higher.", points = 10,
    id = 136204, badge = "151377", published = "28/12/2020 21:04:13", modified = "02/11/2022 04:57:43",
    trigger = current_music() == 3401289113 && has_obtained_gold_stars() && repeated(100, in_music_flag() ==
               1) && never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "Where Would You Go?", description = "Achieve 5 stars on \"Lasso\" on Hard or higher.", points = 10,
    id = 136205, badge = "151378", published = "28/12/2020 21:04:14", modified = "02/11/2022 04:57:43",
    trigger = current_music() == 72206426 && has_obtained_gold_stars() && repeated(100, in_music_flag() == 1) && 
              never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "I've Got You in My Sights", description = "Achieve 5 stars on \"The Look\" on Hard or higher.", points = 10,
    id = 136206, badge = "151379", published = "28/12/2020 21:04:16", modified = "02/11/2022 04:57:43",
    trigger = current_music() == 1820689646 && has_obtained_gold_stars() && repeated(100, in_music_flag() ==
               1) && never(in_music_flag() == 0) && difficulty() >= 3
)

achievement(
    title = "Is That a Motherf%@$ing JoJo Reference???", description = "Achieve 5 stars on \"Roundabout\" on Hard or higher.", points = 10,
    id = 136207, badge = "151380", published = "28/12/2020 21:04:17", modified = "02/11/2022 04:57:44",
    trigger = current_music() == 340469439 && has_obtained_gold_stars() && repeated(100, in_music_flag() == 1) && 
              never(in_music_flag() == 0) && difficulty() >= 3
)
