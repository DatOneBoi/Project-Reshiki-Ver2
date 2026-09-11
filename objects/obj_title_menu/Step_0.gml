//get inputs

upKey = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
downKey = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
acceptKey = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_enter);


//store number of options
op_length = array_length(option[menu_level]);

//move through menu
pos += downKey - upKey;
pos = (pos + op_length) % op_length;
//if pos >= op_length {pos = 0;};
//if pos < 0 {pos = op_length-1};

//Sound effect for menu
if (pos != last_selected) audio_play_sound(snd_TXT2, 1, false);
last_selected = pos;


if acceptKey {

//Sound effect for select
audio_play_sound(snd_select, 1, false);

var _sml = menu_level;
	
switch(menu_level){
	
	case 0:
		switch(pos){
		
		case 0: break;
		
		case 1: break;
		
		case 2: menu_level = 1;
				break;
		
		}
	break;
	
	case 1:
		switch(pos){
	
		//start game
		case 0: room_goto_next(); break;
		//settings
		case 1: menu_level =2; break;
		//quit game
		case 2: game_end(); break;
		}
	break;
	
	
	//settings menu
	case 2:
		switch(pos){
		//windows size
		case 0:
				
			break;
		
		//brightness
		case 1:
				
			break;
		
		//controls
		case 2:
			menu_level = 3;
			break;
		
		//back
		case 3:
			menu_level = 1;
			break;
		}
	break;	
	
	case 3:
		switch(pos){
			
		case 0: break;
		case 1: break;
		case 2: break;
		//back
		case 3:
			menu_level =1;
			break;
		}
	break;
	}
	
	//set position back
	if _sml != menu_level {pos = 0};
	
	//store number of options
	op_length = array_length(option[menu_level]);
}