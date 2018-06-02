// Created by Crowbar 0.51.0.0

$modelname "tie2\tie2.mdl"

$bodygroup "studio"
{
	studio "tie2.smd"
}


$surfaceprop "metal"

$contents "solid"

$cdmaterials "tie2\"
$cdmaterials "tie2\"

$cbox 0 0 0 0 0 0

$bbox -141.501 -118.675 5.738 141.531 148.388 354.128


$sequence "idle" {
	"tie2_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 15
	loop
}

$collisionmodel "tie2_physics.smd"
{
	$mass 100
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave

}

$keyvalues
{
	prop_data 
	{
		"base"		"Wooden.Medium"
	}
}
