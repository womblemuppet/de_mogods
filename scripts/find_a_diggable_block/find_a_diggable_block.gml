/***************************************************
  find_a_diggable_block()
  populates temp_volc_spawn_possibles_list , then returns a random block from that list
****************************************************/

ds_grid_clear(aizen.temp_block_grid,0)
ds_list_clear(aizen.temp_volc_spawn_possibles_list)


var yy,fail;
yy=-1
fail=false

var maxx,maxy;
maxx=ds_grid_width(temp_block_grid)-1
maxy=ds_grid_height(temp_block_grid)-1




with block
{
    var nxx,nyy;
    nxx=floor((x-kouchou.room_left_border_x)/20)
    nyy=floor((y-kouchou.room_top_border_y)/20)
    
    //show_message("block "+string(id)+"x="+string(x)+" y="+string(y)+" nxx="+string(nxx)+" nyy="+string(nyy))
    
    if nxx<maxx && nyy<maxy
    {
        ds_grid_set(aizen.temp_block_grid,floor(nxx),floor(nyy),id)
        //if part==0
        //{
            ds_grid_set(aizen.temp_block_grid,floor(nxx)+1,floor(nyy),-1)
            ds_grid_set(aizen.temp_block_grid,floor(nxx),floor(nyy)+1,-1)
            ds_grid_set(aizen.temp_block_grid,floor(nxx)+1,floor(nyy)+1,-1)

    }
}

///find start row, first row with any blocks
while fail==false
{
    yy++  
    //show_message("testing start row "+string(yy))
    for (xx=0; xx<maxx; xx+=1)
    {
        if ds_grid_get(aizen.temp_block_grid,xx,yy)!=0
        {
            fail=true
            break;   
        }
        //else
        //    show_message("xx="+string(xx)+" yy="+string(yy)+" is empty")
    };    
 
    if yy>maxy
        fail=true
}
//show_message("start row = "+string(yy))



///then find first row with no gaps, adding each block checked to possibles list
var b;
b=0 ///stores return of ds_grid_get (either 0, stored id value, or -1 for big block areas)
while yy<maxy
{
    fail=true  
    for (xx=0; xx<maxx; xx+=1)
    {
        b=ds_grid_get(aizen.temp_block_grid,xx,yy)
        if b==0    ///if checked position has nothing, this whole line is diggable to (so add all non-0's to possibles list         =>)
        {
            //show_message("xx="+string(xx)+" yy="+string(yy)+" is free, moving on to next row")
            fail=false
        }
        else
        {
            //show_message("xx="+string(xx)+" yy="+string(yy)+" is occupied")
            if b!=-1
                ds_list_add(temp_volc_spawn_possibles_list,b)   /// if checked position isn't nothing nor a big block area, add to possibles list
        }
            
    };
    if fail //if no gaps in this row, end search and return a random full block from the list
    {
        for (var i=0; i<ds_list_size(aizen.temp_volc_spawn_possibles_list); i+=1)
        {
			//if aizen.temp_volc_spawn_possibles_list[| i].part!=0
                ds_list_delete(aizen.temp_volc_spawn_possibles_list,i)
        };
        
        ds_list_shuffle(aizen.temp_volc_spawn_possibles_list)
        
        if ds_list_size(aizen.temp_volc_spawn_possibles_list)<1
            return -3   ///error no full blocks
        return aizen.temp_volc_spawn_possibles_list[| 0]       ////returns a random block from possibles list
    }
    yy++    ///if there is a gap in this row, go to the next row down
}


 ////if up to the bottom line of blocks is diggable, try one more time to return a random block from possibles list 
if ds_list_size(aizen.temp_volc_spawn_possibles_list)>0
{
    ds_list_shuffle(aizen.temp_volc_spawn_possibles_list)
    return aizen.temp_volc_spawn_possibles_list[| 0]      
}
else
    return -2   ////error no blocks at all



