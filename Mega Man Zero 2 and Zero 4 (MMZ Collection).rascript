// Mega Man Zero Collection
// #ID = 8376

function game_sel() => byte(0x04d083)
         sel_scenario = 0x00
         sel_mmz = 0x01
         sel_mmz2 = 0x02
         sel_mmz3 = 0x03
         sel_mmz4 = 0x04

function current_game() => byte(0x40525)
         game_mmz = 0x01
         game_mmz2 = 0x02
         game_mmz3 = 0x03
         game_mmz4 = 0x04

function screen_artwork() => byte(0x03d400)

function playing_mmz2() {
    return  game_sel() == sel_mmz2 &&
            never(current_game() != game_mmz2)
}

function playing_mmz4() {
    return  game_sel() == sel_mmz4 &&
            never(current_game() != game_mmz4)
}

// Difficulty (every game)
norm_mode = 0x00
hard_mode = 0x01
ulti_mode = 0x02
easy_mode = 0x03

//=============================================================================================
//==================================== Mega Man Zero 2 ========================================
//=============================================================================================

function mmz2_game_context() => word(0x13f190)
         mmz2_ctx_booting = 0x0000
         mmz2_ctx_title_screen = 0x204
         mmz2_ctx_playing = 0x0105

function mmz2_state() => word(0x13f410)
         mmz2_state_playing = 0x0400
         mmz2_state_gameover = 0x0800

function mmz2_screen_overlay() => word(0x13f412)
         mmz2_no_overlay = 0x0000

function mmz2_result_screen_counting() {
    return  byte(0x140c2c) == 0x02 &&
            prev(byte(0x140c2c)) == 0x01 &&
            mmz2_state() == mmz2_state_playing
}

function mmz2_diff() => byte(0x147219)
function mmz2_igt() => dword(0x1472a8)

// Player
function mmz2_hp() => byte(0x14c2d4)
function mmz2_lives() => byte(0x14729c)

function mmz2_zero_sprite() => byte(0x14c3af)
         mmz2_atk_tenshouzan = 0x31
         mmz2_atk_kougenjin = 0x33
         mmz2_atk_sengatotsu = 0x39
         mmz2_atk_sharp_edge = 0x3e

function mmz2_attack_state() => byte(0x14c3a8)
         mmz2_ex_skill_rising_and_dash = 0x02
         mmz2_ex_skill_downwards_saber = 0x03
         mmz2_ex_skill_saber_projectile = 0x04

// Mission/Stage
function mmz2_mission() => byte(0x13d6b8)
function mmz2_boss_hp() => byte(tbyte(0x13d740) + 0xb4)
function mmz2_level_progress() => byte(0x13d88c)
function mmz2_eighty_six_flag() => byte(0x13d6b9) >= 0x56 && byte(0x13d6b9) < 0x80
function mmz2_rank_a() => byte(0x14729d) == 5 || byte(0x14729d) == 6

function mmz2_stage_finished_flags() => byte(0x1472b0)
function mmz2_text_pointer() => tbyte(0x13e83c)

mmz2_missions = {
   "Sand Wilderness": 1,
   "Forest Of Dysis": 2,
   "Computer Zone": 3,
   "Bombardment Aircraft": 4,
   "Power Room": 5,
   "Train of N.A": 6,
   "Forest of Notus": 7,
   "Computer Zone 2": 8,
   "Crystal Cave": 9,
   "Shuttle Factory": 10,
   "Neo Arcadia Entrance": 11,
   "Residential Area": 12,
   "Temple of Flame": 13,
   "Temple of Ice": 14,
   "Temple of Wind": 15,
   "Yggdrasil": 16,
   "New Resistance Base": 17
}

// Logic Functions
function mmz2_cleared(mission) {
    return mmz2_mission() == mmz2_missions[mission] &&
           mmz2_result_screen_counting()
}

function mmz2_eighty_six(mission) {
    return mmz2_mission() == mmz2_missions[mission] &&
           mmz2_eighty_six_flag() &&
           mmz2_result_screen_counting()
}

function mmz2_damageless_boss(mission, lvl_prog1, lvl_prog2) {
    return (once(mmz2_mission() == mmz2_missions[mission] &&
           prev(mmz2_level_progress()) == lvl_prog1 &&
           mmz2_level_progress() == lvl_prog2)) &&
           trigger_when(tbyte(0x13d740) != 0 &&
                        mmz2_boss_hp() == 0 &&
                        prev(mmz2_boss_hp()) > 0) &&
           never(mmz2_level_progress() == lvl_prog2 && 
                 mmz2_igt() > prev(mmz2_igt()) &&
                 mmz2_hp() < prev(mmz2_hp())) &&
           never(mmz2_mission() != mmz2_missions[mission])
}

// Works regardless of stage.
function mmz2_damageless_boss_artwork(screen_art) {
    return (once(mmz2_state() == mmz2_state_playing &&
           prev(screen_artwork()) != screen_art &&
           screen_artwork() == screen_art)) &&
           trigger_when(tbyte(0x13d740) != 0 &&
                        mmz2_boss_hp() == 0 &&
                        prev(mmz2_boss_hp()) > 0) &&
           never(screen_artwork() == screen_art && 
                 mmz2_igt() > prev(mmz2_igt()) &&
                 mmz2_hp() < prev(mmz2_hp())) &&
           never(mmz2_state() == mmz2_state_playing && screen_artwork() != screen_art)
}

// Used exclusively on Herculious and Kuwagust fights during Boss Rush. Triggers when artwork is swapped out.
function mmz2_damageless_boss_artwork_2(screen_art) {
    return (once(mmz2_state() == mmz2_state_playing &&
           prev(screen_artwork()) != screen_art &&
           screen_artwork() == screen_art)) &&
           trigger_when(mmz2_state() == mmz2_state_playing && 
                        screen_artwork() != screen_art &&
                        prev(screen_artwork()) == screen_art) &&
           never(screen_artwork() == screen_art && 
                 mmz2_igt() > prev(mmz2_igt()) &&
                 mmz2_hp() < prev(mmz2_hp())) &&
           never(tally(60, mmz2_state() == mmz2_state_playing && screen_artwork() != screen_art))
}

function mmz2_buster1_is_ex_skill() {
    return  tbyte(0x14c4bc) != 0x00 &&
            byte(tbyte(0x14c4bc) + 0x09) >= 0x0c && byte(tbyte(0x14c4bc) + 0x09) <= 0x0f
} 

function mmz2_buster2_is_ex_skill() {
    return  tbyte(0x14c4c0) != 0x00 &&
            byte(tbyte(0x14c4c0) + 0x09) >= 0x0c && byte(tbyte(0x14c4c0) + 0x09) <= 0x0f
} 

function mmz2_buster3_is_ex_skill() {
    return  tbyte(0x14c4c4) != 0x00 &&
            byte(tbyte(0x14c4c4) + 0x09) >= 0x0c && byte(tbyte(0x14c4c4) + 0x09) <= 0x0f
} 

function mmz2_buster4_is_ex_skill() {
    return  tbyte(0x14c4c8) != 0x00 &&
            byte(tbyte(0x14c4c8) + 0x09) >= 0x0c && byte(tbyte(0x14c4c8) + 0x09) <= 0x0f
} 

