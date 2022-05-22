// Last Blade, The | Last Soldier, The
// #ID = 12040

// MVS
function p1_hp_mvs() => word(0x0006F2)
function p2_hp_mvs() => word(0x0006F4)
function p2_hits_mvs() => byte(0x000722)
function p1_hit_combo() => byte(0x000723)
function p1_rounds_win_mvs() => byte(0x00073F)

// AES Asia
function p1_hp_aes_a() => word(0x0012F2)
function p2_hp_aes_a() => word(0x0012F4)
function p2_hits_aes_a() => byte(0x001322)
function p1_hit_combo() => byte(0x001323)
function p1_rounds_win_aes_a() => byte(0x00133F)

// AES
function p1_hp_aes() => word(0x001AF2)
function p2_hp_aes() => word(0x001AF4)
function p2_hits_aes() => byte(0x001B22)
function p1_hit_combo() => byte(0x001B23)
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
function settings_rounds() => byte(0xfd8d)

// Player
function p1_char() => byte(0x00EAAC)
function p1_hp() => word(pointer_p1() + p_offset_hp)
function p1_rounds_wins() => byte(pointer_p1() + p_offset_rounds_wins)
function p1_anim() => byte(pointer_p1() + p_offset_anim)
function p1_hit_combo() => byte(0xe295)

function p2_char() => byte(0x00ACBC)
function p2_hp() => word(pointer_p2() + p_offset_hp)
function p2_rounds_wins() => byte(pointer_p2() + p_offset_rounds_wins)
function p2_anim() => byte(pointer_p2() + p_offset_anim)
function p2_hit_combo() => byte(0xe294)

// Pointers
function pointer_p1() => word(0xac9a)
function pointer_p2() => word(0xac9e)
         p_offset_anim = 0x94
         p_offset_hp = 0x180
         p_offset_rounds_wins = 0x1ab

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
function bios_mvs_mode() => bit7(0xfd83) == 1
function bios_aes_mode() => bit7(0xfd83) == 0

// Utility Functions

function p1_only() {
  return  never(p1_state() == 0) && 
          never(p2_state() != 0)
}

function settings_3_rounds() {
  return  ((bios_mvs_mode() && settings_rounds() == 4) || 
          (bios_aes_mode() && settings_rounds() == 1))
}
function settings_default_all() {
  return  settings_difficulty() >= 2 &&
          settings_timer() == 1 &&
          settings_3_rounds()
}

// ==================
//     Story Mode
// ==================

achievement(
    title = "Hayate-Maru - Meaning Squall Rounder", description = "Finish Story Mode using only Kaede (Level 3 difficulty, 3 rounds, Game Time Normal)", points = 10,
    id = 133073, badge = "147253", published = "25/11/2020 23:47:53", modified = "08/12/2020 04:01:16",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode() != 0) && 
              once(ladder_progress() == 0) &&
              trigger_when(ladder_progress() == 10) && 
              trigger_when(ladder_progress() > prev(ladder_progress())) && 
              trigger_when(p1_rounds_wins() == 2) && 
              never(ladder_progress() > prev(ladder_progress()) && p1_char() != 0) &&
              p1_char() == 0 &&
              settings_default_all()
)

achievement(
    title = "Katsura of the Moon - Tsuki no Katsura", description = "Finish Story Mode using only Moriya (Level 3 difficulty, 3 rounds, Game Time Normal)", points = 10,
    id = 133074, badge = "147254", published = "25/11/2020 23:47:57", modified = "08/12/2020 04:01:13",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode() != 0) && 
              once(ladder_progress() == 0) &&
              trigger_when(ladder_progress() == 10) && 
              trigger_when(ladder_progress() > prev(ladder_progress())) && 
              trigger_when(p1_rounds_wins() == 2) && 
              never(ladder_progress() > prev(ladder_progress()) && p1_char() != 1) &&
              p1_char() == 1 &&
              settings_default_all()
)

achievement(
    title = "Bodan - Meaning Peony", description = "Finish Story Mode using only Yuki (Level 3 difficulty, 3 rounds, Game Time Normal)", points = 10,
    id = 133082, badge = "147257", published = "25/11/2020 23:48:19", modified = "08/12/2020 04:01:11",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode() != 0) && 
              once(ladder_progress() == 0) &&
              trigger_when(ladder_progress() == 10) && 
              trigger_when(ladder_progress() > prev(ladder_progress())) && 
              trigger_when(p1_rounds_wins() == 2) && 
              never(ladder_progress() > prev(ladder_progress()) && p1_char() != 2) &&
              p1_char() == 2 &&
              settings_default_all()
)

achievement(
    title = "Guren - Crimson Lotus", description = "Finish Story Mode using only Lee (Level 3 difficulty, 3 rounds, Game Time Normal)", points = 10,
    id = 133081, badge = "147255", published = "25/11/2020 23:48:15", modified = "08/12/2020 04:01:09",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode() != 0) && 
              once(ladder_progress() == 0) &&
              trigger_when(ladder_progress() == 10) && 
              trigger_when(ladder_progress() > prev(ladder_progress())) && 
              trigger_when(p1_rounds_wins() == 2) && 
              never(ladder_progress() > prev(ladder_progress()) && p1_char() != 9) &&
              p1_char() == 9 &&
              settings_default_all()
)

achievement(
    title = "Hihon - Which Holds Turtles", description = "Finish Story Mode using only Okina (Level 3 difficulty, 3 rounds, Game Time Normal)", points = 10,
    id = 133080, badge = "147256", published = "25/11/2020 23:48:12", modified = "08/12/2020 04:01:06",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode() != 0) && 
              once(ladder_progress() == 0) &&
              trigger_when(ladder_progress() == 10) && 
              trigger_when(ladder_progress() > prev(ladder_progress())) && 
              trigger_when(p1_rounds_wins() == 2) && 
              never(ladder_progress() > prev(ladder_progress()) && p1_char() != 3) &&
              p1_char() == 3 &&
              settings_default_all()
)

