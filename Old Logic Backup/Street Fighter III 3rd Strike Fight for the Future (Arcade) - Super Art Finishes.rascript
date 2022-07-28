// Street Fighter III 3rd Strike: Fight for the Future
// #ID = 11795

function p1_char() => byte(0x011384)
function p1_super_art() => byte(0x011388)
function game_versus_flag() => byte(0x0113B6)
function p2_connected() => byte(0x0156E0)
function match_background_flag() => byte(0x028055)
function match_super_art_attribute_active() => byte(0x0286C8)
function p1_command() => dword(0x068D18)
function p2_hp() => byte(0x0691A0)

achievement(
    title = "Super Art 3rd Strike I (Alex)", description = "In one session finish rounds by performing complete H. Bomb (P-Bomb finish), B. Raid and S. Gun Headbutt (P1 High Attack Only)", points = 5,
    id = 58945, badge = "61655", published = "31/03/2018 03:15:26", modified = "19/10/2019 21:51:01",
    trigger = once(p1_command() == 131090) && once(p1_command() == 131100) && once(p1_command() == 131086) && 
              unless(p1_char() != 1) && unless(p2_hp() != 255) && unless(game_versus_flag() == 1) && 
              unless(p2_connected() == 1)
)

achievement(
    title = "Super Art 3rd Strike II (Ryu)", description = "In one session finish rounds by performing Shinku Hadoken, Shin Shoryuken and Denjin Hadouken (P1 High Attack Only)", points = 5,
    id = 58946, badge = "61656", published = "31/03/2018 03:15:30", modified = "19/10/2019 21:51:01",
    trigger = once(p1_command() == 327718) && once(p1_command() == 327747) && once(p1_command() == 327722) && 
              unless(p1_char() != 2) && unless(p2_hp() != 255) && unless(game_versus_flag() == 1) && 
              unless(p2_connected() == 1)
)

achievement(
    title = "Super Art 3rd Strike III (Yun)", description = "In one session finish rounds by performing You-hou, Sourai Rengeki and Genei-jin (P1 High Attack Only)", points = 5,
    id = 58947, badge = "61657", published = "31/03/2018 03:15:33", modified = "19/10/2019 21:51:01",
    trigger = once(p1_command() == 327726) && once(p1_command() == 327730) && once(match_super_art_attribute_active() == 1) && 
              unless(p1_char() != 3) && unless(p2_hp() != 255) && unless(game_versus_flag() == 1) && 
              unless(p2_connected() == 1)
)

achievement(
    title = "Super Art 3rd Strike IV (Dudley)", description = "In one session finish rounds by performing Rocket Upper, Rolling Thunder and Corkscrew Blow (P1 High Attack Only)", points = 5,
    id = 58948, badge = "61658", published = "31/03/2018 03:15:37", modified = "19/10/2019 21:51:01",
    trigger = once(p1_command() == 327730) && once(p1_command() == 327714) && once(p1_command() == 327710) && 
              unless(p1_char() != 4) && unless(p2_hp() != 255) && unless(game_versus_flag() == 1) && 
              unless(p2_connected() == 1)
)

achievement(
    title = "Super Art 3rd Strike V (Necro)", description = "In one session finish rounds by performing Magnetic Storm, Slam Dance and Electric Snake (P1 High Attack Only)", points = 5,
    id = 58949, badge = "61659", published = "31/03/2018 03:15:41", modified = "22/10/2019 22:44:01",
    trigger = once(p1_command() == 327718) && once(p1_command() == 131077) && once(p1_command() == 327706) && 
              unless(p1_char() != 5) && unless(p2_hp() != 255) && unless(game_versus_flag() == 1) && 
              unless(p2_connected() == 1)
)

achievement(
    title = "Super Art 3rd Strike VI (Hugo)", description = "In one session finish rounds by performing Gigas Breaker, Megaton Press and Hammer Frenzy (P1 High Attack Only)", points = 5,
    id = 58950, badge = "61660", published = "31/03/2018 03:15:44", modified = "22/10/2019 22:44:01",
    trigger = once(p1_command() == 131096) && once(p1_command() == 131100) && once(p1_command() == 327734) && 
              unless(p1_char() != 6) && unless(p2_hp() != 255) && unless(game_versus_flag() == 1) && 
              unless(p2_connected() == 1)
)

