// ~Hack~ Ultimate Mortal Kombat Trilogy
// #ID = 13421

function game_cheats_menu_activated_0_1() => byte(0x000021)
function p1_char() => byte(0x000126)
function p2_char() => byte(0x000128)
function screen_vertical_scroll() => byte(0x000136)


function game_screen() => byte(0x00014C)
function game_state() => byte(0x00020E)
function game_character_bio() => byte(0x00021E)
function game_bio_page() => byte(0x00021F)

function p1_rounds_win_global() => byte(0x00029E)

function treasure_fatality_demonstration_finish_move() => byte(0x0002AA)

function ladder_first_opponent_novice() => byte(0x0002B1)
function ladder_last_opponent_novice() => byte(0x0002B6)
function ladder_first_opponent_warrior() => byte(0x0002B9)
function ladder_first_opponent_master() => byte(0x0002C0)
function ladder_last_opponent_warrior() => byte(0x0002C1)
function ladder_first_opponent_champion() => byte(0x0002CA)
function ladder_last_opponent_master() => byte(0x0002CB)
function ladder_last_opponent_champion() => byte(0x0002D4)

function ladder_current_ladder() => byte(0x0002e5)
function ladder_current_fight() => byte(0x0002f1)

function game_treasure() => byte(0x0002E2)
function game_mode() => byte(0x0002E3)

function p1_active() => byte(0x0002EC)
function p2_active() => byte(0x0002EE)

function round_ended() => byte(0x0002F8)

function p1_round_wins() => byte(0x009F8C)
function p1_wins_combat() => byte(0x009F90)
function p1_wins_global() => byte(0x00029a)

function p1_normal_moves() => byte(0x00A22A)
function p1_combo_moves_id() => byte(0x00A2E6)

function p1_damage_combo() => byte(0x00A2E8)

function p1_sprite_id() => byte(0x00C510)

function p1_char_2() => byte(0x00C512)

function secrets_timer() => byte(0x00D657)

function p1_hp() => word(0x00F228)
function p2_hp() => word(0x00F39A)

function match_finishing_move() => byte(0x00F4FE)
function match_winner_announce() => byte(0x00F516)

function options_killer_codes_wins_needed() => byte(0x00f8f1)
function options_killer_codes_finish_him_resist_enabled_0_1() => byte(0x00F882)
function options_killer_codes_new_hits_enabled_0_1() => byte(0x00F8A8)
function options_health() => byte(0x00F8B2)
function options_chosen() => byte(0x00F8B5)
function options_cheats_aggressor_enabled_0_1() => byte(0x00F8C0)

function options_secrets_3_players_mode_dramatic_mode() => byte(0x00F8D8)
function options_killer_codes_b_quick_end_enabled_0_1() => byte(0x00F8EF)
function options_cheats_umk_3_mode_enabled_0_1() => byte(0x00F912)

function ladder_first_character_custom_5th_ladder() => byte(0x00F8C9)
function ladder_last_character_custom_5th_ladder() => byte(0x00F8D2)


