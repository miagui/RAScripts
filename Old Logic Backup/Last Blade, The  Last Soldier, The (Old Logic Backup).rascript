// Last Blade, The | Last Soldier, The
// #ID = 12040

// MVS
function p1_hp_mvs() => byte(0x0006F3)
function p2_hp_mvs() => byte(0x0006F5)
function p2_hits_mvs() => byte(0x000722)
function p1_hits_mvs() => byte(0x000723)
function p1_rounds_win_mvs() => byte(0x00073F)

// AES Asia
function p1_hp_aes_a() => byte(0x0012F3)
function p2_hp_aes_a() => byte(0x0012F5)
function p2_hits_aes_a() => byte(0x001322)
function p1_hits_aes_a() => byte(0x001323)
function p1_rounds_win_aes_a() => byte(0x00133F)

// AES
function p1_hp_aes() => byte(0x001AF3)
function p2_hp_aes() => byte(0x001AF5)
function p2_hits_aes() => byte(0x001B22)
function p1_hits_aes() => byte(0x001B23)
function p1_rounds_wins_aes() => byte(0x001B3F)

// Game
function game_mode_l4() => low4(0x009D95)
function game_mode() => byte(0x009D95)
function game_stage() => byte(0x00AC40)
function ladder_progress_l4() => low4(0x00AC42)
function ladder_progress() => byte(0x00AC42)
function ladder_progress_w() => word(0x00AC42)
function mode_gauge_select() => byte(0x00ACB5)
function game_speed_flag() => bit0(0x00D313)
function game_timer() => byte(0x00E32A)
function settings_difficulty() => byte(0x00FD8A)
function settings_timer() => byte(0x00FD8B)

// Player
function p1_char() => byte(0x00EAAC)
function p2_char() => byte(0x00ACBC)

// Pointer to Character Animation
function p_anim_char() => word(0x00AC2E)

function p1_kaede_awakening() => byte(0x00ACA4)

function p1_score_10000_l4() => low4(0x00E2CE)
function p1_score_10000_h4() => high4(0x00E2CE)
function p1_score_10000() => byte(0x00E2CE)
function p1_score_10000000_l4() => low4(0x00E2CF)
function p1_score_10000000_h4() => high4(0x00E2CF)
function p1_score_10_l4() => low4(0x00E2D0)
function p1_score_10_h4() => high4(0x00E2D0)
function p1_score_1000_l4() => low4(0x00E2D1)
function p1_score_1000_h4() => high4(0x00E2D1)

function p1_input_b4() => bit4(0x00FD94)
function p1_input_b5() => bit5(0x00FD94)
function p1_input_b6() => bit6(0x00FD94)
function p1_input_b7() => bit7(0x00FD94)
function p2_state() => byte(0x00FDB6)
function p1_state() => byte(0x00FDB7)

function unibios_flag() => dword(0x00FE30)
function bios_flag_bad() => byte(0x00FD82)

achievement(
    title = "Hayate-Maru - Meaning Squall Rounder", description = "Finish Story-mode with Kaede | (Default Setting) [Default difficulty or above]", points = 10,
    id = 133073, badge = "147253", published = "25/11/2020 23:47:53", modified = "08/12/2020 04:01:16",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode() != 0) && settings_timer() == 1 && once(p2_char() == 13) && once(game_stage() ==
               13) && ladder_progress() == 10 && ladder_progress() > prev(ladder_progress()) && never(p1_char_select() != 0) &&
              ((p1_rounds_wins_aes() == 2 && settings_difficulty() >= 2) ||
               (p1_rounds_win_mvs() == 2 && settings_difficulty() >= 3) ||
               (p1_rounds_win_aes_a() == 2 && settings_difficulty() >= 2))
)

achievement(
    title = "Katsura of the Moon - Tsuki no Katsura", description = "Finish Story-mode with Moriya | (Default Setting) [Default difficulty or above]", points = 10,
    id = 133074, badge = "147254", published = "25/11/2020 23:47:57", modified = "08/12/2020 04:01:13",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode() != 0) && settings_timer() == 1 && once(p2_char() == 13) && once(game_stage() ==
               13) && ladder_progress() == 10 && ladder_progress() > prev(ladder_progress()) && never(p1_char_select() != 1) &&
              ((p1_rounds_wins_aes() == 2 && settings_difficulty() >= 2) ||
               (p1_rounds_win_mvs() == 2 && settings_difficulty() >= 3) ||
               (p1_rounds_win_aes_a() == 2 && settings_difficulty() >= 2))
)

achievement(
    title = "Bodan - Meaning Peony", description = "Finish Story-mode with Yuki | (Default Setting) [Default difficulty or above]", points = 10,
    id = 133082, badge = "147257", published = "25/11/2020 23:48:19", modified = "08/12/2020 04:01:11",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode() != 0) && settings_timer() == 1 && once(p2_char() == 13) && once(game_stage() ==
               13) && ladder_progress() == 10 && ladder_progress() > prev(ladder_progress()) && never(p1_char_select() != 2) &&
              ((p1_rounds_wins_aes() == 2 && settings_difficulty() >= 2) ||
               (p1_rounds_win_mvs() == 2 && settings_difficulty() >= 3) ||
               (p1_rounds_win_aes_a() == 2 && settings_difficulty() >= 2))
)

achievement(
    title = "Guren - Crimson Lotus", description = "Finish Story-mode with Lee | (Default Setting) [Default difficulty or above]", points = 10,
    id = 133081, badge = "147255", published = "25/11/2020 23:48:15", modified = "08/12/2020 04:01:09",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode() != 0) && settings_timer() == 1 && once(p2_char() == 13) && once(game_stage() ==
               13) && ladder_progress() == 10 && ladder_progress() > prev(ladder_progress()) && never(p1_char_select() != 9) &&
              ((p1_rounds_wins_aes() == 2 && settings_difficulty() >= 2) ||
               (p1_rounds_win_mvs() == 2 && settings_difficulty() >= 3) ||
               (p1_rounds_win_aes_a() == 2 && settings_difficulty() >= 2))
)

achievement(
    title = "Hihon - Which Holds Turtles", description = "Finish Story-mode with Okina | (Default Setting) [Default difficulty or above]", points = 10,
    id = 133080, badge = "147256", published = "25/11/2020 23:48:12", modified = "08/12/2020 04:01:06",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode() != 0) && settings_timer() == 1 && once(p2_char() == 13) && once(game_stage() ==
               13) && ladder_progress() == 10 && ladder_progress() > prev(ladder_progress()) && never(p1_char_select() != 3) &&
              ((p1_rounds_wins_aes() == 2 && settings_difficulty() >= 2) ||
               (p1_rounds_win_mvs() == 2 && settings_difficulty() >= 3) ||
               (p1_rounds_win_aes_a() == 2 && settings_difficulty() >= 2))
)

achievement(
    title = "Kongo Rakan - Adamantine Arhat a Metal Club", description = "Finish Story-mode with Juzoh | (Default Setting) [Default difficulty or above]", points = 10,
    id = 133079, badge = "147258", published = "25/11/2020 23:48:10", modified = "08/12/2020 04:01:04",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode() != 0) && settings_timer() == 1 && once(p2_char() == 13) && once(game_stage() ==
               13) && ladder_progress() == 10 && ladder_progress() > prev(ladder_progress()) && never(p1_char_select() != 5) &&
              ((p1_rounds_wins_aes() == 2 && settings_difficulty() >= 2) ||
               (p1_rounds_win_mvs() == 2 && settings_difficulty() >= 3) ||
               (p1_rounds_win_aes_a() == 2 && settings_difficulty() >= 2))
)

achievement(
    title = "Lunatic Blade - Vulture a Hagewashi", description = "Finish Story-mode with Shikyoh | (Default Setting) [Default difficulty or above]", points = 10,
    id = 133078, badge = "147261", published = "25/11/2020 23:48:07", modified = "08/12/2020 04:01:00",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode() != 0) && settings_timer() == 1 && once(p2_char() == 13) && once(game_stage() ==
               13) && ladder_progress() == 10 && ladder_progress() > prev(ladder_progress()) && never(p1_char_select() != 7) &&
              ((p1_rounds_wins_aes() == 2 && settings_difficulty() >= 2) ||
               (p1_rounds_win_mvs() == 2 && settings_difficulty() >= 3) ||
               (p1_rounds_win_aes_a() == 2 && settings_difficulty() >= 2))
)

