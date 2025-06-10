// Guitar Hero III: Legends of Rock
// #ID = 5579

// =========================================
//              Memory Acessors              
// =========================================

function guitar_battle_check() => firstsongID() == 0x626f7373
function firstsongID() => dword_be(dword(0x798CF0) + 0x3b)
function secondsongID() => dword_be(dword(0x798CF0) + 0x3f)
function current_score() => dword(0x373168)
function difficulty() => dword(dword(0x548628) + 0x20)

function debug_block() => dword(0x2616dc) != 0x224

function song_exception_check(id_one, id_two) => firstsongID() == id_one && secondsongID() == id_two

function game_state() => byte(0x371EF0)
         menu = 0
         in_game = 1

function cash_ptr_node() => dword(dword(0x43C8E0) + 0x04)
function current_screen_ui() => dword(0xB6159C)
         screen_loading_mem_card = 0x8b4c3f7b
         screen_loading_mem_card_2 = 0xed9cd43f
         screen_main_menu = 0x59c7e444
         screen_cheats = 0x6fb6b5d8
         screen_cheats_inserting = 0xbf576c0c
         screen_store = 0xdbb81588
         screen_store_guitar = 0xec334940
         screen_store_song = 0xb6661f89
         screen_store_character = 0x04922074
         screen_store_video = 0x5a27c877


// Node Structure Offsets
function item_node_data_type(item_func) => dword(item_func + 0x04)
         data_type_unlocked = 0xfef4e1e8
         data_type_purchaseable = 0x61ee5765
         data_type_cash = 0xf9461a46
function item_node_unlock_flag(item_func) => bit0(item_func + 0x08)
function item_node_next_node(item_func) => dword(item_func + 0x0c)

function item_node_2nd_node(item_func) => dword(item_func + 0x0c)
function item_node_3rd_node(item_func) => dword(item_node_2nd_node(item_func) + 0x0c)
function item_node_4th_node(item_func) => dword(item_node_3rd_node(item_func) + 0x0c)


// Guitars
gui_apollo = dword(dword(dword(0x441a20) + 0x04) + 0x04)
gui_bom_chicka_wah_wah = dword(dword(0x441644) + 0x04)
gui_clix = dword(dword(0x43df0c) + 0x04)
gui_corvus_ii = dword(dword(dword(0x43d3f4) + 0x04) + 0x04)
gui_desintegrator_with_radar = dword(dword(0x441e84) + 0x04)
gui_dmz_6000_g_aluminum_neck = dword(dword(dword(0x44403c) + 0x04) + 0x04)
gui_enforcer_four = dword(dword(0x443624) + 0x04)
gui_es_335_dot = dword(dword(0x43c0c4) + 0x04)
gui_explorer_standard = dword(dword(dword(0x439ac4) + 0x04) + 0x04)
gui_farewell_to_kings = dword(dword(0x43dec4) + 0x04)
gui_firebird_v = dword(dword(0x43ac9c) + 0x04)
gui_focus_fatboy = dword(dword(0x43d6d8) + 0x04)
gui_fury = dword(dword(0x43cef8) + 0x04)
gui_game_on_black = dword(dword(0x438a34) + 0x04)
gui_game_on_red = dword(dword(0x439bec) + 0x04)
gui_girl_friday_lady_shapes = dword(dword(0x43dc0c) + 0x04)
gui_hd_6_xpro_gibson_digital = dword(dword(dword(0x43b6a8) + 0x04) + 0x04)
gui_here_kitty_kitty = dword(dword(0x43d1a4) + 0x04)
gui_killer_b_four_string = dword(dword(0x43bd70) + 0x04)
gui_les_paul_gibson_custom = dword(dword(dword(0x444894) + 0x04) + 0x04)
gui_les_paul_gibson_junior = dword(dword(0x443564) + 0x04)
gui_les_paul_special = dword(dword(0x43a7a4) + 0x04)
gui_les_paul_standard = dword(dword(0x43ef68) + 0x04)
gui_marauder_1975 = dword(dword(0x43ab40) + 0x04)
gui_messenger = dword(dword(dword(0x43e63c) + 0x04) + 0x04)
gui_parisienne = dword(dword(0x43a480) + 0x04)
gui_phungalzoft = dword(dword(0x43de58) + 0x04)
gui_sg_standard = dword(dword(dword(0x438ec4) + 0x04) + 0x04)
gui_super_400_ces = dword(dword(0x4392c8) + 0x04)
gui_synapse_ss_2_fa_custom = dword(dword(0x43ef8c) + 0x04)
gui_v_factor_ebony = dword(dword(0x439400) + 0x04)
gui_widow_mako = dword(dword(0x43ae88) + 0x04)

// Characters Guitars
chargui_59_les_paul = dword(dword(0x441278) + 0x04)
chargui_77_solid_gold = dword(dword(0x43c928) + 0x04)
chargui_arm_the_homeless = dword(dword(dword(0x439710) + 0x04) + 0x04)
chargui_obliviaxe_lou_s = dword(dword(0x444374) + 0x04)
chargui_the_unfortunator = dword(dword(0x4397d8) + 0x04)

