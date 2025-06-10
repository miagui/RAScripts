// Mega Man IV
// #ID = 712

// Game

function game_mode_selected() => byte(0x00DF46)
function game_playing_demo() => byte(0x00defa)

function stage_id() => byte(0x00DF0A) 
        STG_TOAD_MAN = 0x01
        STG_BRIGHT_MAN = 0x02
        STG_PHARAOH_MAN = 0x03
        STG_RING_MAN = 0x04
        STG_CRYSTAL_MAN = 0x05
        STG_NAPALM_MAN = 0x06
        STG_STONE_MAN = 0x07
        STG_CHARGE_MAN = 0x08
        STG_WILY_STATION_I = 0x09
        STG_WILY_STATION_II = 0x0A
        STG_WILY_STATION_II_WILY_PLATES_DOOR = 0x0B
        STG_WILY_BATTLESHIP_II = 0x0C
        STG_WILY_BATTLESHIP_II_BOSS_RUSH = 0x0D
        STG_WILY_BATTLESHIP_II_FINAL_BATTLE = 0x0E
        STG_WILY_STATION_II_ESCAPE = 0x11
        STG_SATELLITE_CANNON = 0x12
        STG_WILY_BATTLESHIP_I = 0x13
        STG_WILY_BATTLESHIP_II_IRON_GOLEM_CUTSCENE = 0x14
        STG_WILY_BATTLESHIP_II_IRON_GOLEM_BOSS = 0x15
        STG_WILY_BATTLESHIP_II_POST_BOSS_RUSH = 0x1B
        G_LEVEL_CLEAR = 0x0F
        G_DR_LIGHT_LAB = 0x10
        G_DEBUG_SCREEN = 0x1A


function stage_screen_id() => byte(0x00DE9F)
function stage_checkpoint() => byte(0x00DE9A)
function stage_robots_defeated_in_boss_rush() => bitcount(0x00DE5C)

function game_in_stage_flag() => byte(0xde5a) // I guess?
function game_robot_masters_stages_finished() => byte(0x00DF35)
function game_wily_stages_finished() => byte(0x00DF36)

function game_amount_of_items_on_screen() => byte(0x00D40B)
function game_last_item_collected() => byte(0x00CCD0)

// Entity

// Changes value only when loading through screens. Best used for boss fights.
function stage_loaded_enemy_1_id() => byte(0x00C405)

function enemy_1_id() => byte(0x00c647)
function enemy_1_hp() => byte(0x00C658)
function enemy_1_attack() => byte(0x00C66B)
function enemy_2_id() => byte(0x00C687)
function enemy_2_hp() => byte(0x00C698)

function boss_hp_on_screen() => byte(0x00DD00)
function boss_hp_display() => byte(0x00DD01)

// Player

function player_hp() => byte(0x00DEAE)
function player_lives() => byte(0x00DF34)
function player_buster_upgrade() => byte(0x00DF33)
function player_invinicibility_frames() => byte(0x00D73B)
function player_sprite_animation() => byte(0x00D70A)
function player_position_x() => word(0x00D70D)

function player_shots_on_screen() => byte(0x00C200)

function player_weapon_selected_display() => byte(0x00DEAB)

// Player Inventory

function player_rush_coil_ammo() => byte(0x00DEAF)
function player_rush_jet_ammo() => byte(0x00DEB6)
function player_rain_flush_ammo() => byte(0x00DEB0)
function player_flash_stopper_ammo() => byte(0x00DEB1)
function player_pharaoh_shot_ammo() => byte(0x00DEB2)
function player_ring_boomerang_ammo() => byte(0x00DEB3)
function player_ballade_ammo() => byte(0x00DEB5)
function player_beat_ammo() => byte(0x00DEB4)
function player_crystal_eye_ammo() => byte(0x00DEB7)
function player_napalm_bomb_ammo() => byte(0x00DEB8)
function player_power_stone_ammo() => byte(0x00DEB9)
function player_charge_kick_ammo() => byte(0x00DEBA)

function player_unlocked_weapons_1() => byte(0x00DEAC)
function player_unlocked_weapons_2() => byte(0x00DEAD)
function player_unlocked_weapons_toad() => bit2(0x00DEAC)
function player_unlocked_weapons_bright() => bit3(0x00DEAC)
function player_unlocked_weapons_pharaoh() => bit4(0x00DEAC)
function player_unlocked_weapons_ring() => bit5(0x00DEAC)
function player_unlocked_weapons_ballade() => bit7(0x00DEAC)
function player_unlocked_weapons_crystal() => bit1(0x00DEAD)
function player_unlocked_weapons_napalm() => bit2(0x00DEAD)
function player_unlocked_weapons_stone() => bit3(0x00DEAD)
function player_unlocked_weapons_charge() => bit4(0x00DEAD)

function player_plates_collected() => byte(0x00DF37)
function player_plates_collected_bit0() => bit0(0x00DF37)
function player_plates_collected_bit1() => bit1(0x00DF37)
function player_plates_collected_bit2() => bit2(0x00DF37)
function player_plates_collected_bit3() => bit3(0x00DF37)
function player_plates_collected_bit4() => bit4(0x00DF37)
function player_plates_collected_bit5() => bit5(0x00DF37)
function player_plates_collected_bit6() => bit6(0x00DF37)
function player_plates_collected_bit7() => bit7(0x00DF37)

