/// @description Dimension Info




global.prev_player_layer = obj_player.layer


current_dimension = 1 // Corresponds to the dimension layer numbers
target_dimension = 2

backgrounds[1] = make_color_rgb(229,229,229)
backgrounds[2] = make_color_rgb(179,255,255)
backgrounds[3] = make_color_rgb(179,255,179)

blocks[1] = make_color_rgb(0,191,243)
blocks[2] = make_color_rgb(120,60,0)
blocks[3] = make_color_rgb(0,82,33)

total_dimensions = 3
for(var i = 1; i <= total_dimensions; i++){
	layers[i] = layer_get_id("Dimension_"+string(i))
}



