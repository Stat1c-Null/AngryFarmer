/// @description Player Logic

//Keys
movement_keys()
//Movement Inputs
is_moving = is_player_moving()//Detect movement
var horiz = (key_right - key_left)
var ver = (key_down - key_up)

//Movement Logic
//Sprinting
if(key_sprint and stamina > 0.1 and is_moving)
{
	stamina -= 0.2
	horiz_spd = horiz * run_speed
	ver_spd = ver * run_speed		
} else {
	if (stamina < max_stamina) stamina += 0.2 // Regen stamina if its below 100
	horiz_spd = horiz * move_speed
	ver_spd = ver * move_speed 		
}

//Collision with the wall
if(place_meeting(x+horiz_spd,y,o_inv_wall)) {
	horiz_spd = 0
}
if(place_meeting(x,y+ver_spd,o_inv_wall)) {
	ver_spd = 0
}

x += horiz_spd
y += ver_spd

//Rotate player with the mouse
image_angle = point_direction(x,y, mouse_x, mouse_y)

//Weapon switch
weapon_switch()

//Switch weapons
if (key_melee) {
	global.weapon_equipped = "knife"
} else if(key_secondary) {
	global.weapon_equipped = "handgun"	
}

switch(global.weapon_equipped){
	
	case "handgun":
		//Shooting pistol
		firingdelay -= 1
		recoil = max(0, recoil - 1)

		if (key_attack and firingdelay < 0) {
			recoil = handgun_recoil
			firingdelay = handgun_fire_del_amount
			//Create bullet
			with (instance_create_layer(x,y, "Bullets", o_bullet)) {
				speed = handgun_bullet_speed
				//Make bullet follow the mouse
				direction = other.image_angle + random_range(-handgun_recoil, handgun_recoil)
				image_angle = direction
			}
		}

		//Push player backwards with Recoil
		x = x - lengthdir_x(recoil, image_angle)
		y = y - lengthdir_y(recoil, image_angle)
	break
	case "knife": 
		
		//Melee Combat
		if(key_attack and state == "passive") {
			image_speed = 1
			state = "attack"
		} else if(not key_attack and state == "passive") {
			image_speed = 0	
			state = "passive"
			hit = false
		}
		//Animate
		if (image_speed > 0) {//Check if current frame is the last frame in sprite
			if image_index > image_number - 1 {
				image_speed = 0
				state = "passive"
				image_index = 0
			}
		}
	break
}
