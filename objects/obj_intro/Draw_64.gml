

if (timer < 20){
	draw_sprite_ext(spr_cs1, 0, 0 ,csy, 3, 3, 0 ,c_white, 1)
	if (csy != -1000)
	{ csy -= 1 }
	else
	{ csy = -1000}
	
	if (timer > 18)
		{
		draw_sprite_ext(spr_pixel, 0, 0, 0, 900, 700, 0, c_black, b1);
			if (b1 < 1)
			{
				b1 += 0.01
			}
		}
	csx = -970;
	
	if (timer > 19.9) { l = 0; }
}
else if(timer < 37.60)
{	
	next = 1;
	draw_sprite_ext(spr_cs2, 0, csx , 0, 3, 3, 0 ,c_white, 1)
	if (csx != 100)
	{ csx += 1 }
	else
	{ csx = 1000}
	
	draw_sprite_ext(spr_pixel, 0, 0, 0, 900, 700, 0, c_white, w1);
	if (w1 > 0)
	{
		w1 -= 0.1
	}
	
	if (image_index != 0)
	{
	image_index = 0;
	}
	
	if (timer > 37.50) { l = 0; }
}
else if(timer <46)
{	
	next = 2;
	image_speed = 0.03;
	

	draw_sprite_ext(spr_cs3, image_index, 0 , 0, 3, 3, 0 ,c_white, 1);
	
	
	draw_sprite_ext(spr_pixel, 0, 0, 0, 900, 700, 0, c_white, w2);
	if (w2 > 0)
	{
		w2 -= 0.01
	}
	w1 =1;
	csy = -30;
	if (timer > 45.9) { l = 0; }
}
else if (timer <55)
{
	next =3;
	
	if (csy != 100)
	{ csy -= 0.2 }
	else
	{ csy = 100}
	draw_sprite_ext(spr_cs4, 0, 0 , csy, 3, 3, 0 ,c_white, 1);
	
	if (csy1 != -300)
	{ csy1 += 0.3 }
	else
	{ csy1 = -300}
	draw_sprite_ext(spr_cs_fall, 0, 280 , csy1, 3, 3, 0 ,c_white, 1);
	
	if (csy2 != -1000)
	{ csy2 -= 20 }
	else
	{ csy2 = 3000}
	draw_sprite_ext(spr_cs_debris, 0, 0 , csy2, 3, 3, 0 ,c_white, 1);
	

	draw_sprite_ext(spr_pixel, 0, 0, 0, 900, 700, 0, c_white, w1);
	if (w1 > 0)
	{
		w1 -= 0.01
	}
	w2 =1;
	if (timer > 54.9) { l = 0; }
}
else if (timer <63.5)
{
	next = 4;
	
	if (csy3 != -1200)
	{ csy3 -= 2.1 }
	else
	{ csy3 = -1200}
	draw_sprite_ext(spr_cs5, 0, 0 , csy3, 3, 3, 0 ,c_white, 1);
	
	image_speed = 0.15
	draw_sprite_ext(spr_cs_fall2, image_index, 190 , 100, 4, 4, 0 ,c_white, 1);
	
	if (csy2 != -1000)
	{ csy2 -= 20 }
	else
	{ csy2 = 3000}
	draw_sprite_ext(spr_cs_debris, 0, 0 , csy2, 3, 3, 0 ,c_white, 1);
	
	draw_sprite_ext(spr_pixel, 0, 0, 0, 900, 700, 0, c_white, w2);
	if (w2 > 0)
	{
		w2 -= 0.01
	}
	w1 =1;
	if (timer > 63.4) { l = 0; }
}
else if (timer <72.2)
{
	
	next = 5;
	
	if (sxy != 20)
	{ sxy += 0.03 }
	else
	{ sxy = 20}
	if (sr != 360)
	{ sr += 1 }
	else
	{ sr = 0}
	draw_sprite_ext(spr_cs6, 0, 430, 250, sxy, sxy, sr ,c_white, 1);
	
	if (sr1 != 0)
	{ sr1 -= 0.02 }
	else
	{ sr1 = 0}
	draw_sprite_ext(spr_cs_fall3, 0, 430, 250, sr1, sr1, 0 ,c_white, 1);
	
	draw_sprite_ext(spr_pixel, 0, 0, 0, 900, 700, 0, c_white, w1);
	if (w1 > 0)
	{
		w1 -= 0.01
	}
	csy1 = 0;
	csy = 0;
	w2 =1;
	if (timer > 72.1) { l = 0; }
}
else if (timer <90)
{
	
	next = 6;
	
	if (csy !=-150)
	{ csy -= 0.1 }
	else
	{ csy = -150}
	draw_sprite_ext(spr_cs7, 0, 175, csy, 0.5, 0.5 , 0 ,c_white, 1);
	
	
	draw_sprite_ext(spr_pixel, 0, 0, 0, 900, 700, 0, c_white, w2);
	if (w2 > 0)
	{
		w2 -= 0.01
	}
	w1 = 1;
	csy1 =0;
	if (timer > 89.9) { l = 0; }
}
else if (timer <109)
{
	next = 7;
	if (csy1 !=-350)
	{ csy1 -= 0.2 }
	else
	{ csy1 = -350}
	draw_sprite_ext(spr_cs8, 0, csy1, 0, 3, 3 , 0 ,c_white, 1);
	
	draw_sprite_ext(spr_pixel, 0, 0, 0, 900, 700, 0, c_white, w1);
	if (w1 > 0)
	{
		w1 -= 0.01
	}

}
else
{
	fadeout = 1;
}


//camera lines
draw_set_color(c_black);
draw_rectangle(0,900,900, 500, 0);
draw_rectangle(0,0 ,900, 20, 0);
draw_rectangle(0,0 ,95, 900, 0);
draw_rectangle(870,0 ,767, 900, 0);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(global.font_main);



//draw_text(430, 250, string(w1))
//draw_text(430, 230, string(csy))
//draw_text(490, 230, string(csx))
//draw_text(430, 210, string(timer)) //timer
draw_text_ext_transformed(430, 530, print, 5, 300, 3, 3, 0);


if (holdspace > 0)
{
	draw_text_ext_transformed(430, 620, "Hold space to skip.", 5, 300, 2, 2, 0);
	draw_set_alpha(1);
}

draw_sprite_ext(spr_pixel, 0, 0, 0, 900, 700, 0, c_black, a); //black fadeout
draw_sprite_ext(spr_pixel, 0, 0, 0, 900, 700, 0, c_white, w); //white fadeout