function player_e_tanks_pieces() => byte(0x00DF38)
function player_e_tanks() => byte(0x00DF39)
function player_w_tanks() => byte(0x00DF3A)
function player_sp_tank() => byte(0x00DF3B)
function player_energy_balancer() => byte(0x00DF3C)
function player_p_chips() => word(0x00DF3D)
function player_p_chips_upper8() => byte(0x00DF3E)

bosses = {
    "Toad Man": 0x20,
    "Bright Man": 0x1A,
    "Pharaoh Man": 0x19,
    "Ring Man": 0x37,
    "Crystal Man": 0x2A,
    "Charge Man": 0x28,
    "Stone Man": 0x3A,
    "Napalm Man": 0x36,
    "Ballade": 0x3F,
    "Satellite Cannon": 0x4F,
    "Bridge": 0x49,
    "Wily Robo Iron Golem": 0x4B,
    "Wily Robo Iron Golem 2nd": 0x83,
    "Wily Capsule": 0x4C
}

stages = {
    "Toad Man": 0x01,
    "Bright Man": 0x02,
    "Pharaoh Man": 0x03,
    "Ring Man": 0x04,
    "Crystal Man": 0x05,
    "Napalm Man": 0x06,
    "Stone Man": 0x07,
    "Charge Man": 0x08,
    "Wily Station II": 0x0a,
    "Wily Battleship I": 0x13,
    "Wily Battleship II": 0x0c
}

// =========================================
//                  Utility              
// =========================================

function in_game() => game_mode_selected() > 0 && never(game_playing_demo() > 0)
function took_damage() {
    return(
        player_invinicibility_frames() > prev(player_invinicibility_frames()) ||
        player_hp() < prev(player_hp())
    )
}

function boss_defeated() {
    return(
        boss_hp_display() == 0 && prev(boss_hp_display()) > 0 && prev(boss_hp_on_screen()) > 0
    )
}

function weapon_used() {
    return(
        any_of(range(0xdeaf, 0xdeba), weapon => byte(weapon) < prev(byte(weapon) ))
    )
}

function game_started() => stage_checkpoint() == 0 && player_sprite_animation() == 0x2e && prev(player_sprite_animation()) == 0x2c && game_robot_masters_stages_finished() == 0
function game_beaten() => stage_id() == STG_WILY_BATTLESHIP_II_FINAL_BATTLE && stage_loaded_enemy_1_id() == bosses["Wily Capsule"] && boss_defeated()

function etank_used() => (player_e_tanks() < prev(player_e_tanks()) || player_sp_tank() < prev(player_sp_tank()) )


// =========================================
//                Progression              
// =========================================

achievement(
    title = "Rain Flush", points = 5, type="progression",
    description = "Defeat Toad Man and obtain Rain Flush",
    id = 14535, published = "05/10/2014 06:59:40", modified = "22/05/2020 20:03:32",
    trigger = stage_id() == 1 && stage_screen_id() == 15 && player_unlocked_weapons_toad() == 1
)

achievement(
    title = "Flash Stopper", points = 5, type="progression",
    description = "Defeat Bright Man and obtain Flash Stopper",
    id = 14537, published = "05/10/2014 06:59:56", modified = "22/05/2020 20:03:40",
    trigger = stage_id() == 2 && stage_screen_id() == 12 && player_unlocked_weapons_bright() == 1
)

achievement(
    title = "Pharaoh Shot", points = 5, type="progression",
    description = "Defeat Pharaoh Man and obtain Pharaoh Shot",
    id = 14539, published = "05/10/2014 07:00:09", modified = "22/05/2020 20:03:38",
    trigger = stage_id() == 3 && stage_screen_id() == 11 && player_unlocked_weapons_pharaoh() == 1
)

achievement(
    title = "Ring Boomerang", points = 5, type="progression",
    description = "Defeat Ring Man and obtain Ring Boomerang",
    id = 14541, published = "05/10/2014 07:00:21", modified = "22/05/2020 20:03:37",
    trigger = stage_id() == 4 && stage_screen_id() == 24 && player_unlocked_weapons_ring() == 1
)

achievement(
    title = "MKN-003", points = 5, type="progression",
    description = "Defeat Ballade",
    id = 14547, published = "05/10/2014 07:01:07", modified = "07/04/2021 04:37:48",
    trigger = stage_id() == 9 && never(stage_screen_id() != 12) && enemy_1_hp() == 1 && once(boss_hp_on_screen() == 1) &&
              boss_hp_on_screen() == 0
)

achievement(
    title = "Crystal Eye", points = 5, type="progression",
    description = "Defeat Crystal Man and obtain Crystal Eye",
    id = 14548, published = "05/10/2014 07:01:13", modified = "22/05/2020 20:03:30",
    trigger = stage_id() == 5 && stage_screen_id() == 15 && player_unlocked_weapons_crystal() == 1
)

achievement(
    title = "Power Stone", points = 5, type="progression",
    description = "Defeat Stone Man and obtain Power Stone",
    id = 14550, published = "05/10/2014 07:01:36", modified = "22/05/2020 20:03:28",
    trigger = stage_id() == 7 && stage_screen_id() == 19 && player_unlocked_weapons_stone() == 1
)

