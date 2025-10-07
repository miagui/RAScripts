// Fighter's History: Mizoguchi Kikiippatsu!!
// #ID = 2872

// Settings
function settings_speed() => byte(0x000881)
function settings_difficulty_level() => byte(0x000888)
function settings_disable_time_limit() => byte(0x00088B)

// Game State
function game_screen() => byte(0x0000C0)
		 GS_GAME_INTRODUCTION_1 = 0x0E
		 GS_GAME_INTRODUCTION_2 = 0x0F
		 GS_TITLE_SCREEN = 0x10
		 GS_MAIN_MENU = 0x11
		 GS_CONFIGURATION = 0x17
		 GS_BUTTON_CONFIGURATION = 0x18
		 GS_TYPE_EDIT_SCREEN = 0x19
		 GS_VERSUS_MODE_SELECT = 0x20
		 GS_EXTRA_MODE_SELECT = 0x21
		 GS_STAGE_SELECT = 0x22
		 GS_CHARACTER_SELECT = 0x23
		 GS_VERSUS_SCREEN = 0x24
		 GS_CHOOSING_TAG_MATCH_MODE = 0x26
		 GS_CHOOSING_SURVIVAL_MODE = 0x27
		 GS_VICTORY_SCREEN = 0x28
		 GS_CONTINUE = 0x2A
		 GS_CHOOSING_PRACTICE_MODE = 0x30

function game_stage() => byte(0x0000C1)
function game_mode() => word(0x000931)
		 MODE_MIZOGUCHI_STORY = 0x0000
		 MODE_CPU_BATTLE = 0x0001
		 MODE_VERSUS = 0x0002
		 MODE_TAG_MATCH = 0x0003
		 MODE_SURVIVAL = 0x0103
		 MODE_PRACTICE = 0x0203
		 MODE_CONFIGURATION = 0x0004

function arcade_match() => byte(0x0009BF)
function round_timer() => byte(0x0000B5)
function match_round() => byte(0x00180f)

// Practice Mode
function practice_highest_hit_combo() => byte(0x00083E)
function practice_timer() => word(0x000951)
function practice_current_trial() => byte(0x0009BA)
function practice_trial_reps_completed() => byte(0x0009BB)
function practice_hits_needed() => byte(0x0009BD)
function p1_hit_combo() => byte(0x000CF6)
function p2_hit_combo() => byte(0x000CF9)

// Player 1 - Data
function p1_character() => byte(0x000A00)
function p1_hp() => byte(0x000AA0)
function p1_weak_point() => byte(0x000AA1)
function p1_rounds_won() => byte(0x000AA8)
function p1_cpu_active() => bit0(0x000AAB)

function p1_score_decimal() => tbyte(0x000A68)

function p1_speed_stats_type_edit() => byte(0x000AA2)
function p1_attack_stats_type_edit() => byte(0x000AA3)
function p1_defence_stats_type_edit() => byte(0x000AA4)

// Player 2 - Data
function p2_character() => byte(0x000C00)
function p2_hp() => byte(0x000CA0)
function p2_weak_point() => byte(0x000CA1)
function p2_rounds_won() => byte(0x000CA8)
function p2_cpu_active() => bit0(0x000CAB)

// Records
function p1_wins() => byte(0x001817)
function p1_losses() => byte(0x001818)
function p2_wins() => byte(0x001819)
function p2_losses() => byte(0x00181A)

// Tag Team HP
function p1_tag_character_1_hp() => byte(0x01F8A0)
function p1_tag_character_2_hp() => byte(0x01F9A0)

characters = {
    "Mizoguchi": 0x80,
    "Yungmie": 0x81,
    "Lee": 0x82,
    "Zazie": 0x83,
    "Feilin": 0x84,
    "Ryoko": 0x85,
    "Clown": 0x86,
    "Karnov": 0x87,
    "Chelnov": 0x88
}


// =========================================
//             Utility Functions              
// =========================================

function p1_only() => p1_cpu_active() == 0 && never(p2_cpu_active() == 0)
function arcade_beaten() => arcade_match() == 8 && p1_wins() > prev(p1_wins())
function arcade_start() => arcade_match() == 0 && game_screen() == GS_VERSUS_SCREEN

function p1_won_a_round() => p1_rounds_won() > prev(p1_rounds_won())
function p1_won_a_match() => p1_rounds_won() == 2 && prev(p1_rounds_won()) != 2

function default_type_stats() {
	return(
		p1_attack_stats_type_edit() == 2 &&
		p1_defence_stats_type_edit() == 2 &&
		p1_speed_stats_type_edit() == 2
	)
}

