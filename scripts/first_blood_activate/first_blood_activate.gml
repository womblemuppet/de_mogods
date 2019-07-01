var a;
a=effect_aniend(first_blood_zap,0.2,-2)
a.x=argument0
a.y=argument1

if argument2!=noone
{
	with argument2
	{
		hothands+=1
	}
}

aizen.first_blood_happened=true
aizen.peacetime=99999