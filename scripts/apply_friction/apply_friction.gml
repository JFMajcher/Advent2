/// @destription apply_friction(amount)
function apply_friction(amount){
//Check if we're moving
	if (xspeed != 0) {
		if (abs(xspeed) - amount > 0) {
			xspeed -= amount * image_xscale;
		}
		else {
			xspeed = 0;
		}
	}
}