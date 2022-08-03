// All the keyboard presses
function movement_keys(){
	//Keys 
	key_up = keyboard_check(vk_up) or keyboard_check(ord("W"))
	key_down = keyboard_check(vk_down) or keyboard_check(ord("S"))
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D"))
	key_left = keyboard_check(vk_left) or keyboard_check(ord("A"))
	key_sprint = keyboard_check(vk_shift)
	key_melee = keyboard_check_pressed(ord("1"))
	key_secondary = keyboard_check_pressed(ord("2"))
	key_attack = mouse_check_button_pressed(mb_left)
}