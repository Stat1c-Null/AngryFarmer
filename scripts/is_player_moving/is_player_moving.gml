// Determine whether player is moving or no
function is_player_moving(){
	//Keys
	movement_keys()
	
	//Detect movement
	if(key_up or key_down or key_right or key_left)
	{
		return true;	
	} else {
		return false;	
	}
}