function mmz2_no_ex_skill() {
    return  never(mmz2_zero_sprite() == mmz2_atk_tenshouzan) &&
            never(mmz2_zero_sprite() == mmz2_atk_kougenjin) &&
            never(mmz2_zero_sprite() == mmz2_atk_sengatotsu) &&
            never(mmz2_zero_sprite() == mmz2_atk_sharp_edge) &&
            never(mmz2_buster1_is_ex_skill()) &&
            never(mmz2_buster2_is_ex_skill()) &&
            never(mmz2_buster3_is_ex_skill()) &&
            never(mmz2_buster4_is_ex_skill())
}

//=======================================
//============== PROGRESS ===============
//=======================================

function mmz2_achiev_clear_mission(mission, title, points) {
    achievement("[MMZ2] " + title, format("Clear {0} stage", mission), points, 
                trigger =   playing_mmz2() &&
                            mmz2_cleared(mission))
}

mmz2_achiev_clear_mission("Sand Wilderness", "Departure", 5)
mmz2_achiev_clear_mission("Forest Of Dysis", "Sand Triangle", 5)
mmz2_achiev_clear_mission("Computer Zone", "Ice Brain", 5)
mmz2_achiev_clear_mission("Bombardment Aircraft", "Power Bom", 5)
mmz2_achiev_clear_mission("Power Room", "Gravity", 5)
mmz2_achiev_clear_mission("Train of N.A", "Platinum", 5)
mmz2_achiev_clear_mission("Forest of Notus", "Combustion", 5)
mmz2_achiev_clear_mission("Computer Zone 2", "Cool Water", 5)
mmz2_achiev_clear_mission("Crystal Cave", "Flash Back", 5)
mmz2_achiev_clear_mission("Shuttle Factory", "Passionate", 5)
mmz2_achiev_clear_mission("Neo Arcadia Entrance", "Neo Arcadia II", 5)
mmz2_achiev_clear_mission("Residential Area", "Operation Righteous Strike", 5)
mmz2_achiev_clear_mission("Temple of Flame", "Melt Down", 5)
mmz2_achiev_clear_mission("Temple of Ice", "Cool Hearted Fellow", 5)
mmz2_achiev_clear_mission("Temple of Wind", "The Cloudy Stone", 5)
// mmz2_achiev_clear_mission("Yggdrasil", "In Mother's Light", 10)

//=======================================
//============== 86 POINTS ==============
//=======================================

function mmz2_achiev_eighty_six(mission) {
    achievement(format("[MMZ2] {0} Expert", mission), format("Clear {0} stage with 86 points or higher", mission), 10, 
                trigger =   playing_mmz2() &&
                            mmz2_eighty_six(mission))
}

mmz2_achiev_eighty_six("Sand Wilderness")
mmz2_achiev_eighty_six("Forest Of Dysis")
mmz2_achiev_eighty_six("Computer Zone")
mmz2_achiev_eighty_six("Bombardment Aircraft")
mmz2_achiev_eighty_six("Power Room")
mmz2_achiev_eighty_six("Train of N.A")
mmz2_achiev_eighty_six("Forest of Notus")
mmz2_achiev_eighty_six("Computer Zone 2")
mmz2_achiev_eighty_six("Crystal Cave")
mmz2_achiev_eighty_six("Shuttle Factory")
mmz2_achiev_eighty_six("Neo Arcadia Entrance")
mmz2_achiev_eighty_six("Residential Area")
mmz2_achiev_eighty_six("Temple of Flame")
mmz2_achiev_eighty_six("Temple of Ice")
mmz2_achiev_eighty_six("Temple of Wind")
mmz2_achiev_eighty_six("Yggdrasil")

//=======================================
//============= DAMAGELESS ==============
//=======================================

function mmz2_achiev_damageless_boss(title, boss, points, mission, lvlprog1, lvlprog2) {
    achievement(title, format("Defeat {0} without taking damage and without using EX Skills at Rank A or higher", boss), points, 
                trigger =   playing_mmz2() &&
                            never(mmz2_game_context() == mmz2_ctx_title_screen) &&
                            mmz2_damageless_boss(mission, lvlprog1, lvlprog2) &&
                            mmz2_rank_a() &&
                            mmz2_no_ex_skill())
}

// Works for doing Damageless fights during regular missions and boss rush too.
function mmz2_achiev_damageless_boss_artwork(title, boss, points, screen_art) {
    achievement(title, format("Defeat {0} without taking damage and without using EX Skills at Rank A or higher", boss), points, 
                trigger =   playing_mmz2() &&
                            never(mmz2_game_context() == mmz2_ctx_title_screen) &&
                            mmz2_damageless_boss_artwork(screen_art) &&
                            mmz2_rank_a() &&
                            mmz2_no_ex_skill())
}

achievement("[MMZ2] Mega Scorpia", "Defeat Mega Scorpia without taking damage", 5, 
            trigger =   playing_mmz2() &&
                        never(mmz2_game_context() == mmz2_ctx_title_screen) &&
                        mmz2_damageless_boss("Sand Wilderness", 10, 13))

mmz2_achiev_damageless_boss_artwork("[MMZ2] The Shinobi Serpent of the Hidden Forest", "Hyleg Ourobockle", 10, 7)
mmz2_achiev_damageless_boss_artwork("[MMZ2] The Alpha Bear of the Ice Blade", "Poler Kamrous", 10, 8)
mmz2_achiev_damageless_boss_artwork("[MMZ2] Fire God of Illusion", "Phoenix Magnion", 10, 10)
mmz2_achiev_damageless_boss_artwork("[MMZ2] Black Panther of Lightning", "Panter Flauclaws", 10, 9)

mmz2_achiev_damageless_boss("[MMZ2] Golem Type E", "Golem", 5, "Residential Area", 2, 3)
mmz2_achiev_damageless_boss("[MMZ2] Golem Type F", "Fire Golem", 5, "Residential Area", 5, 6)
mmz2_achiev_damageless_boss("[MMZ2] Golem Type I", "Ice Golem", 5, "Residential Area", 8, 9)
mmz2_achiev_damageless_boss("[MMZ2] The Wind God of Pincer Attacks", "Kuwagust Anchus", 10, "Bombardment Aircraft", 12, 13)

mmz2_achiev_damageless_boss_artwork("[MMZ2] Guardian in the Tree's Shadow", "Burble Hekelot", 10, 12)
mmz2_achiev_damageless_boss_artwork("[MMZ2] Ocean Goddess of the Blue Sea", "Fairy Leviathan", 10, 16)
mmz2_achiev_damageless_boss_artwork("[MMZ2] Bright Green Slash Attacks", "Sage Harpuia", 10, 14)
mmz2_achiev_damageless_boss_artwork("[MMZ2] Crimson Strong Arm", "Fighting Fefnir", 10, 15)
mmz2_achiev_damageless_boss_artwork("[MMZ2] Nightmare of the Sky Bridge", "Rainbow Devil MK.II", 10, 13)
mmz2_achiev_damageless_boss_artwork("[MMZ2] Fefnir Armed Phenomenon", "Fefnir Armed Phenomenon Transformation", 10, 18)
mmz2_achiev_damageless_boss_artwork("[MMZ2] Leviathan Armed Phenomenon", "Leviathan Armed Phenomenon Transformation", 10, 19)
mmz2_achiev_damageless_boss_artwork("[MMZ2] Harpuia Armed Phenomenon", "Harpuia Armed Phenomenon Transformation", 10, 17)

