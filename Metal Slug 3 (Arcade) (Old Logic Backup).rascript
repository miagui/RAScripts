// Metal Slug 3
// #ID = 11771

// $02B2: Ammo (display)
// $02BA: P1 Lives
// $02C0: P1 Vehicle
//        00=outside the game
//        01=no vehicle
//        04=tank
//        06=flyer
//        07=copter
//        08=mariner
//        09=drill
//        0a=robot
//        0b=astro
// $02C1: P1 Bombs
// $040A: (16bit) Counters related to the end of the stage
// $040C: Section on stage
// $040D: Mission
//        
//        07=Demo
// $044C: Event flag
// $04B6: Big part of event program
// $04B8: (16-bit) Event Program
// $058E: P1 form
//        00=normal
//        01=normal
//        02=fat
//        03=mummy
//        04=breathing aparatus
//        05=ba heavy gun
//        06=snowman
//        07=zombie
//        08=flying
//        0a=in space
// $A093: Enemies on screen
// $A094: Vehicle flag
// $EAF2: P1 weapon
// $EB3B: bit0=mounting or in vehicle
// $EBF4: P1 pickup counter
// $EC0E: P1 Total of saved POWs
//        
//        Not to be confused with "Rescue"  or "Recaptured", which means, you finished the mission with them.
//        This value doesn't account for both Aikawa.
// $ED04: P1 saved hostages.
//        
//        This address counts both Aikawas.
// $ED19: P1 Score XX000000
// $ED1B: P1 Score 0000XX00
// $FD83: MVS Flag (bit7 = MVS mode)
// $FD89: Soft Dip Setup - lives
//        01=1(min)
//        03=3(default)
//        63=99(max)
// $FD8A: Soft Dip Setup - difficullty (shared with AES)
//        00=1 (easiest)
//        02=3 (normal)
//        03=4 (default)
//        07=8 (hardest)
//        
//        02=2(aes default)
// $FD8D: Soft Dip Setup - play time
//        00=60(default)
//        03=90(max)
// $FDB6: P2 Status
//        00=inactive
//        01=active
//        02=continue
//        03=game over
// $FDB7: P1 Status
//        00=inactive
//        01=active
//        02=continue
//        03=game over

achievement(
    title = "Blue Water Fangs -The Island of Dr.Moreau-", description = "Clear Mission 1 without taking any detours (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 4,
    id = 64755, badge = "69839", published = "18/08/2018 19:15:53", modified = "14/05/2021 17:07:17",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) != 0) && never(byte(0x00FD8D) != 0) && byte(0x00040A)
               == 29 && byte(0x00FDB7) == 1
)

achievement(
    title = "Marine Diver", description = "Clear Mission 1 going through Ocean Depths (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64756, badge = "69840", published = "18/08/2018 19:15:55", modified = "14/05/2021 17:07:18",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) != 2) && never(byte(0x00FD8D) != 0) && byte(0x00040A)
               == 29 && byte(0x00FDB7) == 1
)

achievement(
    title = "The Unknown World", description = "Clear Mission 1 going through Core Facility (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64757, badge = "69841", published = "18/08/2018 19:15:57", modified = "14/05/2021 17:07:19",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) != 4) && never(byte(0x00FD8D) != 0) && byte(0x00040A)
               == 29 && byte(0x00FDB7) == 1
)

achievement(
    title = "The Midnight Wandering", description = "Clear Mission 2 without taking any detours (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64758, badge = "69842", published = "18/08/2018 19:15:59", modified = "14/05/2021 17:07:20",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) != 256) && never(byte(0x00FD8D) != 0) && byte(0x00040A)
               == 29 && byte(0x00FDB7) == 1
)

achievement(
    title = "Devil's Snow Cave ", description = "Clear Mission 2 going through Cave of Ice (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64759, badge = "69843", published = "18/08/2018 19:16:03", modified = "14/05/2021 17:07:21",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) != 260) && never(byte(0x00FD8D) != 0) && byte(0x00040A)
               == 29 && byte(0x00FDB7) == 1
)

achievement(
    title = "The Shallow Sea", description = "Clear Mission 3 without taking detours (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64760, badge = "69844", published = "18/08/2018 19:16:05", modified = "14/05/2021 17:07:22",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00040D) != 2) && never(byte(0x00FD8D) != 0) && 
              once(word(0x0004B8) == 43194) && byte(0x00040A) == 29 && word(0x00040C) == 515 && byte(0x00FDB7) == 1
)

achievement(
    title = "Hard Water", description = "Clear Mission 3 going through Underground Channel (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64761, badge = "69845", published = "18/08/2018 19:16:08", modified = "14/05/2021 17:07:23",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00040D) != 2) && never(byte(0x00FD8D) != 0) && 
              once(word(0x00040C) == 517) && byte(0x00040A) == 29 && word(0x00040C) == 515 && byte(0x00FDB7) == 1
)

achievement(
    title = "Assault Theme", description = "Clear Mission 3 going through the Bridge (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64762, badge = "69846", published = "18/08/2018 19:16:11", modified = "14/05/2021 17:07:31",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00040D) != 2) && never(byte(0x00FD8D) != 0) && 
              once(word(0x00040C) == 518) && byte(0x00040A) == 29 && word(0x00040C) == 515 && byte(0x00FDB7) == 1
)

achievement(
    title = "Desert", description = "Clear Mission 4 going through the upper route (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64763, badge = "69847", published = "18/08/2018 19:16:13", modified = "14/05/2021 17:07:32",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00040D) != 3) && never(byte(0x00FD8D) != 0) && 
              once(word(0x0004B8) == 62384) && byte(0x00040A) == 29 && word(0x00040C) == 770 && byte(0x00FDB7) == 1
)

