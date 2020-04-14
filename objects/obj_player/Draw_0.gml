

color_offset = c_white
if invincible{
	color_offset = c_red
}

draw_sprite_ext(sprite_index,image_index,(x),round(y),image_xscale,image_yscale,image_angle,color_offset,image_alpha)

#region Draw Book During Magic
if state = magic{
	if book_image_index != 0{
		book_image_index += book_image_speed
		if round(book_image_index) > sprite_get_number(spr_spellbook_open){
			book_image_index = 0
		}
	}else{
		if image_index < 4{ // Only turn pages when looking at the book
			if irandom(30) = 0{
				book_image_index = .1
			}
		}
	}
	draw_sprite_ext(spr_spellbook_open,book_image_index,x-7*image_xscale,y+5,image_xscale,image_yscale,0,c_white,1)
}else if state = magic_end{
	draw_sprite_ext(spr_spellbook_closed,0,x-7*image_xscale,y+5,image_xscale,image_yscale,0,c_white,1)
}
#endregion

/*if keyboard_check(ord("E")){
	var mask = mask_index
	mask_index = spr_player_drop_kick
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
	mask_index = mask
}