/// @description move2(collision_object)
function move2(collision_object){
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
	//Offset used to prevent character from sinking into the ground
	var sprite_bbox_top = sprite_get_bbox_top(sprite_index) + sprite_get_yoffset(sprite_index);
	var sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
	show_debug_message("bbox_bottom = " + string(sprite_get_bbox_bottom(sprite_index)));
	show_debug_message("bbox_top = " + string(sprite_get_bbox_top(sprite_index)));
	show_debug_message("yoffset = " + string(sprite_get_yoffset(sprite_index)));
	show_debug_message("sprite_bbox_bottom = " + string(sprite_bbox_bottom));
	show_debug_message("sprite_bbox_top = " + string(sprite_bbox_top));
	if (place_meeting(x, y +  sign(yspeed), collision_object)) {
		var ground = instance_place(x, y + sign(yspeed), collision_object);
		
		if yspeed > 0 {
			y = (collision_object.bbox_top + 1) - (sprite_bbox_bottom);
		}
		yspeed = 0.0;
	}
	y += yspeed;
}