achievement(
    title = "Kongo Rakan - Adamantine Arhat a Metal Club", description = "Finish Story Mode using only Juzoh (Level 3 difficulty, 3 rounds, Game Time Normal)", points = 10,
    id = 133079, badge = "147258", published = "25/11/2020 23:48:10", modified = "08/12/2020 04:01:04",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode() != 0) && 
              once(ladder_progress() == 0) &&
              trigger_when(ladder_progress() == 10) && 
              trigger_when(ladder_progress() > prev(ladder_progress())) && 
              trigger_when(p1_rounds_wins() == 2) && 
              never(ladder_progress() > prev(ladder_progress()) && p1_char() != 5) &&
              p1_char() == 5 &&
              settings_default_all()
)

achievement(
    title = "Lunatic Blade - Vulture a Hagewashi", description = "Finish Story Mode using only Shikyoh (Level 3 difficulty, 3 rounds, Game Time Normal)", points = 10,
    id = 133078, badge = "147261", published = "25/11/2020 23:48:07", modified = "08/12/2020 04:01:00",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode() != 0) && 
              once(ladder_progress() == 0) &&
              trigger_when(ladder_progress() == 10) && 
              trigger_when(ladder_progress() > prev(ladder_progress())) && 
              trigger_when(p1_rounds_wins() == 2) && 
              never(ladder_progress() > prev(ladder_progress()) && p1_char() != 7) &&
              p1_char() == 7 &&
              settings_default_all()
)

achievement(
    title = "Otokomae - Handsome Man a Bokutou", description = "Finish Story Mode using only Amano (Level 3 difficulty, 3 rounds, Game Time Normal)", points = 10,
    id = 133084, badge = "147262", published = "25/11/2020 23:48:33", modified = "08/12/2020 04:00:58",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode() != 0) && 
              once(ladder_progress() == 0) &&
              trigger_when(ladder_progress() == 10) && 
              trigger_when(ladder_progress() > prev(ladder_progress())) && 
              trigger_when(p1_rounds_wins() == 2) && 
              never(ladder_progress() > prev(ladder_progress()) && p1_char() != 8) &&
              p1_char() == 8 &&
              settings_default_all()
)

achievement(
    title = "Meian - Light and Darkness a Heihaku", description = "Finish Story Mode using only Akari (Level 3 difficulty, 3 rounds, Game Time Normal)", points = 10,
    id = 133083, badge = "147260", published = "25/11/2020 23:48:22", modified = "08/12/2020 04:00:56",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode() != 0) && 
              once(ladder_progress() == 0) &&
              trigger_when(ladder_progress() == 10) && 
              trigger_when(ladder_progress() > prev(ladder_progress())) && 
              trigger_when(p1_rounds_wins() == 2) && 
              never(ladder_progress() > prev(ladder_progress()) && p1_char() != 4) &&
              p1_char() == 4 &&
              settings_default_all()
)

achievement(
    title = "Hayabusa - Peregrine Falcon a Katana", description = "Finish Story Mode using only Washizuka (Level 3 difficulty, 3 rounds, Game Time Normal)", points = 10,
    id = 133085, badge = "147259", published = "25/11/2020 23:48:36", modified = "08/12/2020 04:00:54",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode() != 0) && 
              once(ladder_progress() == 0) &&
              trigger_when(ladder_progress() == 10) && 
              trigger_when(ladder_progress() > prev(ladder_progress())) && 
              trigger_when(p1_rounds_wins() == 2) && 
              never(ladder_progress() > prev(ladder_progress()) && p1_char() != 6) &&
              p1_char() == 6 &&
              settings_default_all()
)

achievement(
    title = "Mantis Blade - Shadow and Mantis Blade a Stream", description = "Finish Story Mode using only Zantetsu (Level 3 difficulty, 3 rounds, Game Time Normal)", points = 10,
    id = 133086, badge = "147263", published = "25/11/2020 23:48:39", modified = "08/12/2020 04:00:52",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode() != 0) && 
              once(ladder_progress() == 0) &&
              trigger_when(ladder_progress() == 10) && 
              trigger_when(ladder_progress() > prev(ladder_progress())) && 
              trigger_when(p1_rounds_wins() == 2) && 
              never(ladder_progress() > prev(ladder_progress()) && p1_char() != 10) &&
              p1_char() == 10 &&
              settings_default_all()
)

achievement(
    title = "Byakko no Juzu Rosary of Byakko", description = "Finish Story Mode using only Shigen (Level 3 difficulty, 3 rounds, Game Time Normal)", points = 10,
    id = 133087, badge = "147264", published = "25/11/2020 23:48:42", modified = "08/12/2020 04:00:49",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode() != 0) && 
              once(ladder_progress() == 0) &&
              trigger_when(ladder_progress() == 10) && 
              trigger_when(ladder_progress() > prev(ladder_progress())) && 
              trigger_when(p1_rounds_wins() == 2) && 
              never(ladder_progress() > prev(ladder_progress()) && p1_char() != 11) &&
              p1_char() == 11 &&
              settings_default_all()
)

achievement(
    title = "An Unnamed Katana and Wakizashi", description = "Finish Story Mode using only Musahi (Level 3 difficulty, 3 rounds, Game Time Normal)", points = 10,
    id = 133088, badge = "147268", published = "25/11/2020 23:48:46", modified = "08/12/2020 04:00:47",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode() != 0) && 
              once(ladder_progress() == 0) &&
              trigger_when(ladder_progress() == 10) && 
              trigger_when(ladder_progress() > prev(ladder_progress())) && 
              trigger_when(p1_rounds_wins() == 2) && 
              never(ladder_progress() > prev(ladder_progress()) && p1_char() != 12) &&
              p1_char() == 12 &&
              settings_default_all()
)

