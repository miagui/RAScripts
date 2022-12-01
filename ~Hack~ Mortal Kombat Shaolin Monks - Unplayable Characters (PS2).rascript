// ~Hack~ Mortal Kombat: Shaolin Monks - Unplayable Characters
// #ID = 21545

// =========================================
//              Memory Accessors              
// =========================================

function bios_current_executable() => dword(0x015510)

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

characters = {
    "Baraka": 0x53,
    "Reptile": 0x54,
    "Kitana": 0x59,
    "Johnny Cage": 0x5a
}

// =========================================
//             Utility Functions              
// =========================================

function is_main_game() => never(bios_current_executable() != 0x53554c53) 
function is_mk2() => never(bios_current_executable() != 0x5652414a) 

function is_koop() => is_main_game() && game_save_data_ascii() == 0x6f2d6f4b
function is_singleplayer() => is_main_game() && game_save_data_ascii() != 0x6f2d6f4b

function in_game() => game_state() == gs_gameplay

function mk2_p1_only() => mk2_p1_state() > 0 && mk2_p2_state() == 0


// 13 + 56 + 7 + 72 + 5 + 3 + 80 + 6 + 2 = 244, checked already and ok
function all_single_player_red_koins() =>   sum_of(range(2, 4), b => bit(b,0x5d828a))+
                                            sum_of(range(0, 2), b => bit(b,0x5d828b))+
                                            sum_of(range(6, 7), b => bit(b,0x5d828b))+
                                            sum_of(range(0, 1), b => bit(b,0x5d828c))+
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

function achiev_event_character(title, description, area_id, event_id, points, cheevo_id) {
    
    for char_name in characters {
        achievement(format(title + " ({0})", char_name), format("{0}: " + description, char_name), points,
                    trigger =   is_singleplayer() && 
                                in_game() &&
                                p1_char() == characters[char_name] &&
                                check_event_update(area_id, event_id)
                   )   
    }
}


// save protection and triggers good
achiev_event_character("Tsung's Island Escape", "Defeat Oni Warlord for the first time.", 0x65, 0x11, 5, 0)
achiev_event_character("The Portal", "Enter The Portal for the first time.", 0xc0, 0x58, 10, 0)
achiev_event_character("Evil Monastery", "Defeat Kitana, Jade and Mileena.", 0xc3, 0x3a, 10, 0)
achiev_event_character("Living Forest", "Defeat Reptile.", 0x90, 0x0e, 10, 0)
achiev_event_character("Soul Tombs", "Defeat Baraka.", 0x0f, 0x37, 10, 0)
achiev_event_character("The Wasteland", "Defeat Goro.", 0x2f, 0x05, 10, 0)
achiev_event_character("Netherrealm", "Defeat Scorpion.", 0xa0, 0x8a, 5, 0)
achiev_event_character("Kahn's Arena", "Defeat Shao Kahn and beat the game.", 0x49, 0x06, 10, 0)

achiev_event("sterceS rof txeT esreveR oT ekiL I ,seY", "Defeat Ermac.", 0x6c, 0x5e, 10, 0)
achiev_event("Tarkatan Clone", "Defeat Mileena.", 0x84, 0x48, 10, 0)
achiev_event("Kano Has Transformed", "Defeat Kano.", 0x48, 0x06, 10, 0)

achievement("Champion of Mortal Kombat", "Defeat Shao Kahn and beat the game on Hard difficulty.", 25,
            trigger =   is_singleplayer() && 
                        in_game() &&
                        game_difficulty() == diff_hard &&
                        check_event_update(0x49, 0x06)
            )

// =========================================
//                Unlockables              
// =========================================

achievement("Only Smoke Knows How To Play MK2", "Unlock MKII.", 10,
            trigger =   is_singleplayer() && 
                        in_game() &&
                        unlockables_mk2() == 1 &&
                        prev(unlockables_mk2()) == 0
            )

achievement("Healthy Monk", "Obtain all health upgrades.", 10,
            trigger =   is_singleplayer() && 
                        in_game() &&
                        measured(player_life_upgrades() == 4)  &&
                        prev(player_life_upgrades()) == 3
            )

// probably good
achievement("Koins Kollector I", "Obtain 25% of the obtainable Red Koins from Single Player.", 5,
            trigger =   is_singleplayer() && 
                        in_game() &&
                        all_single_player_red_koins() == 61 &&
                        prev(all_single_player_red_koins()) == 60
            )

achievement("Koins Kollector II", "Obtain 50% of the obtainable Red Koins from Single Player.", 5,
            trigger =   is_singleplayer() && 
                        in_game() &&
                        all_single_player_red_koins() == 122 &&
                        prev(all_single_player_red_koins()) == 121
            )

