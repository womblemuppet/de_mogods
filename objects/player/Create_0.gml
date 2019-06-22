hspd=0
vspd=0
groundcheck=noone
groundcheck_prev=noone
JUMPSPEED=6.75 
DOUBLEJUMPSPEED=7.5
doublejump=0        ///what jum-p the player is on (0 or 1)    - (when resetting double jump, make sure to give a number to doublejumptimer too)
DOUBLEJUMPTIME=60  //time to double tap up for double jump
doublejumptimer=0   ///the counter for the above
HOR_RUNSPEED=5
HOR_SHUFFLESPEED=4   ///shuffling is the small movement when you tap a key but release before holding
hor_running_counter=0  //4 = pressed r  8+ = holding r  -4 = pressed l  -8< = holding l
HOR_SHUFFLE_THRESHOLD=4   //^
HOR_RUNNING_THRESHOLD=8  //changes      ^  this  number
RUNNING_HSPD_MAX=7
HOR_AIR_ACCEL=0.5
HOR_AIR_MINSPEED=1
HOR_AIR_MAXSPEED=4.5
VSPEED_FROM_GRAVITY_DOWN_MAX=6   ///5.5 good but aiming for slightly heavier
FRICTION=0.6
AIR_FRICTION=0.2
mild_slowed_counter=0   /// 'small' slow counter for time remaining
MILD_SLOW_PERCENTAGE=0.5     ///speed timesed by this number
fuckoff_slowed_counter=0 /// 'large' slow counter for time remaining
FUCKOFF_SLOW_PERCENTAGE=0.2 ///speed timesed by this number
slowed_show_trail=false   ///is set when slow effect applied
GROUD_POUND_FREEZE_TIME=13   ///amount of time to hover in air before going down for GP
GROUND_POUND_STUN_AMOUNT=70   ///steps to be stunned for ///payday stun is set to twice this
GROUND_POUND_SPEED=15 
GRAVITY=0.3   //gravity while rising  
GRAVITY_DOWN=0.65  //gravity while falling
orb_count_meter=0   ///meter, charged on landing hits
super_mode=false
dashcd=0  /// dash cooldown counter
dash_current_hitbox_object=noone
dash_has_lifted_off_ground=false
DASH_COOLDOWN_TIME=22 //originally 70, cooldown between dashes
dash_button_currently_held=false
ground_dash_speed=12.5    ///speed of the current dash (if grounded).             WARNING             gets changed when attack happens so this value here means nothing
ground_dash_counter=0 ///counter for length of dash
GROUND_DASH_MAX=20  /// when ground_dash_amount reaches this amount the dash ends
AIR_DASH_SPEED=15   ///speed of dash when in air
AIR_DASH_VSPEED=3.5    ///(minused when dashing in air)
DASH_LOCKDOWN_TIME=20 ///time you can't move after dashing
dash_wallbreak_forgive=false //set to true if the dash breaks a wall, stopping the dash lockdown
dash_rocket_jump=0 //// upward dash     0 can 1 freeze 2 in animation 3 used.
dash_rocket_jump_charge=0 ///0 for not charged, 1 ,2, 3 for different charge durations
ROCKET_JUMP_INPUT_TIME_ALLOWED_FROM_JUMP=5   ///amount of time after pushing up where pushing dash will start rocket jump
rocket_jump_input_time_counter_from_jump=0   ///counter for above
ROCKET_JUMP_INPUT_TIME_ALLOWED_FROM_DASH=5    ///amount of time after pushing dash where pushing up will start rocket jump
rocket_jump_input_time_counter_from_dash=0   ///counter for above
DASH_ROCKET_JUMP_CHARGE_LEVEL_1_THRESHOLD=5    ///when charging animation of rocket jump reaches these frames, charge goes up
DASH_ROCKET_JUMP_CHARGE_LEVEL_2_THRESHOLD=13
DASH_ROCKET_JUMP_AMOUNT_LEVELS=[0,8,10,14] ////vspd minued this amount depending on charge level
DASH_ROCKET_JUMP_STUN_DURATION_LEVELS=[0,25,35,40] ////stun amount also depends on charge 
dash_rocket_jump_VUNERABLE_CRIPPLE_AMOUNT=100  ///if whacked during rocket jump charge, get crippled for this amount
dash_rocket_top_collision_safety=0 //counter, player can't die from going off top, and will limit vspd near top while this counter >0
DASH_ROCKET_TOP_COLLISION_SAFETY_AMOUNT=175
DASH_ROCKET_TOP_COLLISION_MAXY=8
recoil_sprite_counter=0    ///time left where idle sprite becomes flinching animation (shouldn't be called recoil)
canpush=true   //// cooldown for uppercut (archaic...)
push_other_attacks_timer=0 ///counter for below (archaic)
PUSH_OTHER_ATTACKS_TIME=12 ////other attacks allowed after this time after an uppercut (archaic)
PUSH_COOLDOWN=40  ///uppercut cooldown timer (archaic as well...)
cangroundpound=0   /// -1 jump delay 0 can 1 freeze 2 down 3 bounced
GROUNDPOUND_UNAVAILABLE_TIME=5 ///9   //prevents groundpound after jumping for this long
LOONEYTUNE_TIME=4 ///after jumping off ledge you have this much time to still jump
ltt=0 //(looneytune time) counter for above
octdir=-1     ///output of 8 way aim script
jumped=false  //after jump set to true so when landing can give superjump (but not when falling)
STUNNED=0   //not constant 
STUNNED2=0  ///not constant     [finaledit] replace with lowercase versions
immune=false      ///inability to take further damage while flickering
sidezap=false
hothands=0
hothandimageindex=0      ///hothands indicator image index
HOTHANDIMAGENUMBER=10 //update when changing hothands counter sprite
holding_a_crab=false
crab_being_held=-1   ///id of throwable critter  being held
cripple_debuff_counter=0   ///debuff stopping dashes and jumping
impact_debuff_counter=0   ///debuff making you destroy terrain when hit
chained_debuff_counter=0    ///debuff when etting hit by bait chaining attack
chained_debuff_x_pos=0     ///x pos of chain
chained_debuff_y_pos=0     ///y pos of chain
chain_effect_id_to_delete=noone   ///id of chain effect instance
cursed=false   ///bloodmoon buff
super_meter=0
pocket_orb=-1    ///ID of pocketed orb
pocket_light_heavy_held_counter=0
canbounce_counter=0  ///BOUNCE EFFECT
BOUNCE_MIN_VELOCITY=1
BOUNCE_MAX_VELOCITY=6
iframes=0 //cant be hit while this is >0
FRAME_SPEED_NORMAL=0.2
FRAME_SPEED_FAST=0.4
FRAME_SPEED_SLOW=0.1
image_speed=FRAME_SPEED_NORMAL

