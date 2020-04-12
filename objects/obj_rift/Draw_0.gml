
if !surface_exists(rift){
	rift = surface_create(width,height)
}
if !surface_exists(rift_part){
	rift_part = surface_create(width,height)
}
if !surface_exists(dimension) || reset_dimension{
	dimension = surface_create(width,height)
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

if target_layer = "Zones_1"{
	draw_set_color(background_1)
}else{
	draw_set_color(background_2)
}

draw_primitive_begin(pr_trianglestrip)

draw_vertex(width/2+1,height/2+1)
draw_vertex(temp_end_x,temp_end_y)
draw_vertex(temp_far_end_2_x,temp_far_end_2_y)
draw_vertex(width/2+1,height/2+1)
draw_vertex(temp_far_end_1_x,temp_far_end_1_y)

draw_primitive_end()

surface_reset_target()


surface_set_target(rift)
gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);

draw_surface(dimension,0,0)

gpu_set_blendmode(bm_normal)
surface_reset_target()


draw_surface(rift,x-width/2,y-height/2)

draw_set_color(c_red)
draw_line_width(x,y,end_x,end_y,2)
draw_set_color(c_black)
draw_line(x,y,far_end_1_x,far_end_1_y)
draw_line(end_x,end_y,far_end_2_x,far_end_2_y)