achievement(
    title = "Super Art 3rd Strike VII (Ibuki)", description = "In one session finish rounds by performing Kasumi Suzaku, Yoroi Dooshi and Yami Shigure (P1 High Attack Only)", points = 5,
    id = 58951, badge = "61661", published = "31/03/2018 03:15:49", modified = "22/10/2019 22:44:01",
    trigger = once(p1_command() == 327742) && once(p1_command() == 131082) && once(p1_command() == 327734) && 
              unless(p1_char() != 7) && unless(p2_hp() != 255) && unless(game_versus_flag() == 1) && 
              unless(p2_connected() == 1)
)

achievement(
    title = "Super Art 3rd Strike VIII (Elena)", description = "In one session finish rounds by performing Spinning Beat and Brave Dance (P1 High Attack Only)", points = 5,
    id = 58952, badge = "61662", published = "31/03/2018 03:15:52", modified = "19/10/2019 21:51:01",
    trigger = once(p1_command() == 327718) && once(p1_command() == 327722) && unless(p1_char() != 8) && 
              unless(p2_hp() != 255) && unless(game_versus_flag() == 1) && unless(p2_connected() == 1)
)

achievement(
    title = "Super Art 3rd Strike IX (Oro)", description = "In one session finish rounds by performing Kishin Riki, Kishin Tsui, Yagyou-Odama and Tengu Midareishi (P1 High Attack Only)", points = 5,
    id = 58953, badge = "61663", published = "31/03/2018 03:15:56", modified = "22/10/2019 22:44:01",
    trigger = once(p1_super_art() == 2) && once(p1_command() == 327731) && unless(p1_char() != 9) && 
              unless(p2_hp() != 255) && unless(match_background_flag() == 0) && once(p1_command() == 131077) && 
              once(p1_command() == 131085) && unless(p2_connected() == 1)
)

achievement(
    title = "Super Art 3rd Strike X (Yang)", description = "In one session finish rounds by performing Raishin Mahha Ken, Tenshin Senkyuutai and Sei'ei Enbu (P1 High Attack Only)", points = 5,
    id = 58954, badge = "61664", published = "31/03/2018 03:16:00", modified = "19/10/2019 21:51:01",
    trigger = once(p1_command() == 327730) && once(p1_command() == 327726) && once(match_super_art_attribute_active() == 1) && 
              unless(p1_char() != 10) && unless(p2_hp() != 255) && unless(game_versus_flag() == 1) && 
              unless(p2_connected() == 1)
)

achievement(
    title = "Super Art 3rd Strike XI (Ken)", description = "In one session finish rounds by performing Shoryureppa, Shinryuken and Shippu Jinraikyaku (P1 High Attack Only)", points = 5,
    id = 58955, badge = "61665", published = "31/03/2018 03:16:03", modified = "07/10/2019 18:49:01",
    trigger = once(p1_command() == 327718) && once(p1_command() == 327722) && once(p1_command() == 327726) && 
              unless(p1_char() != 11) && unless(p2_hp() != 255) && unless(game_versus_flag() == 1) && 
              unless(p2_connected() == 1)
)

achievement(
    title = "Super Art 3rd Strike XII (Sean)", description = "In one session finish rounds by performing Hadou Burst, Shoryuu Cannon and Hyper Tornado (P1 High Attack Only)", points = 5,
    id = 58956, badge = "61666", published = "31/03/2018 03:16:06", modified = "22/10/2019 22:44:01",
    trigger = once(p1_command() == 327718) && once(p1_command() == 327726) && once(p1_command() == 327720) && 
              unless(p1_char() != 12) && unless(p2_hp() != 255) && unless(game_versus_flag() == 1) && 
              unless(p2_connected() == 1)
)

achievement(
    title = "Super Art 3rd Strike XIII (Urien)", description = "In one session finish rounds by performing Tyrant Slaughter,  Temporal Thunder and Aegis Reflector (P1 High Attack Only)", points = 5,
    id = 58957, badge = "61667", published = "31/03/2018 03:16:09", modified = "22/10/2019 22:44:01",
    trigger = once(p1_command() == 327752) && once(p1_command() == 327748) && unless(p1_char() != 13) && 
              unless(p2_hp() != 255) && once(p1_super_art() == 2) && unless(match_background_flag() == 0) && 
              unless(p2_connected() == 1)
)

