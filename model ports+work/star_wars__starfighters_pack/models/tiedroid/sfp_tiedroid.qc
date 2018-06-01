// Created by Crowbar 0.51.0.0

$modelname "sfp_tiedroid\sfp_tiedroid.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_tiedroid.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_tiedroid\"

$cbox 0 0 0 0 0 0

$bbox -74.22 -88.353 -39.74 74.219 88.353 39.696


$sequence "idle" {
	"sfp_tiedroid_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_tiedroid_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
