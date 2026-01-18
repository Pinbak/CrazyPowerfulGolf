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