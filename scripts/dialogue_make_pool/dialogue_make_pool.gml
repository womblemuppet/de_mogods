/***************************************************
  creates the dialogue pool based on the situation
  you can add specific rules for each character this way, depending on what happens
****************************************************/
with npc
{
    if hasdialogue
    {
        ds_list_clear(dialogue_pool)
        switch (name)
        {
            case "bob":
            ds_list_add(dialogue_pool,fulldialogue[| 0])
            ds_list_add(dialogue_pool,fulldialogue[| 1])
            ds_list_add(dialogue_pool,fulldialogue[| 2])
        
        
            break;
            default:
            show_error("unknown name case for npc pool build",true)
        }
        
        
        with npc
            dialogue_size=ds_list_size(dialogue_pool)
        with item
            dialogue_size=ds_list_size(dialogue_pool)
    }    
}
