// The Last Blade 2
// #ID = 11753

// =========================================
//             Memory Accessors              
// =========================================

// Settings
function soft_dip_setup_difficulty_bit7() => bit7(0x00FD8A)
function soft_dip_setup_difficulty() => byte(0x00FD8A)
function soft_dip_setup_time_set() => byte(0x00FD8B)
function soft_dip_setup_round_setup() => byte(0x00FD8D)

function bios_mvs_mode() => bit7(0xfd83) == 1
function bios_aes_mode() => bit7(0xfd83) == 0

function settings_3_rounds() {
  return  ((bios_mvs_mode() && soft_dip_setup_round_setup() == 4) || 
          (bios_aes_mode() && soft_dip_setup_round_setup() == 1))
}

// Game Stuff
function arcade_match() => byte(0x00E580)
function round_state() => byte(0x00E596)
function mvs_mode() => bit7(0x00FD83)

function p2_active_state() => byte(0x00FDB6)
function p1_active_state() => byte(0x00FDB7)

function p1_character() => byte(0x00BD58)
function p2_character() => byte(0x00E356)

function p1_move() => word(word(0xe346) + 0xdc)

function p1_hp_upper() => byte(0x00E591)

function p1_hp() => word(word(0xe346) + 0x17e)
function p2_hp() => word(word(0xe34a) + 0x17e)

function p1_move_pointer() => word(0xe468)
function p1_performing_sdm() => bit1(p1_move_pointer() + 0x10b)

function p1_cruel_win_flag() => byte(0x00BD6B)
function p1_ability() => byte(0x00E367)
function p1_combo_hits() => byte(0x00E483)
function p1_score_00xx0000() => byte(0x00E4CE)
function p1_super_desperation_move_flag() => byte(0x00E58F)


// Utility Functions
function p1_only() {
  return  never(p1_active_state() == 0) && 
          never(p2_active_state() != 0)
}

function settings_default_all() {
  return  soft_dip_setup_difficulty() >= 2 &&
          soft_dip_setup_time_set() == 1 &&
          settings_3_rounds()
}

function settings_default_all_except_diff() {
  return  soft_dip_setup_time_set() == 1 &&
          settings_3_rounds()
}

function story_mode_beaten() {
    return(
        arcade_match() == 8 && prev(arcade_match()) == 7
    )
}
// =========================================
//                Progression              
// =========================================

achievement(
    title = "Young Man Who Inherits the Era", points = 10, type="win_condition",
    description = "Complete the game playing only as Kaede on any difficulty (default settings)",
    id = 59961, badge = "62983", published = "06/05/2018 21:46:01", modified = "10/10/2019 19:17:01",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 0) &&
              once(arcade_match() == 0) &&
              trigger_when(story_mode_beaten()) &&
              unless(p1_character() == 255)
)

achievement(
    title = "Warrior Who Lives by the Moon's Destiny", points = 10, type="win_condition",
    description = "Complete the game playing only as Moriya Minakata on any difficulty (default settings)",
    id = 59962, badge = "62984", published = "06/05/2018 21:46:04", modified = "28/07/2019 13:20:07",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 1) &&
              once(arcade_match() == 0) &&
              trigger_when(story_mode_beaten()) &&
              unless(p1_character() == 255)
)

achievement(
    title = "The Spear Which Pierces Destiny", points = 10, type="win_condition",
    description = "Complete the game playing only as Yuki on any difficulty (default settings)",
    id = 59963, badge = "62985", published = "06/05/2018 21:46:06", modified = "13/10/2019 20:00:01",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 2) &&
              once(arcade_match() == 0) &&
              trigger_when(story_mode_beaten()) &&
              unless(p1_character() == 255)
)

achievement(
    title = "Sword of Loyalty", points = 10, type="win_condition",
    description = "Complete the game playing only as Keiichiro Washizuka on any difficulty (default settings)",
    id = 59964, badge = "62986", published = "06/05/2018 21:46:08", modified = "28/07/2019 13:20:11",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 6) &&
              once(arcade_match() == 0) &&
              trigger_when(story_mode_beaten()) &&
              unless(p1_character() == 255)
)

achievement(
    title = "The One From The Depths of Hell", points = 10, type="win_condition",
    description = "Complete the game playing only as Mukuro on any difficulty (default settings)",
    id = 59965, badge = "62987", published = "06/05/2018 21:46:10", modified = "28/07/2019 13:20:18",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 7) &&
              once(arcade_match() == 0) &&
              trigger_when(story_mode_beaten()) &&
              unless(p1_character() == 255)
)

achievement(
    title = "Emissary from the Yellow Soil", points = 10, type="win_condition",
    description = "Complete the game playing only as Lee Rekka on any difficulty (default settings)",
    id = 59966, badge = "62988", published = "06/05/2018 21:46:12", modified = "28/07/2019 13:20:20",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 9) &&
              once(arcade_match() == 0) &&
              trigger_when(story_mode_beaten()) &&
              unless(p1_character() == 255)
)