achievement(
    title = "Fortunate Phoenix a Treasured Sword", description = "Finish Story Mode using only Kagami (Level 3 difficulty, 3 rounds, Game Time Normal)", points = 10,
    id = 133077, badge = "147270", published = "25/11/2020 23:48:05", modified = "08/12/2020 04:00:45",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode() != 0) && 
              once(ladder_progress() == 0) &&
              trigger_when(ladder_progress() == 10) && 
              trigger_when(ladder_progress() > prev(ladder_progress())) && 
              trigger_when(p1_rounds_wins() == 2) && 
              never(ladder_progress() > prev(ladder_progress()) && p1_char() != 13) &&
              p1_char() == 13 &&
              settings_default_all()
)

// ==================
//     Desp. Moves
// ==================

achievement(
    title = "TLB - Shining Soul", description = "Kaede (Normal): Hit your opponent with all 2 Desperation Moves (Power Mode, no Training Mode)", points = 5,
    id = 133056, badge = "147118", published = "25/11/2020 23:47:06", modified = "08/12/2020 04:04:27",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              mode_gauge_select() == 1 && 
              never(game_mode_l4() == 4) && 
              never(p1_char() != 0) &&
              ((once(p1_anim() == 209) && 
              once(p1_anim() == 214) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 209) && 
              once(p1_anim() == 214) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 209) && 
              once(p1_anim() == 214) && 
                unless(p1_hit_combo() == 0)))
)

achievement(
    title = "TLB - Anxious White", description = "Yuki: Hit your opponent with all 2 Desperation Moves (Power Mode, no Training Mode)", points = 5,
    id = 133057, badge = "147119", published = "25/11/2020 23:47:08", modified = "08/12/2020 04:04:22",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              mode_gauge_select() == 1 && 
              never(game_mode_l4() == 4) && 
              never(p1_char() != 2) &&
              ((once(p1_anim() == 218) && 
              once(p1_anim() == 220) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 218) && 
              once(p1_anim() == 220) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 218) && 
              once(p1_anim() == 220) && 
                unless(p1_hit_combo() == 0)))
)

achievement(
    title = "TLB - Moon Destiny", description = "Moriya: Hit your opponent with all 2 Desperation Moves (Power Mode, no Training Mode)", points = 5,
    id = 133058, badge = "147135", published = "25/11/2020 23:47:11", modified = "08/12/2020 04:04:20",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              mode_gauge_select() == 1 && 
              never(game_mode_l4() == 4) && 
              never(p1_char() != 1) &&
              ((once(p1_anim() == 209) && 
              once(p1_anim() == 213) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 209) && 
              once(p1_anim() == 213) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 209) && 
              once(p1_anim() == 213) && 
                unless(p1_hit_combo() == 0)))
)

achievement(
    title = "TLB - Fighting Hermit", description = "Okina: Hit your opponent with all 2 Desperation Moves (Power Mode, no Training Mode)", points = 5,
    id = 133059, badge = "147122", published = "25/11/2020 23:47:12", modified = "08/12/2020 04:04:18",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              mode_gauge_select() == 1 && 
              never(game_mode_l4() == 4) && 
              never(p1_char() != 3) &&
              ((once(p1_anim() == 208) && 
              once(p1_anim() == 213) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 208) && 
              once(p1_anim() == 213) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 208) && 
              once(p1_anim() == 213) && 
                unless(p1_hit_combo() == 0)))
)

achievement(
    title = "TLB - Oriental Justice", description = "Lee: Hit your opponent with all 2 Desperation Moves (Power Mode, no Training Mode)", points = 5,
    id = 133060, badge = "147123", published = "25/11/2020 23:47:15", modified = "08/12/2020 04:04:16",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              mode_gauge_select() == 1 && 
              never(game_mode_l4() == 4) && 
              never(p1_char() != 9) &&
              ((once(p1_anim() == 202) && 
              once(p1_anim() == 206) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 202) && 
              once(p1_anim() == 206) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 202) && 
              once(p1_anim() == 206) && 
                unless(p1_hit_combo() == 0)))
)

achievement(
    title = "TLB - Big Heart", description = "Juzoh: Hit your opponent with all 2 Desperation Moves (Power Mode, no Training Mode)", points = 5,
    id = 133061, badge = "147121", published = "25/11/2020 23:47:18", modified = "08/12/2020 04:04:13",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              mode_gauge_select() == 1 && 
              never(game_mode_l4() == 4) && 
              never(p1_char() != 5) &&
              ((once(p1_anim() == 209) && 
              once(p1_anim() == 214) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 209) && 
              once(p1_anim() == 214) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 209) && 
              once(p1_anim() == 214) && 
                unless(p1_hit_combo() == 0)))
)

achievement(
    title = "TLB - Sword of the Wolf", description = "Washizuka: Hit your opponent with all 2 Desperation Moves (Power Mode, no Training Mode)", points = 5,
    id = 133062, badge = "147120", published = "25/11/2020 23:47:20", modified = "08/12/2020 04:04:11",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              mode_gauge_select() == 1 && 
              never(game_mode_l4() == 4) && 
              never(p1_char() != 6) &&
              ((once(p1_anim() == 211) && 
              once(p1_anim() == 214) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 211) && 
              once(p1_anim() == 214) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 211) && 
              once(p1_anim() == 214) && 
                unless(p1_hit_combo() == 0)))
)

achievement(
    title = "TLB - Magical Little Girl", description = "Akari: Hit your opponent with all 2 Desperation Moves (Power Mode, no Training Mode)", points = 5,
    id = 133063, badge = "147124", published = "25/11/2020 23:47:23", modified = "08/12/2020 04:04:09",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              mode_gauge_select() == 1 && 
              never(game_mode_l4() == 4) && 
              never(p1_char() != 4) &&
              ((once(p1_anim() == 213) && 
              once(p1_anim() == 217) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 213) && 
              once(p1_anim() == 217) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 213) && 
              once(p1_anim() == 217) && 
                unless(p1_hit_combo() == 0)))
)

