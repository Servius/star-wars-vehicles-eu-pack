// Created by Crowbar 0.51.0.0

$modelname "ship_dooku\ship_dooku_servius.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "ship_dooku.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "ship_dooku\"

$cbox 0 0 0 0 0 0

//$bbox -351.834 -111.161 -129.587 351.897 111.161 128.428


$sequence "idle" {
	"ship_dooku_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "ship_dooku_physics.smd"
{
	$concave
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