function glasscannon_type_stats() {
	return(
		p1_attack_stats_type_edit() == 4 &&
		p1_defence_stats_type_edit() == 0 &&
		p1_speed_stats_type_edit() == 4
	)
}

function juggernaut_type_stats() {
	return(
		p1_attack_stats_type_edit() == 4 &&
		p1_defence_stats_type_edit() == 4 &&
		p1_speed_stats_type_edit() == 0
	)
}

// =========================================
//              Beat the game              
// =========================================

function finish_cpu_battle(title, char) {
	achievement(title, format("Finish CPU Battle using only {0} on Level-3 difficulty.", char), 10, type="win_condition",
				trigger = 	p1_only() &&
							settings_difficulty_level() >= 2 &&
							never(game_mode() != MODE_CPU_BATTLE) &&
							once(arcade_start() && p1_character() == characters[char]) &&
							never(p1_character() != characters[char] && p1_won_a_round()) &&
							p1_character() == characters[char] &&
							trigger_when(arcade_beaten())
				)
}

finish_cpu_battle("Mizoguchi in the Setting Sun", "Mizoguchi")
finish_cpu_battle("The Birth of a Queen", "Yungmie")
finish_cpu_battle("The Path Towards Kung Fu", "Lee")
finish_cpu_battle("The King of Savannah", "Zazie")
finish_cpu_battle("Movie Star", "Feilin")
finish_cpu_battle("Ryoko, Currently Training...", "Ryoko")
finish_cpu_battle("Spooky Basement", "Clown")
finish_cpu_battle("Errand of God", "Karnov")
finish_cpu_battle("ATOMIC RUNNER", "Chelnov")

achievement("Mizoguchi... WINS!!!", "Finish Mizoguchi's Story Mode.", 25, type="win_condition",
			trigger = 	game_mode() == MODE_MIZOGUCHI_STORY &&
						game_screen() == 0x73 &&
						prev(game_screen()) == 0x09
			)

achievement("One-Shot Crisis Mizoguchi!!", "Finish CPU Battle without using a continue on default settings.", 25,
			trigger = 	p1_only() &&
						settings_difficulty_level() >= 2 &&
						never(game_mode() != MODE_CPU_BATTLE) &&
						once(arcade_match() == 0 && default_type_stats()) &&
						never(!default_type_stats()) &&
						never(p2_rounds_won() == 2 && prev(p2_rounds_won()) == 1) &&
						trigger_when(arcade_beaten())
			)

achievement("Glasscannon", "Finish CPU Battle with the following edited stats: Attack 5, Defence 1, Speed 5 on Level-3 difficulty.", 5,
			trigger = 	p1_only() &&
						settings_difficulty_level() >= 2 &&
						never(game_mode() != MODE_CPU_BATTLE) &&
						once(arcade_match() == 0 && glasscannon_type_stats()) &&
						never(!glasscannon_type_stats()) &&
						trigger_when(arcade_beaten())
			)

achievement("Juggernaut", "Finish CPU Battle with the following edited stats: Attack 5, Defence 5, Speed 1 on Level-3 difficulty.", 5,
			trigger = 	p1_only() &&
						settings_difficulty_level() >= 2 &&
						never(game_mode() != MODE_CPU_BATTLE) &&
						once(arcade_match() == 0 && juggernaut_type_stats()) &&
						never(!juggernaut_type_stats()) &&
						trigger_when(arcade_beaten())
			)


// =========================================
//                  Miscs              
// =========================================

achievement("Perfect Fighter", "Win a round with a Perfect.", 3,
				trigger = 	p1_only() &&
							p1_hp() == 0xff &&
							p1_won_a_round()
				)

function achiev_dizzy_char(title, description, char, points) {
	achievement(title, description, points,
				trigger = 	p1_only() &&
							never(p2_character() != characters[char]) &&
							measured(repeated(2, p2_weak_point() == 0 && prev(p2_weak_point()) == 1)) &&
							never(match_round() < prev(match_round()))
				)
}

