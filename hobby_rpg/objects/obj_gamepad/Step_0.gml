// Get the connected gamepads every frame
var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++;)   {
   if (gamepad_is_connected(i)) {
	global.gamepads[i][0] = true;
	global.gamepads[i][1] = gamepad_get_description(i);
   } else {
	global.gamepads[i][0] = false;
	global.gamepads[i][1] = "Noone";
   }
}

//Set debug UI flag
if keyboard_check_pressed(vk_f7) gamepad_debug = !gamepad_debug;

//Change current gamepad
if (keyboard_check_pressed(vk_f1)) {
	global.current_gp--;
}
if (keyboard_check_pressed(vk_f2)) {
	global.current_gp++;
}
global.current_gp = clamp(global.current_gp, 0, gp_num - 1);