// Created by Crowbar 0.51.0.0

$modelname "sfp_tieinterceptor\sfp_tieinterceptor.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_tieinterceptor.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_tieinterceptor\"

$cbox 0 0 0 0 0 0

$bbox -243.008 -139.236 -107.09 92.175 139.236 106.961


$sequence "idle" {
	"sfp_tieinterceptor_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_tieinterceptor_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
