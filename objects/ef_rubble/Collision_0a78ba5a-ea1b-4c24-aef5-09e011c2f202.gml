if speed<1
	exit
if hitgroundaction=="disappear"
	instance_destroy()
else if hitgroundaction=="linger"
{
	alarm[1]=choose(5,15)
	speed=0
	gravity=0   
}
else if hitgroundaction=="fall"
{
	alarm[1]=10
	if vspeed<-10
		instance_destroy()
}