achievement("[MMZ2] The Lightning Beetle and The Wind God", "Defeat Herculious Anchus and Kuwagust Anchus without taking damage and without using EX Skills at Rank A or higher", 25, 
            trigger =   playing_mmz2() &&
                        never(mmz2_game_context() == mmz2_ctx_title_screen) &&
                        never(mmz2_mission() != mmz2_missions["Yggdrasil"]) &&
                        mmz2_damageless_boss_artwork_2(11) &&
                        mmz2_rank_a() &&
                        mmz2_no_ex_skill())

mmz2_achiev_damageless_boss_artwork("[MMZ2] Supreme Ruler", "Elpizo First Form", 10, 20)
mmz2_achiev_damageless_boss_artwork("[MMZ2] The Last - The Wish Punished", "Elpizo Final Form", 25, 21)

// Old Logic
// mmz2_achiev_damageless_boss("[MMZ2] Ocean Goddess of the Blue Sea", "Fairy Leviathan", 10, "Computer Zone 2", 2, 3)
// mmz2_achiev_damageless_boss("[MMZ2] Bright Green Slash Attacks", "Sage Harpuia", 10, "Crystal Cave", 4, 7)
// mmz2_achiev_damageless_boss("[MMZ2] Crimson Strong Arm", "Fighting Fefnir", 10, "Shuttle Factory", 2, 3)
// mmz2_achiev_damageless_boss("[MMZ2] Nightmare of the Sky Bridge", "Rainbow Devil MK.II", 10, "Neo Arcadia Entrance", 2, 3)
// mmz2_achiev_damageless_boss("[MMZ2] Fefnir Armed Phenomenon", "Fefnir Armed Phenomenon Transformation", 10, "Temple of Flame", 3, 5)
// mmz2_achiev_damageless_boss("[MMZ2] Leviathan Armed Phenomenon", "Leviathan Armed Phenomenon Transformation", 10, "Temple of Ice", 3, 5)
// mmz2_achiev_damageless_boss("[MMZ2] Harpuia Armed Phenomenon", "Harpuia Armed Phenomenon Transformation", 10, "Temple of Wind", 2, 4)
// mmz2_achiev_damageless_boss("[MMZ2] Supreme Ruler", "Elpizo First Form", 10, "Yggdrasil", 12, 14)
// mmz2_achiev_damageless_boss("[MMZ2] The Last - The Wish Punished", "Elpizo Final Form", 25, "Yggdrasil", 15, 16)


//=======================================
//============ UNLOCKABLES  =============
//=======================================

function mmz2_all_cyber_elves() => 	sum_of(range(1,31), b => bit(b,0x14c454))+
                                    sum_of(range(0,31), b => bit(b,0x14c458))+
                                    sum_of(range(0,15), b => bit(b,0x14c45c))+
                                    sum_of(range(0,1), b => bit(b,0x14c45e))

function mmz2_all_elements() => sum_of(range(1,3), b => bit(b, 0x14c43f))
function mmz2_all_sub_tanks() => byte(0x14c434) + byte(0x14c435)
function mmz2_all_ex_skills() => sum_of(range(0,9), b => bit(b, 0x14c444))
function mmz2_all_forms() => sum_of(range(0,9), b => bit(b, 0x14c430))

achievement("[MMZ2] Lack of Meaning [m]", "This isn't fun anymore...", 2,
            trigger =   playing_mmz2() && dword(mmz2_text_pointer() + 0x00) == 0x2c1e08f3 && mmz2_mission() == mmz2_missions["Sand Wilderness"])

achievement("[MMZ2] Gunman", "Reach the max level with Buster Shot", 5,
            trigger =    playing_mmz2() && measured(byte(0x14c450) == 2, playing_mmz2()) && prev(byte(0x14c450)) == 1)

achievement("[MMZ2] Slayer", "Reach the max level with Z-Saber", 5,
            trigger =    playing_mmz2() && measured(byte(0x14c451) == 4, playing_mmz2()) && prev(byte(0x14c451)) == 3)

achievement("[MMZ2] Chain", "Reach the max level with Chain Rod", 5,
            trigger =    playing_mmz2() && measured( byte(0x14c452) == 2, playing_mmz2()) && prev(byte(0x14c452)) == 1)

achievement("[MMZ2] Resister", "Reach the max level with Shield Bomerang", 5,
            trigger =    playing_mmz2() && measured(byte(0x14c453) == 2, playing_mmz2()) && prev(byte(0x14c453)) == 1)

achievement("[MMZ2] Elemental Cycle", "Obtain all elements", 3, 
            trigger =   playing_mmz2() && measured(mmz2_all_elements() == 3, playing_mmz2()) && prev(mmz2_all_elements()) == 2)
                        
achievement("[MMZ2] DownloadMoreHP.com", "Upgrade your life bar to the maximum possible", 10, 
            trigger =   playing_mmz2() &&
                        ((bit0(0x14c432) == 1 && prev(bit0(0x14c432)) == 0 && byte(0x14c42d) == 32) ||
                        (bit0(0x14c432) == 1 && byte(0x14c42d) == 32 && prev(byte(0x14c42d)) == 28)))

achievement("[MMZ2] Red Bull in 23XX", "Collect all Sub Tanks", 10, 
            trigger =   playing_mmz2() && measured(mmz2_all_sub_tanks() == 4, playing_mmz2()) && prev(mmz2_all_sub_tanks()) == 3, id = 201209)

achievement("[MMZ2] Armed to the Teeth", "Obtain all EX Skills", 25, 
            trigger =   playing_mmz2() && measured(mmz2_all_ex_skills() == 10, playing_mmz2()) && prev(mmz2_all_ex_skills()) == 9)

achievement("[MMZ2] What Will I Dress Up for Today?", "Obtain all forms", 25, 
            trigger =   playing_mmz2() && measured(mmz2_all_forms() == 10, playing_mmz2()) && prev(mmz2_all_forms()) == 9)

achievement("[MMZ2] Elf Hunt [m]", "Collect all Cyber-elves", 25, 
            trigger =   playing_mmz2() && measured(mmz2_all_cyber_elves() == 81, playing_mmz2()) && prev(mmz2_all_cyber_elves()) == 80)


//=================================================
//============ ENTIRE GAME CHALLENGES =============
//=================================================

achievement("[MMZ2] Godspeed", "Beat the game under 45 minutes IGT", 25, 
            trigger =   playing_mmz2() &&
                        mmz2_state() == mmz2_state_playing &&
                        mmz2_screen_overlay() == mmz2_no_overlay &&
                        mmz2_igt() <= 162000 &&
                        trigger_when(mmz2_cleared("Yggdrasil")))
                        

achievement("[MMZ2] Master", "Beat the game on Hard mode", 50, 
            trigger =   playing_mmz2() &&
                        mmz2_diff() == hard_mode &&
                        mmz2_cleared("Yggdrasil"))

achievement("[MMZ2] Strong Will", "Beat the game without dying (One Session/New Game+ Allowed)", 50, 
            trigger =   playing_mmz2() &&
                        mmz2_state() == mmz2_state_playing &&
                        once(mmz2_mission() == mmz2_missions["Sand Wilderness"] &&
                             mmz2_stage_finished_flags() == 0 &&
                             mmz2_level_progress() == 1 &&
                             prev(mmz2_level_progress()) == 0) &&
                        never(mmz2_lives() < prev(mmz2_lives())) &&
                        never(mmz2_state() == mmz2_state_gameover) &&
                        never(mmz2_game_context() == mmz2_ctx_title_screen) &&
                        trigger_when(mmz2_cleared("Yggdrasil")))

