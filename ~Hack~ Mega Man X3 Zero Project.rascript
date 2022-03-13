// ~Hack~ Mega Man X3: Zero Project
// #ID = 8463

// Player
function p_state() => byte(0x0009DA)
         p_state_death = 0x0c
         p_state_hit = 0x0e
         p_state_teleporting = 0x22
         p_saber = 0x5c

function p_sub_state() => byte(0x0009DB)

function p_position_x() => word(0x0009DD)
function p_position_y() => word(0x0009E0)

function p_visible() => byte(0x0009E6)
function p_screen_x_2() => byte(0x0009FB)

function p_hp() => byte(0x0009FF)
function p_lives() => byte(0x001FB4)
function p_weapon() => byte(0x000A0B)
function p_animation() => byte(0x000A85)
function p_character() => byte(0x000A8E)
         char_x = 0x00
         char_zero = 0x02

function p_is_controlling() => byte(0x000a46) == 0x00
function p_damage_type() => byte(0x001F2F)
function p_last_shot() => byte(0x0010E2)
function p_bullets_on_screen() => byte(0x0a0d)

// Stage
function s_camera_x() => word(0x001e7a)
function s_camera_y() => word(0x001e7c)
function s_screen_x() => byte(0x001e7b)
function s_screen_y() => byte(0x001e7d)
function s_camera_progress() => byte(0x001E79)
function s_checkpoint() => byte(0x001FB5)

function s_snow_generator_destroyed() => byte(0x001f53)

function stage() => byte(0x001FAE)
         stage_intro = 0x00
         stage_blast_hornet = 0x01
         stage_blizzard_buffalo = 0x02
         stage_gravity_beetle = 0x03
         stage_toxic_seahorse = 0x04
         stage_volt_catfish = 0x05
         stage_crush_crawfish = 0x06
         stage_tunnel_rhino = 0x07
         stage_neon_tiger = 0x08
         stage_viles_stage = 0x09
         stage_doppler_stage_1 = 0x0a
         stage_doppler_stage_2 = 0x0b
         stage_doppler_stage_3 = 0x0c
         stage_doppler_stage_4 = 0x0d
         stage_destroyed_doppler_stage_2 = 0x0e
         stage_maverick_intro = 0x0f
         stage_weapon_get = 0x10

stages = {
   0: "Hunter Base",
   1: "Blast Hornet",
   2: "Blizzard Buffalo",
   3: "Gravity Beetle",
   4: "Toxic Seahorse",
   5: "Volt Catfish",
   6: "Crush Crawfish",
   7: "Tunnel Rhino",
   8: "Neon Tiger",
   9: "Vile's Stage",
   10: "Doppler's Lab 1",
   11: "Doppler's Lab 2",
   12: "Doppler's Lab 3",
   13: "Doppler's Lab 4",
   14: "Doppler's Lab 2 (Destroyed)",
   15: "Maverick Intro",
   16: "Weapon Get",
}
        
function stage_doppler() => byte(0x001FAF)
         prog_doppler_1 = 0x00
         prog_doppler_2 = 0x01
         prog_doppler_3 = 0x02
         prog_doppler_4 = 0x03
         prog_ending = 0x04
 
// Game
function g_difficulty() => byte(0xf4e0)
         diff_normal = 0x00
         diff_hard = 0x01
         diff_extreme = 0x02
         diff_new_game_plus = 0x10

function g_inside_game() => byte(0x000039)
                            inside_title_screen = 0x02
                            inside_game = 0x04

function g_engine_frames() => byte(0x0009cf)

function g_pause_menu_flag() => byte(0x001F37)
function g_enemy_type() => byte(0x001F57)
function g_doppler_stage_finished_flags() => byte(0x001FB0)
function g_intro_stage_finished() => byte(0x001FD3)
function g_music() => byte(0x00FFFD)
         music_x_intro_stage = 0x12
         music_blizzard_buffalo = 0x14
         music_doppler_lab_2 = 0x17
         music_boss_theme = 0x1a
         music_doppler_lab_4 = 0x1b
         music_stage_select = 0x1d
         music_password = 0x1e
         music_tunnel_rhinno = 0x1f
         music_boss_presentation = 0x20
         music_doppler_theme = 0x22
         music_stage_finish = 0x24
         music_maverick_intro = 0x25
         music_boss_fight_preparation = 0x27
         music_doppler_lab_3 = 0x29
         music_sigma_1st_theme = 0x2d
         music_zero_theme = 0x31

function entity_1_start() => byte(0x0d18)
         e_state = 0x00
         e_sub_state = 0x01
         e_pos_y = 0x08
         e_id = 0x0a
         e_pos_x = 0x22
         e_hp = 0x27

// Enemy ID Tables
enemy_sub_boss_neon_tiger = 0x27
enemy_sub_boss_tunnel_rhino = 0x30
enemy_sub_boss_acid_seahorse = 0x42
enemy_bit = 0x46
enemy_byte = 0x47
enemy_doppler = 0x48
enemy_vile_armor = 0x49
enemy_volt_kurageil = 0x4a 
enemy_sub_boss_blast_hornet = 0x4f
enemy_maoh_the_giant = 0x50
enemy_sub_boss_rex2000 = 0x51
enemy_blizzard_buffalo = 0x52
enemy_blast_hornet = 0x53
enemy_crush_crawfish = 0x54
enemy_tunnel_rhino = 0x55
enemy_neon_tiger = 0x56
enemy_toxic_seahorse = 0x57
enemy_volt_catfish = 0x58
enemy_gravity_beetle = 0x59
enemy_press_disposer = 0x5a
enemy_sub_boss_mosquitus = 0x5b
enemy_godkarmachine = 0x5d
enemy_sigma_1st = 0x5e
enemy_sigma_kaiser = 0x5f
enemy_vile_mkii = 0x61
enemy_sub_boss_mac = 0x62
enemy_goliath_vile = 0x63

// Helper functions

function took_damage() => p_state() == p_state_hit || p_state() == p_state_death
function used_weapon() {
    return  (p_bullets_on_screen() > prev(p_bullets_on_screen()) &&
            p_last_shot() != 0x00 &&
            p_last_shot() != 0x01 &&
            p_last_shot() != 0x02 &&
            p_last_shot() != 0x03 &&
            p_last_shot() != 0x06 &&
            p_last_shot() != 0x1d &&
            p_last_shot() != 0x1f &&
            p_last_shot() != 0x20 &&
            p_last_shot() != 0x26)
}

function x_saber_and_projectile_saber_protection() {
    return  never(p_bullets_on_screen() > prev(p_bullets_on_screen()) &&
                  p_is_controlling() &&
                  p_last_shot() == 0x02 && p_character() == char_x) && 
            never(p_bullets_on_screen() > prev(p_bullets_on_screen()) && 
                  p_is_controlling() &&
                  p_last_shot() == 0x02 && p_character() == char_zero && all_enhanced_chips() == 4 && g_difficulty() == diff_new_game_plus)
}
    

