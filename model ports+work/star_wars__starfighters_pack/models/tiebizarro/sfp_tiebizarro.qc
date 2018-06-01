// Created by Crowbar 0.51.0.0

$modelname "sfp_tiebizarro\sfp_tiebizarro.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_tiebizarro.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_tiebizarro\"

$cbox 0 0 0 0 0 0

$bbox -67.234 -93.597 -90.711 75.835 93.672 91.845


$sequence "idle" {
	"sfp_tiebizarro_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_tiebizarro_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