achievement(
    title = "Strongest Path of Ninja", points = 10, type="win_condition",
    description = "Complete the game playing only as Zantetsu on any difficulty (default settings)",
    id = 59967, badge = "63081", published = "06/05/2018 21:46:14", modified = "28/07/2019 13:20:22",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 10) &&
              once(arcade_match() == 0) &&
              trigger_when(story_mode_beaten()) &&
              unless(p1_character() == 255)
)

achievement(
    title = "Little Onmyouji", points = 10, type="win_condition",
    description = "Complete the game playing only as Akari Ichijou on any difficulty (default settings)",
    id = 59968, badge = "62990", published = "06/05/2018 21:46:16", modified = "28/07/2019 13:20:25",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 4) &&
              once(arcade_match() == 0) &&
              trigger_when(story_mode_beaten()) &&
              unless(p1_character() == 255)
)

achievement(
    title = "Cheerful Arhat", points = 10, type="win_condition",
    description = "Complete the game playing only as Juzoh Kanzaki on any difficulty (default settings)",
    id = 59969, badge = "62991", published = "06/05/2018 21:46:18", modified = "28/07/2019 13:20:27",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 5) &&
              once(arcade_match() == 0) &&
              trigger_when(story_mode_beaten()) &&
              unless(p1_character() == 255)
)

achievement(
    title = "Fighting Hermit", points = 10, type="win_condition",
    description = "Complete the game playing only as Okina no Genbu on any difficulty (default settings)",
    id = 59970, badge = "62992", published = "06/05/2018 21:46:19", modified = "25/09/2019 16:48:01",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 3) &&
              once(arcade_match() == 0) &&
              trigger_when(story_mode_beaten()) &&
              unless(p1_character() == 255)
)

achievement(
    title = "Iron-Armed Fierce Tiger", points = 10, type="win_condition",
    description = "Complete the game playing only as Shigen Naoe on any difficulty (default settings)",
    id = 59971, badge = "62993", published = "06/05/2018 21:46:21", modified = "28/07/2019 13:20:31",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 11) &&
              once(arcade_match() == 0) &&
              trigger_when(story_mode_beaten()) &&
              unless(p1_character() == 255)
)

achievement(
    title = "Fallen Heaven's Sword", points = 10, type="win_condition",
    description = "Complete the game playing only as Shinnosuke Kagami on any difficulty (default settings)",
    id = 59972, badge = "62994", published = "06/05/2018 21:46:24", modified = "28/07/2019 13:20:34",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 12) &&
              once(arcade_match() == 0) &&
              trigger_when(story_mode_beaten()) &&
              unless(p1_character() == 255)
)

achievement(
    title = "Brawling Sakura Blossom of Edo", points = 10, type="win_condition",
    description = "Complete the game playing only as Hyo Amano on any difficulty (default settings)",
    id = 59973, badge = "62995", published = "06/05/2018 21:46:26", modified = "28/07/2019 13:20:36",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 8) &&
              once(arcade_match() == 0) &&
              trigger_when(story_mode_beaten()) &&
              unless(p1_character() == 255)
)

achievement(
    title = "Long Sword of Purity", points = 10, type="win_condition",
    description = "Complete the game playing only as Hibiki Takane on any difficulty (default settings)",
    id = 59974, badge = "62996", published = "06/05/2018 21:46:28", modified = "28/07/2019 13:20:38",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 14) &&
              once(arcade_match() == 0) &&
              trigger_when(story_mode_beaten()) &&
              unless(p1_character() == 255)
)

achievement(
    title = "Slaughtering Sword of Darkness", points = 10, type="win_condition",
    description = "Complete the game playing only as Setsuna on any difficulty (default settings)",
    id = 59975, badge = "62997", published = "06/05/2018 21:46:30", modified = "28/07/2019 13:20:40",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 15) &&
              once(arcade_match() == 0) &&
              trigger_when(story_mode_beaten()) &&
              unless(p1_character() == 255)
)

achievement(
    title = "Shadow Wolf of Mibu", points = 10, type="win_condition",
    description = "Complete the game playing only as Kaori Sanada on any difficulty (default settings)",
    id = 59976, badge = "62998", published = "06/05/2018 21:46:32", modified = "16/10/2019 20:46:01",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 13) &&
              once(arcade_match() == 0) &&
              trigger_when(story_mode_beaten()) &&
              unless(p1_character() == 255)
)

achievement(
    title = "Shining Soul", points = 10,
    description = "Complete the game playing only as Original Kaede on any difficulty (default settings)",
    id = 59977, badge = "62999", published = "06/05/2018 21:46:34", modified = "25/09/2019 16:48:01",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 17) &&
              once(arcade_match() == 0) &&
              trigger_when(story_mode_beaten()) &&
              unless(p1_character() == 255)
)

achievement(
    title = "Wandering Doll", points = 10,
    description = "Complete the game playing only as Hagure Hitogata on any difficulty (default settings)",
    id = 59978, badge = "63000", published = "06/05/2018 21:46:37", modified = "28/07/2019 13:20:45",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 18) &&
              once(arcade_match() == 0) &&
              trigger_when(story_mode_beaten()) &&
              unless(p1_character() == 255)
)

