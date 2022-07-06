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

x += horiz_spd
y += ver_spd

//Rotate player with the mouse
image_angle = point_direction(x,y, mouse_x, mouse_y)

//Shooting pistol
firingdelay -= 1
recoil = max(0, recoil - 1)

if(mouse_check_button_pressed(mb_left) and firingdelay < 0) {
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