achievement(
    title = "TLB - Living Nightmare", description = "Shikyoh: Hit your opponent with all 2 Desperation Moves (Power Mode, no Training Mode)", points = 5,
    id = 133064, badge = "147125", published = "25/11/2020 23:47:25", modified = "08/12/2020 04:04:05",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              mode_gauge_select() == 1 && 
              never(game_mode_l4() == 4) && 
              never(p1_char() != 7) &&
              ((once(p1_anim() == 202) && 
              once(p1_anim() == 230) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 202) && 
              once(p1_anim() == 230) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 202) && 
              once(p1_anim() == 230) && 
                unless(p1_hit_combo() == 0)))
)

achievement(
    title = "TLB - Romancing Wanderer", description = "Amano: Hit your opponent with all 2 Desperation Moves (Power Mode, no Training Mode)", points = 5,
    id = 133065, badge = "147126", published = "25/11/2020 23:47:27", modified = "08/12/2020 03:38:02",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              mode_gauge_select() == 1 && 
              never(game_mode_l4() == 4) && 
              never(p1_char() != 8) &&
              ((once(p1_anim() == 202) && 
              once(p1_anim() == 211) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 202) && 
              once(p1_anim() == 203) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 202) && 
              once(p1_anim() == 211) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 202) && 
              once(p1_anim() == 203) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 202) && 
              once(p1_anim() == 211) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 202) && 
              once(p1_anim() == 203) && 
                unless(p1_hit_combo() == 0)))
)

achievement(
    title = "TLB - Last Ninja", description = "Zantetsu: Hit your opponent with all 2 Desperation Moves (Power Mode, no Training Mode)", points = 5,
    id = 133066, badge = "147127", published = "25/11/2020 23:47:29", modified = "08/12/2020 04:04:03",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              mode_gauge_select() == 1 && 
              never(game_mode_l4() == 4) && 
              never(p1_char() != 10) &&
              ((once(p1_anim() == 218) && 
              once(p1_anim() == 224) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 218) && 
              once(p1_anim() == 224) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 218) && 
              once(p1_anim() == 224) && 
                unless(p1_hit_combo() == 0)))
)

achievement(
    title = "TLB - Iron Tiger", description = "Shigen: Hit your opponent with all 2 Desperation Moves (Power Mode, no Training Mode)", points = 5,
    id = 133068, badge = "147128", published = "25/11/2020 23:47:33", modified = "08/12/2020 04:04:01",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              mode_gauge_select() == 1 && 
              never(game_mode_l4() == 4) && 
              never(p1_char() != 11) &&
              ((once(p1_anim() == 205) && 
              once(p1_anim() == 207)) ||
               (once(p1_anim() == 205) && 
              once(p1_anim() == 207)) ||
               (once(p1_anim() == 205) && 
              once(p1_anim() == 207)))
)

achievement(
    title = "TLB - Phantom Blade", description = "Musashi: Hit your opponent with all 2 Desperation Moves (Power Mode, no Training Mode)", points = 5,
    id = 133067, badge = "147129", published = "25/11/2020 23:47:31", modified = "08/12/2020 04:03:59",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              mode_gauge_select() == 1 && 
              never(game_mode_l4() == 4) && 
              never(p1_char() != 12) &&
              ((once(p1_anim() == 206) && 
              once(p1_anim() == 207) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 206) && 
              once(p1_anim() == 207) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 206) && 
              once(p1_anim() == 207) && 
                unless(p1_hit_combo() == 0)))
)

achievement(
    title = "TLB - Crisis Christ", description = "Kagami (Normal): Hit your opponent with all 2 Desperation Moves (Power Mode, no Training Mode)", points = 5,
    id = 133069, badge = "147130", published = "25/11/2020 23:47:35", modified = "08/12/2020 04:03:57",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              mode_gauge_select() == 1 && 
              never(game_mode_l4() == 4) && 
              never(p1_char() != 13) &&
              ((once(p1_anim() == 210) && 
              once(p1_anim() == 215) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 210) && 
              once(p1_anim() == 215) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 210) && 
              once(p1_anim() == 215) && 
                unless(p1_hit_combo() == 0)))
)

achievement(
    title = "TLB - Unknown Power", description = "Kaede (Awakening): Hit your opponent with all 4 Desperation Moves (Power Mode, no Training Mode)", points = 10,
    id = 133070, badge = "147133", published = "25/11/2020 23:47:37", modified = "08/12/2020 04:03:54",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              mode_gauge_select() == 1 && 
              unless(p1_kaede_awakening() != 14) && 
              never(game_mode_l4() == 4) && 
              never(p1_char() != 0) &&
              ((once(p1_anim() == 211) && 
              once(p1_anim() == 209) && 
                once(p1_anim() == 216) && 
              once(p1_anim() == 214) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 211) && 
              once(p1_anim() == 209) && 
                once(p1_anim() == 216) && 
              once(p1_anim() == 214) && 
                unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 211) && 
              once(p1_anim() == 209) && 
                once(p1_anim() == 216) && 
              once(p1_anim() == 214) && 
                unless(p1_hit_combo() == 0)))
)

achievement(
    title = "TLB - Blue Flames", description = "Kagami (Awakening): Hit your opponent with all 3 Desperation Moves (Power Mode, no Training Mode)", points = 10,
    id = 133071, badge = "147132", published = "25/11/2020 23:47:40", modified = "08/12/2020 04:03:52",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              mode_gauge_select() == 1 && 
              unless(byte(pointer_p1() + 0x000095) != 0) && 
              never(game_mode_l4() == 4) && 
              never(p1_char() != 13) &&
              ((once(p1_anim() == 210) && 
              once(p1_anim() == 215) && 
                once(p1_anim() == 211) && 
              unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 210) && 
              once(p1_anim() == 215) && 
                once(p1_anim() == 211) && 
              unless(p1_hit_combo() == 0)) ||
               (once(p1_anim() == 210) && 
              once(p1_anim() == 215) && 
                once(p1_anim() == 211) && 
              unless(p1_hit_combo() == 0)))
)

