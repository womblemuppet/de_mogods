with npc
{
    switch name
    {
        case "bob":
        sprite_index=test_npc_sprite_forawrd
        break;
        case "fire_shrine":
        sprite_index=fire_shrine     break;  
      
        case "lightning_shrine":
        sprite_index=lightning_shrine    break;
    
        case "ice_shrine":
        sprite_index=ice_shrine     break;
    
        default:
        show_error("no applicable sprite set for npc when called",true)   break;
        
    }
}
