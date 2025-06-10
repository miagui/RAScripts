// Plants vs. Zombies
// #ID = 12718

function pointer_level() => tbyte(0x23F66C)
function profile_1_coins() => word(0x240494)
function profile_1_survival_endless_survived_flags() => byte(0x2404B0)
function profile_1_survival_endless_survived_flags() => word(0x2404B0)
function profile_1_puzzle_vessels_endless_streak_counter() => byte(0x24051C)
function profile_1_puzzle_vessels_endless_streak_counter() => word(0x24051C)
function profile_1_puzzle_i_zombie_endless_streak_counter() => byte(0x240530)
function profile_1_puzzle_i_zombie_endless_streak_counter() => word(0x240530)
function profile_1_achievements_1_8_shopping_spree_buy_25000() => bit4(0x240A64)
function profile_1_achievements_1_8_greenhouser() => bit6(0x240A64)
function profile_1_achievements_8_14_demolitioneer() => bit0(0x240A65)
function profile_1_achievements_8_14_photosensitive() => bit1(0x240A65)
function profile_1_achievements_8_14_don_t_drink_the_water() => bit2(0x240A65)
function profile_1_achievements_8_14_nebulaphile() => bit3(0x240A65)
function profile_1_achievements_8_14_unsiege_mentality() => bit4(0x240A65)
function profile_2_coins() => word(0x240AB0)
function profile_2_survival_endless_survived_flags() => byte(0x240ACC)
function profile_2_puzzle_vessels_endless_streak_counter() => byte(0x240B38)
function profile_2_puzzle_i_zombie_endless_streak_counter() => byte(0x240B4C)
function profile_2_achievements_1_8_shopping_spree_buy_25000() => bit4(0x241080)
function profile_2_achievements_1_8_greenhouser() => bit6(0x241080)
function profile_2_achievements_8_14_demolitioneer() => bit0(0x241081)
function profile_2_achievements_8_14_photosensitive() => bit1(0x241081)
function profile_2_achievements_8_14_don_t_drink_the_water() => bit2(0x241081)
function profile_2_achievements_8_14_nebulaphile() => bit3(0x241081)
function profile_2_achievements_8_14_unsiege_mentality() => bit4(0x241081)

function ingame_check() => dword(0x23f615) == 0x61676e69
 
achievement(
    title = "Spending Until the Last Coin", points = 10,
    description = "Spend $25.000 in Crazy Dave's Shop",
    id = 110895, badge = "120934", published = "18/05/2020 02:36:42", modified = "22/05/2023 23:47:03",
    trigger = repeated(60, ingame_check()) &&
              (profile_1_achievements_1_8_shopping_spree_buy_25000() >
                  prev(profile_1_achievements_1_8_shopping_spree_buy_25000()) ||
                  profile_2_achievements_1_8_shopping_spree_buy_25000() >
                  prev(profile_2_achievements_1_8_shopping_spree_buy_25000())
              )
)

achievement(
    title = "Money Magnet", points = 5,
    description = "Obtain over 10.000 coins",
    id = 110948, badge = "121330", published = "18/05/2020 12:12:10", modified = "22/05/2023 23:47:03",
    trigger = repeated(60, ingame_check()) &&
              ((measured(profile_1_coins() >= 1000) && prev(profile_1_coins()) < 1000) ||
               (measured(profile_2_coins() >= 1000) && prev(profile_2_coins()) < 1000))
)

achievement(
    title = "Demolitioneer", points = 5,
    description = "Blow up 10 zombies at once with a single cherry bomb",
    id = 110937, badge = "121313", published = "18/05/2020 12:11:45", modified = "22/05/2023 23:47:06",
    trigger = repeated(60, ingame_check()) &&
              (profile_1_achievements_8_14_demolitioneer() > prev(profile_1_achievements_8_14_demolitioneer()) ||
                  profile_2_achievements_8_14_demolitioneer() > prev(profile_2_achievements_8_14_demolitioneer())
              )
)

achievement(
    title = "Don't Drink The Water", points = 5,
    description = "Beat a pool level without using any aquatic plants",
    id = 110938, badge = "121320", published = "18/05/2020 12:11:46", modified = "22/05/2023 23:47:07",
    trigger = repeated(60, ingame_check()) &&
              (profile_1_achievements_8_14_don_t_drink_the_water() >
                  prev(profile_1_achievements_8_14_don_t_drink_the_water()) ||
                  profile_2_achievements_8_14_don_t_drink_the_water() >
                  prev(profile_2_achievements_8_14_don_t_drink_the_water())
              )
)

achievement(
    title = "Unsiege Mentality", points = 5,
    description = "Complete a roof level without using any catapult plants",
    id = 110940, badge = "121322", published = "18/05/2020 12:11:50", modified = "22/05/2023 23:47:07",
    trigger = repeated(60, ingame_check()) &&
              (profile_1_achievements_8_14_unsiege_mentality() > prev(profile_1_achievements_8_14_unsiege_mentality())
                  || profile_2_achievements_8_14_unsiege_mentality() > prev(profile_2_achievements_8_14_unsiege_mentality())
              )
)

achievement(
    title = "Nebulaphile", points = 5,
    description = "Beat an extremely foggy level without disturbing any fog",
    id = 110939, badge = "121321", published = "18/05/2020 12:11:48", modified = "22/05/2023 23:47:08",
    trigger = repeated(60, ingame_check()) &&
              (profile_1_achievements_8_14_nebulaphile() > prev(profile_1_achievements_8_14_nebulaphile()) ||
                  profile_2_achievements_8_14_nebulaphile() > prev(profile_2_achievements_8_14_nebulaphile())
              )
)