// Hidden Guitars
hiddengui_bat = dword(dword(0x438ec0) + 0x04)
hiddengui_distant_visitor = dword(dword(0x4409e4) + 0x04)
hiddengui_el_jefe = dword(dword(dword(0x43e684) + 0x04) + 0x04)
hiddengui_jolly_roger = dword(dword(0x440ff0) + 0x04)
hiddengui_moon_shot = dword(dword(0x44147c) + 0x04)
hiddengui_rojimbo = dword(dword(0x43c7f0) + 0x04)
hiddengui_saint_george = dword(dword(0x43e200) + 0x04)
hiddengui_tiki_fortune = dword(dword(0x4403d8) + 0x04)

// Co-op Guitars
coopgui_assassin_ninjastyle = dword(dword(0x443504) + 0x04)
coopgui_beach_life = dword(dword(0x44435c) + 0x04)
coopgui_eyeball = dword(dword(0x443d80) + 0x04)
coopgui_nemesis_13 = dword(dword(0x43c310) + 0x04)
coopgui_pendulaxe = dword(dword(0x43fa24) + 0x04)
coopgui_the_disposed = dword(dword(0x43b5a8) + 0x04)
coopgui_tiki_fortune_4 = dword(dword(0x4438d0) + 0x04)
coopgui_truth_angels_messenger = dword(dword(0x43c274) + 0x04)

// Finishes
f_corvus_black = dword(dword(dword(0x43db50) + 0x04) + 0x04)
f_corvus_white = dword(dword(0x43cd30) + 0x04)
f_es_335_natural = dword(dword(0x439364) + 0x04)
f_es_335_trans_black = dword(dword(0x43a8ac) + 0x04)
f_es_335_triburst = dword(dword(0x43b554) + 0x04)
f_es_335_vintage_sunburst = dword(dword(0x43bfc8) + 0x04)
f_explorer_black = dword(dword(0x438b78) + 0x04)
f_firebird_alpine_white = dword(dword(dword(dword(0x43e6e4) + 0x08) + 0x04) + 0x04)
f_firebird_blue_mist = dword(dword(0x43db10) + 0x04)
f_firebird_ebony = dword(dword(0x43fa60) + 0x04)
f_firebird_vintage_sunburst = dword(dword(0x43a888) + 0x04)
f_focus_candy_apple_red = dword(dword(0x43df60) + 0x04)
f_growler = dword(dword(0x440c00) + 0x04)
f_it_bites = dword(dword(0x43e548) + 0x04)
f_killer_queen = dword(dword(0x43fd84) + 0x04)
f_les_paul_billie_joe = dword(dword(dword(0x440bbc) + 0x04) + 0x04)
f_les_paul_black = dword(dword(0x43f730) + 0x04)
f_les_paul_bullseye = dword(dword(0x43d60c) + 0x04)
f_les_paul_camo = dword(dword(0x43d0cc) + 0x04)
f_les_paul_cherry = dword(dword(0x43c58c) + 0x04)
f_les_paul_chery_sunburst = dword(dword(0x43fe98) + 0x04)
f_les_paul_ebony = dword(dword(dword(0x444018) + 0x04) + 0x04)
f_les_paul_gecko = dword(dword(0x43ac24) + 0x04)
f_les_paul_goldtop = dword(dword(0x43d720) + 0x04)
f_les_paul_heritage_cherry_sunburst = dword(dword(0x4393d0) + 0x04)
f_les_paul_honeyburst = dword(dword(0x443fb4) + 0x04)
f_les_paul_red = dword(dword(0x43aedc) + 0x04)
f_les_paul_sunburst_I = dword(dword(0x438a28) + 0x04)
f_les_paul_sunburst_II_case1 = dword(dword(dword(0x444720) + 0x04) + 0x04)
f_les_paul_sunburst_II_case2 = dword(dword(dword(dword(0x444720) + 0x08) + 0x04) + 0x04)
f_marauder_cherry_red = dword(dword(0x438b6c) + 0x04)
f_marauder_ebony = dword(dword(0x43cb8c) + 0x04)
f_metal_starfish = dword(dword(0x4430d8) + 0x04)
f_sg_black = dword(dword(0x439778) + 0x04)
f_sg_ebony = dword(dword(0x43b3d4) + 0x04)
f_sg_worn_brown = dword(dword(dword(0x43d130) + 0x04) + 0x04)
f_signature_natural = dword(dword(0x441038) + 0x04)
f_sky_burst = dword(dword(0x43e68c) + 0x04)
f_star_abundantly_blue = dword(dword(0x43b530) + 0x04)
f_star_inevitably_dark = dword(dword(0x43f274) + 0x04)
f_star_red_on_white = dword(dword(0x442154) + 0x04)
f_stars_n_stripes = dword(dword(0x4415d8) + 0x04)
f_super_400_ebony = dword(dword(0x43a4a4) + 0x04)
f_super_400_natural = dword(dword(0x4429b8) + 0x04)
f_super_400_triburst = dword(dword(0x43ed94) + 0x04)
f_super_400_white = dword(dword(0x440f9c) + 0x04)
f_super_400_wine_red = dword(dword(0x43e884) + 0x04)
f_v_factor_alpine_white = dword(dword(0x43ef2c) + 0x04)
f_v_factor_cherry = dword(dword(dword(0x43f248) + 0x04) + 0x04)
f_v_factor_hendrix = dword(dword(dword(0x43a82c) + 0x04) + 0x04)
f_v_factor_natural = dword(dword(dword(0x440bec) + 0x04) + 0x04)
f_v_factor_sparkle = dword(dword(dword(0x4399d4) + 0x04) + 0x04)
f_x_plorer_cherry = dword(dword(0x444848) + 0x04)
f_x_plorer_creamy = dword(dword(dword(0x440580) + 0x04) + 0x04)
f_x_plorer_ebony = dword(dword(0x441980) + 0x04)
f_x_plorer_natural = dword(dword(0x43c298) + 0x04)

