// Created by Crowbar 0.51.0.0

$modelname "ship_aatd\ship_aat_servius.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "ship_aatd_main.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "ship_aatd\"

$cbox 0 0 0 0 0 0

$bbox -248.964 -147.898 -0.328 222.755 147.897 197.936


$sequence "idle" {
	"ship_aatd_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "ship_aatd_main.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
