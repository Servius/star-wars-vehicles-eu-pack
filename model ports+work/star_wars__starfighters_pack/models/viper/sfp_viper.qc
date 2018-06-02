// Created by Crowbar 0.51.0.0

$modelname "sfp_viper\sfp_viper.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_viper.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_viper\"

$cbox 0 0 0 0 0 0

$bbox -85.418 -196.071 -71.407 81.352 195.201 71.955


$sequence "idle" {
	"sfp_viper_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_viper_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