achievement(
    title = "Mother of Plants", points = 10,
    description = "Raise 10 plants to full growth in the Zen Garden",
    id = 110899, badge = "121083", published = "18/05/2020 02:36:52", modified = "22/05/2023 23:47:09",
    trigger = repeated(60, ingame_check()) &&
              (profile_1_achievements_1_8_greenhouser() > prev(profile_1_achievements_1_8_greenhouser()) ||
                  profile_2_achievements_1_8_greenhouser() > prev(profile_2_achievements_1_8_greenhouser())
              )
)

achievement(
    title = "Photosensitive", points = 5,
    description = "Beat a Night level without picking up any sun",
    id = 110936, badge = "121319", published = "18/05/2020 12:11:43", modified = "10/09/2023 15:52:10",
    trigger = repeated(60, ingame_check()) &&
              (profile_1_achievements_8_14_photosensitive() > prev(profile_1_achievements_8_14_photosensitive()) ||
                  profile_2_achievements_8_14_photosensitive() > prev(profile_2_achievements_8_14_photosensitive())
              )
)

achievement(
    title = "Botanic Strategist", points = 5,
    description = "Finish 8 flags on Survival Endless",
    id = 110942, badge = "121324", published = "18/05/2020 12:11:59", modified = "22/05/2023 23:47:16",
    trigger = repeated(60, ingame_check()) &&
              ((profile_1_survival_endless_survived_flags() >= 8 &&
                profile_1_survival_endless_survived_flags() > prev(profile_1_survival_endless_survived_flags())) ||
               (profile_2_survival_endless_survived_flags() >= 8 &&
                profile_2_survival_endless_survived_flags() > prev(profile_2_survival_endless_survived_flags())))
)

achievement(
    title = "And They Don't Stop Coming", points = 10,
    description = "Finish 16 flags on Survival Endless",
    id = 110943, badge = "121325", published = "18/05/2020 12:12:01", modified = "22/05/2023 23:47:17",
    trigger = repeated(60, ingame_check()) &&
              ((profile_1_survival_endless_survived_flags() >= 16 &&
                profile_1_survival_endless_survived_flags() > prev(profile_1_survival_endless_survived_flags())) ||
               (profile_2_survival_endless_survived_flags() >= 16 &&
                profile_2_survival_endless_survived_flags() > prev(profile_2_survival_endless_survived_flags())))
)

achievement(
    title = "A World Made Of Vases", points = 10,
    description = "Reach 7 streaks on Endless Vasebreaker",
    id = 110950, badge = "121332", published = "18/05/2020 12:12:13", modified = "22/05/2023 23:47:18",
    trigger = repeated(60, ingame_check()) &&
              ((profile_1_puzzle_vessels_endless_streak_counter() >= 7 &&
                profile_1_puzzle_vessels_endless_streak_counter() > prev(profile_1_puzzle_vessels_endless_streak_counter())) ||
               (profile_2_puzzle_vessels_endless_streak_counter() >= 7 &&
                profile_2_puzzle_vessels_endless_streak_counter() > prev(profile_2_puzzle_vessels_endless_streak_counter())))
)

achievement(
    title = "Me, Zombie, Brain", points = 10,
    description = "Reach 7 streaks on Endless I, Zombie",
    id = 110951, badge = "121333", published = "18/05/2020 12:12:14", modified = "12/10/2023 16:58:27",
    trigger = repeated(60, ingame_check()) &&
              ((profile_1_puzzle_i_zombie_endless_streak_counter() >= 7 &&
                profile_1_puzzle_i_zombie_endless_streak_counter() > prev(profile_1_puzzle_i_zombie_endless_streak_counter())) ||
               (profile_2_puzzle_i_zombie_endless_streak_counter() >= 7 &&
                profile_2_puzzle_i_zombie_endless_streak_counter() > prev(profile_2_puzzle_i_zombie_endless_streak_counter())))
)

// =========================================
//                Leaderboard              
// =========================================

leaderboard(
    id = 8206, title = "Survival Endless: Highest Flags",
    description = "Go as further as you can on Survival Endless!",
    start  = repeated(60, ingame_check()) && profile_1_survival_endless_survived_flags() > prev(profile_1_survival_endless_survived_flags()) &&
             pointer_level() != 0,
    cancel = always_false(),
    submit = profile_1_survival_endless_survived_flags() >= 0,
    value  = profile_1_survival_endless_survived_flags(),
    format = "VALUE"
)

leaderboard(
    id = 8216, title = "Vasebreaker Endless: Highest Streak",
    description = "Go as further as you can on Vasebreaker Endless!",
    start  = repeated(60, ingame_check()) && profile_1_puzzle_vessels_endless_streak_counter() > prev(profile_1_puzzle_vessels_endless_streak_counter()) &&
             pointer_level() != 0,
    cancel = always_false(),
    submit = profile_1_puzzle_vessels_endless_streak_counter() >= 0,
    value  = profile_1_puzzle_vessels_endless_streak_counter(),
    format = "VALUE"
)

leaderboard(
    id = 8217, title = "I, Zombie Endless: Highest Streak",
    description = "Go as further as you can on I, Zombie Endless!",
    start  = repeated(60, ingame_check()) && profile_1_puzzle_i_zombie_endless_streak_counter() > prev(profile_1_puzzle_i_zombie_endless_streak_counter()) &&
             pointer_level() != 0,
    cancel = always_false(),
    submit = profile_1_puzzle_i_zombie_endless_streak_counter() >= 0,
    value  = profile_1_puzzle_i_zombie_endless_streak_counter(),
    format = "VALUE"
)
