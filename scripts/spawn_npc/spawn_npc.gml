/***************************************************
  spawn_npc(x,y,name,hasdialogue,hasaction)

****************************************************/

var a;
a=instance_create(argument0,argument1,npc)

with a
{
    name=argument2
    hasdialogue=argument3
    hasaction=argument4
}

if argument3==true
{
    with a
        fulldialogue=ds_map_find_value(tousen.dialogue_map,name)
}