achievement(
    title = "Charge Kick", points = 5, type="progression",
    description = "Defeat Charge Man and Charge Kick",
    id = 14552, published = "05/10/2014 07:01:45", modified = "22/05/2020 20:03:27",
    trigger = stage_id() == 8 && stage_screen_id() == 17 && player_unlocked_weapons_charge() == 1
)

achievement(
    title = "Napalm Bomb", points = 5, type="progression",
    description = "Defeat Napalm Man and obtain Napalm Bomb",
    id = 14554, published = "05/10/2014 07:01:58", modified = "22/05/2020 20:03:26",
    trigger = stage_id() == 6 && stage_screen_id() == 15 && player_unlocked_weapons_napalm() == 1
)

achievement(
    title = "Ballade Cracker", points = 5, type="progression",
    description = "Defeat Ballade in the second encounter",
    id = 14563, published = "05/10/2014 07:05:10", modified = "07/04/2021 04:36:54",
    trigger = stage_id() == 10 && stage_screen_id() == 12 && player_unlocked_weapons_ballade() == 1
)

achievement(
    title = "Defense System", points = 5, type="progression",
    description = "Defeat the Bridge",
    id = 14560, published = "05/10/2014 07:04:52", modified = "05/10/2014 07:08:17",
    trigger = once(stage_id() == 19) && stage_id() == 12 && once(stage_screen_id() == 5) && stage_screen_id() == 1
)

achievement(
    title = "Enhanced Suzy", points = 5, type="progression",
    description = "Defeat the Hunters",
    id = 14561, published = "05/10/2014 07:05:01", modified = "05/10/2014 07:08:25",
    trigger = stage_id() == 12 && once(stage_screen_id() == 8) && stage_screen_id() == 9
)

achievement(
    title = "The Ballad of the Blue Bomber", points = 25, type="win_condition",
    description = "Defeat Dr. Wily and beat the game!",
    id = 14565, published = "05/10/2014 07:05:18", modified = "22/05/2020 20:03:54",
    trigger = stage_id() == 0x16 && prev(stage_id()) == 0x0e
)

// =========================================
//                Buster Only              
// =========================================

function achiev_robotmaster_busteronly(title, boss_name, achievement_id) {
    achievement(title, format("Defeat {0} using only the Mega Buster and without using E-Tanks", boss_name), 10, id = achievement_id,
                trigger =   in_game() &&
                            never(stage_id() != stages[boss_name] && stage_id() != STG_WILY_BATTLESHIP_II_BOSS_RUSH) &&
                            never(stage_loaded_enemy_1_id() != bosses[boss_name]) &&
                            once(boss_hp_on_screen() > prev(boss_hp_on_screen())) && // HP bar displayed
                            trigger_when(boss_defeated()) &&
                            never(weapon_used()) &&
                            never(etank_used())
    )
}

achiev_robotmaster_busteronly("Froggy", "Toad Man", 14536)
achiev_robotmaster_busteronly("Shiny, Shiny!!", "Bright Man", 14538)
achiev_robotmaster_busteronly("Sandy Robot", "Pharaoh Man", 14540)
achiev_robotmaster_busteronly("Ringu", "Ring Man", 14542)
achiev_robotmaster_busteronly("Mirror Force", "Crystal Man", 14549)
achiev_robotmaster_busteronly("Fire Weapons", "Napalm Man", 14555)
achiev_robotmaster_busteronly("Wall of Stone", "Stone Man", 14551)
achiev_robotmaster_busteronly("Steam Robot", "Charge Man", 14553)

achievement("Ballade in Buster Minor", "Defeat Ballade in the second encounter using only the Mega Buster and without using E-Tanks",  10,
            trigger =   in_game() &&
                        never(stage_id() != STG_WILY_STATION_II) &&
                        never(stage_loaded_enemy_1_id() != bosses["Ballade"]) &&
                        once(boss_hp_on_screen() > prev(boss_hp_on_screen())) && // HP bar displayed
                        trigger_when(boss_defeated()) &&
                        never(weapon_used()) &&
                        never(etank_used())
)

// =========================================
//              Boss Damageless              
// =========================================

function achiev_robotmaster_damageless(title, boss_name, points) {
    achievement(title, format("Defeat {0} without taking damage", boss_name), points,
                trigger =   in_game() &&
                            never(stage_id() != stages[boss_name] && stage_id() != STG_WILY_BATTLESHIP_II_BOSS_RUSH) &&
                            never(stage_loaded_enemy_1_id() != bosses[boss_name]) &&
                            once(boss_hp_on_screen() > prev(boss_hp_on_screen())) && // HP bar displayed
                            trigger_when(boss_defeated()) &&
                            never(took_damage())
    )
}

achiev_robotmaster_damageless("Dancing for No Reason", "Toad Man", 5)
achiev_robotmaster_damageless("Your Health Bar Looked Too Full...", "Bright Man", 25)
achiev_robotmaster_damageless("Back to the Tomb, Pharaoh!", "Pharaoh Man", 5)
achiev_robotmaster_damageless("The Lord of No Rings", "Ring Man", 10)
achiev_robotmaster_damageless("Shine Bright Like a Crystal", "Crystal Man", 10)
achiev_robotmaster_damageless("800 Degrees Pain", "Napalm Man", 10)
achiev_robotmaster_damageless("Living Like a Stone", "Stone Man", 10)
achiev_robotmaster_damageless("Jorge the Tank Engine", "Charge Man", 10)