// Characters
char_elroy_budvis = dword(dword(0x441c98) + 0x04)
char_lou = dword(dword(0x43cbe0) + 0x04)
char_metalhead = dword(dword(0x43c3f4) + 0x04)
char_slash = dword(dword(0x43e908) + 0x04)
char_tom_morello = dword(dword(0x43a804) + 0x04)

// Outfits
otf_axel_shorts = dword(dword(0x4396a0) + 0x04)
otf_captain_x = dword(dword(0x43ea7c) + 0x04)
otf_casey_mo_leather = dword(dword(0x43a228) + 0x04)
otf_izzy_the_peacock = dword(dword(dword(0x44316c) + 0x04) + 0x04)
otf_johnny_mohawk = dword(dword(dword(0x43ef6c) + 0x04) + 0x04)
otf_judy_skool_grrl = dword(dword(0x442670) + 0x04)
otf_lars_viking = dword(dword(0x43fa00) + 0x04)
otf_midori_puffball = dword(dword(0x44033c) + 0x04)

// Styles
s_axel_brown_vest = dword(dword(0x438f98) + 0x04)
s_axel_red_leather = dword(dword(dword(0x43a3f4) + 0x04) + 0x04)
s_axel_stonewashed = dword(dword(0x43e77c) + 0x04)
s_axel_stripes = dword(dword(0x43cc7c) + 0x04)
s_axel_white_vest = dword(dword(0x4388f0) + 0x04)
s_casey_black_n_white = dword(dword(0x43b470) + 0x04)
s_casey_camo = dword(dword(0x439a18) + 0x04)
s_casey_crimson = dword(dword(dword(0x43c278) + 0x04) + 0x04)
s_casey_fiery = dword(dword(0x43d774) + 0x04)
s_casey_vast_purple = dword(dword(0x43af18) + 0x04)
s_elroy_hawaii = dword(dword(0x442aa8) + 0x04)
s_elroy_tijuana = dword(dword(0x43f304) + 0x04)
s_izzy_florid = dword(dword(dword(0x444534) + 0x04) + 0x04)
s_izzy_menagerie = dword(dword(0x442958) + 0x04)
s_izzy_neon_knight = dword(dword(0x4406b4) + 0x04)
s_izzy_starry = dword(dword(dword(0x443e5c) + 0x04) + 0x04)
s_izzy_zebra = dword(dword(0x43f1b4) + 0x04)
s_johnny_eggplant = dword(dword(0x4418b4) + 0x04)
s_johnny_pumpkim = dword(dword(dword(0x43f734) + 0x04) + 0x04)
s_johnny_skeleton = dword(dword(0x441758) + 0x04)
s_johnny_spew = dword(dword(0x4433b4) + 0x04)
s_johnny_two_tone = dword(dword(0x43fc58) + 0x04)
s_judy_dirty_yellow = dword(dword(0x442028) + 0x04)
s_judy_flame_orange = dword(dword(0x443420) + 0x04)
s_judy_jet_black = dword(dword(0x4417ac) + 0x04)
s_judy_riot = dword(dword(0x43fcac) + 0x04)
s_judy_stripes = dword(dword(0x441920) + 0x04)
s_lars_barbaric = dword(dword(0x43f238) + 0x04)
s_lars_freedom = dword(dword(0x44309c) + 0x04)
s_lars_icy = dword(dword(0x43ed10) + 0x04)
s_lars_phantom = dword(dword(0x44459c) + 0x04)
s_lars_umlaut = dword(dword(dword(0x440214) + 0x04) + 0x04)
s_metalhead_marx = dword(dword(0x43c82c) + 0x04)
s_metalhead_super_atomic = dword(dword(dword(0x43cf08) + 0x04) + 0x04)
s_metalhead_tv_head = dword(dword(0x438ea8) + 0x04)
s_midori_aqua = dword(dword(0x441344) + 0x04)
s_midori_candy = dword(dword(0x442460) + 0x04)
s_midori_cream = dword(dword(dword(0x443964) + 0x04) + 0x04)
s_midori_jade = dword(dword(0x43f8ec) + 0x04)
s_midori_maroon = dword(dword(dword(0x440df0) + 0x04) + 0x04)
s_xavier_azure = dword(dword(dword(0x443ba4) + 0x04) + 0x04)
s_xavier_emerald = dword(dword(0x44102c) + 0x04)
s_xavier_george = dword(dword(0x43f52c) + 0x04)
s_xavier_larry = dword(dword(0x4420a0) + 0x04)
s_xavier_paul = dword(dword(0x43fc04) + 0x04)

