// Metal Slug Anthology
// #ID = 3471

function pointer_game_block() => tbyte(0x93bf44)

achievement(
    title = "Final Attack", description = "Finish Metal Slug 1.", points = 25,
    id = 179220, badge = "199572", published = "19/10/2021 02:12:24", modified = "19/10/2021 02:12:24",
    trigger = prev(byte(0x1006ED1 + pointer_game_block())) == 5 && byte(0x1006ED1 + pointer_game_block()) == 6 && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 0)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1))
)

achievement(
    title = "Final Attack (Hard)", description = "Finish Metal Slug 1 on Hard difficulty and Limited Continues (one session).", points = 25,
    id = 179226, badge = "199578", published = "19/10/2021 02:12:26", modified = "19/10/2021 12:39:44",
    trigger = once(byte(0x1006ED1 + pointer_game_block()) == 0 && word(0x1006F50 + pointer_game_block()) == 0) && trigger_when(prev(byte(0x1006ED1 + pointer_game_block())) == 5) && 
              trigger_when(byte(0x1006ED1 + pointer_game_block()) == 6) && never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 0)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && 
              dword(0xB3E380) == 2 && dword(0xB3E384) == 0
)

achievement(
    title = "MS1 - Deathless I", description = "MS1: Finish Mission 1 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 10,
    id = 179171, badge = "199523", published = "19/10/2021 02:12:08", modified = "19/10/2021 13:02:12",
    trigger = repeated(2, byte(0x1006ED1 + pointer_game_block()) == 0 && word(0x1006F50 + pointer_game_block()) == 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x1006ED1 + pointer_game_block())) == 0) && trigger_when(byte(0x1006ED1 + pointer_game_block()) == 1) && never(byte(0x1000376 + pointer_game_block()) != prev(byte(0x1000376 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 0)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS1 - Deathless II", description = "MS1: Finish Mission 2 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 10,
    id = 179172, badge = "199524", published = "19/10/2021 02:12:08", modified = "19/10/2021 02:12:08",
    trigger = once(byte(0x1006ED1 + pointer_game_block()) == 1 && word(0x1006F50 + pointer_game_block()) == 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x1006ED1 + pointer_game_block())) == 1) && trigger_when(byte(0x1006ED1 + pointer_game_block()) == 2) && never(byte(0x1000376 + pointer_game_block()) != prev(byte(0x1000376 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 0)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS1 - Deathless III", description = "MS1: Finish Mission 3 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179173, badge = "199525", published = "19/10/2021 02:12:08", modified = "19/10/2021 13:33:57",
    trigger = once(byte(0x1006ED1 + pointer_game_block()) == 2 && word(0x1006F54 + pointer_game_block()) == 1072) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x1006ED1 + pointer_game_block())) == 2) && trigger_when(byte(0x1006ED1 + pointer_game_block()) == 3) && never(byte(0x1000376 + pointer_game_block()) != prev(byte(0x1000376 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 0)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS1 - Deathless IV", description = "MS1: Finish Mission 4 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 10,
    id = 179174, badge = "199526", published = "19/10/2021 02:12:09", modified = "19/10/2021 02:12:09",
    trigger = once(byte(0x1006ED1 + pointer_game_block()) == 3 && word(0x1006F50 + pointer_game_block()) == 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x1006ED1 + pointer_game_block())) == 3) && trigger_when(byte(0x1006ED1 + pointer_game_block()) == 4) && never(byte(0x1000376 + pointer_game_block()) != prev(byte(0x1000376 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 0)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS1 - Deathless V", description = "MS1: Finish Mission 5 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 10,
    id = 179175, badge = "199527", published = "19/10/2021 02:12:09", modified = "19/10/2021 02:12:09",
    trigger = once(byte(0x1006ED1 + pointer_game_block()) == 4 && word(0x1006F50 + pointer_game_block()) == 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x1006ED1 + pointer_game_block())) == 4) && trigger_when(byte(0x1006ED1 + pointer_game_block()) == 5) && never(byte(0x1000376 + pointer_game_block()) != prev(byte(0x1000376 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 0)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS1 - Deathless VI", description = "MS1: Finish Mission 6 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179176, badge = "199528", published = "19/10/2021 02:12:09", modified = "19/10/2021 02:12:09",
    trigger = once(byte(0x1006ED1 + pointer_game_block()) == 5 && word(0x1006F50 + pointer_game_block()) == 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x1006ED1 + pointer_game_block())) == 5) && trigger_when(byte(0x1006ED1 + pointer_game_block()) == 6) && never(byte(0x1000376 + pointer_game_block()) != prev(byte(0x1000376 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 0)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "First Contact", description = "Finish Metal Slug 2.", points = 25,
    id = 179221, badge = "199585", published = "19/10/2021 02:12:24", modified = "19/10/2021 02:45:00",
    trigger = prev(byte(0x100C31E + pointer_game_block())) == 5 && byte(0x100C31E + pointer_game_block()) == 255 && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 1)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1))
)

