// Created by Crowbar 0.51.0.0

$modelname "sweaw/ships\rep_carrack_servius.mdl"

$bodygroup "body"
{
	studio "rep_carrack_carrack.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_carrack\"

//$cbox 0 0 0 0 0 0

//$bbox -280.285 -1346.552 -2.497 280.285 1412.592 542.242


$sequence "idle" {
	"rep_carrack_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_carrack_physics.smd"
{
	$automass
	//$inertia 10
	//$damping 0
	//$rotdamping 8
	$rootbone "root"

}
