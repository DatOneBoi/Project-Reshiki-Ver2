function script_save_game(){

/// scr_save_game()
var file = "save.sav";
var buffer = buffer_create(256, buffer_grow, 1);

// Save room index and player position
buffer_write(buffer, buffer_u32, room);     // save numeric room index
buffer_write(buffer, buffer_f32, obj_guy.x);
buffer_write(buffer, buffer_f32, obj_guy.y);

// (optional) save other values here

buffer_save(buffer, file);
buffer_delete(buffer);
show_debug_message("Game saved (room index " + string(room) + ").");

}