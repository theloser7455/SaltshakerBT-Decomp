if paused
    alpha = lerp(alpha, 0.5, 0.1)
else
    alpha = lerp(alpha, 0, 0.5)
if (breakdancespeed > 0.5 && sprite_index == spr_player_littledanceydance && currentRoom == room)
{
    if breakdanceID == noone
    {
        with instance_create_depth(x, y, 3, obj_beatbox)
        {
			other.breakdanceID = id
			target = other.id
        }
    }
    if !instance_exists(breakdanceID)
        breakdanceID = noone
}