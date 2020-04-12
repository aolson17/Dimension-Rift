sprite_index = spr_player_idle
mask_index = stand_mask
image_speed = 1

if prev_state != state{
	image_index = 0
}
prev_state = state

if !on_ground{ // If in air
	if ysp <= 0{
		state = jump
	}else{
		state = fall
	}
}else{ // If on ground
	
	if xsp != 0{
		state = run
	}
	
	image_xscale = face
}


