// Created by Crowbar 0.51.0.0

$modelname "sfp_gauntlet\sfp_gauntlet.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_gauntlet.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_gauntlet\"

$cbox 0 0 0 0 0 0

$bbox -124.817 -131.338 -18.566 124.817 131.338 18.566


$sequence "idle" {
	"sfp_gauntlet_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_gauntlet_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
