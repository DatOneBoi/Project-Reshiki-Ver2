/// @function start_white_flash(duration)
/// @param {real} duration - Duration of the flash in seconds
/// @description Starts a white flash fade out effect

// Find the intro object and start the flash
var intro_obj = instance_find(obj_intro, 0);
if (intro_obj != noone) {
    intro_obj.flash_active = true;
    intro_obj.flash_alpha = 0;
    intro_obj.flash_duration = argument0;
    intro_obj.flash_timer = 0;
}

