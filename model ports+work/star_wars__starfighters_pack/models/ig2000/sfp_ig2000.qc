// Created by Crowbar 0.51.0.0

$modelname "sfp_ig2000\sfp_ig2000.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_ig2000.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_ig2000\"

$cbox 0 0 0 0 0 0

$bbox -260.382 -207.525 -53.782 265.618 207.527 33.09


$sequence "idle" {
	"sfp_ig2000_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_ig2000_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
