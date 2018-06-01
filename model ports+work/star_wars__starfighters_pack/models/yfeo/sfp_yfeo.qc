// Created by Crowbar 0.51.0.0

$modelname "sfp_yfeo\sfp_yfeo.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_yfeo.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_yfeo\"

$cbox 0 0 0 0 0 0

$bbox -124.967 -83.431 -27.684 124.967 83.514 27.684


$sequence "idle" {
	"sfp_yfeo_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_yfeo_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
