// Street Fighter Alpha 2
// #ID = 605

function p1_character() => byte(0x0007A2)
function p1_consecutive_wins() => byte(0x000850)
function p2_character() => byte(0x000A22)
function p2_consecutive_wins() => byte(0x000AD0)
function dialogue_string() => word(0x001494)
function dialogue_flag() => byte(0x001496)
function settings_difficulty() => byte(0x001DA4)

achievement(
    title = "Ryu's Rival", description = "Unlock and beat Ryu's rival (Sakura)  while playing on 4 stars or higher", points = 5,
    id = 30078, badge = "30819", published = "17/11/2015 21:13:44", modified = "17/11/2015 21:15:55",
    trigger = settings_difficulty() >= 3 && once(dialogue_flag() == 210) && once(dialogue_string() == 35502) && once(dialogue_string()
               == 35520) && once(dialogue_string() == 35557) && once(dialogue_string() == 35593) &&
              ((p1_character() == 0 && p2_character() == 13 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 0 && p1_character() == 13 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Ken's Rival", description = "Unlock and beat Ken's rival (Dan) while playing on 4 stars or higher", points = 5,
    id = 30079, badge = "30820", published = "17/11/2015 21:13:48", modified = "17/11/2015 21:15:59",
    trigger = settings_difficulty() >= 3 && once(dialogue_flag() == 210) && once(dialogue_string() == 35735) && once(dialogue_string()
               == 35781) && once(dialogue_string() == 35808) && once(dialogue_string() == 35833) &&
              ((p1_character() == 1 && p2_character() == 12 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 1 && p1_character() == 12 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Akuma's Rival", description = "Unlock and beat Akuma's rival (Ryu) while playing on 4 stars or higher", points = 5,
    id = 30080, badge = "30821", published = "17/11/2015 21:13:51", modified = "17/11/2015 21:16:04",
    trigger = settings_difficulty() >= 3 && once(dialogue_flag() == 210) && once(dialogue_string() == 38714) && once(dialogue_string()
               == 38747) && once(dialogue_string() == 38770) &&
              ((p1_character() == 2 && p2_character() == 0 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 2 && p1_character() == 0 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Charlie's Rival", description = "Unlock and beat Charlie's rival (Rolento) while playing on 4 stars or higher", points = 5,
    id = 30081, badge = "30822", published = "17/11/2015 21:13:55", modified = "01/12/2016 22:05:54",
    trigger = settings_difficulty() >= 3 && once(dialogue_flag() == 210) && once(dialogue_string() == 37759) && once(dialogue_string()
               == 37796) && once(dialogue_string() == 37815) && once(dialogue_string() == 37846) &&
              ((p1_character() == 3 && p2_character() == 14 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 3 && p1_character() == 14 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Chun-Li's Rival", description = "Unlock and beat Chun-Li's rival (Gen) while playing on 4 stars or higher", points = 5,
    id = 30082, badge = "30823", published = "17/11/2015 21:13:58", modified = "17/11/2015 21:16:11",
    trigger = settings_difficulty() >= 3 && once(dialogue_flag() == 210) && once(dialogue_string() == 35993) && once(dialogue_string()
               == 36029) && once(dialogue_string() == 36048) && once(dialogue_string() == 36088) &&
              ((p1_consecutive_wins() > prev(p1_consecutive_wins()) && never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_consecutive_wins() > prev(p2_consecutive_wins()) && never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Adon's Rival", description = "Unlock and beat Adon's rival (M. Bison) while playing on 4 stars or higher", points = 5,
    id = 30083, badge = "30824", published = "17/11/2015 21:14:01", modified = "29/09/2019 11:16:01",
    trigger = settings_difficulty() >= 3 && once(dialogue_flag() == 210) && once(dialogue_string() == 36560) && once(dialogue_string()
               == 36573) && once(dialogue_string() == 36625) && once(dialogue_string() == 36662) &&
              ((p1_character() == 5 && p2_character() == 10 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 5 && p1_character() == 10 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Katana's Rival", description = "Unlock and beat Katana's rival (Ken) while playing on 4 stars or higher", points = 5,
    id = 30084, badge = "30825", published = "17/11/2015 21:14:04", modified = "17/11/2015 21:16:19",
    trigger = settings_difficulty() >= 3 && once(dialogue_flag() == 210) && once(dialogue_string() == 37455) && once(dialogue_string()
               == 37502) && once(dialogue_string() == 37558) && once(dialogue_string() == 37596) &&
              ((p1_character() == 6 && p2_character() == 1 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 6 && p1_character() == 1 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Guy's Rival", description = "Unlock and beat Guy's rival (Rose) while playing on 4 stars or higher", points = 5,
    id = 30085, badge = "30826", published = "17/11/2015 21:14:06", modified = "02/10/2019 11:55:02",
    trigger = settings_difficulty() >= 3 && once(dialogue_flag() == 210) && once(dialogue_string() == 37126) && once(dialogue_string()
               == 37155) && once(dialogue_string() == 37181) && once(dialogue_string() == 37228) &&
              ((p1_character() == 7 && p2_character() == 9 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 7 && p1_character() == 9 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Birdie's Rival", description = "Unlock and beat Birdie's rival (Dhalsim) while playing on 4 stars or higher", points = 5,
    id = 30086, badge = "30827", published = "17/11/2015 21:14:09", modified = "17/11/2015 21:16:26",
    trigger = settings_difficulty() >= 3 && once(dialogue_flag() == 210) && once(dialogue_string() == 36853) && once(dialogue_string()
               == 36873) && once(dialogue_string() == 36920) && once(dialogue_string() == 36960) &&
              ((p1_character() == 8 && p2_character() == 15 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 8 && p1_character() == 15 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Rose's Rival", description = "Unlock and beat Rose's rival (Akuma) while playing on 4 stars or higher", points = 5,
    id = 30087, badge = "30828", published = "17/11/2015 21:14:12", modified = "17/11/2015 21:16:31",
    trigger = settings_difficulty() >= 3 && once(dialogue_flag() == 210) && once(dialogue_string() == 38107) && once(dialogue_string()
               == 38116) && once(dialogue_string() == 38139) && once(dialogue_string() == 38149) &&
              ((p1_character() == 9 && p2_character() == 2 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 9 && p1_character() == 2 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "M. Bison's Rival", description = "Unlock and beat M. Bison's rival (Charlie) while playing on 4 stars or higher", points = 5,
    id = 30088, badge = "30829", published = "17/11/2015 21:14:15", modified = "08/10/2019 13:16:01",
    trigger = settings_difficulty() >= 3 && once(dialogue_flag() == 210) && once(dialogue_string() == 38367) && once(dialogue_string()
               == 38410) && once(dialogue_string() == 38439) && once(dialogue_string() == 38488) &&
              ((p1_character() == 10 && p2_character() == 3 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 10 && p1_character() == 3 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Sagat's Rival", description = "Unlock and beat Sagat's rival (Adon) while playing on 4 stars or higher", points = 5,
    id = 30089, badge = "30830", published = "17/11/2015 21:14:18", modified = "17/11/2015 21:16:42",
    trigger = settings_difficulty() >= 3 && once(dialogue_flag() == 210) && once(dialogue_string() == 36283) && once(dialogue_string()
               == 36303) && once(dialogue_string() == 36334) && once(dialogue_string() == 36382) &&
              ((p1_character() == 11 && p2_character() == 5 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 11 && p1_character() == 5 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Dan's Rival", description = "Unlock and beat Dan's rival (Guy) while playing on 4 stars or higher", points = 5,
    id = 30090, badge = "30831", published = "17/11/2015 21:14:21", modified = "17/11/2015 21:16:49",
    trigger = settings_difficulty() >= 3 && once(dialogue_flag() == 210) && once(dialogue_string() == 38871) && once(dialogue_string()
               == 38882) && once(dialogue_string() == 38926) && once(dialogue_string() == 38961) &&
              ((p1_character() == 12 && p2_character() == 7 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 12 && p1_character() == 7 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Sakura's Rival", description = "Unlock and beat Sakura's rival (Sagat) while playing on 4 stars or higher", points = 5,
    id = 30091, badge = "30832", published = "17/11/2015 21:14:24", modified = "05/10/2019 12:34:01",
    trigger = settings_difficulty() >= 3 && once(dialogue_flag() == 210) && once(dialogue_string() == 40654) && once(dialogue_string()
               == 40666) && once(dialogue_string() == 40705) && once(dialogue_string() == 40737) &&
              ((p1_character() == 13 && p2_character() == 11 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 13 && p1_character() == 11 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Rolento's Rival", description = "Unlock and beat Rolento's rival (Katana) while playing on 4 stars or higher", points = 5,
    id = 30092, badge = "30833", published = "17/11/2015 21:14:27", modified = "14/10/2019 14:45:01",
    trigger = settings_difficulty() >= 3 && once(dialogue_flag() == 210) && once(dialogue_string() == 40257) && once(dialogue_string()
               == 40328) && once(dialogue_string() == 40383) && once(dialogue_string() == 40422) &&
              ((p1_character() == 14 && p2_character() == 6 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 14 && p1_character() == 6 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Dhalsim's Rival", description = "Unlock and beat Dhalsim's rival (Zanguief) while playing on 4 stars or higher", points = 5,
    id = 30093, badge = "30834", published = "17/11/2015 21:14:30", modified = "14/10/2019 14:45:01",
    trigger = settings_difficulty() >= 3 && once(dialogue_flag() == 210) && once(dialogue_string() == 39202) && once(dialogue_string()
               == 39252) && once(dialogue_string() == 39332) && once(dialogue_string() == 39412) &&
              ((p1_character() == 15 && p2_character() == 16 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 15 && p1_character() == 16 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Zangief's Rival", description = "Unlock and beat Zanguief's rival (Birdie) while playing on 4 stars or higher", points = 5,
    id = 30094, badge = "30835", published = "17/11/2015 21:14:33", modified = "20/07/2022 19:08:25",
    trigger = settings_difficulty() >= 3 && once(dialogue_flag() == 210) && once(dialogue_string() == 39598) && once(dialogue_string()
               == 39634) && once(dialogue_string() == 39701) && once(dialogue_string() == 39737) &&
              ((p1_character() == 16 && p2_character() == 8 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 16 && p1_character() == 8 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Gen's Rival", description = "Unlock and beat Gen's rival (Chun-Li) while playing on 4 stars or higher", points = 5,
    id = 30095, badge = "30836", published = "17/11/2015 21:14:37", modified = "17/11/2015 21:17:10",
    trigger = settings_difficulty() >= 0 && once(dialogue_flag() == 210) && once(dialogue_string() == 39887) && once(dialogue_string()
               == 39919) && once(dialogue_string() == 39959) && once(dialogue_string() == 40035) &&
              ((p1_consecutive_wins() > prev(p1_consecutive_wins()) && never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_consecutive_wins() > prev(p2_consecutive_wins()) && never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Ryu's Strong Rival", description = "Unlock and beat Ryu's rival (Sakura) while playing on 8 Stars", points = 5,
    id = 120070, badge = "130991", published = "01/08/2020 00:47:31", modified = "08/08/2020 20:18:44",
    trigger = settings_difficulty() == 7 && once(dialogue_flag() == 210) && once(dialogue_string() == 35502) && once(dialogue_string()
               == 35520) && once(dialogue_string() == 35557) && once(dialogue_string() == 35593) &&
              ((p1_character() == 0 && p2_character() == 13 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 0 && p1_character() == 13 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Ken's Strong Rival", description = "Unlock and beat Ken's rival (Dan) while playing on on 8 Stars", points = 5,
    id = 120071, badge = "130992", published = "01/08/2020 00:47:40", modified = "01/08/2020 00:47:40",
    trigger = settings_difficulty() == 7 && once(dialogue_flag() == 210) && once(dialogue_string() == 35735) && once(dialogue_string()
               == 35781) && once(dialogue_string() == 35808) && once(dialogue_string() == 35833) &&
              ((p1_character() == 1 && p2_character() == 12 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 1 && p1_character() == 12 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Akuma's Strong Rival", description = "Unlock and beat Akuma's rival (Ryu) while playing on 8 Stars", points = 5,
    id = 120072, badge = "130993", published = "01/08/2020 00:47:45", modified = "01/08/2020 00:47:45",
    trigger = settings_difficulty() == 7 && once(dialogue_flag() == 210) && once(dialogue_string() == 38714) && once(dialogue_string()
               == 38747) && once(dialogue_string() == 38770) &&
              ((p1_character() == 2 && p2_character() == 0 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 2 && p1_character() == 0 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Charlie's Strong Rival", description = "Unlock and beat Charlie's rival (Rolento) while playing on 8 Stars", points = 5,
    id = 120073, badge = "130994", published = "01/08/2020 00:47:52", modified = "01/08/2020 00:47:52",
    trigger = settings_difficulty() == 7 && once(dialogue_flag() == 210) && once(dialogue_string() == 37759) && once(dialogue_string()
               == 37796) && once(dialogue_string() == 37815) && once(dialogue_string() == 37846) &&
              ((p1_character() == 3 && p2_character() == 14 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 3 && p1_character() == 14 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Chun-Li's Strong Rival", description = "Unlock and beat Chun-Li's rival (Gen) while playing on 8 Stars", points = 5,
    id = 120074, badge = "130995", published = "01/08/2020 00:48:09", modified = "01/08/2020 00:48:09",
    trigger = settings_difficulty() == 7 && once(dialogue_flag() == 210) && once(dialogue_string() == 35993) && once(dialogue_string()
               == 36029) && once(dialogue_string() == 36048) && once(dialogue_string() == 36088) &&
              ((p1_consecutive_wins() > prev(p1_consecutive_wins()) && never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_consecutive_wins() > prev(p2_consecutive_wins()) && never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Adon's Strong Rival", description = "Unlock and beat Adon's rival (M. Bison) while playing on 8 Stars", points = 5,
    id = 120075, badge = "130996", published = "01/08/2020 00:49:15", modified = "01/08/2020 00:49:15",
    trigger = settings_difficulty() == 7 && once(dialogue_flag() == 210) && once(dialogue_string() == 36560) && once(dialogue_string()
               == 36573) && once(dialogue_string() == 36625) && once(dialogue_string() == 36662) &&
              ((p1_character() == 5 && p2_character() == 10 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 5 && p1_character() == 10 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Katana's Strong Rival", description = "Unlock and beat Katana's rival (Ken) while playing on 8 Stars", points = 5,
    id = 120076, badge = "130997", published = "01/08/2020 00:49:21", modified = "01/08/2020 00:49:21",
    trigger = settings_difficulty() == 7 && once(dialogue_flag() == 210) && once(dialogue_string() == 37455) && once(dialogue_string()
               == 37502) && once(dialogue_string() == 37558) && once(dialogue_string() == 37596) &&
              ((p1_character() == 6 && p2_character() == 1 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 6 && p1_character() == 1 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Guy's Strong Rival", description = "Unlock and beat Guy's rival (Rose) while playing on 8 Stars", points = 5,
    id = 120077, badge = "130998", published = "01/08/2020 00:49:26", modified = "01/08/2020 00:49:26",
    trigger = settings_difficulty() == 7 && once(dialogue_flag() == 210) && once(dialogue_string() == 37126) && once(dialogue_string()
               == 37155) && once(dialogue_string() == 37181) && once(dialogue_string() == 37228) &&
              ((p1_character() == 7 && p2_character() == 9 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 7 && p1_character() == 9 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Birdie's Strong Rival", description = "Unlock and beat Birdie's rival (Dhalsim) while playing on 8 Stars", points = 5,
    id = 120078, badge = "130999", published = "01/08/2020 00:49:39", modified = "01/08/2020 00:49:39",
    trigger = settings_difficulty() == 7 && once(dialogue_flag() == 210) && once(dialogue_string() == 36853) && once(dialogue_string()
               == 36873) && once(dialogue_string() == 36920) && once(dialogue_string() == 36960) &&
              ((p1_character() == 8 && p2_character() == 15 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 8 && p1_character() == 15 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Rose's Strong Rival", description = "Unlock and beat Rose's rival (Akuma) while playing on 8 Stars", points = 5,
    id = 120079, badge = "131000", published = "01/08/2020 00:49:44", modified = "01/08/2020 00:49:44",
    trigger = settings_difficulty() == 7 && once(dialogue_flag() == 210) && once(dialogue_string() == 38107) && once(dialogue_string()
               == 38116) && once(dialogue_string() == 38139) && once(dialogue_string() == 38149) &&
              ((p1_character() == 9 && p2_character() == 2 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 9 && p1_character() == 2 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "M. Bison's Strong Rival", description = "Unlock and beat M. Bison's rival (Charlie) while playing on 8 Stars", points = 5,
    id = 120080, badge = "131001", published = "01/08/2020 00:49:49", modified = "01/08/2020 00:49:49",
    trigger = settings_difficulty() == 7 && once(dialogue_flag() == 210) && once(dialogue_string() == 38367) && once(dialogue_string()
               == 38410) && once(dialogue_string() == 38439) && once(dialogue_string() == 38488) &&
              ((p1_character() == 10 && p2_character() == 3 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 10 && p1_character() == 3 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Sagat's Strong Rival", description = "Unlock and beat Sagat's rival (Adon) while playing on 8 Stars", points = 5,
    id = 120081, badge = "131002", published = "01/08/2020 00:49:57", modified = "01/08/2020 00:49:57",
    trigger = settings_difficulty() == 7 && once(dialogue_flag() == 210) && once(dialogue_string() == 36283) && once(dialogue_string()
               == 36303) && once(dialogue_string() == 36334) && once(dialogue_string() == 36382) &&
              ((p1_character() == 11 && p2_character() == 5 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 11 && p1_character() == 5 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Dan's Strong Rival", description = "Unlock and beat Dan's rival (Guy) while playing on 8 Stars", points = 5,
    id = 120082, badge = "131003", published = "01/08/2020 00:50:01", modified = "01/08/2020 00:50:01",
    trigger = settings_difficulty() == 7 && once(dialogue_flag() == 210) && once(dialogue_string() == 38871) && once(dialogue_string()
               == 38882) && once(dialogue_string() == 38926) && once(dialogue_string() == 38961) &&
              ((p1_character() == 12 && p2_character() == 7 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 12 && p1_character() == 7 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Sakura's Strong Rival", description = "Unlock and beat Sakura's rival (Sagat) while playing on 8 Stars", points = 5,
    id = 120083, badge = "131005", published = "01/08/2020 00:50:06", modified = "01/08/2020 00:50:06",
    trigger = settings_difficulty() == 7 && once(dialogue_flag() == 210) && once(dialogue_string() == 40654) && once(dialogue_string()
               == 40666) && once(dialogue_string() == 40705) && once(dialogue_string() == 40737) &&
              ((p1_character() == 13 && p2_character() == 11 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 13 && p1_character() == 11 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Rolento's Strong Rival", description = "Unlock and beat Rolento's rival (Katana) while playing on 8 Stars", points = 5,
    id = 120084, badge = "131006", published = "01/08/2020 00:50:11", modified = "01/08/2020 00:50:11",
    trigger = settings_difficulty() == 7 && once(dialogue_flag() == 210) && once(dialogue_string() == 40257) && once(dialogue_string()
               == 40328) && once(dialogue_string() == 40383) && once(dialogue_string() == 40422) &&
              ((p1_character() == 14 && p2_character() == 6 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 14 && p1_character() == 6 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Dhalsim's Strong Rival", description = "Unlock and beat Dhalsim's rival (Zanguief) while playing on 8 Stars", points = 5,
    id = 120085, badge = "131007", published = "01/08/2020 00:50:16", modified = "01/08/2020 00:50:16",
    trigger = settings_difficulty() == 7 && once(dialogue_flag() == 210) && once(dialogue_string() == 39202) && once(dialogue_string()
               == 39252) && once(dialogue_string() == 39332) && once(dialogue_string() == 39412) &&
              ((p1_character() == 15 && p2_character() == 16 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 15 && p1_character() == 16 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Zangiief's Strong Rival", description = "Unlock and beat Zanguief's rival (Birdie) while playing on 8 Stars", points = 5,
    id = 120086, badge = "131008", published = "01/08/2020 00:50:20", modified = "20/07/2022 19:08:26",
    trigger = settings_difficulty() == 7 && once(dialogue_flag() == 210) && once(dialogue_string() == 39598) && once(dialogue_string()
               == 39634) && once(dialogue_string() == 39701) && once(dialogue_string() == 39737) &&
              ((p1_character() == 16 && p2_character() == 8 && p1_consecutive_wins() > prev(p1_consecutive_wins()) && 
                never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_character() == 16 && p1_character() == 8 && p2_consecutive_wins() > prev(p2_consecutive_wins()) && 
                never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)

achievement(
    title = "Gen's Strong Rival", description = "Unlock and beat Gen's rival (Chun-Li) while playing on 8 Stars", points = 5,
    id = 120087, badge = "131009", published = "01/08/2020 00:50:24", modified = "01/08/2020 00:50:24",
    trigger = settings_difficulty() == 7 && once(dialogue_flag() == 210) && once(dialogue_string() == 39887) && once(dialogue_string()
               == 39919) && once(dialogue_string() == 39959) && once(dialogue_string() == 40035) &&
              ((p1_consecutive_wins() > prev(p1_consecutive_wins()) && never(p1_consecutive_wins() < prev(p1_consecutive_wins()))) ||
               (p2_consecutive_wins() > prev(p2_consecutive_wins()) && never(p2_consecutive_wins() < prev(p2_consecutive_wins()))))
)