achievement(
    title = "Otokomae - Handsome Man a Bokutou", description = "Finish Story-mode with Amano | (Default Setting) [Default difficulty or above]", points = 10,
    id = 133084, badge = "147262", published = "25/11/2020 23:48:33", modified = "08/12/2020 04:00:58",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode() != 0) && settings_timer() == 1 && once(p2_char() == 13) && once(game_stage() ==
               13) && ladder_progress() == 10 && ladder_progress() > prev(ladder_progress()) && never(p1_char_select() != 8) &&
              ((p1_rounds_wins_aes() == 2 && settings_difficulty() >= 2) ||
               (p1_rounds_win_mvs() == 2 && settings_difficulty() >= 3) ||
               (p1_rounds_win_aes_a() == 2 && settings_difficulty() >= 2))
)

achievement(
    title = "Meian - Light and Darkness a Heihaku", description = "Finish Story-mode with Akari | (Default Setting) [Default difficulty or above]", points = 10,
    id = 133083, badge = "147260", published = "25/11/2020 23:48:22", modified = "08/12/2020 04:00:56",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode() != 0) && settings_timer() == 1 && once(p2_char() == 13) && once(game_stage() ==
               13) && ladder_progress() == 10 && ladder_progress() > prev(ladder_progress()) && never(p1_char_select() != 4) &&
              ((p1_rounds_wins_aes() == 2 && settings_difficulty() >= 2) ||
               (p1_rounds_win_mvs() == 2 && settings_difficulty() >= 3) ||
               (p1_rounds_win_aes_a() == 2 && settings_difficulty() >= 2))
)

achievement(
    title = "Hayabusa - Peregrine Falcon a Katana", description = "Finish Story-mode with Washizuka | (Default Setting) [Default difficulty or above]", points = 10,
    id = 133085, badge = "147259", published = "25/11/2020 23:48:36", modified = "08/12/2020 04:00:54",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode() != 0) && settings_timer() == 1 && once(p2_char() == 13) && once(game_stage() ==
               13) && ladder_progress() == 10 && ladder_progress() > prev(ladder_progress()) && never(p1_char_select() != 6) &&
              ((p1_rounds_wins_aes() == 2 && settings_difficulty() >= 2) ||
               (p1_rounds_win_mvs() == 2 && settings_difficulty() >= 3) ||
               (p1_rounds_win_aes_a() == 2 && settings_difficulty() >= 2))
)

achievement(
    title = "Mantis Blade - Shadow and Mantis Blade a Stream", description = "Finish Story-mode with Zantetsu | (Default Setting) [Default difficulty or above]", points = 10,
    id = 133086, badge = "147263", published = "25/11/2020 23:48:39", modified = "08/12/2020 04:00:52",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode() != 0) && settings_timer() == 1 && once(p2_char() == 13) && once(game_stage() ==
               13) && ladder_progress() == 10 && ladder_progress() > prev(ladder_progress()) && never(p1_char_select() != 10) &&
              ((p1_rounds_wins_aes() == 2 && settings_difficulty() >= 2) ||
               (p1_rounds_win_mvs() == 2 && settings_difficulty() >= 3) ||
               (p1_rounds_win_aes_a() == 2 && settings_difficulty() >= 2))
)

achievement(
    title = "Byakko no Juzu Rosary of Byakko", description = "Finish Story-mode with Shigen | (Default Setting) [Default difficulty or above]", points = 10,
    id = 133087, badge = "147264", published = "25/11/2020 23:48:42", modified = "08/12/2020 04:00:49",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode() != 0) && settings_timer() == 1 && once(p2_char() == 13) && once(game_stage() ==
               13) && ladder_progress() == 10 && ladder_progress() > prev(ladder_progress()) && never(p1_char_select() != 11) &&
              ((p1_rounds_wins_aes() == 2 && settings_difficulty() >= 2) ||
               (p1_rounds_win_mvs() == 2 && settings_difficulty() >= 3) ||
               (p1_rounds_win_aes_a() == 2 && settings_difficulty() >= 2))
)

achievement(
    title = "An Unnamed Katana and Wakizashi", description = "Finish Story-mode with Musahi | (Default Setting) [Default difficulty or above]", points = 10,
    id = 133088, badge = "147268", published = "25/11/2020 23:48:46", modified = "08/12/2020 04:00:47",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode() != 0) && settings_timer() == 1 && once(p2_char() == 13) && once(game_stage() ==
               13) && ladder_progress() == 10 && ladder_progress() > prev(ladder_progress()) && never(p1_char_select() != 12) &&
              ((p1_rounds_wins_aes() == 2 && settings_difficulty() >= 2) ||
               (p1_rounds_win_mvs() == 2 && settings_difficulty() >= 3) ||
               (p1_rounds_win_aes_a() == 2 && settings_difficulty() >= 2))
)

achievement(
    title = "Fortunate Phoenix a Treasured Sword", description = "Finish Story-mode with Kagami | (Default Setting) [Default difficulty or above]", points = 10,
    id = 133077, badge = "147270", published = "25/11/2020 23:48:05", modified = "08/12/2020 04:00:45",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode() != 0) && settings_timer() == 1 && once(p2_char() == 13) && once(game_stage() ==
               13) && ladder_progress() == 10 && ladder_progress() > prev(ladder_progress()) && never(p1_char_select() != 13) &&
              ((p1_rounds_wins_aes() == 2 && settings_difficulty() >= 2) ||
               (p1_rounds_win_mvs() == 2 && settings_difficulty() >= 3) ||
               (p1_rounds_win_aes_a() == 2 && settings_difficulty() >= 2))
)

achievement(
    title = "TLB - Shining Soul", description = "Kaede (Normal): Hit your opponent with all 2  Desperation moves (Power-Type) [1-P]", points = 5,
    id = 133056, badge = "147118", published = "25/11/2020 23:47:06", modified = "08/12/2020 04:04:27",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && mode_gauge_select()
               == 1 && never(game_mode_l4() == 4) && never(p1_char_select() != 0) &&
              ((once(byte(p_anim_char() + 0x000094) == 209) && once(byte(p_anim_char() + 0x000094) == 214) && 
                unless(p1_hits_aes() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 209) && once(byte(p_anim_char() + 0x000094) == 214) && 
                unless(p1_hits_mvs() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 209) && once(byte(p_anim_char() + 0x000094) == 214) && 
                unless(p1_hits_aes_a() == 0)))
)

achievement(
    title = "TLB - Anxious White", description = "Yuki: Hit your opponent with all 2  Desperation moves (Power-Type) [1-P]", points = 5,
    id = 133057, badge = "147119", published = "25/11/2020 23:47:08", modified = "08/12/2020 04:04:22",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && mode_gauge_select()
               == 1 && never(game_mode_l4() == 4) && never(p1_char_select() != 2) &&
              ((once(byte(p_anim_char() + 0x000094) == 218) && once(byte(p_anim_char() + 0x000094) == 220) && 
                unless(p1_hits_aes() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 218) && once(byte(p_anim_char() + 0x000094) == 220) && 
                unless(p1_hits_mvs() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 218) && once(byte(p_anim_char() + 0x000094) == 220) && 
                unless(p1_hits_aes_a() == 0)))
)

achievement(
    title = "TLB - Moon Destiny", description = "Moriya: Hit your opponent with all 2  Desperation moves (Power-Type) [1-P]", points = 5,
    id = 133058, badge = "147135", published = "25/11/2020 23:47:11", modified = "08/12/2020 04:04:20",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && mode_gauge_select()
               == 1 && never(game_mode_l4() == 4) && never(p1_char_select() != 1) &&
              ((once(byte(p_anim_char() + 0x000094) == 209) && once(byte(p_anim_char() + 0x000094) == 213) && 
                unless(p1_hits_aes() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 209) && once(byte(p_anim_char() + 0x000094) == 213) && 
                unless(p1_hits_mvs() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 209) && once(byte(p_anim_char() + 0x000094) == 213) && 
                unless(p1_hits_aes_a() == 0)))
)

