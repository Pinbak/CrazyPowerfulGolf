draw_sprite_ext(SprGolfBall, 0, x, y, 1, 1, 0, c_white, 1);

if (IsDragging)
{
	var launchDirection = GetLaunchDirection(mouse_x, mouse_y);
	var launchDistance	= GetLaunchDistance(mouse_x, mouse_y);
	
	//draw_text(x, y, launchDistance);
	
	var spacing = 15;
	
	var trailPoints = launchDistance / 100;
	
	for (var i = 0; i < trailPoints; i++)
	{
		
		var curX = x + lengthdir_x(sprite_width / 2 + spacing / 2, launchDirection);
		var curY = y + lengthdir_y(sprite_height / 2 + spacing / 2, launchDirection);
		
		curX += lengthdir_x(spacing * i, launchDirection);
		curY += lengthdir_y(spacing * i, launchDirection);
		
		var scale = i * 0.1 + 1;
		
		draw_sprite_ext(SprDotTrail, 0, curX, curY, scale, scale, 0, c_white, 1);
	}
}

//draw_text(x, y, phy_speed);