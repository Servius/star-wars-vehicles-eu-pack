// Created by Crowbar 0.51.0.0

$modelname "sfp_tiereaper\sfp_tiereaper.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_tiereaper.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_tiereaper\"

$cbox 0 0 0 0 0 0

$bbox -456.016 -384.38 -185.39 652.266 384.38 185.39


$sequence "idle" {
	"sfp_tiereaper_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_tiereaper_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
