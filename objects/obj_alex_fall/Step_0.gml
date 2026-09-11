timer += delta_time/1000000;

if (image_xscale >= 0 && image_yscale >=0)
{

	image_xscale -= 0.07;
	image_yscale -= 0.07;
	
}

if (image_xscale <= 0 && image_yscale <=0)
{
	image_xscale = 0;
	image_yscale = 0;
}

if (a = false)
{
	audio_play_sound(snd_fall, 1, 0)
	a = true;
}

if (timer >= 4.2){

b = true;

}

if (b= true && timer <= 4.22)
{
	audio_play_sound(snd_fall_impact, 1, 0)
	b = false;
}

if (timer >= 5)
{
	obj_blackwall.image_alpha += 0.02;
}

if (timer >= 7)
{
	obj_TBC.image_alpha += 0.02;
}

if (timer >= 9 && c = false) 
{
	audio_play_sound(bgm_credits,1,0);
	c = true;
}