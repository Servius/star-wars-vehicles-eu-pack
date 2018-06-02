// Created by Crowbar 0.51.0.0

$modelname "sfp_tiescout\sfp_tiescout.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_tiescout.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_tiescout\"

$cbox 0 0 0 0 0 0

$bbox -116.266 -113.508 -32.078 116.266 113.508 97.706


$sequence "idle" {
	"sfp_tiescout_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_tiescout_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
