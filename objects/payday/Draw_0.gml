var yes,iifake;
yes=-2
iifake=-1
for (ii=0; ii<3; ii+=1)
{
    iifake=ii
    with player
    {
         if iifake==P
            yes=self.id
    }
    if yes!=-2
    {
        draw_set_alpha(0.5)
        for (i=0; i<purse[ii];i+=1)
        {
            draw_sprite(coins,image_index+i,yes.x,yes.y-16-(38*i))
        };      
        draw_set_alpha(1)      
    }
    yes=-2
};


