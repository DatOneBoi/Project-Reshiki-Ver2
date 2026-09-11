if place_meeting(x,y,obj_guy){
	if file_exists("Save.sav") {
		file_delete("Save.sav");
	}
	ini_open("Save.sav");
	var SavedRoom = room;
	ini_write_real("Save1", "room", room_get_name(room));
	ini_write_real("Save1", "x", obj_guy.x);
	ini_write_real("Save1", "y", obj_guy.y);
}

