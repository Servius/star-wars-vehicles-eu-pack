// Created by Crowbar 0.51.0.0

$modelname "sfp_bwing\sfp_bwing.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_bwing.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_bwing\"

$cbox 0 0 0 0 0 0

$bbox -182.189 -268.15 -533.941 118.588 268.15 309.891


$sequence "idle" {
	"sfp_bwing_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_bwing_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
