

if prev_dialogue_stage != dialogue_stage{ // If the dialogue was changed
	
}
prev_dialogue_stage = dialogue_stage

if !global.in_dialogue && global.dialogue_ready{
	if point_distance(x,y,obj_player.x,obj_player.y) < obj_dialogue.range{
		if dialogue_stage = 0{ // If this is the first time talking
			// Each time scr_dialogue or one of the other dialogue types are ran dialogue stage increases by one
			scr_dialogue(spr_portrait,global.font,"Another page!")
			scr_dialogue(spr_portrait_speaker,global.font,"And with it, your knowledge expands.")
			scr_dialogue(spr_portrait_speaker,global.font,"Once you pick it up, you will have the ability to change your target dimension.")
			scr_dialogue(spr_portrait_speaker,global.font,"This is done with either the scroll wheel or the 1 2 and 3 keys.")
			scr_dialogue(spr_portrait,global.font,"Perfect, I'll be a full wizard in no time.")
			scr_dialogue(spr_portrait_speaker,global.font,"Now don't underestimate this exam.")
		}
	}
}

var last_dialogue_stage = 4 // Set this to whatever you want the last dialgue to be before the animation pauses
if global.in_dialogue || dialogue_stage > last_dialogue_stage{ // This will pause the moving excalmation mark animation after all of the dialogue is scene
	image_speed = 0
}else{
	image_speed = 1
}

if dialogue_stage > last_dialogue_stage{
	visible = false
}