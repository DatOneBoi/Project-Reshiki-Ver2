	var _xx = (camera_get_view_x(view_camera[0])+screen_bord)
	var _yy = (camera_get_view_y(view_camera[0])+screen_bord)
	var _sep = sep;
	var _col = c_white;


for (var i=0; i < array_length(inv); i++)
	{
	
	
	//draw icon
	draw_sprite(inv[i].sprite, image_index, _xx , _yy + _sep*i);
	
	//get "selected" item
	if (selected_item == i) {_col = c_yellow; };
		draw_set_color(_col);
	//name
		draw_text_transformed( _xx + 20, _yy + _sep*i, inv[i].name , 0.8, 0.8, 0);
	//description
	if (selected_item ==i )
		{
			draw_text_ext_transformed(_xx + 10, _yy + _sep*array_length(inv), inv[i].description, 12, 80 , 0.8, 0.8, 0)
		}
	//reset color to white
		draw_set_color(c_white);
		
	
	}
	
if (global.money > 0)
		{
			draw_text_ext_transformed(_xx + 15, _yy + 200 , "Money x " + string(global.money), 12, 80 , 0.8, 0.8, 0)
		}
	
if (global.objectives = true)
		{
			draw_text_ext_transformed(_xx + 240, _yy + 0 ,string(global.objectivesdesc) , 12, 80 , 0.8, 0.8, 0)
		}