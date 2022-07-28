// Ultimate Mortal Kombat 3
// #ID = 70

achievement(
    title = "Mortal Combat", description = "This is a secret achievement", points = 1,
    id = 47425, badge = "48043", published = "25/04/2017 13:59:13", modified = "06/12/2020 01:53:36",
    trigger = byte(0x00001A) != 0
)

achievement(
    title = "Fatality", description = "Perform a fatality", points = 4,
    id = 47400, badge = "47995", published = "25/04/2017 13:54:05", modified = "06/12/2020 01:53:45",
    trigger = unless(byte(0x0002E2) != 0) && byte(0x00F22E) == 2 && byte(0x00F5A8) == 1 && unless(byte(0x00021E) != 1) && 
              unless(byte(0x0002EA) == 2)
)

achievement(
    title = "Babality", description = "Perform a Babality", points = 5,
    id = 47401, badge = "47993", published = "25/04/2017 13:54:10", modified = "20/10/2019 13:55:01",
    trigger = byte(0x00F5A8) == 5 && byte(0x00F22E) == 2 && unless(byte(0x0002E2) != 0) && unless(byte(0x00021E) != 1) && 
              unless(byte(0x0002EA) == 2)
)

achievement(
    title = "Friendship", description = "Perform a Friendship", points = 5,
    id = 47402, badge = "47994", published = "25/04/2017 13:54:14", modified = "27/04/2017 05:12:58",
    trigger = unless(byte(0x0002E2) != 0) && byte(0x00F22E) == 2 && byte(0x00F5A8) == 4 && unless(byte(0x00021E) != 1) && 
              unless(byte(0x0002EA) == 2)
)

achievement(
    title = "Brutality", description = "Perform a Brutality", points = 5,
    id = 47403, badge = "47996", published = "25/04/2017 13:54:18", modified = "27/04/2017 05:13:02",
    trigger = byte(0x00F5A8) == 6 && byte(0x00F22E) == 2 && unless(byte(0x0002E2) != 0) && unless(byte(0x00021E) != 1) && 
              unless(byte(0x0002EA) == 2)
)

achievement(
    title = "Comeback Victory", description = "Win a fight after being down 1 round to 0.", points = 5,
    id = 47426, badge = "48046", published = "25/04/2017 13:59:17", modified = "27/04/2017 05:09:38",
    trigger = byte(0x00F22E) == 2 && unless(byte(0x00021E) != 1) && byte(0x0002A0) == 1 && unless(byte(0x0002EA) == 2) &&
              ((never(byte(0x0002A0) == 0) && repeated(10, byte(0x00F22E) == 0)) ||
               (byte(0x00F22E) == 37))
)

achievement(
    title = "Close One", description = "In the third round of a fight, win with less than a quarter of your health left", points = 5,
    id = 47424, badge = "48041", published = "25/04/2017 13:59:09", modified = "27/04/2017 05:09:23",
    trigger = byte(0x009F7A) <= 30 && byte(0x00F22E) == 2 && unless(byte(0x00021E) != 1) && unless(byte(0x0002EA) == 2)
)

achievement(
    title = "The Stage is Set", description = "Win a fight on each stage", points = 5,
    id = 47429, badge = "48047", published = "25/04/2017 13:59:29", modified = "06/12/2020 01:53:34",
    trigger = unless(byte(0x00F22E) != 2) && unless(byte(0x00021E) != 1) && once(byte(0x0014D0) == 157) && 
              once(byte(0x0014D0) == 1) && once(byte(0x0014D0) == 185) && once(byte(0x0014D0) == 46) && 
              once(word(0x0014D0) == 764) && once(byte(0x0014D0) == 5) && once(byte(0x0014D0) == 35) && 
              once(byte(0x0014D0) == 13) && once(byte(0x0014D0) == 241) && once(byte(0x0014D0) == 252) && 
              once(byte(0x0014D0) == 236) && unless(byte(0x0002EA) == 2) && unless(byte(0x00029A) == 0)
)

achievement(
    title = "Internal Conflict", description = "As masked Sub-Zero, perform a fatality on unmasked Sub-Zero", points = 5,
    id = 47417, badge = "48028", published = "25/04/2017 13:58:41", modified = "27/04/2017 05:06:55",
    trigger = unless(byte(0x0002E2) != 0) && byte(0x00F22E) == 2 && byte(0x00F5A8) == 1 && unless(byte(0x00021E) != 1) && 
              byte(0x000126) == 21 && byte(0x000128) == 4 && unless(byte(0x0002EA) == 2)
)

