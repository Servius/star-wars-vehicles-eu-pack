// Created by Crowbar 0.51.0.0

$modelname "sfp_toskan\sfp_toskan.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_toskan.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_toskan\"

$cbox 0 0 0 0 0 0

$bbox -134.797 -126.569 -55.543 128.039 126.569 55.543


$sequence "idle" {
	"sfp_toskan_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_toskan_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