// ==================
//       Combos
// ==================

achievement(
    title = "Caring Heart One-Sword Style", description = "Perform a 15 hit combo with Kaede (no Desperation Moves)", points = 5,
    id = 133105, badge = "147134", published = "26/11/2020 00:11:36", modified = "08/12/2020 04:05:36",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(p1_anim() == 209) && 
              unless(p1_anim() == 214) && 
              unless(p1_anim() == 211) && 
              unless(p1_anim() == 209) && 
              unless(p1_kaede_awakening() == 14) && 
              never(p1_char() != 0) &&
              p1_hit_combo() >= 15 && p1_hit_combo() > prev(p1_hit_combo())
)

achievement(
    title = "Life-or-Death Stray Sword Style", description = "Perform a 15 hit combo with Moriya (no Desperation Moves)", points = 5,
    id = 133106, badge = "147155", published = "26/11/2020 00:11:40", modified = "08/12/2020 04:19:36",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(p1_anim() == 209) && 
              unless(p1_anim() == 213) && 
              never(p1_char() != 1) &&
              p1_hit_combo() >= 15 && p1_hit_combo() > prev(p1_hit_combo())
)

achievement(
    title = "Sincere Style: One Long Sword", description = "Perform a 14 hit combo with Okina (no Desperation Moves)", points = 5,
    id = 133107, badge = "147153", published = "26/11/2020 00:11:47", modified = "08/12/2020 04:19:38",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(p1_anim() == 208) && 
              unless(p1_anim() == 213) && 
              never(p1_char() != 3) &&
              p1_hit_combo() >= 14 && p1_hit_combo() > prev(p1_hit_combo())
)

achievement(
    title = "Caring Heart Naginata Art", description = "Perform a 14 hit combo with Yuki (no Desperation Moves)", points = 5,
    id = 133108, badge = "147152", published = "26/11/2020 00:11:50", modified = "08/12/2020 04:19:40",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(p1_anim() == 218) && 
              unless(p1_anim() == 220) && 
              never(p1_char() != 2) &&
              p1_hit_combo() >= 14 && p1_hit_combo() > prev(p1_hit_combo())
)

achievement(
    title = "Hoku Ha Shorin-Ji to", description = "Perform a 20 hit combo with Lee (no Desperation Moves)", points = 5,
    id = 133109, badge = "147151", published = "26/11/2020 00:11:52", modified = "08/12/2020 04:19:43",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(p1_anim() == 202) && 
              unless(p1_anim() == 206) && 
              never(p1_char() != 9) &&
              p1_hit_combo() >= 20 && p1_hit_combo() > prev(p1_hit_combo())
)

achievement(
    title = "Ga-Ryu Club Fighting", description = "Perform a 12 hit combo with Juzoh (no Desperation Moves)", points = 5,
    id = 133110, badge = "147150", published = "26/11/2020 00:11:55", modified = "08/12/2020 04:19:45",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(p1_anim() == 209) && 
              unless(p1_anim() == 214) && 
              never(p1_char() != 5) &&
              p1_hit_combo() >= 12 && p1_hit_combo() > prev(p1_hit_combo())
)

achievement(
    title = "Spontaneous True Spirit Style: Falcon", description = "Perform a 15 hit combo with Washizuca (no Desperation Moves)", points = 5,
    id = 133111, badge = "147154", published = "26/11/2020 00:11:57", modified = "08/12/2020 04:19:47",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(p1_anim() == 211) && 
              unless(p1_anim() == 214) && 
              never(p1_char() != 6) &&
              p1_hit_combo() >= 15 && p1_hit_combo() > prev(p1_hit_combo())
)

achievement(
    title = "Ichijo-Ryu Onmyo Jutsu", description = "Perform a 12 hit combo with Akari (no Desperation Moves)", points = 5,
    id = 133112, badge = "147149", published = "26/11/2020 00:12:01", modified = "08/12/2020 04:19:49",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(p1_anim() == 213) && 
              unless(p1_anim() == 217) && 
              never(p1_char() != 4) &&
              p1_hit_combo() >= 12 && p1_hit_combo() > prev(p1_hit_combo())
)

achievement(
    title = "Clear Conscience: Medal of Slaughter", description = "Perform a 22 hit combo with Shikyoh (no Desperation Moves)", points = 5,
    id = 133113, badge = "147148", published = "26/11/2020 00:12:03", modified = "08/12/2020 04:19:51",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(p1_anim() == 202) && 
              unless(p1_anim() == 230) && 
              never(p1_char() != 7) &&
              p1_hit_combo() >= 22 && p1_hit_combo() > prev(p1_hit_combo())
)

achievement(
    title = "Ga-Ryu Kenka Yagura", description = "Perform a 17 hit combo with Amano (no Desperation Moves)", points = 5,
    id = 133114, badge = "147156", published = "26/11/2020 00:12:06", modified = "08/12/2020 04:19:54",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(p1_anim() == 202) && 
              unless(p1_anim() == 211) && 
              unless(p1_anim() == 203) && 
              never(p1_char() != 8) &&
              p1_hit_combo() >= 17 && p1_hit_combo() > prev(p1_hit_combo())
)

achievement(
    title = "Kisaragi-Ryu Ninjutsu", description = "Perform a 14 hit combo with Zantetsu (no Desperation Moves)", points = 5,
    id = 133115, badge = "147147", published = "26/11/2020 00:12:08", modified = "08/12/2020 04:19:56",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(p1_anim() == 218) && 
              unless(p1_anim() == 224) && 
              never(p1_char() != 10) &&
              p1_hit_combo() >= 14 && p1_hit_combo() > prev(p1_hit_combo())
)