achievement(
    title = "The Japanese Army", description = "Clear Mission 4 going through Ex-military Hideout (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64764, badge = "69848", published = "18/08/2018 19:16:16", modified = "14/05/2021 17:07:35",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00040D) != 3) && never(byte(0x00FD8D) != 0) && 
              once(word(0x00040C) == 774) && byte(0x00040A) == 29 && word(0x00040C) == 784 && byte(0x00FDB7) == 1
)

achievement(
    title = "The Cenotaph", description = "Clear Mission 4 going through Ancient Ruins (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64765, badge = "69849", published = "18/08/2018 19:16:20", modified = "14/05/2021 17:07:35",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00040D) != 3) && never(byte(0x00FD8D) != 0) && 
              once(word(0x00040C) == 775) && byte(0x00040A) == 29 && word(0x00040C) == 784 && byte(0x00FDB7) == 1
)

achievement(
    title = "Pyramid", description = "Clear Mission 4 going through Pyramid (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64766, badge = "69850", published = "18/08/2018 19:16:22", modified = "14/05/2021 17:07:36",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00040D) != 3) && never(byte(0x00FD8D) != 0) && 
              once(word(0x00040C) == 783) && byte(0x00040A) == 29 && word(0x00040C) == 784 && byte(0x00FDB7) == 1
)

achievement(
    title = "First Contact", description = "Finish the game (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64767, badge = "69851", published = "18/08/2018 19:16:27", modified = "14/05/2021 17:07:40",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) < 1037) && never(byte(0x00FD8D) != 0) && byte(0x00040D)
               == 5 && never(word(0x00040A) != 65535) && byte(0x00FDB7) == 1
)

achievement(
    title = "Super Vehicle I", description = "Clear Mission 1 without taking detours and riding a vehicle (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 4,
    id = 64768, badge = "69778", published = "18/08/2018 19:16:43", modified = "14/05/2021 17:07:37",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) != 0) && never(byte(0x00FD8D) != 0) && byte(0x00040A)
               == 29 && byte(0x00A094) == 1 && byte(0x00FDB7) == 1
)

achievement(
    title = "Super Vehicle II", description = "Clear Mission 1 going through Ocean Depths and riding a vehicle (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64769, badge = "69779", published = "18/08/2018 19:16:47", modified = "14/05/2021 17:07:41",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) != 2) && never(byte(0x00FD8D) != 0) && byte(0x00040A)
               == 29 && byte(0x00A094) == 1 && byte(0x00FDB7) == 1
)

achievement(
    title = "Super Vehicle III", description = "Reach Ocean Depth's end in Mission 1 riding Slug Mariner (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64776, badge = "69780", published = "18/08/2018 19:17:05", modified = "14/05/2021 17:07:42",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) != 1) && never(byte(0x00FD8D) != 0) && word(0x0004B8)
               == 25172 && byte(0x0002C0) == 8 && byte(0x00FDB7) == 1
)

achievement(
    title = "Super Vehicle IV", description = "Clear Mission 1 going through Core Facility and riding a vehicle (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64770, badge = "69781", published = "18/08/2018 19:16:50", modified = "14/05/2021 17:07:43",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) != 4) && never(byte(0x00FD8D) != 0) && byte(0x00040A)
               == 29 && byte(0x00A094) == 1 && byte(0x00FDB7) == 1
)

achievement(
    title = "Super Vehicle V", description = "Clear Mission 3 without taking detours and riding a vehicle (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64771, badge = "69782", published = "18/08/2018 19:16:52", modified = "14/05/2021 17:07:44",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00040D) != 2) && never(byte(0x00FD8D) != 0) && 
              once(word(0x0004B8) == 43194) && byte(0x00040A) == 29 && word(0x00040C) == 515 && byte(0x00A094) == 1 && 
              byte(0x00FDB7) == 1
)

achievement(
    title = "Super Vehicle VI", description = "Reach Underground Channel's end in Mission 3 riding Slug Mariner (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64777, badge = "69783", published = "18/08/2018 19:17:08", modified = "14/05/2021 17:07:46",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) != 517) && never(byte(0x00FD8D) != 0) && word(0x0004B8)
               == 48302 && byte(0x0002C0) == 8
)

achievement(
    title = "Super Vehicle VII", description = "Clear Mission 3 going through Underground Channel and riding a vehicle (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64772, badge = "69784", published = "18/08/2018 19:16:54", modified = "14/05/2021 17:07:51",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00040D) != 2) && never(byte(0x00FD8D) != 0) && 
              once(word(0x00040C) == 517) && byte(0x00040A) == 29 && word(0x00040C) == 515 && byte(0x00A094) == 1 && 
              byte(0x00FDB7) == 1
)

achievement(
    title = "Super Vehicle VIII", description = "Reach Ancient Ruins end in Mission 4 riding a Drill Slug (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64778, badge = "69785", published = "18/08/2018 19:17:11", modified = "14/05/2021 17:07:52",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) != 775) && never(byte(0x00FD8D) != 0) && word(0x0004B8)
               == 10182 && byte(0x0002C0) == 9
)

achievement(
    title = "Super Vehicle IX", description = "Reach sky part's end in Final Mission riding a Slug Flyer (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64773, badge = "69786", published = "18/08/2018 19:16:56", modified = "14/05/2021 17:07:54",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00040D) != 4) && never(byte(0x00FD8D) != 0) && word(0x0004B8)
               == 22466 && byte(0x0002C0) == 6
)

