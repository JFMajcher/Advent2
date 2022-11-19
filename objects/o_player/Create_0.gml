/// @description Initialize Player Variables

max_speed = 3;
xspeed = 0;
yspeed = 0;
dash_speed = 6;
run_speed = 5;
acceleration = 1;
gravity_acceleration = .5;
jump_height = -4;



enum player {
	walk,
	dash,
	run,
	airtime,
	attac
}

state = player.walk;