achievement("Lost in Transmission", "Defeat Satellite Cannon without taking damage", 5,
                trigger =   in_game() &&
                            never(stage_id() != STG_SATELLITE_CANNON) &&
                            never(stage_loaded_enemy_1_id() != bosses["Satellite Cannon"]) &&
                            once(boss_hp_on_screen() > prev(boss_hp_on_screen())) && // HP bar displayed
                            trigger_when(boss_defeated()) &&
                            never(took_damage())
)

achievement("Round One... Perfect!", "Defeat Ballade in the first encounter without taking damage", 10,
                trigger =   in_game() &&
                            never(stage_id() != STG_WILY_STATION_I) &&
                            never(stage_loaded_enemy_1_id() != bosses["Ballade"]) &&
                            once(boss_hp_on_screen() > prev(boss_hp_on_screen())) && // HP bar displayed
                            trigger_when(boss_hp_display() == 8 && prev(boss_hp_display()) > 8) &&
                            never(took_damage())
)

achievement("Unknown Machine", "Defeat Bridge without taking damage", 5,
                trigger =   in_game() &&
                            never(stage_id() != STG_WILY_BATTLESHIP_I) &&
                            never(stage_loaded_enemy_1_id() != bosses["Bridge"]) &&
                            once(boss_hp_on_screen() > prev(boss_hp_on_screen())) && // HP bar displayed
                            trigger_when(boss_defeated()) &&
                            never(took_damage())
)

achievement("Not So Mighty Now, Tiny Giant!", "Defeat 1st and 2nd phase of Wily Robo Iron Golem without taking damage", 25,
                trigger =   in_game() &&
                            never(stage_id() != STG_WILY_BATTLESHIP_II_IRON_GOLEM_BOSS) &&
                            never(stage_loaded_enemy_1_id() != bosses["Wily Robo Iron Golem"]) &&
                            once(boss_hp_on_screen() > prev(boss_hp_on_screen()) && // HP bar displayed
                                 enemy_2_id() == bosses["Wily Robo Iron Golem"]) && 
                            trigger_when(boss_defeated() && enemy_2_id() == bosses["Wily Robo Iron Golem 2nd"]) &&
                            never(took_damage())
)

achievement("Unidentified Flying Object", "Defeat Wily Capsule without taking damage", 10,
                trigger =   in_game() &&
                            never(stage_id() != STG_WILY_BATTLESHIP_II_FINAL_BATTLE) &&
                            never(stage_loaded_enemy_1_id() != bosses["Wily Capsule"]) &&
                            once(boss_hp_on_screen() > prev(boss_hp_on_screen())) && // HP bar displayed
                            trigger_when(boss_defeated()) &&
                            never(took_damage())
)

achievement(
    title = "Force Tower", points = 25,
    description = "Defeat Ballade in the second encounter without taking damage",
    id = 14564, published = "05/10/2014 07:05:14", modified = "29/07/2023 14:54:36",
    trigger =   in_game() &&
                never(stage_id() != STG_WILY_STATION_II) &&
                never(stage_loaded_enemy_1_id() != bosses["Ballade"]) &&
                once(boss_hp_on_screen() > prev(boss_hp_on_screen())) && // HP bar displayed
                trigger_when(boss_defeated()) &&
                never(took_damage())
)

achievement(
    title = "Hunter X Hunter", points = 10,
    description = "Defeat the second Hunters without taking damage",
    id = 14562, published = "05/10/2014 07:05:05", modified = "24/11/2021 19:10:43",
    trigger = (stage_id() == 12 && stage_screen_id() == 14) &&
              trigger_when((enemy_1_hp() < prev(enemy_1_hp()) && enemy_1_hp() == 0)) &&
              unless(once(stage_id() == 12 && stage_screen_id() == 14 && player_hp() < prev(player_hp()))) &&
              (always_false() || (never((stage_id() == 12 && stage_screen_id() != 14))))
)



// =========================================
//              Misc Challenges              
// =========================================

achievement("Infinite Solar Energy", "Defeat a Robot Master using only the Pharaoh Shot and without consuming any ammo", 10,
            trigger =   in_game() &&
                        never(stage_loaded_enemy_1_id() != prev(stage_loaded_enemy_1_id())) &&
                        never(stage_id() > 8 && stage_id() != STG_WILY_BATTLESHIP_II_BOSS_RUSH) &&
                        once(boss_hp_on_screen() > prev(boss_hp_on_screen())) && // HP bar displayed
                        trigger_when(boss_defeated()) &&
                        player_weapon_selected_display() == 4 &&
                        never(player_pharaoh_shot_ammo() < prev(player_pharaoh_shot_ammo())) &&
                        never(player_shots_on_screen() > prev(player_shots_on_screen()) && player_weapon_selected_display() != 4)
)