achievement(
    title = "Is That Any Way to Treat Your Mother?", description = "As Kitana, perform a fatality on Sindel", points = 5,
    id = 47418, badge = "48030", published = "25/04/2017 13:58:46", modified = "20/10/2019 13:55:01",
    trigger = unless(byte(0x0002E2) != 0) && byte(0x00F22E) == 2 && byte(0x00F5A8) == 1 && unless(byte(0x00021E) != 1) && 
              byte(0x000126) == 15 && byte(0x000128) == 6 && unless(byte(0x0002EA) == 2)
)

achievement(
    title = "We're not so Different, You and I", description = "As unmasked Sub-Zero, perform a friendship on Scorpion", points = 5,
    id = 47419, badge = "48032", published = "25/04/2017 13:58:50", modified = "27/04/2017 05:07:20",
    trigger = unless(byte(0x0002E2) != 0) && byte(0x00F22E) == 2 && byte(0x00F5A8) == 4 && unless(byte(0x00021E) != 1) && 
              byte(0x000126) == 4 && byte(0x000128) == 18 && unless(byte(0x0002EA) == 2)
)

achievement(
    title = "Get Over Here", description = "As Scorpion, perform a friendship", points = 5,
    id = 47420, badge = "48033", published = "25/04/2017 13:58:54", modified = "27/04/2017 05:07:32",
    trigger = unless(byte(0x0002E2) != 0) && byte(0x00F22E) == 2 && byte(0x00F5A8) == 4 && unless(byte(0x00021E) != 1) && 
              byte(0x000126) == 18 && unless(byte(0x0002EA) == 2)
)

achievement(
    title = "I Said No", description = "As Sonya, perform a brutality on Kano", points = 5,
    id = 47421, badge = "48035", published = "25/04/2017 13:58:57", modified = "27/04/2017 05:07:41",
    trigger = unless(byte(0x0002E2) != 0) && byte(0x00F22E) == 2 && byte(0x00F5A8) == 6 && unless(byte(0x00021E) != 1) && 
              byte(0x000126) == 1 && byte(0x000128) == 0 && unless(byte(0x0002EA) == 2)
)

achievement(
    title = "Oh. Poor Baby", description = "As Shang Tsung, perform a Babality on Liu Kang", points = 5,
    id = 47422, badge = "48036", published = "25/04/2017 13:59:01", modified = "27/04/2017 05:07:49",
    trigger = unless(byte(0x0002E2) != 0) && byte(0x00F22E) == 2 && byte(0x00F5A8) == 5 && unless(byte(0x00021E) != 1) && 
              byte(0x000126) == 12 && byte(0x000128) == 13 && unless(byte(0x0002EA) == 2)
)

achievement(
    title = "Home, Sweet Home", description = "As Jade, perform a fatality on an opponent in Jade's Desert", points = 5,
    id = 47427, badge = "48044", published = "25/04/2017 13:59:21", modified = "27/04/2017 05:09:48",
    trigger = byte(0x00F22E) == 2 && unless(byte(0x00021E) != 1) && byte(0x00F5A8) == 1 && byte(0x000126) == 16 && 
              byte(0x0014D0) == 157 && unless(byte(0x0002EA) == 2)
)

achievement(
    title = "The Full Repertoire", description = "As Scorpion, perform a fatality, babality, friendship and brutality", points = 5,
    id = 47428, badge = "48045", published = "25/04/2017 13:59:25", modified = "27/04/2017 05:10:24",
    trigger = unless(byte(0x00021E) != 1) && once(byte(0x00F5A8) == 1) && unless(byte(0x000126) != 18) && 
              once(byte(0x00F5A8) == 4) && once(byte(0x00F5A8) == 5) && once(byte(0x00F5A8) == 6) && 
              unless(byte(0x0002A0) == 2) && never(byte(0x0002EA) == 2)
)

achievement(
    title = "Novice", description = "Complete the novice arcade ladder", points = 10,
    id = 47404, badge = "48014", published = "25/04/2017 13:54:22", modified = "23/10/2019 14:51:01",
    trigger = byte(0x00F22E) == 2 && never(byte(0x0002EA) == 2) && never(byte(0x000222) != 5) && never(bit7(0x00018C) ==
               1) && byte(0x000128) == 27 &&
              ((byte(0x0002E5) == 0 && byte(0x00F22E) == 2 && byte(0x0002F1) == 7 && repeated(10, byte(0x0002F1) == 1)) ||
               (byte(0x0002E5) == 1 && byte(0x00F22E) == 2 && byte(0x0002F1) == 8 && repeated(10, byte(0x0002F1) == 1)) ||
               (byte(0x0002E5) == 2 && byte(0x00F22E) == 2 && byte(0x0002F1) == 9 && repeated(10, byte(0x0002F1) == 1)) ||
               (byte(0x00F22E) == 2 && byte(0x0002E5) == 3 && byte(0x0002F1) == 10 && repeated(10, byte(0x0002F1) == 1)))
)