achievement(
    title = "UMKT Champion - Baraka", points = 10,
    description = "Finish any tower using only Baraka (no 5th tower).",
    id = 147091, badge = "164252", published = "25/03/2021 18:25:47", modified = "25/03/2021 18:25:47",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x1C) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Chameleon", points = 10,
    description = "Finish any tower using only Chameleon (no 5th tower).",
    id = 147092, badge = "164253", published = "25/03/2021 18:25:48", modified = "25/03/2021 18:25:48",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x19) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Classic Sub-Zero", points = 10,
    description = "Finish any tower using only Classic Sub-Zero (no 5th tower).",
    id = 147093, badge = "164254", published = "25/03/2021 18:25:51", modified = "25/03/2021 18:25:51",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x15) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Cyrax", points = 10,
    description = "Finish any tower using only Cyrax (no 5th tower).",
    id = 147094, badge = "164255", published = "25/03/2021 18:25:52", modified = "25/03/2021 18:25:52",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x08) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Ermac", points = 10,
    description = "Finish any tower using only Ermac (no 5th tower).",
    id = 147095, badge = "164256", published = "25/03/2021 18:25:53", modified = "25/03/2021 18:25:53",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x14) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Goro", points = 10,
    description = "Finish any tower using only Goro (no 5th tower).",
    id = 147096, badge = "164257", published = "25/03/2021 18:25:54", modified = "25/03/2021 18:25:54",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x21) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Human Smoke UMK3", points = 10,
    description = "Finish any tower using only Human Smoke UMK3 (no 5th tower).",
    id = 147097, badge = "164258", published = "25/03/2021 18:25:55", modified = "25/03/2021 18:25:55",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x16) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Jade MK2", points = 10,
    description = "Finish any tower using only Jade MK2 (no 5th tower).",
    id = 147098, badge = "164259", published = "25/03/2021 18:25:56", modified = "25/03/2021 18:25:56",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x2C) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Jade UMK3", points = 10,
    description = "Finish any tower using only Jade UMK3 (no 5th tower).",
    id = 147099, badge = "164260", published = "25/03/2021 18:25:57", modified = "25/03/2021 18:25:57",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x10) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Jax MK2", points = 10,
    description = "Finish any tower using only Jax MK2 (no 5th tower).",
    id = 147100, badge = "164261", published = "25/03/2021 18:25:58", modified = "25/03/2021 18:25:58",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x23) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Jax MK3", points = 10,
    description = "Finish any tower using only Jax MK3 (no 5th tower).",
    id = 147101, badge = "164262", published = "25/03/2021 18:26:00", modified = "25/03/2021 18:26:00",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x02) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Johnny Cage MK1", points = 10,
    description = "Finish any tower using only Johnny Cage MK1 (no 5th tower).",
    id = 147102, badge = "164263", published = "25/03/2021 18:26:01", modified = "25/03/2021 18:26:01",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x33) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Johnny Cage MK2", points = 10,
    description = "Finish any tower using only Johnny Cage MK2 (no 5th tower).",
    id = 147103, badge = "164264", published = "25/03/2021 18:26:02", modified = "25/03/2021 18:26:02",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x1F) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Johnny Cage MKT", points = 10,
    description = "Finish any tower using only Johnny Cage MKT (no 5th tower).",
    id = 147104, badge = "164266", published = "25/03/2021 18:26:03", modified = "25/03/2021 18:26:03",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x2F) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Kabal", points = 10,
    description = "Finish any tower using only Kabal (no 5th tower).",
    id = 147105, badge = "164267", published = "25/03/2021 18:26:04", modified = "25/03/2021 18:26:04",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x0A) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Kano MK1", points = 10,
    description = "Finish any tower using only Kano MK1 (no 5th tower).",
    id = 147106, badge = "164269", published = "25/03/2021 18:26:05", modified = "25/03/2021 18:26:05",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x30) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Kano MK3", points = 10,
    description = "Finish any tower using only Kano MK3 (no 5th tower).",
    id = 147107, badge = "164268", published = "25/03/2021 18:26:06", modified = "25/03/2021 18:26:06",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x00) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Khameleon MKT", points = 10,
    description = "Finish any tower using only Khameleon MKT (no 5th tower).",
    id = 147108, badge = "164270", published = "25/03/2021 18:26:07", modified = "25/03/2021 18:26:07",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x0B) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Kintaro", points = 10,
    description = "Finish any tower using only Kintaro (no 5th tower).",
    id = 147109, badge = "164271", published = "25/03/2021 18:26:07", modified = "25/03/2021 18:26:07",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x20) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Kitana MK2", points = 10,
    description = "Finish any tower using only Kitana MK2 (no 5th tower).",
    id = 147110, badge = "164368", published = "25/03/2021 18:26:08", modified = "25/03/2021 18:26:08",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x2B) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Kitana UMK3", points = 10,
    description = "Finish any tower using only Kitana UMK3 (no 5th tower).",
    id = 147111, badge = "164272", published = "25/03/2021 18:26:09", modified = "25/03/2021 18:26:09",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x0F) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Kung Lao MK2", points = 10,
    description = "Finish any tower using only Kung Lao MK2 (no 5th tower).",
    id = 147112, badge = "164273", published = "25/03/2021 18:26:10", modified = "25/03/2021 18:26:10",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x2E) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Kung Lao MK3", points = 10,
    description = "Finish any tower using only Kung Lao MK3 (no 5th tower).",
    id = 147113, badge = "164274", published = "25/03/2021 18:26:11", modified = "25/03/2021 18:26:11",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x09) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Liu Kang MK1", points = 10,
    description = "Finish any tower using only Liu Kang MK1 (no 5th tower).",
    id = 147114, badge = "164275", published = "25/03/2021 18:26:12", modified = "25/03/2021 18:26:12",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x32) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Liu Kang MK2", points = 10,
    description = "Finish any tower using only Liu Kang MK2 (no 5th tower).",
    id = 147115, badge = "164276", published = "25/03/2021 18:26:13", modified = "25/03/2021 18:26:13",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x1D) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Liu Kang MK3", points = 10,
    description = "Finish any tower using only Liu Kang MK3 (no 5th tower).",
    id = 147116, badge = "164277", published = "25/03/2021 18:26:14", modified = "25/03/2021 18:26:14",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x0D) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Mileena MK2", points = 10,
    description = "Finish any tower using only Mileena MK2 (no 5th tower).",
    id = 147117, badge = "164278", published = "25/03/2021 18:26:16", modified = "25/03/2021 18:26:16",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x2D) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Mileena UMK3", points = 10,
    description = "Finish any tower using only Mileena UMK3 (no 5th tower).",
    id = 147118, badge = "164279", published = "25/03/2021 18:26:17", modified = "25/03/2021 18:26:17",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x11) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Motaro", points = 10,
    description = "Finish any tower using only Motaro (no 5th tower).",
    id = 147119, badge = "164280", published = "25/03/2021 18:26:21", modified = "25/03/2021 18:26:21",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x1A) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Nightwolf", points = 10,
    description = "Finish any tower using only Nightwolf (no 5th tower).",
    id = 147120, badge = "164281", published = "25/03/2021 18:26:22", modified = "25/03/2021 18:26:22",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x03) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Noob Saibot MK2", points = 10,
    description = "Finish any tower using only Noob Saibot MK2 (no 5th tower).",
    id = 147121, badge = "164282", published = "25/03/2021 18:26:23", modified = "25/03/2021 18:26:23",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x2A) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Noob Saibot UMK3", points = 10,
    description = "Finish any tower using only Noob Saibot UMK3 (no 5th tower).",
    id = 147122, badge = "164283", published = "25/03/2021 18:26:24", modified = "25/03/2021 18:26:24",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x17) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Rain", points = 10,
    description = "Finish any tower using only Rain (no 5th tower).",
    id = 147123, badge = "164284", published = "25/03/2021 18:26:25", modified = "25/03/2021 18:26:25",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x18) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Rayden MK1", points = 10,
    description = "Finish any tower using only Rayden MK1 (no 5th tower).",
    id = 147124, badge = "164285", published = "25/03/2021 18:26:26", modified = "25/03/2021 18:26:26",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x34) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Rayden MK2", points = 10,
    description = "Finish any tower using only Rayden MK2 (no 5th tower).",
    id = 147125, badge = "164286", published = "25/03/2021 18:26:27", modified = "25/03/2021 18:26:27",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x24) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Reptile MK1", points = 10,
    description = "Finish any tower using only Reptile MK1 (no 5th tower).",
    id = 147126, badge = "164287", published = "25/03/2021 18:26:28", modified = "25/03/2021 18:26:28",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x36) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Reptile MK2", points = 10,
    description = "Finish any tower using only Reptile MK2 (no 5th tower).",
    id = 147127, badge = "164289", published = "25/03/2021 18:26:29", modified = "25/03/2021 18:26:29",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x27) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Reptile UMK3", points = 10,
    description = "Finish any tower using only Reptile UMK3 (no 5th tower).",
    id = 147128, badge = "164291", published = "25/03/2021 18:26:30", modified = "25/03/2021 18:26:30",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x13) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Scorpion MK1", points = 10,
    description = "Finish any tower using only Scorpion MK1 (no 5th tower).",
    id = 147129, badge = "164292", published = "25/03/2021 18:26:31", modified = "25/03/2021 18:26:31",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x35) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Scorpion MK2", points = 10,
    description = "Finish any tower using only Scorpion MK2 (no 5th tower).",
    id = 147130, badge = "164293", published = "25/03/2021 18:26:32", modified = "25/03/2021 18:26:32",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x26) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Scorpion UMK3", points = 10,
    description = "Finish any tower using only Scorpion UMK3 (no 5th tower).",
    id = 147131, badge = "164294", published = "25/03/2021 18:26:33", modified = "25/03/2021 18:26:33",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x12) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Sektor", points = 10,
    description = "Finish any tower using only Sektor (no 5th tower).",
    id = 147132, badge = "164295", published = "25/03/2021 18:26:35", modified = "25/03/2021 18:26:35",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x07) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Shang Tsung MK1", points = 10,
    description = "Finish any tower using only Shang Tsung MK1 (no 5th tower).",
    id = 147133, badge = "164296", published = "25/03/2021 18:26:36", modified = "25/03/2021 18:26:36",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x38) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Shang Tsung MK2", points = 10,
    description = "Finish any tower using only Shang Tsung MK2 (no 5th tower).",
    id = 147134, badge = "164297", published = "25/03/2021 18:26:38", modified = "25/03/2021 18:26:38",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x25) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Shang Tsung MK3", points = 10,
    description = "Finish any tower using only Shang Tsung MK3 (no 5th tower).",
    id = 147135, badge = "164298", published = "25/03/2021 18:26:39", modified = "25/03/2021 18:26:39",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x0C) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Shao Kahn MK2", points = 10,
    description = "Finish any tower using only Shao Kahn MK2 (no 5th tower).",
    id = 147136, badge = "164299", published = "25/03/2021 18:26:40", modified = "25/03/2021 18:26:40",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x22) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Shao Kahn MK3", points = 10,
    description = "Finish any tower using only Shao Kahn MK3 (no 5th tower).",
    id = 147137, badge = "164300", published = "25/03/2021 18:26:41", modified = "25/03/2021 18:26:41",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x1B) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Sheeva", points = 10,
    description = "Finish any tower using only Sheeva (no 5th tower).",
    id = 147138, badge = "164301", published = "25/03/2021 18:26:43", modified = "25/03/2021 18:26:43",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x39) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Sindel", points = 10,
    description = "Finish any tower using only Sindel (no 5th tower).",
    id = 147139, badge = "164302", published = "25/03/2021 18:26:44", modified = "25/03/2021 18:26:44",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x06) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Smoke", points = 10,
    description = "Finish any tower using only Smoke (no 5th tower).",
    id = 147140, badge = "164303", published = "25/03/2021 18:26:49", modified = "25/03/2021 18:26:49",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x0E) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Smoke MK2", points = 10,
    description = "Finish any tower using only Smoke MK2 (no 5th tower).",
    id = 147141, badge = "164304", published = "25/03/2021 18:26:51", modified = "25/03/2021 18:26:51",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x29) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Sonya MK1", points = 10,
    description = "Finish any tower using only Sonya MK1 (no 5th tower).",
    id = 147142, badge = "164305", published = "25/03/2021 18:26:51", modified = "25/03/2021 18:26:51",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x31) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Sonya MK3", points = 10,
    description = "Finish any tower using only Sonya MK3 (no 5th tower).",
    id = 147143, badge = "164306", published = "25/03/2021 18:26:52", modified = "25/03/2021 18:26:52",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x01) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Stryker", points = 10,
    description = "Finish any tower using only Stryker (no 5th tower).",
    id = 147144, badge = "164307", published = "25/03/2021 18:26:53", modified = "25/03/2021 18:26:53",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x05) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Sub-Zero MK1", points = 10,
    description = "Finish any tower using only Sub-Zero MK1 (no 5th tower).",
    id = 147145, badge = "164308", published = "25/03/2021 18:26:54", modified = "25/03/2021 18:26:54",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x37) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Sub-Zero MK2", points = 10,
    description = "Finish any tower using only Sub-Zero MK2 (no 5th tower).",
    id = 147146, badge = "164309", published = "25/03/2021 18:26:56", modified = "25/03/2021 18:26:56",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x28) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)

achievement(
    title = "UMKT Champion - Sub-Zero MK3", points = 10,
    description = "Finish any tower using only Sub-Zero MK3 (no 5th tower).",
    id = 147147, badge = "164310", published = "25/03/2021 18:26:57", modified = "25/03/2021 18:26:57",
    trigger = trigger_when(p1_wins_global() > prev(p1_wins_global())) && once(ladder_current_fight() == 0x00) && p1_active() == 0x01 && 
              p2_active() != 0x01 && unless(game_screen() == 0x0E) && never(p1_char()
               != 0x04) && never(game_screen() == 0x14) &&
              ((ladder_current_ladder() == 0x00 && trigger_when(ladder_current_fight() == 0x07)) ||
               (ladder_current_ladder() == 0x01 && trigger_when(ladder_current_fight() == 0x08)) ||
               (ladder_current_ladder() == 0x02 && trigger_when(ladder_current_fight() == 0x09)) ||
               (ladder_current_ladder() == 0x03 && trigger_when(ladder_current_fight() == 0x0A)))
)
