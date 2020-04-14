

surface_set_target(argument0)
draw_clear_alpha(c_black,0)

var layer_elements = layer_get_all_elements(obj_player.layer)
for (var i = 0; i < array_length_1d(layer_elements); i++){
	if (layer_get_element_type(layer_elements[i]) == layerelementtype_instance){
		var ele = layer_elements[i]
		var inst = layer_instance_get_instance(ele)
		draw_sprite_ext(inst.sprite_index,inst.image_index,inst.x-round(x)+width/2,inst.y-round(y)+height/2,inst.image_xscale,inst.image_yscale,inst.image_angle,c_white,inst.image_alpha)
	}
}

surface_reset_target()


