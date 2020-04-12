

max_size = 90

if obj_player.layer = layer_get_id("Zones_1"){
	target_layer = "Zones_2"
}else{
	target_layer = "Zones_1"
}

background_1 = make_color_rgb(229,229,229)
background_2 = make_color_rgb(179,255,255)


side = 0
prev_side = side

rift_target = obj_player

rift_depth = 90000

width = 2000
height = 2000
rift = surface_create(width,height)
rift_part = surface_create(width,height)
dimension = surface_create(width,height)
reset_dimension = true

end_x = -999
end_y = -999

formed = false

far_end_1_x = 0
far_end_1_y = 0
far_end_2_x = 0
far_end_2_y = 0