function sub_tank_has_been_used() {
    return (byte(0x1fb7) < prev(byte(0x1fb7)) ||
            byte(0x1fb8) < prev(byte(0x1fb8)) ||
            byte(0x1fb9) < prev(byte(0x1fb9)) ||
            byte(0x1fba) < prev(byte(0x1fba))
    )
}

function boss_defeated(boss_id)
{
    trigger = always_false()
    entity_base_address = 0x0d18
    for i in range(0, 9)
    {
        entity_start = entity_base_address + (i * 64)
        trigger =   trigger || 
                    unless(byte(entity_start + e_id) != boss_id ||
                           byte(entity_start + e_state) == 0x00) &&
                    once(byte(entity_start + e_hp) > 0 &&
                         prev(byte(entity_start + e_hp)) == 0) &&
                    trigger_when(byte(entity_start + e_sub_state) == 0x04)
    }
    return trigger
}

function boss_defeated_specific(boss_id)
{
    trigger = always_false()
    entity_base_address = 0x0d18
    for i in range(0, 9)
    {
        entity_start = entity_base_address + (i * 64)
        trigger =   trigger || 
                    trigger_when(byte(entity_start + e_id) == boss_id &&
                                 byte(entity_start + e_state) > 0x00 &&
                                 byte(entity_start + e_sub_state) == 0x04)
    }
    return trigger
}

function bit_byte_destroyed() => low4(0x1fd8) == 0x0f

function game_beaten() => stage() == stage_doppler_stage_4 && s_screen_x() == 0x0a

function save_protection() => g_music() != music_password

function all_ride_armors() => sum_of(range(0, 3), b => bit(b, 0x1fd7))
function all_enhanced_chips() => sum_of(range(4, 7), b => bit(b, 0x1fd7))
function all_armor_upgrades() => sum_of(range(0, 3), b => bit(b, 0xf418)) + sum_of(range(0, 3), b => bit(b, 0xf448))
function all_heart_tanks() => sum_of(range(0, 7), b => bit(b, 0xf41c)) + sum_of(range(0, 7), b => bit(b, 0xf44c))
function all_sub_tanks() => sum_of(range(4, 7), b => bit(b, 0xf41d)) + sum_of(range(4, 7), b => bit(b, 0xf44d))
function all_bosses_defeated() => sum_of(range(0, 7), b => bit(b, 0xf4e2))
function all_bosses_boss_rush_defeated() => sum_of(range(0, 7), b => bit(b, 0x1fda))

function head_has_been_obtained() => bit0(0xf418) > prev(bit0(0xf418)) || bit0(0xf448) > prev(bit0(0xf448))
function buster_has_been_obtained() => bit1(0xf418) > prev(bit1(0xf418)) || bit1(0xf448) > prev(bit1(0xf448))
function body_has_been_obtained() => bit2(0xf418) > prev(bit2(0xf418)) || bit2(0xf448) > prev(bit2(0xf448))
function foot_has_been_obtained() => bit3(0xf418) > prev(bit3(0xf418)) || bit3(0xf448) > prev(bit3(0xf448))

function enhanced_head_has_been_obtained() => bit4(0x1fd1) > prev(bit4(0x1fd1))
function enhanced_buster_has_been_obtained() => bit5(0x1fd1) > prev(bit5(0x1fd1))
function enhanced_body_has_been_obtained() => bit6(0x1fd1) > prev(bit6(0x1fd1))
function enhanced_foot_has_been_obtained() => bit7(0x1fd1) > prev(bit7(0x1fd1))

function golden_armor_has_been_obtained() => all_enhanced_chips() == 4 && prev(all_enhanced_chips()) <= 1

function bit_has_been_defeated() => bit0(0x1fd8) > prev(bit0(0x1fd8))
function bit_has_been_destroyed() => bit1(0x1fd8) > prev(bit1(0x1fd8))
function byte_has_been_defeated() => bit2(0x1fd8) > prev(bit2(0x1fd8))
function byte_has_been_destroyed() => bit3(0x1fd8) > prev(bit3(0x1fd8))
function vile_has_been_destroyed() => bit4(0x1fd8) > prev(bit4(0x1fd8))
function vile_has_been_defeated() => bit5(0x1fd8) > prev(bit5(0x1fd8))

function x_buster_has_been_obtained() => bit1(0x1fb2) > prev(bit1(0x1fb2))
function z_saber_has_been_obtained() => bit7(0x1fb2) > prev(bit7(0x1fb2))


// ============================================
// =============== NEW/REWORK =================
// ============================================

// Enhancement Chip
achievement("Even More Intelligent Now!", "Obtain the enhancement Head chip.", 3,
    trigger = save_protection() && enhanced_head_has_been_obtained() && stage() != stage_doppler_stage_1
)

achievement("The Bustah", "Obtain the enhancement Arm chip.", 3,
    trigger = save_protection() && enhanced_buster_has_been_obtained() && stage() != stage_doppler_stage_1
)

achievement("Guaranted Protection", "Obtain the enhancement Body chip.", 3,
    trigger = save_protection() && enhanced_body_has_been_obtained() && stage() != stage_doppler_stage_1
)

achievement("Double Dash", "Obtain the enhancement Foot chip.", 3,
    trigger = save_protection() && enhanced_foot_has_been_obtained() && stage() != stage_doppler_stage_1
)

// Z-Saber and X-Buster
achievement("Z-Saber", "Obtain the Z-Saber as X.", 5,
    trigger = save_protection() && z_saber_has_been_obtained()
)

// Sub Tanks
achievement("Extra Energy", "Obtain a Sub-Tank.", 2,
    trigger = save_protection() && all_sub_tanks() == 1 && prev(all_sub_tanks()) == 0
)

achievement("Sub-Tank Collector", "Obtain all Sub-Tanks.", 10,
    trigger = save_protection() && all_sub_tanks() == 4 && prev(all_sub_tanks()) == 3
)

// Progress
function beat_stage(title, stage) {
    achievement(
        title, format("Finish {0} stage.", stages[stage]), 5,  
        trigger = stage() == stage && g_music() == music_stage_finish)
}

achievement("Hunter Base", "Finish the introductory stage.", 5,  
            trigger = g_intro_stage_finished() == 1 && prev(g_intro_stage_finished()) == 0 && save_protection())

