t_scene_info = [
	
	[cutscene_play_sound,snd_alert,1,0],
	[cutscene_face_direction,obj_witch, DOWN],
	[cutscene_move_character,obj_witch, 0, 65, true, 3],
	[cutscene_wait, 0.5],
	[cutscene_move_character,obj_witch, 30, -8, true, 3],
	[cutscene_drawBoxes,"noticed"],
	//[cutscene_wait,13],
	[cutscene_face_direction,obj_witch, UP],
	[cutscene_move_character,obj_witch,-10, -50, true, 2],
	[cutscene_wait,1],
	[cutscene_face_direction,obj_guy, UP],
	[cutscene_move_character,obj_guy,-10, -30, true, 2],
];