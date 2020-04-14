sprite_index = spr_player_fall
mask_index = stand_mask
image_speed = .3

if prev_state != state{
	image_index = 0
}
prev_state = state

if !on_ground{ // If in air
	if ysp <= 0{
		state = jump
	}
	
	face = image_xscale
}else{ // If on ground
	
	if left_key + right_key = 0{
		if prev_ysp >= 3.5{
			state = land
		}else{
			if xsp = 0{
				state = stand
			}else{
				state = run
			}
		}
	}else{
		state = run
	}
	
	image_xscale = face
}

prev_ysp = ysp

