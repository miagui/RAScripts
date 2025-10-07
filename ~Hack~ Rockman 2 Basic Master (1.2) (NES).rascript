// ~Hack~ Rockman 2: Basic Master (1.2)
// #ID = 1690

function game_frame_counter() => byte(0x001c)
function game_state() => byte(0x000029)
function game_stage() => byte(0x00002A)
		 STG_STONE_MAN = 0x00
		 STG_TORNADO_MAN = 0x01
		 STG_SNAKE_MAN = 0x02
		 STG_GEMINI_MAN = 0x03
		 STG_BLADE_MAN = 0x04
		 STG_PLUG_MAN = 0x05
		 STG_RING_MAN = 0x06
		 STG_FLAME_MAN = 0x07
		 STG_WILY_CASTLE_1 = 0x08
		 STG_WILY_CASTLE_2 = 0x09
		 STG_WILY_CASTLE_3 = 0x0A
		 STG_WILY_CASTLE_4 = 0x0B
		 STG_WILY_CASTLE_5 = 0x0C
		 STG_WILY_CASTLE_6 = 0x0D

function game_bgm_sfx_queue() => byte(0x000580)
		 BGM_STAGE_INTRO = 0x0A
		 BGM_BOSS_FIGHT = 0x0B
		 BGM_STAGE_SELECT = 0x0C
		 BGM_TITLE_SCREEN = 0x0D
		 BGM_SUB_MENU = 0x10
		 BGM_STAGE_FINISHED = 0x13
		 BGM_WILY_DEFEATED = 0x14
		 BGM_WEAPON_GET = 0x15

function stage_completed() => bit0(0x0000BD)
function stage_screen_transition() => byte(0x0037)

// Player states
function player_hp() => byte(0x0006C0)
function player_lives() => byte(0x0000A8)
function player_invincibility_frames() => byte(0x00004B)
function player_weapon_equipped() => byte(0x0000A9)
function player_sprite_state() => byte(0x000420)
function player_animation_state() => byte(0x000400)
function player_screen() => byte(0x000440)
function player_fire_button() => bit1(0x0023)
function player_jump_button() => bit0(0x0023)
function player_dpad_buttons() => high4(0x0023)

function player_ground_collision() => byte(0x0033)
function player_snake_speed() => byte(0x0071)

// Player resources
function player_e_tanks() => byte(0x0000A7)
function player_sub_weapon_ammo() => byte(0x000070)
function player_weapons_unlocked() => byte(0x00009A)
function player_weapons_unlocked_bitcount() => bitcount(0x00009A)
function player_items_unlocked() => byte(0x00009B)

function player_ring_ammo() => byte(0x00009C)
function player_tornado_ammo() => byte(0x00009D)
function player_blade_ammo() => byte(0x00009E)
function player_flame_ammo() => byte(0x00009F)
function player_snake_ammo() => byte(0x0000A0)
function player_stone_ammo() => byte(0x0000A1)
function player_plug_ammo() => byte(0x0000A2)
function player_gemini_ammo() => byte(0x0000A3)

function player_item_1_eddie_ammo() => byte(0x0000A4)
function player_item_2_free_movement_ammo() => byte(0x0000A5)
function player_item_3_self_destruct() => byte(0x0000A6)

// Boss
function boss_hp() => byte(0x0006C1)
function boss_id() => byte(0x0000B3)
function boss_attack_pattern() => byte(0x0000B2)
function boss_animation_id() => byte(0x000401)
function boss_sprite_state() => byte(0x000421)
function boss_screen() => byte(0x000441)

function entity_1_id() => byte(0x00041F)
function entity_1_state() => byte(0x00043F)

stages = {
    "Stone Man": 0x00,
    "Tornado Man": 0x01,
    "Snake Man": 0x02,
    "Gemini Man": 0x03,
    "Blade Man": 0x04,
    "Plug Man": 0x05,
    "Ring Man": 0x06,
    "Flame Man": 0x07,
    "Wily Castle 1": 0x08,
    "Wily Castle 2": 0x09,
    "Wily Castle 3": 0x0A,
    "Wily Castle 4": 0x0B,
    "Wily Castle 5": 0x0C,
    "Wily Castle 6": 0x0D
}

// Utility

function took_damage() {
    return(
        player_invincibility_frames() > prev(player_invincibility_frames()) ||
        player_hp() < prev(player_hp())
    )
}

