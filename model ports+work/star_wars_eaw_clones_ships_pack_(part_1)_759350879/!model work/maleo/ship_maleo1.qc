// Created by Crowbar 0.51.0.0

$modelname "ship_maleo1\ship_maleo_servius.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "ship_maleo1.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "ship_maleo1\"

$cbox 0 0 0 0 0 0

$bbox -2164.683 -654.601 -366.891 1925.548 654.601 379.404


$sequence "idle" {
	"ship_maleo1_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "ship_maleo1_physics.smd"
{
	$mass 1
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave

}
