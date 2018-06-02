// Created by Crowbar 0.51.0.0

$modelname "sfp_tieavenger\sfp_tieavenger.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_tieavenger.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_tieavenger\"

$cbox 0 0 0 0 0 0

$bbox -154.407 -84.738 -63.744 154.407 84.68 63.743


$sequence "idle" {
	"sfp_tieavenger_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_tieavenger_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