function boss_defeated() {
    return(
        boss_hp() == 0 && prev(boss_hp()) > 0
    )
}

function weapon_used() {
    return(
        (
			(player_weapon_equipped() != 0 && player_fire_button() > prev(player_fire_button()) && game_state() == 0x0e) ||
			(any_of(range(0x009c, 0x00a6), weapon => byte(weapon) < prev(byte(weapon) )))
		)
    )
}

function boss_fight_started() => boss_hp() == 0x01 && prev(boss_hp()) == 0x00
function boss_defeated() => boss_hp() == 0x00 && prev(boss_hp()) > 0x00
function game_running_frames() => game_frame_counter() != prev(game_frame_counter())

function reset_stage_select() => never(game_bgm_sfx_queue() == BGM_STAGE_SELECT) && 
								 never(game_bgm_sfx_queue() == BGM_SUB_MENU)

// =========================================
//                Progression              
// =========================================

achievement("Stone Quake", "Obtain the Stone Quake weapon!", 4, type="progression",
			trigger = 	game_stage() == STG_STONE_MAN &&
						game_bgm_sfx_queue() == BGM_WEAPON_GET &&
						prev(game_bgm_sfx_queue()) != BGM_WEAPON_GET
			)

achievement("Tornado Loop", "Obtain the Tornado Loop weapon!", 4, type="progression",
			trigger = 	game_stage() == STG_TORNADO_MAN &&
						game_bgm_sfx_queue() == BGM_WEAPON_GET &&
						prev(game_bgm_sfx_queue()) != BGM_WEAPON_GET
			)

achievement("Snake Buster", "Obtain the Snake Buster weapon!", 4, type="progression",
			trigger = 	game_stage() == STG_SNAKE_MAN &&
						game_bgm_sfx_queue() == BGM_WEAPON_GET &&
						prev(game_bgm_sfx_queue()) != BGM_WEAPON_GET
			)

achievement("Gemini Time", "Obtain the Gemini Time weapon!", 4, type="progression",
			trigger = 	game_stage() == STG_GEMINI_MAN &&
						game_bgm_sfx_queue() == BGM_WEAPON_GET &&
						prev(game_bgm_sfx_queue()) != BGM_WEAPON_GET
			)

achievement("Blade Claw", "Obtain the Blade Claw weapon!", 4, type="progression",
			trigger = 	game_stage() == STG_BLADE_MAN &&
						game_bgm_sfx_queue() == BGM_WEAPON_GET &&
						prev(game_bgm_sfx_queue()) != BGM_WEAPON_GET
			)

achievement("Plug Thunder", "Obtain the Plug Thunder weapon!", 4, type="progression",
			trigger = 	game_stage() == STG_PLUG_MAN &&
						game_bgm_sfx_queue() == BGM_WEAPON_GET &&
						prev(game_bgm_sfx_queue()) != BGM_WEAPON_GET
			)

achievement("Ring Chaser", "Obtain the Ring Chaser weapon!", 4, type="progression",
			trigger = 	game_stage() == STG_RING_MAN &&
						game_bgm_sfx_queue() == BGM_WEAPON_GET &&
						prev(game_bgm_sfx_queue()) != BGM_WEAPON_GET
			)

achievement("Flame Candle", "Obtain the Flame Candle weapon!", 4, type="progression",
			trigger = 	game_stage() == STG_FLAME_MAN &&
						game_bgm_sfx_queue() == BGM_WEAPON_GET &&
						prev(game_bgm_sfx_queue()) != BGM_WEAPON_GET
			)

achievement("Rounder II BM", "Finish Wily Castle 1.", 4, type="progression",
			trigger = 	game_stage() == STG_WILY_CASTLE_1 &&
						game_bgm_sfx_queue() == BGM_STAGE_FINISHED &&
						prev(game_bgm_sfx_queue()) != BGM_STAGE_FINISHED
			)

achievement("Purple Devil", "Finish Wily Castle 2.", 4, type="progression",
			trigger = 	game_stage() == STG_WILY_CASTLE_2 &&
						game_bgm_sfx_queue() == BGM_STAGE_FINISHED &&
						prev(game_bgm_sfx_queue()) != BGM_STAGE_FINISHED
			)

