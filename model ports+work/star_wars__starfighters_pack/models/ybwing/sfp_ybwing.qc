// Created by Crowbar 0.51.0.0

$modelname "sfp_ybwing\sfp_ybwing.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_ybwing.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_ybwing\"

$cbox 0 0 0 0 0 0

$bbox -151.675 -256.647 -145.606 151.675 256.647 145.606


$sequence "idle" {
	"sfp_ybwing_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_ybwing_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
