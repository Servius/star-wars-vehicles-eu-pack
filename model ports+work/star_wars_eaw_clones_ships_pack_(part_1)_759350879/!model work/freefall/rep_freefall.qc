// Created by Crowbar 0.51.0.0

$modelname "swEaW\ships/rep_freefall_servius.mdl"

$bodygroup "body"
{
	studio "rep_freefall_freefall.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_freefall\"

$cbox 0 0 0 0 0 0

//$bbox -88.015 -215.215 -0.155 105.332 215.602 83.466


$sequence "idle" {
	"rep_freefall_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_freefall_physics.smd"
{
	$automass
	$concave
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}