achievement(
    title = "Super Art 3rd Strike XIV (Akuma)", description = "In one session finish rounds by performing all 7 Akuma's Super Arts (including airs) (P1 High Attack Only)", points = 5,
    id = 58958, badge = "61668", published = "31/03/2018 03:16:13", modified = "22/10/2019 22:44:01",
    trigger = once(p1_command() == 327718) && once(p1_command() == 327722) && once(p1_command() == 327726) && 
              unless(p1_char() != 14) && unless(p2_hp() != 255) && once(p1_command() == 327743) && 
              once(p1_command() == 131090) && unless(game_versus_flag() == 1) && once(p1_command() == 327730) && 
              once(p1_command() == 327758) && unless(p2_connected() == 1)
)

achievement(
    title = "Super Art 3rd Strike XV (Chun Li)", description = "In one session finish rounds by performing Kikou Shou, Houyoku Sen and Tensei Ranka (P1 High Attack Only)", points = 5,
    id = 58959, badge = "61669", published = "31/03/2018 03:16:16", modified = "19/10/2019 21:51:01",
    trigger = once(p1_command() == 327726) && once(p1_command() == 327730) && once(p1_command() == 327734) && 
              unless(p1_char() != 16) && unless(p2_hp() != 255) && unless(game_versus_flag() == 1) && 
              unless(p2_connected() == 1)
)

achievement(
    title = "Super Art 3rd Strike XVI (Makoto)", description = "In one session finish rounds by performing Seichusen Godanzuki, Abare Tosanami and Tanden Renki (P1 High Attack Only)", points = 5,
    id = 58960, badge = "61670", published = "31/03/2018 03:16:20", modified = "22/10/2019 22:44:01",
    trigger = once(p1_command() == 327740) && once(p1_command() == 327725) && once(match_super_art_attribute_active() == 1) && 
              unless(p1_char() != 17) && unless(p2_hp() != 255) && unless(game_versus_flag() == 1) && 
              unless(p2_connected() == 1)
)

achievement(
    title = "Super Art 3rd Strike XVII (Q)", description = "In one session finish rounds by performing Critical C. Attack, D. Double, T. D. Activate and T.D. Danger (P1 High Attack Only)", points = 5,
    id = 58961, badge = "61672", published = "31/03/2018 03:16:26", modified = "16/10/2019 21:00:02",
    trigger = once(p1_command() == 327724) && once(p1_command() == 327730) && once(p1_command() == 327733) && 
              unless(p1_char() != 18) && unless(p2_hp() != 255) && once(p1_command() == 131088) && 
              unless(game_versus_flag() == 1) && unless(p2_connected() == 1)
)

achievement(
    title = "Super Art 3rd Strike XVIII (Twelve)", description = "In one session finish rounds by performing X.N.D.L., X.F.L.A.T. and X.C.O.P.Y. (P1 High Attack Only)", points = 5,
    id = 58962, badge = "61671", published = "31/03/2018 03:16:30", modified = "22/10/2019 22:44:02",
    trigger = once(p1_command() == 327722) && once(p1_command() == 327747) && once(match_super_art_attribute_active() == 1) && 
              unless(p1_char() != 19) && unless(p2_hp() != 255) && unless(game_versus_flag() == 1) && 
              unless(p2_connected() == 1)
)

achievement(
    title = "Super Art 3rd Strike XIX (Remy)", description = "In one session finish rounds by performing Light of Justice , Supreme Rising Rage and Blue Nocturne (P1 High Attack Only)", points = 5,
    id = 58963, badge = "61673", published = "31/03/2018 03:16:33", modified = "16/10/2019 21:00:02",
    trigger = once(p1_command() == 327706) && once(p1_command() == 327740) && once(p1_command() == 327732) && 
              unless(p1_char() != 20) && unless(p2_hp() != 255) && unless(game_versus_flag() == 1) && 
              unless(p2_connected() == 1)
)
