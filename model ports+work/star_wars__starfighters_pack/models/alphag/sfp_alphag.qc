// Created by Crowbar 0.51.0.0

$modelname "sfp_alphag\sfp_alphag.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_alphag.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_alphag\"

$cbox 0 0 0 0 0 0

$bbox -361.238 -432.208 -86.46 208.001 432.171 304.563


$sequence "idle" {
	"sfp_alphag_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_alphag_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
