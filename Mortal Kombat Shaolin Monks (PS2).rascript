// Mortal Kombat: Shaolin Monks
// #ID = 19201


// =========================================
//              Memory Accessors              
// =========================================

function bios_current_executable() => dword(0x015510)
function game_code_executable() => dword(0x00100010)

// MK2
function mk2_game_state() => byte(0x51A03A)
function mk2_p1_state() => byte(0x51A03E)
function mk2_p1_char() => byte(0x51A050)
function mk2_p1_hp() => byte(0x51A05E)
function mk2_p1_flawless() => byte(0x51A060)
function mk2_p1_rounds_wins() => byte(0x51A062)
function mk2_p2_state() => byte(0x51A1B8)
function mk2_p2_char() => byte(0x51A1CA)
function mk2_p2_hp() => byte(0x51a1d8)
function mk2_fight_finishing_move() => byte(0x51A338)
function mk2_fight_round_end() => byte(0x51A352)
function mk2_current_ladder() => byte(0x51A366)

// MKSM
function unlockables_mk2() => byte(0x5D82B0)
function unlockables_subzero() => byte(0x5D82B4)
function unlockables_scorpion() => byte(0x5D82B8)

function game_state() => dword(0x5E1650)
         gs_main_menu = 0x08
         gs_gameplay = 0x0a
function game_previous_state() => dword(0x5E1654)

function game_current_fmv() => dword(0x678551)
         fmv_final_ending = 0x414e4946

function game_save_data_ascii() => dword(0xc29684)
function game_time() => dword(0xC29680)
function game_fatalities_count() => dword(0x5C3C98)
function game_current_area() => dword(0xC29748)
function game_difficulty() => dword(0xC29754)
         diff_normal = 1
         diff_hard = 2

function game_events_array_start() => byte(0xC2A070)
function game_total_events() => byte(0xC2DEF0)

function entity1_health() => dword(0xC093A8)
function entity2_health() => dword(0xC098E8)
function entity3_health() => dword(0xC09E28)
function entity4_health() => dword(0xC0A368)
function boss_health() => byte(0x5D19A4)

function player_health() => dword(0xC08928)
function player_life_upgrades() => byte(0xC29760)

function p1_char() => dword(0xC2974C)
function p2_char() => dword(0xC29750)

function p1_animation() => dword(0x5e6b64)
function p2_animation() => dword(0x5e9f24)

function p1_best_combo() => dword(0xC2E228)
function p2_best_combo() => dword(0xC2E288)
function p1_total_kills() => dword(0xc2e220)
function p2_total_kills() => dword(0xc2e280)

function p1_special_move_square() => byte(0xC29844)
function p1_special_move_triangle() => byte(0xC29845)
function p1_special_move_circle() => byte(0xC29846)
function p1_special_move_r2() => byte(0xC29847)

function p1_combo1_unlocked() => byte(0xC29851)
function p1_combo2_unlocked() => byte(0xC29852)
function p1_combo3_unlocked() => byte(0xC29853)
function p1_combo4_unlocked() => byte(0xC29854)
function p1_combo5_unlocked() => byte(0xC29855)

function game_is_running() => dword(0xc29680) > prev(dword(0xc29680))

characters = {
    "Liu Kang": 0x00,
    "Kung Lao": 0x01,
    "Scorpion": 0x52,
    "Sub-Zero": 0x58
}

// =========================================
//             Utility Functions              
// =========================================

function is_main_game() => never(game_code_executable() != 0xae000004) 
function is_mk2() => never(game_code_executable() != 0x70001c28)

function is_koop() => is_main_game() && game_save_data_ascii() == 0x6f2d6f4b
function is_singleplayer() => is_main_game() && game_save_data_ascii() != 0x6f2d6f4b

function in_game() => game_state() == gs_gameplay
function outside_main_menu() => game_state() != gs_main_menu

