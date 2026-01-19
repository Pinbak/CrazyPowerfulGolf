if (phy_speed < 0.5 && !RoomManager.CurrentLevelWon && !IsDead)
{
	IsDragging = true;
	StartedDraggingPositionX = mouse_x;
	StartedDraggingPositionY = mouse_y;
	
	if (global.CurrentIndicator != -1)
		layer_sequence_destroy(global.CurrentIndicator)
	
	global.CurrentIndicator = layer_sequence_create("LocalGui", mouse_x, mouse_y, Indicator);
}
