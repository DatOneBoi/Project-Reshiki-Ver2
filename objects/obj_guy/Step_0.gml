//Keybinds

rightKey = keyboard_check(ord("D")) || keyboard_check(vk_right);
leftKey = keyboard_check(ord("A")) || keyboard_check(vk_left); 
upKey = keyboard_check(ord("W")) || keyboard_check(vk_up);
downKey = keyboard_check(ord("S")) || keyboard_check(vk_down);
shiftKey = keyboard_check(vk_shift);
E_Key = keyboard_check(ord("E"))


//Speed Sprint
sprint = shiftKey * sprintspeed;
xspd = (rightKey - leftKey) * (move_speed + sprint);
yspd = (downKey - upKey) *  (move_speed + sprint);


//animation pauser
if instance_exists(obj_pauser)
{
xspd = 0;
yspd = 0;
}


//Sprite animations
if yspd == 0{
	if xspd > 0 {face = LEFT};
	if xspd < 0 {face = RIGHT};
} if xspd == 0{
	if yspd > 0 {face = DOWN};
	if yspd < 0 {face = UP};
}
sprite_index = sprite[face];

if xspd == 0 && yspd == 0
{
	image_index = 0;
}


//Collisions

if place_meeting(x + xspd, y, obj_squarewall) == true
	{
		xspd = 0;
	}

if place_meeting(x, y + yspd , obj_squarewall) == true
	{
		yspd = 0;
	}


//Walk + Sprint

x += xspd;
y += yspd;


//Depths

depth = -bbox_bottom;

//Pause Menu
pause_key = keyboard_check(vk_escape);

	
//Stop in Menu

if (keyboard_check(vk_escape)) {
  hold_timer += delta_time / 1000000; // Increment timer based on real time
  if (hold_timer >= 2) { // Example: Action triggered after 2 seconds
    if (!action_triggered) {
      // Perform the action here (e.g., play sound, change sprite, etc.)
      game_end();
      action_triggered = true;
    }
  }
} else {
  hold_timer = 0;
  action_triggered = false;
}

// Visual feedback for timer
draw_text(x, y - 20, string(hold_timer));

// Press F5 to save
if (keyboard_check_pressed(vk_f5)) {
    savegame_save("savegame.json");
}

// Press F9 to load
if (keyboard_check_pressed(vk_f9)) {
    savegame_load("savegame.json");
}