achievement(
    title = "First Contact (Hard)", description = "Finish Metal Slug 2 on Hard difficulty and Limited Continues (one session).", points = 25,
    id = 179227, badge = "199586", published = "19/10/2021 02:12:26", modified = "19/10/2021 02:45:01",
    trigger = once(byte(0x100C320 + pointer_game_block()) == 0 && byte(0x100C31E + pointer_game_block()) == 0 && word(0x100E790 + pointer_game_block()) == 0) && 
              trigger_when(prev(byte(0x100C31E + pointer_game_block())) == 5) && trigger_when(byte(0x100C31E + pointer_game_block()) == 255) && never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 1)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && 
              dword(0xB3E380) == 2 && dword(0xB3E384) == 0
)

achievement(
    title = "MS2 - Deathless I", description = "MS2: Finish Mission 1 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 10,
    id = 179177, badge = "199529", published = "19/10/2021 02:12:10", modified = "19/10/2021 02:12:10",
    trigger = once(byte(0x100C320 + pointer_game_block()) == 0 && byte(0x100C31E + pointer_game_block()) == 0 && word(0x100E790 + pointer_game_block()) == 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100C31E + pointer_game_block())) == 0) && trigger_when(byte(0x100C31E + pointer_game_block()) == 1) && never(byte(0x1001277 + pointer_game_block()) != prev(byte(0x1001277 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 1)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS2 - Deathless II", description = "MS2: Finish Mission 2 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179178, badge = "199530", published = "19/10/2021 02:12:10", modified = "19/10/2021 02:12:10",
    trigger = once(byte(0x100C320 + pointer_game_block()) == 0 && byte(0x100C31E + pointer_game_block()) == 1 && word(0x100E790 + pointer_game_block()) == 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100C31E + pointer_game_block())) == 1) && trigger_when(byte(0x100C31E + pointer_game_block()) == 2) && never(byte(0x1001277 + pointer_game_block()) != prev(byte(0x1001277 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 1)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS2 - Deathless III", description = "MS2: Finish Mission 3 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179179, badge = "199531", published = "19/10/2021 02:12:10", modified = "19/10/2021 02:12:10",
    trigger = once(byte(0x100C320 + pointer_game_block()) == 0 && byte(0x100C31E + pointer_game_block()) == 2 && word(0x100E790 + pointer_game_block()) == 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100C31E + pointer_game_block())) == 2) && trigger_when(byte(0x100C31E + pointer_game_block()) == 3) && never(byte(0x1001277 + pointer_game_block()) != prev(byte(0x1001277 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 1)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS2 - Deathless IV", description = "MS2: Finish Mission 4 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179180, badge = "199532", published = "19/10/2021 02:12:11", modified = "19/10/2021 02:12:11",
    trigger = once(byte(0x100C320 + pointer_game_block()) == 0 && byte(0x100C31E + pointer_game_block()) == 3 && word(0x100E790 + pointer_game_block()) == 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100C31E + pointer_game_block())) == 3) && trigger_when(byte(0x100C31E + pointer_game_block()) == 4) && never(byte(0x1001277 + pointer_game_block()) != prev(byte(0x1001277 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 1)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS2 - Deathless V", description = "MS2: Finish Mission 5 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179181, badge = "199533", published = "19/10/2021 02:12:11", modified = "19/10/2021 02:12:11",
    trigger = once(byte(0x100C320 + pointer_game_block()) == 0 && byte(0x100C31E + pointer_game_block()) == 4 && word(0x100E790 + pointer_game_block()) == 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100C31E + pointer_game_block())) == 4) && trigger_when(byte(0x100C31E + pointer_game_block()) == 5) && never(byte(0x1001277 + pointer_game_block()) != prev(byte(0x1001277 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 1)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS2 - Deathless VI", description = "MS2: Finish Mission 6 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179182, badge = "199534", published = "19/10/2021 02:12:11", modified = "19/10/2021 02:12:11",
    trigger = once(byte(0x100C320 + pointer_game_block()) == 0 && byte(0x100C31E + pointer_game_block()) == 5 && word(0x100E790 + pointer_game_block()) == 3) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100C31E + pointer_game_block())) == 5) && trigger_when(byte(0x100C31E + pointer_game_block()) == 255) && never(byte(0x1001277 + pointer_game_block()) != prev(byte(0x1001277 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 1)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "First Contact X", description = "Finish Metal Slug X.", points = 25,
    id = 179222, badge = "199574", published = "19/10/2021 02:12:25", modified = "19/10/2021 02:12:25",
    trigger = prev(byte(0x100C2F4 + pointer_game_block())) == 5 && byte(0x100C2F4 + pointer_game_block()) == 6 && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 5)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1))
)

