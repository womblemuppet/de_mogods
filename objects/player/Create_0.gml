hspd=0
vspd=0
groundcheck=false
JUMPSPEED=6.75 
BIGJUMPSPEED=7.25 
HOR_RUNSPEED=5
HOR_DASHSPEED=4
hor_running_counter=0  //4 = pressed r  8+ = holding r  -4 = pressed l  -8< = holding l
HOR_DASH_THRESHOLD=4   //^
HOR_RUNNING_THRESHOLD=8  //changes      ^  this  number
HOR_AIR_ACCEL=0.5
HOR_AIR_MINSPEED=1
HOR_AIR_MAXSPEED=4.5
mild_slowed_counter=0
fuckoff_slowed_counter=0
slowed_show_trail=false
MILD_SLOW_PERCENTAGE=0.5     ///speed timesed by this number
FUCKOFF_SLOW_PERCENTAGE=0.2

GROUD_POUND_FREEZE_TIME=13
GROUND_POUND_STUN_AMOUNT=70   ///steps to be stunned for ///payday stun is set to twice this
GROUND_POUND_SPEED=15
GRAVITY=0.3   //gravity while rising  
GRAVITY_DOWN=0.65  //gravity while falling 
VSPEED_FROM_GRAVITY_DOWN_MAX=6   ///5.5 good but aiming for slightly heavier
FRICTION=0.6
AIR_FRICTION=0.2
RUNNING_HSPD_MAX=7
orb_count_meter=0   ///meter, charged on landing hits
supers=0  ///number of super charges
dashcd=0  /// dash cooldown counter
DASH_COOLDOWN_TIME=32 //originally 70, cooldown between dashes
ground_dashamount=12.5  ///hspd set to this amount
DASH_LOCKDOWN_TIME=20 ///time you can't move after dashing
dash_wallbreak_forgive=false //set to true if the dash breaks a wall, stopping the dash lockdown
dash_angel_jump=0 //// upward dash     0 can 1 freeze 2 in animation 3 used.
DASH_ANGEL_JUMP_FREEZE_TIME=60   ////time frozen in air (vunerable during this time)
dash_angel_jump_counter=0   //// counter for the above
DASH_ANGEL_JUMP_AMOUNT=16    ////vspd minued this amount after freeze time
DASH_ANGEL_JUMP_VUNERABLE_CRIPPLE_AMOUNT=100  ///if whacked during angel jump charge, get crippled for this amount
dash_angel_top_collision_safety=0 //counter, player can't die from going off top, and will limit vspd near top while this counter >0
DASH_ANGEL_TOP_COLLISION_SAFETY_AMOUNT=175
DASH_ANGEL_TOP_COLLISION_MAXY=8
doublejump=0        ///what jum-p the player is on (0 or 1)    - (when resetting double jump, make sure to give a number to doublejumptimer too)
DOUBLEJUMPTIME=37  //time to double tap up for double jump
doublejumptimer=0   ///the counter for the above
recoil_sprite_counter=0    ///time left where idle sprite becomes flinching animation (shouldn't be called recoil)
canpush=true   //// cooldown for uppercut (archaic...)
push_other_attacks_timer=0 ///counter for below
PUSH_OTHER_ATTACKS_TIME=12 ////other attacks allowed after this time after an uppercut
PUSH_COOLDOWN=40  ///uppercut cooldown timer (archaic as well...)
cangroundpound=0   /// -1 jump delay 0 can 1 freeze 2 down 3 bounced
GROUNDPOUND_UNAVAILABLE_TIME=5 ///9   //prevents groundpound after jumping for this long




LOONEYTUNE_TIME=4 ///after jumping off ledge
ltt=0 //looneytune time counter
octdir=-1     ///output of 8 way aim script
jumped=false  //after jump set to true so when landing can give superjump (but not when falling)
image_speed=0.2
STUNNED=0   //not constant
STUNNED2=0  ///not constant     [finaledit] replace with lowercase versions
immune=false
sidezap=false
scale=1.45
hothands=0
hothandimageindex=0
HOTHANDIMAGENUMBER=10 //update when changing hothands counter sprite
holding_a_crab=false
crab_being_held=-1
down_button_held=0
cripple_debuff_counter=0
impact_debuff_counter=0
chained_debuff_counter=0
chained_debuff_x_pos=0
chained_debuff_y_pos=0
chain_effect_id_to_delete=noone
cursed=false   ///bloodmoon buff
super_meter=0
pocket_orb=-1    ///ID of pocketed orb
pocket_light_heavy_held_counter=0
canbounce_counter=0  ///BOUNCE EFFECT
BOUNCE_MIN_VELOCITY=1
BOUNCE_MAX_VELOCITY=6

////SPECIAL INTERACTIONS //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
running_startup_frames=0   ///number of startup frames in running animation (eg for ooga)
dash_attacks_allowed_counter=0
uniques_super_ooga_gp_enabled=false
uniques_mines_enabled=false
uniques_mine_cooldown_counter=0
uniques_gpcombo_cripples_enabled=false
uniques_attack_during_dash=false
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


//VETERAN ANTI AIR PUNCH
uniques_aapunch_cd_counter=0
uniques_aapunch_lockdown=0  //0 = nothing 1 = charging 2 = punching
uniques_aapunch_COOLDOWN=50
uniques_aapunch_has_made_hitbox=false
uniques_aapunch_has_made_hitbox2=false

//VETERAN STANDARD PUNCH
uniques_vet_chain_counter=0
UNIQUES_VET_CHAIN_COUNTER_TIME=35

//VETERAN FORWARD PUNCH
uniques_forwardpunch_lockdown=0
uniques_forwardpunch_has_made_hitbox=false
uniques_forwardpunch_feet_counter=-1 // -1  = not in use 0 = please start 1/2 steps forward (1 resets to -1)

//VETERAN UPFOWARD DASH
uniques_upforwarddash_lockdown=0

//VETERAN_PARACHUTE
uniques_parachute_enabled=false
uniques_parachute=0   ///0 = can use 1 = in use 2 = used/can't use
UNIQUES_PARACHUTE_FALL_SPEED=0.5
uniques_parachute_minimum_time_counter=0
UNIQUES_PARACHUTE_MINIMUM_TIME=30

//VETERAN MINES
mines_ammo=0

//VETERAN ULT
uniques_veteran_mortarammo=0
uniques_veteran_clusterammo=0
uniques_veteran_ultstock=0

//SLINGER COMBAT ROLL
uniques_combatroll_lockdown=0
uniques_combatroll_has_made_hitbox=false

//SLINGER SUNBLAST
uniques_sunblast_lockdown=0 //0 = nothing 1 = charging 2 = shot/recovery
uniques_sunblast_cd_counter=0
UNIQUES_SUNBLAST_COOLDOWN=80
uniques_sunblast_has_made_hitbox=false

//SLINGER AIRDASH RESET
uniques_airdash_resets_jump=false

//BAIT CHAIN
BAITCHAIN_CHAIN_RANGE=75

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


sprites_below_run_priority=ds_list_create()
sprites_below_idle_priority=ds_list_create()
sprites_below_recoil_priority=ds_list_create()
FALLING_SPRITE_THRESHOLD_VSPD_LARGER_THAN=-0.25


lastdamagetype=""

attacks=ds_map_create()   //[finaledit] to be deleted on game end


