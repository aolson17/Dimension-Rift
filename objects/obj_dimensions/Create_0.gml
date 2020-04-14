/// @description Dimension Info




global.prev_player_layer = obj_player.layer


current_dimension = 1 // Corresponds to the dimension layer numbers
target_dimension = 2

backgrounds[1] = make_color_rgb(229,229,229)
backgrounds[2] = make_color_rgb(179,255,255)

total_dimensions = 2
for(var i = 1; i <= total_dimensions; i++){
	layers[i] = layer_get_id("Dimension_"+string(i))
}



