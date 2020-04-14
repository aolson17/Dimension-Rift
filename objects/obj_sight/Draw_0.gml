
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

draw_set_color(obj_dimensions.backgrounds[target_dimension])

draw_circle(width/2,height/2,size,false)


gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);
draw_surface(dimension,start_x-x,start_y-y)
//draw_surface(dimension,0,0)
gpu_set_blendmode(bm_normal)

surface_reset_target()


draw_surface(rift,round(x)-width/2,round(y)-height/2)

draw_set_color(c_red)
draw_circle(round(x),round(y),size,true)
draw_circle(round(x),round(y),size-.5,true)
draw_circle(round(x),round(y),size-1,true)