achievement("Kanto Gym Leader", "Finish Wily Castle 3.", 4, type="progression",
			trigger = 	game_stage() == STG_WILY_CASTLE_3 &&
						game_bgm_sfx_queue() == 0x1b &&
						prev(game_bgm_sfx_queue()) != 0x1b
			)

achievement("Bass.EXE", "Finish Wily Castle 4.", 4, type="progression",
			trigger = 	game_stage() == STG_WILY_CASTLE_4 &&
						game_bgm_sfx_queue() == BGM_STAGE_FINISHED &&
						prev(game_bgm_sfx_queue()) != BGM_STAGE_FINISHED
			)


achievement("Basic Robots", "Finish Wily Castle 5.", 5, type="progression",
			trigger = 	game_stage() == STG_WILY_CASTLE_5 &&
						game_bgm_sfx_queue() == BGM_STAGE_FINISHED &&
						prev(game_bgm_sfx_queue()) != BGM_STAGE_FINISHED
			)

achievement("Basic Master", "Beat the game.", 10, type="win_condition",
			trigger = 	game_stage() == STG_WILY_CASTLE_6 &&
						game_bgm_sfx_queue() == BGM_WILY_DEFEATED &&
						prev(game_bgm_sfx_queue()) != BGM_WILY_DEFEATED
			)

// =========================================
//                Damageless              
// =========================================

function achiev_boss_damageless_buster_only(title, boss_id, boss_name, points) {
	achievement(title, format("Defeat {0} without taking damage and using only the Mega Buster.", boss_name), points,
			trigger = 	reset_stage_select() &&
						once(boss_fight_started()) &&
						never(boss_id() != boss_id) &&
						never(took_damage()) &&
						never(weapon_used()) &&
						trigger_when(boss_defeated())
			)
}
// Robot Master
achiev_boss_damageless_buster_only("Basic Stone Master", STG_STONE_MAN, "Stone Man", 10)
achiev_boss_damageless_buster_only("Basic Tornado Master", STG_TORNADO_MAN, "Tornado Man", 10)
achiev_boss_damageless_buster_only("Basic Snake Master", STG_SNAKE_MAN, "Snake Man", 10)
achiev_boss_damageless_buster_only("Basic Gemini Master", STG_GEMINI_MAN, "Gemini Man", 25)
achiev_boss_damageless_buster_only("Basic Blade Master", STG_BLADE_MAN, "Blade Man", 25)
achiev_boss_damageless_buster_only("Basic Plug Master", STG_PLUG_MAN, "Plug Man", 10)
achiev_boss_damageless_buster_only("Basic Ring Master", STG_RING_MAN, "Ring Man", 10)
achiev_boss_damageless_buster_only("Basic Flame Master", STG_FLAME_MAN, "Flame Man", 10)

// Wily Fortress
achiev_boss_damageless_buster_only("Basic Rounder II Master", STG_WILY_CASTLE_1, "Rounder II", 25)
achiev_boss_damageless_buster_only("Basic Purple Devil Master", STG_WILY_CASTLE_2, "Purple Devil", 25)

achievement("Basic Porygon Master", "Defeat Porygon & Porygon2 without taking damage and using only the Mega Buster.", 10,
			trigger = 	reset_stage_select() &&
						once(game_bgm_sfx_queue() == 0x1a) &&
						never(boss_id() != STG_WILY_CASTLE_3) &&
						never(took_damage()) &&
						never(weapon_used()) &&
						trigger_when(game_bgm_sfx_queue() == 0x1b)
			)

// achiev_boss_damageless_buster_only("Basic Porygon Master", STG_WILY_CASTLE_3, "Porygon & Porygon2", 25)
achiev_boss_damageless_buster_only("Basic Bass.EXE Master", STG_WILY_CASTLE_4, "Bass.EXE", 25)
achiev_boss_damageless_buster_only("Basic Robot Master", STG_WILY_CASTLE_5, "Original Robot Masters", 25)

achievement("Basic Wily Master", "Defeat all phases of Dr. Wily without taking damage.", 10,
			trigger = 	reset_stage_select() &&
						never(game_stage() != STG_WILY_CASTLE_6) &&
						once(player_screen() == 0x1d) &&
						once(boss_fight_started()) &&
						never(player_animation_state() == 0x18) &&
						trigger_when(game_bgm_sfx_queue() == BGM_WILY_DEFEATED)
			)

