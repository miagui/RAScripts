// Samurai Shodown II
// #ID = 12708

function p1_number_of_moves_hit() => byte(0x000A9B)
function round_timer() => byte(0x000AC7)
function p2_fall_recovery() => byte(0x000ACF)
function p1_victory_flag_1p() => bit0(0x000AD4)
function p1_victory_flag_2p() => bit1(0x000AD4)
function won_round_condition() => byte(0x000ADF)
function stage() => byte(0x000AEF)
function difficulty() => byte(0x000AFC)
function hitting_percent() => word(0x000C0A)
function p1_score_00xx0000() => byte(0x000D00)
function p1_character() => byte(0x000D0A)
function p2_character() => byte(0x000D1A)
function p1_move_id1() => word(0x0020C4)
function p1_move_id2() => word(0x0021E4)
function p1_move_id3() => word(0x002304)
function p1_move_id4() => word(0x002424)
function p1_move_id5() => word(0x002544)
function p1_move_id6() => word(0x002664)
function p1_move_id7() => word(0x002784)
function p1_move_id8() => word(0x0028A4)
function p1_move_id9() => word(0x0029C4)
function p1_move_id10() => word(0x002AE4)
function p1_move_id11() => word(0x002C04)
function p1_move_id12() => word(0x002D24)
function p1_move_id13() => word(0x002E44)
function p1_move_id14() => word(0x002F64)
function p1_move_id15() => word(0x003084)
function p1_move_id16() => word(0x0031A4)
function p1_move_id17() => word(0x0032C4)
function p1_move_id18() => word(0x0033E4)
function p1_move_id19() => word(0x003504)
function p1_move_id20() => word(0x003624)
function p1_move_id21() => word(0x003744)
function p1_move_id22() => word(0x003864)
function p1_move_id23() => word(0x003984)
function p1_move_id24() => word(0x003AA4)
function p1_move_id25() => word(0x003BC4)
function p1_move_id26() => word(0x003CE4)
function p1_move_id27() => word(0x003E04)
function p1_move_id28() => word(0x003F24)
function p1_move_id29() => word(0x004044)
function p1_move_id30() => word(0x004164)
function p1_move_id31() => word(0x004284)
function p1_move_id32() => word(0x0043A4)
function p1_move_id33() => word(0x0044C4)
function p1_move_id34() => word(0x0045E4)
function p1_move_id35() => word(0x004704)
function p1_move_id36() => word(0x004824)
function p1_move_id37() => word(0x004944)
function p1_move_id38() => word(0x004A64)
function p1_move_id39() => word(0x004B84)
function p1_move_id40() => word(0x004CA4)
function p1_move_id41() => word(0x004DC4)
function p1_move_id42() => word(0x004EE4)
function p1_move_id43() => word(0x005004)
function p1_move_id44() => word(0x005124)
function p1_move_id45() => word(0x005244)
function p1_move_id46() => word(0x005364)
function p1_move_id47() => word(0x005484)
function p1_move_id48() => word(0x0055A4)
function p1_move_id49() => word(0x0056C4)
function p1_move_id50() => word(0x0057E4)
function p1_move_id51() => word(0x005904)
function p1_move_id52() => word(0x005A24)
function p1_move_id53() => word(0x005B44)
function p1_move_id54() => word(0x005C64)
function p1_move_id55() => word(0x005D84)
function p1_move_id56() => word(0x005EA4)
function p1_move_id57() => word(0x005FC4)
function p1_move_id58() => word(0x0060E4)
function p1_move_id59() => word(0x006204)
function p1_move_id60() => word(0x006324)
function p1_move_id61() => word(0x006444)
function p1_move_id62() => word(0x006564)
function p1_move_id63() => word(0x006684)
function p1_move_id64() => word(0x0067A4)
function mvs_flag() => bit7(0x00FD83)
function p2_active_state() => byte(0x00FDB6)
function p1_active_state() => byte(0x00FDB7)

achievement(
    title = "Dandou", points = 10, type="win_condition",
    description = "Finish the game playing only as Haohmaru (P1)",
    id = 64903, badge = "74481", published = "21/08/2018 01:58:29", modified = "20/10/2019 02:53:01",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              once(stage() == 0) && once(stage() == 6) && never(p1_character() != 0) &&
              unless(p1_victory_flag_1p() != 1) && p2_character() == 16 &&
              ((won_round_condition() == 2) ||
               (won_round_condition() == 4) ||
               (won_round_condition() == 8))
)

achievement(
    title = "Shizen no Utage -Haru-", points = 10, type="win_condition",
    description = "Finish the game playing only as Nakoruru (P1)",
    id = 64904, badge = "74482", published = "21/08/2018 01:58:31", modified = "07/01/2019 21:04:16",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              once(stage() == 0) && once(stage() == 6) && never(p1_character() != 1) &&
              unless(p1_victory_flag_1p() != 1) && p2_character() == 16 &&
              ((won_round_condition() == 2) ||
               (won_round_condition() == 4) ||
               (won_round_condition() == 8))
)

achievement(
    title = "Shinnei", points = 10, type="win_condition",
    description = "Finish the game playing only as Hanzo Hattori (P1)",
    id = 64905, badge = "74483", published = "21/08/2018 01:58:33", modified = "20/10/2019 02:53:01",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              once(stage() == 0) && once(stage() == 6) && never(p1_character() != 2) &&
              unless(p1_victory_flag_1p() != 1) && p2_character() == 16 &&
              ((won_round_condition() == 2) ||
               (won_round_condition() == 4) ||
               (won_round_condition() == 8))
)

achievement(
    title = "Kuro Maguro", points = 10, type="win_condition",
    description = "Finish the game playing only as Galford (P1)",
    id = 64906, badge = "74484", published = "21/08/2018 01:58:35", modified = "07/01/2019 21:04:19",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              once(stage() == 0) && once(stage() == 6) && never(p1_character() != 3) &&
              unless(p1_victory_flag_1p() != 1) && p2_character() == 16 &&
              ((won_round_condition() == 2) ||
               (won_round_condition() == 4) ||
               (won_round_condition() == 8))
)

achievement(
    title = "Ou Tora", points = 10, type="win_condition",
    description = "Finish the game playing only as Wan-Fu (P1)",
    id = 64907, badge = "74485", published = "21/08/2018 01:58:37", modified = "20/10/2019 02:53:01",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              once(stage() == 0) && once(stage() == 6) && never(p1_character() != 4) &&
              unless(p1_victory_flag_1p() != 1) && p2_character() == 16 &&
              ((won_round_condition() == 2) ||
               (won_round_condition() == 4) ||
               (won_round_condition() == 8))
)

achievement(
    title = "Tsuki no Hana", points = 10, type="win_condition",
    description = "Finish the game playing only as Ukyo Tachibana (P1)",
    id = 64908, badge = "74486", published = "21/08/2018 01:58:39", modified = "20/10/2019 02:53:01",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              once(stage() == 0) && once(stage() == 6) && never(p1_character() != 5) &&
              unless(p1_victory_flag_1p() != 1) && p2_character() == 16 &&
              ((won_round_condition() == 2) ||
               (won_round_condition() == 4) ||
               (won_round_condition() == 8))
)

achievement(
    title = "Magatama", points = 10, type="win_condition",
    description = "Finish the game playing only as Kyoshiro Senryo (P1)",
    id = 64909, badge = "74487", published = "21/08/2018 01:58:41", modified = "20/10/2019 02:53:01",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              once(stage() == 0) && once(stage() == 6) && never(p1_character() != 6) &&
              unless(p1_victory_flag_1p() != 1) && p2_character() == 16 &&
              ((won_round_condition() == 2) ||
               (won_round_condition() == 4) ||
               (won_round_condition() == 8))
)

achievement(
    title = "Madou", points = 10, type="win_condition",
    description = "Finish the game playing only as Gen-an Shiranui (P1)",
    id = 64910, badge = "74488", published = "21/08/2018 01:58:43", modified = "20/10/2019 02:53:01",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              once(stage() == 0) && once(stage() == 6) && never(p1_character() != 7) &&
              unless(p1_victory_flag_1p() != 1) && p2_character() == 16 &&
              ((won_round_condition() == 2) ||
               (won_round_condition() == 4) ||
               (won_round_condition() == 8))
)

achievement(
    title = "Haraguro", points = 10, type="win_condition",
    description = "Finish the game playing only as Earthquake (P1)",
    id = 64911, badge = "74489", published = "21/08/2018 01:58:44", modified = "20/10/2019 02:53:01",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              once(stage() == 0) && once(stage() == 6) && never(p1_character() != 8) &&
              unless(p1_victory_flag_1p() != 1) && p2_character() == 16 &&
              ((won_round_condition() == 2) ||
               (won_round_condition() == 4) ||
               (won_round_condition() == 8))
)

achievement(
    title = "Shijima", points = 10, type="win_condition",
    description = "Finish the game playing only as Jubei Yagyu (P1)",
    id = 64912, badge = "74490", published = "21/08/2018 01:58:46", modified = "20/10/2019 02:53:01",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              once(stage() == 0) && once(stage() == 6) && never(p1_character() != 9) &&
              unless(p1_victory_flag_1p() != 1) && p2_character() == 16 &&
              ((won_round_condition() == 2) ||
               (won_round_condition() == 4) ||
               (won_round_condition() == 8))
)

achievement(
    title = "Zoku Hakurai Onna", points = 10, type="win_condition",
    description = "Finish the game playing only as Charlotte (P1)",
    id = 64913, badge = "74491", published = "21/08/2018 01:58:49", modified = "20/10/2019 02:53:01",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              once(stage() == 0) && once(stage() == 6) && never(p1_character() != 11) &&
              unless(p1_victory_flag_1p() != 1) && p2_character() == 16 &&
              ((won_round_condition() == 2) ||
               (won_round_condition() == 4) ||
               (won_round_condition() == 8))
)

// Ticket 32230: I was playing at AES, no continues. I won the second round against Mizuki by time over.
//               
//               The cheevo didn't trigger.<br>MD5: Unknown<br>Emulator: RetroArch (FBneo)
achievement(
    title = "Oni", points = 10, type="win_condition",
    description = "Finish the game playing only as Genjuro Kibagami (P1)",
    id = 64914, badge = "74492", published = "21/08/2018 01:58:51", modified = "20/10/2019 02:53:01",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              once(stage() == 0) && once(stage() == 6) && never(p1_character() != 12) &&
              unless(p1_victory_flag_1p() != 1) && p2_character() == 16 &&
              ((won_round_condition() == 2) ||
               (won_round_condition() == 4) ||
               (won_round_condition() == 8))
)

// Ticket 66384: Hi there, sorry to bother u. I have won the game with Cham Cham twice now but this hasnt triggered.
//               Here is a savestate on the last round:
//               
//               https://www.mediafire.com/file/cobfma006ru0sg6/samsho2.state/file
//               
//               Am i doing something wrong? I havent changed anything in the game config.
//               
//               Thanks.
//               RetroAchievements Hash: Unknown
achievement(
    title = "Juujo", points = 10, type="win_condition",
    description = "Finish the game playing only as Cham Cham (P1)",
    id = 64915, badge = "74493", published = "21/08/2018 01:58:54", modified = "20/10/2019 02:53:01",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              once(stage() == 0) && once(stage() == 6) && never(p1_character() != 13) &&
              unless(p1_victory_flag_1p() != 1) && p2_character() == 16 &&
              ((won_round_condition() == 2) ||
               (won_round_condition() == 4) ||
               (won_round_condition() == 8))
)

// Ticket 16714: Doesn t work, Killing Mizuki
achievement(
    title = "Kishi", points = 10, type="win_condition",
    description = "Finish the game playing only as Neinhalt Sieger (P1)",
    id = 64916, badge = "74494", published = "21/08/2018 01:58:56", modified = "20/10/2019 02:53:01",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              once(stage() == 0) && once(stage() == 6) && never(p1_character() != 14) &&
              unless(p1_victory_flag_1p() != 1) && p2_character() == 16 &&
              ((won_round_condition() == 2) ||
               (won_round_condition() == 4) ||
               (won_round_condition() == 8))
)

achievement(
    title = "Mayoi Kiri", points = 10, type="win_condition",
    description = "Finish the game playing only as Caffeine Nicotine (P1)",
    id = 64917, badge = "74495", published = "21/08/2018 01:58:58", modified = "20/10/2019 02:53:02",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              once(stage() == 0) && once(stage() == 6) && never(p1_character() != 15) &&
              unless(p1_victory_flag_1p() != 1) && p2_character() == 16 &&
              ((won_round_condition() == 2) ||
               (won_round_condition() == 4) ||
               (won_round_condition() == 8))
)