achievement("Sorry, I Don’t Like Waiting...", "Defeat Satellite Cannon with it opening the core only once", 10,
            trigger =   in_game() &&
                        never(stage_id() != STG_SATELLITE_CANNON) &&
                        never(stage_loaded_enemy_1_id() != bosses["Satellite Cannon"]) &&
                        once(boss_hp_on_screen() > prev(boss_hp_on_screen())) && // HP bar displayed
                        trigger_when(boss_defeated()) &&
                        never(enemy_1_attack() == 0 && prev(enemy_1_attack()) == 2)
)


achievement("Yes, I've Studied the Damage Charts. How'd You Know?", "Finish the boss rush within 3m15s", 25,
            trigger =   in_game() &&
                        once(stage_id() == STG_WILY_BATTLESHIP_II_BOSS_RUSH && stage_screen_id() == 0x13 && 
                             stage_robots_defeated_in_boss_rush() == 0 && boss_hp_on_screen() > prev(boss_hp_on_screen())
                             ) &&
                        never(tally(11700, once(stage_id() == STG_WILY_BATTLESHIP_II_BOSS_RUSH && stage_screen_id() == 0x13 && 
                              stage_robots_defeated_in_boss_rush() == 0 && boss_hp_on_screen() > prev(boss_hp_on_screen())) &&
                              always_true()
                             )) &&
                        never(stage_id() != STG_WILY_BATTLESHIP_II_BOSS_RUSH) &&
                        never(stage_id() == STG_WILY_BATTLESHIP_II_BOSS_RUSH && stage_screen_id() == 0x12 && stage_robots_defeated_in_boss_rush() == 0) &&
                        trigger_when(stage_id() == STG_WILY_BATTLESHIP_II_BOSS_RUSH && 
                                     stage_screen_id() == 0x13 && 
                                     stage_robots_defeated_in_boss_rush() == 7 && 
                                     boss_defeated()
                                     )
)

achievement("Hurry Up, Mega Man!!", "Escape the Wily Station in less than 35 seconds", 10,
            trigger =   in_game() &&
                        once(stage_id() == STG_WILY_STATION_II_ESCAPE && stage_screen_id() == 0x01 && player_position_x() > 0x47 && prev(player_position_x()) <= 0x47) &&
                        never(tally(2100, once(stage_id() == STG_WILY_STATION_II_ESCAPE && stage_screen_id() == 0x01 && 
                              player_position_x() > 0x47 && prev(player_position_x()) <= 0x47) &&
                              always_true()
                             )) &&
                        never(stage_id() != STG_WILY_STATION_II_ESCAPE) &&
                        never(stage_id() == STG_WILY_STATION_II_ESCAPE && stage_screen_id() == 0x01 && player_lives() < prev(player_lives())) &&
                        trigger_when(stage_id() == STG_WILY_STATION_II_ESCAPE && stage_screen_id() == 0x02 && prev(stage_screen_id()) == 0x01)
)


achievement(
    title = "The Perfect File", points = 10,
    description = "Finish the second Ballade fight with all plates and upgrades obtained. Passwords are not allowed",
    id = 21480, badge = "528999", published = "01/03/2015 17:52:31", modified = "16/02/2022 22:15:27",
    trigger =   in_game() &&
                game_mode_selected() == 1 && 
                player_plates_collected() == 255 && 
                player_buster_upgrade() == 1 &&
                player_energy_balancer() == 1 &&
                stage_id() == 0x0f && prev(stage_id()) == 0x0a
)

achievement(
    title = "Unarmed Robot", points = 25,
    description = "Beat the game without using continues and E-Tanks, without having any of the BEAT plates, the Buster upgrade, or the Energy Balancer. Passwords are not allowed",
    id = 21481, badge = "529000", published = "01/03/2015 17:52:33", modified = "23/11/2024 15:09:08",
    trigger =   in_game() &&
                game_mode_selected() == 1 && 
                once(game_started()) &&
                never(player_lives() == 0 && prev(player_lives()) == 1) &&
                never(etank_used()) &&
                trigger_when(game_beaten()) &&
                low4(0xdf37) == 0 && // BEAT plates 
                player_energy_balancer() == 0 && 
                player_buster_upgrade() == 0 
    )

// =========================================
//              Stage Damageless              
// =========================================

function achiev_stage_damageless(title, stage_name, points) {
    achievement(title, format("Reach {0}'s boss door without taking damage", stage_name), points,
                trigger =   in_game() &&
                            never(stage_id() != stages[stage_name]) &&
                            once(stage_checkpoint() == 0 && player_sprite_animation() == 0x2e && prev(player_sprite_animation()) == 0x2c) &&
                            never(took_damage()) &&
                            trigger_when(stage_checkpoint() == 2 && prev(stage_checkpoint()) == 1)
                )
}

achiev_stage_damageless("Water Central", "Toad Man", 10)
achiev_stage_damageless("Cyber Center", "Bright Man", 10)
achiev_stage_damageless("Subterranean Pyramids", "Pharaoh Man", 10)
achiev_stage_damageless("Sky Base", "Ring Man", 10)
achiev_stage_damageless("Crystal Tower", "Crystal Man", 25)
achiev_stage_damageless("Exploding Tower", "Napalm Man", 10)
achiev_stage_damageless("Rock Tower", "Stone Man", 10)
achiev_stage_damageless("Train Tower", "Charge Man", 10)