achievement("Red Bull with Lemons Hits Different", "Defeat all phases of Dr. Wily using only the Mega Buster and without using E-Tanks.", 25,
			trigger = 	reset_stage_select() &&
						never(game_stage() != STG_WILY_CASTLE_6) &&
						once(player_screen() == 0x1d) &&
						once(boss_fight_started()) &&
						never(weapon_used()) &&
						never(player_e_tanks() < prev(player_e_tanks())) &&
						trigger_when(game_bgm_sfx_queue() == BGM_WILY_DEFEATED)
			)

// =========================================
//              Stage Damageless              
// =========================================

function achiev_stage_damageless(title, stage_name, first_screen, last_screen, points) {
	achievement(title, format("Reach {0}'s boss door without taking damage and without using Flame Candle or Gemini Time alt. fire.", stage_name), points,
				trigger = once(player_screen() == first_screen &&
							   player_animation_state() == 0x1a
							  ) &&
						  never(game_stage() != stages[stage_name]) &&
						  never(took_damage()) &&
						  never(player_weapon_equipped() == 0x04) &&
						  trigger_when(player_screen() == last_screen && prev(player_screen()) == last_screen - 1)  
				)
}

achiev_stage_damageless("Blaze Heatnix", "Stone Man", 0x00, 0x16, 10)
achiev_stage_damageless("Top Man", "Tornado Man", 0x00, 0x14, 10)
// achiev_stage_damageless("Bonne Forces", "Snake Man", 0x00, 0x16, 10)
achiev_stage_damageless("Ocean Planet Aquanet", "Gemini Man", 0x00, 0x14, 10)
achiev_stage_damageless("Kaizor No Umi Uma", "Blade Man", 0x00, 0x16, 10)
achiev_stage_damageless("Volt Catfish", "Plug Man", 0x00, 0x12, 10)
achiev_stage_damageless("Pond Garden", "Ring Man", 0x00, 0x14, 10)
achiev_stage_damageless("Devil's Tower", "Flame Man", 0x00, 0x14, 10)

achiev_stage_damageless("Gate Laboratory I", "Wily Castle 1", 0x18, 0x29, 5)
// achiev_stage_damageless("Gate Laboratory II", "Wily Castle 2", 0x16, 0x26, 5)
achiev_stage_damageless("Dragon's Altar", "Wily Castle 3", 0x18, 0x27, 10)
achiev_stage_damageless("And You Will Know the Truth", "Wily Castle 4", 0x16, 0x26, 10)
achiev_stage_damageless("Rockman World 5 Opening", "Wily Castle 6", 0x14, 0x1d, 5)


achievement("Bonne Forces", "Reach Snake Man's boss door without taking damage and without using Flame Candle or Gemini Time alt. fire.", 10,
				trigger = once(player_screen() == 0x00 &&
							   player_animation_state() == 0x1a
							  ) &&
						  never(game_stage() != stages["Snake Man"]) &&
						  never(player_animation_state() == 0x18) &&
						  never(player_weapon_equipped() == 0x04) &&
						  trigger_when(player_screen() == 0x16 && prev(player_screen()) == 0x15)  
				)

achievement("Gate Laboratory II", "Reach Wily Castle 2's boss door without taking damage and without using Flame Candle or Gemini Time alt. fire.", 5,
				trigger = once(player_screen() == 0x16 &&
							   player_animation_state() == 0x1a
							  ) &&
						  never(game_stage() != stages["Wily Castle 2"]) &&
						  never(player_animation_state() == 0x18) &&
						  never(player_weapon_equipped() == 0x04) &&
						  trigger_when(player_screen() == 0x26 && prev(player_screen()) == 0x25)  
				)

// =========================================
//              Item Collection              
// =========================================

collectibles_ring = [0x0142]
collectibles_tornado = [0x0141, 0x0146]
collectibles_blade = [0x0140, 0x0145]
collectibles_flame = [0x0141]
collectibles_snake = [0x0141, 0x0146]
collectibles_stone = [0x0140, 0x014a]
collectibles_plug = [0x0142, 0x0144]
collectibles_gemini = [0x0145]
collectibles_wily2 = [0x014a]
collectibles_wily3 = [0x0148]
collectibles_wily4 = [0x0151]
collectibles_wily5 = [0x0148, 0x014d, 0x0153]
collectibles_wily6 = [0x0145, 0x0146]

