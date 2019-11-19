var numberOfSegments,segmentWidth,sprite,thresholdMarkerIndex,thresholdMarkerSprite;
numberOfSegments=argument0
segmentWidth=argument1
sprite=argument2
thresholdMarkerIndex=argument3
thresholdMarkerSprite=argument4

var a;
for (var i = 0; i < numberOfSegments;i++)
{
    a=instance_create_depth(x+i*segmentWidth,y,-11,hud_bar_marker)
    a.sprite_index=sprite
    
    if i==thresholdMarkerIndex
		a.sprite_index=thresholdMarkerSprite
}