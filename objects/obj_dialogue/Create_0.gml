/// @description Initialize Variables and List

// REMOVE THIS
dialogue_stage = 0

#region Values to customize

range = 40 // How many pixels away to still start dialogue
talk_key = ord("E")
scale = 1 // The scaling for the dialogue
text_scale = .45 // The scaling for the dialogue
box_x = view_wport[0]/2-(sprite_get_width(spr_dialogue_box)*scale)/2 // Top left position of box on screen
box_y = 170
portrait_x = box_x + 4 // Top left position of portrait on screen
portrait_y = box_y + 4
text_x = box_x + 45 // Top left position of text on screen
text_y = box_y + 5
choice_1_x = box_x + 150 // Top left position of choice 1 on screen
choice_1_y = box_y + 80
choice_2_x = choice_1_x + 240 // Top left position of choice 2 on screen
choice_2_y = choice_1_y
text_line_sep = 20 // Vertical pixels between each line of text
text_speed = 1 // How many frames between adding another character
text_width = 640 // How many pixels wide the text can be
choice_selector_offset_x = -70 // How many pixels away should the selector be from the choice
choice_selector_offset_y = -5 //

default_minimum_skip_time = 5 // How many frames until the player can normally skip text

#endregion

selected_choice = 0
global.dialogue_ready = true // Allow for pause between entire dialogues
text = "" // The text currently shown (managed automatically)
new_text = false
text_position = 0
skippable = false
total_text = -1
global.in_dialogue = false

enum info {
   name,
   portrait,
   text,
   id,
   font,
   scene,
   scene_time,
   question,
   choice_1,
   choice_2,
   choice_1_lines,
   choice_2_lines,
}

dialogue = ds_list_create()

draw_set_font(global.font)