achievement(
    title = "TLB - Fighting Hermit", description = "Okina: Hit your opponent with all 2  Desperation moves (Power-Type) [1-P]", points = 5,
    id = 133059, badge = "147122", published = "25/11/2020 23:47:12", modified = "08/12/2020 04:04:18",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && mode_gauge_select()
               == 1 && never(game_mode_l4() == 4) && never(p1_char_select() != 3) &&
              ((once(byte(p_anim_char() + 0x000094) == 208) && once(byte(p_anim_char() + 0x000094) == 213) && 
                unless(p1_hits_aes() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 208) && once(byte(p_anim_char() + 0x000094) == 213) && 
                unless(p1_hits_mvs() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 208) && once(byte(p_anim_char() + 0x000094) == 213) && 
                unless(p1_hits_aes_a() == 0)))
)

achievement(
    title = "TLB - Oriental Justice", description = "Lee: Hit your opponent with all 2  Desperation moves (Power-Type) [1-P]", points = 5,
    id = 133060, badge = "147123", published = "25/11/2020 23:47:15", modified = "08/12/2020 04:04:16",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && mode_gauge_select()
               == 1 && never(game_mode_l4() == 4) && never(p1_char_select() != 9) &&
              ((once(byte(p_anim_char() + 0x000094) == 202) && once(byte(p_anim_char() + 0x000094) == 206) && 
                unless(p1_hits_aes() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 202) && once(byte(p_anim_char() + 0x000094) == 206) && 
                unless(p1_hits_mvs() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 202) && once(byte(p_anim_char() + 0x000094) == 206) && 
                unless(p1_hits_aes_a() == 0)))
)

achievement(
    title = "TLB - Big Heart", description = "Juzoh: Hit your opponent with all 2  Desperation moves (Power-Type) [1-P]", points = 5,
    id = 133061, badge = "147121", published = "25/11/2020 23:47:18", modified = "08/12/2020 04:04:13",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && mode_gauge_select()
               == 1 && never(game_mode_l4() == 4) && never(p1_char_select() != 5) &&
              ((once(byte(p_anim_char() + 0x000094) == 209) && once(byte(p_anim_char() + 0x000094) == 214) && 
                unless(p1_hits_aes() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 209) && once(byte(p_anim_char() + 0x000094) == 214) && 
                unless(p1_hits_mvs() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 209) && once(byte(p_anim_char() + 0x000094) == 214) && 
                unless(p1_hits_aes_a() == 0)))
)

achievement(
    title = "TLB - Sword of the Wolf", description = "Washizuka: Hit your opponent with all 2  Desperation moves (Power-Type) [1-P]", points = 5,
    id = 133062, badge = "147120", published = "25/11/2020 23:47:20", modified = "08/12/2020 04:04:11",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && mode_gauge_select()
               == 1 && never(game_mode_l4() == 4) && never(p1_char_select() != 6) &&
              ((once(byte(p_anim_char() + 0x000094) == 211) && once(byte(p_anim_char() + 0x000094) == 214) && 
                unless(p1_hits_aes() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 211) && once(byte(p_anim_char() + 0x000094) == 214) && 
                unless(p1_hits_mvs() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 211) && once(byte(p_anim_char() + 0x000094) == 214) && 
                unless(p1_hits_aes_a() == 0)))
)

achievement(
    title = "TLB - Magical Little Girl", description = "Akari: Hit your opponent with all 2  Desperation moves (Power-Type) [1-P]", points = 5,
    id = 133063, badge = "147124", published = "25/11/2020 23:47:23", modified = "08/12/2020 04:04:09",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && mode_gauge_select()
               == 1 && never(game_mode_l4() == 4) && never(p1_char_select() != 4) &&
              ((once(byte(p_anim_char() + 0x000094) == 213) && once(byte(p_anim_char() + 0x000094) == 217) && 
                unless(p1_hits_aes() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 213) && once(byte(p_anim_char() + 0x000094) == 217) && 
                unless(p1_hits_mvs() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 213) && once(byte(p_anim_char() + 0x000094) == 217) && 
                unless(p1_hits_aes_a() == 0)))
)

achievement(
    title = "TLB - Living Nightmare", description = "Shikyoh: Hit your opponent with all 2  Desperation moves (Power-Type) [1-P]", points = 5,
    id = 133064, badge = "147125", published = "25/11/2020 23:47:25", modified = "08/12/2020 04:04:05",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && mode_gauge_select()
               == 1 && never(game_mode_l4() == 4) && never(p1_char_select() != 7) &&
              ((once(byte(p_anim_char() + 0x000094) == 202) && once(byte(p_anim_char() + 0x000094) == 230) && 
                unless(p1_hits_aes() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 202) && once(byte(p_anim_char() + 0x000094) == 230) && 
                unless(p1_hits_mvs() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 202) && once(byte(p_anim_char() + 0x000094) == 230) && 
                unless(p1_hits_aes_a() == 0)))
)

achievement(
    title = "TLB - Romancing Wanderer", description = "Amano: Hit your opponent with all 2  Desperation moves (Power-Type) [1-P]", points = 5,
    id = 133065, badge = "147126", published = "25/11/2020 23:47:27", modified = "08/12/2020 03:38:02",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && mode_gauge_select()
               == 1 && never(game_mode_l4() == 4) && never(p1_char_select() != 8) &&
              ((once(byte(p_anim_char() + 0x000094) == 202) && once(byte(p_anim_char() + 0x000094) == 211) && 
                unless(p1_hits_aes() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 202) && once(byte(p_anim_char() + 0x000094) == 203) && 
                unless(p1_hits_aes() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 202) && once(byte(p_anim_char() + 0x000094) == 211) && 
                unless(p1_hits_mvs() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 202) && once(byte(p_anim_char() + 0x000094) == 203) && 
                unless(p1_hits_mvs() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 202) && once(byte(p_anim_char() + 0x000094) == 211) && 
                unless(p1_hits_aes_a() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 202) && once(byte(p_anim_char() + 0x000094) == 203) && 
                unless(p1_hits_aes_a() == 0)))
)

achievement(
    title = "TLB - Last Ninja", description = "Zantetsu: Hit your opponent with all 2  Desperation moves (Power-Type) [1-P]", points = 5,
    id = 133066, badge = "147127", published = "25/11/2020 23:47:29", modified = "08/12/2020 04:04:03",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && mode_gauge_select()
               == 1 && never(game_mode_l4() == 4) && never(p1_char_select() != 10) &&
              ((once(byte(p_anim_char() + 0x000094) == 218) && once(byte(p_anim_char() + 0x000094) == 224) && 
                unless(p1_hits_aes() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 218) && once(byte(p_anim_char() + 0x000094) == 224) && 
                unless(p1_hits_mvs() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 218) && once(byte(p_anim_char() + 0x000094) == 224) && 
                unless(p1_hits_aes_a() == 0)))
)

achievement(
    title = "TLB - Iron Tiger", description = "Shigen: Hit your opponent with all 2  Desperation moves (Power-Type) [1-P]", points = 5,
    id = 133068, badge = "147128", published = "25/11/2020 23:47:33", modified = "08/12/2020 04:04:01",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && mode_gauge_select()
               == 1 && never(game_mode_l4() == 4) && never(p1_char_select() != 11) &&
              ((once(byte(p_anim_char() + 0x000094) == 205) && once(byte(p_anim_char() + 0x000094) == 207)) ||
               (once(byte(p_anim_char() + 0x000094) == 205) && once(byte(p_anim_char() + 0x000094) == 207)) ||
               (once(byte(p_anim_char() + 0x000094) == 205) && once(byte(p_anim_char() + 0x000094) == 207)))
)

achievement(
    title = "TLB - Phantom Blade", description = "Musashi: Hit your opponent with all 2  Desperation moves (Power-Type) [1-P]", points = 5,
    id = 133067, badge = "147129", published = "25/11/2020 23:47:31", modified = "08/12/2020 04:03:59",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && mode_gauge_select()
               == 1 && never(game_mode_l4() == 4) && never(p1_char_select() != 12) &&
              ((once(byte(p_anim_char() + 0x000094) == 206) && once(byte(p_anim_char() + 0x000094) == 207) && 
                unless(p1_hits_aes() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 206) && once(byte(p_anim_char() + 0x000094) == 207) && 
                unless(p1_hits_mvs() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 206) && once(byte(p_anim_char() + 0x000094) == 207) && 
                unless(p1_hits_aes_a() == 0)))
)