achievement(
    title = "Ochoushi Rokuku", points = 10,
    description = "Defeat Kuroko (P1)",
    id = 64918, badge = "74496", published = "21/08/2018 01:59:00", modified = "16/03/2021 22:44:43",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              never(p2_character() != 17) && p1_victory_flag_1p() == 1 &&
              ((won_round_condition() == 2) ||
               (won_round_condition() == 4) ||
               (won_round_condition() == 8))
)

achievement(
    title = "Nuigurumi Damashii I", points = 5,
    description = "Transform Haohmaru into a stuffed toy (P1)",
    id = 64919, badge = "74497", published = "21/08/2018 01:59:18", modified = "06/01/2019 05:29:11",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 45, p1_move_id2() == 45, p1_move_id3() == 45, p1_move_id4() == 45,
                  p1_move_id5() == 45, p1_move_id6() == 45, p1_move_id7() == 45, p1_move_id8() == 45, p1_move_id9() == 45,
                  p1_move_id10() == 45, p1_move_id11() == 45, p1_move_id12() == 45, p1_move_id13() == 45,
                  p1_move_id14() == 45, p1_move_id15() == 45, p1_move_id16() == 45, p1_move_id17() == 45,
                  p1_move_id18() == 45, p1_move_id19() == 45, p1_move_id20() == 45, p1_move_id21() == 45,
                  p1_move_id22() == 45, p1_move_id23() == 45, p1_move_id24() == 45, p1_move_id25() == 45,
                  p1_move_id26() == 45, p1_move_id27() == 45, p1_move_id28() == 45, p1_move_id29() == 45,
                  p1_move_id30() == 45, p1_move_id31() == 45, p1_move_id32() == 45, p1_move_id33() == 45,
                  p1_move_id34() == 45, p1_move_id35() == 45, p1_move_id36() == 45, p1_move_id37() == 45,
                  p1_move_id38() == 45, p1_move_id39() == 45, p1_move_id40() == 45, p1_move_id41() == 45,
                  p1_move_id42() == 45, p1_move_id43() == 45, p1_move_id44() == 45, p1_move_id45() == 45,
                  p1_move_id46() == 45, p1_move_id47() == 45, p1_move_id48() == 45, p1_move_id49() == 45,
                  p1_move_id50() == 45, p1_move_id51() == 45, p1_move_id52() == 45, p1_move_id53() == 45,
                  p1_move_id54() == 45, p1_move_id55() == 45, p1_move_id56() == 45, p1_move_id57() == 45,
                  p1_move_id58() == 45, p1_move_id59() == 45, p1_move_id60() == 45, p1_move_id61() == 45,
                  p1_move_id62() == 45, p1_move_id63() == 45, p1_move_id64() == 45
              ) && never(p1_character() != 0)
)

achievement(
    title = "Nuigurumi Damashii II", points = 5,
    description = "Transform Nakoruru into a stuffed toy (P1)",
    id = 64920, badge = "74498", published = "21/08/2018 01:59:27", modified = "20/10/2019 02:53:02",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 45, p1_move_id2() == 45, p1_move_id3() == 45, p1_move_id4() == 45,
                  p1_move_id5() == 45, p1_move_id6() == 45, p1_move_id7() == 45, p1_move_id8() == 45, p1_move_id9() == 45,
                  p1_move_id10() == 45, p1_move_id11() == 45, p1_move_id12() == 45, p1_move_id13() == 45,
                  p1_move_id14() == 45, p1_move_id15() == 45, p1_move_id16() == 45, p1_move_id17() == 45,
                  p1_move_id18() == 45, p1_move_id19() == 45, p1_move_id20() == 45, p1_move_id21() == 45,
                  p1_move_id22() == 45, p1_move_id23() == 45, p1_move_id24() == 45, p1_move_id25() == 45,
                  p1_move_id26() == 45, p1_move_id27() == 45, p1_move_id28() == 45, p1_move_id29() == 45,
                  p1_move_id30() == 45, p1_move_id31() == 45, p1_move_id32() == 45, p1_move_id33() == 45,
                  p1_move_id34() == 45, p1_move_id35() == 45, p1_move_id36() == 45, p1_move_id37() == 45,
                  p1_move_id38() == 45, p1_move_id39() == 45, p1_move_id40() == 45, p1_move_id41() == 45,
                  p1_move_id42() == 45, p1_move_id43() == 45, p1_move_id44() == 45, p1_move_id45() == 45,
                  p1_move_id46() == 45, p1_move_id47() == 45, p1_move_id48() == 45, p1_move_id49() == 45,
                  p1_move_id50() == 45, p1_move_id51() == 45, p1_move_id52() == 45, p1_move_id53() == 45,
                  p1_move_id54() == 45, p1_move_id55() == 45, p1_move_id56() == 45, p1_move_id57() == 45,
                  p1_move_id58() == 45, p1_move_id59() == 45, p1_move_id60() == 45, p1_move_id61() == 45,
                  p1_move_id62() == 45, p1_move_id63() == 45, p1_move_id64() == 45
              ) && never(p1_character() != 1)
)

achievement(
    title = "Nuigurumi Damashii III", points = 5,
    description = "Transform Hanzo Hattori into a stuffed toy (P1)",
    id = 64921, badge = "74499", published = "21/08/2018 01:59:29", modified = "06/01/2019 05:29:15",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 45, p1_move_id2() == 45, p1_move_id3() == 45, p1_move_id4() == 45,
                  p1_move_id5() == 45, p1_move_id6() == 45, p1_move_id7() == 45, p1_move_id8() == 45, p1_move_id9() == 45,
                  p1_move_id10() == 45, p1_move_id11() == 45, p1_move_id12() == 45, p1_move_id13() == 45,
                  p1_move_id14() == 45, p1_move_id15() == 45, p1_move_id16() == 45, p1_move_id17() == 45,
                  p1_move_id18() == 45, p1_move_id19() == 45, p1_move_id20() == 45, p1_move_id21() == 45,
                  p1_move_id22() == 45, p1_move_id23() == 45, p1_move_id24() == 45, p1_move_id25() == 45,
                  p1_move_id26() == 45, p1_move_id27() == 45, p1_move_id28() == 45, p1_move_id29() == 45,
                  p1_move_id30() == 45, p1_move_id31() == 45, p1_move_id32() == 45, p1_move_id33() == 45,
                  p1_move_id34() == 45, p1_move_id35() == 45, p1_move_id36() == 45, p1_move_id37() == 45,
                  p1_move_id38() == 45, p1_move_id39() == 45, p1_move_id40() == 45, p1_move_id41() == 45,
                  p1_move_id42() == 45, p1_move_id43() == 45, p1_move_id44() == 45, p1_move_id45() == 45,
                  p1_move_id46() == 45, p1_move_id47() == 45, p1_move_id48() == 45, p1_move_id49() == 45,
                  p1_move_id50() == 45, p1_move_id51() == 45, p1_move_id52() == 45, p1_move_id53() == 45,
                  p1_move_id54() == 45, p1_move_id55() == 45, p1_move_id56() == 45, p1_move_id57() == 45,
                  p1_move_id58() == 45, p1_move_id59() == 45, p1_move_id60() == 45, p1_move_id61() == 45,
                  p1_move_id62() == 45, p1_move_id63() == 45, p1_move_id64() == 45
              ) && never(p1_character() != 2)
)

achievement(
    title = "Nuigurumi Damashii IV", points = 5,
    description = "Transform Galford into a stuffed toy (P1)",
    id = 64922, badge = "74500", published = "21/08/2018 01:59:31", modified = "06/01/2019 05:29:17",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 45, p1_move_id2() == 45, p1_move_id3() == 45, p1_move_id4() == 45,
                  p1_move_id5() == 45, p1_move_id6() == 45, p1_move_id7() == 45, p1_move_id8() == 45, p1_move_id9() == 45,
                  p1_move_id10() == 45, p1_move_id11() == 45, p1_move_id12() == 45, p1_move_id13() == 45,
                  p1_move_id14() == 45, p1_move_id15() == 45, p1_move_id16() == 45, p1_move_id17() == 45,
                  p1_move_id18() == 45, p1_move_id19() == 45, p1_move_id20() == 45, p1_move_id21() == 45,
                  p1_move_id22() == 45, p1_move_id23() == 45, p1_move_id24() == 45, p1_move_id25() == 45,
                  p1_move_id26() == 45, p1_move_id27() == 45, p1_move_id28() == 45, p1_move_id29() == 45,
                  p1_move_id30() == 45, p1_move_id31() == 45, p1_move_id32() == 45, p1_move_id33() == 45,
                  p1_move_id34() == 45, p1_move_id35() == 45, p1_move_id36() == 45, p1_move_id37() == 45,
                  p1_move_id38() == 45, p1_move_id39() == 45, p1_move_id40() == 45, p1_move_id41() == 45,
                  p1_move_id42() == 45, p1_move_id43() == 45, p1_move_id44() == 45, p1_move_id45() == 45,
                  p1_move_id46() == 45, p1_move_id47() == 45, p1_move_id48() == 45, p1_move_id49() == 45,
                  p1_move_id50() == 45, p1_move_id51() == 45, p1_move_id52() == 45, p1_move_id53() == 45,
                  p1_move_id54() == 45, p1_move_id55() == 45, p1_move_id56() == 45, p1_move_id57() == 45,
                  p1_move_id58() == 45, p1_move_id59() == 45, p1_move_id60() == 45, p1_move_id61() == 45,
                  p1_move_id62() == 45, p1_move_id63() == 45, p1_move_id64() == 45
              ) && never(p1_character() != 3)
)

achievement(
    title = "Nuigurumi Damashii V", points = 5,
    description = "Transform Wan-Fu into a stuffed toy (P1)",
    id = 64923, badge = "74502", published = "21/08/2018 01:59:32", modified = "20/10/2019 02:53:02",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 45, p1_move_id2() == 45, p1_move_id3() == 45, p1_move_id4() == 45,
                  p1_move_id5() == 45, p1_move_id6() == 45, p1_move_id7() == 45, p1_move_id8() == 45, p1_move_id9() == 45,
                  p1_move_id10() == 45, p1_move_id11() == 45, p1_move_id12() == 45, p1_move_id13() == 45,
                  p1_move_id14() == 45, p1_move_id15() == 45, p1_move_id16() == 45, p1_move_id17() == 45,
                  p1_move_id18() == 45, p1_move_id19() == 45, p1_move_id20() == 45, p1_move_id21() == 45,
                  p1_move_id22() == 45, p1_move_id23() == 45, p1_move_id24() == 45, p1_move_id25() == 45,
                  p1_move_id26() == 45, p1_move_id27() == 45, p1_move_id28() == 45, p1_move_id29() == 45,
                  p1_move_id30() == 45, p1_move_id31() == 45, p1_move_id32() == 45, p1_move_id33() == 45,
                  p1_move_id34() == 45, p1_move_id35() == 45, p1_move_id36() == 45, p1_move_id37() == 45,
                  p1_move_id38() == 45, p1_move_id39() == 45, p1_move_id40() == 45, p1_move_id41() == 45,
                  p1_move_id42() == 45, p1_move_id43() == 45, p1_move_id44() == 45, p1_move_id45() == 45,
                  p1_move_id46() == 45, p1_move_id47() == 45, p1_move_id48() == 45, p1_move_id49() == 45,
                  p1_move_id50() == 45, p1_move_id51() == 45, p1_move_id52() == 45, p1_move_id53() == 45,
                  p1_move_id54() == 45, p1_move_id55() == 45, p1_move_id56() == 45, p1_move_id57() == 45,
                  p1_move_id58() == 45, p1_move_id59() == 45, p1_move_id60() == 45, p1_move_id61() == 45,
                  p1_move_id62() == 45, p1_move_id63() == 45, p1_move_id64() == 45
              ) && never(p1_character() != 4)
)

