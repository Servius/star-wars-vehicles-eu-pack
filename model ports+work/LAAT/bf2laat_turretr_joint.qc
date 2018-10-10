// Created by Crowbar 0.51.0.0

$modelname "ships/bf2laat_turretr_joint.mdl"

$bodygroup "body"
{
	studio "bf2laat_turretr_joint.smd"
}



$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "strasser\republic\laat"

$cbox 0 0 0 0 0 0

//$bbox -671.626 -1167.741 -0.274 672.86 1456.838 634.347


$sequence "idle" {
	"bf2laat_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "bf2laat_turretr_joint.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
