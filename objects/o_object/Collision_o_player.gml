/// @description Collision with melee hit
if o_player.state == "attack" and o_player.hit == false {
	hp -= 1	
	o_player.hit = true
}