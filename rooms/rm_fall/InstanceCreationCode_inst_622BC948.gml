t_scene_info = [
	
	[cutscene_play_sound, snd_creepyjingle, 1, 0],
	[cutscene_move_character,obj_trigger, 0, 60, true, 4],
	[cutscene_move_character,obj_speak_step, 0, 60, true, 4],
	[cutscene_instance_create, 800, 75, "Instances", obj_door],
	[cutscene_play_sound, snd_dooropen, 1, 0],
	[cutscene_move_character, obj_warp_block, -30 , 0, true, 1],
];