achievement(
    title = "TLB - Crisis Christ", description = "Kagami (Normal): Hit your opponent with all 2  Desperation moves (Power-Type) [1-P]", points = 5,
    id = 133069, badge = "147130", published = "25/11/2020 23:47:35", modified = "08/12/2020 04:03:57",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && mode_gauge_select()
               == 1 && never(game_mode_l4() == 4) && never(p1_char_select() != 13) &&
              ((once(byte(p_anim_char() + 0x000094) == 210) && once(byte(p_anim_char() + 0x000094) == 215) && 
                unless(p1_hits_aes() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 210) && once(byte(p_anim_char() + 0x000094) == 215) && 
                unless(p1_hits_mvs() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 210) && once(byte(p_anim_char() + 0x000094) == 215) && 
                unless(p1_hits_aes_a() == 0)))
)

achievement(
    title = "TLB - Unknown Power", description = "Kaede (Awakening): Hit your opponent with all 4  Desperation moves (Power-Type) [1-P]", points = 10,
    id = 133070, badge = "147133", published = "25/11/2020 23:47:37", modified = "08/12/2020 04:03:54",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && mode_gauge_select()
               == 1 && unless(p1_kaede_awakening() != 14) && never(game_mode_l4() == 4) && never(p1_char_select() != 0) &&
              ((once(byte(p_anim_char() + 0x000094) == 211) && once(byte(p_anim_char() + 0x000094) == 209) && 
                once(byte(p_anim_char() + 0x000094) == 216) && once(byte(p_anim_char() + 0x000094) == 214) && 
                unless(p1_hits_aes() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 211) && once(byte(p_anim_char() + 0x000094) == 209) && 
                once(byte(p_anim_char() + 0x000094) == 216) && once(byte(p_anim_char() + 0x000094) == 214) && 
                unless(p1_hits_mvs() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 211) && once(byte(p_anim_char() + 0x000094) == 209) && 
                once(byte(p_anim_char() + 0x000094) == 216) && once(byte(p_anim_char() + 0x000094) == 214) && 
                unless(p1_hits_aes_a() == 0)))
)

achievement(
    title = "TLB - Blue Flames", description = "Kagami (Awakening): Hit your opponent with all 3  Desperation moves (Power-Type) [1-P]", points = 10,
    id = 133071, badge = "147132", published = "25/11/2020 23:47:40", modified = "08/12/2020 04:03:52",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && mode_gauge_select()
               == 1 && unless(byte(p_anim_char() + 0x000095) != 0) && never(game_mode_l4() == 4) && 
              never(p1_char_select() != 13) &&
              ((once(byte(p_anim_char() + 0x000094) == 210) && once(byte(p_anim_char() + 0x000094) == 215) && 
                once(byte(p_anim_char() + 0x000094) == 211) && unless(p1_hits_aes() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 210) && once(byte(p_anim_char() + 0x000094) == 215) && 
                once(byte(p_anim_char() + 0x000094) == 211) && unless(p1_hits_mvs() == 0)) ||
               (once(byte(p_anim_char() + 0x000094) == 210) && once(byte(p_anim_char() + 0x000094) == 215) && 
                once(byte(p_anim_char() + 0x000094) == 211) && unless(p1_hits_aes_a() == 0)))
)

achievement(
    title = "Caring Heart One-Sword Style", description = "Perform 15 Hits combos with Kaede (Without Desperation Moves) [1-P]", points = 5,
    id = 133105, badge = "147134", published = "26/11/2020 00:11:36", modified = "08/12/2020 04:05:36",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(byte(p_anim_char() + 0x000094) == 209) && unless(byte(p_anim_char() + 0x000094) == 214) && 
              unless(byte(p_anim_char() + 0x000094) == 211) && unless(byte(p_anim_char() + 0x000094) == 209) && 
              unless(p1_kaede_awakening() == 14) && never(game_mode_l4() == 4) && never(p1_char_select() != 0) &&
              ((p1_hits_aes() >= 15 && p1_hits_aes() > prev(p1_hits_aes()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_mvs() > prev(p1_hits_mvs()))) ||
               (p1_hits_mvs() >= 15 && p1_hits_mvs() > prev(p1_hits_mvs()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_aes() > prev(p1_hits_aes()))) ||
               (p1_hits_aes_a() >= 15 && p1_hits_aes_a() > prev(p1_hits_aes_a()) && unless(p1_hits_mvs() >
                 prev(p1_hits_mvs())) && unless(p1_hits_aes() > prev(p1_hits_aes()))))
)

achievement(
    title = "Life-or-Death Stray Sword Style", description = "Perform 15 Hits combos with Moriya (Without Desperation Moves) [1-P]", points = 5,
    id = 133106, badge = "147155", published = "26/11/2020 00:11:40", modified = "08/12/2020 04:19:36",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(byte(p_anim_char() + 0x000094) == 209) && unless(byte(p_anim_char() + 0x000094) == 213) && 
              never(game_mode_l4() == 4) && never(p1_char_select() != 1) &&
              ((p1_hits_aes() >= 15 && p1_hits_aes() > prev(p1_hits_aes()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_mvs() > prev(p1_hits_mvs()))) ||
               (p1_hits_mvs() >= 15 && p1_hits_mvs() > prev(p1_hits_mvs()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_aes() > prev(p1_hits_aes()))) ||
               (p1_hits_aes_a() >= 15 && p1_hits_aes_a() > prev(p1_hits_aes_a()) && unless(p1_hits_mvs() >
                 prev(p1_hits_mvs())) && unless(p1_hits_aes() > prev(p1_hits_aes()))))
)

achievement(
    title = "Sincere Style: One Long Sword", description = "Perform 14 Hits combos with Okina (Without Desperation Moves) [1-P]", points = 5,
    id = 133107, badge = "147153", published = "26/11/2020 00:11:47", modified = "08/12/2020 04:19:38",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(byte(p_anim_char() + 0x000094) == 208) && unless(byte(p_anim_char() + 0x000094) == 213) && 
              never(game_mode_l4() == 4) && never(p1_char_select() != 3) &&
              ((p1_hits_aes() >= 14 && p1_hits_aes() > prev(p1_hits_aes()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_mvs() > prev(p1_hits_mvs()))) ||
               (p1_hits_mvs() >= 14 && p1_hits_mvs() > prev(p1_hits_mvs()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_aes() > prev(p1_hits_aes()))) ||
               (p1_hits_aes_a() >= 14 && p1_hits_aes_a() > prev(p1_hits_aes_a()) && unless(p1_hits_mvs() >
                 prev(p1_hits_mvs())) && unless(p1_hits_aes() > prev(p1_hits_aes()))))
)

achievement(
    title = "Caring Heart Naginata Art", description = "Perform 14 Hits combos with Yuki (Without Desperation Moves) [1-P]", points = 5,
    id = 133108, badge = "147152", published = "26/11/2020 00:11:50", modified = "08/12/2020 04:19:40",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(byte(p_anim_char() + 0x000094) == 218) && unless(byte(p_anim_char() + 0x000094) == 220) && 
              never(game_mode_l4() == 4) && never(p1_char_select() != 2) &&
              ((p1_hits_aes() >= 14 && p1_hits_aes() > prev(p1_hits_aes()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_mvs() > prev(p1_hits_mvs()))) ||
               (p1_hits_mvs() >= 14 && p1_hits_mvs() > prev(p1_hits_mvs()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_aes() > prev(p1_hits_aes()))) ||
               (p1_hits_aes_a() >= 14 && p1_hits_aes_a() > prev(p1_hits_aes_a()) && unless(p1_hits_mvs() >
                 prev(p1_hits_mvs())) && unless(p1_hits_aes() > prev(p1_hits_aes()))))
)

achievement(
    title = "Hoku Ha Shorin-Ji to", description = "Perform 20 Hits combos with Lee (Without Desperation Moves) [1-P]", points = 5,
    id = 133109, badge = "147151", published = "26/11/2020 00:11:52", modified = "08/12/2020 04:19:43",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(byte(p_anim_char() + 0x000094) == 202) && unless(byte(p_anim_char() + 0x000094) == 206) && 
              never(game_mode_l4() == 4) && never(p1_char_select() != 9) &&
              ((p1_hits_aes() >= 20 && p1_hits_aes() > prev(p1_hits_aes()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_mvs() > prev(p1_hits_mvs()))) ||
               (p1_hits_mvs() >= 20 && p1_hits_mvs() > prev(p1_hits_mvs()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_aes() > prev(p1_hits_aes()))) ||
               (p1_hits_aes_a() >= 20 && p1_hits_aes_a() > prev(p1_hits_aes_a()) && unless(p1_hits_mvs() >
                 prev(p1_hits_mvs())) && unless(p1_hits_aes() > prev(p1_hits_aes()))))
)

