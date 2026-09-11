var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);

var _p0 = 1;
var _p1 = 0.99;
var _p2 = 0.98;
var _p3 = 0.7;
var _p4 = 0.5;
var _p5 = 0.3;


draw_sprite_tiled(spr_bg_test_parallax, 0, _camx* _p0, _camy* _p0);

draw_sprite_tiled(spr_bg_test_parallax, 2, _camx* _p2, _camy* _p2);

draw_sprite_tiled(spr_bg_test_parallax, 3, _camx* _p3, _camy* _p3);

draw_sprite_tiled(spr_bg_test_parallax, 4, _camx* _p4, _camy* _p4);

draw_sprite_tiled(spr_bg_test_parallax, 5, _camx* _p5, _camy* _p5);

draw_sprite_tiled(spr_bg_test_parallax, 1, _camx* _p1, _camy* _p1);