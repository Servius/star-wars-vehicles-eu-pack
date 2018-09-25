// Created by Crowbar 0.51.0.0

$modelname "ship_belbu\ship_belbu_servius.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "ship_belbu.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "ship_belbu\"

$origin 0 0 0 90

$cbox 0 0 0 0 0 0

$bbox -299.921 -148.222 -59.816 224.256 148.222 61.832


$sequence "idle" {
	"ship_belbu_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "ship_belbu_physics.smd"
{
	$concave
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