achievement(
    title = "Ga-Ryu Club Fighting", description = "Perform 12 Hits combos with Juzoh (Without Desperation Moves) [1-P]", points = 5,
    id = 133110, badge = "147150", published = "26/11/2020 00:11:55", modified = "08/12/2020 04:19:45",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(byte(p_anim_char() + 0x000094) == 209) && unless(byte(p_anim_char() + 0x000094) == 214) && 
              never(game_mode_l4() == 4) && never(p1_char_select() != 5) &&
              ((p1_hits_aes() >= 12 && p1_hits_aes() > prev(p1_hits_aes()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_mvs() > prev(p1_hits_mvs()))) ||
               (p1_hits_mvs() >= 12 && p1_hits_mvs() > prev(p1_hits_mvs()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_aes() > prev(p1_hits_aes()))) ||
               (p1_hits_aes_a() >= 12 && p1_hits_aes_a() > prev(p1_hits_aes_a()) && unless(p1_hits_mvs() >
                 prev(p1_hits_mvs())) && unless(p1_hits_aes() > prev(p1_hits_aes()))))
)

achievement(
    title = "Spontaneous True Spirit Style: Falcon", description = "Perform 15 Hits combos with Washizuca (Without Desperation Moves) [1-P]", points = 5,
    id = 133111, badge = "147154", published = "26/11/2020 00:11:57", modified = "08/12/2020 04:19:47",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(byte(p_anim_char() + 0x000094) == 211) && unless(byte(p_anim_char() + 0x000094) == 214) && 
              never(game_mode_l4() == 4) && never(p1_char_select() != 6) &&
              ((p1_hits_aes() >= 15 && p1_hits_aes() > prev(p1_hits_aes()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_mvs() > prev(p1_hits_mvs()))) ||
               (p1_hits_mvs() >= 15 && p1_hits_mvs() > prev(p1_hits_mvs()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_aes() > prev(p1_hits_aes()))) ||
               (p1_hits_aes_a() >= 15 && p1_hits_aes_a() > prev(p1_hits_aes_a()) && unless(p1_hits_mvs() >
                 prev(p1_hits_mvs())) && unless(p1_hits_aes() > prev(p1_hits_aes()))))
)

achievement(
    title = "Ichijo-Ryu Onmyo Jutsu", description = "Perform 12 Hits combos with Akari (Without Desperation Moves) [1-P]", points = 5,
    id = 133112, badge = "147149", published = "26/11/2020 00:12:01", modified = "08/12/2020 04:19:49",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(byte(p_anim_char() + 0x000094) == 213) && unless(byte(p_anim_char() + 0x000094) == 217) && 
              never(game_mode_l4() == 4) && never(p1_char_select() != 4) &&
              ((p1_hits_aes() >= 12 && p1_hits_aes() > prev(p1_hits_aes()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_mvs() > prev(p1_hits_mvs()))) ||
               (p1_hits_mvs() >= 12 && p1_hits_mvs() > prev(p1_hits_mvs()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_aes() > prev(p1_hits_aes()))) ||
               (p1_hits_aes_a() >= 12 && p1_hits_aes_a() > prev(p1_hits_aes_a()) && unless(p1_hits_mvs() >
                 prev(p1_hits_mvs())) && unless(p1_hits_aes() > prev(p1_hits_aes()))))
)

achievement(
    title = "Clear Conscience: Medal of Slaughter", description = "Perform 22 Hits combos with Shikyoh (Without Desperation Moves) [1-P]", points = 5,
    id = 133113, badge = "147148", published = "26/11/2020 00:12:03", modified = "08/12/2020 04:19:51",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(byte(p_anim_char() + 0x000094) == 202) && unless(byte(p_anim_char() + 0x000094) == 230) && 
              never(game_mode_l4() == 4) && never(p1_char_select() != 7) &&
              ((p1_hits_aes() >= 22 && p1_hits_aes() > prev(p1_hits_aes()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_mvs() > prev(p1_hits_mvs()))) ||
               (p1_hits_mvs() >= 22 && p1_hits_mvs() > prev(p1_hits_mvs()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_aes() > prev(p1_hits_aes()))) ||
               (p1_hits_aes_a() >= 22 && p1_hits_aes_a() > prev(p1_hits_aes_a()) && unless(p1_hits_mvs() >
                 prev(p1_hits_mvs())) && unless(p1_hits_aes() > prev(p1_hits_aes()))))
)

achievement(
    title = "Ga-Ryu Kenka Yagura", description = "Perform 17 Hits combos with Amano (Without Desperation Moves) [1-P]", points = 5,
    id = 133114, badge = "147156", published = "26/11/2020 00:12:06", modified = "08/12/2020 04:19:54",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(byte(p_anim_char() + 0x000094) == 202) && unless(byte(p_anim_char() + 0x000094) == 211) && 
              unless(byte(p_anim_char() + 0x000094) == 203) && never(game_mode_l4() == 4) && never(p1_char_select() != 8) &&
              ((p1_hits_aes() >= 17 && p1_hits_aes() > prev(p1_hits_aes()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_mvs() > prev(p1_hits_mvs()))) ||
               (p1_hits_mvs() >= 17 && p1_hits_mvs() > prev(p1_hits_mvs()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_aes() > prev(p1_hits_aes()))) ||
               (p1_hits_aes_a() >= 17 && p1_hits_aes_a() > prev(p1_hits_aes_a()) && unless(p1_hits_mvs() >
                 prev(p1_hits_mvs())) && unless(p1_hits_aes() > prev(p1_hits_aes()))))
)

achievement(
    title = "Kisaragi-Ryu Ninjutsu", description = "Perform 14 Hits combos with Zantetsu (Without Desperation Moves) [1-P]", points = 5,
    id = 133115, badge = "147147", published = "26/11/2020 00:12:08", modified = "08/12/2020 04:19:56",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(byte(p_anim_char() + 0x000094) == 218) && unless(byte(p_anim_char() + 0x000094) == 224) && 
              never(game_mode_l4() == 4) && never(p1_char_select() != 10) &&
              ((p1_hits_aes() >= 14 && p1_hits_aes() > prev(p1_hits_aes()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_mvs() > prev(p1_hits_mvs()))) ||
               (p1_hits_mvs() >= 14 && p1_hits_mvs() > prev(p1_hits_mvs()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_aes() > prev(p1_hits_aes()))) ||
               (p1_hits_aes_a() >= 14 && p1_hits_aes_a() > prev(p1_hits_aes_a()) && unless(p1_hits_mvs() >
                 prev(p1_hits_mvs())) && unless(p1_hits_aes() > prev(p1_hits_aes()))))
)

achievement(
    title = "Kaiwan: Byakko no Tsume", description = "Perform 17 Hit combos with Shigen (Without Desperation Moves) [1-P]", points = 5,
    id = 133117, badge = "147158", published = "26/11/2020 00:12:13", modified = "08/12/2020 04:19:58",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(byte(p_anim_char() + 0x000094) == 205) && unless(byte(p_anim_char() + 0x000094) == 207) && 
              never(game_mode_l4() == 4) && never(p1_char_select() != 11) &&
              ((p1_hits_aes() >= 17 && p1_hits_aes() > prev(p1_hits_aes()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_mvs() > prev(p1_hits_mvs()))) ||
               (p1_hits_mvs() >= 17 && p1_hits_mvs() > prev(p1_hits_mvs()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_aes() > prev(p1_hits_aes()))) ||
               (p1_hits_aes_a() >= 17 && p1_hits_aes_a() > prev(p1_hits_aes_a()) && unless(p1_hits_mvs() >
                 prev(p1_hits_mvs())) && unless(p1_hits_aes() > prev(p1_hits_aes()))))
)

