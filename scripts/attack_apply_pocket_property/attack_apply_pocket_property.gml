var attacker
if instance_exists(other.creator)
	attacker=other.creator
else
	attacker=noone

var incoming_attack_name;
incoming_attack_name=argument0


//HA's add orb
switch incoming_attack_name
{
	case "sharkattack":
	case "sunblast":
	case "spinattack":
	case "forwardpunch":
	case "falconpunch":
		with attacker
			move_that_adds_pocket()
	break;
}
