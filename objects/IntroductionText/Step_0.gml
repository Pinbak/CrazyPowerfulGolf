InstanceFollowPosition(self, camera_get_view_x(global.MainCamera) + 50,
	camera_get_view_y(global.MainCamera) + 50, 1);
	
	
if (StartDeleting && Alpha > 0)
	Alpha -= 0.1;
	
if (!StartDeleting && Alpha < 1)
	Alpha += 0.1;