// Created by Crowbar 0.51.0.0

$modelname "sfp_eta5\sfp_eta5.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_eta5.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_eta5\"

$cbox 0 0 0 0 0 0

$bbox -154.418 -111.578 -64.77 154.418 111.599 64.77


$sequence "idle" {
	"sfp_eta5_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_eta5_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