achievement(
    title = "First Contact X (Hard)", description = "Finish Metal Slug X on Hard difficulty and Limited Continues (one session).", points = 25,
    id = 179228, badge = "199580", published = "19/10/2021 02:12:27", modified = "19/10/2021 02:12:27",
    trigger = once(byte(0x100C2FA + pointer_game_block()) == 0 && byte(0x100C2F4 + pointer_game_block()) == 0 && word(0x100E98E + pointer_game_block()) == 0) && 
              trigger_when(prev(byte(0x100C2F4 + pointer_game_block())) == 5) && trigger_when(byte(0x100C2F4 + pointer_game_block()) == 6) && never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 5)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && 
              dword(0xB3E380) == 2 && dword(0xB3E384) == 0
)

achievement(
    title = "MSX - Deathless I", description = "MSX: Finish Mission 1 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 10,
    id = 179183, badge = "199535", published = "19/10/2021 02:12:12", modified = "19/10/2021 02:12:12",
    trigger = once(byte(0x100C2FA + pointer_game_block()) == 0 && byte(0x100C2F4 + pointer_game_block()) == 0 && word(0x100E98E + pointer_game_block()) == 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100C2F4 + pointer_game_block())) == 0) && trigger_when(byte(0x100C2F4 + pointer_game_block()) == 1) && never(byte(0x1001289 + pointer_game_block()) != prev(byte(0x1001289 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 5)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MSX - Deathless II", description = "MSX: Finish Mission 2 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179184, badge = "199536", published = "19/10/2021 02:12:12", modified = "19/10/2021 02:12:12",
    trigger = once(byte(0x100C2FA + pointer_game_block()) == 0 && byte(0x100C2F4 + pointer_game_block()) == 1 && word(0x100E98E + pointer_game_block()) == 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100C2F4 + pointer_game_block())) == 1) && trigger_when(byte(0x100C2F4 + pointer_game_block()) == 2) && never(byte(0x1001289 + pointer_game_block()) != prev(byte(0x1001289 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 5)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MSX - Deathless III", description = "MSX: Finish Mission 3 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179185, badge = "199537", published = "19/10/2021 02:12:12", modified = "19/10/2021 02:12:12",
    trigger = once(byte(0x100C2FA + pointer_game_block()) == 0 && byte(0x100C2F4 + pointer_game_block()) == 2 && word(0x100E98E + pointer_game_block()) == 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100C2F4 + pointer_game_block())) == 2) && trigger_when(byte(0x100C2F4 + pointer_game_block()) == 3) && never(byte(0x1001289 + pointer_game_block()) != prev(byte(0x1001289 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 5)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MSX - Deathless IV", description = "MSX: Finish Mission 4 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179186, badge = "199538", published = "19/10/2021 02:12:13", modified = "19/10/2021 02:12:13",
    trigger = once(byte(0x100C2FA + pointer_game_block()) == 0 && byte(0x100C2F4 + pointer_game_block()) == 3 && word(0x100E98E + pointer_game_block()) == 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100C2F4 + pointer_game_block())) == 3) && trigger_when(byte(0x100C2F4 + pointer_game_block()) == 4) && never(byte(0x1001289 + pointer_game_block()) != prev(byte(0x1001289 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 5)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MSX - Deathless V", description = "MSX: Finish Mission 5 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179187, badge = "199539", published = "19/10/2021 02:12:13", modified = "19/10/2021 02:12:13",
    trigger = once(byte(0x100C2FA + pointer_game_block()) == 0 && byte(0x100C2F4 + pointer_game_block()) == 4 && word(0x100E98E + pointer_game_block()) == 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100C2F4 + pointer_game_block())) == 4) && trigger_when(byte(0x100C2F4 + pointer_game_block()) == 5) && never(byte(0x1001289 + pointer_game_block()) != prev(byte(0x1001289 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 5)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MSX - Deathless VI", description = "MSX: Finish Mission 6 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179188, badge = "199540", published = "19/10/2021 02:12:13", modified = "19/10/2021 02:12:13",
    trigger = once(byte(0x100C2FA + pointer_game_block()) == 0 && byte(0x100C2F4 + pointer_game_block()) == 5 && word(0x100E98E + pointer_game_block()) <= 3) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100C2F4 + pointer_game_block())) == 5) && trigger_when(byte(0x100C2F4 + pointer_game_block()) == 6) && never(byte(0x1001289 + pointer_game_block()) != prev(byte(0x1001289 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 5)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "The Unknown World", description = "Finish Metal Slug 3.", points = 25,
    id = 179223, badge = "199575", published = "19/10/2021 02:12:25", modified = "19/10/2021 02:12:25",
    trigger = prev(byte(0x10040D + pointer_game_block())) == 4 && byte(0x10040D + pointer_game_block()) == 5 && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 2)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1))
)

