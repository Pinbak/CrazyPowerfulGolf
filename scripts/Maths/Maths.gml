function Normalise(length, distance)
{
	if (length == 0) return 0;
	
	distance /= length;
	return distance;
}

function EuclideanDistance(x1, x2, y1, y2)
{
	return sqrt(sqr(x2 - x1) + sqr(y2 - y1));
}
