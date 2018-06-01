// Created by Crowbar 0.51.0.0

$modelname "sfp_ywingheavy\sfp_ywingheavy.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_ywingheavy.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_ywingheavy\"

$cbox 0 0 0 0 0 0

$bbox -219.965 -120.254 -47.501 220.072 120.562 48.448


$sequence "idle" {
	"sfp_ywingheavy_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_ywingheavy_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
