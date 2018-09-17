// Created by Crowbar 0.51.0.0

$modelname "sweaw/ships\rep_ywing_proto_servius.mdl"

$bodygroup "body"
{
	studio "rep_ywing-proto_ywing-proto.smd"
}
$bodygroup "droid"
{
	studio "rep_ywing-proto_droid.smd"
	blank
}
$bodygroup "turret"
{
	studio "rep_ywing-proto_turret.smd"
	blank
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_ywing-proto\"

$cbox 0 0 0 0 0 0

//$bbox -193.203 -440.322 -0.153 193.188 424.073 114.426


$sequence "idle" {
	"rep_ywing-proto_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_ywing-proto_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