achievement(
    title = "The Unknown World (Hard)", description = "Finish Metal Slug 3 on Hard difficulty and Limited Continues (one session).", points = 25,
    id = 179229, badge = "199581", published = "19/10/2021 02:12:27", modified = "19/10/2021 02:12:27",
    trigger = once(byte(0x10040C + pointer_game_block()) == 0 && byte(0x10040D + pointer_game_block()) == 0 && word(0x100E306 + pointer_game_block()) == 0) && 
              trigger_when(prev(byte(0x10040D + pointer_game_block())) == 4) && trigger_when(byte(0x10040D + pointer_game_block()) == 5) && never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 2)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && 
              dword(0xB3E380) == 2 && dword(0xB3E384) == 0
)

achievement(
    title = "MS3 - Deathless I", description = "MS3: Finish Mission 1 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 10,
    id = 179189, badge = "199541", published = "19/10/2021 02:12:14", modified = "19/10/2021 02:12:14",
    trigger = once(byte(0x10040C + pointer_game_block()) == 0 && byte(0x10040D + pointer_game_block()) == 0 && word(0x100E306 + pointer_game_block()) == 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x10040D + pointer_game_block())) == 0) && trigger_when(byte(0x10040D + pointer_game_block()) == 1) && never(byte(0x1002BA + pointer_game_block()) != prev(byte(0x1002BA + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 2)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS3 - Deathless II", description = "MS3: Finish Mission 2 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179190, badge = "199542", published = "19/10/2021 02:12:14", modified = "19/10/2021 02:12:14",
    trigger = once(byte(0x10040C + pointer_game_block()) == 0 && byte(0x10040D + pointer_game_block()) == 1 && word(0x100E306 + pointer_game_block()) == 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x10040D + pointer_game_block())) == 1) && trigger_when(byte(0x10040D + pointer_game_block()) == 2) && never(byte(0x1002BA + pointer_game_block()) != prev(byte(0x1002BA + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 2)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS3 - Deathless III", description = "MS3: Finish Mission 3 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179191, badge = "199543", published = "19/10/2021 02:12:14", modified = "19/10/2021 02:12:14",
    trigger = once(byte(0x10040C + pointer_game_block()) == 1 && byte(0x10040D + pointer_game_block()) == 2 && word(0x100E306 + pointer_game_block()) == 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x10040D + pointer_game_block())) == 2) && trigger_when(byte(0x10040D + pointer_game_block()) == 3) && never(byte(0x1002BA + pointer_game_block()) != prev(byte(0x1002BA + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 2)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS3 - Deathless IV", description = "MS3: Finish Mission 4 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179192, badge = "199544", published = "19/10/2021 02:12:15", modified = "19/10/2021 02:12:15",
    trigger = once(byte(0x10040C + pointer_game_block()) == 0 && byte(0x10040D + pointer_game_block()) == 3 && word(0x100E306 + pointer_game_block()) == 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x10040D + pointer_game_block())) == 3) && trigger_when(byte(0x10040D + pointer_game_block()) == 4) && never(byte(0x1002BA + pointer_game_block()) != prev(byte(0x1002BA + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 2)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS3 - Deathless V", description = "MS3: Finish Mission 5 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179193, badge = "199545", published = "19/10/2021 02:12:15", modified = "19/10/2021 02:12:15",
    trigger = once(byte(0x10040C + pointer_game_block()) == 0 && byte(0x10040D + pointer_game_block()) == 4) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x10040D + pointer_game_block())) == 4) && trigger_when(byte(0x10040D + pointer_game_block()) == 5) && never(byte(0x1002BA + pointer_game_block()) != prev(byte(0x1002BA + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 2)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "Final Madness", description = "Finish Metal Slug 4.", points = 25,
    id = 179224, badge = "199576", published = "19/10/2021 02:12:25", modified = "19/10/2021 02:12:25",
    trigger = prev(byte(0x100BCD + pointer_game_block())) == 5 && byte(0x100BCD + pointer_game_block()) == 6 && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 3)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1))
)

