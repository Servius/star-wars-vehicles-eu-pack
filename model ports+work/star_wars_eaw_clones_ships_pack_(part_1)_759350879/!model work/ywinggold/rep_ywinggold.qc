// Created by Crowbar 0.51.0.0

$modelname "sweaw/ships\rep_ywinggold_servius.mdl"

$bodygroup "body"
{
	studio "rep_ywinggold_ywinggold.smd"
}
$bodygroup "droid"
{
	studio "rep_ywinggold_droid.smd"
	blank
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_ywinggold\"

$cbox 0 0 0 0 0 0

//$bbox -181.839 -440.844 0.433 181.938 400.629 89.712


$sequence "idle" {
	"rep_ywinggold_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_ywinggold_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
