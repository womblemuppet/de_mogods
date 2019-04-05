/***************************************************
  spawn_instrument_block(x,y)
  called by the block chosen by spawn_instrument
  returns the created instance id
****************************************************/

 
var a;
a=instance_create(argument0,argument1,instrument)   //if change this change room spawn blocks
a.protection=0
a.part=1
a.variant=0
a.divisible=false
a.type=choose(0,0,0,1,1,2,2,4,5)
switch (a.type)
{
    case 0: 
        a.sprite_index=instrument_spr_boar break;
    case 1: 
        a.sprite_index=instrument_spr_jaguar break;
    case 2: 
        a.sprite_index=instrument_spr_burd break;
    case 3: 
        a.sprite_index=mask40 break;
    case 4: 
        a.sprite_index=instrument_spr_octopus break;
    case 5: 
        a.sprite_index=instrument_spr_lizard break;
    case 6: 
        a.sprite_index=mask40 break;
    default: show_error("sprite for instrument type unknown",true)
}
 

with a
{
    blockchunktype=aizen.chunk_type
}
return a