function game_beaten_fmv() => game_current_fmv() == fmv_final_ending && prev(game_current_fmv()) != fmv_final_ending
function game_beaten() => game_state() == 0x13 && prev(game_state()) == gs_gameplay

function mk2_p1_only() => mk2_p1_state() > 0 && mk2_p2_state() == 0


// 13 + 56 + 7 + 72 + 5 + 3 + 80 + 6 + 2 = 244, checked already and ok
// edit: reworked, it's 242 now.
function all_single_player_red_koins() =>   sum_of(range(2, 4), b => bit(b,0x5d828a))+
                                            sum_of(range(0, 2), b => bit(b,0x5d828b))+
                                            sum_of(range(6, 7), b => bit(b,0x5d828b))+

                                            sum_of(range(5, 7), b => bit(b,0x5d828c))+
                                            sum_of(range(0, 31), b => bit(b,0x5d828d))+
                                            sum_of(range(0, 23), b => bit(b,0x5d8291))+
                                            sum_of(range(0, 4), b => bit(b,0x5d8294))+
                                            sum_of(range(6, 7), b => bit(b,0x5d8294))+

                                            sum_of(range(0, 31), b => bit(b,0x5d8295))+
                                            sum_of(range(0, 31), b => bit(b,0x5d8299))+
                                            sum_of(range(0, 12), b => bit(b,0x5d829d))+
                                            sum_of(range(5, 7), b => bit(b,0x5d829f))+

                                            sum_of(range(0, 31), b => bit(b,0x5d82a0))+
                                            sum_of(range(0, 31), b => bit(b,0x5d82a4))+
                                            sum_of(range(0, 21), b => bit(b,0x5d82a8))+

                                            bit4(0x5d82ae) + bit6(0x5d82ae)

// 15 total, checked already and ok
function all_coop_red_koins() =>    sum_of(range(5, 7), b => bit(b,0x5d829e))+
                                    sum_of(range(0, 4), b => bit(b,0x5d829f))+
                                    sum_of(range(6, 11), b => bit(b,0x5d82ad))+ 
                                    bit5(0x5d82ae)


function totalkills_p1_and_p2_sum() {
    logic_hits = []
    for i in range(1,5) {
        array_push(logic_hits, p1_total_kills() - prev(p1_total_kills()) >= i)
        array_push(logic_hits, p2_total_kills() - prev(p2_total_kills()) >= i)
    }
    array_push(logic_hits, always_false())
    return logic_hits
}

function p1_total_upgrades() {
    return  byte(0xc29844) + byte(0xc29845) + byte(0xc29846) + byte(0xc29847) +
            byte(0xc29851) + byte(0xc29852) + byte(0xc29853) + byte(0xc29854) + byte(0xc29855)
}

function p2_total_upgrades() {
    return  byte(0xc29860) + byte(0xc29861) + byte(0xc29862) + byte(0xc29863) +
            byte(0xc2986d) + byte(0xc2986e) + byte(0xc2986f) + byte(0xc29870) + byte(0xc29871)
}

// =========================================
//            Events Achievements            
// =========================================

function check_event_update(area_id, event_id) {
    trigger = always_false()
    events_array_start = 0xc2a070
    for i in range(0, 1499) { // there is total of 2000 slots, but we go with 1000 because its too much for the string size lol
        current_area = events_array_start + (i * 8)
        current_event = current_area + 4
        trigger =   trigger ||
                    dword(current_area) == area_id &&
                    dword(current_event) == event_id &&
                    prev(dword(current_area)) == 0
    }
    return trigger
}

function achiev_event(title, description, area_id, event_id, points, cheevo_id) {

    achievement(title, description, points,
                trigger =   is_singleplayer() && 
                            in_game() &&
                            check_event_update(area_id, event_id)
                )
}

