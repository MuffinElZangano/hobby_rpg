/// @description Insert description here
// You can write your code in this editor
var coord = 16;
draw_sprite_ext(spr_lifebar,0,coord,coord,1,1,0,c_white,0.8);
draw_sprite_ext(spr_lifebar,0,coord,coord+sprite_get_height(spr_manabar)+1,1,1,0,c_white,0.8);

draw_sprite_part_ext(spr_lifebar,1,1,0,(vida/max_vida)*100,sprite_get_height(spr_lifebar),coord+1,coord,1,1,c_white,0.8);
draw_sprite_part_ext(spr_manabar,1,1,0,(mana/max_mana)*100,sprite_get_height(spr_manabar),coord+1,
					coord+sprite_get_height(spr_manabar)+1,1,1,c_white,0.8);