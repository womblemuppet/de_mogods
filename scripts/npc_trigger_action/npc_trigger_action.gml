switch argument0
{
    case "fire_shrine":
    start_trial("firetrial") break;
    case "ice_shrine":
    start_trial("icetrial") break;
    case "lightning_shrine":
    start_trial("stormtrial") break;
    default:
    show_error("unknown trial trigger index",true)
}