beat_stage("Parasitic Bomb", stage_blast_hornet)
beat_stage("Frost Shield", stage_blizzard_buffalo)
beat_stage("Gravity Well", stage_gravity_beetle)
beat_stage("Acid Burst", stage_toxic_seahorse)
beat_stage("Triad Thunder", stage_volt_catfish)
beat_stage("Spinning Blade", stage_crush_crawfish)
beat_stage("Tornado Fang", stage_tunnel_rhino)
beat_stage("Ray Splasher", stage_neon_tiger)

achievement("Buddharupa", "Defeat Godkarmachine and finish Doppler's Lab 1 stage.", 5,  
            trigger = stage() == stage_doppler_stage_1 && g_music() == music_stage_finish && !bit_byte_destroyed())

achievement("Trash Man", "Defeat Press Disposer and finish Doppler 1's Lab stage.", 5,  
            trigger = stage() == stage_doppler_stage_1 && g_music() == music_stage_finish && bit_byte_destroyed())

achievement("Jellyfish", "Defeat Volt Kurageil and finish Doppler's Lab 2 stage.", 5,  
            trigger = stage() == stage_doppler_stage_2 && g_music() == music_stage_finish)

achievement("Brown Bear", "Defeat Vile-MK II and finish Doppler's Lab 2 (Destroyed) stage.", 5,  
            trigger = stage() == stage_destroyed_doppler_stage_2 && g_music() == music_stage_finish)

achievement("Sick Doctor", "Defeat Dr. Doppler and finish Doppler's Lab 3.", 5,  
            trigger = stage() == stage_doppler_stage_3 && stage_doppler() > prev(stage_doppler()))


// Deathless
function beat_stage_deathless(title, stage, cheevo_id) {
    achievement(
        title, format("Finish {0} stage without dying, using only the buster and no use of Sub-Tanks.", stages[stage]), 10,  
        trigger =   never(stage() != stage) &&
                    once(s_checkpoint() == 0 && p_state() == p_state_teleporting && prev(p_state()) == 0x00) &&
                    never(sub_tank_has_been_used()) &&
                    never(used_weapon()) &&
                    never(p_state() == p_state_death) &&
                    trigger_when(g_music() == music_stage_finish),
        id = cheevo_id
        )
}

function beat_stage_deathless_stage(title, stage, cheevo_id, boss_bitflag) {
    achievement(
        title, format("Finish {0} stage without dying, using only the buster and no use of Sub-Tanks.", stages[stage]), 10,  
        trigger =   never(stage() != stage) &&
                    once(s_checkpoint() == 0 && p_state() == p_state_teleporting && prev(p_state()) == 0x00 && boss_bitflag == 0) &&
                    never(sub_tank_has_been_used()) &&
                    never(used_weapon()) &&
                    never(p_state() == p_state_death) &&
                    trigger_when(g_music() == music_stage_finish),
        id = cheevo_id
        )
}

beat_stage_deathless_stage("Unbeatable Through the Weapons Factory", stage_blast_hornet, 38612, bit1(0x00f4e2))
beat_stage_deathless_stage("Unbeatable Through the Frozen City", stage_blizzard_buffalo, 38613, bit6(0x00f4e2))
beat_stage_deathless_stage("Unbeatable Through the Airbone Aircraft Carrier", stage_gravity_beetle, 38614, bit5(0x00f4e2))
beat_stage_deathless_stage("Unbeatable Through the Giant Dam", stage_toxic_seahorse, 38615, bit0(0x00f4e2))
beat_stage_deathless_stage("Unbeatable Through the Power Control Center", stage_volt_catfish, 38616, bit2(0x00f4e2))
beat_stage_deathless_stage("Unbeatable Through the Shipyard", stage_crush_crawfish, 38617, bit3(0x00f4e2))
beat_stage_deathless_stage("Unbeatable Through the Quarry", stage_tunnel_rhino, 38618, bit7(0x00f4e2))
beat_stage_deathless_stage("Unbeatable Through the Safari Park", stage_neon_tiger, 38619, bit4(0x00f4e2))

beat_stage_deathless("Unbeatable Through the Disposal Facility", stage_doppler_stage_1, 203391)
beat_stage_deathless("Unbeatable Through the Doppler Lab", stage_doppler_stage_2, 203392)
beat_stage_deathless("Unbeatable Through the Destroyed Doppler Lab", stage_destroyed_doppler_stage_2, 203393)

achievement("Unbeatable Through the Boss Rush", "Finish Doppler's Lab 3 stage without dying, using only the buster and no use of Sub-Tanks.", 10,  
            trigger =   never(stage() != stage_doppler_stage_3) &&
                        once(s_checkpoint() == 0 && p_state() == p_state_teleporting && all_bosses_boss_rush_defeated() == 0) &&
                        never(sub_tank_has_been_used()) &&
                        never(used_weapon()) &&
                        never(p_state() == p_state_death) &&
                        trigger_when(stage_doppler() > prev(stage_doppler())),
            id = 203394
            )

// Damageless
function damageless_boss(title, boss_name, boss_id, points, cheevo_id) {
    achievement(title, format("Defeat {0} without taking damage, using buster only (Projectile Saber and X Saber not allowed).", boss_name), points,
                trigger =   boss_defeated(boss_id) &&
                            never(took_damage()) &&
                            never(used_weapon()) &&
                            x_saber_and_projectile_saber_protection(),
                id = cheevo_id)
}

damageless_boss("Makku", "Mac", enemy_sub_boss_mac, 5, 0)
damageless_boss("Wāmushīkā R", "Worm Seeker-R", enemy_sub_boss_neon_tiger, 5, 0)
damageless_boss("Heru Kurasshā", "Hell Crusher", enemy_sub_boss_tunnel_rhino, 5, 38609)
damageless_boss("Hotarīkā", "Hotareeca", enemy_sub_boss_acid_seahorse, 4, 0)
damageless_boss("Genjibo and Shurikein", "Shurikein", enemy_sub_boss_blast_hornet, 5, 0)
damageless_boss("Mechaniloid D-Rex", "REX-2000", enemy_sub_boss_rex2000, 10, 0)
damageless_boss("Mosukītasu", "Mosquitus", enemy_sub_boss_mosquitus, 5, 0)

damageless_boss("Vajurila FF", "Bit", enemy_bit, 10, 38627)
damageless_boss("Mandarela BB", "Byte", enemy_byte, 10, 38628)

