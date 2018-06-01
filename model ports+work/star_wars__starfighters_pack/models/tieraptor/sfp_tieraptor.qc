// Created by Crowbar 0.51.0.0

$modelname "sfp_tieraptor\sfp_tieraptor.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_tieraptor.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_tieraptor\"

$cbox 0 0 0 0 0 0

$bbox -26.896 -59.055 -52.424 27.87 58.927 65.558


$sequence "idle" {
	"sfp_tieraptor_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_tieraptor_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