achievement(
    title = "Niten Ichi-Ryu Kai", description = "Perform 12 Hits combos with Musashi (Without Desperation Moves) [1-P]", points = 5,
    id = 133116, badge = "147157", published = "26/11/2020 00:12:10", modified = "08/12/2020 04:20:01",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(byte(p_anim_char() + 0x000094) == 206) && unless(byte(p_anim_char() + 0x000094) == 207) && 
              never(game_mode_l4() == 4) && never(p1_char_select() != 12) &&
              ((p1_hits_aes() >= 12 && p1_hits_aes() > prev(p1_hits_aes()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_mvs() > prev(p1_hits_mvs()))) ||
               (p1_hits_mvs() >= 12 && p1_hits_mvs() > prev(p1_hits_mvs()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_aes() > prev(p1_hits_aes()))) ||
               (p1_hits_aes_a() >= 12 && p1_hits_aes_a() > prev(p1_hits_aes_a()) && unless(p1_hits_mvs() >
                 prev(p1_hits_mvs())) && unless(p1_hits_aes() > prev(p1_hits_aes()))))
)

achievement(
    title = "Haste Sword - Phoenix Flame", description = "Perform 15 Hits combos with Kagami (Without Desperation Moves) [1-P]", points = 5,
    id = 133119, badge = "147145", published = "26/11/2020 00:15:11", modified = "08/12/2020 04:20:04",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(byte(p_anim_char() + 0x000094) == 210) && unless(byte(p_anim_char() + 0x000094) == 215) && 
              byte(p_anim_char() + 0x000095) > 0 && never(game_mode_l4() == 4) && never(p1_char_select() != 13) &&
              ((p1_hits_aes() >= 15 && p1_hits_aes() > prev(p1_hits_aes()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_mvs() > prev(p1_hits_mvs()))) ||
               (p1_hits_mvs() >= 15 && p1_hits_mvs() > prev(p1_hits_mvs()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_aes() > prev(p1_hits_aes()))) ||
               (p1_hits_aes_a() >= 15 && p1_hits_aes_a() > prev(p1_hits_aes_a()) && unless(p1_hits_mvs() >
                 prev(p1_hits_mvs())) && unless(p1_hits_aes() > prev(p1_hits_aes()))))
)

achievement(
    title = "Morning Star Wind Fang", description = "Perform 15 Hits combos with (Awakening) Kaede (Without Desperation Moves) [1-P]", points = 5,
    id = 133118, badge = "147144", published = "26/11/2020 00:15:08", modified = "08/12/2020 04:20:06",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(byte(p_anim_char() + 0x000094) == 211) && unless(byte(p_anim_char() + 0x000094) == 209) && 
              unless(byte(p_anim_char() + 0x000094) == 216) && unless(byte(p_anim_char() + 0x000094) == 214) && 
              unless(p1_kaede_awakening() != 14) && never(game_mode_l4() == 4) && never(p1_char_select() != 0) &&
              ((p1_hits_aes() >= 15 && p1_hits_aes() > prev(p1_hits_aes()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_mvs() > prev(p1_hits_mvs()))) ||
               (p1_hits_mvs() >= 15 && p1_hits_mvs() > prev(p1_hits_mvs()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_aes() > prev(p1_hits_aes()))) ||
               (p1_hits_aes_a() >= 15 && p1_hits_aes_a() > prev(p1_hits_aes_a()) && unless(p1_hits_mvs() >
                 prev(p1_hits_mvs())) && unless(p1_hits_aes() > prev(p1_hits_aes()))))
)

achievement(
    title = "Wings of the Afterlife", description = "Perform 14 Hits combos with (Awakening) Kagami (Without Desperation Moves) [1-P]", points = 5,
    id = 133120, badge = "147143", published = "26/11/2020 00:15:52", modified = "08/12/2020 04:46:05",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(byte(p_anim_char() + 0x000094) == 210) && unless(byte(p_anim_char() + 0x000094) == 215) && 
              unless(byte(p_anim_char() + 0x000095) != 0) && never(game_mode_l4() == 4) && never(p1_char_select() != 13) &&
              ((p1_hits_aes() >= 14 && p1_hits_aes() > prev(p1_hits_aes()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_mvs() > prev(p1_hits_mvs()))) ||
               (p1_hits_mvs() >= 14 && p1_hits_mvs() > prev(p1_hits_mvs()) && unless(p1_hits_aes_a() >
                 prev(p1_hits_aes_a())) && unless(p1_hits_aes() > prev(p1_hits_aes()))) ||
               (p1_hits_aes_a() >= 14 && p1_hits_aes_a() > prev(p1_hits_aes_a()) && unless(p1_hits_mvs() >
                 prev(p1_hits_mvs())) && unless(p1_hits_aes() > prev(p1_hits_aes()))))
)

achievement(
    title = "The Style of Wearing Specials", description = "Finish Story-Mode with Power-Type | (Default Setting)", points = 5,
    id = 133091, badge = "147275", published = "25/11/2020 23:48:57", modified = "25/11/2020 23:48:57",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode() != 0) && settings_timer() == 1 && once(p2_char() == 13) && once(game_stage() ==
               13) && ladder_progress() == 10 && ladder_progress() > prev(ladder_progress()) && never(mode_gauge_select() != 1)
)

achievement(
    title = "The Style of Using Speed", description = "Finish Story-Mode with Speed-Type | (Default Setting)", points = 5,
    id = 133092, badge = "147274", published = "25/11/2020 23:48:59", modified = "25/11/2020 23:48:59",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode() != 0) && settings_timer() == 1 && once(p2_char() == 13) && once(game_stage() ==
               13) && ladder_progress() == 10 && ladder_progress() > prev(ladder_progress()) && never(mode_gauge_select() != 255)
)

achievement(
    title = "Ah! Finally, Beautiful Score", description = "Get a total Score 800.000 Points [Story-Mode]", points = 5,
    id = 133076, badge = "147252", published = "25/11/2020 23:48:01", modified = "25/11/2020 23:48:01",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode_l4() != 0) && p1_score_10000() >= 128 && ladder_progress() > 0
)

achievement(
    title = "Quick, but the Same", description = "Get a total Score 700.000 Points [Short-Mode]", points = 5,
    id = 133095, badge = "147234", published = "25/11/2020 23:49:06", modified = "25/11/2020 23:49:06",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode_l4() != 1) && p1_score_10000() >= 112 && ladder_progress() > 0
)

achievement(
    title = "Micro-History to Tell", description = "End the game in Short Mode (Default Setting) [Default difficulty or above]", points = 10,
    id = 133075, badge = "147232", published = "25/11/2020 23:47:59", modified = "25/11/2020 23:47:59",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              never(game_mode_l4() != 1) && ladder_progress_l4() == 4 && ladder_progress() > prev(ladder_progress()) && 
              settings_difficulty() >= 2 && unless(settings_timer() != 1)
)

achievement(
    title = "Victories in a Row, That's It...", description = "Win 12 fights in time attack mode (AES)", points = 10,
    id = 133089, badge = "147231", published = "25/11/2020 23:48:49", modified = "08/12/2020 04:30:21",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              never(game_mode_l4() != 3) && never(game_timer() == 0) &&
              ((repeated(12, p1_rounds_wins_aes() > prev(p1_rounds_wins_aes()))) ||
               (repeated(12, p1_rounds_win_aes_a() > prev(p1_rounds_win_aes_a()))))
)

achievement(
    title = "Be Quiet and Let Me Make Fun", description = "Tease your opponent 10 times without being hit [1-P]", points = 5,
    id = 133096, badge = "147218", published = "25/11/2020 23:49:09", modified = "08/12/2020 04:34:20",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode_l4() == 4) && unless(game_mode_l4() == 3) && repeated(10, byte(p_anim_char() + 0x000094)
               == 37) && unless(prev(byte(p_anim_char() + 0x000094)) == 37) &&
              ((never(p2_hits_aes() > prev(p2_hits_aes()))) ||
               (never(p2_hits_mvs() > prev(p2_hits_mvs()))) ||
               (never(p2_hits_aes_a() > prev(p2_hits_aes_a()))))
)