damageless_boss("Maō Za Jaianto", "Maoh the Giant", enemy_maoh_the_giant, 25, 0)
damageless_boss("Frozen Buffalio", "Blizzard Buffalo", enemy_blizzard_buffalo, 10, 38603)
damageless_boss("Explose Horneck", "Blast Hornet", enemy_blast_hornet, 10, 38602)
damageless_boss("Scissors Shrimper", "Crush Crawfish", enemy_crush_crawfish, 10, 38607)
damageless_boss("Screw Masaider", "Tunnel Rhino", enemy_tunnel_rhino, 10, 38608)
damageless_boss("Shining Tigerd", "Neon Tiger", enemy_neon_tiger, 10, 38610)
damageless_boss("Acid Seaforce", "Toxic Seahorse", enemy_toxic_seahorse, 25, 38605)
damageless_boss("Electro Namazuros", "Volt Catfish", enemy_volt_catfish, 25, 38606)
damageless_boss("Gravity Beetbood", "Gravity Beetle", enemy_gravity_beetle, 10, 38604)
// damageless_boss("Puresu Disupoza", "Press Disposer", enemy_press_disposer, 25, 38806)
damageless_boss("Godkarmachine O Inary", "Godkarmachine", enemy_godkarmachine, 10, 38630)
damageless_boss("Boruto Kurageru", "Volt Kurageil", enemy_volt_kurageil, 10, 38807)
damageless_boss("Ride Armor", "Vile's Ride Armor", enemy_vile_armor, 5, 38611)
damageless_boss("Bad Doctor", "Dr. Doppler", enemy_doppler, 10, 38635)


achievement("Pureso Disupoza", "Defeat Press Disposer without taking damage, using buster only (Projectile Saber and X Saber not allowed).", 25,
                trigger =   unless(byte(0x000d18 + e_id) != enemy_press_disposer ||
                                byte(0x000d18 + e_state) == 0x00) &&
                            once(byte(0x000d18 + e_hp) > 0 &&
                                prev(byte(0x000d18 + e_hp)) == 0) &&
                            trigger_when(byte(0x000d18 + e_sub_state) == 0x04) &&
                            never(took_damage()) &&
                            never(used_weapon()) &&
                            x_saber_and_projectile_saber_protection(),
                id = 38806)

achievement("Goliath Vile MK-II", "Defeat Ride Armor Goliath and Vile-MK II on Doppler's Lab 2 without taking damage, using buster only (Projectile Saber and X Saber not allowed).", 25,
                trigger =   boss_defeated_specific(enemy_vile_mkii) &&
                            never(stage() != stage_destroyed_doppler_stage_2) &&
                            once(g_music() == music_doppler_theme && prev(g_music()) == music_doppler_lab_2) &&
                            never(took_damage()) &&
                            never(used_weapon()) &&
                            x_saber_and_projectile_saber_protection()
            )

achievement("Kaiser, Uma Grande Cerveja", "Defeat Sigma 1st and Kaiser Sigma without taking damage (Projectile Saber and X Saber not allowed).", 25,
                trigger =   boss_defeated_specific(enemy_sigma_kaiser) &&
                            once(g_music() == music_sigma_1st_theme && prev(g_music()) == music_doppler_lab_4) &&
                            never(took_damage()) &&
                            never(p_damage_type() == 0x04) &&
                            x_saber_and_projectile_saber_protection()
            )

achievement("X and Zero vs. Dopple Town", "Beat the entire boss rush without taking damage.", 25,
                trigger =   once(g_music() == music_boss_fight_preparation && prev(g_music()) == music_doppler_lab_3 &&  all_bosses_boss_rush_defeated() == 0) &&
                            trigger_when(all_bosses_boss_rush_defeated() == 8 && prev(all_bosses_boss_rush_defeated()) == 7) &&
                            never(took_damage())
            )

// Gimmick
achievement("Stopping the Snow", "Destroy the snow generator at Blizzard Buffalo stage.", 2,
            trigger = stage() == stage_blizzard_buffalo &&
                      s_snow_generator_destroyed() == 1 && prev(s_snow_generator_destroyed()) == 0)

// Beat the Game
achievement(
    title = "Here We Go Again...", description = "Beat the game on New Game+.", points = 25,
    trigger =   g_difficulty() == diff_new_game_plus &&
                trigger_when(game_beaten())
)

// Comment to avoid overriding.
// achievement(
//     title = "Dopple Town Speedrun", description = "Beat the game within 50 minutes.", points = 50,
//     trigger =   (once(stage() == stage_intro &&
//                      s_checkpoint() == 1 && prev(s_checkpoint()) == 0) &&
//                 never(tally(180000, g_engine_frames() != prev(g_engine_frames())))) &&
//                 trigger_when(game_beaten())
// )

achievement(
    title = "Lemons Across Dopple Town", description = "Beat the game using only the buster (one session, Projectile Saber and X Saber not allowed).", points = 25,
    trigger =   unless(stage() == stage_weapon_get) &&
                (once(stage() == stage_intro &&
                     s_checkpoint() == 1 && prev(s_checkpoint()) == 0) &&
                never(used_weapon()) &&
                x_saber_and_projectile_saber_protection() &&
                trigger_when(game_beaten()))
)

// ============================================
// =============== LEADERBOARDS ===============
// ============================================

leaderboard("Speedrun Any%", "Beat the game the fastest as possible (Any%).", 
            stage() == stage_intro && s_checkpoint() == 1 && prev(s_checkpoint()) == 0 && g_difficulty() == diff_normal,
            stage() == stage_intro && s_checkpoint() == 0, 
            game_beaten(), 
            measured(g_engine_frames() != prev(g_engine_frames())), 
            format="FRAMES", lower_is_better=true
            )

leaderboard("Speedrun NG+", "Beat the game the fastest as possible (New Game Plus).", 
            stage() == stage_intro && s_checkpoint() == 1 && prev(s_checkpoint()) == 0 && g_difficulty() == diff_new_game_plus,
            stage() == stage_intro && s_checkpoint() == 0, 
            game_beaten(), 
            measured(g_engine_frames() != prev(g_engine_frames())), 
            format="FRAMES", lower_is_better=true
            )

function lb_stage_speedrun(stage, boss_bitflag) {
    leaderboard(format("{0} Speedrun", stages[stage]), format("Finish {0} stage and its boss the fastest as possible.", stages[stage]), 
                stage() == stage && s_checkpoint() == 0 && p_state() == p_state_teleporting && prev(p_state()) == 0x00 && boss_bitflag == 0,
                (stage() != stage && s_checkpoint() == 0) || (s_checkpoint() == 0 && p_state() == p_state_death) || (g_music() == music_password), 
                g_music() == music_stage_finish, 
                measured(g_engine_frames() != prev(g_engine_frames())), 
                format="FRAMES", lower_is_better=true
                )
}

function lb_stage_doppler_speedrun(stage) {
    leaderboard(format("{0} Speedrun", stages[stage]), format("Finish {0} stage and its boss the fastest as possible.", stages[stage]), 
                stage() == stage && s_checkpoint() == 0 && p_state() == p_state_teleporting && prev(p_state()) == 0x00,
                (stage() != stage && s_checkpoint() == 0) || (s_checkpoint() == 0 && p_state() == p_state_death) || (g_music() == music_password), 
                stage_doppler() > prev(stage_doppler()), 
                measured(g_engine_frames() != prev(g_engine_frames())), 
                format="FRAMES", lower_is_better=true
                )
}

