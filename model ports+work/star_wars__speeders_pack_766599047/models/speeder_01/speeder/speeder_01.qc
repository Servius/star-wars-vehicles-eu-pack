// Created by Crowbar 0.51.0.0

$modelname "speeder_01\speeder_01_servius.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "speeder_01.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "speeder_01\"

$texturegroup "skinfamilies"
{
	{ "speeder_01"    }
	{ "speeder_01_02" }
	{ "speeder_01_03" }
}

$cbox 0 0 0 0 0 0

$bbox -90.382 -20.006 0 66.79 25.568 49.627


$sequence "idle" {
	"speeder_01_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "speeder_01_physics.smd"
{
	$mass 1
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave

}
