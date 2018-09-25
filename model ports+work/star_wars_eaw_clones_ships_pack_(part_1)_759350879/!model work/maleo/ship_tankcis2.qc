// Created by Crowbar 0.51.0.0

$modelname "ship_tankcis2\ship_tankcis2_servius.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "ship_tankcis2.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "ship_tankcis2\"

$cbox 0 0 0 0 0 0

$bbox -338.669 -152.842 0 383.47 152.842 272.073


$sequence "idle" {
	"ship_tankcis2_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
	loop
}


$collisionmodel "ship_tankcis2_physics.smd"
{
	$automass
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave

}