leaderboard("Hunter Base Speedrun", "Finish Hunter Base stage and its boss the fastest as possible.", 
                stage() == stage_intro && s_checkpoint() == 1 && prev(s_checkpoint()) == 0 && bit0(0x001fd3) == 0,
                (stage() != stage_intro && s_checkpoint() == 0) || (s_checkpoint() == 0 && p_state() == p_state_death) || (g_music() == music_password), 
                g_intro_stage_finished() == 1 && prev(g_intro_stage_finished()) == 0 && save_protection(), 
                measured(g_engine_frames() != prev(g_engine_frames())), 
                format="FRAMES", lower_is_better=true
                )


lb_stage_speedrun(stage_blast_hornet, bit1(0x00f4e2))
lb_stage_speedrun(stage_blizzard_buffalo, bit6(0x00f4e2))
lb_stage_speedrun(stage_gravity_beetle, bit5(0x00f4e2))
lb_stage_speedrun(stage_toxic_seahorse, bit0(0x00f4e2))
lb_stage_speedrun(stage_volt_catfish, bit2(0x00f4e2))
lb_stage_speedrun(stage_crush_crawfish, bit3(0x00f4e2))
lb_stage_speedrun(stage_tunnel_rhino, bit7(0x00f4e2))
lb_stage_speedrun(stage_neon_tiger, bit4(0x00f4e2))
lb_stage_doppler_speedrun(stage_doppler_stage_1)
lb_stage_doppler_speedrun(stage_doppler_stage_2)
lb_stage_doppler_speedrun(stage_destroyed_doppler_stage_2)
lb_stage_doppler_speedrun(stage_doppler_stage_3)
// lb_stage_doppler_speedrun(stage_doppler_stage_4)

leaderboard("Hunter Base Speedrun", "Finish Hunter Base stage and its boss the fastest as possible.", 
                stage() == stage_intro && s_checkpoint() == 1 && prev(s_checkpoint()) == 0 && bit0(0x001fd3) == 0,
                (stage() != stage_intro && s_checkpoint() == 0) || (s_checkpoint() == 0 && p_state() == p_state_death) || (g_music() == music_password), 
                g_intro_stage_finished() == 1 && prev(g_intro_stage_finished()) == 0 && save_protection(), 
                measured(g_engine_frames() != prev(g_engine_frames())), 
                format="FRAMES", lower_is_better=true
                )

// ============================================
// =================== MISC ===================
// ============================================


achievement(
    title = "Mega Heart", description = "Collect a Heart Tank.", points = 2, id = 38622,
    trigger =   save_protection() && all_heart_tanks() == 1 && prev(all_heart_tanks()) == 0
)

// Armor
achievement(
    title = "Radar AI", description = "Obtain the Head upgrade.", points = 2, id = 38601,
    trigger = save_protection() && head_has_been_obtained()
)

achievement(
    title = "Hyper Buster", description = "Obtain the Arm upgrade.", points = 2, id = 38599,
    trigger = save_protection() && buster_has_been_obtained()
)

achievement(
    title = "Third Armor", description = "Obtain the Body upgrade.", points = 2, id = 38600,
    trigger = save_protection() && body_has_been_obtained()
)

achievement(
    title = "A Brand New Foot", description = "Obtain the Foot upgrade.", points = 2, id = 38598,
    trigger = save_protection() && foot_has_been_obtained()
)

achievement(
    title = "Armor Collector", description = "Obtain all Ride Armors.", points = 10, id = 38624,
    trigger = save_protection() && measured(all_ride_armors() == 4) && prev(all_ride_armors()) == 3
)

achievement(
    title = "Tank Man", description = "Have all 8 hearts with the Armor apgrade.", points = 10, id = 38623,
    trigger =   save_protection() && 
                (
                    (all_heart_tanks() == 8 && prev(all_heart_tanks()) == 7 && bit2(0xf418) == 1 || bit2(0xf448) == 1) ||
                    (all_heart_tanks() == 8 && body_has_been_obtained())
                )
)

achievement(
    title = "Black Zero", description = "Obtain the Black Armor or Golden Chip upgrade.", points = 10, id = 38631,
    trigger = save_protection() && stage() == stage_doppler_stage_1 && golden_armor_has_been_obtained()
)

achievement(
    title = "Revolutionary Anti-Virus", description = "Beat the game.", points = 10, id = 38633,
    trigger = game_beaten()
)

// ============================================
// ================== DEMOTE ==================
// ============================================

// achievement(
//     title = "Four of the Second", description = "Defeat all the bosses from the second row (one session).", points = 5, id = 38621,
//     trigger = once(byte(0x001FC0) == 255) && once(byte(0x001FC2) == 255) && once(byte(0x001FC4) == 255) && 
//               once(byte(0x001FCA) == 255)
// )

// achievement(
//     title = "Four of the First", description = "Defeat all the bosses from the first row (one session).", points = 5, id = 38620,
//     trigger = once(byte(0x001FBC) == 255) && once(byte(0x001FC8) == 255) && once(byte(0x001FC6) == 255) && 
//               once(byte(0x001FBE) == 255)
// )

// achievement(
//     title = "Special Hunter", description = "Complete all eight stages using only Zero", points = 10, id = 38629,
//     trigger = unless(p_character() != 2) && unless(p_animation() != 132) && unless(g_music() != 36) && 
//               once(stage() == 1) && once(stage() == 2) && once(stage() == 3) && once(stage()
//                == 4) && once(stage() == 5) && once(stage() == 6) && once(stage() == 7) && 
//               once(stage() == 8)
// )

// achievement(
//     title = "Dopple Town Survivalist", description = "Reach Doppler's stages without dying (don't use password).", points = 25, id = 38625,
//     trigger = never(p_lives() < prev(p_lives())) && once(stage() == 0) && once(stage() == 1) && 
//               once(stage() == 2) && once(stage() == 3) && once(stage() == 4) && once(stage()
//                == 5) && once(stage() == 6) && once(stage() == 7) && once(stage() == 8) && 
//               stage() == 10 && once(g_music() == 37) && once(byte(0x00002C) == 0) && once(byte(0x00002C) ==
//                1) && once(byte(0x00002C) == 2) && once(byte(0x00002C) == 3) && once(byte(0x00002C) == 4) && 
//               once(byte(0x00002C) == 5) && once(byte(0x00002C) == 6) && once(byte(0x00002C) == 7) && byte(0x00002C) == 8 && 
//               once(g_music() == 18)
// )


// ============================================
// =============== REWORK LATER ===============
// ============================================

