draw_set_font(NewPowerUpSubtitleFont);

draw_set_color(c_black);

draw_text(x + 2, y + 2, string_concat("Strokes: ", StrokesCount))

draw_set_color(c_white);

draw_text(x, y, string_concat("Strokes: ", StrokesCount));