achievement(
    title = "Warrior", description = "Complete the warrior arcade ladder", points = 10,
    id = 47405, badge = "48013", published = "25/04/2017 13:54:26", modified = "06/12/2020 01:54:03",
    trigger = byte(0x00F22E) == 2 && never(byte(0x0002EA) == 2) && never(byte(0x000222) != 5) && never(bit7(0x00018C) ==
               1) && byte(0x000128) == 27 &&
              ((byte(0x0002E5) == 1 && byte(0x00F22E) == 2 && byte(0x0002F1) == 8 && repeated(10, byte(0x0002F1) == 1)) ||
               (byte(0x0002E5) == 2 && byte(0x00F22E) == 2 && byte(0x0002F1) == 9 && repeated(10, byte(0x0002F1) == 1)) ||
               (byte(0x0002E5) == 3 && byte(0x00F22E) == 2 && byte(0x0002F1) == 10 && repeated(10, byte(0x0002F1) == 1)))
)

achievement(
    title = "Master", description = "Complete the master arcade ladder", points = 10,
    id = 47406, badge = "48000", published = "25/04/2017 13:54:29", modified = "06/12/2020 01:54:01",
    trigger = byte(0x00F22E) == 2 && never(byte(0x0002EA) == 2) && never(byte(0x000222) != 5) && never(bit7(0x00018C) ==
               1) && byte(0x000128) == 27 &&
              ((byte(0x0002E5) == 2 && byte(0x00F22E) == 2 && byte(0x0002F1) == 9 && repeated(10, byte(0x0002F1) == 1)) ||
               (byte(0x0002E5) == 3 && byte(0x00F22E) == 2 && byte(0x0002F1) == 10 && repeated(10, byte(0x0002F1) == 1)))
)

achievement(
    title = "Ultimate Master", description = "Complete the ultimate master arcade ladder", points = 25,
    id = 47407, badge = "48004", published = "25/04/2017 13:54:33", modified = "06/12/2020 01:54:00",
    trigger = byte(0x00F22E) == 2 && byte(0x0002E5) == 3 && byte(0x0002F1) == 10 && never(byte(0x0002EA) == 2) && 
              repeated(10, byte(0x0002F1) == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1) && 
              byte(0x000128) == 27
)

achievement(
    title = "Supreme Being", description = "Complete the ultimate master arcade ladder with the difficulty set to 'Hardest'", points = 25,
    id = 47408, badge = "48049", published = "25/04/2017 13:56:39", modified = "06/12/2020 01:53:58",
    trigger = byte(0x00F22E) == 2 && byte(0x0002E5) == 3 && byte(0x0002F1) == 10 && never(byte(0x0002EA) == 2) && 
              repeated(10, byte(0x0002F1) == 1) && byte(0x00001D) == 4 && never(byte(0x000222) != 5) && 
              never(bit7(0x00018C) == 1) && byte(0x000128) == 27
)

achievement(
    title = "More Than Human", description = "Complete any arcade ladder with Sektor, Cyrax or Smoke", points = 10,
    id = 47409, badge = "48011", published = "25/04/2017 13:58:01", modified = "06/12/2020 01:53:56",
    trigger = unless(byte(0x000126) <= 6) && unless(byte(0x000126) == 9) && unless(byte(0x000126) == 10) && 
              unless(byte(0x000126) == 11) && unless(byte(0x000126) == 12) && unless(byte(0x000126) == 13) && 
              unless(byte(0x000126) >= 15) && byte(0x00F22E) == 2 && byte(0x000128) == 27 &&
              ((byte(0x0002E5) == 0 && byte(0x0002F1) == 7 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 1 && byte(0x0002F1) == 8 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 2 && byte(0x0002F1) == 9 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 3 && byte(0x0002F1) == 10 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)))
)

