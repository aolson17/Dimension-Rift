





max_size = 90
size = -1

range = 100

formed_1 = false
started_2 = false
formed_2 = false

end_x = mouse_x
end_y = mouse_y
start_2_x = -999
start_2_y = -999
end_2_x = -999
end_2_y = -999

center_1_x = -999
center_1_y = -999
center_2_x = -999
center_2_y = -999

open_side_1 = 0

dir = -99

side_1 = 0
prev_side_1 = side_1

background_c = c_ltgray
for(var i = 0; i <= obj_dimensions.total_dimensions; i++){
	if obj_player.layer = obj_dimensions.layers[i]{
		background_c = obj_dimensions.backgrounds[i]
	}
}

reset_destination = false

portal_depth = 120000

width = 1000
height = 1000
portal_1 = surface_create(width,height)
destination = surface_create(width,height)

far_end_1_1_x = 0 // The far end points of the first side of the portal
far_end_1_1_y = 0
far_end_1_2_x = 0
far_end_1_2_y = 0



