

target_x = target.x+(face_offset*obj_player.face)+target.xsp*target_speed_factor

if obj_player.on_ground{
	follow_camera = false
}

possible_new_target_y = target.y-25*obj_player.on_ground

if abs(possible_new_target_y - target_y) > 80 || (obj_player.on_ground && !prev_on_ground){
	if abs(possible_new_target_y - target_y) > 80{
		follow_camera = true
	}
	
	non_scope_target_y = possible_new_target_y//target.y-25*obj_player.on_ground+target.ysp*target_speed_factor
}
prev_on_ground = obj_player.on_ground

target_y = non_scope_target_y

if follow_camera{
	target_y = (target.y+target.ysp*target_speed_factor)
}

if shake > 0{
	shake_offset_x = choose(-1,1)*((irandom(shake)+1)*4)
	shake_offset_y = choose(-1,1)*((irandom(shake)+1)*4)
	shake_offset_r = 0//choose(-1,1)
	shake--
}else{
	shake_offset_x = 0
	shake_offset_y = 0
	shake_offset_r = 0
}

x += spd_factor*(target_x-x+shake_offset_x)
y += spd_factor_y*(target_y-y+shake_offset_y)

if abs(x-target_x) <= leniency_x{
	x = target_x
}
if abs(y-target_y) <= leniency_y{
	y = target_y
}

camera_set_view_pos(camera, (x-zoom_width/2), (y-zoom_height/2))
camera_set_view_angle(camera,shake_offset_r)
camera_set_view_size(camera,zoom_width,zoom_height)

layer_x("Background",x*.8)
layer_y("Background",y*.8)