achievement(
    title = "The Joining Emperor", points = 10,
    description = "Complete the game playing only as Kouryu on any difficulty (default settings)",
    id = 59979, badge = "63001", published = "06/05/2018 21:46:39", modified = "28/07/2019 13:20:47",
    trigger = never(dword(0x00FE30) != 0) && never(soft_dip_setup_time_set() < 1) &&
              never(soft_dip_setup_round_setup() < 1) && never(p2_active_state() == 1) && never(p1_character() != 16) &&
              once(arcade_match() == 0) &&
              trigger_when(story_mode_beaten()) &&
              unless(p1_character() == 255)
)

// =========================================
//                   Misc              
// =========================================

achievement(
    title = "Baby Tigress", points = 3,
    description = "Try to play as Kotetsu on any difficulty (default settings)",
    id = 59980, badge = "63002", published = "06/05/2018 21:46:44", modified = "28/07/2019 13:20:52",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 19) &&
              round_state() == 3
)

// =========================================
//                  Perfects              
// =========================================

achievement(
    title = "Falling Down Flowers I (Ryuukinka)", points = 5,
    description = "Win a perfect round against Kaede (default settings)",
    id = 59981, badge = "63003", published = "06/05/2018 21:47:13", modified = "16/10/2019 20:46:01",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(p2_character() != 0) &&
              p1_hp() == 0x0100 && p2_hp() == 0xFFFF && never(round_state() == 3)
)

achievement(
    title = "Falling Down Flowers II (Dachuura)", points = 5,
    description = "Win a perfect round against Moriya Minakata (default settings)",
    id = 59982, badge = "63010", published = "06/05/2018 21:47:15", modified = "28/07/2019 13:20:55",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(p2_character() != 1) &&
              p1_hp() == 0x0100 && p2_hp() == 0xFFFF && never(round_state() == 3)
)

achievement(
    title = "Falling Down Flowers III (Wasurenagusa)", points = 5,
    description = "Win a perfect round against Yuki (default settings)",
    id = 59983, badge = "63004", published = "06/05/2018 21:47:17", modified = "28/07/2019 13:20:57",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(p2_character() != 2) &&
              p1_hp() == 0x0100 && p2_hp() == 0xFFFF && never(round_state() == 3)
)

achievement(
    title = "Falling Down Flowers IV (Asagao)", points = 5,
    description = "Win a perfect round against Keiichiro Washizuka (default settings)",
    id = 59984, badge = "63005", published = "06/05/2018 21:47:18", modified = "28/07/2019 13:20:59",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(p2_character() != 6) &&
              p1_hp() == 0x0100 && p2_hp() == 0xFFFF && never(round_state() == 3)
)

achievement(
    title = "Falling Down Flowers V (Jigitarisu)", points = 5,
    description = "Win a perfect round against Mukuro (default settings)",
    id = 59985, badge = "63007", published = "06/05/2018 21:47:20", modified = "28/07/2019 13:21:00",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(p2_character() != 7) &&
              p1_hp() == 0x0100 && p2_hp() == 0xFFFF && never(round_state() == 3)
)

achievement(
    title = "Falling Down Flowers VI (Jasumin)", points = 5,
    description = "Win a perfect round against Lee Rekka (default settings)",
    id = 59986, badge = "63006", published = "06/05/2018 21:47:22", modified = "28/07/2019 13:21:03",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(p2_character() != 9) &&
              p1_hp() == 0x0100 && p2_hp() == 0xFFFF && never(round_state() == 3)
)

achievement(
    title = "Falling Down Flowers VII (Ume)", points = 5,
    description = "Win a perfect round against Zantetsu (default settings)",
    id = 59987, badge = "63008", published = "06/05/2018 21:47:24", modified = "28/07/2019 13:21:05",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(p2_character() != 10) &&
              p1_hp() == 0x0100 && p2_hp() == 0xFFFF && never(round_state() == 3)
)

achievement(
    title = "Falling Down Flowers VIII (Momo)", points = 5,
    description = "Win a perfect round against Akari Ichijou (default settings)",
    id = 59988, badge = "63011", published = "06/05/2018 21:47:29", modified = "28/07/2019 13:21:06",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(p2_character() != 4) &&
              p1_hp() == 0x0100 && p2_hp() == 0xFFFF && never(round_state() == 3)
)

achievement(
    title = "Falling Down Flowers IX (Popi)", points = 5,
    description = "Win a perfect round against Juzoh Kanzaki (default settings)",
    id = 59989, badge = "63012", published = "06/05/2018 21:47:31", modified = "28/07/2019 13:21:08",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(p2_character() != 5) &&
              p1_hp() == 0x0100 && p2_hp() == 0xFFFF && never(round_state() == 3)
)

