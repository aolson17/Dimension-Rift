


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
	show_debug_message(side)
	
	if side != prev_side && side != 0 && prev_side != 0{
		if collision_line(x,y,end_x,end_y,obj_player,true,true){
			obj_player.layer = layer_get_id(target_layer)
			layer_set_visible(target_layer,true)
			if obj_player.layer = layer_get_id("Zones_1"){
				target_layer = "Zones_2"
				layer_background_blend(layer_background_get_id("Background"),background_1)
			}else{
				target_layer = "Zones_1"
				layer_background_blend(layer_background_get_id("Background"),background_2)
			}
			layer_set_visible(target_layer,false)
			reset_dimension = true
		}
	}
	if side != 0{
		prev_side = side
	}
}
