// Created by Crowbar 0.51.0.0

$modelname "sfp_tiebomb\sfp_tiebomb.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_tiebomb.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_tiebomb\"

$cbox 0 0 0 0 0 0

$bbox -119.876 -84.666 -63.845 136.531 84.666 63.845


$sequence "idle" {
	"sfp_tiebomb_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_tiebomb_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
