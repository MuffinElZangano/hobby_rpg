// Set gp deadzone
var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++;)   {
   gamepad_set_axis_deadzone(i, 0.05);
}