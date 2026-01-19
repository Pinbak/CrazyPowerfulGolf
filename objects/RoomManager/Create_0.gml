CurrentLevelWon = false;

SetupScaling(view_camera[0]);

#region Particles

global.PartSystem = part_system_create_layer("Particles", false);
global.PartSystemUpper = part_system_create_layer("ParticlesUpper", false);
global.PartSystemLower = part_system_create_layer("ParticlesLower", false);

var part = part_type_create();

part_type_sprite(part, SprFlattenedGrass, false, false, false);
part_type_life(part, 1800, 2000);
part_type_size(part, 0.5, 1.5, 0, 0);

global.PartGrass = part;

part = part_type_create();

part_type_sprite(part, SprFlattenedGrassDarker, false, false, false);
part_type_life(part, 1800, 2000);
part_type_size(part, 1, 2, 0, 0);

global.PartGrassDarker = part;

part = part_type_create();

part_type_sprite(part, SprFlattenedGrassCompletely, false, false, false);
part_type_life(part, 100, 100);
part_type_size(part, .5, 2, -.01, 0);

global.PartGrassDarkest = part;

#endregion

#region Sequences

SequenceElement = -1;

AddPowerup = function(powerType)
{
	if (ds_map_find_value(global.DiscoveredPowerups, powerType)) return;
	
	ds_map_replace(global.DiscoveredPowerups, powerType, true);
	
	if (SequenceElement != -1)
		if (!layer_sequence_is_finished(SequenceElement)) return;
	
	if (SequenceElement != -1) layer_sequence_destroy(SequenceElement);
	
	// new power up
	switch(powerType)
	{
		case POWERUP.DUPLICATE:
			NewSequence(NewPowerupDuplication);
			break;
		case POWERUP.SPEED_UP:
			NewSequence(NewPowerupLowFriction);
			break;
		case POWERUP.BOUNCINESS:
			NewSequence(NewPowerupBounciness);
			break;
		case POWERUP.LIGHTNESS:
			NewSequence(NewPowerupLightness);
			break;
		case POWERUP.DENSE:
			NewSequence(NewPowerupDense);
			break;
	}

}

FinishGame = function()
{
	if (SequenceElement != -1) layer_sequence_destroy(SequenceElement);
	SequenceElement = layer_sequence_create("LocalGui",
		global.CameraCenterX, global.CameraCenterY, FinishScreen);
}

FinishLevel = function()
{
	if (SequenceElement != -1) layer_sequence_destroy(SequenceElement);
	SequenceElement = layer_sequence_create("LocalGui",
		global.CameraCenterX, global.CameraCenterY, LevelClear);
}

RestartLevel = function()
{
	if (SequenceElement != -1) layer_sequence_destroy(SequenceElement);
	SequenceElement = layer_sequence_create("LocalGui",
		global.CameraCenterX, global.CameraCenterY, LevelFailed);
}

NewSequence = function(sequence)
{
	SequenceElement = layer_sequence_create("LocalGui",
		global.CameraCenterX, global.CameraCenterY, sequence);
}

#endregion