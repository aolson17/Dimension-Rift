

if prev_dialogue_stage != dialogue_stage{ // If the dialogue was changed
	
}
prev_dialogue_stage = dialogue_stage

if !global.in_dialogue && global.dialogue_ready{
	if point_distance(x,y,obj_player.x,obj_player.y) < obj_dialogue.range{
		if dialogue_stage = 0{ // If this is the first time talking
			// Each time scr_dialogue or one of the other dialogue types are ran dialogue stage increases by one
			scr_dialogue(spr_portrait_speaker,global.font,"Hello there! Welcome to the world of POKEMON!")
			scr_dialogue(spr_portrait_speaker,global.font,"My name is OAK! People call me the POKEMON PROF! This world is inhabited by creatures called POKEMON!")
			scr_dialogue(spr_portrait_speaker,global.font,"For some people, POKEMON are pets. Others use them for fights. Myself...I study POKEMON as a profession.")
		}
	}
}

var last_dialogue_stage = 2 // Set this to whatever you want the last dialgue to be before the animation pauses
if global.in_dialogue || dialogue_stage > last_dialogue_stage{ // This will pause the moving excalmation mark animation after all of the dialogue is scene
	image_speed = 0
	visible = false
}else{
	image_speed = 1
}