achievement(
    title = "Unbeatable Through the Underground Lab", description = "Finish Doppler's Lab 4 using buster only and no use of Sub Tanks.", points = 10, id = 38632,
    trigger =   never(stage() != stage_doppler_stage_4) &&
                once(s_screen_x() == 1) && 
                never(sub_tank_has_been_used()) &&
                trigger_when(game_beaten())
)

achievement(
    title = "Default Mode", description = "Finish all 8 stages without having any upgrade, heart tank, sub tank or ride armor.", points = 25, id = 38626,
    trigger =   all_armor_upgrades() == 0 &&
                all_heart_tanks() == 0 &&
                all_sub_tanks() == 0 &&
                all_ride_armors() == 0 &&
                g_inside_game() == inside_game &&
                trigger_when(all_bosses_defeated() == 8 && prev(all_bosses_defeated()) == 7)
)

achievement(
    title = "Sigma Mode", description = "Beat the game without dying (one session).", points = 50, id = 38634,
    trigger =   once(stage() == stage_intro &&
                s_checkpoint() == 0) &&
                g_inside_game() == inside_game &&
                never(p_state() == p_state_death) &&
                trigger_when(game_beaten())
)

// ============================================
// =================== JUNK ===================
// ============================================

// achievement(
//     title = "Unbeatable through the Factory", description = "Complete Blast Hornet stage without dying, using only the Buster.", points = 10, id = 38612,
//     trigger = stage() == 1 && once(byte(0x001E7B) == 1) && byte(0x000D4C) == 255 && never(stage() != 1) && 
//               repeated(20, byte(0x000D3F) > prev(byte(0x000D3F))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && 
//               never(byte(0x001FBE) < prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && 
//               never(byte(0x001FC2) < prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && 
//               never(byte(0x001FCA) < prev(byte(0x001FCA))) && never(byte(0x001FC6) < prev(byte(0x001FC6))) && 
//               never(p_lives() < prev(p_lives())) && g_music() == 36
// )

// achievement(
//     title = "Unbeatable through the Snowcity", description = "Complete Blizzard Buffalo stage without dying, using only the Buster.", points = 10, id = 38613,
//     trigger = stage() == 2 && once(byte(0x001E7B) == 1) && byte(0x000D4C) == 255 && never(stage() != 2) && 
//               repeated(20, byte(0x000D3F) > prev(byte(0x000D3F))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && 
//               never(byte(0x001FBE) < prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && 
//               never(byte(0x001FC2) < prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && 
//               never(byte(0x001FCA) < prev(byte(0x001FCA))) && never(byte(0x001FC6) < prev(byte(0x001FC6))) && 
//               never(p_lives() < prev(p_lives()))
// )

// achievement(
//     title = "Unbeatable through the Tower", description = "Complete Gravity Beetle stage without dying, using only the Buster.", points = 10, id = 38614,
//     trigger = stage() == 3 && once(byte(0x001E7B) == 1) && byte(0x000D4C) == 255 && never(stage() != 3) && 
//               repeated(20, byte(0x000D3F) > prev(byte(0x000D3F))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && 
//               never(byte(0x001FBE) < prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && 
//               never(byte(0x001FC2) < prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && 
//               never(byte(0x001FCA) < prev(byte(0x001FCA))) && never(byte(0x001FC6) < prev(byte(0x001FC6))) && 
//               never(p_lives() < prev(p_lives()))
// )

// achievement(
//     title = "Unbeatable through the Sewer", description = "Complete Toxic Seahorse stage without dying, using only the Buster.", points = 10, id = 38615,
//     trigger = stage() == 4 && once(byte(0x001E7B) == 1) && byte(0x000D4C) == 255 && never(stage() != 4) && 
//               repeated(20, byte(0x000D3F) > prev(byte(0x000D3F))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && 
//               never(byte(0x001FBE) < prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && 
//               never(byte(0x001FC2) < prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && 
//               never(byte(0x001FCA) < prev(byte(0x001FCA))) && never(byte(0x001FC6) < prev(byte(0x001FC6))) && 
//               never(p_lives() < prev(p_lives())) && once(g_music() == 36)
// )

// achievement(
//     title = "Unbeatable through the Volt", description = "Complete Volt Catfish stage without dying , using only the Buster.", points = 10, id = 38616,
//     trigger = stage() == 5 && once(byte(0x001E7B) == 1) && byte(0x000D4C) == 255 && never(stage() != 5) && 
//               repeated(20, byte(0x000D3F) > prev(byte(0x000D3F))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && 
//               never(byte(0x001FBE) < prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && 
//               never(byte(0x001FC2) < prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && 
//               never(byte(0x001FCA) < prev(byte(0x001FCA))) && never(byte(0x001FC6) < prev(byte(0x001FC6))) && 
//               never(p_lives() < prev(p_lives()))
// )

// achievement(
//     title = "Unbeatable through the Crawfish", description = "Complete Crush Crawfish stage without dying, using only the Buster.", points = 10, id = 38617,
//     trigger = stage() == 6 && once(byte(0x001E7B) == 1) && byte(0x000D4C) == 255 && never(stage() != 6) && 
//               repeated(20, byte(0x000D3F) > prev(byte(0x000D3F))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && 
//               never(byte(0x001FBE) < prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && 
//               never(byte(0x001FC2) < prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && 
//               never(byte(0x001FCA) < prev(byte(0x001FCA))) && never(byte(0x001FC6) < prev(byte(0x001FC6))) && 
//               never(p_lives() < prev(p_lives()))
// )

// achievement(
//     title = "Unbeatable through the Tunnel", description = "Complete Tunnel Rhino stage without dying, using only the Buster.", points = 10, id = 38618,
//     trigger = stage() == 7 && once(byte(0x001E7B) == 1) && byte(0x000D4C) == 255 && never(stage() != 7) && 
//               repeated(20, byte(0x000D3F) > prev(byte(0x000D3F))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && 
//               never(byte(0x001FBE) < prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && 
//               never(byte(0x001FC2) < prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && 
//               never(byte(0x001FCA) < prev(byte(0x001FCA))) && never(byte(0x001FC6) < prev(byte(0x001FC6))) && 
//               never(p_lives() < prev(p_lives())) && once(g_music() == 36)
// )

// achievement(
//     title = "Unbeatable through the Forest", description = "Complete Neon Tiger stage without dying using only the Buster", points = 10, id = 38619,
//     trigger = stage() == 8 && once(byte(0x001E7B) == 1) && byte(0x000D4C) == 255 && never(stage() != 8) && 
//               repeated(20, byte(0x000D3F) > prev(byte(0x000D3F))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && 
//               never(byte(0x001FBE) < prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && 
//               never(byte(0x001FC2) < prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && 
//               never(byte(0x001FCA) < prev(byte(0x001FCA))) && never(byte(0x001FC6) < prev(byte(0x001FC6))) && 
//               never(p_lives() < prev(p_lives())) && g_music() == 36
// )