achievement(
    title = "A Song of Fire and Ice", description = "Complete any arcade ladder with Scorpion or Sub-Zero", points = 10,
    id = 47410, badge = "48016", published = "25/04/2017 13:58:05", modified = "06/12/2020 01:53:55",
    trigger = unless(byte(0x000126) <= 3) && unless(byte(0x000126) == 5) && unless(byte(0x000126) == 6) && 
              unless(byte(0x000126) == 7) && unless(byte(0x000126) == 8) && unless(byte(0x000126) == 9) && 
              unless(byte(0x000126) == 10) && unless(byte(0x000126) == 11) && unless(byte(0x000126) == 12) && 
              unless(byte(0x000126) == 13) && unless(byte(0x000126) == 14) && unless(byte(0x000126) == 15) && 
              unless(byte(0x000126) == 16) && unless(byte(0x000126) == 17) && unless(byte(0x000126) == 19) && 
              unless(byte(0x000126) == 20) && unless(byte(0x000126) >= 22) && byte(0x00F22E) == 2 && byte(0x000128) ==
               27 &&
              ((byte(0x0002E5) == 0 && byte(0x0002F1) == 7 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 1 && byte(0x0002F1) == 8 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 2 && byte(0x0002F1) == 9 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 3 && byte(0x0002F1) == 10 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)))
)

achievement(
    title = "Lethal Beauty", description = "Complete any arcade ladder with Mileena, Kitana, Jade or Sindel", points = 10,
    id = 47411, badge = "48018", published = "25/04/2017 13:58:15", modified = "06/12/2020 01:53:53",
    trigger = unless(byte(0x000126) <= 5) && unless(byte(0x000126) == 7) && unless(byte(0x000126) == 8) && 
              unless(byte(0x000126) == 9) && unless(byte(0x000126) == 10) && unless(byte(0x000126) == 11) && 
              unless(byte(0x000126) == 12) && unless(byte(0x000126) == 13) && unless(byte(0x000126) == 14) && 
              unless(byte(0x000126) >= 18) && byte(0x00F22E) == 2 && byte(0x000128) == 27 &&
              ((byte(0x0002E5) == 0 && byte(0x0002F1) == 7 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 1 && byte(0x0002F1) == 8 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 2 && byte(0x0002F1) == 9 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 3 && byte(0x0002F1) == 10 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)))
)

achievement(
    title = "The White Lotus", description = "Complete any arcade ladder with Liu Kang or Kung Lao", points = 10,
    id = 47412, badge = "48020", published = "25/04/2017 13:58:19", modified = "02/08/2018 22:08:08",
    trigger = unless(byte(0x000126) <= 8) && unless(byte(0x000126) == 10) && unless(byte(0x000126) == 11) && 
              unless(byte(0x000126) == 12) && unless(byte(0x000126) >= 14) && byte(0x00F22E) == 2 && byte(0x000128) ==
               27 &&
              ((byte(0x0002E5) == 0 && byte(0x0002F1) == 7 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 1 && byte(0x0002F1) == 8 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 2 && byte(0x0002F1) == 9 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 3 && byte(0x0002F1) == 10 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)))
)

achievement(
    title = "The Black Dragon", description = "Complete any arcade ladder with Kano or Kabal", points = 10,
    id = 47413, badge = "48022", published = "25/04/2017 13:58:23", modified = "06/12/2020 01:53:48",
    trigger = unless(byte(0x000126) == 1) && unless(byte(0x000126) == 2) && unless(byte(0x000126) == 3) && 
              unless(byte(0x000126) == 4) && unless(byte(0x000126) == 5) && unless(byte(0x000126) == 6) && 
              unless(byte(0x000126) == 7) && unless(byte(0x000126) == 8) && unless(byte(0x000126) == 9) && 
              unless(byte(0x000126) >= 11) && byte(0x00F22E) == 2 && byte(0x000128) == 27 &&
              ((byte(0x0002E5) == 0 && byte(0x0002F1) == 7 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 1 && byte(0x0002F1) == 8 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 2 && byte(0x0002F1) == 9 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 3 && byte(0x0002F1) == 10 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)))
)

achievement(
    title = "Special Forces", description = "Complete any arcade ladder with Jax, Stryker or Sonya", points = 10,
    id = 47414, badge = "48023", published = "25/04/2017 13:58:27", modified = "06/12/2020 01:53:47",
    trigger = unless(byte(0x000126) == 0) && unless(byte(0x000126) == 3) && unless(byte(0x000126) == 4) && 
              unless(byte(0x000126) >= 6) && byte(0x00F22E) == 2 && byte(0x000128) == 27 &&
              ((byte(0x0002E5) == 0 && byte(0x0002F1) == 7 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 1 && byte(0x0002F1) == 8 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 2 && byte(0x0002F1) == 9 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 3 && byte(0x0002F1) == 10 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)))
)