// Songs
sng_avalancha = dword(dword(0x43c4e4) + 0x04)
sng_can_t_be_saved = dword(dword(0x43ae70) + 0x04)
sng_closer = dword(dword(0x43e02c) + 0x04)
sng_don_t_hold_back = dword(dword(0x442afc) + 0x04)
sng_down_n_dirty = dword(dword(0x442190) + 0x04)
sng_f_c_p_r_e_m_i_x = dword(dword(0x43de1c) + 0x04)
sng_generation_rock = dword(dword(0x440018) + 0x04)
sng_go_that_far = dword(dword(0x43ee3c) + 0x04)
sng_hier_kommt_alex = dword(dword(0x43dcfc) + 0x04)
sng_i_m_in_the_band = dword(dword(0x439310) + 0x04)
sng_impulse = dword(dword(0x43f424) + 0x04)
sng_in_flames = dword(dword(0x43f514) + 0x04)
sng_in_love = dword(dword(0x43db58) + 0x04)
sng_in_the_belly_of_a_shark = dword(dword(0x43ef14) + 0x04)
sng_metal_heavy_lady = dword(dword(0x444050) + 0x04)
sng_minus_celsius = dword(dword(0x43f2a4) + 0x04)
sng_mouvais_garçon = dword(dword(0x441698) + 0x04)
sng_my_curse = dword(dword(0x443fcc) + 0x04)
sng_nothing_for_me_here = dword(dword(0x443f90) + 0x04)
sng_radio_song = dword(dword(0x43e14c) + 0x04)
sng_rise_against = dword(dword(0x4438b8) + 0x04)
sng_ruby = dword(dword(0x43ac0c) + 0x04)
sng_the_stone_roses = dword(dword(0x43c910) + 0x04)
sng_the_way_it_ends = dword(dword(0x43def4) + 0x04)

// Videos
v_bret_michaels = dword(dword(0x43c37c) + 0x04)
v_slash = dword(dword(0x43e95c) + 0x04)
v_the_sex_pistols = dword(dword(0x441ec0) + 0x04)
v_tom_morello = dword(dword(0x43e17c) + 0x04)


// Dictionaries
difficulty = {
    0:"Easy",
    1:"Medium",
    2:"Hard",
    3:"Expert"
}

// Unlockable Arrays

// all guiters except Co-op exclusives
unlockables_all_guitars = [gui_apollo, gui_bom_chicka_wah_wah, gui_clix, gui_corvus_ii, gui_desintegrator_with_radar, gui_dmz_6000_g_aluminum_neck, gui_enforcer_four, gui_es_335_dot, gui_explorer_standard, gui_farewell_to_kings, gui_firebird_v, gui_focus_fatboy, gui_fury, gui_game_on_black, gui_game_on_red, gui_girl_friday_lady_shapes, gui_hd_6_xpro_gibson_digital, gui_here_kitty_kitty, gui_killer_b_four_string, gui_les_paul_gibson_custom, gui_les_paul_gibson_junior, gui_les_paul_special, gui_les_paul_standard, gui_marauder_1975, gui_messenger, gui_parisienne, gui_phungalzoft, gui_sg_standard, gui_super_400_ces, gui_synapse_ss_2_fa_custom, gui_v_factor_ebony, gui_widow_mako, hiddengui_bat, hiddengui_distant_visitor, hiddengui_el_jefe, hiddengui_jolly_roger, hiddengui_moon_shot, hiddengui_rojimbo, hiddengui_saint_george, hiddengui_tiki_fortune, chargui_77_solid_gold, chargui_arm_the_homeless, chargui_obliviaxe_lou_s, chargui_the_unfortunator, coopgui_assassin_ninjastyle]

unlockables_guitars = [gui_apollo, gui_bom_chicka_wah_wah, gui_clix, gui_corvus_ii, gui_desintegrator_with_radar, gui_dmz_6000_g_aluminum_neck, gui_enforcer_four, gui_es_335_dot, gui_explorer_standard, gui_farewell_to_kings, gui_firebird_v, gui_focus_fatboy, gui_fury, gui_game_on_black, gui_game_on_red, gui_girl_friday_lady_shapes, gui_hd_6_xpro_gibson_digital, gui_here_kitty_kitty, gui_killer_b_four_string, gui_les_paul_gibson_custom, gui_les_paul_gibson_junior, gui_les_paul_special, gui_les_paul_standard, gui_marauder_1975, gui_messenger, gui_parisienne, gui_phungalzoft, gui_sg_standard, gui_super_400_ces, gui_synapse_ss_2_fa_custom, gui_v_factor_ebony, gui_widow_mako]

unlockables_coop_guitars = [coopgui_assassin_ninjastyle, coopgui_beach_life, coopgui_eyeball, coopgui_nemesis_13, coopgui_pendulaxe, coopgui_the_disposed, coopgui_tiki_fortune_4, coopgui_truth_angels_messenger]

unlockables_chars_gui = [chargui_59_les_paul, chargui_77_solid_gold, chargui_arm_the_homeless, chargui_obliviaxe_lou_s, chargui_the_unfortunator]

unlockables_hidden_guitars = [hiddengui_bat, hiddengui_distant_visitor, hiddengui_el_jefe, hiddengui_jolly_roger, hiddengui_moon_shot, hiddengui_rojimbo, hiddengui_saint_george, hiddengui_tiki_fortune]