//=======================================
//============= LEADERBOARD =============
//=======================================

leaderboard("[MMZ2] Speedrun - Normal", "Fastest in game time - Normal", 
            playing_mmz2() && mmz2_game_context() == mmz2_ctx_playing && mmz2_screen_overlay() == mmz2_no_overlay && mmz2_state() == mmz2_state_playing && mmz2_diff() == norm_mode,
            (playing_mmz2() && mmz2_game_context() == mmz2_ctx_title_screen) || (game_sel() != sel_mmz2), 
            playing_mmz2() && mmz2_cleared("Yggdrasil"), 
            mmz2_igt(), 
            format="FRAMES", lower_is_better=true, id=20
            )

leaderboard("[MMZ2] Speedrun - Hard", "Fastest in game time - Hard", 
            playing_mmz2() && mmz2_game_context() == mmz2_ctx_playing && mmz2_screen_overlay() == mmz2_no_overlay && mmz2_state() == mmz2_state_playing && mmz2_diff() == hard_mode,
            (playing_mmz2() && mmz2_game_context() == mmz2_ctx_title_screen) || (game_sel() != sel_mmz2), 
            playing_mmz2() && mmz2_cleared("Yggdrasil"), 
            mmz2_igt(), 
            format="FRAMES", lower_is_better=true, id=21
            )



//=============================================================================================
//==================================== Mega Man Zero 4 ========================================
//=============================================================================================

function mmz4_game_context() => word(0x145050)
         mmz4_ctx_booting = 0x0000
         mmz4_ctx_title_screen_intro = 0x0104
         mmz4_ctx_title_screen = 0x0204
         mmz4_ctx_prologue = 0x0202
         mmz4_ctx_playing = 0x0105
         mmz4_ctx_selecting_minigame = 0x0106
         mmz4_ctx_playing_minigame = 0x0306
         mmz4_ctx_updated_score_minigame = 0x0406


// Using as 16 bits to make use of the complementary game state next to it.
function mmz4_state() => word(0x1452d4)
         mmz4_state_playing = 0x0400
         mmz4_state_gameover = 0x0900
         mmz4_state_saveload = 0x0205
         mmz4_state_database = 0x0206
         mmz4_mg_plant_panic = 0x0007
         mmz4_mg_busy_basket = 0x0107
         mmz4_mg_lumberjack = 0x0207
         mmz4_mg_lava_surf = 0x0307
         mmz4_mg_elf_chase = 0x0407
         mmz4_mg_slam_harvest = 0x0507
         mmz4_mg_energy_lab = 0x0607
         
function mmz4_minigame_score() => dword(0x146af0)
function mmz4_minigame_timer() => dword(0x146afc)
function mmz4_minigame_finished() => word(0x1452da) == 0x01

function mmz4_result_screen_counting() {
    return  byte(0x146ae8) == 0x02 &&
            prev(byte(0x146ae8)) == 0x01 &&
            mmz4_state() == mmz4_state_playing
} 

function mmz4_diff() => byte(0x1481d7)

function mmz4_igt() => dword(0x148184)

// Mini Game unlocked address (each flag for each byte)
mmz4_unlocked_ultimate_mode = 0x10ddb5
mmz4_unlocked_plant_panic = 0x10ddb6
mmz4_unlocked_busy_basket = 0x10ddb7
mmz4_unlocked_lumberjack = 0x10ddb8
mmz4_unlocked_lava_surf = 0x10ddb9
mmz4_unlocked_elf_chase = 0x10ddba
mmz4_unlocked_slam_harvest = 0x10ddbb
mmz4_unlocked_energy_lab = 0x10ddbc

// Player
function mmz4_hp() => byte(0x14cab8)
function mmz4_lives() => byte(0x14817c)
function mmz4_busterhits() => word(0x1434ec)
function mmz4_saberhits() => word(0x1434ee)

function mmz4_dashing() => byte(0x14cb11) == 0x02
function mmz4_attacking() => byte(0x14cb14) == 0x03
function mmz4_saber_attack() => byte(0x14cb58) == 0x01

function mmz4_ex_skills_shot() => byte(0x14cb5c) == 0x04

function mmz4_attack_state() => byte(0x14cb15)
         mmz4_atk_flame_fang = 0x05
         mmz4_atk_ice_blade = 0x06
         mmz4_atk_sky_chaser = 0x08

function mmz4_dash_attack_state() => byte(0x14cb16)
         mmz4_atk_thunder_stab = 0x03

// function mmz4_last_attack_state() => byte(0x14cb5d)
//          mmz4_atk_ice_blade = 0x0d
//          mmz4_atk_flame_fang = 0x11
//          mmz4_atk_thunder_stab = 0x13
//          mmz4_atk_sky_chaser = 0x16

// Elf
function mmz4_elf_name() => byte(0x14cb09)
         mmz4_elf_unnamed = 0xff
         mmz4_elf_charite = 0x00
         mmz4_elf_variable = 0x01
         mmz4_elf_progress = 0x02
         mmz4_elf_croire = 0x03
         mmz4_elf_nouvelle = 0x04
         mmz4_elf_recrue = 0x05
function mmz4_elf_level() => byte(0x14cb04)

// Mission/Stage
function mmz4_mission() => byte(0x143528)
function mmz4_boss_hp() => byte(0x14d16c)
function mmz4_weather_flag() => byte(0x141eb4)
function mmz4_level_progress() => byte(0x14352a)
function mmz4_eighty_six_flag() => byte(0x1434d5) >= 0x56 && byte(0x1434d5) < 0x80
function mmz4_rank_a() => byte(0x14817d) == 5 || byte(0x14817d) == 6
function mmz4_stage_finished_flags() => byte(0x14818c)

mmz4_missions = {
   "Caravan Chase": 1,
   "Area Zero": 2,
   "Particle Beam": 3,
   "Deep Sea": 4,
   "Hanging Gardens": 5,
   "Underground Forest": 6,
   "Artificial Sun": 7,
   "Hibernation Chamber": 8,
   "Magnetic Zone": 9,
   "Living City": 10,
   "Area Zero Invasion": 11,
   "The Prison": 12,
   "Ragnarok Control Center": 13,
   "Teleporter Base": 14,
   "Teleporter Circuit": 15,
   "Ragnarok Core": 16,
   "Resistance Base": 17,
}


// Logic Functions
function mmz4_cleared(mission_id) {
    return mmz4_mission() == mission_id &&
           mmz4_result_screen_counting()
}

function mmz4_eighty_six(mission_id) {
    return mmz4_mission() == mission_id &&
           mmz4_eighty_six_flag() &&
           mmz4_result_screen_counting()
}

// Old logic using results screen.
// function mmz4_damageless_boss(mission_id, lvl_prog1, lvl_prog2) {
//     return (once(playing_mmz4() &&
//            mmz4_mission() == mission_id &&
//            prev(mmz4_level_progress()) == lvl_prog1 &&
//            mmz4_level_progress() == lvl_prog2)) &&
//            trigger_when(mmz4_result_screen_counting()) &&
//            never(mmz4_level_progress() == lvl_prog2 && 
//                  mmz4_igt() > prev(mmz4_igt()) &&
//                  mmz4_hp() < prev(mmz4_hp())) &&
//            never(mmz4_mission() != mission_id)
// }