achievement("Battleship Exterior", "Reach the Wily Battleship I boss without taking damage", 10,
                trigger =   in_game() &&
                            never(stage_id() != STG_WILY_BATTLESHIP_I) &&
                            once(stage_checkpoint() == 0 && player_sprite_animation() == 0x2e && prev(player_sprite_animation()) == 0x2c) &&
                            never(took_damage()) &&
                            trigger_when(stage_screen_id() == 0x06 && prev(stage_screen_id()) == 0x05)
            )

achievement("Battleship's Main Deck", "Reach the Wily Battleship II boss rush without taking damage", 25,
                trigger =   in_game() &&
                            never(stage_id() != STG_WILY_BATTLESHIP_II && stage_id() != STG_WILY_BATTLESHIP_II_BOSS_RUSH) &&
                            once(stage_id() == STG_WILY_BATTLESHIP_II && stage_checkpoint() == 0 && player_sprite_animation() == 0x2e && prev(player_sprite_animation()) == 0x2c) &&
                            never(took_damage()) &&
                            trigger_when(stage_id() == STG_WILY_BATTLESHIP_II_BOSS_RUSH && prev(stage_id()) == STG_WILY_BATTLESHIP_II)
                )

// =========================================
//                   Misc              
// =========================================

achievement("Pacifist Man", "Get through the first Escaroo (the big snail) in Toad Man's stage without damaging him", 3,
            trigger =   in_game() &&
                        never(stage_id() != STG_TOAD_MAN) &&
                        once(stage_screen_id() == 0x04 && prev(stage_screen_id()) == 0x03) &&
                        never(stage_loaded_enemy_1_id() == 0x1f && stage_screen_id() == 0x04 && enemy_2_hp() < prev(enemy_2_hp())) &&
                        never(stage_screen_id() < 0x04) &&
                        stage_screen_id() == 0x05 && prev(stage_screen_id()) == 0x04
            )

achievement("Unintended Ring", "Collect the \"W\" Plate without approaching it from the left side on Crystal Man's stage", 3,
            trigger =   in_game() &&
                        stage_id() == STG_CRYSTAL_MAN &&
                        stage_screen_id() == 0x07 &&
                        player_position_x() > 0x19 &&
                        player_plates_collected_bit4() > prev(player_plates_collected_bit4())
            )

achievement("A Gift from the Shadows", "Collect a Yashichi", 3,
            trigger =   in_game() &&
                        game_last_item_collected() == 0x07 && prev(game_last_item_collected()) != 0x07
            )

achievement("In the Quiet Corners", "Visit both secret rooms on the Wily Battleship", 4,
            trigger =   in_game() &&
                        never(stage_id() != 0x0c) &&
                        measured(tally(2, once(stage_screen_id() == 0x15), once(stage_screen_id() == 0x16)))
            )

// =========================================
//               Collectibles              
// =========================================

// variation
collectibles_toad = [0xd4e0, 0xd4e9]
collectibles_bright = [0xd4ce, 0xd4d4]
collectibles_pharaoh = [0xd4cb, 0xd4d7, 0xd4dd, 0xd4e6]
collectibles_ring = [0xd4d1]
collectibles_wily_station = [0xd4cb, 0xd4da]

// variation 2
collectibles_crystal = [0x010110, 0x015308, 0x011a03]
collectibles_napalm = [0x013608, 0x016001, 0x016514, 0x014407]
collectibles_charge = [0x01680b, 0x016821, 0x016202, 0x011c11, 0x011c12]
collectibles_stone = [0x012701, 0x012c02, 0x01650f]
collectibles_wily_battleship = [0x01311b, 0x01111c, 0x016502, 0x012b01, 0x015d1f, 0x015d21]

items_array_start = 0xd4c6

function items_logic_v2(items_array) {
    trigger = always_false()
    once_array = []
    for item_id in items_array {
        for address in range(0xd4c6, 0xd4ff, 3) {
            array_push(once_array, once(tbyte(address) == item_id + 0x10000 && prev(tbyte(address)) == item_id))
        }
    }
    return measured(tally(length(items_array), once_array))
}
        

function achiev_stage_collectibles_v1(title, description, stage, items_array, points) {
    achievement(title, description, points,
                trigger =   in_game() &&
                            never(stage_id() != stages[stage]) &&
                            never(player_lives() == 0 && prev(player_lives()) == 1) &&
                            measured(tally_of(items_array, length(items_array), item => once(byte(item) == 2 && prev(byte(item)) == 1) )) &&
                            any_of(items_array, item => byte(item) == 2 && prev(byte(item)) == 1 )
                )
}

function achiev_stage_collectibles_v2(title, description, stage, items_array, points) {
    achievement(title, description, points,
                trigger =   in_game() &&
                            never(stage_id() != stages[stage]) &&
                            never(player_lives() == 0 && prev(player_lives()) == 1) &&
                            items_logic_v2(items_array)
                            // measured(tally_of(items_array, length(items_array), item_id => once(any_of(range(0xd4c6, 0xd4ff, 3), address => tbyte(address) == item_id + 0x10000)))) &&
                            // any_of(items_array, item_id => any_of(range(0xd4c6, 0xd4ff, 3), address => prev(tbyte(address)) == item_id))
                )
}

