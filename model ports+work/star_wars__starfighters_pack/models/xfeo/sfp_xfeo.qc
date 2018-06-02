// Created by Crowbar 0.51.0.0

$modelname "sfp_xfeo\sfp_xfeo.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_xfeo.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_xfeo\"

$cbox 0 0 0 0 0 0

$bbox -161.296 -67.9 -106.016 161.296 71.409 106.016


$sequence "idle" {
	"sfp_xfeo_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_xfeo_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