achievement(
    title = "Falling Down Flowers X (Kinmokusei)", points = 5,
    description = "Win a perfect round against Okina no Genbu (default settings)",
    id = 59990, badge = "63041", published = "06/05/2018 21:47:34", modified = "28/07/2019 13:21:10",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(p2_character() != 3) &&
              p1_hp() == 0x0100 && p2_hp() == 0xFFFF && never(round_state() == 3)
)

achievement(
    title = "Falling Down Flowers XI (Usuyukisou)", points = 5,
    description = "Win a perfect round against Shigen Naoe (default settings)",
    id = 59991, badge = "63042", published = "06/05/2018 21:47:36", modified = "28/07/2019 13:25:51",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(p2_character() != 11) &&
              p1_hp() == 0x0100 && p2_hp() == 0xFFFF && never(round_state() == 3)
)

achievement(
    title = "Falling Down Flowers XII (Tsubaki)", points = 5,
    description = "Win a perfect round against Shinnosuke Kagami (default settings)",
    id = 59992, badge = "63043", published = "06/05/2018 21:47:37", modified = "28/07/2019 13:25:53",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(p2_character() != 12) &&
              p1_hp() == 0x0100 && p2_hp() == 0xFFFF && never(round_state() == 3)
)

achievement(
    title = "Falling Down Flowers XIII (Sakura)", points = 5,
    description = "Win a perfect round against Hyo Amano (default settings)",
    id = 59993, badge = "63044", published = "06/05/2018 21:47:40", modified = "28/07/2019 13:25:55",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(p2_character() != 8) &&
              p1_hp() == 0x0100 && p2_hp() == 0xFFFF && never(round_state() == 3)
)

achievement(
    title = "Falling Down Flowers XIV (Kiku)", points = 5,
    description = "Win a perfect round against Hibiki Takane (default settings)",
    id = 59994, badge = "63045", published = "06/05/2018 21:47:41", modified = "28/07/2019 13:25:57",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(p2_character() != 14) &&
              p1_hp() == 0x0100 && p2_hp() == 0xFFFF && never(round_state() == 3)
)

achievement(
    title = "Falling Down Flowers XV (Botan)", points = 5,
    description = "Win a perfect round against Setsuna (default settings)",
    id = 59995, badge = "63046", published = "06/05/2018 21:47:43", modified = "28/07/2019 13:26:02",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(p2_character() != 15) &&
              p1_hp() == 0x0100 && p2_hp() == 0xFFFF && never(round_state() == 3)
)

achievement(
    title = "Falling Down Flowers XVI (Sumire)", points = 5,
    description = "Win a perfect round against Kaori Sanada (default settings)",
    id = 59996, badge = "63047", published = "06/05/2018 21:47:45", modified = "28/07/2019 13:26:04",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(p2_character() != 13) &&
              p1_hp() == 0x0100 && p2_hp() == 0xFFFF && never(round_state() == 3)
)

achievement(
    title = "Falling Down Flowers XVII (Kosumosu)", points = 10,
    description = "Win a perfect round against Kouryu (default settings)",
    id = 59997, badge = "63048", published = "06/05/2018 21:47:47", modified = "28/07/2019 13:26:06",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(p2_character() != 16) &&
              p1_hp() == 0x0100 && p2_hp() == 0xFFFF && never(round_state() == 3)
)

// =========================================
//             Super Desp. Move              
// =========================================

achievement(
    title = "Bloodstained Petals I (Ryuukinka)", points = 5,
    description = "Defeat the opponent using Super Desperate Move as Kaede on any difficulty (default settings)",
    id = 59998, badge = "63013", published = "06/05/2018 21:47:51", modified = "10/10/2019 19:17:01",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 0) &&
              p1_performing_sdm() == 1 && 
              p2_hp() == 0xFFFF && prev(p2_hp()) != 0xFFFF
)

achievement(
    title = "Bloodstained Petals II (Dachuura)", points = 5,
    description = "Defeat the opponent using Super Desperate Move as Moriya Minakata on any difficulty (default settings)",
    id = 59999, badge = "62981", published = "06/05/2018 21:47:52", modified = "28/07/2019 13:26:09",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 1) &&
              p1_performing_sdm() == 1 && 
              p2_hp() == 0xFFFF && prev(p2_hp()) != 0xFFFF
)

achievement(
    title = "Bloodstained Petals III (Wasurenagusa) ", points = 5,
    description = "Defeat the opponent using Super Desperate Move as Yuki on any difficulty (default settings)",
    id = 60000, badge = "63014", published = "06/05/2018 21:47:54", modified = "28/07/2019 13:26:11",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 2) &&
              p1_performing_sdm() == 1 && 
              p2_hp() == 0xFFFF && prev(p2_hp()) != 0xFFFF
)

achievement(
    title = "Bloodstained Petals IV (Asagao)", points = 5,
    description = "Defeat the opponent using Super Desperate Move as  Keiichiro Washizuka on any difficulty (default settings)",
    id = 60001, badge = "63015", published = "06/05/2018 21:47:56", modified = "28/07/2019 13:26:13",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 6) &&
              p1_performing_sdm() == 1 && 
              p2_hp() == 0xFFFF && prev(p2_hp()) != 0xFFFF
)

