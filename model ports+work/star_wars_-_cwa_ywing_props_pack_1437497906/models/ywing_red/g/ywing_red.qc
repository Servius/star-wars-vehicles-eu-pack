// Created by Crowbar 0.51.0.0

$modelname "Ywing_Red\Ywing_Red.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "Ywing_Red.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "akiran_ywing\"

$cbox 0 0 0 0 0 0

$bbox -341.819 -147.413 0 340.098 147.413 109.479


$sequence "idle" {
	"ywing_red_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "ywing_red_physics.smd"
{
	$concave
	$automass
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
}