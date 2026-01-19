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
	
	audio_play_sound(SoundPutt, 0, false);
	
	if (Hole.IsFinalHole)
		RoomManager.FinishGame();
	else
		RoomManager.FinishLevel();
}

if (instance_exists(Danger))
	if (place_meeting(x, y, Danger) && IsDead != true)
	{
		phy_speed_x = 0;
		phy_speed_y = 0;
		IsDead = true;

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
			phy_linear_damping = 0.5;
			break;
		case POWERUP.BOUNCINESS:
			Fixture = physics_fixture_create();
			physics_fixture_set_circle_shape(Fixture, 16);
			physics_fixture_set_restitution(Fixture, 1.1);
			physics_fixture_set_collision_group(Fixture, 1);
			physics_fixture_set_density(Fixture, 0.5);
			physics_fixture_set_linear_damping(Fixture, 2);
			physics_fixture_set_angular_damping(Fixture, 0.1);
			physics_fixture_set_friction(Fixture, 0.2);
			physics_fixture_bind(Fixture, self);
			break;
		case POWERUP.LIGHTNESS:
			Fixture = physics_fixture_create();
			physics_fixture_set_circle_shape(Fixture, 16);
			physics_fixture_set_restitution(Fixture, 1.1);
			physics_fixture_set_collision_group(Fixture, 1);
			physics_fixture_set_density(Fixture, 0.01);
			physics_fixture_set_linear_damping(Fixture, 2);
			physics_fixture_set_angular_damping(Fixture, 0.1);
			physics_fixture_set_friction(Fixture, 0.2);
			physics_fixture_bind(Fixture, self);
			break;
		case POWERUP.DENSE:
			Fixture = physics_fixture_create();
			physics_fixture_set_circle_shape(Fixture, 16);
			physics_fixture_set_restitution(Fixture, 1.1);
			physics_fixture_set_collision_group(Fixture, 1);
			physics_fixture_set_density(Fixture, 5);
			physics_fixture_set_linear_damping(Fixture, 2);
			physics_fixture_set_angular_damping(Fixture, 0.1);
			physics_fixture_set_friction(Fixture, 0.2);
			physics_fixture_bind(Fixture, self);
			break;
		
	}
	
	Colour = ds_map_find_value(global.PowerupColours, powerUp.PowerupType);
	
	instance_destroy(powerUp);
}

if (IsDead)
{
	if (DrawnScale > 0)
		DrawnScale = clamp(DrawnScale - 0.05 * (delta_time / 10000),
				0, 1);
	if (DrawnScale <= 0)
	{
		if (instance_number(GolfBall) == 1 && !RoomManager.CurrentLevelWon) RoomManager.RestartLevel();
		instance_destroy(self);
	}
}
	

if (RoomManager.CurrentLevelWon)
{
	
	with (GolfBall)
	{
		if (IsOverHole && DrawnScale > 0)
			DrawnScale = clamp(DrawnScale - 0.05 * (delta_time / 10000),
				0, 1);
		if (DrawnScale <= 0)
			instance_destroy(self);
	}
}

if (global.ParticlesEnabled)
	if (phy_speed > 0.1 && !IsDead && !RoomManager.CurrentLevelWon)
	{
		part_particles_create(global.PartSystemUpper, x, y, global.PartGrassDarkest, 1);
		part_particles_create(global.PartSystem, x, y, global.PartGrassDarker, 1);
		part_particles_create(global.PartSystemLower, x, y, global.PartGrass, 1);
		
	}