achievement(
    title = "Kaiwan: Byakko no Tsume", description = "Perform a 17 Hit combos with Shigen (no Desperation Moves)", points = 5,
    id = 133117, badge = "147158", published = "26/11/2020 00:12:13", modified = "08/12/2020 04:19:58",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(p1_anim() == 205) && 
              unless(p1_anim() == 207) && 
              never(p1_char() != 11) &&
              p1_hit_combo() >= 17 && p1_hit_combo() > prev(p1_hit_combo())
)

achievement(
    title = "Niten Ichi-Ryu Kai", description = "Perform a 12 hit combo with Musashi (no Desperation Moves)", points = 5,
    id = 133116, badge = "147157", published = "26/11/2020 00:12:10", modified = "08/12/2020 04:20:01",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(p1_anim() == 206) && 
              unless(p1_anim() == 207) && 
              never(p1_char() != 12) &&
              p1_hit_combo() >= 12 && p1_hit_combo() > prev(p1_hit_combo())
)

achievement(
    title = "Haste Sword - Phoenix Flame", description = "Perform a 15 hit combo with Kagami (no Desperation Moves)", points = 5,
    id = 133119, badge = "147145", published = "26/11/2020 00:15:11", modified = "08/12/2020 04:20:04",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(p1_anim() == 210) && 
              unless(p1_anim() == 215) && 
              byte(pointer_p1() + 0x000095) > 0 && 
              never(p1_char() != 13) &&
              p1_hit_combo() >= 15 && p1_hit_combo() > prev(p1_hit_combo())
)

achievement(
    title = "Morning Star Wind Fang", description = "Perform a 15 hit combo with (Awakening) Kaede (no Desperation Moves)", points = 5,
    id = 133118, badge = "147144", published = "26/11/2020 00:15:08", modified = "08/12/2020 04:20:06",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(p1_anim() == 211) && 
              unless(p1_anim() == 209) && 
              unless(p1_anim() == 216) && 
              unless(p1_anim() == 214) && 
              unless(p1_kaede_awakening() != 14) && 
              never(p1_char() != 0) &&
              p1_hit_combo() >= 15 && p1_hit_combo() > prev(p1_hit_combo())
)

achievement(
    title = "Wings of the Afterlife", description = "Perform a 14 hit combo with (Awakening) Kagami (no Desperation Moves)", points = 5,
    id = 133120, badge = "147143", published = "26/11/2020 00:15:52", modified = "08/12/2020 04:46:05",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(p1_anim() == 210) && 
              unless(p1_anim() == 215) && 
              unless(byte(pointer_p1() + 0x000095) != 0) && 
              never(p1_char() != 13) &&
              p1_hit_combo() >= 14 && p1_hit_combo() > prev(p1_hit_combo())
)

// ==================
//       Misc
// ==================

achievement(
    title = "The Style of Wearing Specials", description = "Finish Story Mode using only Power Mode (Level 3 difficulty, 3 rounds, Game Time Normal)", points = 5,
    id = 133091, badge = "147275", published = "25/11/2020 23:48:57", modified = "25/11/2020 23:48:57",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode() != 0) && 
              once(ladder_progress() == 0) &&
              trigger_when(ladder_progress() == 10) && 
              trigger_when(ladder_progress() > prev(ladder_progress())) && 
              trigger_when(p1_rounds_wins() == 2) && 
              never(mode_gauge_select() != 1) &&
              settings_default_all()
)

achievement(
    title = "The Style of Using Speed", description = "Finish Story Mode using only Speed Mode (Level 3 difficulty, 3 rounds, Game Time Normal)", points = 5,
    id = 133092, badge = "147274", published = "25/11/2020 23:48:59", modified = "25/11/2020 23:48:59",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode() != 0) && 
              once(ladder_progress() == 0) &&
              trigger_when(ladder_progress() == 10) && 
              trigger_when(ladder_progress() > prev(ladder_progress())) && 
              trigger_when(p1_rounds_wins() == 2) && 
              never(mode_gauge_select() != 255) &&
              settings_default_all()
)

achievement(
    title = "Ah! Finally, Beautiful Score", description = "Get a total Score of 800.000 points on Story Mode", points = 5,
    id = 133076, badge = "147252", published = "25/11/2020 23:48:01", modified = "25/11/2020 23:48:01",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode_l4() != 0) && 
              p1_score_10000() >= 128 && 
              ladder_progress() > 0
)

achievement(
    title = "Quick, But the Same", description = "Get a total Score 700.000 points on Short Mode", points = 5,
    id = 133095, badge = "147234", published = "25/11/2020 23:49:06", modified = "25/11/2020 23:49:06",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode_l4() != 1) && 
              p1_score_10000() >= 112 && 
              ladder_progress() > 0
)

achievement(
    title = "Micro-History to Tell", description = "Finish the game on Short Mode (Level 3 difficulty, 3 rounds, Game Time Normal)", points = 10,
    id = 133075, badge = "147232", published = "25/11/2020 23:47:59", modified = "25/11/2020 23:47:59",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              never(game_mode_l4() != 1) && 
              trigger_when(ladder_progress_l4() == 4) && 
              trigger_when(ladder_progress() > prev(ladder_progress())) && 
              settings_default_all()
)

achievement(
    title = "Victories in a Row, That's It...", description = "Win 12 fights on Time Attack Mode", points = 10,
    id = 133089, badge = "147231", published = "25/11/2020 23:48:49", modified = "08/12/2020 04:30:21",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              never(game_mode_l4() != 3) && 
              never(game_timer() == 0) &&
              measured(repeated(12, p1_rounds_wins() > prev(p1_rounds_wins())))
)

achievement(
    title = "Be Quiet and Let Me Make Fun", description = "Tease your opponent 10 times without being hit", points = 5,
    id = 133096, badge = "147218", published = "25/11/2020 23:49:09", modified = "08/12/2020 04:34:20",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode_l4() == 4) && 
              unless(game_mode_l4() == 3) && 
              measured(repeated(10, p1_anim() == 37)) && 
              unless(prev(p1_anim()) == 37) &&
              never(p2_hit_combo() > prev(p2_hit_combo()))
)

