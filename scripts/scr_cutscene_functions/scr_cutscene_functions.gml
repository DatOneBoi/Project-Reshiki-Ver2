///@description cutscene_wait
///@arg seconds

function cutscene_wait(){
	timer++;
	
	if (timer >= argument0 * room_speed)
	{
		timer = 0;
		cutscene_end_action();
	}

}

///@description cutscene_end_action

function cutscene_end_action(){
	
	scene++;
	if (scene > array_length(scene_info)-1)
	{
		instance_destroy();
		exit;
	}
	event_perform(ev_other, ev_user0);
	
}

///@description cutscene_play_sound
///@arg sound_id
///@arg priotity
///@arg loops

function cutscene_play_sound(){
	
	audio_play_sound(argument0, argument1, argument2);
	
	cutscene_end_action();
	
}

///@description cutscene_face_direction
///@arg obj
///@arg direction

function cutscene_face_direction(){
	
	with(argument0){
		face = argument1;
	}
	
	cutscene_end_action()
}

///@description cutscene_goto_room
///@arg room
function cutscene_goto_room(){
	
	room_goto(argument0)
	
	cutscene_end_action()
}

///@description cutscene_instance_create
///@arg x
///@arg y
///@arg layer_id
///@arg obj

function cutscene_instance_create(){
	
	var inst = instance_create_layer(argument0, argument1, argument2, argument3);
	
	cutscene_end_action();
	
	return inst;
	
}

///@description cutscene_instance_destroy
///@arg obj

function cutscene_instance_destroy(){
	
	with(argument0){
		instance_destroy()
	}

	cutscene_end_action()	
}

///@description cutscene_instance_destroy_nearest
///@arg x
///@arg y
///@arg obj

function cutscene_instance_destroy_nearest(){
	
	var inst = instance_nearest(argument0, argument1, argument2);
	
	cutscene_instance_destroy(inst);
	
}

///@description cutscene_change_xscale
///@arg obj
///@arg image_xscale*

function cutscene_change_xscale(){
	
	var arg, i = 0; repeat(argument_count){
		arg[i] = argument[i];
		i++
	}
	if(argument_count > 1){
		with(arg[0]){
		image_xscale = arg[1];
	}
}else{
	with(arg[0]){
		image_xscale = -image_xscale;
		}
	}
	
	cutscene_end_action()
}

///@description cutscene_change_variable
///@arg obj
///@arg var_name_as_string
///@arg value

function cutscene_change_variable(){
	
	with(argument0){
		variable_instance_set(id, argument1, argument2)
	}
	
	cutscene_end_action();
}


///@description cutscene_drawBoxes
///@arg text id

function cutscene_drawBoxes(){
if !(instance_exists(obj_text_box))
{
	with( instance_create_depth(0, 0, -9999, obj_text_box))
	{
		scr_game_text(argument0);
	}
	cutscene_end_action()
}
	
}

///@description cutscene_move_character
///@arg obj
///@arg x
///@arg y
///@arg relative or absolute
///@arg spd

function cutscene_move_character(){

	var obj = argument0, relative = argument3, spd = argument4;
	
	if (x_dest == -1){
		if(!relative){
			x_dest = argument1;
			y_dest = argument2;
		}else{
			x_dest = obj.x + argument1;
			y_dest = obj.y + argument2;
		}
	}
	
	var xx = x_dest;
	var yy = y_dest;
	
	with(obj){
		
		
		if (point_distance(x,y,xx,yy)>=spd){
			var dir = point_direction(x,y,xx,yy);
			var ldirx = lengthdir_x(spd, dir);
			var ldiry = lengthdir_y(spd, dir);
		
			x += ldirx;
			y += ldiry;
		}else{
			x = xx;
			y = yy;
			
			with(other){
				x_dest = -1;
				y_dest = -1;
				cutscene_end_action()
			}
		}
	}

}

///@description script_execute_alt
///@arg ind
///@arg [arg1,arg2,...]
 
function script_execute_alt(){
	
	var s = argument0;
var a = argument1;
var len = array_length(argument1);
 
switch(len){
    case 0 : script_execute(s); break;
    case 1 : script_execute(s, a[0]); break;
    case 2:  script_execute(s, a[0], a[1]); break;
    case 3:  script_execute(s, a[0], a[1], a[2]); break;
    case 4:  script_execute(s, a[0], a[1], a[2], a[3]); break;
    case 5:  script_execute(s, a[0], a[1], a[2], a[3], a[4]); break;
    case 6:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5]); break;
    case 7:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6]); break;
    case 8:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]); break;
    case 9:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]); break;
    case 10: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]); break;
    case 11: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]); break;
    case 12: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]); break;
    case 13: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]); break;
    case 14: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]); break;
    case 15: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]); break;
}

}

///@description create_cutscene
///@arg scene info

function create_cutscene(){

var inst = instance_create_layer(0,0,"Instances", obj_cutscene);
with(inst){
	scene_info = argument0;
	event_perform(ev_other, ev_user0);
}

}