achievement("Pond Garden Explorer", "Collect a 1-UP on Ring Man's stage.", 2,
			trigger = 	never(game_stage() != STG_RING_MAN) &&
						measured(tally_of(collectibles_ring, length(collectibles_ring), item => once(byte(item) == 0 && prev(byte(item)) > 0) )) &&
						never(any_of(collectibles_ring, item => byte(item) > prev(byte(item))))
			)

achievement("Top Explorer", "Collect a 1-UP and an E-Tank on Tornado Man's stage.", 2,
			trigger = 	never(game_stage() != STG_TORNADO_MAN) &&
						measured(tally_of(collectibles_tornado, length(collectibles_tornado), item => once(byte(item) == 0 && prev(byte(item)) > 0))) &&
						never(any_of(collectibles_tornado, item => byte(item) > prev(byte(item))))
			)

achievement("Old Castle Explorer", "Collect a 1-UP and an E-Tank on Blade Man's stage.", 3,
			trigger = 	never(game_stage() != STG_BLADE_MAN) &&
						measured(tally_of(collectibles_blade, length(collectibles_blade), item => once(byte(item) == 0 && prev(byte(item)) > 0))) &&
						never(any_of(collectibles_blade, item => byte(item) > prev(byte(item))))
			)

achievement("Tower Explorer", "Collect a 1-UP on Flame Man's stage.", 3,
			trigger = 	never(game_stage() != STG_FLAME_MAN) &&
						measured(tally_of(collectibles_flame, length(collectibles_flame), item => once(byte(item) == 0 && prev(byte(item)) > 0))) &&
						never(any_of(collectibles_flame, item => byte(item) > prev(byte(item))))
			)

achievement("Snake Explorer", "Collect a 1-UP and an E-Tank on Snake Man's stage.", 3,
			trigger = 	never(game_stage() != STG_SNAKE_MAN) &&
						measured(tally_of(collectibles_snake, length(collectibles_snake), item => once(byte(item) == 0 && prev(byte(item)) > 0))) &&
						never(any_of(collectibles_snake, item => byte(item) > prev(byte(item))))
			)

achievement("Magma Area Explorer", "Collect both 1-UPs on Stone Man's stage.", 3,
			trigger = 	never(game_stage() != STG_STONE_MAN) &&
						game_state() == 0x0e && // specific check for this achievement because Stone Man is ID 00, and the achievement triggers on soft reset.
						measured(tally_of(collectibles_stone, length(collectibles_stone), item => once(byte(item) == 0 && prev(byte(item)) > 0))) &&
						never(any_of(collectibles_stone, item => byte(item) > prev(byte(item))))
			)

achievement("Power Control Explorer", "Collect a 1-UP and an E-Tank on Plug Man's stage.", 3,
			trigger = 	never(game_stage() != STG_PLUG_MAN) &&
						measured(tally_of(collectibles_plug, length(collectibles_plug), item => once(byte(item) == 0 && prev(byte(item)) > 0))) &&
						never(any_of(collectibles_plug, item => byte(item) > prev(byte(item))))
			)

achievement("Ocean Planet Explorer", "Collect a 1-UP on Gemini Man's stage.", 2,
			trigger = 	never(game_stage() != STG_GEMINI_MAN) &&
						measured(tally_of(collectibles_gemini, length(collectibles_gemini), item => once(byte(item) == 0 && prev(byte(item)) > 0))) &&
						never(any_of(collectibles_gemini, item => byte(item) > prev(byte(item))))
			)

achievement("Gate's Lab Explorer", "Collect a 1-UP on Wily Castle 2.", 2,
			trigger = 	never(game_stage() != STG_WILY_CASTLE_2) &&
						measured(tally_of(collectibles_wily2, length(collectibles_wily2), item => once(byte(item) == 0 && prev(byte(item)) > 0) )) &&
						never(any_of(collectibles_wily2, item => byte(item) > prev(byte(item))))
			)

achievement("Pokemon Explorer", "Collect a 1-UP on Wily Castle 3.", 2,
			trigger = 	never(game_stage() != STG_WILY_CASTLE_3) &&
						measured(tally_of(collectibles_wily3, length(collectibles_wily3), item => once(byte(item) == 0 && prev(byte(item)) > 0) )) &&
						never(any_of(collectibles_wily3, item => byte(item) > prev(byte(item))))
			)

