/// @description Controlling the players state

#region Set up controls for the player
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
up = keyboard_check(vk_up)

shift = keyboard_check(vk_shift);
up_release = keyboard_check_released(vk_up);
#endregion

#region State Machine
switch (state) {
	#region Walk State
		case player.walk:
		if (xspeed == 0) {
			sprite_index = s_player_idle;
		}
		else {
			sprite_index = s_player_walk;
		}
		//Check if player is on the ground
		if (!place_meeting(x, y + 1, o_solid)) {
			//Player is in the air
			state = player.airtime;
		}
		else {
			if (up) {
				yspeed = jump_height;
				}
		}
		
		
		//Change direction of sprite
		if(xspeed != 0){
			image_xscale = sign(xspeed);
		}
		//Check for moving left or right
		if (right or left){
			xspeed += (right - left) * acceleration;
			xspeed = clamp(xspeed, -max_speed, max_speed);
		}
		else{
			apply_friction(acceleration);
		}
		move2(o_solid);
		//Check for dashing
		if (shift && place_meeting(x, y + 1, o_solid)) {
			state = player.dash;
		}
		
		break;
	#endregion
	
	#region Dash State
		case player.dash:
			sprite_index = s_player_dash;
			xspeed = dash_speed * image_xscale;
			move2(o_solid);
			if (image_index == 3) {
				if (!shift || left == right){
				state = player.walk;
				}
				else {
				state = player.run;
				}
			}
		break;		
	#endregion
	
	#region Run State
		case player.run:
			if (!shift || left == right) {
				state = player.walk;
			}
			if (up) {
				yspeed = jump_height;
				state = player.walk;
			}
			sprite_index = s_player_run;
			xspeed = run_speed * image_xscale;
			move2(o_solid);
		break;
	#endregion
	
	#region Jump State
		case player.airtime:
			if (place_meeting(x, y + 1, o_solid)){
				yspeed = 0;
				state = player.walk;
			}
			
			yspeed += gravity_acceleration;
			sprite_index = s_player_jump;
			image_index = (yspeed > 0);
			move2(o_solid);
			
		break;
	#endregion
}
#endregion