achievement(
    title = "Super Vehicle X", description = "Reach sky part's end in Final Mission riding a Slug Copter (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64774, badge = "69788", published = "18/08/2018 19:16:58", modified = "14/05/2021 17:07:55",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00040D) != 4) && never(byte(0x00FD8D) != 0) && word(0x0004B8)
               == 22466 && byte(0x0002C0) == 7
)

achievement(
    title = "Super Vehicle XI", description = "Reach the 2nd space flight stage's end in Final Mission riding a Astro Slug (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64779, badge = "69787", published = "18/08/2018 19:17:13", modified = "14/05/2021 16:01:56",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) != 1029) && never(byte(0x00FD8D) != 0) && 
              word(0x0004B8) == 36604 && byte(0x0002C0) == 11
)

achievement(
    title = "Super Vehicle XII", description = "Defeat the last boss in a vehicle (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64775, badge = "69789", published = "18/08/2018 19:17:01", modified = "14/05/2021 17:07:56",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00040D) != 4) && never(byte(0x00FD8D) != 0) && word(0x00040C)
               == 1038 && byte(0x00A094) == 1 && byte(0x00A093) == 1 && byte(0x00044C) == 0 && byte(0x0004B6) == 0 && 
              byte(0x0004B8) == 0 && prev(byte(0x00044C)) == 1 && byte(0x00FDB7) == 1
)

achievement(
    title = "The Great Rescue I", description = "Find 22 POWs in Mission 1 without taking detours (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64796, badge = "69806", published = "18/08/2018 19:18:04", modified = "14/05/2021 17:07:57",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && never(word(0x00040C) != 0) && byte(0x00ED04)
               == 22 && byte(0x00FDB7) == 1
)

achievement(
    title = "The Great Rescue II", description = "Find 18 POWs in Mission 1 going thorugh Ocean Depths (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64797, badge = "69807", published = "18/08/2018 19:18:06", modified = "14/05/2021 17:07:58",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && never(byte(0x00040D) != 0) && 
              once(word(0x0004B8) == 25172) && byte(0x00ED04) == 18 && byte(0x00FDB7) == 1
)

achievement(
    title = "The Great Rescue III", description = "Find 16 POWs in Mission 1 going thorugh Core Facility (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64798, badge = "69808", published = "18/08/2018 19:18:08", modified = "14/05/2021 17:08:00",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && never(byte(0x00040D) != 0) && 
              once(word(0x0004B8) == 26994) && byte(0x00ED04) == 16 && byte(0x00FDB7) == 1
)

achievement(
    title = "The Great Rescue IV", description = "Find 12 POWs in Mission 2 without taking the detours (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64799, badge = "69809", published = "18/08/2018 19:18:09", modified = "14/05/2021 17:08:01",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && never(word(0x00040C) != 256) && 
              prev(byte(0x00ED04)) == 11 && byte(0x00ED04) == 12 && byte(0x00FDB7) == 1
)

achievement(
    title = "The Great Rescue V", description = "Find 23 POWs in Mission 2 going through Cave of Ice (diffic. >=Normal or >=Lv.3, others opt. <=default", points = 10,
    id = 64800, badge = "69810", published = "18/08/2018 19:18:12", modified = "14/05/2021 17:08:02",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && never(byte(0x00040D) != 1) && 
              once(word(0x0004B8) == 40622) && byte(0x00ED04) == 23 && byte(0x00FDB7) == 1
)

achievement(
    title = "The Great Rescue VI", description = "Find 13 POWs in Mission 3 without taking any detours (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64801, badge = "69811", published = "18/08/2018 19:18:14", modified = "14/05/2021 17:08:04",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && never(byte(0x00040D) != 2) && 
              once(word(0x0004B8) == 43194) && byte(0x00ED04) == 13 && byte(0x00FDB7) == 1
)

achievement(
    title = "The Great Rescue VII", description = "Find 11 POWs in Mission 3 going thorugh Underground Channel (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64802, badge = "69813", published = "18/08/2018 19:18:15", modified = "14/05/2021 17:08:06",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && never(byte(0x00040D) != 2) && 
              once(word(0x0004B8) == 48302) && byte(0x00ED04) == 11 && byte(0x00FDB7) == 1
)

achievement(
    title = "The Great Rescue VIII", description = "Find all 13 POWs in Bridge detour part of Mission 3 (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64803, badge = "69814", published = "18/08/2018 19:18:17", modified = "14/05/2021 17:08:07",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && never(byte(0x00040D) != 2) && 
              once(word(0x0004B8) == 51596) && byte(0x00ED04) == 13 && byte(0x00FDB7) == 1
)

achievement(
    title = "The Great Rescue X", description = "Find all 18 POWs in Ex-military Hideout detour part of Miission 4 (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64805, badge = "69816", published = "18/08/2018 19:18:20", modified = "14/05/2021 17:08:08",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && never(byte(0x00040D) != 3) && 
              once(word(0x0004B8) == 3510) && byte(0x00ED04) == 18 && byte(0x00FDB7) == 1
)

achievement(
    title = "The Great Rescue XI", description = "Find all 22 POWs in Anicent Ruins detour part of Mission 4  (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64806, badge = "69818", published = "18/08/2018 19:18:22", modified = "14/05/2021 17:08:09",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && never(byte(0x00040D) != 3) && 
              once(word(0x0004B8) == 10234) && byte(0x00ED04) == 22 && byte(0x00FDB7) == 1
)

