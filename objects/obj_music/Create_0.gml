
audio_channel_num(200);

if instance_number(object_index)>1{
	instance_destroy()
}else{

	global.master_volume = 1

	global.music_volume = .5
	global.sound_volume = 1


	music_to_play = msc_clippity_clop

	music_playing_id=audio_play_sound(music_to_play,0,true)
	audio_sound_gain(music_playing_id, 0, 0)
	audio_sound_gain(music_playing_id, global.master_volume*global.music_volume, 2000)

}


//normal_volume = -1 // Don't change this (Is set by mute command)