achievement(
    title = "Samurai Concentration", description = "Defeat your opponent using only the B button (Strong Slash) (Game Time Normal)", points = 3,
    id = 133097, badge = "147212", published = "25/11/2020 23:49:12", modified = "08/12/2020 04:53:29",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode_l4() == 4) && 
              unless(game_mode_l4() == 3) && 
              once(game_timer() == 96) &&
              never(p1_input_b4() > 0) && 
              never(p1_input_b6() > 0) && 
              never(p1_input_b7() > 0) && 
              never(ladder_progress() > prev(ladder_progress())) &&
              repeated(2, p1_rounds_wins() > prev(p1_rounds_wins())) &&
              settings_timer() == 1
)

achievement(
    title = "Ni-poo, The Fast Slash", description = "Defeat your opponent using only the A button (Weak Slash) (Game Time Normal)", points = 3,
    id = 133098, badge = "147213", published = "25/11/2020 23:49:24", modified = "08/12/2020 04:53:31",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode_l4() == 4) && 
              unless(game_mode_l4() == 3) && 
              once(game_timer() == 96) &&
              never(p1_input_b5() > 0) && 
              never(p1_input_b6() > 0) && 
              never(p1_input_b7() > 0) && 
              never(ladder_progress() > prev(ladder_progress())) &&
              repeated(2, p1_rounds_wins() > prev(p1_rounds_wins())) &&
              settings_timer() == 1
)

achievement(
    title = "I Don't Need to Use Swords, Right?", description = "Defeat your opponent using only the C button (Kick button) (Game Time Normal)", points = 3,
    id = 133099, badge = "147214", published = "25/11/2020 23:49:26", modified = "08/12/2020 04:53:33",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode_l4() == 4) && 
              unless(game_mode_l4() == 3) && 
              once(game_timer() == 96) &&
              never(p1_input_b4() > 0) && 
              never(p1_input_b5() > 0) && 
              never(p1_input_b7() > 0) && 
              never(ladder_progress() > prev(ladder_progress())) &&
              repeated(2, p1_rounds_wins() > prev(p1_rounds_wins())) &&
              settings_timer() == 1
)

achievement(
    title = "The Art of Breaking the Attack", description = "Perform a Repel, Low Repel and Special Repel", points = 5,
    id = 133100, badge = "147215", published = "25/11/2020 23:49:28", modified = "25/11/2020 23:49:28",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode_l4() == 4) && 
              unless(game_mode_l4() == 3) && 
              once(p1_anim() == 65) && 
              once(p1_anim() == 67) && 
              once(p1_anim() == 158)
)

achievement(
    title = "I Need to Advance From Stage, Now !!!", description = "Defeat your opponent in 10 seconds on Story Mode (Game Time Normal)", points = 5,
    id = 133101, badge = "147224", published = "25/11/2020 23:49:32", modified = "08/12/2020 04:55:37",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode_l4() != 0) && 
              game_timer() >= 0x50 && 
              p1_rounds_wins() > prev(p1_rounds_wins()) &&
              unless(settings_timer() != 1)
)

achievement(
    title = "What? Now That It Was Getting Good", description = "Win a round with a time out on Story Mode (Game Time Normal)", points = 1,
    id = 133122, badge = "147221", published = "26/11/2020 00:17:49", modified = "08/12/2020 04:58:32",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode_l4() != 0) && 
              game_timer() == 0x00 &&
              p1_rounds_wins() > prev(p1_rounds_wins()) &&
              unless(settings_timer() != 1)
)

achievement(
    title = "High Speed Is the Solution", description = "Finish the opponent using the activated Speed Mode on Story Mode", points = 3,
    id = 133102, badge = "147226", published = "25/11/2020 23:49:34", modified = "08/12/2020 04:59:57",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode_l4() == 4) && 
              unless(game_mode_l4() == 3) && 
              game_timer() > 0 && 
              game_speed_flag() > 0 && 
              mode_gauge_select() == 255 && 
              p1_rounds_wins() > prev(p1_rounds_wins())

)

achievement(
    title = "The Unshakable Swordsman", description = "Win two rounds in a row without taking damage on Story Mode (Only-K.O)", points = 5,
    id = 133121, badge = "147229", published = "26/11/2020 00:17:45", modified = "08/12/2020 05:08:52",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              game_timer() > 0 && 
              unless(game_mode_l4() != 0) && 
              never(ladder_progress() > prev(ladder_progress())) &&
              measured(repeated(2, p1_hp() == 0x100 && p1_rounds_wins() > prev(p1_rounds_wins())))
)

achievement(
    title = "Say Hello! to the Ground", description = "Win a round with a throw on Story Mode", points = 2,
    id = 133124, badge = "147228", published = "26/11/2020 00:20:35", modified = "08/12/2020 05:09:35",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode_l4() != 0) && 
              p1_anim() == 63 && 
              game_timer() > 0 &&
              p1_rounds_wins() > prev(p1_rounds_wins())
)

achievement(
    title = "Dazzle Electrical Power", description = "Finish Story Mode as Kaede by winning each match with Awakening mode enabled (Level 3 difficulty, 3 rounds, Game Time Normal)", points = 25,
    id = 133103, badge = "147235", published = "26/11/2020 00:06:13", modified = "08/12/2020 05:26:24",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode() != 0) && 
              ladder_progress() == 10 && 
              ladder_progress() > prev(ladder_progress()) && 
              unless(p1_char() != 0) &&
              measured(repeated(10, p1_kaede_awakening() == 1 && p1_rounds_wins() == 2 && prev(p1_rounds_wins()) == 1)) && 
              settings_default_all()
)

