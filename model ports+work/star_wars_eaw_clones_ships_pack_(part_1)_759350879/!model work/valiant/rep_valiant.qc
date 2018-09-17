// Created by Crowbar 0.51.0.0

$modelname "sweaw/ships\rep_valiant_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_valiant_valiant.smd"
}
$bodygroup "turretsA"
{
	studio "rep_valiant_group_turretsa.smd"
	blank
}
$bodygroup "turretsB"
{
	studio "rep_valiant_group_turretsb.smd"
	blank
}
$bodygroup "turretsC"
{
	studio "rep_valiant_group_turretsc.smd"
	blank
}
$bodygroup "turretsD"
{
	studio "rep_valiant_group_turretsd.smd"
	blank
}
$bodygroup "turretsE"
{
	studio "rep_valiant_group_turretse.smd"
	blank
}
$bodygroup "turretbackA"
{
	studio "rep_valiant_turretbacka.smd"
	blank
}
$bodygroup "turretbackB"
{
	studio "rep_valiant_turretbackb.smd"
	blank
}
$bodygroup "turretAHangarA"
{
	studio "rep_valiant_turretahangara.smd"
	blank
}
$bodygroup "turretAHangarB"
{
	studio "rep_valiant_turretahangarb.smd"
	blank
}
$bodygroup "turretBHangarA"
{
	studio "rep_valiant_turretbhangara.smd"
	blank
}
$bodygroup "turretBHangarB"
{
	studio "rep_valiant_turretbhangarb.smd"
	blank
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_valiant\"

$cbox 0 0 0 0 0 0

//$bbox -5885.539 -14678.502 7.173 5885.54 14362.34 4927.385


$sequence "idle" {
	"rep_valiant_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_valiant_physics.smd"
{
	$mass 70
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
