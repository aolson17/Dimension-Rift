








if obj_player.casting_sight{
	reset_dimension = true
	start_x = mouse_x
	start_y = mouse_y
}

if obj_player.mouse_l_released && obj_player.casting_sight{
	obj_player.casting = false
	obj_player.casting_sight = false
}

visible = obj_player.mouse_l && obj_player.casting_sight

x = mouse_x
y = mouse_y

if target_layer = obj_player.layer{
	target_layer = global.prev_player_layer
	for(var i = 0; i <= obj_dimensions.total_dimensions; i++){
		if target_layer = obj_dimensions.layers[i]{
			target_dimension = i
		}
	}
	reset_dimension = true
}