achievement(
    title = "The Great Rescue XII", description = "Find all 24 POWs in Pyramid detour part of Mission 4 (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64807, badge = "69819", published = "18/08/2018 19:18:24", modified = "14/05/2021 17:08:11",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && never(byte(0x00040D) != 3) && 
              once(word(0x0004B8) == 17852) && byte(0x00ED04) == 24 && byte(0x00FDB7) == 1
)

achievement(
    title = "The Great Rescue XIII", description = "Find all 16 POWs in Final Mission (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64808, badge = "69820", published = "18/08/2018 19:18:26", modified = "14/05/2021 17:08:13",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && never(byte(0x00040D) != 4) && 
              prev(byte(0x00ED04)) == 15 && byte(0x00ED04) == 16 && byte(0x00FDB7) == 1
)

achievement(
    title = "MS3 Quartermaster I", description = "Find 60 bonus items in Mission 1 without taking detours (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64809, badge = "69821", published = "18/08/2018 19:18:27", modified = "14/05/2021 17:08:13",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) != 0) && never(byte(0x00FD8D) != 0) && byte(0x00EBF4)
               >= 60 && byte(0x00FDB7) == 1
)

achievement(
    title = "MS3 Quartermaster II", description = "Find 35 bonus items in Ocean Depths detour part of Mission 1 (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64810, badge = "69822", published = "18/08/2018 19:18:29", modified = "14/05/2021 17:08:14",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) != 1) && never(byte(0x00FD8D) != 0) && byte(0x00EBF4)
               >= 35 && word(0x0004B8) == 25172 && byte(0x00FDB7) == 1
)

achievement(
    title = "MS3 Quartermaster III", description = "Find 10 bonus items in Core Facility detour part of Mission 1 (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64811, badge = "69823", published = "18/08/2018 19:18:31", modified = "14/05/2021 17:08:15",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) != 3) && never(byte(0x00FD8D) != 0) && byte(0x00EBF4)
               >= 10 && word(0x0004B8) == 26994 && byte(0x00FDB7) == 1
)

achievement(
    title = "MS3 Quartermaster IV", description = "Find 35 bonus items in Mission 2 without taking detours (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64812, badge = "69824", published = "18/08/2018 19:18:33", modified = "14/05/2021 17:08:16",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) != 256) && never(byte(0x00FD8D) != 0) && byte(0x00EBF4)
               >= 35 && word(0x0004B8) == 33352 && byte(0x00FDB7) == 1
)

achievement(
    title = "MS3 Quartermaster V", description = "Find 50 bonus items in Cave of Ice detour part of Mission 2 (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64813, badge = "69825", published = "18/08/2018 19:18:34", modified = "14/05/2021 17:08:17",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) != 259) && never(byte(0x00FD8D) != 0) && byte(0x00EBF4)
               >= 50 && word(0x0004B8) == 40622 && byte(0x00FDB7) == 1
)

achievement(
    title = "MS3 Quartermaster VI", description = "Find 20 bonus items in Mission 3 without taking detours (LV Armor can't be empty, diffic.>=Normal or >=Lv.3, oth opt.<=default)", points = 10,
    id = 64814, badge = "69826", published = "18/08/2018 19:18:36", modified = "14/05/2021 17:08:19",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) < 512) && never(byte(0x00FD8D) != 0) && 
              never(word(0x00040C) > 515) && repeated(20, prev(byte(0x00EBF4)) < byte(0x00EBF4)) && 
              unless(word(0x0002B2) == 0) && byte(0x00FDB7) == 1
)

achievement(
    title = "MS3 Quartermaster VII", description = "Find 7 bonus items in Underground Channel part of Mission 3 (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64815, badge = "69827", published = "18/08/2018 19:18:38", modified = "14/05/2021 17:08:20",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) < 516) && never(byte(0x00FD8D) != 0) && 
              never(word(0x00040C) > 517) && byte(0x00EBF4) >= 7 && word(0x0004B8) == 48302 && byte(0x00FDB7) == 1
)

achievement(
    title = "MS3 Quartermaster VIII", description = "Find 10 bonus items in Bridge detour part of Mission 3 (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64816, badge = "69828", published = "18/08/2018 19:18:39", modified = "14/05/2021 17:08:21",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) != 518) && never(byte(0x00FD8D) != 0) && byte(0x00EBF4)
               >= 10 && word(0x0004B8) == 51596 && unless(word(0x0002B2) == 0) && byte(0x00FDB7) == 1
)

achievement(
    title = "MS3 Quartermaster IX", description = "Find 35 bonus items in Mission 4 going through the top route (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64817, badge = "69829", published = "18/08/2018 19:18:42", modified = "14/05/2021 17:08:22",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) < 768) && never(byte(0x00FD8D) != 0) && 
              never(word(0x00040C) > 770) && repeated(35, prev(byte(0x00EBF4)) < byte(0x00EBF4)) && byte(0x00FDB7) == 1
)

achievement(
    title = "MS3 Quartermaster X", description = "Find 20 bonus items in Ex-military Hideout detour part of Miission 4 (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64818, badge = "69830", published = "18/08/2018 19:18:45", modified = "14/05/2021 17:08:23",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) < 771) && never(byte(0x00FD8D) != 0) && 
              never(word(0x00040C) > 774) && repeated(20, prev(byte(0x00EBF4)) < byte(0x00EBF4)) && word(0x0004B8) ==
               3510 && byte(0x00FDB7) == 1
)

