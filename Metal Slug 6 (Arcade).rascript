// Metal Slug 6
// #ID = 16525

function p1_p2_state() => word(0x3868DA)

function mission() => byte(0x3D3CF6)
function mission_section() => byte(0x3D3CF7)

function entity_pointer_array_start() => tbyte(0x3FC5C0)
// Offsets
p_entity_id_offset = 0x04
p_entity_sheet_offset = 0x40
p_entity_pos_x_offset = 0x60
p_entity_hp_offset = 0x8c
p_entity_item_data_pointer = 0xB0
p_item_remaining_timer_pointer = 0x16

function trig_golden_alien_killed()
{
    trigger = always_false()
    entity_pointer_base_address = 0x3FC5C0
    for i in range(0, 46)
    {
        entity_pointer_address = tbyte(entity_pointer_base_address + i * 4)
        trigger =   trigger || 
                    byte(entity_pointer_address + p_entity_id_offset) == 0x7b &&
                    trigger_when(byte(entity_pointer_address + p_entity_hp_offset) == 0) &&
                    word(entity_pointer_address + p_entity_pos_x_offset) != 0
    }
    return trigger
}

achievement("Bounty Hunter", "Kill a Golden Hunter Walker on Mission 5.", 5,
            trigger =   mission() == 4 &&
                        mission_section() == 3 &&
                        trig_golden_alien_killed()
            )

function trig_birds_nest_collected()
{
    trigger = always_false()
    entity_pointer_base_address = 0x3fc814
    for i in range(0, 46)
    {
        entity_pointer_address = tbyte(entity_pointer_base_address + i * 4)
        trigger =   trigger || 
                    byte(entity_pointer_address + p_entity_id_offset) == 0x00 &&
                    byte(entity_pointer_address + p_entity_sheet_offset) == 0x03 &&
                    trigger_when(prev(dword(entity_pointer_address + p_entity_pos_x_offset)) == 0x025c0000 &&
                                 dword(entity_pointer_address + p_entity_pos_x_offset) == 0x00 &&
                                 prev(word(tbyte(entity_pointer_address + p_entity_item_data_pointer) + p_item_remaining_timer_pointer)) >= 2 &&
                                 word(tbyte(entity_pointer_address + p_entity_item_data_pointer) + p_item_remaining_timer_pointer) == 0
                                 )

    }
    return trigger
}

achievement("Leap of Faith", "Collect the hidden bird's nest on Mission 2.", 3,
            trigger =   mission() == 1 &&
                        mission_section() == 1 &&
                        trig_birds_nest_collected()
            )