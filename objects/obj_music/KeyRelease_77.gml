///@description Mute Game


if global.master_volume != 0{
	normal_volume = global.master_volume
	global.master_volume = 0
}else{
	global.master_volume = normal_volume
}


audio_sound_gain(music_playing_id, global.master_volume*global.music_volume, 0)