achievement("Battle Network Explorer", "Collect a 1-UP on Wily Castle 4.", 2,
			trigger = 	never(game_stage() != STG_WILY_CASTLE_4) &&
						measured(tally_of(collectibles_wily4, length(collectibles_wily4), item => once(byte(item) == 0 && prev(byte(item)) > 0) )) &&
						never(any_of(collectibles_wily4, item => byte(item) > prev(byte(item))))
			)

achievement("Evil Castle Explorer", "Collect three 1-UPs on Wily Castle 5.", 3,
			trigger = 	never(game_stage() != STG_WILY_CASTLE_5) &&
						measured(tally_of(collectibles_wily5, length(collectibles_wily5), item => once(byte(item) == 0 && prev(byte(item)) > 0) )) &&
						never(any_of(collectibles_wily5, item => byte(item) > prev(byte(item))))
			)

achievement("Sunstar Explorer", "Collect a 1-UP and an E-Tank on Wily Castle 6.", 3,
			trigger = 	never(game_stage() != STG_WILY_CASTLE_6) &&
						measured(tally_of(collectibles_wily6, length(collectibles_wily6), item => once(byte(item) == 0 && prev(byte(item)) > 0) )) &&
						never(any_of(collectibles_wily6, item => byte(item) > prev(byte(item))))
			)


// =========================================
//                  Misc              
// =========================================

achievement("Candle Man", "Walk over a spike for 3 seconds without having invincibility frames.", 2,
			trigger = 	repeated(180, player_invincibility_frames() == 1) &&
						never(player_ground_collision() != 0x03) &&
						never(player_hp() == 0)	
			)

achievement("Snake Speedster", "Stack your speed up to two times using Snake Buster's alternative shot.", 2,
			trigger = 	player_snake_speed() == 2 &&
						prev(player_snake_speed()) == 1
			)

achievement("Magma Speedster", "Reach Stone Man's boss door within 52 seconds.", 5,
			trigger = 	reset_stage_select() &&
						never(game_stage() != STG_STONE_MAN) &&
						once(player_screen() == 0x00 && player_animation_state() == 0x1a) &&
						never(tally(3120, once(player_screen() == 0x00 && player_animation_state() == 0x1a) && game_running_frames())) &&
						trigger_when(player_screen() == 0x16 && prev(player_screen() == 0x15))
			)

achievement("18 Steps in Hell", "Get through Flame Man's maze having scrolled the screen just 18 times.", 5,
			trigger = 	reset_stage_select() &&
						never(game_stage() != STG_FLAME_MAN) &&
						once(player_screen() == 0x00 && player_animation_state() == 0x1a) &&
						never(repeated(19, stage_screen_transition() > prev(stage_screen_transition()))) &&
						trigger_when(player_screen() == 0x12)
			)

achievement("Tactical-Man", "Defeat Porygon & Porygon2 without using the directional or jump buttons.", 5,
			trigger = 	reset_stage_select() &&
						once(game_bgm_sfx_queue() == 0x1a) &&
						never(boss_id() != STG_WILY_CASTLE_3) &&
						never(player_dpad_buttons() != 0 && game_state() == 0x0e) &&
						never(player_jump_button() != 0 && game_state() == 0x0e) &&
						trigger_when(game_bgm_sfx_queue() == 0x1b)
			)

achievement("Basic Buster", "Finish the boss rush using only the Mega Buster and without using E-Tanks", 10,
			trigger =	once(player_screen() == 0x18 &&
							 player_animation_state() == 0x1a
							) &&
						never(game_stage() != STG_WILY_CASTLE_5) &&
						never(weapon_used()) &&
						never(player_e_tanks() < prev(player_e_tanks())) &&
						trigger_when(player_screen() == 0x28 && prev(player_screen()) == 0x27)
			
			)

achievement("Snake & Flame Master I", "From the start of the game, defeat all Robot Masters in less than 16 minutes.", 25,
			trigger = 	never(game_bgm_sfx_queue() == BGM_TITLE_SCREEN) &&
						once(player_screen() == 0x00 && player_animation_state() == 0x1a && player_weapons_unlocked_bitcount() == 0) &&
						never(tally(57600, once(player_screen() == 0x00 && player_animation_state() == 0x1a && player_weapons_unlocked_bitcount() == 0) && game_running_frames())) &&
						trigger_when(player_weapons_unlocked_bitcount() == 8 && prev(player_weapons_unlocked_bitcount()) == 7) &&
						disable_when(game_bgm_sfx_queue() == BGM_SUB_MENU, game_state() == 0x0e) && 
						disable_when(game_bgm_sfx_queue() == BGM_STAGE_SELECT, game_state() == 0x0e) && 
						disable_when(game_bgm_sfx_queue() == BGM_WEAPON_GET, game_state() == 0x0e)
			)

