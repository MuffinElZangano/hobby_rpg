//Draw Debug UI
if (!is_undefined(global.gamepads)) {
	draw_set_halign(fa_left);
	if (global.gamepads[global.current_gp][0]) {
		draw_text_color(10, 10, global.gamepads[global.current_gp][1], c_yellow, c_yellow, c_yellow, c_yellow, 1);
	} else {
		draw_text_color(10, 10, "No gamepad detected on slot " + string(global.current_gp), c_yellow, c_yellow, c_yellow, c_yellow, 1);
	}
}