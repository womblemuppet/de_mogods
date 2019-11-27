var playerId;
playerId=argument0

var a;
a=instance_create_depth(small_portrait_x[0],small_portrait_y[0]-30,-90,select_spirit)
a.NORMAL_SPRITE=select_spirit_sprite[playerId]
a.sprite_index=select_spirit_sprite[playerId]
a.image_speed=0.1

return a