achievement(
    title = "MS3 Quartermaster XI", description = "Find 25 bonus items in Anicent Ruins detour part of Mission 4 (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64819, badge = "69831", published = "18/08/2018 19:18:47", modified = "14/05/2021 17:08:24",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) != 775) && never(byte(0x00FD8D) != 0) && byte(0x00EBF4)
               >= 25 && word(0x0004B8) == 10234 && byte(0x00FDB7) == 1
)

achievement(
    title = "MS3 Quartermaster XII", description = "Find 27 bonus items in Pyramid detour part of Mission 4 (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64820, badge = "69832", published = "18/08/2018 19:18:49", modified = "14/05/2021 17:08:26",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) < 778) && never(byte(0x00FD8D) != 0) && 
              never(word(0x00040C) > 785) && word(0x0004B8) == 4196 && byte(0x00FDB7) == 1 && once(word(0x00040C) == 780
               && byte(0x00EBF4) >= 9) && once(word(0x00040C) == 782 && byte(0x00EBF4) >= 2) && once(word(0x00040C) ==
               783 && byte(0x00EBF4) >= 7) && (word(0x00040C) == 778 && byte(0x00EBF4) >= 9)
)

achievement(
    title = "MS3 Quartermaster XIII", description = "Find 200 bonus items in Final Mission (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64821, badge = "69833", published = "18/08/2018 19:18:50", modified = "14/05/2021 17:08:27",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(word(0x00040C) < 1024) && never(byte(0x00FD8D) != 0) && 
              never(word(0x00040C) > 1038) && repeated(200, prev(byte(0x00EBF4)) < byte(0x00EBF4)) && byte(0x00FDB7) ==
               1
)

achievement(
    title = "MS3 Infantry", description = "During one session, score 500 times equipped with H while on foot (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 2,
    id = 66419, badge = "69898", published = "05/10/2018 00:22:07", modified = "14/05/2021 17:08:28",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && repeated(500, prev(byte(0x00ED1B)) <
               byte(0x00ED1B)) && unless(byte(0x00EB3B) == 1) && unless(byte(0x00EAF2) < 5) && unless(byte(0x00EAF2) ==
               6) && unless(byte(0x00EAF2) == 7) && unless(byte(0x00EAF2) == 8) && unless(byte(0x00EAF2) == 9) && 
              unless(byte(0x00EAF2) >= 10) && unless(byte(0x00058E) > 7) && unless(byte(0x00FDB7) != 1)
)

achievement(
    title = "MS3 Modern Infantry", description = "During one session, score 500 times equipped with l while on foot (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 66420, badge = "69897", published = "05/10/2018 00:22:11", modified = "14/05/2021 17:08:29",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && repeated(500, prev(byte(0x00ED1B)) <
               byte(0x00ED1B)) && unless(byte(0x00EAF2) < 6) && unless(byte(0x00EAF2) > 11) && unless(byte(0x00EAF2) ==
               7) && unless(byte(0x00EAF2) == 8) && unless(byte(0x00EAF2) == 9) && unless(byte(0x00EAF2) == 10) && 
              unless(byte(0x00EB3B) == 1) && unless(byte(0x00058E) > 7) && unless(byte(0x00FDB7) != 1)
)

achievement(
    title = "MS3 Response Force", description = "During one session, score 250 times equipped with S or F while on foot (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 4,
    id = 66418, badge = "69899", published = "05/10/2018 00:22:00", modified = "14/05/2021 17:08:31",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && repeated(250, prev(byte(0x00ED1B)) <
               byte(0x00ED1B)) && unless(byte(0x00EAF2) < 2) && unless(byte(0x00EAF2) == 5) && unless(byte(0x00EB3B) ==
               1) && unless(byte(0x00EAF2) == 6) && unless(byte(0x00EAF2) > 7) && unless(byte(0x00FDB7) != 1)
)

achievement(
    title = "MS3 Rocket Artillery", description = "During one session, score 250 times equipped with R or C while on foot (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 4,
    id = 66421, badge = "69896", published = "05/10/2018 00:22:16", modified = "14/05/2021 17:08:32",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && repeated(250, prev(byte(0x00ED1B)) <
               byte(0x00ED1B)) && unless(byte(0x00EAF2) < 8) && unless(byte(0x00EAF2) == 9) && unless(byte(0x00EAF2) ==
               10) && unless(byte(0x00EAF2) == 11) && unless(byte(0x00EAF2) > 12) && unless(byte(0x00EB3B) == 1) && 
              unless(byte(0x00058E) > 7) && unless(byte(0x00FDB7) != 1)
)

achievement(
    title = "MS3 Anti-Tank Artillery", description = "During one session, score 250 times equipped with G, D or I while on foot (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 3,
    id = 66422, badge = "69895", published = "05/10/2018 00:22:20", modified = "14/05/2021 17:08:34",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && repeated(250, prev(byte(0x00ED1B)) <
               byte(0x00ED1B)) && unless(byte(0x00EAF2) < 12) && unless(byte(0x00EAF2) > 15) && unless(byte(0x00EB3B) ==
               1) && unless(byte(0x00058E) > 7) && unless(byte(0x00FDB7) != 1)
)

achievement(
    title = "MS3 Mystic Ops", description = "During one session, score 30 times equipped with Cloud while on foot (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 2,
    id = 66423, badge = "69894", published = "05/10/2018 00:22:26", modified = "14/05/2021 17:08:35",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && repeated(30, prev(byte(0x00ED1B)) <
               byte(0x00ED1B)) && unless(byte(0x00EAF2) != 17) && unless(byte(0x00FDB7) != 1)
)

