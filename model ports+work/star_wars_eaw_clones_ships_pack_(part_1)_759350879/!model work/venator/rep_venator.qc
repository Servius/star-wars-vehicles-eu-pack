// Created by Crowbar 0.51.0.0

$modelname "sweaw\ships\rep_venator_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_venator_venator.smd"
}
$bodygroup "turretA1"
{
	studio "rep_venator_turreta1.smd"
	blank
}
$bodygroup "turretA2"
{
	studio "rep_venator_turreta2.smd"
	blank
}
$bodygroup "turretB1"
{
	studio "rep_venator_turretb1.smd"
	blank
}
$bodygroup "turretB2"
{
	studio "rep_venator_turretb2.smd"
	blank
}
$bodygroup "turretC1"
{
	studio "rep_venator_turretc1.smd"
	blank
}
$bodygroup "turretC2"
{
	studio "rep_venator_turretc2.smd"
	blank
}
$bodygroup "turretD1"
{
	studio "rep_venator_turretd1.smd"
	blank
}
$bodygroup "turretD2"
{
	studio "rep_venator_turretd2.smd"
	blank
}
$bodygroup "turretE"
{
	studio "rep_venator_turrete.smd"
	blank
}
$bodygroup "turretF"
{
	studio "rep_venator_turretf.smd"
	blank
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_venator\"

$cbox 0 0 0 0 0 0

//$bbox -7005.806 -15588.94 -185.441 7005.801 15057.997 6678.851


$sequence "idle" {
	"rep_venator_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_venator_physics.smd"
{
	$mass 70
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
