




draw_set_font(global.font_small)

var gui_x = x-width/2
var gui_y = y-height/2

draw_set_color(c_black)

if obj_player.dimensions_unlocked >= 2{
	draw_text(gui_x+10,gui_y+10,"Dimension 1")
	draw_text(gui_x+10,gui_y+21,"Dimension 2")
}

var target_text_x = gui_x+85
if obj_player.dimensions_unlocked = 3{
	draw_text(gui_x+10,gui_y+32,"Dimension 3")
	
	switch(obj_dimensions.target_dimension){
		case 1:	draw_text(target_text_x,gui_y+10,"- Target")
			break
		case 2:	draw_text(target_text_x,gui_y+21,"- Target")
			break
		case 3:	draw_text(target_text_x,gui_y+32,"- Target")
			break
	}
	switch(obj_dimensions.current_dimension){
		case 1:	draw_text(target_text_x,gui_y+10,"- Current")
			break
		case 2:	draw_text(target_text_x,gui_y+21,"- Current")
			break
		case 3:	draw_text(target_text_x,gui_y+32,"- Current")
			break
	}
}

/*
var prev_dimension = 1
switch(layer_get_name(global.prev_player_layer)){
	case "Dimension_2": prev_dimension = 2
		break
	case "Dimension_3": prev_dimension = 3
		break
}

switch(prev_dimension){
	case 1:	draw_text(target_text_x+65,gui_y+10,"- Previous")
		break
	case 2:	draw_text(target_text_x+65,gui_y+30,"- Previous")
		break
	case 3:	draw_text(target_text_x+65,gui_y+50,"- Previous")
		break
}