achievement(
    title = "MS3 Special Ops", description = "During one session, score 150 times equipped with Satellite while on foot (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 66424, badge = "69893", published = "05/10/2018 00:22:31", modified = "14/05/2021 17:08:37",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && repeated(150, prev(byte(0x00ED1B)) <
               byte(0x00ED1B)) && unless(byte(0x00EAF2) != 16) && unless(byte(0x00FDB7) != 1)
)

achievement(
    title = "MS3 Commando", description = "During one session, score 500 times without using weapons, slugs or dying (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 4,
    id = 66417, badge = "69900", published = "05/10/2018 00:21:50", modified = "14/05/2021 17:08:38",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && repeated(500, prev(byte(0x00ED1B)) <
               byte(0x00ED1B)) && never(byte(0x00EAF2) != 0) && never(prev(byte(0x0002BA)) > byte(0x0002BA)) && 
              unless(byte(0x00058E) > 7) && unless(byte(0x0002C0) > 1) && unless(byte(0x0002BA) == 1) && 
              never(byte(0x00FDB7) != 1)
)

achievement(
    title = "Metal Squab", description = "Clear Mission 1 while being fat (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 3,
    id = 66425, badge = "69890", published = "05/10/2018 00:22:36", modified = "14/05/2021 17:43:04",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && never(byte(0x00040D) != 0) && byte(0x00040A)
               == 29 && byte(0x00058E) == 2 && byte(0x00FDB7) == 1
)

achievement(
    title = "Metal Haunt", description = "Clear Mission 2 while being a zombie (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 66426, badge = "69892", published = "05/10/2018 00:22:42", modified = "14/05/2021 17:08:41",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && never(byte(0x00040D) != 1) && byte(0x00040A)
               == 29 && byte(0x00058E) == 7 && byte(0x00FDB7) == 1
)

achievement(
    title = "Carry Out I", description = "Play through Mission 1 without using a credit (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64780, badge = "69790", published = "18/08/2018 19:17:20", modified = "14/05/2021 17:08:43",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && never(word(0x00040D) != 0) && 
              once(word(0x0004B8) == 11654) && byte(0x00040A) == 29 && never(byte(0x00FDB7) != 1)
)

achievement(
    title = "Carry Out II", description = "Play through Mission 2 without using a credit (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64781, badge = "69791", published = "18/08/2018 19:17:22", modified = "14/05/2021 17:08:44",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && never(byte(0x00040D) != 1) && 
              once(word(0x0004B8) == 27136) && byte(0x00040A) == 29 && never(byte(0x00FDB7) != 1)
)

achievement(
    title = "Carry Out III", description = "Play through Mission 3 without using a credit (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64782, badge = "69792", published = "18/08/2018 19:17:25", modified = "14/05/2021 17:08:45",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && never(byte(0x00040D) != 2) && 
              once(word(0x0004B8) == 40626) && byte(0x00040A) == 29 && never(byte(0x00FDB7) != 1)
)

achievement(
    title = "Carry Out IV", description = "Play through Mission 4 without using a credit (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64783, badge = "69793", published = "18/08/2018 19:17:27", modified = "14/05/2021 17:08:46",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && never(byte(0x00040D) != 3) && 
              once(word(0x0004B8) == 51730) && byte(0x00040A) == 29 && never(byte(0x00FDB7) != 1)
)

achievement(
    title = "Carry Out V", description = "Play through Final Mission without using a credit (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 10,
    id = 64784, badge = "69794", published = "18/08/2018 19:17:29", modified = "14/05/2021 17:08:47",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && never(byte(0x00040D) < 4) && 
              once(word(0x0004B8) == 18170) && byte(0x00040D) == 5 && never(byte(0x00FDB7) != 1)
)

achievement(
    title = "Munition Slug", description = "Gather 999 of ammo (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 66376, badge = "69852", published = "03/10/2018 04:26:24", modified = "14/05/2021 17:08:49",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && word(0x0002B2) == 999 && byte(0x00FDB7) == 1
)

achievement(
    title = "Mulligan Slug", description = "Gather 50 bombs (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 5,
    id = 64824, badge = "69836", published = "18/08/2018 19:18:59", modified = "14/05/2021 17:08:50",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && byte(0x0002C1) >= 50 && byte(0x00FDB7) == 1 && 
              byte(0x0002C1) != 255
)

achievement(
    title = "Metal Jug", description = "Score 5 milion points (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 50,
    id = 64822, badge = "69834", published = "18/08/2018 19:18:54", modified = "14/05/2021 17:08:51",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && byte(0x00ED19) == 5 && byte(0x00FDB7) == 1
)

achievement(
    title = "Combatant Foundation", description = "Rescue total of 95 POWs in one game (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 50,
    id = 64823, badge = "69835", published = "18/08/2018 19:18:57", modified = "14/05/2021 17:08:52",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && never(byte(0x00EC0E) == 0) && byte(0x00FDB7)
               == 1 && measured(repeated(95, byte(0x00ED04) > prev(byte(0x00ED04))))
)

achievement(
    title = "Metal Slugger", description = "Finish the game on Hard or Level-6 difficulty (others opt. <=default)", points = 25,
    id = 64825, badge = "69837", published = "18/08/2018 19:19:06", modified = "14/05/2021 17:08:53",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 5) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && byte(0x00040D) == 5 && byte(0x00FDB7) == 1
)

