

current_dimension = 1
switch(layer_get_name(layer)){
	case "Dimension_1": current_dimension = 1
		break
	case "Dimension_2": current_dimension = 2
		break
	case "Dimension_3": current_dimension = 3
		break
}

col = obj_dimensions.blocks[current_dimension]