////SPECIAL INTERACTIONS //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
running_startup_frames=0   ///number of startup frames in running animation (eg for ooga)
dash_attacks_allowed_counter=0
uniques_mines_enabled=false
uniques_gpcombo_cripples_enabled=false
uniques_teleport_enabled=false
uniques_teleport=-1   ///-1 not enabled    0 = placeable 1 = placed 
uniques_my_teleport_id=-4

//OOGA FPUNCH
fpunch_cd_counter=0
FPUNCH_COOLDOWN=50
fpunch_lockdown=0   //0 = nothing 1 = charging 2 = locked in
fpunch_charge=0   ///charge counter of fpunch
FPUNCH_CHARGE_MAX=50
FPUNCH_CHARGE_MIN=10
fpunch_feet_counter=-1   /// -1 = not in use 0= please start 1/2 steps back 3= please start 4/5 steps forward (4 resets to -1)
fpunch_has_made_hitbox=false

//OOGA ULT
uniques_super_ooga_gp_enabled=false
unique_ooga_gp_charges=0


//VETERAN ANTI AIR PUNCH
uniques_aapunch_cd_counter=0
uniques_aapunch_lockdown=0  //0 = nothing 1 = charging 2 = punching
UNIQUES_AAPUNCH_COOLDOWN=50
uniques_aapunch_has_made_hitbox=false
uniques_aapunch_has_made_hitbox2=false

//VETERAN STANDARD PUNCH
uniques_vet_chain_counter=0
UNIQUES_VET_CHAIN_COUNTER_TIME=35

//VETERAN FORWARD PUNCH
uniques_forwardpunch_lockdown=0
uniques_forwardpunch_has_made_hitbox=false
uniques_forwardpunch_feet_counter=-1 // -1  = not in use 0 = please start 1/2 steps forward (1 resets to -1)

//VETERAN PARACHUTE
uniques_parachute_enabled=false
uniques_parachute=0   ///0 = can use 1 = in use 2 = used/can't use
UNIQUES_PARACHUTE_FALL_SPEED=0.5
uniques_parachute_minimum_time_counter=0
UNIQUES_PARACHUTE_MINIMUM_TIME=30

//VETERAN DIG
uniques_vet_dig_enabled=false
uniques_vet_digging=0   ///0 = not in use  1 = in windup  2 = digging horizontally 3 = digging up 

//VETERAN MINES
mines_ammo=0

//SLINGER SUNBLAST
uniques_sunblast_lockdown=0 //0 = nothing 1 = charging 2 = shot/recovery
uniques_sunblast_cd_counter=0
UNIQUES_SUNBLAST_COOLDOWN=80
uniques_sunblast_has_made_hitbox=false

//SLINGER AIRDASH RESET
uniques_airdash_resets_jump=false

//BAIT CHAIN
BAITCHAIN_CHAIN_RANGE=75

//BAIT WHIRLWIND
uniques_whirlwind_active=false
UNIQUES_WHIRLWIND_SPEED=5
UNIQUES_WHIRLWIND_SELFSTUN_AMOUNT=30

//BAIT SHARK ATTACK PUNCH
uniques_sharkattack_lockdown=0
uniques_sharkattack_has_made_hitbox=false
uniques_sharkattack_feet_counter=-1
uniques_sharkattack_cd_counter=0
UNIQUES_SHARKATTACK_COOLDOWN=50

// AIRGRAB
airgrab_mode=0   ///0 = can airgrab 1 = has shot grab 2=grab in progress 3=target thrown 4=being grabbed atm   progress of airgrab
airgrab_decidedir_time=0
AIRGRAB_TIME_TO_DECIDE=30
airgrab_target=-1
AIRGRAB_RANGE=55
MAX_CANBOUNCE_COUNTER=20
AIRGRAB_STUN_TIME=65


sprites_below_run_priority=ds_list_create()   ///sprites on these lists can get replaced by run,idle and recoil sprites in events
sprites_below_idle_priority=ds_list_create()
sprites_below_recoil_priority=ds_list_create()
FALLING_SPRITE_THRESHOLD_VSPD_LARGER_THAN=-0.25   ///if vspd larger than this swap from jumped sprite to falling sprite


lastdamagetype=""  ///last type of damage taken (string) for corpse

attacks=ds_map_create()   //[finaledit] to be deleted on game end