achievement(
    title = "Metal Slug 3 1CC", description = "Play through the game using only one credit (diffic. >=Normal or >=Lv.3, others opt. <=default)", points = 50,
    id = 64826, badge = "69838", published = "18/08/2018 19:19:21", modified = "14/05/2021 17:08:54",
    trigger = never(dword(0x00FE30) != 0) && never(byte(0x00FD89) > 3) && never(byte(0x00FD8A) < 2) && 
              never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && once(word(0x0004B8) == 11654) && 
              once(byte(0x00040D) == 0) && once(byte(0x00040D) == 1) && once(byte(0x00040D) == 2) && once(byte(0x00040D)
               == 3) && once(byte(0x00040D) == 4) && once(byte(0x00040D) == 5) && never(byte(0x00FDB7) != 1)
)

achievement(
    title = "The Great Rescue IX", description = "Find all 21 POWs in Mission 4 going through the top route (P1, dif>=Normal, oth opt<=default)", points = 4,
    id = 64804, badge = "69817", published = "18/08/2018 19:18:19", modified = "07/10/2018 14:17:33",
    trigger = never(dword(0x00FE30) != 0) && never(bit7(0x00FD83) == 1) && never(byte(0x00FD89) > 3) && 
              never(byte(0x00FD8A) < 2) && never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && 
              never(byte(0x00040D) != 3) && once(word(0x0004B8) == 62384) && byte(0x00ED04) == 21 && byte(0x00FDB7) == 1
)

achievement(
    title = "Metal Rag", description = "Clear Mission 4 while being a mummy (P1, dif>=Normal, oth opt<=default)", points = 5,
    id = 66427, badge = "69891", published = "05/10/2018 00:22:47", modified = "07/10/2018 14:18:43",
    trigger = never(dword(0x00FE30) != 0) && never(bit7(0x00FD83) == 1) && never(byte(0x00FD89) > 3) && 
              never(byte(0x00FD8A) < 2) && never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && 
              never(byte(0x00040D) != 3) && byte(0x00040A) == 29 && byte(0x00058E) == 3 && byte(0x00FDB7) == 1
)

achievement(
    title = "Metal Chug I (Huge Hermit)", description = "Defeat Huge Hermit without losing a life not teking detours (P1, dif>=Normal, oth opt<=default)", points = 4,
    id = 64785, badge = "69795", published = "18/08/2018 19:17:33", modified = "08/11/2018 04:32:59",
    trigger = never(dword(0x00FE30) != 0) && never(bit7(0x00FD83) == 1) && never(byte(0x00FD89) > 3) && 
              never(byte(0x00FD8A) < 2) && never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && 
              never(byte(0x00040D) != 0) && never(byte(0x00FDB7) != 1) && byte(0x00040A) == 29 && byte(0x00FDB7) == 1 &&
              ((once(word(0x0004B8) == 18036) && never(prev(byte(0x0002BA)) > byte(0x0002BA))) ||
               (once(word(0x0004B8) == 18582) && never(prev(byte(0x0002BA)) > byte(0x0002BA))))
)

achievement(
    title = "Metal Chug II (Monoeyes)", description = "Defeat Monoeyes without losing a life (P1, dif>=Normal, oth opt<=default)", points = 5,
    id = 64786, badge = "69796", published = "18/08/2018 19:17:35", modified = "21/08/2020 12:59:38",
    trigger = never(dword(0x00FE30) != 0) && never(bit7(0x00FD83) == 1) && never(byte(0x00FD89) > 3) && 
              never(byte(0x00FD8A) < 2) && never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && 
              never(byte(0x00040D) != 1) && once(word(0x0004B8) == 33346) && word(0x0004B8) == 33582 && 
              never(byte(0x00FDB7) != 1) && never(prev(byte(0x0002BA)) > byte(0x0002BA)) && byte(0x00FDB7) == 1
)

achievement(
    title = "Metal Chug III (Monoeye UFO)", description = "Defeat Monoeye UFO without losing a life (P1, dif>=Normal, oth opt<=default)", points = 5,
    id = 64787, badge = "69797", published = "18/08/2018 19:17:37", modified = "21/08/2020 12:59:37",
    trigger = never(dword(0x00FE30) != 0) && never(bit7(0x00FD83) == 1) && never(byte(0x00FD89) > 3) && 
              never(byte(0x00FD8A) < 2) && never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && 
              never(byte(0x00040D) != 1) && once(word(0x0004B8) == 33402) && byte(0x00040A) == 29 && 
              never(byte(0x00FDB7) != 1) && never(prev(byte(0x0002BA)) > byte(0x0002BA)) && byte(0x00FDB7) == 1
)

achievement(
    title = "Metal Chug IV (Jupiter King)", description = "Defeat Jupiter King without losing a life (P1, dif>=Normal, oth opt<=default)", points = 5,
    id = 64788, badge = "69798", published = "18/08/2018 19:17:40", modified = "21/08/2020 12:59:36",
    trigger = never(dword(0x00FE30) != 0) && never(bit7(0x00FD83) == 1) && never(byte(0x00FD89) > 3) && 
              never(byte(0x00FD8A) < 2) && never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && 
              never(byte(0x00040D) != 2) && once(word(0x0004B8) == 46526) && byte(0x00040A) == 29 && 
              never(byte(0x00FDB7) != 1) && never(prev(byte(0x0002BA)) > byte(0x0002BA)) && byte(0x00FDB7) == 1
)

