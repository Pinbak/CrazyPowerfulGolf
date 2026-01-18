IsDragging = false;
StartedDraggingPositionX = 0;
StartedDraggingPositionY = 0;
EndedDraggingPositionX = 0;
EndedDraggingPositionY = 0;

MaxPower = 500;
PowerMultiplier = 5;

Released = false;

GetLaunchDistance = function(endPosX, endPosY)
{
	var pullDistance = EuclideanDistance(StartedDraggingPositionX,
		endPosX, StartedDraggingPositionY, endPosY)
		
	pullDistance = pullDistance * PowerMultiplier;
	
	pullDistance = min(MaxPower, pullDistance);
	
	var launchVelocity = pullDistance;
	
	return launchVelocity;
}

GetLaunchDirection = function(endPosX, endPosY)
{
	var pullDirection = point_direction(StartedDraggingPositionX,
		StartedDraggingPositionY,
		endPosX, endPosY)
	
	var launchDirection = pullDirection + 180;
	
	return launchDirection;
}