function achiev_animation_event_character(title, description, area_id, animation_id, points, cheevo_id) {
    
    for char_name in characters {
        achievement(format(title + " ({0})", char_name), format(description, char_name), points,
                    trigger =   is_singleplayer() && 
                                in_game() &&
                                p1_char() == characters[char_name] &&
                                game_current_area() == area_id &&
                                p1_animation() == animation_id &&
                                prev(p1_animation()) != animation_id
                   )   
    }
}

function achiev_medallion_character(title, description, medallion_address, points, cheevo_id) {
    
    for char_name in characters {
        achievement(format(title + " ({0})", char_name), format(description, char_name), points,
                    trigger =   is_singleplayer() && 
                                in_game() &&
                                p1_char() == characters[char_name] &&
                                medallion_address == 1 &&
                                prev(medallion_address) == 0
                   )   
    }
}


// save protection and triggers good
// achiev_event_character("Tsung's Island Escape", "Defeat Oni Warlord for the first time as {0}.", 0x65, 0x11, 5, 0)
// achiev_event_character("The Portal", "Enter The Portal for the first time as {0}.", 0xc0, 0x58, 10, 0)
// achiev_event_character("Evil Monastery", "Defeat Kitana, Jade and Mileena as {0}.", 0xc3, 0x3a, 10, 0)
// achiev_event_character("Living Forest", "Defeat Reptile as {0}.", 0x90, 0x0e, 10, 0)
// achiev_event_character("Soul Tombs", "Defeat Baraka as {0}.", 0x0f, 0x37, 10, 0)
// achiev_event_character("The Wasteland", "Defeat Goro as {0}.", 0x2f, 0x05, 10, 0)
// achiev_event_character("Netherrealm", "Defeat Scorpion as {0}.", 0xa0, 0x8a, 5, 0)
// achiev_event_character("Kahn's Arena", "Defeat Shao Kahn and beat the game as {0}.", 0x49, 0x06, 10, 0)

// NEW
achiev_medallion_character("Tsung's Island Escape", "Defeat Oni Warlord and obtain Long Jump as {0}.", bit0(0xc2984c), 5, 0)
achiev_medallion_character("The Portal", "Enter The Portal for the first time as {0}.", bit7(0xc29743), 10, 0)
achiev_medallion_character("Evil Monastery", "Defeat Kitana, Jade and Mileena and obtain Fists of Ruins as {0}.", bit0(0xc2984e), 10, 0)
achiev_medallion_character("Living Forest", "Defeat Reptile and obtain Wall Climb as {0}.", bit0(0xc29848), 10, 0)
achiev_medallion_character("Soul Tombs", "Defeat Baraka and obtain Wall Jump as {0}.", bit0(0xc2984a), 10, 0)
achiev_medallion_character("The Wasteland", "Defeat Goro and obtain Double Jump as {0}.", bit0(0xc2984b), 10, 0)
achiev_animation_event_character("Netherrealm", "Defeat Scorpion as {0}.", 0xa0, 0xbb9, 5, 0)

for char_name in characters {
        achievement(format("Kahn's Arena ({0})", char_name), format("Defeat Shao Kahn and beat the game as {0}", char_name), 10,
                    trigger =   is_singleplayer() && 
                                p1_char() == characters[char_name] &&
                                game_beaten()
                   )   
    }

achiev_event("ajniN ht4", "Defeat Ermac.", 0x6c, 0x5e, 10, 0)
achiev_event("Emperor's Clone", "Defeat Mileena.", 0x84, 0x48, 10, 0)
achiev_event("Kano Transformations", "Defeat Kano.", 0x48, 0x06, 10, 0)

achievement("Champion of Mortal Kombat", "Defeat Shao Kahn and beat the game on Hard difficulty.", 25,
            trigger =   is_singleplayer() && 
                        game_difficulty() == diff_hard &&
                        game_beaten()
            )

// =========================================
//                Unlockables              
// =========================================

