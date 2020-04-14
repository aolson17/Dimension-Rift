


if !surface_exists(portal_1){
	portal_1 = surface_create(width,height)
}
if !surface_exists(destination){
	destination = surface_create(width,height)
	scr_draw_destination(destination)
}

if reset_destination{
	scr_draw_destination(destination)
	reset_destination = false
}




if !formed_1{
	draw_set_color(c_blue)
	draw_line_width(round(x),round(y),round(end_x),round(end_y),3)
	
}
if formed_1{
	draw_set_color(c_dkgray)
	draw_triangle_color(round(x),round(y),round(end_x),round(end_y),round(closed_point_1_x),round(closed_point_1_y),c_blue,c_blue,c_dkgray,false)
	
	
	if !started_2{
		draw_set_color(c_dkgray)
		draw_line_width(round(closed_point_1_x),round(closed_point_1_y),round(start_2_x),round(start_2_y),2)
	}
}
if started_2 && !formed_2{
	draw_set_color(c_blue)
	draw_line_width(round(start_2_x),round(start_2_y),round(end_2_x),round(end_2_y),3)
	draw_set_color(c_dkgray)
	draw_line_width(round(closed_point_1_x),round(closed_point_1_y),round(center_2_x),round(center_2_y),2)
}else if formed_2{
	draw_set_color(c_blue)
	draw_line_width(round(start_2_x),round(start_2_y),round(end_2_x),round(end_2_y),3)
	draw_triangle_color(round(start_2_x),round(start_2_y),round(end_2_x),round(end_2_y),round(closed_point_2_x),round(closed_point_2_y),c_blue,c_blue,c_dkgray,false)
	draw_set_color(c_dkgray)
	draw_line_width(round(closed_point_1_x),round(closed_point_1_y),round(closed_point_2_x),round(closed_point_2_y),2)
	
	if open_side_1 = side_1{
		
		var temp_end_x = width/2+end_x-x
		var temp_end_y = height/2+end_y-y
		var temp_far_end_1_1_x = width/2+far_end_1_1_x-x
		var temp_far_end_1_1_y = height/2+far_end_1_1_y-y
		var temp_far_end_1_2_x = width/2+far_end_1_2_x-x
		var temp_far_end_1_2_y = height/2+far_end_1_2_y-y
		
		draw_set_color(background_c)
		
		surface_set_target(portal_1)
		draw_clear_alpha(c_black,0)
		
		draw_primitive_begin(pr_trianglestrip)
		draw_vertex(width/2,height/2)
		draw_vertex(temp_end_x,temp_end_y)
		draw_vertex(temp_far_end_1_2_x,temp_far_end_1_2_y)
		draw_vertex(width/2,height/2)
		draw_vertex(temp_far_end_1_1_x,temp_far_end_1_1_y)
		draw_primitive_end()
		
		gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha)
		
		dir = -(point_direction(start_2_x,start_2_y,end_2_x,end_2_y)-90)
		var pos_x = center_1_x-center_2_x
		var pos_y = center_1_y-center_2_y
		
		var dir_2 = point_direction(0,0,width/2,height/2)
		var dis = point_distance(0,0,width/2,height/2)
		
		var adj_x = width/2+lengthdir_x(dis,dir_2)
		var adj_y = height/2+lengthdir_y(dis,dir_2)
		
		var rotated_x = width/2+lengthdir_x(dis,dir_2+dir)//pos_x * cos(dir) - pos_y * sin(dir)
		var rotated_y = height/2+lengthdir_y(dis,dir_2+dir)//pos_x * sin(dir) + pos_y * cos(dir)
		
		//draw_surface_ext(destination,-(rotated_x-adj_x)+pos_x,-(rotated_y-adj_y)+pos_y,1,1,dir,c_white,1)
		
		draw_surface(destination,pos_x,pos_y)
		reset_destination = true
		gpu_set_blendmode(bm_normal)
		surface_reset_target()
		
		
		draw_surface(portal_1,x-width/2,y-height/2)
		if collision_line(x,y,end_x,end_y,obj_player,true,true){
			draw_sprite_ext(obj_player.sprite_index,obj_player.image_index,obj_player.x,obj_player.y,obj_player.image_xscale,obj_player.image_yscale,obj_player.image_angle,c_white,obj_player.image_alpha)
		}
		draw_set_color(c_black)
		draw_line_width(round(x),round(y),round(far_end_1_1_x),round(far_end_1_1_y),2)
		draw_line_width(round(end_x),round(end_y),round(far_end_1_2_x),round(far_end_1_2_y),2)
	}
}

if formed_1{
	draw_set_color(c_blue)
	draw_line_width(round(x),round(y),round(end_x),round(end_y),3)
}