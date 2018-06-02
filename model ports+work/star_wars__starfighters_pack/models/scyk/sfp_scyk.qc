// Created by Crowbar 0.51.0.0

$modelname "sfp_scyk\sfp_scyk.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_scyk.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_scyk\"

$cbox 0 0 0 0 0 0

$bbox -159.578 -191.67 -40.915 405.427 191.67 57.589


$sequence "idle" {
	"sfp_scyk_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_scyk_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