achiev_dizzy_char("Hairband Crisis: The Unraveling Plot", "Knock off Mizoguchi’s headband two times during a match.", "Mizoguchi", 4)
achiev_dizzy_char("Weakened Waist", "Rip away Yungmie’s waistband two times during a match.", "Yungmie", 5)
achiev_dizzy_char("Tricky Knees", "Target Lee’s knees and break his weak point two times during a match.", "Lee", 5)
achiev_dizzy_char("Hairband Crisis 2: The Sequel", "Knock off Zazie’s headband in a fight two times during a match.", "Zazie", 4)
achiev_dizzy_char("Art of Fighting Moment", "Shatter Feilin’s breastplate two times during a match.", "Feilin", 3)
achiev_dizzy_char("Hairband Crisis 3: The Final Break", "Knock off Ryoko’s headband two times during a match.", "Ryoko", 4)
achiev_dizzy_char("Behind the Mask", "Unmask Clown by breaking his mask two times during a match.", "Clown", 4)
achiev_dizzy_char("Karnov’s Jewelry Sale!", "Destroy Karnov’s necklace two times during a match.", "Karnov", 3)
achiev_dizzy_char("Shattered Visor", "Crack Chelnov’s helmet visor two times during a match.", "Chelnov", 5)

achievement("The Survivor’s History", "Defeat 5 opponents on Survival (1P vs. CPU) without losing a character.", 10,
			trigger = 	p1_only() &&
						game_mode() == MODE_SURVIVAL &&
						trigger_when(p1_wins() == 5 &&
									 prev(p1_wins()) == 4) &&
						p1_losses() == 0
			)

achievement("Strategic Tagging", "Win a Tag Match (1P vs. CPU) without the HP of both characters going below 70%.", 10,
			trigger = 	p1_only() &&
						never(game_mode() != MODE_TAG_MATCH) &&
						once(game_screen() == GS_CHARACTER_SELECT) &&
						never(p1_hp() < 178 && p1_hp() < prev(p1_hp())) &&
						never(p1_tag_character_1_hp() < 178 && p1_tag_character_1_hp() < prev(p1_tag_character_1_hp())) &&
						never(p1_tag_character_2_hp() < 178 && p1_tag_character_2_hp() < prev(p1_tag_character_2_hp())) &&
						trigger_when(p1_wins() > prev(p1_wins()))
			)

// =========================================
//                 Trials              
// =========================================

function achiev_combo_trials(title, char, points) {
	achievement(title, format("Clear all Practice mode exercises three times each before the timer runs out as {0}.", char), points,
				trigger = 	never(game_mode() != MODE_PRACTICE) &&
							never(p1_character() != characters[char]) &&
							never(game_screen() != 0x0a) &&
							measured(tally(3, 
										   practice_current_trial() == 0 && practice_trial_reps_completed() == 3 && prev(practice_trial_reps_completed()) == 2,
										   practice_current_trial() == 1 && practice_trial_reps_completed() == 3 && prev(practice_trial_reps_completed()) == 2,
										   practice_current_trial() == 2 && practice_trial_reps_completed() == 3 && prev(practice_trial_reps_completed()) == 2
							))
				)
}

achiev_combo_trials("Jissen Karate Master", "Mizoguchi", 10)
achiev_combo_trials("Taekwondo Master", "Yungmie", 10)
achiev_combo_trials("Bajiquan Master", "Lee", 10)
achiev_combo_trials("Karate Master", "Zazie", 10)
achiev_combo_trials("Praying Mantis Master", "Feilin", 10)
achiev_combo_trials("Judo Master", "Ryoko", 10)
achiev_combo_trials("Circus Master", "Clown", 10)
achiev_combo_trials("Fire Master", "Karnov", 10)

achievement("I Love CHESTO! Infinites", "Perform a 40-hit combo on Practice mode as Mizoguchi.", 5,
			trigger = 	never(game_mode() != MODE_PRACTICE) &&
						never(p1_character() != characters["Mizoguchi"]) &&
						never(game_screen() != 0x0a) &&
						p1_hit_combo() == 40 && 
						prev(p1_hit_combo()) == 39
			)

achievement("I Love Fireball Infinites", "Perform a 20-hit combo on Practice mode as Chelnov.", 5,
			trigger = 	never(game_mode() != MODE_PRACTICE) &&
						never(p1_character() != characters["Chelnov"]) &&
						never(game_screen() != 0x0a) &&
						p1_hit_combo() == 20 && 
						prev(p1_hit_combo()) == 19
			)

// =========================================
//                Leaderboards              
// =========================================

leaderboard("Last Great Grapple - High Score", "Highest score during an Arcade run on default settings (1CC)",
		   start = 	p1_only() &&
		   			game_mode() == MODE_CPU_BATTLE &&
		   			settings_difficulty_level() >= 2 &&
					default_type_stats() &&
		   			p1_losses() == 0 &&
					arcade_beaten(),
		   cancel = always_false(),
		   submit = always_true(),
		   value = p1_score_decimal() * 100,
		   format = "VALUE", lower_is_better=false)