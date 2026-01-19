draw_set_font(NewPowerUpFont);
draw_set_alpha(Alpha);

draw_set_color(c_black);
draw_text(x + 2, y + 2, LevelName);
draw_set_color(c_white);

draw_text(x, y, LevelName);

draw_set_alpha(1);

draw_set_font(NewPowerUpSubtitleFont);
draw_set_alpha(Alpha);
draw_set_color(c_black);
draw_text(x + 2, y + 52, Subtitle);
draw_set_color(c_white);

draw_text(x, y + 50, Subtitle);

draw_set_alpha(1);