achiev_stage_collectibles_v1("City Explorer I", "Collect all 1-UPs and E-Tanks on Toad Man's stage", "Toad Man", collectibles_toad, 3)
achiev_stage_collectibles_v1("City Explorer II", "Collect all 1-UPs and Mini E-Tanks on Bright Man's stage", "Bright Man", collectibles_bright, 2)
achiev_stage_collectibles_v1("City Explorer III", "Collect all 1-UPs, E-Tanks and Mini E-Tanks on Pharaoh Man's stage", "Pharaoh Man", collectibles_pharaoh, 5)
achiev_stage_collectibles_v1("City Explorer IV", "Collect a 1-UP on Ring Man's stage", "Ring Man", collectibles_ring, 2)
achiev_stage_collectibles_v2("Station Explorer I", "Collect all 1-UPs and Mini E-Tanks on Crystal Man's stage", "Crystal Man", collectibles_crystal, 3)
achiev_stage_collectibles_v2("Station Explorer II", "Collect all 1-UPs, E-Tanks and Mini E-Tanks on Napalm Man's stage", "Napalm Man", collectibles_napalm, 5)
achiev_stage_collectibles_v2("Station Explorer III", "Collect all 1-UPs, E-Tanks and Mini E-Tanks on Charge Man's stage", "Charge Man", collectibles_charge, 5)
achiev_stage_collectibles_v2("Station Explorer IV", "Collect all 1-UPs and E-Tanks on Stone Man's stage", "Stone Man", collectibles_stone, 5)
achiev_stage_collectibles_v1("Station Explorer V", "Collect all 1-UPs and E-Tanks on Wily Station II stage", "Wily Station II", collectibles_wily_station, 3)
achiev_stage_collectibles_v2("Space Explorer", "Collect all 1-UPs, E-Tanks and Mini E-Tanks on Wily Battleship's stage", "Wily Battleship II", collectibles_wily_battleship, 5)


// =========================================
//                  Misc              
// =========================================

achievement(
    title = "Wet Plate", points = 3,
    description = "Collect the \"B\" plate",
    id = 14543, badge = "528969", published = "05/10/2014 07:00:35", modified = "22/05/2020 20:03:36",
    trigger = stage_id() == 1 && player_plates_collected_bit0() > prev(player_plates_collected_bit0())
)

achievement(
    title = "Bright Plate", points = 3,
    description = "Collect the \"E\" plate",
    id = 14544, badge = "528970", published = "05/10/2014 07:00:38", modified = "22/05/2020 20:03:35",
    trigger = stage_id() == 2 && player_plates_collected_bit1() > prev(player_plates_collected_bit1())
)

achievement(
    title = "Ancient Plate", points = 3,
    description = "Collect the \"A\" plate",
    id = 14545, badge = "528971", published = "05/10/2014 07:00:43", modified = "22/05/2020 20:03:34",
    trigger = stage_id() == 3 && player_plates_collected_bit2() == prev(player_plates_collected_bit2())
)

achievement(
    title = "Sky Plate", points = 3,
    description = "Collect the \"T\" plate",
    id = 14546, badge = "528972", published = "05/10/2014 07:00:50", modified = "22/05/2020 20:03:41",
    trigger = stage_id() == 4 && player_plates_collected_bit3() > prev(player_plates_collected_bit3())
)

achievement(
    title = "Sparkling Plate", points = 3,
    description = "Collect the \"W\" plate",
    id = 14556, badge = "528982", published = "05/10/2014 07:02:09", modified = "22/05/2020 20:03:24",
    trigger = stage_id() == 5 && player_plates_collected_bit4() > prev(player_plates_collected_bit4())
)

achievement(
    title = "Hot Plate", points = 3,
    description = "Collect the \"I\" plate",
    id = 14557, badge = "528983", published = "05/10/2014 07:02:12", modified = "22/05/2020 20:03:52",
    trigger = stage_id() == 6 && player_plates_collected_bit5() > prev(player_plates_collected_bit5())
)

achievement(
    title = "Easy Plate", points = 3,
    description = "Collect the \"L\" plate",
    id = 14558, badge = "528984", published = "05/10/2014 07:02:16", modified = "22/05/2020 20:04:01",
    trigger = stage_id() == 7 && player_plates_collected_bit6() > prev(player_plates_collected_bit6())
)

achievement(
    title = "Traveling Plate", points = 3,
    description = "Collect the \"Y\" plate",
    id = 14559, badge = "528985", published = "05/10/2014 07:02:20", modified = "22/05/2020 20:04:00",
    trigger = stage_id() == 8 && player_plates_collected_bit7() > prev(player_plates_collected_bit7())
)

achievement(
    title = "PC Fan ver. IV", points = 5,
    description = "Get 100 P-Chips without using passwords",
    id = 14566, badge = "528992", published = "05/10/2014 07:05:26", modified = "07/04/2021 04:37:03",
    trigger = measured(player_p_chips() >= 100) && player_p_chips() > prev(player_p_chips()) && game_mode_selected() == 1
)


achievement(
    title = "PC Lover ver. IV", points = 10,
    description = "Get 400 P-Chips without using passwords",
    id = 14567, badge = "528993", published = "05/10/2014 07:05:29", modified = "07/04/2021 04:37:06",
    trigger = measured(player_p_chips() >= 400) && player_p_chips() > prev(player_p_chips()) && game_mode_selected() == 1
)

