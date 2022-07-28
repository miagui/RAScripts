// King of Fighters '95, The
// #ID = 12029

function ending_h85() => byte(0x000B87)
function ending_h10() => byte(0x000B88)

function p1_char() => byte(0x008170)
function p1_anim() => byte(0x8172)
function p1_move_type() => byte(0x82b3)
function p1_flashing() => byte(0x00825C)

function p2_char() => byte(0x008370)
function p2_anim() => byte(0x8372)
function p2_move_type() => byte(0x84b3)
function p2_flashing() => byte(0x00845C)

function cpu_team_defeated_bitflag() => byte(0x00A7E8)
function game_mode() => byte(0x00A83E)
function p2_team() => byte(0x00A850)

function p2_state() => byte(0x00FDB6)
function p1_state() => byte(0x00FDB7)

function unibios() => dword(0x00FE30)

achievement(
    title = "Final Bringer", description = "Perform a Desperation Move as Heidern", points = 2,
    id = 59934, badge = "62661", published = "06/05/2018 15:17:50", modified = "06/05/2018 16:03:52",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 0 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 0 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Bari Bari Vulcan Punch", description = "Perform a Desperation Move as Ralf Jones", points = 2,
    id = 59935, badge = "62662", published = "06/05/2018 15:17:51", modified = "06/05/2018 16:03:53",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 1 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 1 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Ultra Argentine Back Breaker", description = "Perform a Desperation Move as Clark Still", points = 2,
    id = 59936, badge = "62663", published = "06/05/2018 15:17:52", modified = "06/05/2018 16:03:55",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 2 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 2 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Crystal Shoot", description = "Perform a Desperation Move as Athena Asamiya", points = 2,
    id = 59937, badge = "62664", published = "06/05/2018 15:17:53", modified = "06/05/2018 16:03:54",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 3 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 3 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Shin Ryuu Tenbu Kyaku", description = "Perform a Desperation Move as Sie Kensou", points = 2,
    id = 59938, badge = "62665", published = "06/05/2018 15:17:54", modified = "06/05/2018 16:03:56",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 4 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 4 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Gou Ran Enpou", description = "Perform a Desperation Move as Chin Gentsai", points = 2,
    id = 59939, badge = "62667", published = "06/05/2018 15:17:55", modified = "06/05/2018 16:03:58",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 5 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 5 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Ura 108 Shiki Orochi Nagi", description = "Perform a Desperation Move as Kyo Kusanagi", points = 2,
    id = 59940, badge = "62670", published = "06/05/2018 15:17:57", modified = "06/05/2018 16:03:59",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 6 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 6 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Raiko Ken", description = "Perform a Desperation Move as Benimaru Nikaido", points = 2,
    id = 59941, badge = "62669", published = "06/05/2018 15:17:58", modified = "31/01/2022 03:56:02",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 7 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 7 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Jigoku Gokuraku Otoshi", description = "Perform a Desperation Move as Goro Daimon", points = 2,
    id = 59942, badge = "62671", published = "06/05/2018 15:17:59", modified = "06/05/2018 16:04:01",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 8 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 8 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Kin 1201 Shiki Ya Otome", description = "Perform a Desperation Move as Iori Yagami", points = 2,
    id = 59943, badge = "62672", published = "06/05/2018 15:18:01", modified = "06/05/2018 16:04:02",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 9 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 9 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Tantetsu Touroh Ken", description = "Perform a Desperation Move as Eiji Kisaragi", points = 2,
    id = 59944, badge = "62673", published = "06/05/2018 15:18:02", modified = "06/05/2018 16:04:03",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 10 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 10 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Cho Kaen Senpu Kon", description = "Perform a Desperation Move as Billy Kane", points = 2,
    id = 59945, badge = "62675", published = "06/05/2018 15:18:03", modified = "06/05/2018 16:04:05",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 11 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 11 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Houou Kyaku", description = "Perform a Desperation Move as Kim Kaphwan", points = 2,
    id = 59946, badge = "62674", published = "06/05/2018 15:18:05", modified = "06/05/2018 16:04:06",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 12 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 12 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Tekkyu Dai Bou Sou", description = "Perform a Desperation Move as Chang Koehan", points = 2,
    id = 59947, badge = "62676", published = "06/05/2018 15:18:07", modified = "06/05/2018 16:04:08",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 13 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 13 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Shin! Chouzetsu Tatsumaki Shinkuu Zan", description = "Perform a Desperation Move as Choi Bounge", points = 2,
    id = 59948, badge = "62677", published = "06/05/2018 15:18:08", modified = "06/05/2018 16:04:09",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 14 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 14 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Power Geyser", description = "Perform a Desperation Move as Terry Bogard", points = 2,
    id = 59949, badge = "62678", published = "06/05/2018 15:18:10", modified = "23/10/2019 00:01:01",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 15 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 15 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Co Reppa Dan", description = "Perform a Desperation Move as Andy Bogard", points = 2,
    id = 59950, badge = "62679", published = "06/05/2018 15:18:11", modified = "31/01/2022 03:56:02",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 16 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 16 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Screw Upper", description = "Perform a Desperation Move as Joe Higashi", points = 2,
    id = 59951, badge = "62680", published = "06/05/2018 15:18:12", modified = "06/05/2018 16:04:12",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 17 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 17 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Ryuuko Rampage", description = "Perform a Desperation Move as Ryo Sakazaki", points = 2,
    id = 59952, badge = "62681", published = "06/05/2018 15:18:14", modified = "06/05/2018 16:04:13",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 18 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 18 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Ryuko Ranbu I", description = "Perform a Desperation Move as Robert Garcia", points = 2,
    id = 59953, badge = "62682", published = "06/05/2018 15:18:15", modified = "06/05/2018 16:04:14",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 19 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 19 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Ryuko Ranbu II", description = "Perform a Desperation Move as Takuma Sakazaki", points = 2,
    id = 59954, badge = "62683", published = "06/05/2018 15:18:16", modified = "06/05/2018 16:04:15",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 20 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 20 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Hien Houou Kyaku", description = "Perform a Desperation Move as Yuri Sakazaki", points = 2,
    id = 59955, badge = "62684", published = "06/05/2018 15:18:17", modified = "06/05/2018 16:04:16",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 21 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 21 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Cho Hissatsu Shinobibachi", description = "Perform a Desperation Move as Mai Shiranui", points = 2,
    id = 59956, badge = "62685", published = "06/05/2018 15:18:18", modified = "31/01/2022 03:56:02",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 22 && p1_anim() == 0x81 && prev(p1_anim()) != 0x81  && unless(p1_state() == 0)) ||
               (p2_char() == 22 && p2_anim() == 0x81 && prev(p2_anim()) != 0x81  && unless(p2_state() == 0)))
)

