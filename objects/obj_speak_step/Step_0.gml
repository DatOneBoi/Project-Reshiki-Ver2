var _s = id;

// Persistent disable/cleanup registry (survives across rooms)
if !variable_global_exists("__speak_disabled") global.__speak_disabled = ds_map_create();

var _tid = variable_instance_exists(id, "text_id") ? string(text_id) : string(id);
var _room_key = string(room) + ":" + _tid;

// If this speak step was already used in this room, remove it immediately
if ds_map_exists(global.__speak_disabled, _room_key) {
    instance_destroy();
    exit;
}

//if position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left)
//	{
	
//		create_textbox(text_id);
		

//	}    
if !(instance_exists(obj_text_box))
if place_meeting(x,y, obj_guy) //so we can use our player object to collide with the text object itself
//&& keyboard_check_pressed(ord("E")) //you can use any button that you want to use, but in this case I want to use "E" button
	{
	
	with( instance_create_depth(0, 0, -9999, obj_text_box))
	{
	scr_game_text(_s.text_id);
	}
	
	

	// Mark this instance as used so it stays disabled/destroyed after room changes
	ds_map_set(global.__speak_disabled, _room_key, true);

	instance_destroy();
}