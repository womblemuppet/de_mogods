//block_take_damage (block method)
// creates destruction effects and then destroys instance


switch other.type
{
	case "hit":
	//create block die effect
	effect_aniend(die_hit_sprite,0.2,-1)
	show_debug_message("HIT, spr="+sprite_get_name(die_hit_sprite))


	//create rubble effects
	var a,dir;
	dir=other.dir //show_message("other.direction= "+string(dir))
	repeat(choose(2,3,4))
	{
		var xx,yy;
		xx=aizen.bw/2+random(aizen.bw)*0.5-random(aizen.bw)
		yy=random(aizen.bh/2)
		
		a=instance_create_depth(x+xx,y+yy,2,ef_rubble)
		
		a.sprite_index=die_debris_sprite
		a.die_sprite=die_debris_sprite_die
		a.image_angle=random(360)
		a.dir=dir+25-random(50)
		a.spd=choose(other.spd,other.spd,1,2)
		a.alarm[0]=2
		a.alarm[1]=30+random(20)  //max alive time
	}

	break;
	case "disintegrated":
	//create block die effect
	effect_aniend(die_disintegrated_sprite,0.2,-1)
	
	break;
	case "pushed":
	//create block die effect
	effect_aniend(die_pushed_sprite,0.2,-1)


	//create rubble effects
	var a,dir;
	dir=other.dir

	repeat(choose(4,5,6))
	{
		var xx,yy;
		xx=aizen.bw/2+random(aizen.bw)*0.5-random(aizen.bw)
		yy=random(aizen.bh/2)
		
		a=instance_create_depth(x+xx,y+yy,2,ef_rubble)
		
		a.sprite_index=die_debris_sprite
		a.die_sprite=die_debris_sprite_die
		a.image_angle=choose(0,45)
		a.dir=random(360)
		a.spd=random(2)
		a.alarm[0]=2
		a.alarm[1]=30+random(20)  //max alive time
		a.hitgroundaction=choose("fall")
	}

    
    
	break;
	
	//case "funnel":
    
	//var noblocks;
	//noblocks=20
        
	//for (var i=0; i<aizen.bw; i+=noblocks)
	//{
	//	for (var ii=0; ii<aizen.bh; ii+=noblocks)
	//	{
	//		a=instance_create(x+i,y+ii,ef_rubble)
	//		a.sprite_index=sprite_index
	//		a.image_xscale=0.4
	//		a.image_yscale=0.4
	//		a.image_angle=choose(0,45)
	//		a.dir=85+random(10)
	//		a.spd=choose(12,14)
	//		a.direction=90
	//		a.speed=1
	//		a.alarm[0]=5
	//		a.hitgroundaction=choose("fall")
	//	};
    
	//};
    
	//break;
	
	default:
	show_error("gender fluid rubble. other.id = "+string(other.id)+ "my id="+string(id),true)
}




instance_destroy()