achievement(
    title = "Metal Chug V (Sol Dae Rokkerr)", description = "Defeat Sol Dae Rokkerr without losing a life (P1, dif>=Normal, oth opt<=default)", points = 5,
    id = 64789, badge = "69799", published = "18/08/2018 19:17:42", modified = "21/08/2020 12:59:34",
    trigger = never(dword(0x00FE30) != 0) && never(bit7(0x00FD83) == 1) && never(byte(0x00FD89) > 3) && 
              never(byte(0x00FD8A) < 2) && never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && 
              never(byte(0x00040D) != 3) && byte(0x00040A) == 29 && never(byte(0x00FDB7) != 1) && byte(0x00FDB7) == 1 &&
              ((once(word(0x0004B8) == 62384) && never(prev(byte(0x0002BA)) > byte(0x0002BA))) ||
               (once(word(0x0004B8) == 62408) && never(prev(byte(0x0002BA)) > byte(0x0002BA))))
)

achievement(
    title = "Metal Chug VI (Hairbuster Riberts)", description = "Defeat Hairbuster Riberts without losing a life (P1, dif>=Normal, oth opt<=default)", points = 5,
    id = 64790, badge = "69800", published = "18/08/2018 19:17:44", modified = "21/08/2020 12:59:33",
    trigger = never(dword(0x00FE30) != 0) && never(bit7(0x00FD83) == 1) && never(byte(0x00FD89) > 3) && 
              never(byte(0x00FD8A) < 2) && never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && 
              never(byte(0x00040D) != 4) && once(word(0x0004B8) == 22162) && word(0x0004B8) == 22430 && 
              never(byte(0x00FDB7) != 1) && never(prev(byte(0x0002BA)) > byte(0x0002BA)) && byte(0x00FDB7) == 1
)

achievement(
    title = "Metal Chug VII (Hi-Do)", description = "Defeat Hi-Do without losing a life  (P1, dif>=Normal, oth opt<=default)", points = 5,
    id = 64791, badge = "69801", published = "18/08/2018 19:17:53", modified = "21/08/2020 12:59:32",
    trigger = never(dword(0x00FE30) != 0) && never(bit7(0x00FD83) == 1) && never(byte(0x00FD89) > 3) && 
              never(byte(0x00FD8A) < 2) && never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && 
              never(byte(0x00040D) != 4) && once(word(0x0004B8) == 23088) && word(0x0004B8) == 23154 && 
              never(byte(0x00FDB7) != 1) && never(prev(byte(0x0002BA)) > byte(0x0002BA)) && byte(0x00FDB7) == 1
)

achievement(
    title = "Metal Chug VIII (Rugname)", description = "Defeat Rugname without losing a life (P1, dif>=Normal, oth opt<=default)", points = 5,
    id = 64792, badge = "69802", published = "18/08/2018 19:17:55", modified = "21/08/2020 12:59:31",
    trigger = never(dword(0x00FE30) != 0) && never(bit7(0x00FD83) == 1) && never(byte(0x00FD89) > 3) && 
              never(byte(0x00FD8A) < 2) && never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && 
              never(byte(0x00040D) != 4) && once(word(0x0004B8) == 23308) && word(0x0004B8) == 29424 && 
              never(byte(0x00FDB7) != 1) && never(prev(byte(0x0002BA)) > byte(0x0002BA)) && byte(0x00FDB7) == 1
)

achievement(
    title = "Metal Chug IX (Fake Rootmars)", description = "Defeat Fake Rootmars without losing a life (P1, dif>=Normal, oth opt<=default)", points = 5,
    id = 64793, badge = "69803", published = "18/08/2018 19:17:57", modified = "21/08/2020 12:59:29",
    trigger = never(dword(0x00FE30) != 0) && never(bit7(0x00FD83) == 1) && never(byte(0x00FD89) > 3) && 
              never(byte(0x00FD8A) < 2) && never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && 
              never(byte(0x00040D) != 4) && once(word(0x0004B8) == 44154) && word(0x0004B8) == 44572 && 
              never(byte(0x00FDB7) != 1) && never(prev(byte(0x0002BA)) > byte(0x0002BA)) && byte(0x00FDB7) == 1
)

achievement(
    title = "Metal Chug X (Cloning Machine)", description = "Defeat Cloning Machine without losing a life (P1, dif>=Normal, oth opt<=default)", points = 5,
    id = 64794, badge = "69804", published = "18/08/2018 19:17:59", modified = "21/08/2020 12:59:27",
    trigger = never(dword(0x00FE30) != 0) && never(bit7(0x00FD83) == 1) && never(byte(0x00FD89) > 3) && 
              never(byte(0x00FD8A) < 2) && never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && 
              never(byte(0x00040D) != 4) && once(word(0x0004B8) == 48052) && word(0x0004B8) == 48530 && 
              never(byte(0x00FDB7) != 1) && never(prev(byte(0x0002BA)) > byte(0x0002BA)) && byte(0x00FDB7) == 1
)

achievement(
    title = "Metal Chug XI (Rootmars)", description = "Defeat Rootmars without losing a life (P1, dif>=Normal, oth opt<=default)", points = 5,
    id = 64795, badge = "69805", published = "18/08/2018 19:18:01", modified = "21/08/2020 12:59:26",
    trigger = never(dword(0x00FE30) != 0) && never(bit7(0x00FD83) == 1) && never(byte(0x00FD89) > 3) && 
              never(byte(0x00FD8A) < 2) && never(byte(0x00FDB6) == 1) && never(byte(0x00FD8D) != 0) && 
              never(word(0x00040C) < 1037) && once(word(0x00040C) == 1037) && byte(0x00040D) == 5 && 
              never(byte(0x00FDB7) != 1) && never(prev(byte(0x0002BA)) > byte(0x0002BA)) && byte(0x00FDB7) == 1
)
