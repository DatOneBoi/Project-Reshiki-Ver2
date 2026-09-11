camera_set_view_pos(view_camera[0], xpos, 0);
//xpos = max(xpos-0.3,0);

if (!fadeout) a = max(a-0.01, 0.0); else a = min(a+0.01, 1); //fadeout timer
if (!fadeoutw) w = max(w-0.01, 0.0); else w = min(w+0.01, 1);

l += 0.1;

print = string_copy(str, 1, l);

if (l  > string_length(str)+ 240) && (next < array_length(strings)-1)
{
//	l = 0;
//	next++;
	if (next == array_length(strings)-1) holdspace++;
}



str = strings[next];


if (keyboard_check_direct(vk_space))
{
	holdspace++;
}

if (holdspace > 80) fadeout = 1;

if (a == 1) && (fadeout == 1) room_goto_next();


timer += delta_time / 1000000;

