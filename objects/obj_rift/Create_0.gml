

max_size = 150

target_dimension = obj_dimensions.target_dimension
target_layer = obj_dimensions.layers[target_dimension]
if target_layer = obj_player.layer{
	target_layer = global.prev_player_layer
	for(var i = 0; i <= obj_dimensions.total_dimensions; i++){
		if target_layer = obj_dimensions.layers[i]{
			target_dimension = i
		}
	}
}

life_range = 90
life_frames = 120

shrink_amount_start = .2
shrink_amount = shrink_amount_start
shrink_amount_increase = .08
shrink_timer = 0
shrink_time = 8

side = 0
prev_side = side

rift_target = obj_player

rift_depth = 120000

width = 1000
height = 1000
rift = surface_create(width,height)
dimension = surface_create(width,height)
reset_dimension = true

end_x = mouse_x
end_y = mouse_y

formed = false

far_end_1_x = mouse_x
far_end_1_y = mouse_y
far_end_2_x = mouse_x
far_end_2_y = mouse_y

die = false // If this should be removed no matter what