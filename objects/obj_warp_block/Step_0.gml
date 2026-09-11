if place_meeting(x, y, obj_guy) && !instance_exists(obj_warp)
	{
		
	audio_play_sound(snd_transition_sound,1,false);	
		
	var inst = instance_create_depth(0,0,-9999,obj_warp)
	inst.target_x = target_x;
	inst.target_y = target_y;
	inst.target_rm = target_rm;
	inst.target_face = target_face;
	}