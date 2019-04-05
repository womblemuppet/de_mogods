/***************************************************
  adjacent_to_instrument()
  returns instrument instance id if found, or returns false
  
****************************************************/


/// 3 checks?! this is bad
/// seriously needs optimising [finaledit]

if place_meeting(x+1,y,instrument)
    return instance_place(x+1,y,instrument)
else if place_meeting(x-1,y,instrument) 
    return instance_place(x-1,y,instrument)
else if place_meeting(x,y+1,instrument)
    return instance_place(x,y+1,instrument)
    
return -1
