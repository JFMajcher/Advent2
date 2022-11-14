// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function old_jump_fall(){
	if (!place_meeting(x, y + yspeed, o_solid)) {
			//Player is in the air
			yspeed += gravity_acceleration;
			sprite_index = s_player_jump;
			image_index = (yspeed > 0);
			
			//Control jump height
			if (up_release and yspeed < -2) {
				yspeed = -1;
			}
		}
		else {
			yspeed = 0;
			if (up) {
				yspeed = jump_height;
			}
		}
}