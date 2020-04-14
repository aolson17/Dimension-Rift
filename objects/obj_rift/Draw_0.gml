
if !surface_exists(rift){
	rift = surface_create(width,height)
}
if !surface_exists(dimension){
	dimension = surface_create(width,height)
	scr_draw_dimension()
}
if reset_dimension{
	scr_draw_dimension()
	reset_dimension = false
}

surface_set_target(rift)


draw_clear_alpha(c_black,0)

var temp_end_x = width/2+end_x-x
var temp_end_y = height/2+end_y-y
var temp_far_end_1_x = width/2+far_end_1_x-x
var temp_far_end_1_y = height/2+far_end_1_y-y
var temp_far_end_2_x = width/2+far_end_2_x-x
var temp_far_end_2_y = height/2+far_end_2_y-y

draw_set_color(obj_dimensions.backgrounds[target_dimension])

draw_primitive_begin(pr_trianglestrip)
draw_vertex(width/2,height/2)
draw_vertex(temp_end_x,temp_end_y)
draw_vertex(temp_far_end_2_x,temp_far_end_2_y)
draw_vertex(width/2,height/2)
draw_vertex(temp_far_end_1_x,temp_far_end_1_y)
draw_primitive_end()


gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);

draw_surface(dimension,0,0)

gpu_set_blendmode(bm_normal)
surface_reset_target()


draw_surface(rift,round(x)-width/2,round(y)-height/2)
if collision_line(x,y,end_x,end_y,obj_player,true,true){
	draw_sprite_ext(obj_player.sprite_index,obj_player.image_index,obj_player.x,obj_player.y,obj_player.image_xscale,obj_player.image_yscale,obj_player.image_angle,c_white,obj_player.image_alpha)
}
draw_set_color(c_red)
draw_line_width(round(x),round(y),round(end_x),round(end_y)-1,3)
draw_set_color(c_black)
draw_line_width(round(x)-1,round(y),far_end_1_x-1,far_end_1_y,2)
draw_line_width(round(end_x)-1,round(end_y)-1,far_end_2_x,far_end_2_y-1,2)
