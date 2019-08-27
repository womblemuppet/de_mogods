/***************************************************
  called from player object
 ***************************************************/
 
 
 /***************************************************
                   sprites[42]=Ooga_death_by_acid
                sprites[41]=Ooga_death_by_zap
                sprites[40]=Ooga_death_by_ice
  ***************************************************/

var a;
a=instance_create(x,y+20,corpse)
a.scale=true

a.image_speed=0.1
switch lastdamagetype 
{
    case "icespike":
    a.sprite_index=sprites[40]
    a.image_speed=0.3 break;
    case "zap":
    a.sprite_index=sprites[41] break;
    case "acid":
    a.sprite_index=sprites[42] break;

    default:
    a.sprite_index=sprites[13]
    a.hspeed=hspd/2
    a.vspeed=-7
    a.gravity=0.2
    a.image_speed=1
}

aizen.lastplayerx=x
if kouchou.map=="multiplayer"
{
	if instance_number(player)==1 && aizen.candraw==true    ///draw
	{
		with winsplash
			instance_destroy()
		var a;
		a=instance_create(kouchou.room_x_halfway,kouchou.room_y_halfway,winsplash)
		a.image_index=4   
		if kouchou.drinkmode==true
			a.image_index=7
	}
	if instance_number(player)==2                         ///player wins
	{
		aizen.alarm[9]=5   ///candraw alarm (hikiwake)
		var a;
		a=instance_create(kouchou.room_x_halfway,kouchou.room_y_halfway,winsplash)
        
		var him;   ///find the ID of the player still alive   ///very gender-inclusive..
		with player
		{
			if H>0
				him=self.id
		}
        
		a.image_index=him.P
                
		if kouchou.drinkmode==true
			a.image_index=7
            
		kouchou.playerwins[him.P]+=1
	}
}
else if kouchou.map=="stormtrial" && stormtrial_control.timer<1
{
        var a;
        a=instance_create(kouchou.room_x_halfway,kouchou.room_y_halfway,winsplash)
        a.image_index=6
        with corpse
            instance_destroy()
}
else      ////noone wins
{
        var a;
        a=instance_create(kouchou.room_x_halfway,kouchou.room_y_halfway,winsplash)
        a.image_index=5
}







instance_destroy()