achievement(
    title = "Nuigurumi Damashii VI", points = 5,
    description = "Transform Ukyo Tachibana into a stuffed toy (P1)",
    id = 64924, badge = "74503", published = "21/08/2018 01:59:34", modified = "06/01/2019 05:29:21",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 45, p1_move_id2() == 45, p1_move_id3() == 45, p1_move_id4() == 45,
                  p1_move_id5() == 45, p1_move_id6() == 45, p1_move_id7() == 45, p1_move_id8() == 45, p1_move_id9() == 45,
                  p1_move_id10() == 45, p1_move_id11() == 45, p1_move_id12() == 45, p1_move_id13() == 45,
                  p1_move_id14() == 45, p1_move_id15() == 45, p1_move_id16() == 45, p1_move_id17() == 45,
                  p1_move_id18() == 45, p1_move_id19() == 45, p1_move_id20() == 45, p1_move_id21() == 45,
                  p1_move_id22() == 45, p1_move_id23() == 45, p1_move_id24() == 45, p1_move_id25() == 45,
                  p1_move_id26() == 45, p1_move_id27() == 45, p1_move_id28() == 45, p1_move_id29() == 45,
                  p1_move_id30() == 45, p1_move_id31() == 45, p1_move_id32() == 45, p1_move_id33() == 45,
                  p1_move_id34() == 45, p1_move_id35() == 45, p1_move_id36() == 45, p1_move_id37() == 45,
                  p1_move_id38() == 45, p1_move_id39() == 45, p1_move_id40() == 45, p1_move_id41() == 45,
                  p1_move_id42() == 45, p1_move_id43() == 45, p1_move_id44() == 45, p1_move_id45() == 45,
                  p1_move_id46() == 45, p1_move_id47() == 45, p1_move_id48() == 45, p1_move_id49() == 45,
                  p1_move_id50() == 45, p1_move_id51() == 45, p1_move_id52() == 45, p1_move_id53() == 45,
                  p1_move_id54() == 45, p1_move_id55() == 45, p1_move_id56() == 45, p1_move_id57() == 45,
                  p1_move_id58() == 45, p1_move_id59() == 45, p1_move_id60() == 45, p1_move_id61() == 45,
                  p1_move_id62() == 45, p1_move_id63() == 45, p1_move_id64() == 45
              ) && never(p1_character() != 5)
)

achievement(
    title = "Nuigurumi Damashii VII", points = 5,
    description = "Transform Kyoshiro Senryo into a stuffed toy (P1)",
    id = 64925, badge = "74504", published = "21/08/2018 01:59:37", modified = "20/10/2019 02:53:02",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 45, p1_move_id2() == 45, p1_move_id3() == 45, p1_move_id4() == 45,
                  p1_move_id5() == 45, p1_move_id6() == 45, p1_move_id7() == 45, p1_move_id8() == 45, p1_move_id9() == 45,
                  p1_move_id10() == 45, p1_move_id11() == 45, p1_move_id12() == 45, p1_move_id13() == 45,
                  p1_move_id14() == 45, p1_move_id15() == 45, p1_move_id16() == 45, p1_move_id17() == 45,
                  p1_move_id18() == 45, p1_move_id19() == 45, p1_move_id20() == 45, p1_move_id21() == 45,
                  p1_move_id22() == 45, p1_move_id23() == 45, p1_move_id24() == 45, p1_move_id25() == 45,
                  p1_move_id26() == 45, p1_move_id27() == 45, p1_move_id28() == 45, p1_move_id29() == 45,
                  p1_move_id30() == 45, p1_move_id31() == 45, p1_move_id32() == 45, p1_move_id33() == 45,
                  p1_move_id34() == 45, p1_move_id35() == 45, p1_move_id36() == 45, p1_move_id37() == 45,
                  p1_move_id38() == 45, p1_move_id39() == 45, p1_move_id40() == 45, p1_move_id41() == 45,
                  p1_move_id42() == 45, p1_move_id43() == 45, p1_move_id44() == 45, p1_move_id45() == 45,
                  p1_move_id46() == 45, p1_move_id47() == 45, p1_move_id48() == 45, p1_move_id49() == 45,
                  p1_move_id50() == 45, p1_move_id51() == 45, p1_move_id52() == 45, p1_move_id53() == 45,
                  p1_move_id54() == 45, p1_move_id55() == 45, p1_move_id56() == 45, p1_move_id57() == 45,
                  p1_move_id58() == 45, p1_move_id59() == 45, p1_move_id60() == 45, p1_move_id61() == 45,
                  p1_move_id62() == 45, p1_move_id63() == 45, p1_move_id64() == 45
              ) && never(p1_character() != 6)
)

achievement(
    title = "Nuigurumi Damashii VIII", points = 5,
    description = "Transform Gen-an Shiranui into a stuffed toy (P1)",
    id = 64926, badge = "74505", published = "21/08/2018 01:59:39", modified = "20/10/2019 02:53:02",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 45, p1_move_id2() == 45, p1_move_id3() == 45, p1_move_id4() == 45,
                  p1_move_id5() == 45, p1_move_id6() == 45, p1_move_id7() == 45, p1_move_id8() == 45, p1_move_id9() == 45,
                  p1_move_id10() == 45, p1_move_id11() == 45, p1_move_id12() == 45, p1_move_id13() == 45,
                  p1_move_id14() == 45, p1_move_id15() == 45, p1_move_id16() == 45, p1_move_id17() == 45,
                  p1_move_id18() == 45, p1_move_id19() == 45, p1_move_id20() == 45, p1_move_id21() == 45,
                  p1_move_id22() == 45, p1_move_id23() == 45, p1_move_id24() == 45, p1_move_id25() == 45,
                  p1_move_id26() == 45, p1_move_id27() == 45, p1_move_id28() == 45, p1_move_id29() == 45,
                  p1_move_id30() == 45, p1_move_id31() == 45, p1_move_id32() == 45, p1_move_id33() == 45,
                  p1_move_id34() == 45, p1_move_id35() == 45, p1_move_id36() == 45, p1_move_id37() == 45,
                  p1_move_id38() == 45, p1_move_id39() == 45, p1_move_id40() == 45, p1_move_id41() == 45,
                  p1_move_id42() == 45, p1_move_id43() == 45, p1_move_id44() == 45, p1_move_id45() == 45,
                  p1_move_id46() == 45, p1_move_id47() == 45, p1_move_id48() == 45, p1_move_id49() == 45,
                  p1_move_id50() == 45, p1_move_id51() == 45, p1_move_id52() == 45, p1_move_id53() == 45,
                  p1_move_id54() == 45, p1_move_id55() == 45, p1_move_id56() == 45, p1_move_id57() == 45,
                  p1_move_id58() == 45, p1_move_id59() == 45, p1_move_id60() == 45, p1_move_id61() == 45,
                  p1_move_id62() == 45, p1_move_id63() == 45, p1_move_id64() == 45
              ) && never(p1_character() != 7)
)

achievement(
    title = "Nuigurumi Damashii IX", points = 5,
    description = "Transform Earthquake into a stuffed toy (P1)",
    id = 64927, badge = "74506", published = "21/08/2018 01:59:41", modified = "20/10/2019 02:53:02",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 45, p1_move_id2() == 45, p1_move_id3() == 45, p1_move_id4() == 45,
                  p1_move_id5() == 45, p1_move_id6() == 45, p1_move_id7() == 45, p1_move_id8() == 45, p1_move_id9() == 45,
                  p1_move_id10() == 45, p1_move_id11() == 45, p1_move_id12() == 45, p1_move_id13() == 45,
                  p1_move_id14() == 45, p1_move_id15() == 45, p1_move_id16() == 45, p1_move_id17() == 45,
                  p1_move_id18() == 45, p1_move_id19() == 45, p1_move_id20() == 45, p1_move_id21() == 45,
                  p1_move_id22() == 45, p1_move_id23() == 45, p1_move_id24() == 45, p1_move_id25() == 45,
                  p1_move_id26() == 45, p1_move_id27() == 45, p1_move_id28() == 45, p1_move_id29() == 45,
                  p1_move_id30() == 45, p1_move_id31() == 45, p1_move_id32() == 45, p1_move_id33() == 45,
                  p1_move_id34() == 45, p1_move_id35() == 45, p1_move_id36() == 45, p1_move_id37() == 45,
                  p1_move_id38() == 45, p1_move_id39() == 45, p1_move_id40() == 45, p1_move_id41() == 45,
                  p1_move_id42() == 45, p1_move_id43() == 45, p1_move_id44() == 45, p1_move_id45() == 45,
                  p1_move_id46() == 45, p1_move_id47() == 45, p1_move_id48() == 45, p1_move_id49() == 45,
                  p1_move_id50() == 45, p1_move_id51() == 45, p1_move_id52() == 45, p1_move_id53() == 45,
                  p1_move_id54() == 45, p1_move_id55() == 45, p1_move_id56() == 45, p1_move_id57() == 45,
                  p1_move_id58() == 45, p1_move_id59() == 45, p1_move_id60() == 45, p1_move_id61() == 45,
                  p1_move_id62() == 45, p1_move_id63() == 45, p1_move_id64() == 45
              ) && never(p1_character() != 8)
)

achievement(
    title = "Nuigurumi Damashii X", points = 5,
    description = "Transform Jubei Yagyu into a stuffed toy (P1)",
    id = 64928, badge = "74507", published = "21/08/2018 01:59:44", modified = "20/10/2019 02:53:02",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 45, p1_move_id2() == 45, p1_move_id3() == 45, p1_move_id4() == 45,
                  p1_move_id5() == 45, p1_move_id6() == 45, p1_move_id7() == 45, p1_move_id8() == 45, p1_move_id9() == 45,
                  p1_move_id10() == 45, p1_move_id11() == 45, p1_move_id12() == 45, p1_move_id13() == 45,
                  p1_move_id14() == 45, p1_move_id15() == 45, p1_move_id16() == 45, p1_move_id17() == 45,
                  p1_move_id18() == 45, p1_move_id19() == 45, p1_move_id20() == 45, p1_move_id21() == 45,
                  p1_move_id22() == 45, p1_move_id23() == 45, p1_move_id24() == 45, p1_move_id25() == 45,
                  p1_move_id26() == 45, p1_move_id27() == 45, p1_move_id28() == 45, p1_move_id29() == 45,
                  p1_move_id30() == 45, p1_move_id31() == 45, p1_move_id32() == 45, p1_move_id33() == 45,
                  p1_move_id34() == 45, p1_move_id35() == 45, p1_move_id36() == 45, p1_move_id37() == 45,
                  p1_move_id38() == 45, p1_move_id39() == 45, p1_move_id40() == 45, p1_move_id41() == 45,
                  p1_move_id42() == 45, p1_move_id43() == 45, p1_move_id44() == 45, p1_move_id45() == 45,
                  p1_move_id46() == 45, p1_move_id47() == 45, p1_move_id48() == 45, p1_move_id49() == 45,
                  p1_move_id50() == 45, p1_move_id51() == 45, p1_move_id52() == 45, p1_move_id53() == 45,
                  p1_move_id54() == 45, p1_move_id55() == 45, p1_move_id56() == 45, p1_move_id57() == 45,
                  p1_move_id58() == 45, p1_move_id59() == 45, p1_move_id60() == 45, p1_move_id61() == 45,
                  p1_move_id62() == 45, p1_move_id63() == 45, p1_move_id64() == 45
              ) && never(p1_character() != 9)
)

achievement(
    title = "Nuigurumi Damashii XI", points = 5,
    description = "Transform Charlotte into a stuffed toy (P1)",
    id = 64929, badge = "74508", published = "21/08/2018 01:59:46", modified = "06/01/2019 05:29:32",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 45, p1_move_id2() == 45, p1_move_id3() == 45, p1_move_id4() == 45,
                  p1_move_id5() == 45, p1_move_id6() == 45, p1_move_id7() == 45, p1_move_id8() == 45, p1_move_id9() == 45,
                  p1_move_id10() == 45, p1_move_id11() == 45, p1_move_id12() == 45, p1_move_id13() == 45,
                  p1_move_id14() == 45, p1_move_id15() == 45, p1_move_id16() == 45, p1_move_id17() == 45,
                  p1_move_id18() == 45, p1_move_id19() == 45, p1_move_id20() == 45, p1_move_id21() == 45,
                  p1_move_id22() == 45, p1_move_id23() == 45, p1_move_id24() == 45, p1_move_id25() == 45,
                  p1_move_id26() == 45, p1_move_id27() == 45, p1_move_id28() == 45, p1_move_id29() == 45,
                  p1_move_id30() == 45, p1_move_id31() == 45, p1_move_id32() == 45, p1_move_id33() == 45,
                  p1_move_id34() == 45, p1_move_id35() == 45, p1_move_id36() == 45, p1_move_id37() == 45,
                  p1_move_id38() == 45, p1_move_id39() == 45, p1_move_id40() == 45, p1_move_id41() == 45,
                  p1_move_id42() == 45, p1_move_id43() == 45, p1_move_id44() == 45, p1_move_id45() == 45,
                  p1_move_id46() == 45, p1_move_id47() == 45, p1_move_id48() == 45, p1_move_id49() == 45,
                  p1_move_id50() == 45, p1_move_id51() == 45, p1_move_id52() == 45, p1_move_id53() == 45,
                  p1_move_id54() == 45, p1_move_id55() == 45, p1_move_id56() == 45, p1_move_id57() == 45,
                  p1_move_id58() == 45, p1_move_id59() == 45, p1_move_id60() == 45, p1_move_id61() == 45,
                  p1_move_id62() == 45, p1_move_id63() == 45, p1_move_id64() == 45
              ) && never(p1_character() != 11)
)