achievement(
    title = "Bloodstained Petals V (Jigitarisu)", points = 5,
    description = "Defeat the opponent using Super Desperate Move as Mukuro on any difficulty (default settings)",
    id = 60002, badge = "63016", published = "06/05/2018 21:47:58", modified = "28/07/2019 13:26:16",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 7) &&
              p1_performing_sdm() == 1 && 
              p2_hp() == 0xFFFF && prev(p2_hp()) != 0xFFFF
)

achievement(
    title = "Bloodstained Petals VI (Jasumin)", points = 5,
    description = "Defeat the opponent using Super Desperate Move as Lee Rekka on any difficulty (default settings)",
    id = 60003, badge = "63017", published = "06/05/2018 21:48:00", modified = "28/07/2019 13:26:17",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 9) &&
              p1_performing_sdm() == 1 && 
              p2_hp() == 0xFFFF && prev(p2_hp()) != 0xFFFF
)

achievement(
    title = "Bloodstained Petals VII (Ume)", points = 5,
    description = "Defeat the opponent using Super Desperate Move as Zantetsu on any difficulty (default settings)",
    id = 60004, badge = "63018", published = "06/05/2018 21:48:02", modified = "28/07/2019 13:26:19",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 10) &&
              p1_performing_sdm() == 1 && 
              p2_hp() == 0xFFFF && prev(p2_hp()) != 0xFFFF
)

achievement(
    title = "Bloodstained Petals VIII (Momo)", points = 5,
    description = "Defeat the opponent using Super Desperate Move as Akari Ichijou on any difficulty (default settings)",
    id = 60005, badge = "63019", published = "06/05/2018 21:48:04", modified = "28/07/2019 13:26:22",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 4) &&
              p1_performing_sdm() == 1 && 
              p2_hp() == 0xFFFF && prev(p2_hp()) != 0xFFFF
)

// Exception, needs to check for move ID
achievement(
    title = "Bloodstained Petals IX (Popi)", points = 5,
    description = "Defeat the opponent using Super Desperate Move as Juzoh Kanzaki on any difficulty (default settings)",
    id = 60006, badge = "63020", published = "06/05/2018 21:48:07", modified = "28/07/2019 13:26:24",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 5) &&
              (p1_performing_sdm() == 1 || (p1_move() >= 0xb9 && p1_move() <= 0xbd)) &&
              p2_hp() == 0xFFFF && prev(p2_hp()) != 0xFFFF
)

achievement(
    title = "Bloodstained Petals X (Kinmokusei)", points = 5,
    description = "Defeat the opponent using Super Desperate Move as Okina no Genbu on any difficulty (default settings)",
    id = 60007, badge = "63049", published = "06/05/2018 21:48:10", modified = "28/07/2019 13:26:26",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 3) &&
              p1_performing_sdm() == 1 && 
              p2_hp() == 0xFFFF && prev(p2_hp()) != 0xFFFF
)

achievement(
    title = "Bloodstained Petals XI (Usuyukisou)", points = 5,
    description = "Defeat the opponent using Super Desperate Move as Shigen Naoe on any difficulty (default settings)",
    id = 60008, badge = "63050", published = "06/05/2018 21:48:12", modified = "28/07/2019 13:26:28",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 11) &&
              p1_performing_sdm() == 1 && 
              p2_hp() == 0xFFFF && prev(p2_hp()) != 0xFFFF
)

achievement(
    title = "Bloodstained Petals XII (Tsubaki)", points = 5,
    description = "Defeat the opponnent using Super Desperate Move as Shinnosuke Kagami on any difficulty (default settings)",
    id = 60009, badge = "63051", published = "06/05/2018 21:48:13", modified = "22/10/2019 22:30:01",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 12) &&
              p1_performing_sdm() == 1 && 
              p2_hp() == 0xFFFF && prev(p2_hp()) != 0xFFFF
)

achievement(
    title = "Bloodstained Petals XIII (Sakura)", points = 5,
    description = "Defeat the opponent using Super Desperate Move as Hyo Amano on any difficulty (default settings)",
    id = 60010, badge = "63052", published = "06/05/2018 21:48:15", modified = "28/07/2019 13:26:32",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 8) &&
              p1_performing_sdm() == 1 && 
              p2_hp() == 0xFFFF && prev(p2_hp()) != 0xFFFF
)

achievement(
    title = "Bloodstained Petals XIV (Kiku)", points = 5,
    description = "Defeat the opponent using Super Desperate Move as Hibiki Takane on any difficulty (default settings)",
    id = 60011, badge = "63053", published = "06/05/2018 21:48:16", modified = "28/07/2019 13:26:34",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 14) &&
              p1_performing_sdm() == 1 && 
              p2_hp() == 0xFFFF && prev(p2_hp()) != 0xFFFF
)

achievement(
    title = "Bloodstained Petals XV (Botan)", points = 5,
    description = "Defeat the opponent using Super Desperate Move as Setsuna on any difficulty (default settings)",
    id = 60012, badge = "63054", published = "06/05/2018 21:48:18", modified = "28/07/2019 13:26:36",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 15) &&
              p1_performing_sdm() == 1 && 
              p2_hp() == 0xFFFF && prev(p2_hp()) != 0xFFFF
)

