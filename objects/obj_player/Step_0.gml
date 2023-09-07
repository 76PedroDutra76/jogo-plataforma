#region movimentação
//teclas
var key_left = keyboard_check(ord("A"))
var key_right = keyboard_check(ord("D"))
var key_jump = keyboard_check_pressed(vk_space)

//direção
var move = key_right - key_left != 0;

//movimentação/colisão
if (move){
	move_dir = point_direction(0, 0, key_right - key_left, 0);
	move_spd = approach(move_spd, move_spd_max, acc);
}else{
	move_spd = approach(move_spd, 0, dcc);
}

hspd = lengthdir_x(move_spd, move_dir);

if(place_meeting(x+hspd, y, obj_collider)){
	while(!place_meeting(x+sign(hspd), y, obj_collider)){
		x = x + sign(hspd);
	}
	hspd = 0;
}
x += hspd;

if(place_meeting(x, y+vspd, obj_collider)){
	while(!place_meeting(x,y+sign(vspd), obj_collider)){
		y = y + sign(vspd);
	}
	vspd = 0;
}
y += vspd;

//gravidade
vspd += grv;
vspd = clamp(vspd, vspd_min, vspd_max)

//pulo
var ground = place_meeting(x, y+1, obj_collider);

if(ground){
	coyote_time = coyote_time_max;
}else{
	coyote_time--;
}
if(key_jump and coyote_time > 0){
	coyote_time = 0;
	vspd = 0;
	vspd -= jump_heigth;
}

//sprites
if (!place_meeting(x, y+1, obj_collider)){
	sprite_index = spr_player_jump;
}else{

if hspd = 0{
	if place_meeting(x, y+1, obj_collider){
		sprite_index = spr_player_idle;
	}
}

if hspd != 0{
	if place_meeting(x, y+1, obj_collider){
		sprite_index = spr_player_run;
	}
	image_xscale = sign(hspd);
}
}
#endregion
