/// @description Player Logic

//Keys 
var key_up = keyboard_check(vk_up) or keyboard_check(ord("W"))
var key_down = keyboard_check(vk_down) or keyboard_check(ord("S"))
var key_right = keyboard_check(vk_right) or keyboard_check(ord("D"))
var key_left = keyboard_check(vk_left) or keyboard_check(ord("A"))
var key_sprint = keyboard_check(vk_shift)

//Movement Inputs
var horiz = (key_right - key_left)
var ver = (key_down - key_up)

//Movement Logic
//Sprinting
if(key_sprint and stamina > 0.1)
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
