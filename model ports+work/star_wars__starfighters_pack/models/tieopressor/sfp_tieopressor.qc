// Created by Crowbar 0.51.0.0

$modelname "sfp_tieopressor\sfp_tieopressor.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_tieopressor.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_tieopressor\"

$cbox 0 0 0 0 0 0

$bbox -139.382 -100.394 -74.207 139.383 100.394 74.208


$sequence "idle" {
	"sfp_tieopressor_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_tieopressor_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