// achievement(
//     title = "Vajurila FF", description = "Defeat Bit without consuming Sub-Tank, using Buster only.", points = 5, id = 38627,
//     trigger = once(bit0(0x001FD8) > prev(bit0(0x001FD8))) && bit0(0x001FD8) == 1 && repeated(32, byte(0x000D7F) >
//                prev(byte(0x000D7F))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && never(byte(0x001FBE) <
//                prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && never(byte(0x001FC2) <
//                prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && never(byte(0x001FCA) <
//                prev(byte(0x001FCA))) && never(byte(0x001FC8) < prev(byte(0x001FC8))) && never(p_hp() >
//                prev(p_hp())) && never((stage() == 1 && byte(0x001E7B) == 20)) && never((stage() ==
//                1 && byte(0x001E7B) == 10))
// )

// achievement(
//     title = "Mandarela BB", description = "Defeat Byte without consuming Sub-Tank, using Buster only.", points = 5, id = 38628,
//     trigger = once(bit2(0x001FD8) > prev(bit2(0x001FD8))) && bit2(0x001FD8) == 1 && repeated(32, byte(0x000D3F) >
//                prev(byte(0x000D3F))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && never(byte(0x001FBE) <
//                prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && never(byte(0x001FC2) <
//                prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && never(byte(0x001FCA) <
//                prev(byte(0x001FCA))) && never(byte(0x001FC8) < prev(byte(0x001FC8))) && never(p_hp() >
//                prev(p_hp())) && never((stage() == 1 && byte(0x001E7B) == 20)) && never((stage() ==
//                1 && byte(0x001E7B) == 10))
// )

// achievement(
//     title = "Explose Horneck", description = "Defeat Blast Hornet without taking damage, using Buster only.", points = 25, id = 38602,
//     trigger = stage() == 1 && once(byte(0x000D4C) == 1) && byte(0x000D4C) == 255 && never(stage() != 1) && 
//               repeated(10, byte(0x000D3F) > prev(byte(0x000D3F))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && 
//               never(byte(0x001FBE) < prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && 
//               never(byte(0x001FC2) < prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && 
//               never(byte(0x001FCA) < prev(byte(0x001FCA))) && never(byte(0x001FC8) < prev(byte(0x001FC8))) && 
//               never(byte(0x001FC6) < prev(byte(0x001FC6))) && never(byte(0x000A08) == 8) && never(p_screen_x_2() < 30)
// )

// achievement(
//     title = "Frozen Buffalio", description = "Defeat Blizzard Buffalo without taking damage, using Buster only.", points = 25, id = 38603,
//     trigger = stage() == 2 && once(byte(0x000D4C) == 1) && byte(0x000D4C) == 255 && never(stage() != 2) && 
//               repeated(10, byte(0x000D3F) > prev(byte(0x000D3F))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && 
//               never(byte(0x001FBE) < prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && 
//               never(byte(0x001FC2) < prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && 
//               never(byte(0x001FCA) < prev(byte(0x001FCA))) && never(byte(0x001FC6) < prev(byte(0x001FC6))) && 
//               never(p_hp() < prev(p_hp()))
// )

// achievement(
//     title = "Gravity Beetbood", description = "Defeat Gravity Beetle without taking damage, using Buster only.", points = 25, id = 38604,
//     trigger = stage() == 3 && once(byte(0x000D4C) == 1) && byte(0x000D4C) == 255 && never(stage() != 3) && 
//               repeated(10, byte(0x000D3F) > prev(byte(0x000D3F))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && 
//               never(byte(0x001FBE) < prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && 
//               never(byte(0x001FC2) < prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && 
//               never(byte(0x001FCA) < prev(byte(0x001FCA))) && never(byte(0x001FC8) < prev(byte(0x001FC8))) && 
//               never(p_hp() < prev(p_hp()))
// )

// achievement(
//     title = "Acid Seaforce", description = "Defeat Toxic Seahorse without taking damage, using Buster only.", points = 25, id = 38605,
//     trigger = stage() == 4 && once(byte(0x000D4C) == 1) && byte(0x000D4C) == 255 && never(stage() != 4) && 
//               repeated(10, byte(0x000D3F) > prev(byte(0x000D3F))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && 
//               never(byte(0x001FBE) < prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && 
//               never(byte(0x001FC2) < prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && 
//               never(byte(0x001FCA) < prev(byte(0x001FCA))) && never(byte(0x001FC8) < prev(byte(0x001FC8))) && 
//               never(byte(0x001FC6) < prev(byte(0x001FC6))) && never(p_hp() < prev(p_hp())) && 
//               never(p_screen_x_2() < 23)
// )

// achievement(
//     title = "Electro Namazuros", description = "Defeat Volt Catfish without taking damage, using Buster only.", points = 25, id = 38606,
//     trigger = stage() == 5 && once(byte(0x000D4C) == 1) && byte(0x000D4C) == 255 && never(stage() != 5) && 
//               never(byte(0x001FBC) < prev(byte(0x001FBC))) && never(byte(0x001FBE) < prev(byte(0x001FBE))) && 
//               never(byte(0x001FC0) < prev(byte(0x001FC0))) && never(byte(0x001FC2) < prev(byte(0x001FC2))) && 
//               never(byte(0x001FC4) < prev(byte(0x001FC4))) && never(byte(0x001FCA) < prev(byte(0x001FCA))) && 
//               never(byte(0x001FC8) < prev(byte(0x001FC8))) && never(p_hp() < prev(p_hp())) && 
//               never(byte(0x001FC6) < prev(byte(0x001FC6))) && g_music() == 36 && never(p_screen_x_2() < 12) && 
//               once(p_screen_x_2() == 12)
// )

// achievement(
//     title = "Scissors Shrimper", description = "Defeat Crush Crawfish without taking damage, using Buster only.", points = 25, id = 38607,
//     trigger = stage() == 6 && once(byte(0x000D4C) == 1) && byte(0x000D4C) == 255 && never(stage() != 6) && 
//               repeated(10, byte(0x000D3F) > prev(byte(0x000D3F))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && 
//               never(byte(0x001FBE) < prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && 
//               never(byte(0x001FC2) < prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && 
//               never(byte(0x001FCA) < prev(byte(0x001FCA))) && never(byte(0x001FC8) < prev(byte(0x001FC8))) && 
//               never(p_hp() < prev(p_hp())) && never(byte(0x001FC6) < prev(byte(0x001FC6)))
// )

