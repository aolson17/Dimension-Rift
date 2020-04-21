

if prev_dialogue_stage != dialogue_stage{ // If the dialogue was changed
	
}
prev_dialogue_stage = dialogue_stage

if !global.in_dialogue && global.dialogue_ready{
	if point_distance(x,y,obj_player.x,obj_player.y) < obj_dialogue.range{
		if dialogue_stage = 0{ // If this is the first time talking
			// Each time scr_dialogue or one of the other dialogue types are ran dialogue stage increases by one
			scr_dialogue(spr_portrait_speaker,global.font,"Hello! Welcome to the final exam room for your dimensional studies. I am professor Sloshula and I shall be your advisor. Advance this dialogue with the E button.")
			scr_dialogue(spr_portrait,global.font,"Wow I am finally here!")
			scr_dialogue(spr_portrait_speaker,global.font,"Yes, yes. Now you see that green orb?")
			scr_dialogue(spr_portrait,global.font,"Yeah right behind me.")
			scr_dialogue(spr_portrait_speaker,global.font,"You pass the test by reaching it. You must find your way through the testing area. It represents a labyrinth of freedom.")
			scr_dialogue(spr_portrait_speaker,global.font,"Move around with the A and D keys and jump with space.")
			scr_dialogue(spr_portrait_speaker,global.font,"Good luck, future wizard!")
		}
	}
}

var last_dialogue_stage = 2 // Set this to whatever you want the last dialgue to be before the animation pauses
if global.in_dialogue || dialogue_stage > last_dialogue_stage{ // This will pause the moving excalmation mark animation after all of the dialogue is scene
	image_speed = 0
}else{
	image_speed = 1
}

if dialogue_stage > last_dialogue_stage{
	visible = false
}