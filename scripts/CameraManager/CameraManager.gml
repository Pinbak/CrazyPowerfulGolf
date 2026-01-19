/// feather ignore all

#region Scaling

global.LastKnownWindowWidth = 1280;
global.LastKnownWindowHeight = 720;
global.BaseWidth = 1280;
global.BaseHeight = 720;
global.BaseAspect = global.BaseWidth / global.BaseHeight;
global.MainCamera = -1;

global.AspectRatio43 = 1.33;

function SetupScaling(mainCamera, baseWidth = 1280, baseHeight = 720)
{
	global.BaseWidth = baseWidth;
	global.BaseHeight = baseHeight;
	global.MainCamera = mainCamera;
	_CameraUpdateCenter();
}


function ScaleOuterLandScape()
{
	if (!_HasWindowChangedSize()) return false;
	
	var ww = window_get_width();
	var wh = window_get_height();
	
	// Minimum and maximum values, (4:3 and widescreen)
	if (ww / wh > 3)
	{
		_ScaleOuterByAspect(3);
		return true;
	} else if (ww / wh < global.AspectRatio43)
	{
		_ScaleOuterByAspect(global.AspectRatio43)
		return true;
	}
	if(ww <= 0 || wh <= 0) return;

	var windowAspect = ww / wh;
	_ScaleOuterByAspect(windowAspect);
	
	return true;
	
}

function _ScaleOuterByAspect(windowAspect)
{
	var newWidth = global.BaseHeight * windowAspect;
	var newHeight = global.BaseWidth / windowAspect;
	
	if (windowAspect > global.BaseAspect)
		camera_set_view_size(global.MainCamera, newWidth, global.BaseHeight);
	else 
		camera_set_view_size(global.MainCamera, global.BaseWidth, newHeight);
		
	var camWidth = camera_get_view_width(view_camera[0]);
	var camHeight = camera_get_view_height(view_camera[0])
	
	show_debug_message("Resized application surface");
	
	surface_resize(application_surface, camWidth, camHeight);
	//surface_resize(application_surface, window_get_width(), window_get_height());
	
	_CameraUpdateCenter();

}

function _HasWindowChangedSize()
{
	var hasChanged = false;
	
	var windowWidth = window_get_width();
	if (windowWidth!= global.LastKnownWindowWidth) hasChanged = true;
	
	var windowHeight = window_get_height();
	if (windowHeight != global.LastKnownWindowHeight) hasChanged = true;
	
	global.LastKnownWindowWidth = windowWidth;
	global.LastKnownWindowHeight = windowHeight;
	
	if (hasChanged) show_debug_message("Window has changed size");
	
	return hasChanged;
}

#endregion
#region Camera

global.CameraCenterX = 0;
global.CameraCenterY = 0;

function CameraFollowInstance(instance, lerpSpeed = 0.1)
{
	if (!instance_exists(instance)) return;
	
	var globalCamera = global.MainCamera;
	
	var windowWidth = camera_get_view_width(globalCamera);
	var windowHeight = camera_get_view_height(globalCamera);
	
	var newX = lerp(camera_get_view_x(globalCamera), 
		instance.x - (windowWidth * .5), lerpSpeed);
	var newY = lerp(camera_get_view_y(globalCamera),
		instance.y - (windowHeight * .5), lerpSpeed);
	
	camera_set_view_pos(global.MainCamera, newX, newY);
	_CameraUpdateCenter();
}

function InstanceFollowCamera(instance, lerpSpeed = 1)
{
	if (!instance_exists(instance)) return;
	
	var newX = lerp(instance.x, global.CameraCenterX, lerpSpeed);
	var newY = lerp(instance.y, global.CameraCenterY, lerpSpeed);
	
	instance.x = newX;
	instance.y = newY;
}

function InstanceFollowPosition(instance, posX, posY, lerpSpeed = 1)
{
	var newX = lerp(instance.x, posX, lerpSpeed);
	var newY = lerp(instance.y, posY, lerpSpeed);
	instance.x = newX;
	instance.y = newY;
}

function SequenceFollowCamera(sequence, lerpSpeed = 1)
{
	var newX = lerp(layer_sequence_get_x(sequence), global.CameraCenterX, lerpSpeed);
	var newY = lerp(layer_sequence_get_y(sequence), global.CameraCenterY, lerpSpeed);
	layer_sequence_x(sequence, newX);
	layer_sequence_y(sequence, newY);
}

function SequenceFollowPosition(sequence, posX, posY, lerpSpeed = 1)
{
	var newX = lerp(layer_sequence_get_x(sequence), posX, lerpSpeed);
	var newY = lerp(layer_sequence_get_y(sequence), posY, lerpSpeed);
	layer_sequence_x(sequence, newX);
	layer_sequence_y(sequence, newY);
}

function _CameraUpdateCenter()
{
	var globalCamera = global.MainCamera;
	var windowWidth = camera_get_view_width(globalCamera);
	var windowHeight = camera_get_view_height(globalCamera);
	
	global.CameraCenterX = camera_get_view_x(globalCamera) + (windowWidth * .5);
	global.CameraCenterY = camera_get_view_y(globalCamera) + (windowHeight * .5);
}


#endregion