// probably good
achievement("Koins Kollector I", "Obtain 25% of the obtainable Red Koin items from Single Player.", 5,
            trigger =   is_singleplayer() && 
                        in_game() &&
                        measured(all_single_player_red_koins() >= 61) &&
                        all_single_player_red_koins() > prev(all_single_player_red_koins())
                        // prev(all_single_player_red_koins()) < 61
            )

achievement("Koins Kollector II", "Obtain 50% of the obtainable Red Koin items from Single Player.", 5,
            trigger =   is_singleplayer() && 
                        in_game() &&
                        measured(all_single_player_red_koins() >= 122) &&
                        all_single_player_red_koins() > prev(all_single_player_red_koins())
                        // prev(all_single_player_red_koins()) == 121
            )

achievement("Koins Kollector III", "Obtain 75% of the obtainable Red Koin items from Single Player.", 10,
            trigger =   is_singleplayer() && 
                        in_game() &&
                        measured(all_single_player_red_koins() >= 183) &&
                        all_single_player_red_koins() > prev(all_single_player_red_koins())
                        // prev(all_single_player_red_koins()) == 182
            )

achievement("Koins Kollector IV", "Obtain 100% of the obtainable Red Koin items from Single Player.", 10,
            trigger =   is_singleplayer() && 
                        in_game() &&
                        measured(all_single_player_red_koins() == 242) &&
                        all_single_player_red_koins() > prev(all_single_player_red_koins()) 
                        // prev(all_single_player_red_koins()) == 243
            )


// =========================================
//                 Survival              
// =========================================

// good
achievement("Proof of Survival", "Finish Survival Mode.", 50,
            trigger =   is_singleplayer() && 
                        in_game() &&
                        never(game_current_area() != 0xbe) &&
                        game_is_running() &&
                        entity1_health() == 666 &&
                        entity2_health() == 666 &&
                        entity3_health() == 666 &&
                        entity4_health() == 666 &&
                        (
                            entity1_health() != prev(entity1_health()) ||
                            entity2_health() != prev(entity2_health()) ||
                            entity3_health() != prev(entity3_health()) ||
                            entity4_health() != prev(entity4_health())
                        )
            )

// =========================================
//              Mortal Kombat 2              
// =========================================

achievement("Mortal Kombat II Champion", "[MK2] Beat the game.", 10,
            trigger =   is_mk2() &&
                        mk2_p1_only() &&
                        mk2_current_ladder() == 0x0e &&
                        mk2_p1_hp() > 0 &&
                        mk2_p2_hp() == 0 &&
                        mk2_p2_hp() < prev(mk2_p2_hp()) &&
                        prev(mk2_p1_rounds_wins()) == 1
            )

achievement("Fatality", "[MK2] Perform any finishing move.", 2,
            trigger =   is_mk2() &&
                        mk2_p1_only() &&
                        mk2_p1_hp() > 0 &&
                        mk2_p2_hp() == 0 &&
                        mk2_fight_finishing_move() == 0xFF && prev(mk2_fight_finishing_move()) != 0xFF
            )

achievement("Flawless Victory", "[MK2] Win with a Flawless Victory.", 2,
            trigger =   is_mk2() &&
                        mk2_p1_only() &&
                        mk2_p1_flawless() == 1 && prev(mk2_p1_flawless()) == 0
            )

// =========================================
//                Leaderboards              
// =========================================

leaderboard("Speedrun - Normal", "Best in-game time on Normal difficulty.",
           start = is_singleplayer() && game_beaten() && game_difficulty() == diff_normal,
           cancel = is_koop(),
           submit = is_singleplayer() && game_beaten() && game_difficulty() == diff_normal,
           value = game_time(),
           format = "FRAMES", lower_is_better=true)

leaderboard("Speedrun - Hard", "Best in-game time on Hard difficulty.",
           start = is_singleplayer() && game_beaten() && game_difficulty() == diff_hard,
           cancel = is_koop(),
           submit = is_singleplayer() && game_beaten() && game_difficulty() == diff_hard,
           value = prior(game_time()),
           format = "FRAMES", lower_is_better=true)