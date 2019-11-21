//create_menuoption(normal_sprite,selected_animation,text,x,y)
var a;
a=instance_create_depth(argument3,argument4,-50,mainmenuoption)

a.NORMAL_SPRITE=argument0
a.SELECTED_SPRITE=argument1
a.TEXT=argument2

a.sprite_index=a.NORMAL_SPRITE
a.x-=a.sprite_width
a.to_move_right=a.sprite_width

return a