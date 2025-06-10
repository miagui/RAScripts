// Metal Slug Anthology
// #ID = 3471

game_ms1 = 0
game_ms2 = 1
game_msx = 5
game_ms3 = 2
game_ms4 = 3
game_ms5 = 4

function pointer_game_block() => tbyte(0x93bf44)

// MS6 Stuff
function playing_ms6() => dword(0x3fdf7c) == 0x01
function playing_ms1_ms5() => dword(0x3fdf7c) == 0x03
function ms6_mission() => byte(0xdc2c76)
function ms6_active_players() => byte(0xd85bf8) > 0

function finish_mission(title, game_text, game_id, mission_p_offset, mission_id) {
    achievement(
        title = title, description = format("{0}: Finish Mission {1}.", game_text, mission_id + 1), points = 5,
        trigger =   prev(byte(mission_p_offset + pointer_game_block())) == mission_id &&
                    byte(mission_p_offset + pointer_game_block()) == mission_id + 1 && 
                    never((playing_ms1_ms5() && dword(0xB3E38C) != game_id)) &&
                    never((playing_ms1_ms5() && dword(0x1FFF09C) != 4294967295)) && 
                    never((playing_ms1_ms5() && dword(0x1FFF09C) == 4294967295 && dword(0x1FFEC64) == 1))
                )
}


// title, game_text, game_id, mission_p_offset, mission_id
finish_mission("Absolute Thick Forest", "MS1", game_ms1, 0x1006ED1, 0)
finish_mission("A Wish For a Morning Glow", "MS1", game_ms1, 0x1006ED1, 1)
finish_mission("Iron Cavalrymen in Hell", "MS1", game_ms1, 0x1006ED1, 2)
finish_mission("Death Valley", "MS1", game_ms1, 0x1006ED1, 3)
finish_mission("The City Under Despotism", "MS1", game_ms1, 0x1006ED1, 4)

finish_mission("Drifting in Desert", "MS2", game_ms2, 0x100C31E, 0)
finish_mission("Monument of Depression", "MS2", game_ms2, 0x100C31E, 1)
finish_mission("Madrigal of Wind", "MS2", game_ms2, 0x100C31E, 2)
finish_mission("Return to Hong-Kong", "MS2", game_ms2, 0x100C31E, 3)
finish_mission("Kiss in the Dark", "MS2", game_ms2, 0x100C31E, 4)

finish_mission("Drifting in Desert X", "MSX", game_msx, 0x100C2F4, 0)
finish_mission("Monument of Depression X", "MSX", game_msx, 0x100C2F4, 1)
finish_mission("Madrigal of Wind X", "MSX", game_msx, 0x100C2F4, 2)
finish_mission("Return to Hong-Kong X", "MSX", game_msx, 0x100C2F4, 3)
finish_mission("Kiss in the Dark X", "MSX", game_msx, 0x100C2F4, 4)

finish_mission("A Couple's Love Land", "MS3", game_ms3, 0x100040d, 0)
finish_mission("Wandering at Midnight", "MS3", game_ms3, 0x100040d, 1)
finish_mission("Eyes Over the Waves", "MS3", game_ms3, 0x100040d, 2)
finish_mission("Tombstone of Sand", "MS3", game_ms3, 0x100040d, 3)

finish_mission("Let's Run Through!", "MS4", game_ms4, 0x1000bcd, 0)
finish_mission("Show Spirit", "MS4", game_ms4, 0x1000bcd, 1)
finish_mission("Snowy Road", "MS4", game_ms4, 0x1000bcd, 2)
finish_mission("Cadaverous", "MS4", game_ms4, 0x1000bcd, 3)
finish_mission("Go Ahead!", "MS4", game_ms4, 0x1000bcd, 4)

finish_mission("Heavy African", "MS5", game_ms5, 0x1000bad, 0)
finish_mission("Windy Day", "MS5", game_ms5, 0x1000bad, 1)
finish_mission("Intrigue", "MS5", game_ms5, 0x1000bad, 2)
finish_mission("Run Through", "MS5", game_ms5, 0x1000bad, 3)

achievement("African Winds", "MS6: Finish Mission 1.", 5,
            trigger =   playing_ms6() && ms6_active_players() && prev(ms6_mission()) == 0 && ms6_mission() == 1)

achievement("The Illusion of El Dorado", "MS6: Finish Mission 2.", 5,
            trigger =   playing_ms6() && ms6_active_players() && prev(ms6_mission()) == 1 && ms6_mission() == 2)

achievement("Asian Impact", "MS6: Finish Mission 3.", 5,
            trigger =   playing_ms6() && ms6_active_players() && prev(ms6_mission()) == 2 && ms6_mission() == 3)

achievement("Golden Bridge is Falling Down", "MS6: Finish Mission 4.", 5,
            trigger =   playing_ms6() && ms6_active_players() && prev(ms6_mission()) == 3 && ms6_mission() == 4)