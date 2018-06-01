// Created by Crowbar 0.51.0.0

$modelname "sfp_r41\sfp_r41.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_r41.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_r41\"

$cbox 0 0 0 0 0 0

$bbox -136.385 -112.509 -23.803 136.385 112.509 23.409


$sequence "idle" {
	"sfp_r41_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_r41_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