// New logic using boss hp.
function mmz4_damageless_boss(mission_id, lvl_prog1, lvl_prog2) {
    return (once(mmz4_mission() == mission_id &&
           prev(mmz4_level_progress()) == lvl_prog1 &&
           mmz4_level_progress() == lvl_prog2)) &&
           trigger_when(mmz4_boss_hp() == 0 &&
                        prev(mmz4_boss_hp()) > 0) &&
           never(mmz4_level_progress() == lvl_prog2 && 
                 mmz4_igt() > prev(mmz4_igt()) &&
                 mmz4_hp() < prev(mmz4_hp())) &&
           never(mmz4_mission() != mission_id)
}

// Works regardless of stage, checks if boss is on normal weather, or Boss Rush with Rank A
function mmz4_damageless_boss_artwork(screen_art) {
    return (once(mmz4_state() == mmz4_state_playing &&
            prev(screen_artwork()) != screen_art &&
           screen_artwork() == screen_art)) &&
           trigger_when(mmz4_boss_hp() == 0 &&
                        prev(mmz4_boss_hp()) > 0) &&
           never(screen_artwork() == screen_art && 
                 mmz4_igt() > prev(mmz4_igt()) &&
                 mmz4_hp() < prev(mmz4_hp())) &&
           never(mmz4_state() == mmz4_state_playing && screen_artwork() != screen_art)
}

function mmz4_clear_rank_a(mission) {
    return mmz4_mission() == mission &&
           mmz4_rank_a() &&
           mmz4_result_screen_counting()
}

function mmz4_no_ex_skill() {
    return  never(mmz4_ex_skills_shot()) &&
            never(mmz4_attacking() && mmz4_saber_attack() && mmz4_attack_state() == mmz4_atk_flame_fang) &&
            never(mmz4_attacking() && mmz4_saber_attack() && mmz4_attack_state() == mmz4_atk_ice_blade) &&
            never(mmz4_attacking() && mmz4_saber_attack() && mmz4_attack_state() == mmz4_atk_sky_chaser) &&
            never(mmz4_attacking() && mmz4_saber_attack() && mmz4_dashing() && mmz4_dash_attack_state() == mmz4_atk_thunder_stab)
}

//=======================================
//============== PROGRESS ===============
//=======================================

function mmz4_achiev_clear_mission(mission, title, points) {
    achievement("[MMZ4] " + title, format("Clear {0} stage", mission), points, 
                trigger =   playing_mmz4() &&
                            mmz4_cleared(mmz4_missions[mission]))
}

mmz4_achiev_clear_mission("Caravan Chase", "Hope for Freedom", 5)
mmz4_achiev_clear_mission("Area Zero", "Esperanto", 5)
mmz4_achiev_clear_mission("Particle Beam", "Max Heat", 5)
mmz4_achiev_clear_mission("Deep Sea", "Deep Blue", 5)
mmz4_achiev_clear_mission("Hanging Gardens", "Celestial Gardens", 5)
mmz4_achiev_clear_mission("Underground Forest", "Queen of the Hurt", 5)
mmz4_achiev_clear_mission("Artificial Sun", "Blaze Down", 5)
mmz4_achiev_clear_mission("Hibernation Chamber", "Sleeping Beast", 5)
mmz4_achiev_clear_mission("Magnetic Zone", "Magnetic Rumble", 5)
mmz4_achiev_clear_mission("Living City", "Blackheart Beat", 5)
mmz4_achiev_clear_mission("Area Zero Invasion", "Showdown", 5)
mmz4_achiev_clear_mission("The Prison", "Neige's Rescue", 5)
mmz4_achiev_clear_mission("Ragnarok Control Center", "Commander's Redemption", 5)
//mmz4_achiev_clear_mission("Teleporter Base", "Unprotected Transporter", 5)
//mmz4_achiev_clear_mission("Teleporter Circuit", "Ragnarok's Security System Shutdown", 5)
//mmz4_achiev_clear_mission("Ragnarok Core", "Now I Know What I'm Fighting For...", 10)

//=======================================
//============== 86 POINTS ==============
//=======================================

function mmz4_achiev_eighty_six(mission) {
    achievement(format("[MMZ4] {0} Expert", mission), format("Clear {0} stage with 86 points or higher", mission), 10, 
                trigger =   playing_mmz4() &&
                            mmz4_eighty_six(mmz4_missions[mission]))
}

mmz4_achiev_eighty_six("Caravan Chase")
mmz4_achiev_eighty_six("Area Zero")
mmz4_achiev_eighty_six("Particle Beam")
mmz4_achiev_eighty_six("Deep Sea")
mmz4_achiev_eighty_six("Hanging Gardens")
mmz4_achiev_eighty_six("Underground Forest")
mmz4_achiev_eighty_six("Artificial Sun")
mmz4_achiev_eighty_six("Hibernation Chamber")
mmz4_achiev_eighty_six("Magnetic Zone")
mmz4_achiev_eighty_six("Living City")
mmz4_achiev_eighty_six("Area Zero Invasion")
mmz4_achiev_eighty_six("The Prison")
mmz4_achiev_eighty_six("Ragnarok Control Center")
mmz4_achiev_eighty_six("Teleporter Base")
mmz4_achiev_eighty_six("Teleporter Circuit")
mmz4_achiev_eighty_six("Ragnarok Core")

//=======================================
//============= DAMAGELESS ==============
//=======================================

function mmz4_achiev_damageless_boss(title, boss, points, mission, lvlprog1, lvlprog2) {
    achievement(title, format("Defeat {0} without taking damage and without using EX Skills at Rank A or higher", boss), points, 
                trigger =   playing_mmz4() &&
                            mmz4_damageless_boss(mmz4_missions[mission], lvlprog1, lvlprog2) &&
                            never(mmz4_game_context() == mmz4_ctx_title_screen) &&
                            mmz4_rank_a() &&
                            mmz4_no_ex_skill())
}

achievement("[MMZ4] Sub Desert Core", "Defeat Sub Desert Core without taking damage (No Ultimate Mode)", 5, 
            trigger =   playing_mmz4() &&
                        never(mmz4_game_context() == mmz4_ctx_title_screen) &&
                        mmz4_damageless_boss(mmz4_missions["Caravan Chase"], 7, 6) &&
                        mmz4_diff() != ulti_mode)

mmz4_achiev_damageless_boss("[MMZ4] Carnage Force 0", "Carnage Force 0", 5, "Area Zero", 5, 4)
mmz4_achiev_damageless_boss("[MMZ4] Craft I", "Craft (First Encounter)", 10, "Area Zero Invasion", 4, 3)
mmz4_achiev_damageless_boss("[MMZ4] Hell the Giant", "Hell the Giant", 10, "The Prison", 4, 3)
mmz4_achiev_damageless_boss("[MMZ4] Craft II", "Craft (Second Encounter)", 10, "Ragnarok Control Center", 5, 4)
mmz4_achiev_damageless_boss("[MMZ4] Randam Bandam", "Randam Bandam", 10, "Teleporter Base", 4, 3)
mmz4_achiev_damageless_boss("[MMZ4] Cyball", "Cyball", 10, "Teleporter Circuit", 5, 4)
mmz4_achiev_damageless_boss("[MMZ4] Fate ", "Dr. Weil First Form", 25, "Ragnarok Core", 7, 6)
mmz4_achiev_damageless_boss("[MMZ4] Falling Down", "Dr. Weil Final Form", 25, "Ragnarok Core", 8, 6)