unlockables_finishes = [f_corvus_black, f_corvus_white, f_es_335_natural, f_es_335_trans_black, f_es_335_triburst, f_es_335_vintage_sunburst, f_explorer_black, f_firebird_alpine_white, f_firebird_blue_mist, f_firebird_ebony, f_firebird_vintage_sunburst, f_focus_candy_apple_red, f_growler, f_it_bites, f_killer_queen, f_les_paul_billie_joe, f_les_paul_black, f_les_paul_bullseye, f_les_paul_camo, f_les_paul_cherry, f_les_paul_chery_sunburst, f_les_paul_ebony, f_les_paul_gecko, f_les_paul_goldtop, f_les_paul_heritage_cherry_sunburst, f_les_paul_honeyburst, f_les_paul_red, f_les_paul_sunburst_I, f_les_paul_sunburst_II_case1, f_les_paul_sunburst_II_case2, f_marauder_cherry_red, f_marauder_ebony, f_metal_starfish, f_sg_black, f_sg_ebony, f_sg_worn_brown, f_signature_natural, f_sky_burst, f_star_abundantly_blue, f_star_inevitably_dark, f_star_red_on_white, f_stars_n_stripes, f_super_400_ebony, f_super_400_natural, f_super_400_triburst, f_super_400_white, f_super_400_wine_red, f_v_factor_alpine_white, f_v_factor_cherry, f_v_factor_hendrix, f_v_factor_natural, f_v_factor_sparkle, f_x_plorer_cherry, f_x_plorer_creamy, f_x_plorer_ebony, f_x_plorer_natural]

unlockables_chars = [char_elroy_budvis, char_lou, char_metalhead, char_slash, char_tom_morello]

unlockables_outfits = [otf_axel_shorts, otf_captain_x, otf_casey_mo_leather, otf_izzy_the_peacock, otf_johnny_mohawk, otf_judy_skool_grrl, otf_lars_viking, otf_midori_puffball]

unlockables_styles = [s_axel_brown_vest, s_axel_red_leather, s_axel_stonewashed, s_axel_stripes, s_axel_white_vest, s_casey_black_n_white, s_casey_camo, s_casey_crimson, s_casey_fiery, s_casey_vast_purple, s_elroy_hawaii, s_elroy_tijuana, s_izzy_florid, s_izzy_menagerie, s_izzy_neon_knight, s_izzy_starry, s_izzy_zebra, s_johnny_eggplant, s_johnny_pumpkim, s_johnny_skeleton, s_johnny_spew, s_johnny_two_tone, s_judy_dirty_yellow, s_judy_flame_orange, s_judy_jet_black, s_judy_riot, s_judy_stripes, s_lars_barbaric, s_lars_freedom, s_lars_icy, s_lars_phantom, s_lars_umlaut, s_metalhead_marx, s_metalhead_super_atomic, s_metalhead_tv_head, s_midori_aqua, s_midori_candy, s_midori_cream, s_midori_jade, s_midori_maroon, s_xavier_azure, s_xavier_emerald, s_xavier_george, s_xavier_larry, s_xavier_paul]

unlockables_songs = [sng_avalancha, sng_can_t_be_saved, sng_closer, sng_don_t_hold_back, sng_down_n_dirty, sng_f_c_p_r_e_m_i_x, sng_generation_rock, sng_go_that_far, sng_hier_kommt_alex, sng_i_m_in_the_band, sng_impulse, sng_in_flames, sng_in_love, sng_in_the_belly_of_a_shark, sng_metal_heavy_lady, sng_minus_celsius, sng_mouvais_garçon, sng_my_curse, sng_nothing_for_me_here, sng_radio_song, sng_rise_against, sng_ruby, sng_the_stone_roses, sng_the_way_it_ends]

unlockables_videos = [v_bret_michaels, v_slash, v_the_sex_pistols, v_tom_morello]

// =========================================
//              Utility Functions              
// =========================================

function is_on_store() {
    return (
        current_screen_ui() == screen_store ||
        current_screen_ui() == screen_store_character ||
        current_screen_ui() == screen_store_guitar ||
        current_screen_ui() == screen_store_song ||
        current_screen_ui() == screen_store_video
    )
}

function save_protection() =>   never(current_screen_ui() == screen_loading_mem_card) &&
                                never(current_screen_ui() == screen_loading_mem_card_2) &&  
                                never(current_screen_ui() == screen_cheats) &&
                                never(current_screen_ui() == screen_cheats_inserting)

function item_has_been_unlocked_3nodes(node) {
    node_2nd = item_node_2nd_node(node)
    node_3rd = item_node_3rd_node(node)
    node_4th = item_node_4th_node(node)
    return (
            (
                (item_node_data_type(node) == data_type_unlocked &&
                item_node_unlock_flag(node) == 1) ||
                (item_node_data_type(node_2nd) == data_type_unlocked &&
                item_node_unlock_flag(node_2nd) == 1) ||
                (item_node_data_type(node_3rd) == data_type_unlocked &&
                item_node_unlock_flag(node_3rd) == 1)
            ) &&
            (
                item_node_unlock_flag(node) > prev(item_node_unlock_flag(node)) ||
                item_node_unlock_flag(node_2nd) > prev(item_node_unlock_flag(node_2nd))  ||
                item_node_unlock_flag(node_3rd) > prev(item_node_unlock_flag(node_3rd)) 
            )
    )
}

