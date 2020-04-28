






if mouse_wheel_up(){
	target_dimension++
}
if mouse_wheel_down(){
	target_dimension--
}

if keyboard_check_pressed(ord("1")){
	if obj_player.dimensions_unlocked > 1 && current_dimension != 2{
		target_dimension = 1
	}
}
if keyboard_check_pressed(ord("2")){
	if obj_player.dimensions_unlocked > 1 && current_dimension != 2{
		target_dimension = 2
	}
}
if keyboard_check_pressed(ord("3")){
	if obj_player.dimensions_unlocked > 2 && current_dimension != 3{
		target_dimension = 3
	}
}

var prev_dimension = 1
switch(layer_get_name(global.prev_player_layer)){
	case "Dimension_2": prev_dimension = 2
		break
	case "Dimension_3": prev_dimension = 3
		break
}

if target_dimension = current_dimension{
	
	target_dimension = prev_dimension
	
}