achievement(
    title = "Bloodstained Petals XVI (Sumire)", points = 5,
    description = "Defeat the opponent using Super Desperate Move as Kaori Sanada on any difficulty (default settings)",
    id = 60013, badge = "63055", published = "06/05/2018 21:48:21", modified = "16/10/2019 20:46:01",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 13) &&
              p1_performing_sdm() == 1 && 
              p2_hp() == 0xFFFF && prev(p2_hp()) != 0xFFFF
)

achievement(
    title = "Bloodstained Petals XVII (Kinpuoge)", points = 5,
    description = "Defeat the opponent using Super Desperate Move as Original Kaede on any difficulty (default settings)",
    id = 60014, badge = "63056", published = "06/05/2018 21:48:26", modified = "28/07/2019 13:26:41",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 17) &&
              p1_performing_sdm() == 1 && 
              p2_hp() == 0xFFFF && prev(p2_hp()) != 0xFFFF
)

// This need an exception if it's a mirror of Juzoh too
achievement(
    title = "Bloodstained Petals XVIII (Kami no hana)", points = 5,
    description = "Defeat the opponent using Super Desperate Move as Hagure Hitogata on any difficulty (default settings)",
    id = 60015, badge = "63057", published = "06/05/2018 21:48:28", modified = "28/07/2019 13:26:43",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_character() != 18) &&
              (p1_performing_sdm() == 1 || (p1_move() >= 0xb9 && p1_move() <= 0xbd && p2_character() == 0x05)) &&
              p2_hp() == 0xFFFF && prev(p2_hp()) != 0xFFFF
)

achievement(
    title = "Bloodstained Petals XIX (Kosumosu)", points = 5,
    description = "Defeat the opponent using Super Desperate Move as Kouryu on any difficulty (default settings)",
    id = 60016, badge = "63058", published = "06/05/2018 21:48:30", modified = "28/07/2019 13:26:44",
    trigger = never(dword(0x00FE30) != 0) && never(soft_dip_setup_time_set() < 1) &&
              never(soft_dip_setup_round_setup() < 1) && never(p2_active_state() == 1) && never(p1_character() != 16) &&
              p1_performing_sdm() == 1 && 
              p2_hp() == 0xFFFF && prev(p2_hp()) != 0xFFFF
)

// =========================================
//                  Combos              
// =========================================

// Ticket 83420: Triggers when only doing a 17 hit combo with Speed Kaede, with Shingen as the opponent in Training
//               mode and using a combo of 41236C, 22A, A + B + C + 2C + A + 2C + 6BC, 2146AB. (A 3B OTG is necessary
//               to make the 18th hit, but the achievement triggered beforehand.)
// DONE: Fixed by changing the condition to 18 hits (it was 17)
achievement(
    title = "A Sword Poem and Dance I (Hayate-Maru no Kin)", points = 10,
    description = "As Kaede perform a combo attack with at least 18 hits (default settings)",
    id = 60017, badge = "63059", published = "06/05/2018 21:48:35", modified = "28/07/2019 13:26:47",
    trigger = never(dword(0x00FE30) != 0) && never(p1_character() != 0) && p1_combo_hits() == 18
)

achievement(
    title = "A Sword Poem and Dance II (Tsuki no Katsura)", points = 10,
    description = "As Moriya Minakata perform a combo attack with at least 22 hits (default settings)",
    id = 60018, badge = "63060", published = "06/05/2018 21:48:42", modified = "28/07/2019 13:26:49",
    trigger = never(dword(0x00FE30) != 0) && never(p1_character() != 1) && p1_combo_hits() == 22
)

achievement(
    title = "A Sword Poem and Dance III (Bodan)", points = 10,
    description = "As Yuki perform a combo attack with at least 19 hits (default settings)",
    id = 60019, badge = "63061", published = "06/05/2018 21:48:44", modified = "28/07/2019 13:26:50",
    trigger = never(dword(0x00FE30) != 0) && never(p1_character() != 2) && p1_combo_hits() == 19
)

achievement(
    title = "A Sword Poem and Dance IV (Hayabusa)", points = 10,
    description = "As Keiichiro Washizuka perform a combo attack with at least 20 hits (default settings)",
    id = 60020, badge = "63062", published = "06/05/2018 21:48:47", modified = "28/07/2019 13:26:52",
    trigger = never(dword(0x00FE30) != 0) && never(p1_character() != 6) && p1_combo_hits() == 20
)

achievement(
    title = "A Sword Poem and Dance V (Kyoto Hagewashi)", points = 10,
    description = "As Mukuro perform a combo attack with at least 30 hits (default settings)",
    id = 60021, badge = "63063", published = "06/05/2018 21:48:48", modified = "28/07/2019 13:26:55",
    trigger = never(dword(0x00FE30) != 0) && never(p1_character() != 7) && p1_combo_hits() == 30
)

