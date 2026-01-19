var hasMoved = false;

with (GolfBall)
{
	
	if (IsDragging)
	{
		IsDragging = false;
		Released = true;
		EndedDraggingPositionX = mouse_x;
		EndedDraggingPositionY = mouse_y;
	
		hasMoved = true;
	}
}

if (hasMoved)
{
	Strokes.StrokesCount++;
	hasMoved = false;
	audio_play_sound(SoundHit, 0, false);

}

if (global.CurrentIndicator != -1)
		layer_sequence_destroy(global.CurrentIndicator)