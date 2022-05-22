// ~Hack~ Ultimate Mortal Kombat Trilogy
// #ID = 13421

function p1_char() => byte(0x000126)
function game_screen() => byte(0x00014C)
function p1_active() => byte(0x0002EC)
function p2_active() => byte(0x0002EE)

function round_ended() => byte(0x0002F8)

function p1_hp() => word(0x00F228)
// 0xa6=Full HP (100 health)
// 0x14c=Full HP (200 health)

function match_finishing_move() => byte(0x00F4FE)
function match_finishing_move_message() => byte(0x00F5A8)
// 0x01=Fatality
// 0x03=Animality
// 0x04=Friendship
// 0x05=Babality
// 0x06=Brutality

function option_finish_him_resist() => byte(0x00F882)
function option_b_quick_end() => byte(0x00F8EF)

achievement(
    title = "Completality - Baraka", description = "Perform a Fatality, Animality, Friendship and Babality as Baraka during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147148, badge = "164311", published = "25/03/2021 18:26:58", modified = "25/03/2021 19:53:01",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 4 && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 5 && match_finishing_move() > prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && 
              unless((p1_active() != 1 || p2_active() == 1)) &&
              unless(p1_char() != 28) && 
              unless((p1_hp() == 0 && round_ended() == 1)) && 
              option_b_quick_end() == 0 &&
              ((always_true()) ||
              (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Chameleon", description = "Perform a Fatality, Animality, Friendship and Babality as Chameleon during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147149, badge = "164312", published = "25/03/2021 18:26:59", modified = "25/03/2021 19:53:02",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               25) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Classic Sub-Zero", description = "Perform a Fatality, Animality, Friendship and Babality as Classic Sub-Zero during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147150, badge = "164313", published = "25/03/2021 18:27:00", modified = "25/03/2021 19:53:03",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               21) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Cyrax", description = "Perform a Fatality, Animality, Friendship and Babality as Cyrax during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147151, badge = "164314", published = "25/03/2021 18:27:01", modified = "25/03/2021 19:53:04",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() != 8) && 
              unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Ermac", description = "Perform a Fatality, Animality, Friendship and Babality as Ermac during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147152, badge = "164315", published = "25/03/2021 18:27:02", modified = "25/03/2021 19:53:06",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               20) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Goro", description = "Perform a Fatality, Animality, Friendship and Babality as Goro during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147153, badge = "164316", published = "25/03/2021 18:27:03", modified = "25/03/2021 19:53:09",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               33) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Human Smoke UMK3", description = "Perform a Fatality, Animality, Friendship and Babality as Human Smoke UMK3 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147154, badge = "164317", published = "25/03/2021 18:27:04", modified = "25/03/2021 19:53:10",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               22) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Jade MK2", description = "Perform a Fatality, Animality, Friendship and Babality as Jade MK2 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147155, badge = "164318", published = "25/03/2021 18:27:05", modified = "25/03/2021 19:53:10",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               44) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Jade UMK3", description = "Perform a Fatality, Animality, Friendship and Babality as Jade UMK3 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147156, badge = "164319", published = "25/03/2021 18:27:06", modified = "25/03/2021 19:53:12",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               16) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Jax MK2", description = "Perform a Fatality, Animality, Friendship and Babality as Jax MK2 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147157, badge = "164320", published = "25/03/2021 18:27:08", modified = "25/03/2021 19:53:12",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               35) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Jax MK3", description = "Perform a Fatality, Animality, Friendship and Babality as Jax MK3 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147158, badge = "164321", published = "25/03/2021 18:27:09", modified = "25/03/2021 19:53:13",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() != 2) && 
              unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Johnny Cage MK1", description = "Perform a Fatality, Animality, Friendship and Babality as Johnny Cage MK1 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147159, badge = "164322", published = "25/03/2021 18:27:10", modified = "25/03/2021 19:53:14",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               51) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Johnny Cage MK2", description = "Perform a Fatality, Animality, Friendship and Babality as Johnny Cage MK2 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147160, badge = "164323", published = "25/03/2021 18:27:10", modified = "25/03/2021 19:53:16",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               31) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Johnny Cage MKT", description = "Perform a Fatality, Animality, Friendship and Babality as Johnny Cage MKT during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147161, badge = "164324", published = "25/03/2021 18:27:11", modified = "25/03/2021 19:53:17",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               47) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Kabal", description = "Perform a Fatality, Animality, Friendship and Babality as Kabal during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147162, badge = "164325", published = "25/03/2021 18:27:12", modified = "25/03/2021 19:53:18",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               10) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Kano MK1", description = "Perform a Fatality, Animality, Friendship and Babality as Kano MK1 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147163, badge = "164326", published = "25/03/2021 18:27:13", modified = "25/03/2021 19:53:19",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               48) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Kano MK3", description = "Perform a Fatality, Animality, Friendship and Babality as Kano MK3 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147164, badge = "164327", published = "25/03/2021 18:27:14", modified = "25/03/2021 19:53:20",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() != 0) && 
              unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Khameleon MKT", description = "Perform a Fatality, Animality, Friendship and Babality as Khameleon MKT during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147165, badge = "164328", published = "25/03/2021 18:27:15", modified = "25/03/2021 19:53:21",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               11) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Kintaro", description = "Perform a Fatality, Animality, Friendship and Babality as Kintaro during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147166, badge = "164329", published = "25/03/2021 18:27:18", modified = "25/03/2021 19:53:23",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               32) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Kitana MK2", description = "Perform a Fatality, Animality, Friendship and Babality as Kitana MK2 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147167, badge = "164367", published = "25/03/2021 18:27:19", modified = "25/03/2021 19:53:24",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               43) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Kitana UMK3", description = "Perform a Fatality, Animality, Friendship and Babality as Kitana UMK3 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147168, badge = "164330", published = "25/03/2021 18:27:20", modified = "25/03/2021 19:53:25",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               15) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Kung Lao MK2", description = "Perform a Fatality, Animality, Friendship and Babality as Kung Lao MK2 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147169, badge = "164331", published = "25/03/2021 18:27:21", modified = "25/03/2021 19:53:26",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               46) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Kung Lao MK3", description = "Perform a Fatality, Animality, Friendship and Babality as Kung Lao MK3 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147170, badge = "164332", published = "25/03/2021 18:27:22", modified = "25/03/2021 19:53:27",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() != 9) && 
              unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Liu Kang MK1", description = "Perform a Fatality, Animality, Friendship and Babality as Liu Kang MK1 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147171, badge = "164333", published = "25/03/2021 18:27:23", modified = "25/03/2021 19:53:28",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               50) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Liu Kang MK2", description = "Perform a Fatality, Animality, Friendship and Babality as Liu Kang MK2 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147172, badge = "164334", published = "25/03/2021 18:27:25", modified = "25/03/2021 19:53:30",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               29) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Liu Kang MK3", description = "Perform a Fatality, Animality, Friendship and Babality as Liu Kang MK3 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147173, badge = "164335", published = "25/03/2021 18:27:26", modified = "25/03/2021 19:53:31",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               13) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Mileena MK2", description = "Perform a Fatality, Animality, Friendship and Babality as Mileena MK2 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147174, badge = "164336", published = "25/03/2021 18:27:27", modified = "25/03/2021 19:53:32",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               45) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Mileena UMK3", description = "Perform a Fatality, Animality, Friendship and Babality as Mileena UMK3 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147175, badge = "164337", published = "25/03/2021 18:27:28", modified = "25/03/2021 19:53:33",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               17) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Motaro", description = "Perform a Fatality, Animality, Friendship and Babality as Motaro during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147176, badge = "164338", published = "25/03/2021 18:27:29", modified = "25/03/2021 19:53:34",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               26) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Nightwolf", description = "Perform a Fatality, Animality, Friendship and Babality as Nightwolf during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147177, badge = "164339", published = "25/03/2021 18:27:30", modified = "25/03/2021 19:53:36",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() != 3) && 
              unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Noob Saibot MK2", description = "Perform a Fatality, Animality, Friendship and Babality as Noob Saibot MK2 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147178, badge = "164340", published = "25/03/2021 18:27:31", modified = "25/03/2021 19:53:37",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               42) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Noob Saibot UMK3", description = "Perform a Fatality, Animality, Friendship and Babality as Noob Saibot UMK3 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147179, badge = "164341", published = "25/03/2021 18:27:35", modified = "25/03/2021 19:53:38",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               23) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Rain", description = "Perform a Fatality, Animality, Friendship and Babality as Rain during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147180, badge = "164342", published = "25/03/2021 18:27:36", modified = "25/03/2021 19:53:39",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               24) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Rayden MK1", description = "Perform a Fatality, Animality, Friendship and Babality as Rayden MK1 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147181, badge = "164343", published = "25/03/2021 18:27:37", modified = "25/03/2021 19:53:40",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               52) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Rayden MK2", description = "Perform a Fatality, Animality, Friendship and Babality as Rayden MK2 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147182, badge = "164344", published = "25/03/2021 18:27:38", modified = "25/03/2021 19:53:41",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               36) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Reptile MK1", description = "Perform a Fatality, Animality, Friendship and Babality as Reptile MK1 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147183, badge = "164345", published = "25/03/2021 18:27:39", modified = "25/03/2021 19:53:42",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               54) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Reptile MK2", description = "Perform a Fatality, Animality, Friendship and Babality as Reptile MK2 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147184, badge = "164346", published = "25/03/2021 18:27:40", modified = "25/03/2021 19:53:43",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               39) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Reptile UMK3", description = "Perform a Fatality, Animality, Friendship and Babality as Reptile UMK3 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147185, badge = "164347", published = "25/03/2021 18:27:41", modified = "25/03/2021 19:53:44",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               19) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Scorpion MK1", description = "Perform a Fatality, Animality, Friendship and Babality as Scorpion MK1 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147186, badge = "164348", published = "25/03/2021 18:27:42", modified = "25/03/2021 19:53:45",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               53) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Scorpion MK2", description = "Perform a Fatality, Animality, Friendship and Babality as Scorpion MK2 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147187, badge = "164349", published = "25/03/2021 18:27:43", modified = "25/03/2021 19:53:46",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               38) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Scorpion UMK3", description = "Perform a Fatality, Animality, Friendship and Babality as Scorpion UMK3 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147188, badge = "164350", published = "25/03/2021 18:27:44", modified = "25/03/2021 19:53:47",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               18) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Sektor", description = "Perform a Fatality, Animality, Friendship and Babality as Sektor during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147189, badge = "164351", published = "25/03/2021 18:27:45", modified = "25/03/2021 19:53:48",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() != 7) && 
              unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Shang Tsung MK1", description = "Perform a Fatality, Animality, Friendship and Babality as Shang Tsung MK1 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147190, badge = "164370", published = "25/03/2021 18:27:46", modified = "25/03/2021 19:53:50",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               56) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Shang Tsung MK2", description = "Perform a Fatality, Animality, Friendship and Babality as Shang Tsung MK2 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147191, badge = "164352", published = "25/03/2021 18:27:48", modified = "25/03/2021 19:53:51",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               37) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Shang Tsung MK3", description = "Perform a Fatality, Animality, Friendship and Babality as Shang Tsung MK3 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147192, badge = "164353", published = "25/03/2021 18:27:49", modified = "25/03/2021 19:53:52",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               12) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Shao Kahn MK2", description = "Perform a Fatality, Animality, Friendship and Babality as Shao Kahn MK2 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147193, badge = "164354", published = "25/03/2021 18:27:50", modified = "25/03/2021 19:53:53",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               34) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Shao Kahn MK3", description = "Perform a Fatality, Animality, Friendship and Babality as Shao Kahn MK3 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147194, badge = "164355", published = "25/03/2021 18:27:51", modified = "25/03/2021 19:53:54",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               27) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Sheeva", description = "Perform a Fatality, Animality, Friendship and Babality as Sheeva during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147195, badge = "164356", published = "25/03/2021 18:27:52", modified = "25/03/2021 19:53:55",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               57) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Sindel", description = "Perform a Fatality, Animality, Friendship and Babality as Sindel during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147196, badge = "164357", published = "25/03/2021 18:27:53", modified = "25/03/2021 19:53:57",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() != 6) && 
              unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Smoke", description = "Perform a Fatality, Animality, Friendship and Babality as Smoke during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147197, badge = "164358", published = "25/03/2021 18:27:54", modified = "25/03/2021 19:53:57",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               14) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Smoke MK2", description = "Perform a Fatality, Animality, Friendship and Babality as Smoke MK2 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147198, badge = "164359", published = "25/03/2021 18:27:55", modified = "25/03/2021 19:53:58",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               41) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Sonya MK1", description = "Perform a Fatality, Animality, Friendship and Babality as Sonya MK1 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147199, badge = "164360", published = "25/03/2021 18:27:56", modified = "25/03/2021 19:53:59",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               49) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Sonya MK3", description = "Perform a Fatality, Animality, Friendship and Babality as Sonya MK3 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147200, badge = "164361", published = "25/03/2021 18:27:57", modified = "25/03/2021 19:54:00",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() != 1) && 
              unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Stryker", description = "Perform a Fatality, Animality, Friendship and Babality as Stryker during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147201, badge = "164362", published = "25/03/2021 18:27:58", modified = "25/03/2021 19:54:01",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() != 5) && 
              unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Sub-Zero MK1", description = "Perform a Fatality, Animality, Friendship and Babality as Sub-Zero MK1 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147202, badge = "164363", published = "25/03/2021 18:27:59", modified = "25/03/2021 19:54:03",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               55) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Sub-Zero MK2", description = "Perform a Fatality, Animality, Friendship and Babality as Sub-Zero MK2 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147203, badge = "164364", published = "25/03/2021 18:28:01", modified = "25/03/2021 19:54:05",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() !=
               40) && unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)

achievement(
    title = "Completality - Sub-Zero MK3", description = "Perform a Fatality, Animality, Friendship and Babality as Sub-Zero MK3 during an Arcade ladder (no F. Him Resist and B-Quick End).", points = 10,
    id = 147204, badge = "164366", published = "25/03/2021 18:28:02", modified = "25/03/2021 19:54:06",
    trigger = once((match_finishing_move() == 1 || match_finishing_move() == 2) && match_finishing_move() > prev(match_finishing_move())) && 
              once(match_finishing_move() == 3 && match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 4 &&
               match_finishing_move() > prev(match_finishing_move())) && once(match_finishing_move() == 5 && match_finishing_move() >
               prev(match_finishing_move())) && 
              option_finish_him_resist() == 0 && unless((p1_active() != 1 || p2_active() == 1)) && unless(p1_char() != 4) && 
              unless((p1_hp() == 0 && round_ended() == 1)) && option_b_quick_end() == 0 &&
              ((always_true()) ||
               (never(game_screen() == 20)))
)