achievement(
    title = "Nuigurumi Damashii XII", points = 5,
    description = "Transform Genjuro Kibagami into a stuffed toy (P1)",
    id = 64930, badge = "74540", published = "21/08/2018 01:59:48", modified = "06/01/2019 05:37:52",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 45, p1_move_id2() == 45, p1_move_id3() == 45, p1_move_id4() == 45,
                  p1_move_id5() == 45, p1_move_id6() == 45, p1_move_id7() == 45, p1_move_id8() == 45, p1_move_id9() == 45,
                  p1_move_id10() == 45, p1_move_id11() == 45, p1_move_id12() == 45, p1_move_id13() == 45,
                  p1_move_id14() == 45, p1_move_id15() == 45, p1_move_id16() == 45, p1_move_id17() == 45,
                  p1_move_id18() == 45, p1_move_id19() == 45, p1_move_id20() == 45, p1_move_id21() == 45,
                  p1_move_id22() == 45, p1_move_id23() == 45, p1_move_id24() == 45, p1_move_id25() == 45,
                  p1_move_id26() == 45, p1_move_id27() == 45, p1_move_id28() == 45, p1_move_id29() == 45,
                  p1_move_id30() == 45, p1_move_id31() == 45, p1_move_id32() == 45, p1_move_id33() == 45,
                  p1_move_id34() == 45, p1_move_id35() == 45, p1_move_id36() == 45, p1_move_id37() == 45,
                  p1_move_id38() == 45, p1_move_id39() == 45, p1_move_id40() == 45, p1_move_id41() == 45,
                  p1_move_id42() == 45, p1_move_id43() == 45, p1_move_id44() == 45, p1_move_id45() == 45,
                  p1_move_id46() == 45, p1_move_id47() == 45, p1_move_id48() == 45, p1_move_id49() == 45,
                  p1_move_id50() == 45, p1_move_id51() == 45, p1_move_id52() == 45, p1_move_id53() == 45,
                  p1_move_id54() == 45, p1_move_id55() == 45, p1_move_id56() == 45, p1_move_id57() == 45,
                  p1_move_id58() == 45, p1_move_id59() == 45, p1_move_id60() == 45, p1_move_id61() == 45,
                  p1_move_id62() == 45, p1_move_id63() == 45, p1_move_id64() == 45
              ) && never(p1_character() != 12)
)

achievement(
    title = "Nuigurumi Damashii XIII", points = 5,
    description = "Transform Cham Cham into a stuffed toy (P1)",
    id = 64931, badge = "74510", published = "21/08/2018 01:59:51", modified = "20/10/2019 02:53:02",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 45, p1_move_id2() == 45, p1_move_id3() == 45, p1_move_id4() == 45,
                  p1_move_id5() == 45, p1_move_id6() == 45, p1_move_id7() == 45, p1_move_id8() == 45, p1_move_id9() == 45,
                  p1_move_id10() == 45, p1_move_id11() == 45, p1_move_id12() == 45, p1_move_id13() == 45,
                  p1_move_id14() == 45, p1_move_id15() == 45, p1_move_id16() == 45, p1_move_id17() == 45,
                  p1_move_id18() == 45, p1_move_id19() == 45, p1_move_id20() == 45, p1_move_id21() == 45,
                  p1_move_id22() == 45, p1_move_id23() == 45, p1_move_id24() == 45, p1_move_id25() == 45,
                  p1_move_id26() == 45, p1_move_id27() == 45, p1_move_id28() == 45, p1_move_id29() == 45,
                  p1_move_id30() == 45, p1_move_id31() == 45, p1_move_id32() == 45, p1_move_id33() == 45,
                  p1_move_id34() == 45, p1_move_id35() == 45, p1_move_id36() == 45, p1_move_id37() == 45,
                  p1_move_id38() == 45, p1_move_id39() == 45, p1_move_id40() == 45, p1_move_id41() == 45,
                  p1_move_id42() == 45, p1_move_id43() == 45, p1_move_id44() == 45, p1_move_id45() == 45,
                  p1_move_id46() == 45, p1_move_id47() == 45, p1_move_id48() == 45, p1_move_id49() == 45,
                  p1_move_id50() == 45, p1_move_id51() == 45, p1_move_id52() == 45, p1_move_id53() == 45,
                  p1_move_id54() == 45, p1_move_id55() == 45, p1_move_id56() == 45, p1_move_id57() == 45,
                  p1_move_id58() == 45, p1_move_id59() == 45, p1_move_id60() == 45, p1_move_id61() == 45,
                  p1_move_id62() == 45, p1_move_id63() == 45, p1_move_id64() == 45
              ) && never(p1_character() != 13)
)

achievement(
    title = "Nuigurumi Damashii XIV", points = 5,
    description = "Transform Neinhalt Sieger into a stuffed toy (P1)",
    id = 64932, badge = "74501", published = "21/08/2018 01:59:53", modified = "20/10/2019 02:53:02",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 45, p1_move_id2() == 45, p1_move_id3() == 45, p1_move_id4() == 45,
                  p1_move_id5() == 45, p1_move_id6() == 45, p1_move_id7() == 45, p1_move_id8() == 45, p1_move_id9() == 45,
                  p1_move_id10() == 45, p1_move_id11() == 45, p1_move_id12() == 45, p1_move_id13() == 45,
                  p1_move_id14() == 45, p1_move_id15() == 45, p1_move_id16() == 45, p1_move_id17() == 45,
                  p1_move_id18() == 45, p1_move_id19() == 45, p1_move_id20() == 45, p1_move_id21() == 45,
                  p1_move_id22() == 45, p1_move_id23() == 45, p1_move_id24() == 45, p1_move_id25() == 45,
                  p1_move_id26() == 45, p1_move_id27() == 45, p1_move_id28() == 45, p1_move_id29() == 45,
                  p1_move_id30() == 45, p1_move_id31() == 45, p1_move_id32() == 45, p1_move_id33() == 45,
                  p1_move_id34() == 45, p1_move_id35() == 45, p1_move_id36() == 45, p1_move_id37() == 45,
                  p1_move_id38() == 45, p1_move_id39() == 45, p1_move_id40() == 45, p1_move_id41() == 45,
                  p1_move_id42() == 45, p1_move_id43() == 45, p1_move_id44() == 45, p1_move_id45() == 45,
                  p1_move_id46() == 45, p1_move_id47() == 45, p1_move_id48() == 45, p1_move_id49() == 45,
                  p1_move_id50() == 45, p1_move_id51() == 45, p1_move_id52() == 45, p1_move_id53() == 45,
                  p1_move_id54() == 45, p1_move_id55() == 45, p1_move_id56() == 45, p1_move_id57() == 45,
                  p1_move_id58() == 45, p1_move_id59() == 45, p1_move_id60() == 45, p1_move_id61() == 45,
                  p1_move_id62() == 45, p1_move_id63() == 45, p1_move_id64() == 45
              ) && never(p1_character() != 14)
)

achievement(
    title = "Nuigurumi Damashii XV", points = 5,
    description = "Transform Caffeine Nicotine into a stuffed toy (P1)",
    id = 64933, badge = "74511", published = "21/08/2018 01:59:55", modified = "20/10/2019 02:53:02",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 45, p1_move_id2() == 45, p1_move_id3() == 45, p1_move_id4() == 45,
                  p1_move_id5() == 45, p1_move_id6() == 45, p1_move_id7() == 45, p1_move_id8() == 45, p1_move_id9() == 45,
                  p1_move_id10() == 45, p1_move_id11() == 45, p1_move_id12() == 45, p1_move_id13() == 45,
                  p1_move_id14() == 45, p1_move_id15() == 45, p1_move_id16() == 45, p1_move_id17() == 45,
                  p1_move_id18() == 45, p1_move_id19() == 45, p1_move_id20() == 45, p1_move_id21() == 45,
                  p1_move_id22() == 45, p1_move_id23() == 45, p1_move_id24() == 45, p1_move_id25() == 45,
                  p1_move_id26() == 45, p1_move_id27() == 45, p1_move_id28() == 45, p1_move_id29() == 45,
                  p1_move_id30() == 45, p1_move_id31() == 45, p1_move_id32() == 45, p1_move_id33() == 45,
                  p1_move_id34() == 45, p1_move_id35() == 45, p1_move_id36() == 45, p1_move_id37() == 45,
                  p1_move_id38() == 45, p1_move_id39() == 45, p1_move_id40() == 45, p1_move_id41() == 45,
                  p1_move_id42() == 45, p1_move_id43() == 45, p1_move_id44() == 45, p1_move_id45() == 45,
                  p1_move_id46() == 45, p1_move_id47() == 45, p1_move_id48() == 45, p1_move_id49() == 45,
                  p1_move_id50() == 45, p1_move_id51() == 45, p1_move_id52() == 45, p1_move_id53() == 45,
                  p1_move_id54() == 45, p1_move_id55() == 45, p1_move_id56() == 45, p1_move_id57() == 45,
                  p1_move_id58() == 45, p1_move_id59() == 45, p1_move_id60() == 45, p1_move_id61() == 45,
                  p1_move_id62() == 45, p1_move_id63() == 45, p1_move_id64() == 45
              ) && never(p1_character() != 15)
)

achievement(
    title = "Nuigurumi Damashii XVI", points = 5,
    description = "Transform Kuroko into a stuffed toy (P1)",
    id = 64934, badge = "74512", published = "21/08/2018 01:59:57", modified = "06/01/2019 05:29:41",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 45, p1_move_id2() == 45, p1_move_id3() == 45, p1_move_id4() == 45,
                  p1_move_id5() == 45, p1_move_id6() == 45, p1_move_id7() == 45, p1_move_id8() == 45, p1_move_id9() == 45,
                  p1_move_id10() == 45, p1_move_id11() == 45, p1_move_id12() == 45, p1_move_id13() == 45,
                  p1_move_id14() == 45, p1_move_id15() == 45, p1_move_id16() == 45, p1_move_id17() == 45,
                  p1_move_id18() == 45, p1_move_id19() == 45, p1_move_id20() == 45, p1_move_id21() == 45,
                  p1_move_id22() == 45, p1_move_id23() == 45, p1_move_id24() == 45, p1_move_id25() == 45,
                  p1_move_id26() == 45, p1_move_id27() == 45, p1_move_id28() == 45, p1_move_id29() == 45,
                  p1_move_id30() == 45, p1_move_id31() == 45, p1_move_id32() == 45, p1_move_id33() == 45,
                  p1_move_id34() == 45, p1_move_id35() == 45, p1_move_id36() == 45, p1_move_id37() == 45,
                  p1_move_id38() == 45, p1_move_id39() == 45, p1_move_id40() == 45, p1_move_id41() == 45,
                  p1_move_id42() == 45, p1_move_id43() == 45, p1_move_id44() == 45, p1_move_id45() == 45,
                  p1_move_id46() == 45, p1_move_id47() == 45, p1_move_id48() == 45, p1_move_id49() == 45,
                  p1_move_id50() == 45, p1_move_id51() == 45, p1_move_id52() == 45, p1_move_id53() == 45,
                  p1_move_id54() == 45, p1_move_id55() == 45, p1_move_id56() == 45, p1_move_id57() == 45,
                  p1_move_id58() == 45, p1_move_id59() == 45, p1_move_id60() == 45, p1_move_id61() == 45,
                  p1_move_id62() == 45, p1_move_id63() == 45, p1_move_id64() == 45
              ) && never(p1_character() != 17)
)

