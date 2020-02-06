/***************************************************
  critter_throwable_setup
  called by critter when created in terrain generation script
***************************************************/

switch argument0
{
    case "crab":
    stand_sprite=crab_stand_sprite
    walk_sprite=crab_walk_sprite
    thrown_sprite=crab_thrown_sprite
    hit_sprite=crab_hit_sprite
    turn_sprite=crab_turn_sprite
    holding_sprite=crab_holding_sprite
    break;

    case "goat":
    stand_sprite=goat_stand_sprite
    walk_sprite=goat_walk_sprite
    thrown_sprite=goat_thrown_sprite
    hit_sprite=goat_hit_sprite
    turn_sprite=goat_turn_sprite
    holding_sprite=goat_holding_sprite
    break;
    
    default:
    show_error("unknown animal family passed",true)
}

sprite_index=walk_sprite
