// Created by Crowbar 0.51.0.0

$modelname "sfp_droidbomber\sfp_droidbomber.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_droidbomber.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_droidbomber\"

$cbox 0 0 0 0 0 0

$bbox -78.566 -65.284 -18.64 78.566 65.284 18.64


$sequence "idle" {
	"sfp_droidbomber_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_droidbomber_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
