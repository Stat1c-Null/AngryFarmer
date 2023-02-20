/// @description
//Disable alpha blending
gpu_set_blendenable(false)

if (pause) { // Draw frozen image to screen while paused
	surface_set_target(application_surface)
	if (surface_exists(pause_surf)) {
		draw_surface(pause_surf, 0, 0)	
	} else { //Restore from buffer if we lost surface
		pause_surf = surface_create(res_width, res_height)
		buffer_set_surface(pause_surf_buff, pause_surf, 0)
	}
	surface_reset_target()
}

if (keyboard_check_pressed(vk_escape)) {
	if(!pause) { // Pause game
		pause = true
		
		//Deactivate everything except of this instance
		instance_deactivate_all(true)
		
		//Capture this game moment
		pause_surf = surface_create(res_width, res_height)
		surface_set_target(pause_surf)
		draw_surface(application_surface, 0, 0)
		surface_reset_target()
		
		//Back up this surface to a buffer in case we lose it
		if(buffer_exists(pause_surf_buff)) {
			buffer_delete(pause_surf_buff)	
		}
		pause_surf_buff = buffer_create(res_width * res_height * 4, buffer_fixed, 1)
		buffer_get_surface(pause_surf_buff, pause_surf, 0)
	} else { //Unpause game
		pause = false
		instance_activate_all()
		if (surface_exists(pause_surf)) {
			surface_free(pause_surf)	
		}
		if (buffer_exists(pause_surf_buff)) {
			buffer_delete(pause_surf_buff)
		}
	}
}

//Enable blending again
gpu_set_blendenable(true)