var positionX = 0;
var positionY = 0;
var count = 1;

with (GolfBall)
{
	positionX += x;
	positionY += y;
	++count;
}

positionX += CenterX;
positionY += CenterY;

positionX /= count;
positionY /= count;

x = positionX;
y = positionY;