//============================================
//========== DAMAGELESS REGULAR BOSS =========
//============================================

function mmz4_achiev_damageless_boss_weather(title, boss, points, mission, artwork, weather, ach_id) {
     achievement(title, format("Defeat {0} without taking damage and without using EX Skills (Normal weather on his stage or Boss Rush with Rank A)", boss), points, 
                 trigger =   playing_mmz4() &&
                             never(mmz4_game_context() == mmz4_ctx_title_screen) &&
                             mmz4_damageless_boss_artwork(artwork) &&
                             never(mmz4_mission() != mmz4_missions[mission] && mmz4_mission() != mmz4_missions["Ragnarok Core"]) &&
                             (
                                (mmz4_mission() == mmz4_missions[mission] && mmz4_weather_flag() == weather) ||
                                (mmz4_mission() == mmz4_missions["Ragnarok Core"] && mmz4_rank_a())
                             ) &&
                             mmz4_no_ex_skill()) 
}

mmz4_achiev_damageless_boss_weather("[MMZ4] Genbu", "Heat Genblem", 10, "Particle Beam", 9, 0x10, 201257)
mmz4_achiev_damageless_boss_weather("[MMZ4] Kraken", "Tech Kraken", 10, "Deep Sea", 10, 0x12, 201258)
mmz4_achiev_damageless_boss_weather("[MMZ4] Pegasus", "Pegasolta Eclair", 10, "Hanging Gardens", 13, 0x13, 201259)
mmz4_achiev_damageless_boss_weather("[MMZ4] Mandrake", "Noble Mandrago", 10, "Underground Forest", 8, 0x10, 201260)
mmz4_achiev_damageless_boss_weather("[MMZ4] Fairy", "Sol Titanion", 10, "Artificial Sun", 15, 0x10, 201261)
mmz4_achiev_damageless_boss_weather("[MMZ4] Fenrir", "Fenri Lunaedge", 10, "Hibernation Chamber", 11, 0x12, 201262)
mmz4_achiev_damageless_boss_weather("[MMZ4] Minotaur", "Mino Magnus", 10, "Magnetic Zone", 14, 0x11, 201263)
mmz4_achiev_damageless_boss_weather("[MMZ4] Cockatrice", "Popla Cocapetri", 10, "Living City", 12, 0x10, 201264)

//=======================================
//============ UNLOCKABLES  =============
//=======================================

function all_database() => 	sum_of(range(4,31), b => bit(b,0x10dda4))+
                            sum_of(range(0,31), b => bit(b,0x10dda8))+
                            sum_of(range(0,31), b => bit(b,0x10ddac))+
                            sum_of(range(0,4), b => bit(b,0x10ddb0))

function all_heads() => sum_of(range(4,7), b => bit(b,0x14816c))+
                        sum_of(range(4,7), b => bit(b,0x14816d))+
                        sum_of(range(4,5), b => bit(b,0x14816e))

function all_body() =>  sum_of(range(6,7), b => bit(b,0x14816e))+
                        sum_of(range(4,7), b => bit(b,0x14816f))+
                        sum_of(range(4,7), b => bit(b,0x148170))

function all_foot() =>  sum_of(range(4,7), b => bit(b,0x148171))+
                        sum_of(range(4,6), b => bit(b,0x148172))

function all_recipes() => sum_of(range(0,3), b => bit(b,0x14816c))+
                        sum_of(range(0,3), b => bit(b,0x14816d))+
                        sum_of(range(0,3), b => bit(b,0x14816e))+
                        sum_of(range(0,3), b => bit(b,0x14816f))+
                        sum_of(range(0,3), b => bit(b,0x148170))+
                        sum_of(range(0,3), b => bit(b,0x148171))+
                        sum_of(range(0,3), b => bit(b,0x148172))

function mmz4_sub_tank_one() => byte(0x14cad0)
function mmz4_sub_tank_two() => byte(0x14cad1)
function mmz4_sub_tank_three() => byte(0x14cad2)
function mmz4_sub_tank_four() => byte(0x14cad3)
function mmz4_sub_total_one() => mmz4_sub_tank_one() == 00 && prev(mmz4_sub_tank_one()) == 0xff && prev(mmz4_sub_tank_two()) != 0xff && prev(mmz4_sub_tank_three()) != 0xff && prev(mmz4_sub_tank_four()) != 0xff
function mmz4_sub_total_two() => mmz4_sub_tank_two() == 00 && prev(mmz4_sub_tank_two()) == 0xff && prev(mmz4_sub_tank_one()) != 0xff && prev(mmz4_sub_tank_three()) != 0xff && prev(mmz4_sub_tank_four()) != 0xff
function mmz4_sub_total_three() => mmz4_sub_tank_three() == 00 && prev(mmz4_sub_tank_three()) == 0xff && prev(mmz4_sub_tank_two()) != 0xff && prev(mmz4_sub_tank_one()) != 0xff && prev(mmz4_sub_tank_four()) != 0xff
function mmz4_sub_total_four() => mmz4_sub_tank_four() == 00 && prev(mmz4_sub_tank_four()) == 0xff && prev(mmz4_sub_tank_two()) != 0xff && prev(mmz4_sub_tank_three()) != 0xff && prev(mmz4_sub_tank_one()) != 0xff

function mmz4_all_ex_skills() => bitcount(0x14cade)

achievement("[MMZ4] I'm Not a Believer [m]", "Name your elf to anything else that isn't Croire", 3,
trigger =   playing_mmz4() &&
            mmz4_game_context() == mmz4_ctx_playing &&
            prev(mmz4_elf_name()) == mmz4_elf_unnamed &&
            mmz4_elf_name() != prev(mmz4_elf_name()) &&
            mmz4_elf_name() != mmz4_elf_croire
)

achievement("[MMZ4] Is This Pokémon?", "Raise your elf to the max level", 10,
            trigger =   playing_mmz4() &&
                        mmz4_elf_level() == 0x07 &&
                        prev(mmz4_elf_level()) == 0x06)
          
// achievement("[MMZ4] Knowledge for the Life Time [VOID]", "Complete the Database", 25,
//             trigger =   playing_mmz4() && 
//                         measured(all_database() == 96) && prev(all_database()) == 95 &&
//                         mmz4_game_context() != mmz4_ctx_booting)

achievement("[MMZ4] Head Crafter", "Craft all head chips", 10,
            trigger = playing_mmz4() && measured(all_heads() == 10, playing_mmz4()) && prev(all_heads()) == 9)

achievement ("[MMZ4] Body Crafter", "Craft all body chips", 10, 
            trigger = playing_mmz4() && measured(all_body() == 10, playing_mmz4()) && prev(all_body()) == 9)

achievement("[MMZ4] Foot Crafter", "Craft all foot chips", 10,
            trigger = playing_mmz4() && measured(all_foot() == 7, playing_mmz4()) && prev(all_foot()) == 6)

achievement("[MMZ4] Minecraft [m]", "Craft all recipes", 10,
            trigger = playing_mmz4() && measured(all_recipes() == 28, playing_mmz4()) && prev(all_recipes()) == 27)

achievement("[MMZ4] Energy Drink", "Collect all Sub Tanks", 10,
            trigger = playing_mmz4() && 
                    (mmz4_sub_total_one() ||
                    mmz4_sub_total_two() ||
                    mmz4_sub_total_three() ||
                    mmz4_sub_total_four()), id = 201271)

