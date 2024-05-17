/// @description Zombie Logic

//Wander


//Chase player
var distToPlayer = distance_to_object(o_player)
chasePlayer = distToPlayer < follow_dist
if(chasePlayer and instance_exists(o_player)) {
	image_speed = 1
	mp_potential_step(o_player.x, o_player.y, move_speed, false)
}

if(hp <= 0) {
	instance_destroy(self)	
}