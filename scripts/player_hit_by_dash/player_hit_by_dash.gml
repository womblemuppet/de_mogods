/***************************************************
  player hit by dash  
****************************************************/

if instance_exists(other.creator)                  /////////// ON HIT   //////////////////
{
    if other.hit[P]==false && other.creator!=self.id
    {
        player_dashed_into(other.my_stunamount,other.my_hknockback,other.my_vknockback)
        moves_special_properties(other.attackname)
    }
}
