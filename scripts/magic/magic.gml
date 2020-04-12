sprite_index = spr_player_book
mask_index = stand_mask
image_speed = .3

if prev_state != state{
	image_index = 0
}
prev_state = state

if !mouse_r{
	state = magic_end
}

if !on_ground{ // If in air
	if ysp <= 0{
		state = jump
	}else{
		state = fall
	}
}else{ // If on ground
	image_xscale = face
}