function item_has_been_unlocked_4nodes(node) {
    node_2nd = item_node_2nd_node(node)
    node_3rd = item_node_3rd_node(node)
    node_4th = item_node_4th_node(node)
    return (
            (
                (item_node_data_type(node) == data_type_unlocked &&
                item_node_unlock_flag(node) == 1) ||
                (item_node_data_type(node_2nd) == data_type_unlocked &&
                item_node_unlock_flag(node_2nd) == 1) ||
                (item_node_data_type(node_3rd) == data_type_unlocked &&
                item_node_unlock_flag(node_3rd) == 1) ||
                (item_node_data_type(node_4th) == data_type_unlocked &&
                item_node_unlock_flag(node_4th) == 1)
            ) &&
            (
                item_node_unlock_flag(node) > prev(item_node_unlock_flag(node)) ||
                item_node_unlock_flag(node_2nd) > prev(item_node_unlock_flag(node_2nd)) ||
                item_node_unlock_flag(node_3rd) > prev(item_node_unlock_flag(node_3rd)) ||
                item_node_unlock_flag(node_4th) > prev(item_node_unlock_flag(node_4th)) 
            )
    )
}

function item_array_has_been_unlocked_4nodes(node_array, size) {
    logic_array_current = []
    logic_array_previous = always_false()
    for node in node_array {
        node_2nd = item_node_2nd_node(node)
        node_3rd = item_node_3rd_node(node)
        node_4th = item_node_4th_node(node)

        // "item_node_2nd_node(node) > 0" is needed on each node to check if it isn't a single-node linked list
        array_push(logic_array_current, once(item_node_2nd_node(node) > 0 &&
                                        item_node_data_type(node) == data_type_unlocked &&
                                        item_node_unlock_flag(node) == 1))
        array_push(logic_array_current, once(item_node_2nd_node(node) > 0 &&
                                        item_node_data_type(node_2nd) == data_type_unlocked &&
                                        item_node_unlock_flag(node_2nd) == 1))
        array_push(logic_array_current, once(item_node_2nd_node(node) > 0 &&
                                        item_node_data_type(node_3rd) == data_type_unlocked &&
                                        item_node_unlock_flag(node_3rd) == 1))
        array_push(logic_array_current, once(item_node_2nd_node(node) > 0 &&
                                        item_node_data_type(node_4th) == data_type_unlocked &&
                                        item_node_unlock_flag(node_4th) == 1))

        logic_array_previous = logic_array_previous ||
                        (
                            (prev(item_node_2nd_node(node)) > 0) &&
                            (
                                (prev(item_node_unlock_flag(node)) < item_node_unlock_flag(node)) ||
                                (prev(item_node_unlock_flag(node_2nd)) < item_node_unlock_flag(node_2nd)) ||
                                (prev(item_node_unlock_flag(node_3rd)) < item_node_unlock_flag(node_3rd)) ||
                                (prev(item_node_unlock_flag(node_4th)) < item_node_unlock_flag(node_4th))
                            )
                        )
                        
        // logic_array_previous = logic_array_previous ||
        //                         (prev(item_node_data_type(node)) == data_type_unlocked &&
        //                         prev(item_node_unlock_flag(node)) == 0) ||
        //                         (prev(item_node_data_type(node_2nd)) == data_type_unlocked &&
        //                         prev(item_node_unlock_flag(node_2nd)) == 0) ||
        //                         (prev(item_node_data_type(node_3rd)) == data_type_unlocked &&
        //                         prev(item_node_unlock_flag(node_3rd)) == 0) ||
        //                         (prev(item_node_data_type(node_4th)) == data_type_unlocked &&
        //                         prev(item_node_unlock_flag(node_4th)) == 0)

        

        // array_push(logic_array_previous, prev(item_node_data_type(node)) == data_type_unlocked &&
        //                                  prev(item_node_unlock_flag(node)) == 0)
        // array_push(logic_array_previous, prev(item_node_data_type(node_2nd)) == data_type_unlocked &&
        //                                  prev(item_node_unlock_flag(node_2nd)) == 0)
        // array_push(logic_array_previous, prev(item_node_data_type(node_3rd)) == data_type_unlocked &&
        //                                  prev(item_node_unlock_flag(node_3rd)) == 0)
        // array_push(logic_array_previous, prev(item_node_data_type(node_4th)) == data_type_unlocked &&
        //                                  prev(item_node_unlock_flag(node_4th)) == 0)
    }
    return measured(tally(size, logic_array_current)) && logic_array_previous
}

function item_array_has_been_unlocked_1node(node_array, size) {
    logic_array_current = []
    logic_array_previous = always_false()

    for node in node_array {
        array_push(logic_array_current, once(item_node_data_type(node) == data_type_unlocked &&
                                             item_node_unlock_flag(node) == 1))

        logic_array_previous = logic_array_previous ||
                                (
                                    item_node_data_type(node) == data_type_unlocked &&
                                    item_node_unlock_flag(node) > prev(item_node_unlock_flag(node))
                                )
    }

    return measured(tally(size, logic_array_current)) && logic_array_previous
}


