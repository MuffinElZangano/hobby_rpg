/// @description Insert description here
// You can write your code in this editor
inputU = keyboard_check(_up) || keyboard_check(vk_up);
inputL = keyboard_check(_left) || keyboard_check(vk_left);
inputR = keyboard_check(_right) || keyboard_check(vk_right);
inputD = keyboard_check(_down) || keyboard_check(vk_down);
inputMagnitude = (inputD - inputU != 0) || (inputR - inputL != 0);
inputDirection = point_direction(0,0,inputR-inputL,inputD-inputU);

moveX = lengthdir_x(inputMagnitude * spd, inputDirection);
moveY = lengthdir_y(inputMagnitude * spd, inputDirection);

if(place_meeting(x+moveX,y,obj_solid)){
	repeat(abs(moveX)){
		if(!place_meeting(x+sign(moveX),y,obj_solid)){
			x += sign(moveX)} else{break;}
		}
		moveX = 0;
	}
	
if(place_meeting(x,y+moveY,obj_solid)){
	repeat(abs(moveY)){
		if(!place_meeting(x,y+sign(moveY),obj_solid)){
			x += sign(moveY)} else{break;}
		}
		moveY = 0;
	}

x+= moveX;
y+= moveY;