achievement(
    title = "Ougi!! Tenha Seikou Zan", points = 5,
    description = "Hit the oponnent with Super Move playing as Haohmaru (P1 vs CPU)",
    id = 64935, badge = "74513", published = "21/08/2018 02:00:00", modified = "06/01/2019 05:29:43",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 293, p1_move_id2() == 293, p1_move_id3() == 293, p1_move_id4() == 293,
                  p1_move_id5() == 293, p1_move_id6() == 293, p1_move_id7() == 293, p1_move_id8() == 293,
                  p1_move_id9() == 293, p1_move_id10() == 293, p1_move_id11() == 293, p1_move_id12() == 293,
                  p1_move_id13() == 293, p1_move_id14() == 293, p1_move_id15() == 293, p1_move_id16() == 293,
                  p1_move_id17() == 293, p1_move_id18() == 293, p1_move_id19() == 293, p1_move_id20() == 293,
                  p1_move_id21() == 293, p1_move_id22() == 293, p1_move_id23() == 293, p1_move_id24() == 293,
                  p1_move_id25() == 293, p1_move_id26() == 293, p1_move_id27() == 293, p1_move_id28() == 293,
                  p1_move_id29() == 293, p1_move_id30() == 293, p1_move_id31() == 293, p1_move_id32() == 293,
                  p1_move_id33() == 293, p1_move_id34() == 293, p1_move_id35() == 293, p1_move_id36() == 293,
                  p1_move_id37() == 293, p1_move_id38() == 293, p1_move_id39() == 293, p1_move_id40() == 293,
                  p1_move_id41() == 293, p1_move_id42() == 293, p1_move_id43() == 293, p1_move_id44() == 293,
                  p1_move_id45() == 293, p1_move_id46() == 293, p1_move_id47() == 293, p1_move_id48() == 293,
                  p1_move_id49() == 293, p1_move_id50() == 293, p1_move_id51() == 293, p1_move_id52() == 293,
                  p1_move_id53() == 293, p1_move_id54() == 293, p1_move_id55() == 293, p1_move_id56() == 293,
                  p1_move_id57() == 293, p1_move_id58() == 293, p1_move_id59() == 293, p1_move_id60() == 293,
                  p1_move_id61() == 293, p1_move_id62() == 293, p1_move_id63() == 293, p1_move_id64() == 293
              ) && never(prev(p1_number_of_moves_hit()) >= p1_number_of_moves_hit()) && never(p1_character() != 0) &&
              never(p2_active_state() != 0)
)

achievement(
    title = "Ougi!! Irusuka Yatoro Lise", points = 5,
    description = "Hit the oponnent with Super Move playing as Nakoruru (P1 vs CPU)",
    id = 64936, badge = "74514", published = "21/08/2018 02:00:02", modified = "06/01/2019 05:29:45",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 293, p1_move_id2() == 293, p1_move_id3() == 293, p1_move_id4() == 293,
                  p1_move_id5() == 293, p1_move_id6() == 293, p1_move_id7() == 293, p1_move_id8() == 293,
                  p1_move_id9() == 293, p1_move_id10() == 293, p1_move_id11() == 293, p1_move_id12() == 293,
                  p1_move_id13() == 293, p1_move_id14() == 293, p1_move_id15() == 293, p1_move_id16() == 293,
                  p1_move_id17() == 293, p1_move_id18() == 293, p1_move_id19() == 293, p1_move_id20() == 293,
                  p1_move_id21() == 293, p1_move_id22() == 293, p1_move_id23() == 293, p1_move_id24() == 293,
                  p1_move_id25() == 293, p1_move_id26() == 293, p1_move_id27() == 293, p1_move_id28() == 293,
                  p1_move_id29() == 293, p1_move_id30() == 293, p1_move_id31() == 293, p1_move_id32() == 293,
                  p1_move_id33() == 293, p1_move_id34() == 293, p1_move_id35() == 293, p1_move_id36() == 293,
                  p1_move_id37() == 293, p1_move_id38() == 293, p1_move_id39() == 293, p1_move_id40() == 293,
                  p1_move_id41() == 293, p1_move_id42() == 293, p1_move_id43() == 293, p1_move_id44() == 293,
                  p1_move_id45() == 293, p1_move_id46() == 293, p1_move_id47() == 293, p1_move_id48() == 293,
                  p1_move_id49() == 293, p1_move_id50() == 293, p1_move_id51() == 293, p1_move_id52() == 293,
                  p1_move_id53() == 293, p1_move_id54() == 293, p1_move_id55() == 293, p1_move_id56() == 293,
                  p1_move_id57() == 293, p1_move_id58() == 293, p1_move_id59() == 293, p1_move_id60() == 293,
                  p1_move_id61() == 293, p1_move_id62() == 293, p1_move_id63() == 293, p1_move_id64() == 293
              ) && never(prev(p1_number_of_moves_hit()) >= p1_number_of_moves_hit()) && never(p1_character() != 1) &&
              never(p2_active_state() != 0)
)

achievement(
    title = "Ougi!! Ninpo Tenma Rimetsu", points = 5,
    description = "Hit the oponnent with Super Move playing as Hanzo Hattori (P1 vs CPU)",
    id = 64937, badge = "74515", published = "21/08/2018 02:00:04", modified = "06/01/2019 05:29:47",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 293, p1_move_id2() == 293, p1_move_id3() == 293, p1_move_id4() == 293,
                  p1_move_id5() == 293, p1_move_id6() == 293, p1_move_id7() == 293, p1_move_id8() == 293,
                  p1_move_id9() == 293, p1_move_id10() == 293, p1_move_id11() == 293, p1_move_id12() == 293,
                  p1_move_id13() == 293, p1_move_id14() == 293, p1_move_id15() == 293, p1_move_id16() == 293,
                  p1_move_id17() == 293, p1_move_id18() == 293, p1_move_id19() == 293, p1_move_id20() == 293,
                  p1_move_id21() == 293, p1_move_id22() == 293, p1_move_id23() == 293, p1_move_id24() == 293,
                  p1_move_id25() == 293, p1_move_id26() == 293, p1_move_id27() == 293, p1_move_id28() == 293,
                  p1_move_id29() == 293, p1_move_id30() == 293, p1_move_id31() == 293, p1_move_id32() == 293,
                  p1_move_id33() == 293, p1_move_id34() == 293, p1_move_id35() == 293, p1_move_id36() == 293,
                  p1_move_id37() == 293, p1_move_id38() == 293, p1_move_id39() == 293, p1_move_id40() == 293,
                  p1_move_id41() == 293, p1_move_id42() == 293, p1_move_id43() == 293, p1_move_id44() == 293,
                  p1_move_id45() == 293, p1_move_id46() == 293, p1_move_id47() == 293, p1_move_id48() == 293,
                  p1_move_id49() == 293, p1_move_id50() == 293, p1_move_id51() == 293, p1_move_id52() == 293,
                  p1_move_id53() == 293, p1_move_id54() == 293, p1_move_id55() == 293, p1_move_id56() == 293,
                  p1_move_id57() == 293, p1_move_id58() == 293, p1_move_id59() == 293, p1_move_id60() == 293,
                  p1_move_id61() == 293, p1_move_id62() == 293, p1_move_id63() == 293, p1_move_id64() == 293
              ) && never(prev(p1_number_of_moves_hit()) >= p1_number_of_moves_hit()) && never(p1_character() != 2)
)

achievement(
    title = "Ougi!! Mega Strike Heads", points = 5,
    description = "Hit the oponnent with Super Move playing as Galford (P1 vs CPU)",
    id = 64938, badge = "74516", published = "21/08/2018 02:00:06", modified = "06/01/2019 05:29:49",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 293, p1_move_id2() == 293, p1_move_id3() == 293, p1_move_id4() == 293,
                  p1_move_id5() == 293, p1_move_id6() == 293, p1_move_id7() == 293, p1_move_id8() == 293,
                  p1_move_id9() == 293, p1_move_id10() == 293, p1_move_id11() == 293, p1_move_id12() == 293,
                  p1_move_id13() == 293, p1_move_id14() == 293, p1_move_id15() == 293, p1_move_id16() == 293,
                  p1_move_id17() == 293, p1_move_id18() == 293, p1_move_id19() == 293, p1_move_id20() == 293,
                  p1_move_id21() == 293, p1_move_id22() == 293, p1_move_id23() == 293, p1_move_id24() == 293,
                  p1_move_id25() == 293, p1_move_id26() == 293, p1_move_id27() == 293, p1_move_id28() == 293,
                  p1_move_id29() == 293, p1_move_id30() == 293, p1_move_id31() == 293, p1_move_id32() == 293,
                  p1_move_id33() == 293, p1_move_id34() == 293, p1_move_id35() == 293, p1_move_id36() == 293,
                  p1_move_id37() == 293, p1_move_id38() == 293, p1_move_id39() == 293, p1_move_id40() == 293,
                  p1_move_id41() == 293, p1_move_id42() == 293, p1_move_id43() == 293, p1_move_id44() == 293,
                  p1_move_id45() == 293, p1_move_id46() == 293, p1_move_id47() == 293, p1_move_id48() == 293,
                  p1_move_id49() == 293, p1_move_id50() == 293, p1_move_id51() == 293, p1_move_id52() == 293,
                  p1_move_id53() == 293, p1_move_id54() == 293, p1_move_id55() == 293, p1_move_id56() == 293,
                  p1_move_id57() == 293, p1_move_id58() == 293, p1_move_id59() == 293, p1_move_id60() == 293,
                  p1_move_id61() == 293, p1_move_id62() == 293, p1_move_id63() == 293, p1_move_id64() == 293
              ) && never(prev(p1_number_of_moves_hit()) >= p1_number_of_moves_hit()) && never(p1_character() != 3)
)

achievement(
    title = "Ougi!! Shin Kikou Dai Bakuten", points = 5,
    description = "Hit the oponnent with Super Move playing as Wan-Fu (P1 vs CPU)",
    id = 64939, badge = "74517", published = "21/08/2018 02:00:08", modified = "06/01/2019 05:29:51",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 293, p1_move_id2() == 293, p1_move_id3() == 293, p1_move_id4() == 293,
                  p1_move_id5() == 293, p1_move_id6() == 293, p1_move_id7() == 293, p1_move_id8() == 293,
                  p1_move_id9() == 293, p1_move_id10() == 293, p1_move_id11() == 293, p1_move_id12() == 293,
                  p1_move_id13() == 293, p1_move_id14() == 293, p1_move_id15() == 293, p1_move_id16() == 293,
                  p1_move_id17() == 293, p1_move_id18() == 293, p1_move_id19() == 293, p1_move_id20() == 293,
                  p1_move_id21() == 293, p1_move_id22() == 293, p1_move_id23() == 293, p1_move_id24() == 293,
                  p1_move_id25() == 293, p1_move_id26() == 293, p1_move_id27() == 293, p1_move_id28() == 293,
                  p1_move_id29() == 293, p1_move_id30() == 293, p1_move_id31() == 293, p1_move_id32() == 293,
                  p1_move_id33() == 293, p1_move_id34() == 293, p1_move_id35() == 293, p1_move_id36() == 293,
                  p1_move_id37() == 293, p1_move_id38() == 293, p1_move_id39() == 293, p1_move_id40() == 293,
                  p1_move_id41() == 293, p1_move_id42() == 293, p1_move_id43() == 293, p1_move_id44() == 293,
                  p1_move_id45() == 293, p1_move_id46() == 293, p1_move_id47() == 293, p1_move_id48() == 293,
                  p1_move_id49() == 293, p1_move_id50() == 293, p1_move_id51() == 293, p1_move_id52() == 293,
                  p1_move_id53() == 293, p1_move_id54() == 293, p1_move_id55() == 293, p1_move_id56() == 293,
                  p1_move_id57() == 293, p1_move_id58() == 293, p1_move_id59() == 293, p1_move_id60() == 293,
                  p1_move_id61() == 293, p1_move_id62() == 293, p1_move_id63() == 293, p1_move_id64() == 293
              ) && never(prev(p1_number_of_moves_hit()) >= p1_number_of_moves_hit()) && never(p1_character() != 4)
)