achievement("Koins Kollector III", "Obtain 75% of the obtainable Red Koins from Single Player.", 10,
            trigger =   is_singleplayer() && 
                        in_game() &&
                        all_single_player_red_koins() == 183 &&
                        prev(all_single_player_red_koins()) == 182
            )

achievement("Koins Kollector IV", "Obtain 100% of the obtainable Red Koins from Single Player.", 10,
            trigger =   is_singleplayer() && 
                        in_game() &&
                        all_single_player_red_koins() == 244 &&
                        prev(all_single_player_red_koins()) == 243
            )

// =========================================
//                 Fatalities              
// =========================================

function achiev_fatality_char(char, fatality_name, animation_id) {
    achievement(fatality_name, format("{0}: Perform the {1} finishing move.", char, fatality_name), 2,
                trigger =   is_singleplayer() && 
                            in_game() &&
                            p1_char() == characters[char] &&
                            p1_animation() == animation_id &&
                            prev(p1_animation()) != animation_id                
                )
}

achiev_fatality_char("Baraka", "Decapitation", 0x8f3)
achiev_fatality_char("Baraka", "Blade Lift", 0x8f5)

achiev_fatality_char("Kitana", "Kiss of Death", 0xb0b)
achiev_fatality_char("Kitana", "Head Chop", 0xb0d)

achiev_fatality_char("Reptile", "Head Eat", 0x97e)
achiev_fatality_char("Reptile", "Hidden Chomp", 0x980)

achiev_fatality_char("Johnny Cage", "Torso Rip", 0xb9e)
achiev_fatality_char("Johnny Cage", "Head Decaptation", 0xba0)

achievement("Fatal Monk", "Perform 25 Fatalities.", 10,
            trigger =   is_singleplayer() && 
                        in_game() &&
                        game_fatalities_count() == 25 &&
                        prev(game_fatalities_count()) == 24
            )

// =========================================
//                 Challenges              
// =========================================

// good
achievement("Proof of Survival", "Finish Survival Mode using Baraka, Kitana, Reptile or Cage.", 50,
            trigger =   is_singleplayer() && 
                        in_game() &&
                        never(game_current_area() != 0xbe) &&
                        (
                            p1_char() == characters["Baraka"] || p1_char() == characters["Kitana"] || p1_char() == characters["Reptile"] || p1_char() == characters["Johnny Cage"]
                        ) &&
                        tally(4, totalkills_p1_and_p2_sum())
            )

achievement("Proof of Warrior", "Beat the game without obtaining more than one health upgrade and no ability upgrades, using Baraka, Kitana, Reptile or Cage.", 25,
            trigger =   is_singleplayer() && 
                        game_state() != 0x08 &&
                        p1_total_upgrades() <= 5 &&
                        p2_total_upgrades() <= 5 &&
                        player_life_upgrades() <= 1 &&
                        (
                            p1_char() == characters["Baraka"] || p1_char() == characters["Kitana"] || p1_char() == characters["Reptile"] || p1_char() == characters["Johnny Cage"]
                        ) &&
                        trigger_when(game_current_fmv() == fmv_final_ending) &&
                        prev(game_current_fmv()) != fmv_final_ending
            )

achievement("Proof of Speed", "Beat the game within 1h45m in-game time using Baraka, Kitana, Reptile or Cage.", 50,
            trigger =   is_singleplayer() && 
                        game_state() != 0x08 &&
                        game_time() <= 378000 &&
                        (
                            p1_char() == characters["Baraka"] || p1_char() == characters["Kitana"] || p1_char() == characters["Reptile"] || p1_char() == characters["Johnny Cage"]
                        ) &&
                        trigger_when(game_current_fmv() == fmv_final_ending) &&
                        prev(game_current_fmv()) != fmv_final_ending
            )


// =========================================
//              Mortal Kombat 2              
// =========================================

// achievement("Mortal Kombat II Champion", "[MK2] Beat the game.", 10,
//             trigger =   is_mk2() &&
//                         mk2_p1_only() &&
//                         mk2_current_ladder() == 0x0e &&
//                         mk2_p1_rounds_wins() == 2 && 
//                         prev(mk2_p1_rounds_wins()) == 1
//             )

// achievement("Fatality", "[MK2] Perform any finishing move.", 2,
//             trigger =   is_mk2() &&
//                         mk2_p1_only() &&
//                         mk2_p1_hp() > 0 &&
//                         mk2_p2_hp() == 0 &&
//                         mk2_fight_finishing_move() == 0xFF && prev(mk2_fight_finishing_move()) != 0xFF
//             )

// achievement("Flawless Victory", "[MK2] Win with a Flawless Victory.", 2,
//             trigger =   is_mk2() &&
//                         mk2_p1_only() &&
//                         mk2_p1_flawless() == 1 && prev(mk2_p1_flawless()) == 0
//             )