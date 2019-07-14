var a;
a=attack_create_hitbox(25,1,false,false,"mortar",Vet_mortar_explosion,0.25,99,0,-6)
a.creator=creator
effect_aniend(Vet_mortar_explosion,0.25,-2)
instance_destroy()

