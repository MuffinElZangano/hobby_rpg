_up = ord("W");
_down = ord("S");
_left = ord("A");
_right = ord("D");
_run = vk_shift;

gp_up = gp_padu;
gp_down = gp_padd;
gp_left = gp_padl;
gp_right = gp_padr;
gp_run = gp_face3;

inputMagnitude = 0;
inputDirection = 0;

w_spd = 3;
r_spd = 6;
moveX = 0;
moveY = 0;
image_speed = 0;

player_state = PlayerState.Walk;

enum PlayerState {
	Walk,
	Run
}

function input_check() {
	// Check For input
	inputU = keyboard_check(_up) or keyboard_check(vk_up) or gamepad_button_check(global.current_gp, gp_up);
	inputL = keyboard_check(_left) or keyboard_check(vk_left) or gamepad_button_check(global.current_gp, gp_left);
	inputR = keyboard_check(_right) or keyboard_check(vk_right) or gamepad_button_check(global.current_gp, gp_right);
	inputD = keyboard_check(_down) or keyboard_check(vk_down) or gamepad_button_check(global.current_gp, gp_down);
	inputHA = gamepad_axis_value(global.current_gp, gp_axislh);
	inputVA = gamepad_axis_value(global.current_gp, gp_axislv);
	inputRun = keyboard_check(_run) or gamepad_button_check(global.current_gp, gp_run);
}

function state_change() {
	if (inputRun) {
		player_state = PlayerState.Run;
	} else {
		player_state = PlayerState.Walk;
	}
}

function colision_check() {
	// Colision Detection X Axis
	if(place_meeting(x+moveX,y,obj_solid)){
		repeat(abs(moveX)){
			if(!place_meeting(x+sign(moveX),y,obj_solid)){
				x += sign(moveX)} else{break;}
		}
		moveX = 0;
	}
	// Colision Detection Y Axis
	if(place_meeting(x,y+moveY,obj_solid)){
		repeat(abs(moveY)){
			if(!place_meeting(x,y+sign(moveY),obj_solid)){
				y += sign(moveY)} else{break;}
		}
		moveY = 0;
	}
}

function stateWalk() {
	// Calculate Movement OLD
	/*
	inputMagnitude = (inputD - inputU != 0) || (inputR - inputL != 0);
	inputDirection = point_direction(0,0,inputR-inputL,inputD-inputU);
	moveX = lengthdir_x(inputMagnitude * spd, inputDirection);
	moveY = lengthdir_y(inputMagnitude * spd, inputDirection);
	*/

	//Calculate Movement NEW with joystick and dpad
	var axis_h = (inputR - inputL) + inputHA;
	var axis_v = (inputD - inputU) + inputVA;
	moveX = axis_h * w_spd;
	moveY = axis_v * w_spd;
}

function stateRun() {
	// Calculate Movement OLD
	/*
	inputMagnitude = (inputD - inputU != 0) || (inputR - inputL != 0);
	inputDirection = point_direction(0,0,inputR-inputL,inputD-inputU);
	moveX = lengthdir_x(inputMagnitude * spd, inputDirection);
	moveY = lengthdir_y(inputMagnitude * spd, inputDirection);
	*/

	//Calculate Movement NEW with joystick and dpad
	var axis_h = (inputR - inputL) + inputHA;
	var axis_v = (inputD - inputU) + inputVA;
	moveX = axis_h * r_spd;
	moveY = axis_v * r_spd;
}