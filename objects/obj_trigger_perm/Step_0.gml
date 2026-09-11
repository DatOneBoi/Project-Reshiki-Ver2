if(!instance_exists(obj_cutscene)){
	if(place_meeting(x,y,obj_guy)){
		create_cutscene(t_scene_info);
	}
}