// Created by Crowbar 0.51.0.0

$modelname "sweaw/ships\rep_tiefighter_servius.mdl"

$bodygroup "body"
{
	studio "rep_tiefighter_tiefighter.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_tiefighter\"

$cbox 0 0 0 0 0 0

//$bbox -136.175 -152.803 0.001 136.175 154.074 337.147

$origin 0 0 0 180

$sequence "idle" {
	"rep_tiefighter_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "fighter_physics.smd"
{
	$automass
	$concave
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
