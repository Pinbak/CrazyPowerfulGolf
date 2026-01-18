if (Released)
{
	Released = false;
	
	var launchDirection = GetLaunchDirection(EndedDraggingPositionX,
		EndedDraggingPositionY);
	
	var launchVelocity = GetLaunchDistance(EndedDraggingPositionX,
		EndedDraggingPositionY);
	
	Speed = launchVelocity;
	CurrentDirection = launchDirection;
	
}

if (Speed > 0)
{
	Speed -= (delta_time / 10000) * Friction;
	
	var nextPositionX = lengthdir_y(Speed, CurrentDirection);
	var nextPositionY = lengthdir_y(Speed, CurrentDirection);

	var instanceCollided = instance_place(nextPositionX, nextPositionY, Wall);

	if(instance_exists(instanceCollided))
	{
		ProcessCollision(instanceCollided);
	}
	
	
	x += lengthdir_x(Speed, CurrentDirection);
	y += lengthdir_y(Speed, CurrentDirection);
}