achievement(
    title = "A Sword Poem and Dance VI (Guren)", points = 10,
    description = "As  Lee Rekka perform a combo attack with at least 20 hits (default settings)",
    id = 60022, badge = "63064", published = "06/05/2018 21:48:50", modified = "28/07/2019 13:26:57",
    trigger = never(dword(0x00FE30) != 0) && never(p1_character() != 9) && p1_combo_hits() == 20
)

achievement(
    title = "A Sword Poem and Dance VII (Totrojin Kage)", points = 10,
    description = "As Zantetsu perform a combo attack with at least 20 hits (default settings)",
    id = 60023, badge = "63065", published = "06/05/2018 21:48:52", modified = "28/07/2019 13:26:59",
    trigger = never(dword(0x00FE30) != 0) && never(p1_character() != 10) && p1_combo_hits() == 20
)

achievement(
    title = "A Sword Poem and Dance VIII (Meian)", points = 10,
    description = "As Akari Ichijou perform a combo attack with at least 19 hits (default settings)",
    id = 60024, badge = "63066", published = "06/05/2018 21:48:55", modified = "28/07/2019 13:27:01",
    trigger = never(dword(0x00FE30) != 0) && never(p1_character() != 4) && p1_combo_hits() == 19
)

achievement(
    title = "A Sword Poem and Dance IX (Kongou Rakan)", points = 10,
    description = "As Juzoh Kanzaki perform a combo attack with at least 8 hits (default settings)",
    id = 60025, badge = "63067", published = "06/05/2018 21:48:57", modified = "28/07/2019 13:27:04",
    trigger = never(dword(0x00FE30) != 0) && never(p1_character() != 5) && p1_combo_hits() == 8
)

achievement(
    title = "A Sword Poem and Dance X (Hihon)", points = 10,
    description = "As Okina no Genbu perform a combo attack with at least 19 hits (default settings)",
    id = 60026, badge = "63068", published = "06/05/2018 21:48:58", modified = "28/07/2019 13:27:05",
    trigger = never(dword(0x00FE30) != 0) && never(p1_character() != 3) && p1_combo_hits() == 19
)

achievement(
    title = "A Sword Poem and Dance XI (Byakkou no Juzu)", points = 10,
    description = "As Shigen Naoe perform a combo attack with at least 17 hits (default settings)",
    id = 60027, badge = "63069", published = "06/05/2018 21:49:00", modified = "28/07/2019 13:27:07",
    trigger = never(dword(0x00FE30) != 0) && never(p1_character() != 11) && p1_combo_hits() == 17
)

achievement(
    title = "A Sword Poem and Dance XII (Zuihou)", points = 10,
    description = "As Shinnosuke Kagami perform a combo attack with at least 16 hits (default settings)",
    id = 60028, badge = "63070", published = "06/05/2018 21:49:02", modified = "28/07/2019 13:27:09",
    trigger = never(dword(0x00FE30) != 0) && never(p1_character() != 12) && p1_combo_hits() == 16
)

achievement(
    title = "A Sword Poem and Dance XIII (Otokomae)", points = 10,
    description = "As Hyo Amano perform a combo attack with at least 17 hits (default settings)",
    id = 60029, badge = "63071", published = "06/05/2018 21:49:03", modified = "28/07/2019 13:27:11",
    trigger = never(dword(0x00FE30) != 0) && never(p1_character() != 8) && p1_combo_hits() == 17
)

achievement(
    title = "A Sword Poem and Dance XIV (Kodama)", points = 10,
    description = "As Hibiki Takane perform a combo attack with at least 15 hits (default settings)",
    id = 60030, badge = "63072", published = "06/05/2018 21:49:06", modified = "28/07/2019 13:27:13",
    trigger = never(dword(0x00FE30) != 0) && never(p1_character() != 14) && p1_combo_hits() == 15
)

achievement(
    title = "A Sword Poem and Dance XV (Yaso Magatsu Hi no Tachi)", points = 10,
    description = "As Setsuna perform a combo attack with at least 16 hits (default settings)",
    id = 60031, badge = "63073", published = "06/05/2018 21:49:08", modified = "28/07/2019 13:27:15",
    trigger = never(dword(0x00FE30) != 0) && never(p1_character() != 15) && p1_combo_hits() == 16
)

achievement(
    title = "A Sword Poem and Dance XVI (Mozu)", points = 10,
    description = "As Kaori Sanada perform a combo attack with at least 20 hits (default settings)",
    id = 60032, badge = "63074", published = "06/05/2018 21:49:10", modified = "28/07/2019 13:27:19",
    trigger = never(dword(0x00FE30) != 0) && never(p1_character() != 13) && p1_combo_hits() == 20
)

achievement(
    title = "A Sword Poem and Dance XVII (Hayate-Maru)", points = 10,
    description = "As Original Kaede perform a combo attack with at least 16 hits (default settings)",
    id = 60033, badge = "63075", published = "06/05/2018 21:49:12", modified = "28/07/2019 13:27:20",
    trigger = never(dword(0x00FE30) != 0) && never(p1_character() != 17) && p1_combo_hits() == 16
)