achievement(
    title = "Final Madness (Hard)", description = "Finish Metal Slug 4 on Hard difficulty and Limited Continues (one session).", points = 25,
    id = 179230, badge = "199582", published = "19/10/2021 02:12:27", modified = "19/10/2021 02:12:27",
    trigger = once(byte(0x100BCC + pointer_game_block()) == 0 && byte(0x100BCD + pointer_game_block()) == 0 && word(0x100ECBA + pointer_game_block()) <= 40) && 
              trigger_when(prev(byte(0x100BCD + pointer_game_block())) == 5) && trigger_when(byte(0x100BCD + pointer_game_block()) == 6) && never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 3)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && 
              dword(0xB3E380) == 2 && dword(0xB3E384) == 0
)

achievement(
    title = "MS4 - Deathless I", description = "MS4: Finish Mission 1 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179194, badge = "199546", published = "19/10/2021 02:12:15", modified = "19/10/2021 02:12:15",
    trigger = once(byte(0x100BCC + pointer_game_block()) == 0 && byte(0x100BCD + pointer_game_block()) == 0 && word(0x100ECBA + pointer_game_block()) <= 40) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100BCD + pointer_game_block())) == 0) && trigger_when(byte(0x100BCD + pointer_game_block()) == 1) && never(byte(0x100A88 + pointer_game_block()) != prev(byte(0x100A88 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 3)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS4 - Deathless II", description = "MS4: Finish Mission 2 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179195, badge = "199547", published = "19/10/2021 02:12:16", modified = "19/10/2021 02:12:16",
    trigger = once(byte(0x100BCC + pointer_game_block()) == 0 && byte(0x100BCD + pointer_game_block()) == 1 && word(0x100ECBA + pointer_game_block()) <= 31) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100BCD + pointer_game_block())) == 1) && trigger_when(byte(0x100BCD + pointer_game_block()) == 2) && never(byte(0x100A88 + pointer_game_block()) != prev(byte(0x100A88 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 3)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS4 - Deathless III", description = "MS4: Finish Mission 3 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179196, badge = "199548", published = "19/10/2021 02:12:16", modified = "19/10/2021 02:12:16",
    trigger = once(byte(0x100BCC + pointer_game_block()) == 0 && byte(0x100BCD + pointer_game_block()) == 2 && word(0x100ECBA + pointer_game_block()) <= 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100BCD + pointer_game_block())) == 2) && trigger_when(byte(0x100BCD + pointer_game_block()) == 3) && never(byte(0x100A88 + pointer_game_block()) != prev(byte(0x100A88 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 3)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS4 - Deathless IV", description = "MS4: Finish Mission 4 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179197, badge = "199549", published = "19/10/2021 02:12:16", modified = "19/10/2021 02:12:16",
    trigger = once(byte(0x100BCC + pointer_game_block()) == 0 && byte(0x100BCD + pointer_game_block()) == 3 && word(0x100ECBA + pointer_game_block()) <= 3) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100BCD + pointer_game_block())) == 3) && trigger_when(byte(0x100BCD + pointer_game_block()) == 4) && never(byte(0x100A88 + pointer_game_block()) != prev(byte(0x100A88 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 3)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS4 - Deathless V", description = "MS4: Finish Mission 5 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179198, badge = "199550", published = "19/10/2021 02:12:17", modified = "19/10/2021 02:12:17",
    trigger = once(byte(0x100BCC + pointer_game_block()) == 0 && byte(0x100BCD + pointer_game_block()) == 4 && word(0x100ECBA + pointer_game_block()) <= 5) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100BCD + pointer_game_block())) == 4) && trigger_when(byte(0x100BCD + pointer_game_block()) == 5) && never(byte(0x100A88 + pointer_game_block()) != prev(byte(0x100A88 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 3)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS4 - Deathless VI", description = "MS4: Finish Mission 6 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179199, badge = "199551", published = "19/10/2021 02:12:17", modified = "19/10/2021 02:12:17",
    trigger = once(byte(0x100BCC + pointer_game_block()) == 1 && byte(0x100BCD + pointer_game_block()) == 5 && word(0x100ECBE + pointer_game_block()) == 1726) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100BCD + pointer_game_block())) == 5) && trigger_when(byte(0x100BCD + pointer_game_block()) == 6) && never(byte(0x100A88 + pointer_game_block()) != prev(byte(0x100A88 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 3)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "Last Ditch Resistance", description = "Finish Metal Slug 5.", points = 25,
    id = 179225, badge = "199577", published = "19/10/2021 02:12:26", modified = "19/10/2021 02:12:26",
    trigger = prev(byte(0x100BAD + pointer_game_block())) == 4 && byte(0x100BAD + pointer_game_block()) == 5 && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 4)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1))
)

