global.ParticlesEnabled = true;
global.CurrentIndicator = -1;

enum POWERUP{
	DUPLICATE,
	SPEED_UP
}

global.DiscoveredPowerups = ds_map_create();
ds_map_add(global.DiscoveredPowerups, POWERUP.DUPLICATE, false);
ds_map_add(global.DiscoveredPowerups, POWERUP.SPEED_UP, false);

global.PowerupColours = ds_map_create();
ds_map_add(global.PowerupColours, POWERUP.DUPLICATE, make_color_rgb(255, 0, 77));
ds_map_add(global.PowerupColours, POWERUP.SPEED_UP, make_color_rgb(41, 173, 255));

