if (Released)
{
	Released = false;
	
	var launchDirection = GetLaunchDirection(EndedDraggingPositionX,
		EndedDraggingPositionY);
	
	var launchVelocity = GetLaunchDistance(EndedDraggingPositionX,
		EndedDraggingPositionY);
	
	
	var xImpulse = lengthdir_x(launchVelocity, launchDirection);
	var yImpulse = lengthdir_y(launchVelocity, launchDirection);
	
	physics_apply_impulse(x, y, xImpulse, yImpulse);
	
}

if (place_meeting(x, y, Hole) && !RoomManager.CurrentLevelWon)
{
	IsOverHole = true;
	RoomManager.CurrentLevelWon = true;
	phy_speed_x = 0;
	phy_speed_y = 0;
	phy_position_x = Hole.x;
	phy_position_y = Hole.y;
}

var powerUp = instance_place(x, y, Powerup);

if (instance_exists(powerUp))
{
	
	RoomManager.AddPowerup(powerUp.PowerupType);
	
	switch(powerUp.PowerupType)
	{
		case POWERUP.DUPLICATE:
			var justCreated = instance_create_layer(x, y, "Ball", GolfBall);
			justCreated.phy_linear_damping = 2;
			break;
		case POWERUP.SPEED_UP:
			phy_linear_damping = 0.1;
			break;
	}
	
	Colour = ds_map_find_value(global.PowerupColours, powerUp.PowerupType);
	
	instance_destroy(powerUp);
}

if (RoomManager.CurrentLevelWon)
{
	
	with (GolfBall)
	{
		if (IsOverHole && DrawnScale > 0)
			DrawnScale = clamp(DrawnScale - 0.05 * (delta_time / 10000),
				0, 1);
	}
}

if (global.ParticlesEnabled)
	if (phy_speed > 0.1)
	{
		part_particles_create(global.PartSystemUpper, x, y, global.PartGrassDarkest, 1);
		part_particles_create(global.PartSystem, x, y, global.PartGrassDarker, 1);
		part_particles_create(global.PartSystemLower, x, y, global.PartGrass, 1);
		
	}






