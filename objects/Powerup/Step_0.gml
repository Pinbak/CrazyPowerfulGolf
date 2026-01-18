if (ScaleX <= 0)
{
	ScaleIncreasing = true;
}else if (ScaleX >= 1)
{
	ScaleIncreasing = false;
}

if (ScaleIncreasing)
{
	ScaleX += AnimationSpeed;
}
else
{
	ScaleX -= AnimationSpeed;
}