achievement(
    title = "Ougi!! Tsubame Roku Ren", points = 5,
    description = "Hit the oponnent with Super Move playing as Ukyo Tachibana (P1 vs CPU)",
    id = 64940, badge = "74518", published = "21/08/2018 02:00:11", modified = "06/01/2019 05:29:52",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 293, p1_move_id2() == 293, p1_move_id3() == 293, p1_move_id4() == 293,
                  p1_move_id5() == 293, p1_move_id6() == 293, p1_move_id7() == 293, p1_move_id8() == 293,
                  p1_move_id9() == 293, p1_move_id10() == 293, p1_move_id11() == 293, p1_move_id12() == 293,
                  p1_move_id13() == 293, p1_move_id14() == 293, p1_move_id15() == 293, p1_move_id16() == 293,
                  p1_move_id17() == 293, p1_move_id18() == 293, p1_move_id19() == 293, p1_move_id20() == 293,
                  p1_move_id21() == 293, p1_move_id22() == 293, p1_move_id23() == 293, p1_move_id24() == 293,
                  p1_move_id25() == 293, p1_move_id26() == 293, p1_move_id27() == 293, p1_move_id28() == 293,
                  p1_move_id29() == 293, p1_move_id30() == 293, p1_move_id31() == 293, p1_move_id32() == 293,
                  p1_move_id33() == 293, p1_move_id34() == 293, p1_move_id35() == 293, p1_move_id36() == 293,
                  p1_move_id37() == 293, p1_move_id38() == 293, p1_move_id39() == 293, p1_move_id40() == 293,
                  p1_move_id41() == 293, p1_move_id42() == 293, p1_move_id43() == 293, p1_move_id44() == 293,
                  p1_move_id45() == 293, p1_move_id46() == 293, p1_move_id47() == 293, p1_move_id48() == 293,
                  p1_move_id49() == 293, p1_move_id50() == 293, p1_move_id51() == 293, p1_move_id52() == 293,
                  p1_move_id53() == 293, p1_move_id54() == 293, p1_move_id55() == 293, p1_move_id56() == 293,
                  p1_move_id57() == 293, p1_move_id58() == 293, p1_move_id59() == 293, p1_move_id60() == 293,
                  p1_move_id61() == 293, p1_move_id62() == 293, p1_move_id63() == 293, p1_move_id64() == 293
              ) && never(prev(p1_number_of_moves_hit()) >= p1_number_of_moves_hit()) && never(p1_character() != 5) &&
              never(p2_active_state() != 0)
)

achievement(
    title = "Ougi!! Aragotoshi Kyoshiro Chiniku no Mai", points = 5,
    description = "Hit the oponnent with Super Move playing as Kyoshiro Senryo (P1 vs CPU)",
    id = 64941, badge = "74519", published = "21/08/2018 02:00:13", modified = "06/01/2019 05:29:54",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 293, p1_move_id2() == 293, p1_move_id3() == 293, p1_move_id4() == 293,
                  p1_move_id5() == 293, p1_move_id6() == 293, p1_move_id7() == 293, p1_move_id8() == 293,
                  p1_move_id9() == 293, p1_move_id10() == 293, p1_move_id11() == 293, p1_move_id12() == 293,
                  p1_move_id13() == 293, p1_move_id14() == 293, p1_move_id15() == 293, p1_move_id16() == 293,
                  p1_move_id17() == 293, p1_move_id18() == 293, p1_move_id19() == 293, p1_move_id20() == 293,
                  p1_move_id21() == 293, p1_move_id22() == 293, p1_move_id23() == 293, p1_move_id24() == 293,
                  p1_move_id25() == 293, p1_move_id26() == 293, p1_move_id27() == 293, p1_move_id28() == 293,
                  p1_move_id29() == 293, p1_move_id30() == 293, p1_move_id31() == 293, p1_move_id32() == 293,
                  p1_move_id33() == 293, p1_move_id34() == 293, p1_move_id35() == 293, p1_move_id36() == 293,
                  p1_move_id37() == 293, p1_move_id38() == 293, p1_move_id39() == 293, p1_move_id40() == 293,
                  p1_move_id41() == 293, p1_move_id42() == 293, p1_move_id43() == 293, p1_move_id44() == 293,
                  p1_move_id45() == 293, p1_move_id46() == 293, p1_move_id47() == 293, p1_move_id48() == 293,
                  p1_move_id49() == 293, p1_move_id50() == 293, p1_move_id51() == 293, p1_move_id52() == 293,
                  p1_move_id53() == 293, p1_move_id54() == 293, p1_move_id55() == 293, p1_move_id56() == 293,
                  p1_move_id57() == 293, p1_move_id58() == 293, p1_move_id59() == 293, p1_move_id60() == 293,
                  p1_move_id61() == 293, p1_move_id62() == 293, p1_move_id63() == 293, p1_move_id64() == 293
              ) && never(prev(p1_number_of_moves_hit()) >= p1_number_of_moves_hit()) && never(p1_character() != 6) &&
              never(p2_active_state() != 0)
)

achievement(
    title = "Ougi!! MDC", points = 5,
    description = "Hit the oponnent with Super Move playing as Gen-an Shiranui (P1 vs CPU)",
    id = 64942, badge = "74520", published = "21/08/2018 02:00:15", modified = "20/10/2019 02:53:02",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 293, p1_move_id2() == 293, p1_move_id3() == 293, p1_move_id4() == 293,
                  p1_move_id5() == 293, p1_move_id6() == 293, p1_move_id7() == 293, p1_move_id8() == 293,
                  p1_move_id9() == 293, p1_move_id10() == 293, p1_move_id11() == 293, p1_move_id12() == 293,
                  p1_move_id13() == 293, p1_move_id14() == 293, p1_move_id15() == 293, p1_move_id16() == 293,
                  p1_move_id17() == 293, p1_move_id18() == 293, p1_move_id19() == 293, p1_move_id20() == 293,
                  p1_move_id21() == 293, p1_move_id22() == 293, p1_move_id23() == 293, p1_move_id24() == 293,
                  p1_move_id25() == 293, p1_move_id26() == 293, p1_move_id27() == 293, p1_move_id28() == 293,
                  p1_move_id29() == 293, p1_move_id30() == 293, p1_move_id31() == 293, p1_move_id32() == 293,
                  p1_move_id33() == 293, p1_move_id34() == 293, p1_move_id35() == 293, p1_move_id36() == 293,
                  p1_move_id37() == 293, p1_move_id38() == 293, p1_move_id39() == 293, p1_move_id40() == 293,
                  p1_move_id41() == 293, p1_move_id42() == 293, p1_move_id43() == 293, p1_move_id44() == 293,
                  p1_move_id45() == 293, p1_move_id46() == 293, p1_move_id47() == 293, p1_move_id48() == 293,
                  p1_move_id49() == 293, p1_move_id50() == 293, p1_move_id51() == 293, p1_move_id52() == 293,
                  p1_move_id53() == 293, p1_move_id54() == 293, p1_move_id55() == 293, p1_move_id56() == 293,
                  p1_move_id57() == 293, p1_move_id58() == 293, p1_move_id59() == 293, p1_move_id60() == 293,
                  p1_move_id61() == 293, p1_move_id62() == 293, p1_move_id63() == 293, p1_move_id64() == 293
              ) && never(prev(p1_number_of_moves_hit()) >= p1_number_of_moves_hit()) && never(p1_character() != 7) &&
              never(p2_active_state() != 0)
)

achievement(
    title = "Ougi!! Earth Gaddemu", points = 5,
    description = "Hit the oponnent with Super Move playing as Earthquake (P1 vs CPU)",
    id = 64943, badge = "74521", published = "21/08/2018 02:00:18", modified = "06/01/2019 05:29:57",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 293, p1_move_id2() == 293, p1_move_id3() == 293, p1_move_id4() == 293,
                  p1_move_id5() == 293, p1_move_id6() == 293, p1_move_id7() == 293, p1_move_id8() == 293,
                  p1_move_id9() == 293, p1_move_id10() == 293, p1_move_id11() == 293, p1_move_id12() == 293,
                  p1_move_id13() == 293, p1_move_id14() == 293, p1_move_id15() == 293, p1_move_id16() == 293,
                  p1_move_id17() == 293, p1_move_id18() == 293, p1_move_id19() == 293, p1_move_id20() == 293,
                  p1_move_id21() == 293, p1_move_id22() == 293, p1_move_id23() == 293, p1_move_id24() == 293,
                  p1_move_id25() == 293, p1_move_id26() == 293, p1_move_id27() == 293, p1_move_id28() == 293,
                  p1_move_id29() == 293, p1_move_id30() == 293, p1_move_id31() == 293, p1_move_id32() == 293,
                  p1_move_id33() == 293, p1_move_id34() == 293, p1_move_id35() == 293, p1_move_id36() == 293,
                  p1_move_id37() == 293, p1_move_id38() == 293, p1_move_id39() == 293, p1_move_id40() == 293,
                  p1_move_id41() == 293, p1_move_id42() == 293, p1_move_id43() == 293, p1_move_id44() == 293,
                  p1_move_id45() == 293, p1_move_id46() == 293, p1_move_id47() == 293, p1_move_id48() == 293,
                  p1_move_id49() == 293, p1_move_id50() == 293, p1_move_id51() == 293, p1_move_id52() == 293,
                  p1_move_id53() == 293, p1_move_id54() == 293, p1_move_id55() == 293, p1_move_id56() == 293,
                  p1_move_id57() == 293, p1_move_id58() == 293, p1_move_id59() == 293, p1_move_id60() == 293,
                  p1_move_id61() == 293, p1_move_id62() == 293, p1_move_id63() == 293, p1_move_id64() == 293
              ) && never(prev(p1_number_of_moves_hit()) >= p1_number_of_moves_hit()) && never(p1_character() != 8) &&
              never(p2_active_state() != 0)
)

achievement(
    title = "Ougi!! Zetsu Suigetsu Tou", points = 5,
    description = "Hit the oponnent with Super Move playing as Jubei Yagyu (P1 vs CPU)",
    id = 64944, badge = "74522", published = "21/08/2018 02:00:20", modified = "06/01/2019 05:29:59",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 293, p1_move_id2() == 293, p1_move_id3() == 293, p1_move_id4() == 293,
                  p1_move_id5() == 293, p1_move_id6() == 293, p1_move_id7() == 293, p1_move_id8() == 293,
                  p1_move_id9() == 293, p1_move_id10() == 293, p1_move_id11() == 293, p1_move_id12() == 293,
                  p1_move_id13() == 293, p1_move_id14() == 293, p1_move_id15() == 293, p1_move_id16() == 293,
                  p1_move_id17() == 293, p1_move_id18() == 293, p1_move_id19() == 293, p1_move_id20() == 293,
                  p1_move_id21() == 293, p1_move_id22() == 293, p1_move_id23() == 293, p1_move_id24() == 293,
                  p1_move_id25() == 293, p1_move_id26() == 293, p1_move_id27() == 293, p1_move_id28() == 293,
                  p1_move_id29() == 293, p1_move_id30() == 293, p1_move_id31() == 293, p1_move_id32() == 293,
                  p1_move_id33() == 293, p1_move_id34() == 293, p1_move_id35() == 293, p1_move_id36() == 293,
                  p1_move_id37() == 293, p1_move_id38() == 293, p1_move_id39() == 293, p1_move_id40() == 293,
                  p1_move_id41() == 293, p1_move_id42() == 293, p1_move_id43() == 293, p1_move_id44() == 293,
                  p1_move_id45() == 293, p1_move_id46() == 293, p1_move_id47() == 293, p1_move_id48() == 293,
                  p1_move_id49() == 293, p1_move_id50() == 293, p1_move_id51() == 293, p1_move_id52() == 293,
                  p1_move_id53() == 293, p1_move_id54() == 293, p1_move_id55() == 293, p1_move_id56() == 293,
                  p1_move_id57() == 293, p1_move_id58() == 293, p1_move_id59() == 293, p1_move_id60() == 293,
                  p1_move_id61() == 293, p1_move_id62() == 293, p1_move_id63() == 293, p1_move_id64() == 293
              ) && never(prev(p1_number_of_moves_hit()) >= p1_number_of_moves_hit()) && never(p1_character() != 9) &&
              never(p2_active_state() != 0)
)

