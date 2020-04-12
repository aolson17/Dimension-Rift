

#region Movement Control
move = right_key-left_key


var col_list = ds_list_create()
instance_place_list((x),(y+1),par_solid,col_list,true)
on_ground = false
for(var i = 0; i < ds_list_size(col_list); i++){
	if col_list[|i].layer = layer{
		on_ground = true
		break
	}
}

ds_list_destroy(col_list)

if on_ground{
	if !global.in_dialogue && state = stand || state = run || state = land && hp > 0{
		move_speed = run_speed
		max_move_speed = max_run_speed
	}else{
		move = 0
		move_speed = 0
		max_move_speed = 0
	}
}else{
	move_speed = air_move_factor*run_speed
	max_move_speed = max_run_speed
}

if move = sign(xsp){ // If trying to move in the same direction as momentum
	if abs(xsp) <= max_move_speed{ // If not already over limit
		xsp += move * move_speed
		if abs(xsp) > max_move_speed{ // Don't let xsp go over max
			xsp = move * max_move_speed
		}
	}
}else{
	xsp += move * move_speed
}
#endregion
#region Gravity and Friction
if !on_ground{ // Apply gravity
	ysp += grav_speed
}else{ // If on ground
	coyote_jump = true // Reset coyote jump ability
	alarm[8] = coyote_jump_frames
	if (move != sign(xsp) || abs(xsp) > max_move_speed){ // Apply friction
		var prev_xsp = xsp
		if xsp > 0{
			if xsp - move_friction > 0{
				xsp -= move_friction
			}else{
				xsp = 0
			}
		}else if xsp < 0{
			if xsp + move_friction < 0{
				xsp += move_friction
			}else{
				xsp = 0
			}
		}
		if move = 1 && xsp > 0 && abs(prev_xsp) <= max_move_speed{
			xsp = max_move_speed
		}else if move = -1 && xsp < 0 && abs(prev_xsp) <= max_move_speed{
			xsp = -max_move_speed
		}
	}
	if move = sign(xsp) && move != 0 && state = stand{
		if abs(xsp) < start_run_bonus_speed{
			xsp = start_run_bonus_speed * move
		}
	}
}
#endregion
#region Jump
if on_ground || coyote_jump{
	jumping = false
	if state != knocked && state != hurt && state != get_up{
		if jump_key || queue_jump{ // Jump
			ysp = -jump_speed
			jumping = true
			coyote_jump = false
			queue_jump = false
		}
		
		if face = 1{
			if move < 0{
				face = -1
			}
		}else{
			if move > 0{
				face = 1
			}
		}
	}
}else{
	if state = fall{
		if jump_key{ // Queue Jump
			queue_jump = true
			alarm[9] = queue_jump_frames
		}
	}
}

if ysp > 0{
	jumping = false
}
if jump_key_released && jumping{ // Variable jumping
	ysp *= variable_jump_factor
	jumping = false
}
if jump_key_released{ // Cancel queued jump
	queue_jump = false
}
#endregion



if state = stand || state = land || state = run{
	if mouse_r_pressed{
		face = sign(mouse_x-x)
		if face = 0{face = 1}
		instance_create_layer(mouse_x,mouse_y,"Rift",obj_rift)
		state = magic
	}
}





script_execute(state) // Manage which state is active
scr_collision()
