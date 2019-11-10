if object_index==ice_block
	exit
if object_index==gunpowder
{
	instance_destroy()
	exit
}


switch other.type
{
	case "hit":
	var a,dir;
	dir=other.dir
	//show_message("other.direction= "+string(dir))
    
	var noblocks;
	noblocks=aizen.bw/aizen.BLOCK_DESTRUCTION_FIDELITY
    
	for (var i=0; i<aizen.bw; i+=noblocks)
	{
		for (ii=0; ii<aizen.bh; ii+=noblocks)
		{
			a=instance_create(x+i,y+ii,ef_rubble)
			a.sprite_index=sprite_index
			a.image_xscale=0.4
			a.image_yscale=0.4
			a.image_angle=random(360)
			a.dir=dir+25-random(50)
			a.spd=choose(other.spd,other.spd,1,2)
			a.alarm[0]=2
		};
	};

	break;
	case "gilded":
	//effect_create_above(ef_firework,x,y,2,c_olive)
	break;
	case "disintegrated":
	//effect_create_above(ef_firework,x,y,2,c_blue)
	break;
	case "pushed":

	var a,dir;
	dir=other.dir

	var noblocks;
	noblocks=80/aizen.BLOCK_DESTRUCTION_FIDELITY

	for (var i=0; i<aizen.bw; i+=noblocks)
	{
		for (var ii=0; ii<aizen.bh; ii+=noblocks)
		{
			a=instance_create(x+i,y+ii,ef_rubble)
			a.sprite_index=sprite_index
			a.image_xscale=0.75
			a.image_yscale=0.75
			a.image_angle=choose(0,45)
			a.dir=random(360)
			a.spd=random(2)
			a.alarm[0]=2
			a.hitgroundaction=choose("fall")
		};
    
	};
    
    
	break;
	case "ritual":
        
	var noblocks;
	noblocks=10
        
	for (var i=0; i<aizen.bw; i+=noblocks)
	{
		for (var ii=0; ii<aizen.bh; ii+=noblocks)
		{
			a=instance_create(x+i,y+ii,ef_rubble)
			a.sprite_index=sprite_index
			a.image_xscale=0.25
			a.image_yscale=0.25
			a.image_angle=random(360)
			a.dir=85+random(10)
			a.spd=4
			a.alarm[0]=6
		}
    
	}
	break;
	case "funnel":
    
	var noblocks;
	noblocks=20
        
	for (var i=0; i<aizen.bw; i+=noblocks)
	{
		for (var ii=0; ii<aizen.bh; ii+=noblocks)
		{
			a=instance_create(x+i,y+ii,ef_rubble)
			a.sprite_index=sprite_index
			a.image_xscale=0.4
			a.image_yscale=0.4
			a.image_angle=choose(0,45)
			a.dir=85+random(10)
			a.spd=choose(12,14)
			a.direction=90
			a.speed=1
			a.alarm[0]=5
			a.hitgroundaction=choose("fall")
		};
    
	};
    
	break;
		default:
	show_error("gender fluid rubble. other.id = "+string(other.id)+ "my id="+string(id),true)
}




instance_destroy()


