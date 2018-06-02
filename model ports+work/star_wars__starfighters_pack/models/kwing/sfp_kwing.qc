// Created by Crowbar 0.51.0.0

$modelname "sfp_kwing\sfp_kwing.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_kwing.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_kwing\"

$cbox 0 0 0 0 0 0

$bbox -205.741 -299.131 -61.818 205.741 299.131 61.786


$sequence "idle" {
	"sfp_kwing_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_kwing_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
