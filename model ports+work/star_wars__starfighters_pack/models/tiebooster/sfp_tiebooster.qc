// Created by Crowbar 0.51.0.0

$modelname "sfp_tiebooster\sfp_tiebooster.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_tiebooster.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_tiebooster\"

$cbox 0 0 0 0 0 0

$bbox -71.42 -69.665 -91.37 108.061 72.267 91.362


$sequence "idle" {
	"sfp_tiebooster_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_tiebooster_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
