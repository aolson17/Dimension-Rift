




if !formed_2{
	if !formed_1{
		end_x = mouse_x
		end_y = mouse_y
		if point_distance(x,y,end_x,end_y) > max_size{
			var dir = point_direction(x,y,end_x,end_y)
			end_x = x+lengthdir_x(max_size,dir)
			end_y = y+lengthdir_y(max_size,dir)
		}
		size = point_distance(x,y,end_x,end_y)
	}
	
	if obj_player.mouse_m_released && !started_2{
		center_1_x = (end_x + x)/2
		center_1_y = (end_y + y)/2
		formed_1 = true
		
		
		open_side_1 = sign((obj_player.x-x)*(end_y-y)-(obj_player.y-y)*(end_x-x))
		var dir = point_direction(round(x),round(y),round(end_x),round(end_y))
		if open_side_1 = 1{
			closed_point_1_x = center_1_x + lengthdir_x(10, dir-90)
			closed_point_1_y = center_1_y + lengthdir_y(10, dir-90)
		}else{
			closed_point_1_x = center_1_x + lengthdir_x(10, dir+90)
			closed_point_1_y = center_1_y + lengthdir_y(10, dir+90)
		}
	}
	
	if formed_1 && !started_2{
		start_2_x = mouse_x
		start_2_y = mouse_y
		if point_distance(center_1_x,center_1_y,start_2_x,start_2_y) > range{
			var dir = point_direction(center_1_x,center_1_y,start_2_x,start_2_y)
			start_2_x = center_1_x+lengthdir_x(range,dir)
			start_2_y = center_1_y+lengthdir_y(range,dir)
		}
	}
	if formed_1 && obj_player.mouse_m_pressed{
		started_2 = true
	}
	
	if started_2 && !formed_2{
		end_2_x = mouse_x
		end_2_y = mouse_y
		var dir = point_direction(start_2_x,start_2_y,end_2_x,end_2_y)
		end_2_x = start_2_x+lengthdir_x(size,dir)
		end_2_y = start_2_y+lengthdir_y(size,dir)
		center_2_x = (start_2_x + end_2_x)/2
		center_2_y = (start_2_y + end_2_y)/2
	}
	
	if started_2 && obj_player.mouse_m_released{
		formed_2 = true
		obj_player.casting = false
		
		open_side_2 = -sign((obj_player.x-start_2_x)*(end_2_y-start_2_y)-(obj_player.y-start_2_y)*(end_2_x-start_2_x))
		var dir = point_direction(round(start_2_x),round(start_2_y),round(end_2_x),round(end_2_y))
		if open_side_2 = 1{
			closed_point_2_x = center_2_x + lengthdir_x(10, dir-90)
			closed_point_2_y = center_2_y + lengthdir_y(10, dir-90)
		}else{
			closed_point_2_x = center_2_x + lengthdir_x(10, dir+90)
			closed_point_2_y = center_2_y + lengthdir_y(10, dir+90)
		}
		scr_draw_destination(destination)
	}
}else{ // If portal is completely formed
	side_1 = sign((obj_player.x-x)*(end_y-y)-(obj_player.y-y)*(end_x-x))
	
	var dir = point_direction(obj_player.x,obj_player.y,x,y)
	far_end_1_1_x = x+lengthdir_x(portal_depth,dir)
	far_end_1_1_y = y+lengthdir_y(portal_depth,dir)
	dir = point_direction(obj_player.x,obj_player.y,end_x,end_y)
	far_end_1_2_x = end_x+lengthdir_x(portal_depth,dir)
	far_end_1_2_y = end_y+lengthdir_y(portal_depth,dir)
	
	
}



