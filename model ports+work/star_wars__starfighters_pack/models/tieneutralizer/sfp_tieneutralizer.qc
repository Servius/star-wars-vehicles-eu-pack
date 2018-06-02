// Created by Crowbar 0.51.0.0

$modelname "sfp_tieneutralizer\sfp_tieneutralizer.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_tieneutralizer.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_tieneutralizer\"

$cbox 0 0 0 0 0 0

$bbox -256.531 -395.836 -145.23 168.207 587.731 151.33


$sequence "idle" {
	"sfp_tieneutralizer_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_tieneutralizer_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
