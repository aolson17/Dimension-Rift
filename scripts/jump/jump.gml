if ysp > -1.5{
	sprite_index = spr_player_jump_top
	image_speed = .5
}else{
	sprite_index = spr_player_jump
	image_speed = 1
}
mask_index = stand_mask

if prev_state != state{
	image_index = 0
}
prev_state = state

if !on_ground{ // If in air
	if ysp > 0{
		state = fall
	}
	
	if sprite_index = spr_player_jump_top{
		if image_index > image_number-1{
			image_speed = 0
		}
	}
}else{ // If on ground
	
	if xsp = 0{
		state = stand
	}else{
		state = run
	}
	
	image_xscale = face
}