achievement(
    title = "Samurai Concentration", description = "Defeat your opponent using only the B button (Strong Slash) [1-P]", points = 3,
    id = 133097, badge = "147212", published = "25/11/2020 23:49:12", modified = "08/12/2020 04:53:29",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode_l4() == 4) && unless(game_mode_l4() == 3) && once(game_timer() == 96 && game_timer()
               == 96) && game_timer() > 0 && never(p1_input_b4() > 0) && never(p1_input_b6() > 0) && 
              never(p1_input_b7() > 0) && never(ladder_progress() > prev(ladder_progress())) &&
              ((once(p2_hp_aes() == 1 && p2_hp_aes() == 1) && repeated(2, p1_rounds_wins_aes() > prev(p1_rounds_wins_aes())) && 
                unless(p1_hits_aes_a() > prev(p1_hits_aes_a())) && unless(p1_hits_mvs() > prev(p1_hits_mvs()))) ||
               (once(p2_hp_mvs() == 1 && p2_hp_mvs() == 1) && repeated(2, p1_rounds_win_mvs() > prev(p1_rounds_win_mvs())) && 
                unless(p1_hits_aes_a() > prev(p1_hits_aes_a())) && unless(p1_hits_aes() > prev(p1_hits_aes()))) ||
               (once(p2_hp_aes_a() == 1 && p2_hp_aes_a() == 1) && repeated(2, p1_rounds_win_aes_a() > prev(p1_rounds_win_aes_a())) && 
                unless(p1_hits_mvs() > prev(p1_hits_mvs())) && unless(p1_hits_aes() > prev(p1_hits_aes()))))
)

achievement(
    title = "Ni-poo, The Fast Slash", description = "Defeat your opponent using only the A button (Weak Slash) [1-P]", points = 3,
    id = 133098, badge = "147213", published = "25/11/2020 23:49:24", modified = "08/12/2020 04:53:31",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode_l4() == 4) && unless(game_mode_l4() == 3) && once(game_timer() == 96 && game_timer()
               == 96) && game_timer() > 0 && never(p1_input_b5() > 0) && never(p1_input_b6() > 0) && 
              never(p1_input_b7() > 0) && never(ladder_progress() > prev(ladder_progress())) &&
              ((once(p2_hp_aes() == 1 && p2_hp_aes() == 1) && repeated(2, p1_rounds_wins_aes() > prev(p1_rounds_wins_aes())) && 
                unless(p1_hits_aes_a() > prev(p1_hits_aes_a())) && unless(p1_hits_mvs() > prev(p1_hits_mvs()))) ||
               (once(p2_hp_mvs() == 1 && p2_hp_mvs() == 1) && repeated(2, p1_rounds_win_mvs() > prev(p1_rounds_win_mvs())) && 
                unless(p1_hits_aes_a() > prev(p1_hits_aes_a())) && unless(p1_hits_aes() > prev(p1_hits_aes()))) ||
               (once(p2_hp_aes_a() == 1 && p2_hp_aes_a() == 1) && repeated(2, p1_rounds_win_aes_a() > prev(p1_rounds_win_aes_a())) && 
                unless(p1_hits_mvs() > prev(p1_hits_mvs())) && unless(p1_hits_aes() > prev(p1_hits_aes()))))
)

achievement(
    title = "I Don't Need to Use Swords, Right?", description = "Defeat your opponent using only the C button (Kick button) [1-P]", points = 3,
    id = 133099, badge = "147214", published = "25/11/2020 23:49:26", modified = "08/12/2020 04:53:33",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode_l4() == 4) && unless(game_mode_l4() == 3) && once(game_timer() == 96 && game_timer()
               == 96) && game_timer() > 0 && never(p1_input_b4() > 0) && never(p1_input_b5() > 0) && 
              never(p1_input_b7() > 0) && never(ladder_progress() > prev(ladder_progress())) &&
              ((once(p2_hp_aes() == 1 && p2_hp_aes() == 1) && repeated(2, p1_rounds_wins_aes() > prev(p1_rounds_wins_aes())) && 
                unless(p1_hits_aes_a() > prev(p1_hits_aes_a())) && unless(p1_hits_mvs() > prev(p1_hits_mvs()))) ||
               (once(p2_hp_mvs() == 1 && p2_hp_mvs() == 1) && repeated(2, p1_rounds_win_mvs() > prev(p1_rounds_win_mvs())) && 
                unless(p1_hits_aes_a() > prev(p1_hits_aes_a())) && unless(p1_hits_aes() > prev(p1_hits_aes()))) ||
               (once(p2_hp_aes_a() == 1 && p2_hp_aes_a() == 1) && repeated(2, p1_rounds_win_aes_a() > prev(p1_rounds_win_aes_a())) && 
                unless(p1_hits_mvs() > prev(p1_hits_mvs())) && unless(p1_hits_aes() > prev(p1_hits_aes()))))
)

achievement(
    title = "The Art of Breaking the Attack", description = "Perform repel, low repel and special repel [1-P]", points = 5,
    id = 133100, badge = "147215", published = "25/11/2020 23:49:28", modified = "25/11/2020 23:49:28",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode_l4() == 4) && unless(game_mode_l4() == 3) && once(byte(p_anim_char() + 0x000094) == 65) && 
              once(byte(p_anim_char() + 0x000094) == 67) && once(byte(p_anim_char() + 0x000094) == 158)
)

achievement(
    title = "I Need to Advance From Stage, Now !!!", description = "Defeat your opponent in 10 seconds (Default Setting) [Story-Mode]", points = 5,
    id = 133101, badge = "147224", published = "25/11/2020 23:49:32", modified = "08/12/2020 04:55:37",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode_l4() != 0) && never(game_timer() < 80) && game_timer() >= 80 && unless(settings_timer()
               != 1) && once(game_timer() == 96 && game_timer() == 96) && never(ladder_progress() >
               prev(ladder_progress())) &&
              ((p1_rounds_wins_aes() > prev(p1_rounds_wins_aes()) && once(game_timer() == 89)) ||
               (p1_rounds_win_mvs() > prev(p1_rounds_win_mvs()) && once(game_timer() == 89)) ||
               (once(game_timer() == 89) && p1_rounds_win_aes_a() > prev(p1_rounds_win_aes_a())))
)

achievement(
    title = "What? Now That It Was Getting Good", description = "Win a round in time-out (Default Setting) [Story-Mode]", points = 1,
    id = 133122, badge = "147221", published = "26/11/2020 00:17:49", modified = "08/12/2020 04:58:32",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && game_timer()
               == 0 && unless(game_mode_l4() != 0) && unless(settings_timer() != 1) && once(game_timer() == 96 &&
               game_timer() == 96) &&
              ((once(p2_hp_aes() == 1 && p2_hp_aes() == 1) && p1_rounds_wins_aes() > prev(p1_rounds_wins_aes())) ||
               (once(p2_hp_mvs() == 1 && p2_hp_mvs() == 1) && p1_rounds_win_mvs() > prev(p1_rounds_win_mvs())) ||
               (once(p2_hp_aes_a() == 1 && p2_hp_aes_a() == 1) && p1_rounds_win_aes_a() > prev(p1_rounds_win_aes_a())))
)

achievement(
    title = "High Speed Is the Solution", description = "Finish the opponent using the activated Speed-Typer mode [Story-Mode]", points = 3,
    id = 133102, badge = "147226", published = "25/11/2020 23:49:34", modified = "08/12/2020 04:59:57",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode_l4() == 4) && unless(game_mode_l4() == 3) && game_timer() > 0 && never(mode_gauge_select()
               != 255) &&
              (((game_speed_flag() > 0 && mode_gauge_select() == 255 && p1_rounds_wins_aes() > prev(p1_rounds_wins_aes()))) ||
               ((game_speed_flag() > 0 && mode_gauge_select() == 255 && p1_rounds_win_mvs() > prev(p1_rounds_win_mvs()))) ||
               ((game_speed_flag() > 0 && mode_gauge_select() == 255 && p1_rounds_win_aes_a() > prev(p1_rounds_win_aes_a()))))
)

achievement(
    title = "The Unshakable Swordsman", description = "Win two rounds in a row without taking damage (Only-K.O) [Story-Mode]", points = 5,
    id = 133121, badge = "147229", published = "26/11/2020 00:17:45", modified = "08/12/2020 05:08:52",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && game_timer()
               > 0 && unless(game_mode_l4() != 0) && never(ladder_progress() > prev(ladder_progress())) &&
              ((repeated(2, p1_hp_aes() == 1 && p1_rounds_wins_aes() > prev(p1_rounds_wins_aes()))) ||
               (repeated(2, p1_hp_mvs() == 1 && p1_rounds_win_mvs() > prev(p1_rounds_win_mvs()))) ||
               (repeated(2, p1_hp_aes_a() == 1 && p1_rounds_win_aes_a() > prev(p1_rounds_win_aes_a()))))
)