achievement(
    title = "The Ultimate Difficulty Katana", description = "Finish Story Mode on Level 8 difficulty (3 rounds, Game Time Normal)", points = 25,
    id = 133093, badge = "147272", published = "25/11/2020 23:49:01", modified = "10/12/2020 03:08:07",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode() != 0) && 
              once(ladder_progress() == 0) &&
              trigger_when(ladder_progress() == 10) && 
              trigger_when(ladder_progress() > prev(ladder_progress())) && 
              trigger_when(p1_rounds_wins() == 2) && 
              settings_difficulty() == 7 &&
              settings_3_rounds() &&
              settings_timer() == 1
)

achievement(
    title = "Divine Swordsman", description = "Enter Awakening mode as Kagami 15 times during one credit", points = 25,
    id = 133090, badge = "147280", published = "25/11/2020 23:48:54", modified = "12/12/2020 15:23:45",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode() != 0) && 
              measured(repeated(15, byte(pointer_p1() + 0x000095) == 0)) && 
              unless(prev(byte(pointer_p1() + 0x000095)) == 0) && 
              never(p1_char() != 13)
)

achievement(
    title = "The One Who Got Here Like the Stars", description = "Finish Story Mode using only one credit (Level 3 difficulty, 3 rounds, Game Time Normal)", points = 25,
    id = 133094, badge = "147273", published = "25/11/2020 23:49:04", modified = "08/12/2020 05:28:31",
    trigger = never(unibios_flag() != 0) && 
              p1_only() &&
              unless(game_mode() != 0) && 
              once(ladder_progress() == 0) &&
              trigger_when(ladder_progress() == 10) && 
              trigger_when(ladder_progress() > prev(ladder_progress())) && 
              trigger_when(p1_rounds_wins() == 2) && 
              settings_default_all()
)

// ================
//    Unofficial
// ================

// achievement(
//     title = "Hayate-Maru - Meaning Squall Rounder", description = "Finish Story Mode with Kaede | (Default Setting) [Default difficulty or above]", points = 10,
//     id = 133104, badge = "147253", published = "26/11/2020 00:06:24", modified = "26/11/2020 00:06:24",
//     trigger = never(unibios_flag() != 0) && 
//               never(p1_state() != 1) && 
//               never(p2_state() != 0) && 
//               unless(game_mode() != 0) && 
//               settings_timer() == 1 && 
//               once(p2_char() == 13) && 
//               once(game_stage() == 13) && 
//               ladder_progress() == 10 && 
//               ladder_progress() > prev(ladder_progress()) && 
//               never(p1_char() != 0) &&
//               ((bios_flag_bad() == 0 && 
//               p1_rounds_wins_aes() == 2 && 
//               settings_difficulty() >= 2) ||
//                (bios_flag_bad() == 2 && 
//               p1_rounds_win_mvs() == 2 && 
//               settings_difficulty() >= 3))
// )

// achievement(
//     title = "Quick, But the Same", description = "Get a total Score 700.000 Points [Short-Mode]", points = 5,
//     id = 133123, badge = "147234", published = "26/11/2020 00:18:00", modified = "26/11/2020 00:18:00",
//     trigger = never(unibios_flag() != 0) && 
//               never(p1_state() != 1) && 
//               never(p2_state() != 0) && 
//               unless(game_mode_l4() != 1) && 
//               p1_score_10000() >= 112 && 
//               ladder_progress() > 0
// )

// achievement(
//     title = "Dazzle Electrical Power", description = "Finish Story Mode as Kaede by winning each fight with Awakening mode enabled (Default Setting) [Default difficulty or above]", points = 10,
//     id = 133072, badge = "147235", published = "25/11/2020 23:47:48", modified = "25/11/2020 23:47:48",
//     trigger = never(unibios_flag() != 0) && 
//               never(p1_state() == 0) && 
//               unless(p2_state() != 0) && 
//               unless(game_mode() != 0) && 
//               once(p2_char() == 13) && 
//               ladder_progress() == 10 && 
//               ladder_progress() >
//                prev(ladder_progress()) && 
//               settings_difficulty() >= 2 && 
//               unless(settings_timer() != 1) && 
//               unless(p1_char() != 0) &&
//               ((repeated(12, bios_flag_bad() == 0 && 
//               p1_rounds_wins_aes() > prev(p1_rounds_wins_aes())) && 
//               unless(p1_kaede_awakening() ==
//                  0)) ||
//                (repeated(12, bios_flag_bad() == 2 && 
//               p1_rounds_win_mvs() > prev(p1_rounds_win_mvs())) && 
//               unless(p1_kaede_awakening() ==
//                  0)))
// )

leaderboard(
    id = 19581, title = "Hi Score (Story Mode)",
    description = "Best score on Story Mode",
    start  = p1_state() == 1 && 
              ladder_progress_w() == 0 && 
              game_timer() == 96 && 
              game_mode() == 0,
    cancel = p1_state() == 0,
    submit = p1_state() == 1 && 
              ladder_progress() == 10,
    value = p1_score_10000000_h4() * 10000000 + p1_score_10000000_l4() * 1000000 + p1_score_10000_h4() * 100000 + p1_score_10000_l4() * 10000 + p1_score_1000_h4() * 1000 + p1_score_1000_l4() * 100 + p1_score_10_h4() * 10 + p1_score_10_l4() * 1,
    format = "SCORE"
)

leaderboard(
    id = 19582, title = "Hi Score (Short Mode)",
    description = "Best score on Short Mode",
    start  = p1_state() == 1 && 
              ladder_progress_w() == 0 && 
              game_timer() == 96 && 
              game_mode() == 1,
    cancel = p1_state() == 0,
    submit = p1_state() == 1 && 
              ladder_progress() == 4,
    value = p1_score_10000000_h4() * 10000000 + p1_score_10000000_l4() * 1000000 + p1_score_10000_h4() * 100000 + p1_score_10000_l4() * 10000 + p1_score_1000_h4() * 1000 + p1_score_1000_l4() * 100 + p1_score_10_h4() * 10 + p1_score_10_l4() * 1,
    format = "SCORE"
)