achievement(
    title = "Last Ditch Resistance (Hard)", description = "Finish Metal Slug 5 on Hard difficulty and Limited Continues (one session).", points = 25,
    id = 179231, badge = "199583", published = "19/10/2021 02:12:28", modified = "19/10/2021 02:12:28",
    trigger = once(byte(0x100BAC + pointer_game_block()) == 0 && byte(0x100BAD + pointer_game_block()) == 0 && word(0x100D3BC + pointer_game_block()) <= 256) && 
              trigger_when(prev(byte(0x100BAD + pointer_game_block())) == 4) && trigger_when(byte(0x100BAD + pointer_game_block()) == 5) && never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 4)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && 
              dword(0xB3E380) == 2 && dword(0xB3E384) == 0
)

achievement(
    title = "MS5 - Deathless I", description = "MS5: Finish Mission 1 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179200, badge = "199552", published = "19/10/2021 02:12:17", modified = "19/10/2021 02:12:17",
    trigger = once(byte(0x100BAC + pointer_game_block()) == 0 && byte(0x100BAD + pointer_game_block()) == 0 && word(0x100D3BC + pointer_game_block()) <= 256) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100BAD + pointer_game_block())) == 0) && trigger_when(byte(0x100BAD + pointer_game_block()) == 1) && never(byte(0x100A40 + pointer_game_block()) != prev(byte(0x100A40 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 4)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS5 - Deathless II", description = "MS5: Finish Mission 2 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179201, badge = "199553", published = "19/10/2021 02:12:18", modified = "19/10/2021 02:12:18",
    trigger = once(byte(0x100BAC + pointer_game_block()) == 1 && byte(0x100BAD + pointer_game_block()) == 1 && word(0x100D3BC + pointer_game_block()) <= 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100BAD + pointer_game_block())) == 1) && trigger_when(byte(0x100BAD + pointer_game_block()) == 2) && never(byte(0x100A40 + pointer_game_block()) != prev(byte(0x100A40 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 4)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS5 - Deathless III", description = "MS5: Finish Mission 3 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179202, badge = "199554", published = "19/10/2021 02:12:18", modified = "19/10/2021 02:12:18",
    trigger = once(byte(0x100BAC + pointer_game_block()) == 0 && byte(0x100BAD + pointer_game_block()) == 2 && word(0x100D3BC + pointer_game_block()) <= 7) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100BAD + pointer_game_block())) == 2) && trigger_when(byte(0x100BAD + pointer_game_block()) == 3) && never(byte(0x100A40 + pointer_game_block()) != prev(byte(0x100A40 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 4)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS5 - Deathless IV", description = "MS5: Finish Mission 4 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179203, badge = "199555", published = "19/10/2021 02:12:18", modified = "19/10/2021 02:12:18",
    trigger = once(byte(0x100BAC + pointer_game_block()) == 0 && byte(0x100BAD + pointer_game_block()) == 3 && word(0x100D3BC + pointer_game_block()) <= 0) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100BAD + pointer_game_block())) == 3) && trigger_when(byte(0x100BAD + pointer_game_block()) == 4) && never(byte(0x100A40 + pointer_game_block()) != prev(byte(0x100A40 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 4)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)

achievement(
    title = "MS5 - Deathless V", description = "MS5: Finish Mission 5 without dying (Load Game allowed on mission start) [Medium Difficulty].", points = 25,
    id = 179204, badge = "199556", published = "19/10/2021 02:12:19", modified = "08/11/2021 14:58:10",
    trigger = once(byte(0x100BAC + pointer_game_block()) == 0 && byte(0x100BAD + pointer_game_block()) == 4 && word(0x100C6C + pointer_game_block()) == 41866) && byte(0x100FDB7 + pointer_game_block()) > 0 && 
              trigger_when(prev(byte(0x100BAD + pointer_game_block())) == 4) && trigger_when(byte(0x100BAD + pointer_game_block()) == 5) && never(byte(0x100A40 + pointer_game_block()) != prev(byte(0x100A40 + pointer_game_block()))) && 
              never((dword(0x3FDF7C) == 3 && dword(0xB3E38C) != 4)) && never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) != 4294967295)) && 
              never((dword(0x3FDF7C) == 3 && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1)) && never(dword(0x3FDF7C) != 3) && dword(0xB3E380) >= 1
)
