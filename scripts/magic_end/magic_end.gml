sprite_index = spr_player_book_end
mask_index = stand_mask
image_speed = .4

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
	
	if move != 0{
		state = run
	}
	if image_index > image_number-1{
		state = stand
	}
	
	image_xscale = face
}


