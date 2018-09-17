// Created by Crowbar 0.51.0.0

$modelname "sweaw\ships\rep_veragitor_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_veragitor_veragitor.smd"
}
$bodygroup "turretA"
{
	studio "rep_veragitor_turreta.smd"
	blank
}
$bodygroup "turretB"
{
	studio "rep_veragitor_turretb.smd"
	blank
}
$bodygroup "turretC"
{
	studio "rep_veragitor_turretc.smd"
	blank
}
$bodygroup "turretD"
{
	studio "rep_veragitor_turretd.smd"
	blank
}
$bodygroup "turretB1"
{
	studio "rep_veragitor_turretb1.smd"
	blank
}
$bodygroup "turretB2"
{
	studio "rep_veragitor_turretb2.smd"
	blank
}
$bodygroup "turretB3"
{
	studio "rep_veragitor_turretb3.smd"
	blank
}
$bodygroup "turretC1"
{
	studio "rep_veragitor_turretc1.smd"
	blank
}
$bodygroup "turretC2"
{
	studio "rep_veragitor_turretc2.smd"
	blank
}
$bodygroup "turretC3"
{
	studio "rep_veragitor_turretc3.smd"
	blank
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_veragitor\"

$cbox 0 0 0 0 0 0

//$bbox -13409.91 -35282.195 13.364 13409.912 28066.645 10928.942


$sequence "idle" {
	"rep_veragitor_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_veragitor_physics.smd"
{
	$mass 70
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