// =========================================
//                Unlockables              
// =========================================

achievement("Guitar Hoarder I", "Buy 50% of the regular guitars from the store.", 10,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        item_array_has_been_unlocked_4nodes(unlockables_guitars, length(unlockables_guitars) / 2)
            )

achievement("Guitar Hoarder II", "Buy all regular guitars from the store.", 25,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        item_array_has_been_unlocked_4nodes(unlockables_guitars, length(unlockables_guitars))
            )

achievement("Guitar Enthusiast I", "Buy 50% of the Finishes from the store.", 10,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        item_array_has_been_unlocked_4nodes(unlockables_finishes, (length(unlockables_finishes) / 2) - 1)
            )

achievement("Guitar Enthusiast II", "Buy all Finishes from the store.", 25,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        item_array_has_been_unlocked_4nodes(unlockables_finishes, length(unlockables_finishes) - 1)
            )

achievement("Song Collector I", "Buy 50% of the songs from the store.", 10,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        item_array_has_been_unlocked_4nodes(unlockables_songs, length(unlockables_songs) / 2)
            )

achievement("Song Collector II", "Buy all songs from the store.", 25,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        item_array_has_been_unlocked_4nodes(unlockables_songs, length(unlockables_songs))
            )

achievement("Full Wardrobe", "Buy all outfits from the store.", 10,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        item_array_has_been_unlocked_1node(unlockables_outfits, length(unlockables_outfits))
            )

achievement("Stylist I", "Buy 50% of the styles from the store.", 5,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        item_array_has_been_unlocked_1node(unlockables_styles, length(unlockables_styles) / 2)
            )

achievement("Stylist II", "Buy all styles from the store.", 10,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        item_array_has_been_unlocked_1node(unlockables_styles, length(unlockables_styles))
            )

achievement("Video Collector", "Buy all videos from the store.", 10,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        item_array_has_been_unlocked_1node(unlockables_videos, length(unlockables_videos))
            )



// =========================================
//              Unlock Characters              
// =========================================

achievement("Elroy Budvis", "Unlock Elroy Budvis!", 10,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        item_has_been_unlocked_3nodes(char_elroy_budvis))

achievement("Metalhead", "Unlock Metalhead!", 10,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        item_has_been_unlocked_3nodes(char_metalhead))

achievement("Tom Morello", "Unlock Tom Morello!", 10,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        item_has_been_unlocked_4nodes(char_tom_morello))

achievement("Slash", "Unlock Slash!", 10,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        item_has_been_unlocked_4nodes(char_slash))

achievement("Lou", "Unlock Lou!", 10,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        item_has_been_unlocked_4nodes(char_lou))

// =========================================
//              Special Guitars              
// =========================================

achievement("Moon Shot", "Unlock Moon Shot!", 5,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        debug_block() &&
                        item_has_been_unlocked_4nodes(hiddengui_moon_shot))

achievement("Saint George!", "Unlock Saint George!", 5,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        debug_block() &&
                        item_has_been_unlocked_4nodes(hiddengui_saint_george))

achievement("Rojimbo!", "Unlock Rojimbo!", 5,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        debug_block() &&
                        item_has_been_unlocked_4nodes(hiddengui_rojimbo))

achievement("Distant Visitor", "Unlock Distant Visitor", 5,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        debug_block() &&
                        item_has_been_unlocked_4nodes(hiddengui_distant_visitor))

achievement("Bat", "Unlock Bat!", 25,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        debug_block() &&
                        item_has_been_unlocked_4nodes(hiddengui_bat))

achievement("Jolly Roger!", "Unlock Jolly Roger!", 25,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        debug_block() &&
                        item_has_been_unlocked_4nodes(hiddengui_jolly_roger))

achievement("Tiki Fortune", "Unlock Tiki Fortune!", 50,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        debug_block() &&
                        item_has_been_unlocked_4nodes(hiddengui_tiki_fortune))

achievement("El Jefe", "Unlock El Jefe!", 100,
            trigger =   save_protection() &&
                        never(current_screen_ui() == 0) &&
                        debug_block() &&
                        item_has_been_unlocked_4nodes(hiddengui_el_jefe))


// =========================================
//               Rich Presence              
// =========================================