achievement(
    title = "Auto-Balancer", points = 5,
    description = "Purchase the Energy Balancer",
    id = 14568, badge = "528994", published = "05/10/2014 07:05:34", modified = "22/05/2020 20:03:53",
    trigger = stage_id() == 16 && once(player_energy_balancer() == 0) && player_energy_balancer() == 1 &&
              game_mode_selected() == 1
)

achievement(
    title = "Faster Lemons", points = 5,
    description = "Obtain the Buster upgrade",
    id = 14569, badge = "528995", published = "05/10/2014 07:05:43", modified = "08/12/2019 21:46:06",
    trigger = once(player_buster_upgrade() == 0) && player_buster_upgrade() == 1 && prev(stage_id()) == 16
)

// =========================================
//                Leaderboards              
// =========================================

// leaderboard("Full Game Speedrun", "Fastest time to finish the game (IGT)",
//            start = game_started(),
//            cancel = player_unlocked_weapons_1() == 0x00,
//            submit = game_beaten(),
//            value = (stage_id() != 0x00 && stage_id() != 0x10 && stage_id() != 0x14 && stage_id() != 0x16 && stage_id() != 0x1c),
//            format = "FRAMES", lower_is_better=true)

leaderboard("Boss Rush Speedrun", "Fastest time to finish the boss rush",
           start = in_game() && stage_id() == STG_WILY_BATTLESHIP_II_BOSS_RUSH && stage_screen_id() == 0x13 && stage_robots_defeated_in_boss_rush() == 0 && boss_hp_on_screen() > prev(boss_hp_on_screen()),
           cancel = stage_id() != STG_WILY_BATTLESHIP_II_BOSS_RUSH || (stage_id() == STG_WILY_BATTLESHIP_II_BOSS_RUSH && stage_screen_id() == 0x12 && stage_robots_defeated_in_boss_rush() == 0),
           submit = stage_id() == STG_WILY_BATTLESHIP_II_BOSS_RUSH && stage_screen_id() == 0x13 && stage_robots_defeated_in_boss_rush() == 7 && boss_defeated(),
           value = always_true(),
           format = "FRAMES", lower_is_better=true
           )

leaderboard("Wily Station Escape", "Fastest time to escape the Wily Station",
           start = in_game() && stage_id() == STG_WILY_STATION_II_ESCAPE && stage_screen_id() == 0x01 && player_position_x() > 0x47 && prev(player_position_x()) <= 0x47,
           cancel = stage_id() != STG_WILY_STATION_II_ESCAPE || (stage_id() == STG_WILY_STATION_II_ESCAPE && stage_screen_id() == 0x01 && player_lives() < prev(player_lives())),
           value = always_true(),
           submit = stage_id() == STG_WILY_STATION_II_ESCAPE && stage_screen_id() == 0x02 && prev(stage_screen_id()) == 0x01,
           format = "FRAMES", lower_is_better=true
           )

// =========================================
//                  DEMOTED              
// =========================================

// achievement(
//     title = "Now What?!", points = 5,
//     description = "Reach Dr. Wily's door without any of the WILY plates",
//     id = 14570, badge = "528996", published = "05/10/2014 07:05:57", modified = "07/04/2021 04:37:09",
//     trigger = stage_id() == 11 && player_plates_collected_bit4() == 0 && player_plates_collected_bit5() == 0 &&
//               player_plates_collected_bit6() == 0 && player_plates_collected_bit7() == 0 && stage_id() == 11
// )

// achievement(
//     title = "Why'd I Enter Here?", points = 1,
//     description = "A short visit...",
//     id = 14571, badge = "528997", published = "05/10/2014 07:06:01", modified = "07/04/2021 04:37:12",
//     trigger = never(byte(0x00FF8E) == 3) && never(stage_id() != 16) && never(stage_screen_id() != 1) &&
//               player_sprite_animation() == 42 && once(player_sprite_animation() == 44)
// )

// achievement(
//     title = "P-Chip Master", points = 10,
//     description = "Get 500 P-Chips",
//     id = 21482, badge = "529001", published = "01/03/2015 18:13:03", modified = "16/02/2022 22:15:28",
//     trigger = player_p_chips_upper8() == 1 && player_p_chips() >= 244 && player_hp() != 0
// )

// achievement(
//     title = "Ray of Hope", points = 10,
//     description = "Defeat any Robot Master without taking damage or pausing the game",
//     id = 17613, badge = "528998", published = "20/11/2014 22:08:47", modified = "31/03/2021 15:16:30",
//     trigger = stage_id() <= 8 && once(boss_hp_on_screen() == 0) && boss_hp_on_screen() == 1 && never(player_hp() == 0) &&
//               stage_screen_id() >= 11 && stage_screen_id() <= 24 && never(game_in_stage_flag() == 0) &&
//               ((once(enemy_1_hp() == 19) && enemy_1_hp() == 0 && never(player_invinicibility_frames() != 0)) ||
//                (once(entity_2_hp() == 19) && entity_2_hp() == 0 && never(player_invinicibility_frames() != 0)))
// )