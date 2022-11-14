/// @description move(collision_object)
function move(collision_object){
	collision_object = argument0;
	//Horizontal Collsisions
	if (place_meeting(x + xspeed, y, collision_object)) {
		while (!place_meeting(x + sign(xspeed), y , collision_object)) {
			x += sign(xspeed);	
		}
		xspeed = 0;
	}
	x += xspeed;
	
	//Vertical Collisions

	if (place_meeting(x, y + yspeed, collision_object)) {
		
		while (!place_meeting(x, y + sign(yspeed), collision_object)) {
			y += sign(yspeed);
		}
		yspeed = 0;
	}
	y += yspeed;
}
