IsDragging = false;
StartedDraggingPositionX = 0;
StartedDraggingPositionY = 0;
EndedDraggingPositionX = 0;
EndedDraggingPositionY = 0;

MaxPower = 10;
PowerMultiplier = .1;

Speed = 0;
Released = false;
CurrentDirection = 0;

BaseFriction = 0.1;
Friction = BaseFriction;


ProcessCollision = function(collidedWith)
{
	CurrentDirection = point_direction(collidedWith.x,
		collidedWith.y, x, y);
}

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