// achievement("[MMZ4] I've Been Through So Many Weathers Now...", "Obtain all EX Skills", 25,
//             trigger = playing_mmz4() &&
//                     measured(mmz4_all_ex_skills() == 8, playing_mmz4()) && prev(mmz4_all_ex_skills()) == 7)
          
function mmz4_achiev_unlock_stuff(title, desc, points, minigame_mem, minigame_value) {
    achievement(title, desc, points,
                trigger =   playing_mmz4() &&
                            byte(minigame_mem) == minigame_value &&
                            prev(byte(minigame_mem)) == 0 &&
                            mmz4_game_context() != mmz4_ctx_booting
                )
}

mmz4_achiev_unlock_stuff("[MMZ4] Upgraded Collector [m]", "Unlock Ultimate Mode", 25, mmz4_unlocked_ultimate_mode, 0x38)
mmz4_achiev_unlock_stuff("[MMZ4] Minimalist Cyber Elf", "Unlock the Plant Panic mini game", 25, mmz4_unlocked_plant_panic, 0x3e)
mmz4_achiev_unlock_stuff("[MMZ4] Hard Mode", "Unlock the Busy Basket mini game", 25, mmz4_unlocked_busy_basket, 0x44)
mmz4_achiev_unlock_stuff("[MMZ4] Rank S Reploid", "Unlock the Lumberjack mini game", 50, mmz4_unlocked_lumberjack, 0x4a)
mmz4_achiev_unlock_stuff("[MMZ4] Knowledge for the Life Time [m]", "Unlock the Lava Surf mini game", 10, mmz4_unlocked_lava_surf, 0x50)
mmz4_achiev_unlock_stuff("[MMZ4] What Are Recipes? [m]", "Unlock the Elf Chase mini game", 25, mmz4_unlocked_elf_chase, 0x56)
mmz4_achiev_unlock_stuff("[MMZ4] Running to Save the Humanity", "Unlock the Slam Harvest mini game", 25, mmz4_unlocked_slam_harvest, 0x5c)
mmz4_achiev_unlock_stuff("[MMZ4] Mini Games Enjoyer", "Unlock the Energy Lab mini game", 10, mmz4_unlocked_energy_lab, 0x61)

//=======================================
//============== MINI GAME ==============
//=======================================

achievement("[MMZ4] No Plants Allowed", "Reach 150 score or higher on Plant Panic mini game", 5,
            trigger =   playing_mmz4() &&
                        mmz4_state() == mmz4_mg_plant_panic &&
                        mmz4_minigame_score() >= 150 &&
                        mmz4_minigame_score() > prev(mmz4_minigame_score()))

achievement("[MMZ4] Mega Basket", "Reach 150 score or higher on Busy Market mini game", 5,
            trigger =   playing_mmz4() &&
                        mmz4_state() == mmz4_mg_busy_basket &&
                        mmz4_minigame_score() >= 150 &&
                        mmz4_minigame_score() > prev(mmz4_minigame_score()))

achievement("[MMZ4] Timber Cutter", "Reach 200 score or higher on Lumberjack mini game", 5,
            trigger =   playing_mmz4() &&
                        mmz4_state() == mmz4_mg_lumberjack &&
                        mmz4_minigame_score() >= 200 &&
                        mmz4_minigame_score() > prev(mmz4_minigame_score()))

achievement("[MMZ4] Playing Firefighter", "Reach 750 score or higher on Lava Surf mini game", 5,
            trigger =   playing_mmz4() &&
                        mmz4_state() == mmz4_mg_lava_surf &&
                        mmz4_minigame_score() >= 750 &&
                        mmz4_minigame_score() > prev(mmz4_minigame_score()))

achievement("[MMZ4] Elf Carrier", "Finish Elf Chase mini game within 40 seconds", 5,
            trigger =   playing_mmz4() &&
                        mmz4_state() == mmz4_mg_elf_chase &&
                        prev(mmz4_game_context()) == mmz4_ctx_playing_minigame &&
                        mmz4_minigame_score() <= 2400 &&
                        trigger_when((mmz4_game_context() == mmz4_ctx_selecting_minigame || mmz4_game_context() == mmz4_ctx_updated_score_minigame) &&
                                      mmz4_minigame_finished())
            )

achievement("[MMZ4] Energy Harvester", "Reach 350 score or higher on Slam Harvest mini game", 5,
            trigger =   playing_mmz4() &&
                        mmz4_state() == mmz4_mg_slam_harvest &&
                        mmz4_minigame_score() >= 350 &&
                        mmz4_minigame_score() > prev(mmz4_minigame_score()))

achievement("[MMZ4] Columns", "Reach 200 score or higher on Energy Lab mini game", 5,
            trigger =   playing_mmz4() &&
                        mmz4_state() == mmz4_mg_energy_lab &&
                        mmz4_minigame_score() >= 200 &&
                        mmz4_minigame_score() > prev(mmz4_minigame_score()))


//=======================================
//============ MISCELLANEOUS ============
//=======================================

achievement("[MMZ4] Overpowered Elf", "Beat the game on Ultimate Mode", 10, 
            trigger =   playing_mmz4() &&
                        mmz4_cleared(mmz4_missions["Ragnarok Core"]) &&
                        mmz4_diff() == ulti_mode)

achievement("[MMZ4] Nothing Beats", "Beat the game without dying (One Session, Easy Mode not allowed)", 50, 
            trigger =   playing_mmz4() &&
                        once(mmz4_mission() == mmz4_missions["Caravan Chase"] &&
                             mmz4_stage_finished_flags() == 0 &&
                             mmz4_level_progress() == 3 && 
                             prev(mmz4_level_progress()) == 2) &&
                        never(mmz4_lives() < prev(mmz4_lives())) &&
                        never(mmz4_state() == mmz4_state_gameover) &&
                        never(mmz4_diff() == easy_mode) &&
                        never(mmz4_game_context() == mmz4_ctx_title_screen) &&
                        trigger_when(mmz4_cleared(mmz4_missions["Ragnarok Core"]))
            )

achievement("[Z Collection] I Only Care About the Story, Okay!?", "Finish Easy Scenario", 50, 
            trigger =   game_sel() == sel_scenario &&
                        current_game() == game_mmz4 &&
                        mmz4_cleared(mmz4_missions["Ragnarok Core"]))

//=======================================
//============= LEADERBOARD =============
//=======================================

leaderboard("[MMZ4] Speedrun - Normal", "Fastest in game time - Normal", 
            playing_mmz4() && mmz4_game_context() == mmz4_ctx_playing && mmz4_state() == mmz4_state_playing && mmz4_diff() == norm_mode,
            (playing_mmz4() && mmz4_game_context() == mmz4_ctx_title_screen) || (game_sel() != sel_mmz4), 
            playing_mmz4() && mmz4_cleared(mmz4_missions["Ragnarok Core"]), 
            mmz4_igt(), 
            format="FRAMES", lower_is_better=true, id=41
            )

leaderboard("[MMZ4] Speedrun - Hard", "Fastest in game time - Hard", 
            playing_mmz4() && mmz4_game_context() == mmz4_ctx_playing && mmz4_state() == mmz4_state_playing && mmz4_diff() == hard_mode,
            (playing_mmz4() && mmz4_game_context() == mmz4_ctx_title_screen) || (game_sel() != sel_mmz4), 
            playing_mmz4() && mmz4_cleared(mmz4_missions["Ragnarok Core"]), 
            mmz4_igt(), 
            format="FRAMES", lower_is_better=true, id=42
            )

