// Created by Crowbar 0.51.0.0

$modelname "sfp_planetary\sfp_planetary.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_planetary.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_planetary\"

$cbox 0 0 0 0 0 0

$bbox -177.016 -160.891 -36.004 106.648 160.891 36.004


$sequence "idle" {
	"sfp_planetary_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_planetary_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
