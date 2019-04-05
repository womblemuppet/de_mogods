/***************************************************
  critter_throwable_setup
  called by critter when created in terrain generation script
***************************************************/

switch argument0
{
    case "crab":
    walk_sprite=crab_walk_sprite
    thrown_sprite=crab_thrown_sprite
    hit_sprite=crab_hit_sprite
    squish_sprite=crab_squish_sprite
    break;

    case "goat":
    walk_sprite=goat_walk_sprite
    thrown_sprite=goat_thrown_sprite
    hit_sprite=goat_hit_sprite
    squish_sprite=goat_squish_sprite
    break;
    
    default:
    show_error("unknown animal family passed",true)
}

sprite_index=walk_sprite