leaderboard("[MMZ4] Speedrun - Ultimate", "Fastest in game time - Ultimate", 
            playing_mmz4() && mmz4_game_context() == mmz4_ctx_playing && mmz4_state() == mmz4_state_playing && mmz4_diff() == ulti_mode,
            (playing_mmz4() && mmz4_game_context() == mmz4_ctx_title_screen) || (game_sel() != sel_mmz4), 
            playing_mmz4() && mmz4_cleared(mmz4_missions["Ragnarok Core"]), 
            mmz4_igt(), 
            format="FRAMES", lower_is_better=true, id=43
            )

leaderboard("[MMZ4] Speedrun - Easy", "Fastest in game time - Easy", 
            playing_mmz4() && mmz4_game_context() == mmz4_ctx_playing && mmz4_state() == mmz4_state_playing && mmz4_diff() == easy_mode,
            (playing_mmz4() && mmz4_game_context() == mmz4_ctx_title_screen) || (game_sel() != sel_mmz4), 
            playing_mmz4() && mmz4_cleared(mmz4_missions["Ragnarok Core"]), 
            mmz4_igt(), 
            format="FRAMES", lower_is_better=true, id=44
            )

leaderboard("[MMZ4] Mini Game - Plant Panic", "Finish Plant Panic mini game with the highest score", 
            playing_mmz4() && mmz4_state() == mmz4_mg_plant_panic && mmz4_game_context() == mmz4_ctx_playing_minigame && mmz4_minigame_timer() != prev(mmz4_minigame_timer()),
            game_sel() != sel_mmz4 || (mmz4_game_context() == mmz4_ctx_selecting_minigame || mmz4_game_context() == mmz4_ctx_updated_score_minigame) && !mmz4_minigame_finished(), 
            playing_mmz4() && (mmz4_game_context() == mmz4_ctx_selecting_minigame || mmz4_game_context() == mmz4_ctx_updated_score_minigame) && mmz4_minigame_finished(), 
            mmz4_minigame_score(), 
            format="VALUE", lower_is_better=false, id=45
            )

leaderboard("[MMZ4] Mini Game - Busy Market", "Finish Busy Market mini game with the highest score", 
            playing_mmz4() && mmz4_state() == mmz4_mg_busy_basket && mmz4_game_context() == mmz4_ctx_playing_minigame && mmz4_minigame_timer() != prev(mmz4_minigame_timer()),
            game_sel() != sel_mmz4 || (mmz4_game_context() == mmz4_ctx_selecting_minigame || mmz4_game_context() == mmz4_ctx_updated_score_minigame) && !mmz4_minigame_finished(), 
            playing_mmz4() && (mmz4_game_context() == mmz4_ctx_selecting_minigame || mmz4_game_context() == mmz4_ctx_updated_score_minigame) && mmz4_minigame_finished(), 
            mmz4_minigame_score(), 
            format="VALUE", lower_is_better=false, id=46
            )

leaderboard("[MMZ4] Mini Game - Lumberjack", "Finish Lumberjack mini game with the highest score", 
            playing_mmz4() && mmz4_state() == mmz4_mg_lumberjack && mmz4_game_context() == mmz4_ctx_playing_minigame && mmz4_minigame_timer() != prev(mmz4_minigame_timer()),
            game_sel() != sel_mmz4 || (mmz4_game_context() == mmz4_ctx_selecting_minigame || mmz4_game_context() == mmz4_ctx_updated_score_minigame) && !mmz4_minigame_finished(), 
            playing_mmz4() && (mmz4_game_context() == mmz4_ctx_selecting_minigame || mmz4_game_context() == mmz4_ctx_updated_score_minigame) && mmz4_minigame_finished(), 
            mmz4_minigame_score(), 
            format="VALUE", lower_is_better=false, id=47
            )

leaderboard("[MMZ4] Mini Game - Lava Surf", "Finish Lava Surf mini game with the highest score", 
            playing_mmz4() && mmz4_state() == mmz4_mg_lava_surf && mmz4_game_context() == mmz4_ctx_playing_minigame && mmz4_minigame_timer() != prev(mmz4_minigame_timer()),
            game_sel() != sel_mmz4 || (mmz4_game_context() == mmz4_ctx_selecting_minigame || mmz4_game_context() == mmz4_ctx_updated_score_minigame) && !mmz4_minigame_finished(), 
            playing_mmz4() && (mmz4_game_context() == mmz4_ctx_selecting_minigame || mmz4_game_context() == mmz4_ctx_updated_score_minigame) && mmz4_minigame_finished(), 
            mmz4_minigame_score(), 
            format="VALUE", lower_is_better=false, id=48
            )

leaderboard("[MMZ4] Mini Game - Elf Chase", "Finish Elf Chase mini game the fastest as you can", 
            playing_mmz4() && mmz4_state() == mmz4_mg_elf_chase && mmz4_game_context() == mmz4_ctx_playing_minigame && mmz4_minigame_timer() != prev(mmz4_minigame_timer()),
            game_sel() != sel_mmz4 || mmz4_minigame_timer() == 0 || (mmz4_game_context() == mmz4_ctx_selecting_minigame || mmz4_game_context() == mmz4_ctx_updated_score_minigame) && !mmz4_minigame_finished(), 
            playing_mmz4() && (mmz4_game_context() == mmz4_ctx_selecting_minigame || mmz4_game_context() == mmz4_ctx_updated_score_minigame) && mmz4_minigame_finished(), 
            mmz4_minigame_score(), 
            format="FRAMES", lower_is_better=true, id=49
            )

leaderboard("[MMZ4] Mini Game - Slam Harvest", "Finish Slam Harvest mini game with the highest score", 
            playing_mmz4() && mmz4_state() == mmz4_mg_slam_harvest && mmz4_game_context() == mmz4_ctx_playing_minigame && mmz4_minigame_timer() != prev(mmz4_minigame_timer()),
            game_sel() != sel_mmz4  || (mmz4_game_context() == mmz4_ctx_selecting_minigame || mmz4_game_context() == mmz4_ctx_updated_score_minigame) && !mmz4_minigame_finished(), 
            playing_mmz4() && (mmz4_game_context() == mmz4_ctx_selecting_minigame || mmz4_game_context() == mmz4_ctx_updated_score_minigame) && mmz4_minigame_finished(), 
            mmz4_minigame_score(), 
            format="VALUE", lower_is_better=false, id=50
            )

leaderboard("[MMZ4] Mini Game - Energy Lab", "Finish Energy Lab mini game with the highest score", 
            playing_mmz4() && mmz4_state() == mmz4_mg_energy_lab && mmz4_game_context() == mmz4_ctx_playing_minigame && mmz4_minigame_timer() != prev(mmz4_minigame_timer()),
            game_sel() != sel_mmz4 || (mmz4_game_context() == mmz4_ctx_selecting_minigame || mmz4_game_context() == mmz4_ctx_updated_score_minigame) && !mmz4_minigame_finished(), 
            playing_mmz4() && (mmz4_game_context() == mmz4_ctx_selecting_minigame || mmz4_game_context() == mmz4_ctx_updated_score_minigame) && mmz4_minigame_finished(), 
            mmz4_minigame_score(), 
            format="VALUE", lower_is_better=false, id=51
            )