achievement(
    title = "A Sword Poem and Dance XVIII (Totsuka no Tsurugi)", points = 10,
    description = "As Kouryu perform a combo attack with at least 17 hits (default settings)",
    id = 60034, badge = "63076", published = "06/05/2018 21:49:13", modified = "28/07/2019 13:27:22",
    trigger = never(dword(0x00FE30) != 0) && never(p1_character() != 16) && p1_combo_hits() == 17
)

// =========================================
//                  Misc 2              
// =========================================

achievement(
    title = "Nodachi Score", points = 10,
    description = "Score 750000 points or more on any difficulty (default settings)",
    id = 60035, badge = "63077", published = "06/05/2018 21:49:20", modified = "28/07/2019 13:27:25",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && p1_score_00xx0000() >= 117
)

achievement(
    title = "Blade Art - Musashi", points = 10,
    description = "Complete the game with any character in Power mode on any difficulty (default settings)",
    id = 60036, badge = "63021", published = "06/05/2018 21:49:26", modified = "10/10/2019 19:17:01",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_ability() != 1) &&
              once(arcade_match() == 0) && once(arcade_match() == 1) && once(arcade_match() == 2) &&
              once(arcade_match() == 3) && once(arcade_match() == 4) && once(arcade_match() == 5) &&
              once(arcade_match() == 6) && once(arcade_match() == 7) && once(arcade_match() == 8)
)

achievement(
    title = "Blade Art - Masamune", points = 10,
    description = "Complete the game with any character in Speed mode on any difficulty (default settings)",
    id = 60037, badge = "63022", published = "06/05/2018 21:49:32", modified = "25/09/2019 16:48:01",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_ability() != 2) &&
              once(arcade_match() == 0) && once(arcade_match() == 1) && once(arcade_match() == 2) &&
              once(arcade_match() == 3) && once(arcade_match() == 4) && once(arcade_match() == 5) &&
              once(arcade_match() == 6) && once(arcade_match() == 7) && once(arcade_match() == 8)
)

achievement(
    title = "Blade Art - Kusanagi", points = 10,
    description = "Complete the game with any character in EX mode on any difficulty (default settings)",
    id = 60038, badge = "63023", published = "06/05/2018 21:49:34", modified = "28/07/2019 13:27:31",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all_except_diff() && 
              never(p2_active_state() == 1) && never(p1_ability() != 3) &&
              once(arcade_match() == 0) && once(arcade_match() == 1) && once(arcade_match() == 2) &&
              once(arcade_match() == 3) && once(arcade_match() == 4) && once(arcade_match() == 5) &&
              once(arcade_match() == 6) && once(arcade_match() == 7) && once(arcade_match() == 8)
)

achievement(
    title = "Blade Art - Yojimbo", points = 50,
    description = "Complete the game without losing any round (default settings)",
    id = 60039, badge = "63024", published = "06/05/2018 21:49:36", modified = "28/07/2019 13:27:32",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(word(0x00E590) == 65535) && 
              once(arcade_match() == 0 && p1_character() != 0xFF) &&
              trigger_when(story_mode_beaten())
)

achievement(
    title = "Blade Art - Rashomon", points = 25,
    description = "Complete the game without taking damage below half of the bar (default settings)",
    id = 60040, badge = "63025", published = "06/05/2018 21:49:37", modified = "28/07/2019 13:27:35",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(word(0x00E590) < 128) &&
              once(arcade_match() == 0 && p1_character() != 0xFF) &&
              trigger_when(story_mode_beaten())
)

achievement(
    title = "On the Moon a Flower Blooming, a Petal Falling", points = 50,
    description = "Complete the game on the hardest difficulty (default settings)",
    id = 60041, badge = "63078", published = "06/05/2018 21:49:42", modified = "28/07/2019 13:27:38",
    trigger = never(dword(0x00FE30) != 0) && never(soft_dip_setup_difficulty() != 7) &&
              settings_default_all_except_diff() &&
              never(p2_active_state() == 1) && arcade_match() == 8
)

achievement(
    title = "The Last Blade 2 1CC", points = 25,
    description = "Complete the game using only one credit (default settings)",
    id = 60042, badge = "63079", published = "06/05/2018 21:49:43", modified = "28/07/2019 13:27:40",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(p1_active_state() == 2) &&
              once(arcade_match() == 0 && p1_character() != 0xFF) &&
              trigger_when(story_mode_beaten())
)

achievement(
    title = "Blade Art - Muramasa", points = 10,
    description = "In one game defeat 5 oponents in a cruel way (default settings, cruel fight on)",
    id = 60193, badge = "63082", published = "13/05/2018 01:49:34", modified = "28/07/2019 13:20:03",
    trigger = never(dword(0x00FE30) != 0) && settings_default_all() &&
              never(p2_active_state() == 1) && never(p1_active_state() == 0) &&
              measured(repeated(5, prev(p1_cruel_win_flag()) < p1_cruel_win_flag()))
)
