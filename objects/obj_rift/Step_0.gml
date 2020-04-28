


if !formed{
	end_x = mouse_x
	end_y = mouse_y
	
	if point_distance(x,y,end_x,end_y) > max_size{
		var dir = point_direction(x,y,end_x,end_y)
		end_x = x+lengthdir_x(max_size,dir)
		end_y = y+lengthdir_y(max_size,dir)
	}
	if obj_player.mouse_r_released{
		formed = true
		obj_player.casting = false
	}
}


var dir = point_direction(rift_target.x,rift_target.y,x,y)
far_end_1_x = x+lengthdir_x(rift_depth,dir)
far_end_1_y = y+lengthdir_y(rift_depth,dir)
var dir = point_direction(rift_target.x,rift_target.y,end_x,end_y)
far_end_2_x = end_x+lengthdir_x(rift_depth,dir)
far_end_2_y = end_y+lengthdir_y(rift_depth,dir)

if formed{
	side = sign((obj_player.x-x)*(end_y-y)-(obj_player.y-y)*(end_x-x))
	
	if side != prev_side && side != 0 && prev_side != 0{
		if collision_line(x,y,end_x,end_y,obj_player,true,true){
			global.prev_player_layer = obj_player.layer
			layer_set_visible(obj_player.layer,false)
			obj_player.layer = target_layer
			layer_set_visible(target_layer,true)
			for(var i = 0; i <= obj_dimensions.total_dimensions; i++){
				if target_layer = obj_dimensions.layers[i]{
					target_dimension = i
				}
			}
			
			obj_dimensions.current_dimension = target_dimension
			layer_background_blend(layer_background_get_id("Background"),obj_dimensions.backgrounds[obj_dimensions.current_dimension])
			reset_dimension = true
		}
	}
	if side != 0{
		prev_side = side
	}
}

if target_layer = obj_player.layer{
	target_layer = global.prev_player_layer
	for(var i = 0; i <= obj_dimensions.total_dimensions; i++){
		if target_layer = obj_dimensions.layers[i]{
			target_dimension = i
		}
	}
	reset_dimension = true
}

if life_frames <= 0 || die{
	if shrink_timer <= 0{
		shrink_timer = shrink_time
		
		var dir = point_direction(x,y,end_x,end_y)
		var x_change = lengthdir_x(shrink_amount,dir)
		var y_change = lengthdir_y(shrink_amount,dir)
		x += x_change
		y += y_change
		end_x -= x_change
		end_y -= y_change
		shrink_amount += shrink_amount_increase
		
		if point_distance(x,y,end_x,end_y) < 5{
			instance_destroy()
		}
		reset_dimension = true
	}else{
		if point_distance((x+end_x)/2,(y+end_y)/2,obj_player.x,obj_player.y) > life_range || die{
			shrink_timer--
		}else{
			shrink_amount = shrink_amount_start
		}
	}
}else{
	if distance_to_object(obj_player) > life_range{
		life_frames--
	}
}