achievement(
    title = "Illusion Dance", description = "Perform a Desperation Move as King", points = 2,
    id = 59957, badge = "62686", published = "06/05/2018 15:18:19", modified = "06/05/2018 16:04:19",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 23 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 23 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Ura 108 Shiki Orochi Nagi", description = "Perform a Desperation Move as Saisyu Kusanagi", points = 2,
    id = 59958, badge = "62687", published = "06/05/2018 15:18:21", modified = "06/05/2018 16:04:21",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 24 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 24 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "Gigatech Pressure", description = "Perform a Desperation Move as Rugal Bernstein", points = 2,
    id = 59959, badge = "62688", published = "06/05/2018 15:18:22", modified = "06/05/2018 16:04:22",
    trigger = never(unibios() != 0) &&
              ((p1_char() == 25 && p1_move_type() == 0x25 && prev(p1_move_type()) != 0x25  && unless(p1_state() == 0)) ||
               (p2_char() == 25 && p2_move_type() == 0x25 && prev(p2_move_type()) != 0x25  && unless(p2_state() == 0)))
)

achievement(
    title = "KOF 95", description = "Beat the game on 'Team Play' without using a continue", points = 50,
    id = 59931, badge = "62640", published = "06/05/2018 15:17:46", modified = "03/07/2022 01:13:53",
    trigger = never(unibios() != 0) && cpu_team_defeated_bitflag() == 255 && p2_team() == 8 && ending_h10() == 16 && 
              unless(p1_state() == p2_state()) && never(p1_state() == 2) && ending_h85() == 133 && 
              repeated(7, cpu_team_defeated_bitflag() > prev(cpu_team_defeated_bitflag())) && game_mode() == 1
)
