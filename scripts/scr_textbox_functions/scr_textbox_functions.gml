
function scr_set_defaults_for_text(){

	line_break_pos[0, page_number] = 999;	
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	txtb_spr[page_number] = spr_menu;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
	
	snd[page_number] = snd_TXT1;
}

/// @param text
/// @param [character]
function scr_text(_text){

scr_set_defaults_for_text()

text[page_number] = _text;


if argument_count > 1 {
	switch (argument[1])
	{
	
		case "Player":
			speaker_sprite[page_number] = spr_player_spk;
			txtb_spr[page_number] = spr_menu_alex;
			snd[page_number] = snd_player_talk;
			break;
			
		case "GladPlayer":
			speaker_sprite[page_number] = spr_player_spk_glad;
			txtb_spr[page_number] = spr_menu_alex;
			snd[page_number] = snd_player_talk;
			break;
			
		case "AnnoyedPlayer":
			speaker_sprite[page_number] = spr_player_spk_annoyed;
			txtb_spr[page_number] = spr_menu_alex;
			snd[page_number] = snd_player_talk_annoyed;
			//speaker_side[page_number] = -1;
			break;
		
		case "ConfusedPlayer":
			speaker_sprite[page_number] = spr_player_spk_confused;
			txtb_spr[page_number] = spr_menu_alex;
			snd[page_number] = snd_player_talk;
			break;
			
		case "ScaredPlayer":
			speaker_sprite[page_number] = spr_player_spk_scared1;
			txtb_spr[page_number] = spr_menu_alex;
			snd[page_number] = snd_player_talk;
			break;
		
		case "Witch":
			speaker_sprite[page_number] = spr_witch_spk;
			txtb_spr[page_number] = spr_menu;
			snd[page_number] = snd_witch_talk;
			break;
	
	}
}

if argument_count > 2 {
	speaker_side[page_number] = argument[2];
}


page_number++;


}



// @param option
// @param link_id
function scr_option(_option, _link_id) {
	
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
	
}

///@param text_id
function create_textbox(_text_id){
	
	with(instance_create_depth(0,0, -999, obj_text_box) )
		{
			scr_game_text(_text_id);
		}
	
}