achievement(
    title = "Say Hello! to the Ground", description = "Win a round using Throw [Story-Mode]", points = 2,
    id = 133124, badge = "147228", published = "26/11/2020 00:20:35", modified = "08/12/2020 05:09:35",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode_l4() != 0) && byte(p_anim_char() + 0x000094) == 63 && game_timer() > 0 &&
              ((p1_rounds_wins_aes() > prev(p1_rounds_wins_aes())) ||
               (p1_rounds_win_mvs() > prev(p1_rounds_win_mvs())) ||
               (p1_rounds_win_aes_a() > prev(p1_rounds_win_aes_a())))
)

achievement(
    title = "Dazzle Electrical Power", description = "End Story Mode with Kaede winning each fight with Awakening mode enabled (Default Setting) [Default difficulty or above]", points = 10,
    id = 133103, badge = "147235", published = "26/11/2020 00:06:13", modified = "08/12/2020 05:26:24",
    trigger = never(unibios_flag() != 0) && never(p1_state() == 0) && unless(p2_state() != 0) && 
              unless(game_mode() != 0) && once(p2_char() == 13) && ladder_progress() == 10 && ladder_progress() >
               prev(ladder_progress()) && settings_difficulty() >= 2 && unless(settings_timer() != 1) && unless(p1_char_select() != 0) &&
              ((repeated(12, p1_rounds_wins_aes() > prev(p1_rounds_wins_aes())) && unless(p1_kaede_awakening() == 0) && 
                unless(p1_hits_aes_a() > prev(p1_hits_aes_a())) && unless(p1_hits_mvs() > prev(p1_hits_mvs()))) ||
               (repeated(12, p1_rounds_win_mvs() > prev(p1_rounds_win_mvs())) && unless(p1_kaede_awakening() == 0) && 
                unless(p1_hits_aes_a() > prev(p1_hits_aes_a())) && unless(p1_hits_aes() > prev(p1_hits_aes()))) ||
               (repeated(12, p1_rounds_win_aes_a() > prev(p1_rounds_win_aes_a())) && unless(p1_kaede_awakening() == 0) && 
                unless(p1_hits_mvs() > prev(p1_hits_mvs())) && unless(p1_hits_aes() > prev(p1_hits_aes()))))
)

achievement(
    title = "The Ultimate Difficulty Katana", description = "Finish Story-Mode on maximum difficulty Lv8 | (Default Setting)", points = 25,
    id = 133093, badge = "147272", published = "25/11/2020 23:49:01", modified = "10/12/2020 03:08:07",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode() != 0) && settings_timer() == 1 && once(p2_char() == 13) && once(game_stage() ==
               13) && ladder_progress() == 10 && ladder_progress() > prev(ladder_progress()) &&
              ((p1_rounds_wins_aes() == 2 && settings_difficulty() == 7) ||
               (p1_rounds_win_mvs() == 2 && settings_difficulty() == 7) ||
               (p1_rounds_win_aes_a() == 2 && settings_difficulty() == 7))
)

achievement(
    title = "Divine Swordsman", description = "Enter mode Awakening with Kagami 15 times (1-cc)", points = 25,
    id = 133090, badge = "147280", published = "25/11/2020 23:48:54", modified = "12/12/2020 15:23:45",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode() != 0) && repeated(15, byte(p_anim_char() + 0x000095) == 0) && 
              unless(prev(byte(p_anim_char() + 0x000095)) == 0) && never(p1_char_select() != 13)
)

achievement(
    title = "The One Who Got Here Like the Stars", description = "Finish Story-Mode using only one credit | (Default Setting) [Default difficulty or above]", points = 25,
    id = 133094, badge = "147273", published = "25/11/2020 23:49:04", modified = "08/12/2020 05:28:31",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode() != 0) && settings_timer() == 1 && once(p2_char() == 13) && once(game_stage() ==
               13) && ladder_progress() == 10 && ladder_progress() > prev(ladder_progress()) && once(ladder_progress() == 0) &&
              ((p1_rounds_wins_aes() == 2 && settings_difficulty() >= 2) ||
               (p1_rounds_win_mvs() == 2 && settings_difficulty() >= 3) ||
               (p1_rounds_win_aes_a() == 2 && settings_difficulty() >= 2))
)

achievement(
    title = "Hayate-Maru - Meaning Squall Rounder", description = "Finish Story-mode with Kaede | (Default Setting) [Default difficulty or above]", points = 10,
    id = 133104, badge = "147253", published = "26/11/2020 00:06:24", modified = "26/11/2020 00:06:24",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode() != 0) && settings_timer() == 1 && once(p2_char() == 13) && once(game_stage() ==
               13) && ladder_progress() == 10 && ladder_progress() > prev(ladder_progress()) && never(p1_char_select() != 0) &&
              ((bios_flag_bad() == 0 && p1_rounds_wins_aes() == 2 && settings_difficulty() >= 2) ||
               (bios_flag_bad() == 2 && p1_rounds_win_mvs() == 2 && settings_difficulty() >= 3))
)

achievement(
    title = "Quick, but the Same", description = "Get a total Score 700.000 Points [Short-Mode]", points = 5,
    id = 133123, badge = "147234", published = "26/11/2020 00:18:00", modified = "26/11/2020 00:18:00",
    trigger = never(unibios_flag() != 0) && never(p1_state() != 1) && never(p2_state() != 0) && 
              unless(game_mode_l4() != 1) && p1_score_10000() >= 112 && ladder_progress() > 0
)

achievement(
    title = "Dazzle Electrical Power", description = "End Story Mode with Kaede winning each fight with Awakening mode enabled (Default Setting) [Default difficulty or above]", points = 10,
    id = 133072, badge = "147235", published = "25/11/2020 23:47:48", modified = "25/11/2020 23:47:48",
    trigger = never(unibios_flag() != 0) && never(p1_state() == 0) && unless(p2_state() != 0) && 
              unless(game_mode() != 0) && once(p2_char() == 13) && ladder_progress() == 10 && ladder_progress() >
               prev(ladder_progress()) && settings_difficulty() >= 2 && unless(settings_timer() != 1) && unless(p1_char_select() != 0) &&
              ((repeated(12, bios_flag_bad() == 0 && p1_rounds_wins_aes() > prev(p1_rounds_wins_aes())) && unless(p1_kaede_awakening() ==
                 0)) ||
               (repeated(12, bios_flag_bad() == 2 && p1_rounds_win_mvs() > prev(p1_rounds_win_mvs())) && unless(p1_kaede_awakening() ==
                 0)))
)

leaderboard(
    id = 19581, title = "HI-SCORE (Story-Mode)",
    description = "Best scores in a session",
    start  = p1_state() == 1 && ladder_progress_w() == 0 && game_timer() == 96 && game_mode() == 0,
    cancel = p1_state() == 0,
    submit = p1_state() == 1 && ladder_progress() == 10,
    value = p1_score_10000000_h4() * 10000000 + p1_score_10000000_l4() * 1000000 + p1_score_10000_h4() * 100000 + p1_score_10000_l4() * 10000 + p1_score_1000_h4() * 1000 + p1_score_1000_l4() * 100 + p1_score_10_h4() * 10 + p1_score_10_l4() * 1,
    format = "SCORE"
)

leaderboard(
    id = 19582, title = "HI-SCORE (Short-Mode)",
    description = "Best scores in a session [1-P]",
    start  = p1_state() == 1 && ladder_progress_w() == 0 && game_timer() == 96 && game_mode() == 1,
    cancel = p1_state() == 0,
    submit = p1_state() == 1 && ladder_progress() == 4,
    value = p1_score_10000000_h4() * 10000000 + p1_score_10000000_l4() * 1000000 + p1_score_10000_h4() * 100000 + p1_score_10000_l4() * 10000 + p1_score_1000_h4() * 1000 + p1_score_1000_l4() * 100 + p1_score_10_h4() * 10 + p1_score_10_l4() * 1,
    format = "SCORE"
)