// achievement(
//     title = "Mini Rhino", description = "Destroy the Sub-Boss from Rhino stage without taking damage.", points = 10, id = 38609,
//     trigger = stage() == 7 && byte(0x000D3F) == 128 && byte(0x000D4C) == 255 && never(stage() != 7) && 
//               once(byte(0x001E7B) == 15) && never(p_hp() < prev(p_hp()))
// )

// achievement(
//     title = "Screw Masaider", description = "Defeat Tunnel Rhino without taking damage, using Buster only.", points = 25, id = 38608,
//     trigger = stage() == 7 && once(byte(0x000D4C) == 1) && byte(0x000D4C) == 255 && never(stage() != 7) && 
//               repeated(10, byte(0x000D3F) > prev(byte(0x000D3F))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && 
//               never(byte(0x001FBE) < prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && 
//               never(byte(0x001FC2) < prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && 
//               never(byte(0x001FCA) < prev(byte(0x001FCA))) && never(byte(0x001FC8) < prev(byte(0x001FC8))) && 
//               never(byte(0x001FC6) < prev(byte(0x001FC6))) && never(p_hp() < prev(p_hp())) && 
//               never(p_screen_x_2() < 22)
// )

// achievement(
//     title = "Shining Tigerd", description = "Defeat Neon Tiger without taking damage, using Buster only.", points = 25, id = 38610,
//     trigger = stage() == 8 && once(byte(0x000D4C) == 1) && byte(0x000D4C) == 255 && never(stage() != 8) && 
//               repeated(10, byte(0x000D3F) > prev(byte(0x000D3F))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && 
//               never(byte(0x001FBE) < prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && 
//               never(byte(0x001FC2) < prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && 
//               never(byte(0x001FCA) < prev(byte(0x001FCA))) && never(byte(0x001FC8) < prev(byte(0x001FC8))) && 
//               never(p_hp() < prev(p_hp())) && never(byte(0x001FC6) < prev(byte(0x001FC6))) && 
//               never(p_screen_x_2() < 28)
// )

// achievement(
//     title = "Vile MK-2", description = "Defeat Vile's Ride Armor without taking damage, using Buster only.", points = 10, id = 38611,
//     trigger = stage() == 9 && once(byte(0x001E7B) == 7) && byte(0x000D3F) == 0 && never(stage() != 9) && 
//               repeated(32, byte(0x000D3F) > prev(byte(0x000D3F))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && 
//               never(byte(0x001FBE) < prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && 
//               never(byte(0x001FC2) < prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && 
//               never(byte(0x001FCA) < prev(byte(0x001FCA))) && never(byte(0x001FC8) < prev(byte(0x001FC8))) && 
//               never(p_hp() < prev(p_hp())) && once(byte(0x000D3F) == 32)
// )

// achievement(
//     title = "Godkarmachine O Inary", description = "Defeat Godkarmachine without taking damage, using Buster only.", points = 25, id = 38630,
//     trigger = stage() == 10 && byte(0x000DFF) == 0 && never(stage() != 10) && repeated(32, byte(0x000DFF)
//                > prev(byte(0x000DFF))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && never(byte(0x001FBE) <
//                prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && never(byte(0x001FC2) <
//                prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && never(byte(0x001FCA) <
//                prev(byte(0x001FCA))) && never(byte(0x001FC6) < prev(byte(0x001FC6))) && never(p_hp() <
//                prev(p_hp()))
// )

// achievement(
//     title = "Bad Doctor", description = "Defeat Doppler without taking damage, using Buster only.", points = 25, id = 38635,
//     trigger = stage() == 12 && never(stage() != 12) && once(byte(0x001E7B) == 9) && never(byte(0x001FBC) <
//                prev(byte(0x001FBC))) && never(byte(0x001FBE) < prev(byte(0x001FBE))) && never(byte(0x001FC0) <
//                prev(byte(0x001FC0))) && never(byte(0x001FC2) < prev(byte(0x001FC2))) && never(byte(0x001FC4) <
//                prev(byte(0x001FC4))) && never(byte(0x001FCA) < prev(byte(0x001FCA))) && never(byte(0x001FC6) <
//                prev(byte(0x001FC6))) && never(p_hp() < prev(p_hp())) && p_animation() == 125 && 
//               byte(0x000D3F) == 0
// )


// achievement(
//     title = "Hardcore Best Fight", description = "After destroying the Press Disposer's nose, defeat him without taking damage using buster only", points = 0, id = 200093,
//     trigger = trigger_when(byte(0x000D58) == 0) && trigger_when(entity_1_start() == 128) && never((byte(0x0000BF) < 16 &&
//                byte(0x000D4F) > 0)) && never(byte(0x000D22) != 90) && once(g_music() == 23) && 
//               never((p_character() != 2 && p_state() == 92)) && never((byte(0x000A0D) > prev(byte(0x000A0D)) &&
//                p_last_shot() != 0 && p_last_shot() != 1 && p_last_shot() != 2 && p_last_shot() != 3 &&
//                p_last_shot() != 6 && p_last_shot() != 29 && p_last_shot() != 38))
// )

// achievement(
//     title = "Boruto Kurageru", description = "Defeat Volt Kurageil without taking damage using only the Buster", points = 6, id = 38807,
//     trigger = stage() == 11 && g_music() == 36 && never(stage() != 11) && repeated(32, byte(0x000DFF)
//                > prev(byte(0x000DFF))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && never(byte(0x001FBE) <
//                prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && never(byte(0x001FC2) <
//                prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && never(byte(0x001FCA) <
//                prev(byte(0x001FCA))) && never(byte(0x001FC6) < prev(byte(0x001FC6))) && never(p_hp() <
//                prev(p_hp())) && bit4(0x001FD8) == 1
// )

// achievement(
//     title = "Puresu Disupoza", description = "Defeat Press Disposer without taking damage using only the Buster", points = 6, id = 38806,
//     trigger = stage() == 10 && g_music() == 36 && never(stage() != 10) && repeated(32, byte(0x000DFF)
//                > prev(byte(0x000DFF))) && never(byte(0x001FBC) < prev(byte(0x001FBC))) && never(byte(0x001FBE) <
//                prev(byte(0x001FBE))) && never(byte(0x001FC0) < prev(byte(0x001FC0))) && never(byte(0x001FC2) <
//                prev(byte(0x001FC2))) && never(byte(0x001FC4) < prev(byte(0x001FC4))) && never(byte(0x001FCA) <
//                prev(byte(0x001FCA))) && never(byte(0x001FC6) < prev(byte(0x001FC6))) && never(p_hp() <
//                prev(p_hp())) && bit1(0x001FD8) == 1 && bit3(0x001FD8) == 1
// )
