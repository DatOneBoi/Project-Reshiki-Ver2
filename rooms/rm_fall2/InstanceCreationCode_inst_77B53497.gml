t_scene_info = [

	[cutscene_instance_create,144,120,"Instances", obj_floorhole],
	[cutscene_play_sound, snd_impact, 1, 0],
	[cutscene_wait,0.2],
	[cutscene_instance_create,137, 75,"Instances_2",obj_alert],
	[cutscene_play_sound, snd_alert,1,0],
	[cutscene_wait,0.7],
	[cutscene_instance_destroy,obj_guy],
	[cutscene_goto_room, rm_tobecontinued],
	

];