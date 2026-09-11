var _s = id;

//if position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left)
//	{
	
//		create_textbox(text_id);
		

//	}    
if !(instance_exists(obj_text_box))
if place_meeting(x,y, obj_guy) //so we can use our player object to collide with the text object itself
&& keyboard_check_pressed(ord("E")) //you can use any button that you want to use, but in this case I want to use "E" button
	{
	
	with( instance_create_depth(0, 0, -9999, obj_text_box))
	{
	scr_game_text(_s.text_id);
	}
	
	
}