song_rp_list = { //First ID. 
    0x736c6f77:"Slow Ride",
    0x74616c6b:"Talk Dirty To Me",
    0x6869746d:"Hit Me With Your Best Shot",
    0x73746f72:"Story Of My Life",
    0x7361626f:"Sabotage",
    0x7363686f:"School's Out",
    0x73756e73:"Sunshine of Your Love",
    0x62617272:"Barracuda",
    0x62756c6c:"Bulls on Parade",
    0x72657074:"Reptilia",
    0x7768656e:"When You Were Young",
    0x6d697373:"Miss Murder",
    0x74686573:"The Seeker",
    0x6c617964:"Lay Down",
    0x7061696e:"Paint It Black",
    0x7375636b:"Suck My Kiss",
    0x70617261:"Paranoid",
    0x616e6172:"Anarchy in the U.K.",
    0x6b6f6f6c:"Kool Thing",
    0x6d796e61:"My Name Is Jonas",
    0x6576656e:"Even Flow",
    0x63697469:"Cities On Flame with Rock & Roll",
    0x686f6c69:"Holiday In Cambodia",
    0x726f636b:"Rock You Like a Hurricane",
    0x73616d65:"Same Old Song and Dance",
    0x6c616772:"La Grange",
    0x77656c63:"Welcome To The Jungle",
    0x68656c69:"Helicopter",
    0x63686572:"Cherub Rock",
    0x626c6163:"Black Sunshine",
    0x7468656d:"The Metal",
    0x70726964:"Pride and Joy",
    0x6d6f6e73:"Monsters",
    0x6265666f:"Before I Forget",
    0x73747269:"Stricken",
    0x74687265:"3's & 7's",
    0x6b6e6967:"Knights of Cydonia",
    0x63756c74:"Cult of Personality",
    0x7261696e:"Raining Blood",
    0x636c6966:"Cliffs of Dover",
    0x6e756d62:"The Number of the Beast",
    0x6f6e652e:"One",
    0x6176616c:"Avalancha",
    0x62656c6c:"In The Belly Of A Shark",
    0x63616e74:"Can't Be Saved",
    0x636c6f73:"Closer",
    0x646f6e74:"Don't Hold Back",
    0x646f776e:"Down 'N Dirty",
    0x66637072:"F.C.P.R.E.M.I.X.",
    0x67656e65:"Generation Rock",
    0x676f7468:"Go That Far",
    0x68696572:"Hier Kommt Alex",
    0x696d696e:"I'm In The Band",
    0x696d7075:"Impulse",
    0x696e6c6f:"In Love",
    0x6d617576:"Mauvais Garcon",
    0x6d657461:"Metal Heavy Lady",
    0x6d696e75:"Minus Celsius",
    0x6d796375:"My Curse",
    0x6e6f7468:"Nothing For Me Here",
    0x70726179:"Prayer Of The Refugee",
    0x72616469:"Radio Song",
    0x72756279:"Ruby",
    0x73686562:"She Bangs The Drums",
    0x74616b65:"Take This Life",
    0x74686577:"The Way It Ends",
    0x74687275:"Through The Fire and Flames"
}

guitar_bosses_rp = {
    0x746f6d2e:"Tom Morello",
    0x736c6173:"Slash",
    0x64657669:"Lou"
}

screen_rp_list = {
    // General
   "Loading...": 0, // Nothing
   "Loading the game": 2337030011, // Memory card (boot)
   "Loading the memory card": 3986478143, // Memory card (game options)
   "Main Menu": 1506272324,
   "Options": 0x5a6bbf96,
   "Viewing the Top Rockers": 0x9730a09a,
   "Selecting a difficulty": 1986084942,
   "Practice sections": 1130730783,
   "Picking a music in the setlist": 1755261919,
   "Selecting a practice mode": 3777828548,
   "Song play results": 522170981,
   "Gig money receipt": 3937313987,
   // Career
   "Band select": 0xcd26aaa1,
   "Career main menu": 4227955679,
   "Venue show selection": 2585246215,
   "Changing a character": 140641623,
   "Selecting a outfit": 4241796405,
   "Selecting a guitar": 436225454,
   // Store
   "In the Guitar Center": 3686274440,
   "Looking to buy a new guitar": 3962784064,
   "Looking to buy a new song": 3060146057,
   "Looking to buy a new character": 76685428,
   "Looking to buy a new video": 1512556663
}

function difficulty_read() => rich_presence_lookup("Difficulty", difficulty(), difficulty)

// rich_presence_conditional_display(dword(0x2616dc) == 0x224, "Playing Guitar Hero with the Debug Menu. Booo!!!!")

// // Boss Battle
// rich_presence_conditional_display(guitar_battle_check() && game_state() == in_game, "Battling {0} on {1}",
//                                   rich_presence_lookup("Boss", secondsongID(), guitar_bosses_rp),
//                                   difficulty_read()   
// )

// // Exceptions
// rich_presence_conditional_display(song_exception_check(0x626c6163, 0x6b6d6167) && game_state() == in_game, "Rockin' out to Black Magic Woman on {0}. Score: {1}", //Black Magic Woman
//                                  difficulty_read(),
//                                  rich_presence_macro("Number", current_score())
// )
// rich_presence_conditional_display(song_exception_check(0x6d697373, 0x69737369) && game_state() == in_game, "Rockin' out to Mississippi Queen on {0}. Score: {1}", //Mississippi Queen
//                                  difficulty_read(),
//                                  rich_presence_macro("Number", current_score())
// )
// rich_presence_conditional_display(song_exception_check(0x726f636b, 0x6e726f6c) && game_state() == in_game, "Rockin' out to Rock and Roll All Nite on {0}. Score: {1}",
//                                  difficulty_read(),
//                                  rich_presence_macro("Number", current_score())
// )

// // Normal
// rich_presence_conditional_display(game_state() == in_game, "Rockin' out to {0} on {1}. Score: {2}",
//                                   rich_presence_lookup("Song", firstsongID(), song_rp_list),
//                                   difficulty_read(),
//                                   rich_presence_macro("Number", current_score())
// )

// // Screens
// for screen in screen_rp_list {
//     rich_presence_conditional_display(dword(0xB6159C) == screen_rp_list[screen], screen)
// }

// rich_presence_display("In Menu")