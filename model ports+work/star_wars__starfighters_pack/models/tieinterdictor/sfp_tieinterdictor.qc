// Created by Crowbar 0.51.0.0

$modelname "sfp_tieinterdictor\sfp_tieinterdictor.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_tieinterdictor.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_tieinterdictor\"

$cbox 0 0 0 0 0 0

$bbox -76.07 -108.364 -48.244 76.164 108.364 48.244


$sequence "idle" {
	"sfp_tieinterdictor_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_tieinterdictor_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
