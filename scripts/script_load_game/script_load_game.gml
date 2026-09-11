function script_load_game(){
/// scr_load_game()
var file = "save.sav";

if (file_exists(file)) {
    var buffer = buffer_load(file);

    // Read data in the same order you wrote it
    var saved_room = buffer_read(buffer, buffer_u32);
    var px = buffer_read(buffer, buffer_f32);
    var py = buffer_read(buffer, buffer_f32);

    buffer_delete(buffer);

    // Validate room index before trying to goto
    if (is_real(saved_room) && saved_room >= 0) {
        // set globals so the player can be positioned after the room change
        global.load_x = px;
        global.load_y = py;
        global.load_pending = true;

        // go to that room index
        room_goto(saved_room);
        show_debug_message("Game loaded. Going to room index: " + string(saved_room));
    } else {
        show_debug_message("Saved room index invalid: " + string(saved_room));
    }
} else {
    show_debug_message("No save file found!");
}

}