IsDragging = false;
StartedDraggingPositionX = 0;
StartedDraggingPositionY = 0;
EndedDraggingPositionX = 0;
EndedDraggingPositionY = 0;

MaxPower = 500;
PowerMultiplier = 5;

Released = false;

DrawnScale = 1;

IsOverHole = false;

IsDead = false;

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

SetupPhysics = function()
{
	physics_fixture_set_circle_shape(Fixture, 16);
	physics_fixture_set_restitution(Fixture, 0.1);
	physics_fixture_set_collision_group(Fixture, 1);
	physics_fixture_set_density(Fixture, 0.5);
	physics_fixture_set_linear_damping(Fixture, 2);
	physics_fixture_set_angular_damping(Fixture, 0.1);
	physics_fixture_set_friction(Fixture, 0.2);
	physics_fixture_bind(Fixture, self);
}

Fixture = physics_fixture_create();
SetupPhysics();