achievement(
    title = "Acid Rain", description = "Complete any arcade ladder with Reptile or Rain", points = 10,
    id = 47415, badge = "48025", published = "25/04/2017 13:58:31", modified = "06/12/2020 01:53:31",
    trigger = unless(byte(0x000126) <= 18) && unless(byte(0x000126) == 20) && unless(byte(0x000126) == 21) && 
              unless(byte(0x000126) == 22) && unless(byte(0x000126) == 23) && unless(byte(0x000126) >= 25) && 
              byte(0x00F22E) == 2 && byte(0x000128) == 27 &&
              ((byte(0x0002E5) == 0 && byte(0x0002F1) == 7 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 1 && byte(0x0002F1) == 8 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 2 && byte(0x0002F1) == 9 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 3 && byte(0x0002F1) == 10 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)))
)

achievement(
    title = "...And The Rest", description = "Complete any arcade ladder with Nightwolf, Noob Saibot or Shang Tsung", points = 10,
    id = 47416, badge = "48026", published = "25/04/2017 13:58:36", modified = "06/12/2020 01:53:44",
    trigger = unless(byte(0x000126) <= 2) && unless(byte(0x000126) == 4) && unless(byte(0x000126) == 5) && 
              unless(byte(0x000126) == 6) && unless(byte(0x000126) == 7) && unless(byte(0x000126) == 8) && 
              unless(byte(0x000126) == 9) && unless(byte(0x000126) == 10) && unless(byte(0x000126) == 11) && 
              unless(byte(0x000126) == 13) && unless(byte(0x000126) == 14) && unless(byte(0x000126) == 15) && 
              unless(byte(0x000126) == 16) && unless(byte(0x000126) == 17) && unless(byte(0x000126) == 18) && 
              unless(byte(0x000126) == 19) && unless(byte(0x000126) == 20) && unless(byte(0x000126) == 21) && 
              unless(byte(0x000126) == 22) && unless(byte(0x000126) >= 24) && byte(0x00F22E) == 2 && byte(0x000128) ==
               27 &&
              ((byte(0x0002E5) == 0 && byte(0x0002F1) == 7 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 1 && byte(0x0002F1) == 8 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 2 && byte(0x0002F1) == 9 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)) ||
               (byte(0x0002E5) == 3 && byte(0x0002F1) == 10 && never(byte(0x0002EA) == 2) && repeated(10, byte(0x0002F1)
                 == 1) && never(byte(0x000222) != 5) && never(bit7(0x00018C) == 1)))
)

achievement(
    title = "We Are Many - You Are But One", description = "Complete any arcade ladder with Ermac", points = 10,
    id = 47430, badge = "48012", published = "25/04/2017 14:00:24", modified = "06/12/2020 01:53:33",
    trigger = byte(0x000126) == 20 && never(byte(0x0002EA) == 2) && byte(0x000128) == 27 && never(byte(0x000222) != 5) && 
              never(bit7(0x00018C) == 1) &&
              ((byte(0x0002E5) == 0 && byte(0x00F22E) == 2 && byte(0x0002F1) == 7 && repeated(10, byte(0x0002F1) == 1)) ||
               (byte(0x0002E5) == 1 && byte(0x00F22E) == 2 && byte(0x0002F1) == 8 && repeated(10, byte(0x0002F1) == 1)) ||
               (byte(0x0002E5) == 2 && byte(0x00F22E) == 2 && byte(0x0002F1) == 9 && repeated(10, byte(0x0002F1) == 1)) ||
               (byte(0x00F22E) == 2 && byte(0x0002E5) == 3 && byte(0x0002F1) == 10 && repeated(10, byte(0x0002F1) == 1)))
)

achievement(
    title = "Do The Impossible", description = "Defeat Shao Kahn without taking damage [in the final round only]", points = 25,
    id = 47423, badge = "48037", published = "25/04/2017 13:59:05", modified = "06/12/2020 01:53:38",
    trigger = byte(0x00F22E) == 2 && byte(0x009F7A) == 118 && never(byte(0x0002EA) == 2) && byte(0x000128) == 27 &&
              ((byte(0x0002E5) == 0 && byte(0x00F22E) == 2 && byte(0x0002F1) == 7 && repeated(10, byte(0x0002F1) == 1)) ||
               (byte(0x0002E5) == 1 && byte(0x00F22E) == 2 && byte(0x0002F1) == 8 && repeated(10, byte(0x0002F1) == 1)) ||
               (byte(0x0002E5) == 2 && byte(0x00F22E) == 2 && byte(0x0002F1) == 9 && repeated(10, byte(0x0002F1) == 1)) ||
               (byte(0x00F22E) == 2 && byte(0x0002E5) == 3 && byte(0x0002F1) == 10 && repeated(10, byte(0x0002F1) == 1)))
)
