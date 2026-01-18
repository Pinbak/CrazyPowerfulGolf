if (IsDragging)
{
	IsDragging = false;
	Released = true;
	EndedDraggingPositionX = mouse_x;
	EndedDraggingPositionY = mouse_y;
}

if (global.CurrentIndicator != -1)
		layer_sequence_destroy(global.CurrentIndicator)