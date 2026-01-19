global.ParticlesEnabled = true;
global.CurrentIndicator = -1;

enum POWERUP{
	DUPLICATE,
	SPEED_UP,
	BOUNCINESS,
	LIGHTNESS,
	DENSE,
}

global.DiscoveredPowerups = ds_map_create();
ds_map_add(global.DiscoveredPowerups, POWERUP.DUPLICATE, false);
ds_map_add(global.DiscoveredPowerups, POWERUP.SPEED_UP, false);
ds_map_add(global.DiscoveredPowerups, POWERUP.BOUNCINESS, false);
ds_map_add(global.DiscoveredPowerups, POWERUP.LIGHTNESS, false);
ds_map_add(global.DiscoveredPowerups, POWERUP.DENSE, false);

global.PowerupColours = ds_map_create();
ds_map_add(global.PowerupColours, POWERUP.DUPLICATE, make_color_rgb(255, 0, 77));
ds_map_add(global.PowerupColours, POWERUP.SPEED_UP, make_color_rgb(41, 173, 255));
ds_map_add(global.PowerupColours, POWERUP.BOUNCINESS, make_color_rgb(255, 236, 39));
ds_map_add(global.PowerupColours, POWERUP.LIGHTNESS, make_color_rgb(255, 119, 168));
ds_map_add(global.PowerupColours, POWERUP.DENSE, make_color_rgb(126, 37, 83));

