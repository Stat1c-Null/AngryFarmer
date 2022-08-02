// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function weapon_switch(){
	switch(global.weapon_equipped) {
		case "handgun":
			sprite_index = s_player_handgun
			image_index = 0
		break
		case "knife":
			sprite_index = s_player_knife
			//image_index = 0
		break
		default: sprite_index = s_player_knife
	}
}