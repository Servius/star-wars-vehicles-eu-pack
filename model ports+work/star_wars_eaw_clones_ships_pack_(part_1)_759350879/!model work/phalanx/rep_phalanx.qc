// Created by Crowbar 0.51.0.0

$modelname "swEaW\ships\rep_phalanx_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_phalanx_phalanx.smd"
}
$bodygroup "turretA1"
{
	studio "rep_phalanx_turreta1.smd"
	blank
}
$bodygroup "turretA2"
{
	studio "rep_phalanx_turreta2.smd"
	blank
}
$bodygroup "turretB1"
{
	studio "rep_phalanx_turretb1.smd"
	blank
}
$bodygroup "turretB2"
{
	studio "rep_phalanx_turretb2.smd"
	blank
}
$bodygroup "turretC1"
{
	studio "rep_phalanx_turretc1.smd"
	blank
}
$bodygroup "turretC2"
{
	studio "rep_phalanx_turretc2.smd"
	blank
}
$bodygroup "turretC3"
{
	studio "rep_phalanx_turretc3.smd"
	blank
}
$bodygroup "turretC4"
{
	studio "rep_phalanx_turretc4.smd"
	blank
}
$bodygroup "turretC5"
{
	studio "rep_phalanx_turretc5.smd"
	blank
}
$bodygroup "turretC6"
{
	studio "rep_phalanx_turretc6.smd"
	blank
}

$origin 0 0 0 180

$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_phalanx\"

$cbox 0 0 0 0 0 0

//$bbox -2142.434 -4419.188 -3.221 2142.434 4927.653 1421.039


$sequence "idle" {
	"rep_phalanx_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_phalanx_physics.smd"
{
	$mass 70
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
