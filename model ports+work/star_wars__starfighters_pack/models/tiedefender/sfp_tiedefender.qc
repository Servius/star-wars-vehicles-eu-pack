// Created by Crowbar 0.51.0.0

$modelname "sfp_tiedefender\sfp_tiedefender.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_tiedefender.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_tiedefender\"

$cbox 0 0 0 0 0 0

$bbox -192.533 -198.911 -177.93 156.038 198.911 167.703


$sequence "idle" {
	"sfp_tiedefender_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_tiedefender_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
