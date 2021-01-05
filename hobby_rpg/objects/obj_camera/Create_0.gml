//draw_set_font(PixelFont2);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
view_width=1920/4; view_height=1080/4;
window_scale = 1;
window_set_size(view_width*window_scale,view_height*window_scale);
alarm[0]=1;
display_set_gui_size(view_width,view_height);
surface_resize(application_surface,view_width*window_scale,view_height*window_scale);