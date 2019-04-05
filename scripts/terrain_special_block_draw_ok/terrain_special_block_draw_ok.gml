/// @description // check for whether to draw individual 20 by 20 parts for the block or treat it as one 40 by 40.  eg, is this block divisble or not?
show_error("obsolete terrain_special_block_draw_ok call",true)


//this is replcaed with divisible variable set in block spawn scripts

if object_index!=weaksand && object_index!=ore_block  && object_index!=meteor_block && object_index!=turret_block && object_index!=tree_block
    return true
return false        
