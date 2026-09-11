xspd = 0;
yspd = 0;
sprint = 0;

depth = -bbox_bottom

money = 0;

sprintspeed = 1;

move_speed = 2;

sprite[RIGHT] = spr_player_right;
sprite[UP] = spr_player_up;
sprite[LEFT] = spr_player_left;
sprite[DOWN] = spr_player_downv2;

face = DOWN;

hold_timer = 0;
action_triggered = false;

/// obj_player Create event
if (variable_global_exists("load_pending") && global.load_pending) {
    x = global.load_x;
    y = global.load_y;
    if (variable_global_exists("load_face")) {
        face = global.load_face;
        global.load_face = undefined;
    }
    global.load_pending = false;
}
