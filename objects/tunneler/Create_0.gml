
length=8+irandom(10)
xx=x
yy=y
D=choose(0,180,270)
repeat(length)
{
	//disgusting
	if D==0
		D=choose(D,D,D,D,D,270,270)
	else if D==180
		D=choose(D,D,D,D,D,270,270)
	else if D==270
		D=choose(D,D,D,D,D,D,0,0,180,180)
        
    
	if D==0
		xx+=aizen.bw
	else if D==180
		xx-=aizen.bw
	else if D==270
		yy+=aizen.bh
	//ds_list_add(aizen.blockstosprite_prevlayer,spawn_gunpowder_block(xx,yy,0))   
    
}
instance_destroy()