achievement(
    title = "Ougi!! Splash Gradation", points = 5,
    description = "Hit the oponnent with Super Move playing as Charlotte (P1 vs CPU)",
    id = 64945, badge = "74523", published = "21/08/2018 02:00:21", modified = "06/01/2019 05:30:00",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 293, p1_move_id2() == 293, p1_move_id3() == 293, p1_move_id4() == 293,
                  p1_move_id5() == 293, p1_move_id6() == 293, p1_move_id7() == 293, p1_move_id8() == 293,
                  p1_move_id9() == 293, p1_move_id10() == 293, p1_move_id11() == 293, p1_move_id12() == 293,
                  p1_move_id13() == 293, p1_move_id14() == 293, p1_move_id15() == 293, p1_move_id16() == 293,
                  p1_move_id17() == 293, p1_move_id18() == 293, p1_move_id19() == 293, p1_move_id20() == 293,
                  p1_move_id21() == 293, p1_move_id22() == 293, p1_move_id23() == 293, p1_move_id24() == 293,
                  p1_move_id25() == 293, p1_move_id26() == 293, p1_move_id27() == 293, p1_move_id28() == 293,
                  p1_move_id29() == 293, p1_move_id30() == 293, p1_move_id31() == 293, p1_move_id32() == 293,
                  p1_move_id33() == 293, p1_move_id34() == 293, p1_move_id35() == 293, p1_move_id36() == 293,
                  p1_move_id37() == 293, p1_move_id38() == 293, p1_move_id39() == 293, p1_move_id40() == 293,
                  p1_move_id41() == 293, p1_move_id42() == 293, p1_move_id43() == 293, p1_move_id44() == 293,
                  p1_move_id45() == 293, p1_move_id46() == 293, p1_move_id47() == 293, p1_move_id48() == 293,
                  p1_move_id49() == 293, p1_move_id50() == 293, p1_move_id51() == 293, p1_move_id52() == 293,
                  p1_move_id53() == 293, p1_move_id54() == 293, p1_move_id55() == 293, p1_move_id56() == 293,
                  p1_move_id57() == 293, p1_move_id58() == 293, p1_move_id59() == 293, p1_move_id60() == 293,
                  p1_move_id61() == 293, p1_move_id62() == 293, p1_move_id63() == 293, p1_move_id64() == 293
              ) && never(prev(p1_number_of_moves_hit()) >= p1_number_of_moves_hit()) && never(p1_character() != 11) &&
              never(p2_active_state() != 0)
)

achievement(
    title = "Ougi!! Gokou Zan", points = 5,
    description = "Hit the oponnent with Super Move playing as Genjuro Kibagami (P1 vs CPU)",
    id = 64946, badge = "74524", published = "21/08/2018 02:00:24", modified = "06/01/2019 05:30:02",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 293, p1_move_id2() == 293, p1_move_id3() == 293, p1_move_id4() == 293,
                  p1_move_id5() == 293, p1_move_id6() == 293, p1_move_id7() == 293, p1_move_id8() == 293,
                  p1_move_id9() == 293, p1_move_id10() == 293, p1_move_id11() == 293, p1_move_id12() == 293,
                  p1_move_id13() == 293, p1_move_id14() == 293, p1_move_id15() == 293, p1_move_id16() == 293,
                  p1_move_id17() == 293, p1_move_id18() == 293, p1_move_id19() == 293, p1_move_id20() == 293,
                  p1_move_id21() == 293, p1_move_id22() == 293, p1_move_id23() == 293, p1_move_id24() == 293,
                  p1_move_id25() == 293, p1_move_id26() == 293, p1_move_id27() == 293, p1_move_id28() == 293,
                  p1_move_id29() == 293, p1_move_id30() == 293, p1_move_id31() == 293, p1_move_id32() == 293,
                  p1_move_id33() == 293, p1_move_id34() == 293, p1_move_id35() == 293, p1_move_id36() == 293,
                  p1_move_id37() == 293, p1_move_id38() == 293, p1_move_id39() == 293, p1_move_id40() == 293,
                  p1_move_id41() == 293, p1_move_id42() == 293, p1_move_id43() == 293, p1_move_id44() == 293,
                  p1_move_id45() == 293, p1_move_id46() == 293, p1_move_id47() == 293, p1_move_id48() == 293,
                  p1_move_id49() == 293, p1_move_id50() == 293, p1_move_id51() == 293, p1_move_id52() == 293,
                  p1_move_id53() == 293, p1_move_id54() == 293, p1_move_id55() == 293, p1_move_id56() == 293,
                  p1_move_id57() == 293, p1_move_id58() == 293, p1_move_id59() == 293, p1_move_id60() == 293,
                  p1_move_id61() == 293, p1_move_id62() == 293, p1_move_id63() == 293, p1_move_id64() == 293
              ) && never(prev(p1_number_of_moves_hit()) >= p1_number_of_moves_hit()) && never(p1_character() != 12) &&
              never(p2_active_state() != 0)
)

achievement(
    title = "Ougi!! Metamolie Animal Attack", points = 5,
    description = "Hit the oponnent with Super Move playing as Cham Cham (P1 vs CPU)",
    id = 64947, badge = "74525", published = "21/08/2018 02:00:26", modified = "06/01/2019 05:30:04",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 293, p1_move_id2() == 293, p1_move_id3() == 293, p1_move_id4() == 293,
                  p1_move_id5() == 293, p1_move_id6() == 293, p1_move_id7() == 293, p1_move_id8() == 293,
                  p1_move_id9() == 293, p1_move_id10() == 293, p1_move_id11() == 293, p1_move_id12() == 293,
                  p1_move_id13() == 293, p1_move_id14() == 293, p1_move_id15() == 293, p1_move_id16() == 293,
                  p1_move_id17() == 293, p1_move_id18() == 293, p1_move_id19() == 293, p1_move_id20() == 293,
                  p1_move_id21() == 293, p1_move_id22() == 293, p1_move_id23() == 293, p1_move_id24() == 293,
                  p1_move_id25() == 293, p1_move_id26() == 293, p1_move_id27() == 293, p1_move_id28() == 293,
                  p1_move_id29() == 293, p1_move_id30() == 293, p1_move_id31() == 293, p1_move_id32() == 293,
                  p1_move_id33() == 293, p1_move_id34() == 293, p1_move_id35() == 293, p1_move_id36() == 293,
                  p1_move_id37() == 293, p1_move_id38() == 293, p1_move_id39() == 293, p1_move_id40() == 293,
                  p1_move_id41() == 293, p1_move_id42() == 293, p1_move_id43() == 293, p1_move_id44() == 293,
                  p1_move_id45() == 293, p1_move_id46() == 293, p1_move_id47() == 293, p1_move_id48() == 293,
                  p1_move_id49() == 293, p1_move_id50() == 293, p1_move_id51() == 293, p1_move_id52() == 293,
                  p1_move_id53() == 293, p1_move_id54() == 293, p1_move_id55() == 293, p1_move_id56() == 293,
                  p1_move_id57() == 293, p1_move_id58() == 293, p1_move_id59() == 293, p1_move_id60() == 293,
                  p1_move_id61() == 293, p1_move_id62() == 293, p1_move_id63() == 293, p1_move_id64() == 293
              ) && never(prev(p1_number_of_moves_hit()) >= p1_number_of_moves_hit()) && never(p1_character() != 13) &&
              never(p2_active_state() != 0)
)

achievement(
    title = "Ougi!! Operation Tiger", points = 5,
    description = "Hit the oponnent with Super Move playing as Neinhalt Sieger (P1 vs CPU)",
    id = 64948, badge = "74526", published = "21/08/2018 02:00:28", modified = "06/01/2019 05:30:06",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 293, p1_move_id2() == 293, p1_move_id3() == 293, p1_move_id4() == 293,
                  p1_move_id5() == 293, p1_move_id6() == 293, p1_move_id7() == 293, p1_move_id8() == 293,
                  p1_move_id9() == 293, p1_move_id10() == 293, p1_move_id11() == 293, p1_move_id12() == 293,
                  p1_move_id13() == 293, p1_move_id14() == 293, p1_move_id15() == 293, p1_move_id16() == 293,
                  p1_move_id17() == 293, p1_move_id18() == 293, p1_move_id19() == 293, p1_move_id20() == 293,
                  p1_move_id21() == 293, p1_move_id22() == 293, p1_move_id23() == 293, p1_move_id24() == 293,
                  p1_move_id25() == 293, p1_move_id26() == 293, p1_move_id27() == 293, p1_move_id28() == 293,
                  p1_move_id29() == 293, p1_move_id30() == 293, p1_move_id31() == 293, p1_move_id32() == 293,
                  p1_move_id33() == 293, p1_move_id34() == 293, p1_move_id35() == 293, p1_move_id36() == 293,
                  p1_move_id37() == 293, p1_move_id38() == 293, p1_move_id39() == 293, p1_move_id40() == 293,
                  p1_move_id41() == 293, p1_move_id42() == 293, p1_move_id43() == 293, p1_move_id44() == 293,
                  p1_move_id45() == 293, p1_move_id46() == 293, p1_move_id47() == 293, p1_move_id48() == 293,
                  p1_move_id49() == 293, p1_move_id50() == 293, p1_move_id51() == 293, p1_move_id52() == 293,
                  p1_move_id53() == 293, p1_move_id54() == 293, p1_move_id55() == 293, p1_move_id56() == 293,
                  p1_move_id57() == 293, p1_move_id58() == 293, p1_move_id59() == 293, p1_move_id60() == 293,
                  p1_move_id61() == 293, p1_move_id62() == 293, p1_move_id63() == 293, p1_move_id64() == 293
              ) && never(prev(p1_number_of_moves_hit()) >= p1_number_of_moves_hit()) && never(p1_character() != 14) &&
              never(p2_active_state() != 0)
)

achievement(
    title = "Ougi!! Niou Furei Satzu", points = 5,
    description = "Hit the oponnent with Super Move playing as Caffeine Nicotine (P1 vs CPU)",
    id = 64949, badge = "74527", published = "21/08/2018 02:00:30", modified = "06/01/2019 05:30:08",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 293, p1_move_id2() == 293, p1_move_id3() == 293, p1_move_id4() == 293,
                  p1_move_id5() == 293, p1_move_id6() == 293, p1_move_id7() == 293, p1_move_id8() == 293,
                  p1_move_id9() == 293, p1_move_id10() == 293, p1_move_id11() == 293, p1_move_id12() == 293,
                  p1_move_id13() == 293, p1_move_id14() == 293, p1_move_id15() == 293, p1_move_id16() == 293,
                  p1_move_id17() == 293, p1_move_id18() == 293, p1_move_id19() == 293, p1_move_id20() == 293,
                  p1_move_id21() == 293, p1_move_id22() == 293, p1_move_id23() == 293, p1_move_id24() == 293,
                  p1_move_id25() == 293, p1_move_id26() == 293, p1_move_id27() == 293, p1_move_id28() == 293,
                  p1_move_id29() == 293, p1_move_id30() == 293, p1_move_id31() == 293, p1_move_id32() == 293,
                  p1_move_id33() == 293, p1_move_id34() == 293, p1_move_id35() == 293, p1_move_id36() == 293,
                  p1_move_id37() == 293, p1_move_id38() == 293, p1_move_id39() == 293, p1_move_id40() == 293,
                  p1_move_id41() == 293, p1_move_id42() == 293, p1_move_id43() == 293, p1_move_id44() == 293,
                  p1_move_id45() == 293, p1_move_id46() == 293, p1_move_id47() == 293, p1_move_id48() == 293,
                  p1_move_id49() == 293, p1_move_id50() == 293, p1_move_id51() == 293, p1_move_id52() == 293,
                  p1_move_id53() == 293, p1_move_id54() == 293, p1_move_id55() == 293, p1_move_id56() == 293,
                  p1_move_id57() == 293, p1_move_id58() == 293, p1_move_id59() == 293, p1_move_id60() == 293,
                  p1_move_id61() == 293, p1_move_id62() == 293, p1_move_id63() == 293, p1_move_id64() == 293
              ) && never(prev(p1_number_of_moves_hit()) >= p1_number_of_moves_hit()) && never(p1_character() != 15) &&
              never(p2_active_state() != 0)
)

// Ticket 16604: With Galford
//               
//               My life Red and Cham Cham Life red, I used DM kill Cham Cham and active the Achievement, Isn`t only
//               total Life ???
//               MD5: Unknown
achievement(
    title = "Kanzen Shori SS2", points = 5,
    description = "Win a perfect round (P1, difficulty>=Normal)",
    id = 64950, badge = "74528", published = "21/08/2018 02:00:41", modified = "06/01/2019 17:12:49",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              never(difficulty() < 3) && p1_victory_flag_1p() == 1 &&
              ((won_round_condition() == 2) ||
               (won_round_condition() == 3))
)

achievement(
    title = "Kotetsu Score", points = 5,
    description = "Score at least 150000 points (P1l)",
    id = 64951, badge = "74529", published = "21/08/2018 02:00:53", modified = "20/10/2019 02:53:02",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              p1_score_00xx0000() >= 21 && never(p1_score_00xx0000() > 48)
)

