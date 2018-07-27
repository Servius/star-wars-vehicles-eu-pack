// Created by Crowbar 0.51.0.0

$modelname "swEaW\ships/rep_alligator_servius.mdl"

$bodygroup "body"
{
	studio "rep_alligator_Alligator.smd"
}
$bodygroup "droid"
{
	studio "rep_alligator_droid.smd"
	blank
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_alligator\"

//$cbox 0 0 0 0 0 0

//$bbox -139.613 -131.709 -0.098 153.491 131.709 56.199


$sequence "idle" {
	"rep_alligator_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_alligator_physics.smd"
{
	$automass
	$concave
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