achievement("Snake & Flame Master II", "Starting from Wily Castle 1, reach and defeat Dr. Wily in less than 16 minutes.", 25,
			trigger = 	never(game_bgm_sfx_queue() == BGM_TITLE_SCREEN) &&
						once(game_stage() == STG_WILY_CASTLE_1 && player_screen() == 0x18 && player_animation_state() == 0x1a && player_weapons_unlocked_bitcount() == 8) &&
						never(tally(57600, once(game_stage() == STG_WILY_CASTLE_1 && player_screen() == 0x18 && player_animation_state() == 0x1a && player_weapons_unlocked_bitcount() == 8) && game_running_frames())) &&
						trigger_when(game_bgm_sfx_queue() == BGM_WILY_DEFEATED) &&
						disable_when(game_bgm_sfx_queue() == BGM_SUB_MENU, game_state() == 0x0e) && 
						disable_when(game_bgm_sfx_queue() == BGM_STAGE_SELECT, game_state() == 0x0e) && 
						disable_when(game_bgm_sfx_queue() == BGM_WEAPON_GET, game_state() == 0x0e)
			)


// =========================================
//                Leaderboards              
// =========================================

leaderboard("Basic Master - Robot Masters Speedrun", "Best time to finish all Robot Masters stages (IGT).",
		   start = player_screen() == 0x00 && player_animation_state() == 0x1a && player_weapons_unlocked_bitcount() == 0,
		   cancel = game_bgm_sfx_queue() == BGM_TITLE_SCREEN,
		   submit = player_weapons_unlocked_bitcount() == 8 && prev(player_weapons_unlocked_bitcount()) == 7,
		   value = 	disable_when(game_bgm_sfx_queue() == BGM_SUB_MENU, game_state() == 0x0e) && 
		   			disable_when(game_bgm_sfx_queue() == BGM_STAGE_SELECT, game_state() == 0x0e) && 
		   			disable_when(game_bgm_sfx_queue() == BGM_WEAPON_GET, game_state() == 0x0e) && 
		   		 	game_running_frames(),
		   format = "FRAMES", lower_is_better=true)

leaderboard("Basic Master - Wily Castle Speedrun", "Best time to finish all Wily Castle stages (IGT).",
		   start = game_stage() == STG_WILY_CASTLE_1 && player_screen() == 0x18 && player_animation_state() == 0x1a && player_weapons_unlocked_bitcount() == 8,
		   cancel = game_bgm_sfx_queue() == BGM_TITLE_SCREEN,
		   submit = game_bgm_sfx_queue() == BGM_WILY_DEFEATED,
		   value = 	disable_when(game_bgm_sfx_queue() == BGM_SUB_MENU, game_state() == 0x0e) && 
		   			disable_when(game_bgm_sfx_queue() == BGM_STAGE_SELECT, game_state() == 0x0e) && 
		   			disable_when(game_bgm_sfx_queue() == BGM_WEAPON_GET, game_state() == 0x0e) && 
		   		 	game_running_frames(),
		   format = "FRAMES", lower_is_better=true)

leaderboard("Basic Master - Full Game Speedrun", "Best time to finish the game (IGT).",
		   start = player_screen() == 0x00 && player_animation_state() == 0x1a && player_weapons_unlocked_bitcount() == 0,
		   cancel = game_bgm_sfx_queue() == BGM_TITLE_SCREEN,
		   submit = game_bgm_sfx_queue() == BGM_WILY_DEFEATED,
		   value = 	disable_when(game_bgm_sfx_queue() == BGM_SUB_MENU, game_state() == 0x0e) && 
		   			disable_when(game_bgm_sfx_queue() == BGM_STAGE_SELECT, game_state() == 0x0e) && 
		   			disable_when(game_bgm_sfx_queue() == BGM_WEAPON_GET, game_state() == 0x0e) && 
		   		 	game_running_frames(),
		   format = "FRAMES", lower_is_better=true)