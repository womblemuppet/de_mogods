var talkingto;
talkingto=instance_place(x,y,npc)
if talkingto==noone
    talkingto=instance_place(x,y,item)
    

if talkingto!=noone
{
    if talkingto.hasdialogue==true
    {
        var txt;
        txt=talkingto.dialogue_pool[| talkingto.dialogue_current_number]
        tousen.dialogue_to_draw=txt
        tousen.MODE=1
        talkingto.dialogue_current_number+=1
        if talkingto.dialogue_current_number>talkingto.dialogue_size-1
            talkingto.dialogue_current_number=0
    }
    else if talkingto.hasaction==true   ///this else means rn you can't have dialogue and action
    {
        tousen.MODE=5
        npc_trigger_action(talkingto.name)
    }
}

instance_destroy()