achievement(
    title = "Tekikaku Kanzen Shori SS2", points = 10,
    description = "Win a perfect conclusive round with 85 Hitting Percent or more in whole fight (P1, difficulty>=Normal)",
    id = 64952, badge = "74530", published = "21/08/2018 02:01:00", modified = "16/03/2021 22:44:49",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              won_round_condition() == 4 && never(hitting_percent() > 1000) && never(difficulty() < 3) &&
              never(hitting_percent() < 850)
)

achievement(
    title = "Jinsoku Kanzen Shori SS2", points = 5,
    description = "Win a perfect round under 70 seconds (P1, difficulty>=Normal)",
    id = 64953, badge = "74532", published = "21/08/2018 02:01:02", modified = "06/01/2019 17:12:53",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              never(difficulty() < 3) && never(round_timer() < 112) && p1_victory_flag_1p() == 1 &&
              ((won_round_condition() == 3) ||
               (won_round_condition() == 4))
)

achievement(
    title = "Taiketsu no Shori SS2", points = 10,
    description = "Defeat 4 opponents in a row without losing any round (P1, difficulty>=Normal)",
    id = 64954, badge = "74533", published = "21/08/2018 02:01:05", modified = "06/01/2019 05:30:22",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              never(p1_victory_flag_2p() == 1) && never(difficulty() < 3) && repeated(4, prev(stage()) < stage())
)

achievement(
    title = "Haohmaru Hell Change", points = 25,
    description = "Play through the game on expert difficulty (P1)",
    id = 64955, badge = "74534", published = "21/08/2018 02:01:07", modified = "16/03/2021 22:44:46",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              never(difficulty() != 7) && p1_victory_flag_1p() == 1 && p2_character() == 16 &&
              ((won_round_condition() == 2) ||
               (won_round_condition() == 4) ||
               (won_round_condition() == 8))
)

achievement(
    title = "Samurai Shodown II 1CC", points = 25,
    description = "Play through the game using only 1 credit (P1)",
    id = 64956, badge = "74535", published = "21/08/2018 02:01:09", modified = "16/03/2021 22:44:45",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(p2_active_state() != 0) &&
              once(stage() == 0) && once(stage() == 6) && never(p1_active_state() == 0) && p1_victory_flag_1p() == 1 &&
              p2_character() == 16 &&
              ((won_round_condition() == 2) ||
               (won_round_condition() == 4) ||
               (won_round_condition() == 8))
)

// Ticket 26784: I made it against CPU, I hit oponent, normal difficult.
//               
//               Nothing happens<br>MD5: Unknown<br>Emulator: RALibRetro
achievement(
    title = "Himitsu Shi no Ichigeki - Hiougi Fuujin Zan", points = 5,
    description = "Hit the oponnent with secret technique playing as Haohmaru",
    id = 64987, badge = "74536", published = "21/08/2018 21:25:11", modified = "06/01/2019 05:30:27",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 309, p1_move_id2() == 309, p1_move_id3() == 309, p1_move_id4() == 309,
                  p1_move_id5() == 309, p1_move_id6() == 309, p1_move_id7() == 309, p1_move_id8() == 309,
                  p1_move_id9() == 309, p1_move_id10() == 309, p1_move_id11() == 309, p1_move_id12() == 309,
                  p1_move_id13() == 309, p1_move_id14() == 309, p1_move_id15() == 309, p1_move_id16() == 309,
                  p1_move_id17() == 309, p1_move_id18() == 309, p1_move_id19() == 309, p1_move_id20() == 309,
                  p1_move_id21() == 309, p1_move_id22() == 309, p1_move_id23() == 309, p1_move_id24() == 309,
                  p1_move_id25() == 309, p1_move_id26() == 309, p1_move_id27() == 309, p1_move_id28() == 309,
                  p1_move_id29() == 309, p1_move_id30() == 309, p1_move_id31() == 309, p1_move_id32() == 309,
                  p1_move_id33() == 309, p1_move_id34() == 309, p1_move_id35() == 309, p1_move_id36() == 309,
                  p1_move_id37() == 309, p1_move_id38() == 309, p1_move_id39() == 309, p1_move_id40() == 309,
                  p1_move_id41() == 309, p1_move_id42() == 309, p1_move_id43() == 309, p1_move_id44() == 309,
                  p1_move_id45() == 309, p1_move_id46() == 309, p1_move_id47() == 309, p1_move_id48() == 309,
                  p1_move_id49() == 309, p1_move_id50() == 309, p1_move_id51() == 309, p1_move_id52() == 309,
                  p1_move_id53() == 309, p1_move_id54() == 309, p1_move_id55() == 309, p1_move_id56() == 309,
                  p1_move_id57() == 309, p1_move_id58() == 309, p1_move_id59() == 309, p1_move_id60() == 309,
                  p1_move_id61() == 309, p1_move_id62() == 309, p1_move_id63() == 309, p1_move_id64() == 309
              ) && never(prev(p1_number_of_moves_hit()) >= p1_number_of_moves_hit()) && never(p1_character() != 0)
)

achievement(
    title = "Himitsu Shi no Nigeki - Apefuchi Kamui Rimse", points = 5,
    description = "Hit the oponnent withsecret technique playing as Nakoruru (P1 vs CPU)",
    id = 64988, badge = "74537", published = "21/08/2018 21:25:16", modified = "06/01/2019 05:30:29",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 313, p1_move_id2() == 313, p1_move_id3() == 313, p1_move_id4() == 313,
                  p1_move_id5() == 313, p1_move_id6() == 313, p1_move_id7() == 313, p1_move_id8() == 313,
                  p1_move_id9() == 313, p1_move_id10() == 313, p1_move_id11() == 313, p1_move_id12() == 313,
                  p1_move_id13() == 313, p1_move_id14() == 313, p1_move_id15() == 313, p1_move_id16() == 313,
                  p1_move_id17() == 313, p1_move_id18() == 313, p1_move_id19() == 313, p1_move_id20() == 313,
                  p1_move_id21() == 313, p1_move_id22() == 313, p1_move_id23() == 313, p1_move_id24() == 313,
                  p1_move_id25() == 313, p1_move_id26() == 313, p1_move_id27() == 313, p1_move_id28() == 313,
                  p1_move_id29() == 313, p1_move_id30() == 313, p1_move_id31() == 313, p1_move_id32() == 313,
                  p1_move_id33() == 313, p1_move_id34() == 313, p1_move_id35() == 313, p1_move_id36() == 313,
                  p1_move_id37() == 313, p1_move_id38() == 313, p1_move_id39() == 313, p1_move_id40() == 313,
                  p1_move_id41() == 313, p1_move_id42() == 313, p1_move_id43() == 313, p1_move_id44() == 313,
                  p1_move_id45() == 313, p1_move_id46() == 313, p1_move_id47() == 313, p1_move_id48() == 313,
                  p1_move_id49() == 313, p1_move_id50() == 313, p1_move_id51() == 313, p1_move_id52() == 313,
                  p1_move_id53() == 313, p1_move_id54() == 313, p1_move_id55() == 313, p1_move_id56() == 313,
                  p1_move_id57() == 313, p1_move_id58() == 313, p1_move_id59() == 313, p1_move_id60() == 313,
                  p1_move_id61() == 313, p1_move_id62() == 313, p1_move_id63() == 313, p1_move_id64() == 313
              ) && never(prev(p1_number_of_moves_hit()) >= p1_number_of_moves_hit()) && never(p1_character() != 1) &&
              never(p2_active_state() != 0)
)

achievement(
    title = "Tigerkopf-Falkennagel-Elefantglied", points = 5,
    description = "Hit the oponnent with combined technique playing as Neinhalt Sieger (P1 vs CPU)",
    id = 64989, badge = "74538", published = "21/08/2018 21:25:21", modified = "20/10/2019 02:53:02",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 302, p1_move_id2() == 302, p1_move_id3() == 302, p1_move_id4() == 302,
                  p1_move_id5() == 302, p1_move_id6() == 302, p1_move_id7() == 302, p1_move_id8() == 302,
                  p1_move_id9() == 302, p1_move_id10() == 302, p1_move_id11() == 302, p1_move_id12() == 302,
                  p1_move_id13() == 302, p1_move_id14() == 302, p1_move_id15() == 302, p1_move_id16() == 302,
                  p1_move_id17() == 302, p1_move_id18() == 302, p1_move_id19() == 302, p1_move_id20() == 302,
                  p1_move_id21() == 302, p1_move_id22() == 302, p1_move_id23() == 302, p1_move_id24() == 302,
                  p1_move_id25() == 302, p1_move_id26() == 302, p1_move_id27() == 302, p1_move_id28() == 302,
                  p1_move_id29() == 302, p1_move_id30() == 302, p1_move_id31() == 302, p1_move_id32() == 302,
                  p1_move_id33() == 302, p1_move_id34() == 302, p1_move_id35() == 302, p1_move_id36() == 302,
                  p1_move_id37() == 302, p1_move_id38() == 302, p1_move_id39() == 302, p1_move_id40() == 302,
                  p1_move_id41() == 302, p1_move_id42() == 302, p1_move_id43() == 302, p1_move_id44() == 302,
                  p1_move_id45() == 302, p1_move_id46() == 302, p1_move_id47() == 302, p1_move_id48() == 302,
                  p1_move_id49() == 302, p1_move_id50() == 302, p1_move_id51() == 302, p1_move_id52() == 302,
                  p1_move_id53() == 302, p1_move_id54() == 302, p1_move_id55() == 302, p1_move_id56() == 302,
                  p1_move_id57() == 302, p1_move_id58() == 302, p1_move_id59() == 302, p1_move_id60() == 302,
                  p1_move_id61() == 302, p1_move_id62() == 302, p1_move_id63() == 302, p1_move_id64() == 302
              ) && never(p1_character() != 14) && never(p2_fall_recovery() != 131) && never(p2_active_state() != 0)
)

achievement(
    title = "Kage Mai", points = 5,
    description = "Use the Shinobi disappearing technique playing as Hanzo Hattori or Galford (P1 vs CPU)",
    id = 64990, badge = "74539", published = "21/08/2018 21:25:28", modified = "06/01/2019 05:30:32",
    trigger = never(dword(0x00FE30) != 0) && never(mvs_flag() == 1) && never(byte(0x000AE4) != 3) &&
              tally(1, p1_move_id1() == 307, p1_move_id2() == 307, p1_move_id3() == 307, p1_move_id4() == 307,
                  p1_move_id5() == 307, p1_move_id6() == 307, p1_move_id7() == 307, p1_move_id8() == 307,
                  p1_move_id9() == 307, p1_move_id10() == 307, p1_move_id11() == 307, p1_move_id12() == 307,
                  p1_move_id13() == 307, p1_move_id14() == 307, p1_move_id15() == 307, p1_move_id16() == 307,
                  p1_move_id17() == 307, p1_move_id18() == 307, p1_move_id19() == 307, p1_move_id20() == 307,
                  p1_move_id21() == 307, p1_move_id22() == 307, p1_move_id23() == 307, p1_move_id24() == 307,
                  p1_move_id25() == 307, p1_move_id26() == 307, p1_move_id27() == 307, p1_move_id28() == 307,
                  p1_move_id29() == 307, p1_move_id30() == 307, p1_move_id31() == 307, p1_move_id32() == 307,
                  p1_move_id33() == 307, p1_move_id34() == 307, p1_move_id35() == 307, p1_move_id36() == 307,
                  p1_move_id37() == 307, p1_move_id38() == 307, p1_move_id39() == 307, p1_move_id40() == 307,
                  p1_move_id41() == 307, p1_move_id42() == 307, p1_move_id43() == 307, p1_move_id44() == 307,
                  p1_move_id45() == 307, p1_move_id46() == 307, p1_move_id47() == 307, p1_move_id48() == 307,
                  p1_move_id49() == 307, p1_move_id50() == 307, p1_move_id51() == 307, p1_move_id52() == 307,
                  p1_move_id53() == 307, p1_move_id54() == 307, p1_move_id55() == 307, p1_move_id56() == 307,
                  p1_move_id57() == 307, p1_move_id58() == 307, p1_move_id59() == 307, p1_move_id60() == 307,
                  p1_move_id61() == 307, p1_move_id62() == 307, p1_move_id63() == 307, p1_move_id64() == 307
              ) && never(p1_character() < 2) && never(p1_character() > 3) && never(p2_active_state() != 0)
)
