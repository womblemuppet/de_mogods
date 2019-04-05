alarm[0]=250

if ds_list_empty(aizen.STACK)
{
    if ds_list_find_value(aizen.STACK,0)==2   ///if stacking meteors, stop stacking
        alarm[0]=600
}

alarm[1]=1
ammo=10

meteor_wave=choose(0,1)   ///0=wave to right 1=wave to left 2=freethrow



