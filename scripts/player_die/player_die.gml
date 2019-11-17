/***************************************************
  called from player object
 ***************************************************/
 
 
 /***************************************************
                sprites[? "death_acid"]=Ooga_death_by_acid
                sprites[? "death_zap"]=Ooga_death_by_zap
                sprites[? "death_ice"]=Ooga_death_by_ice
  ***************************************************/

var a;
a=instance_create_depth(x,y+20,-5,corpse)
a.scale=true

a.image_speed=0.2
switch lastdamagetype 
{
    case "icespike":
    a.sprite_index=sprites[? "death_ice"]
    a.image_speed=0.3 break;
    case "zap":
    a.sprite_index=sprites[? "death_zap"] break;
    case "acid":
    a.sprite_index=sprites[? "death_acid"] break;

    default:
    a.sprite_index=sprites[? "death_fall"]
    a.hspeed=hspd/2
    a.vspeed=-7
    a.gravity=0.5
    a.image_speed=1
}

aizen.lastplayerx=x
if kouchou.map=="multiplayer"
{
	if instance_number(player)==1 && aizen.round_draw_potential==true    ///draw
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
		aizen.alarm[9]=5   ///round_draw_potential alarm (hikiwake)
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
