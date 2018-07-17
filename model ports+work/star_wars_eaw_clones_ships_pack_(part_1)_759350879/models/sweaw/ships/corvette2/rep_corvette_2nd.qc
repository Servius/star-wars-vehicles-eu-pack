// Created by Crowbar 0.51.0.0

$modelname "swEaW\ships/rep_corvette_2nd_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_corvette_2nd_corvette2nd.smd"
}
$bodygroup "turret_frontA"
{
	studio "rep_corvette_2nd_turret_frontA.smd"
	blank
}
$bodygroup "turret_frontB"
{
	studio "rep_corvette_2nd_turret_frontB.smd"
	blank
}
$bodygroup "turretA"
{
	studio "rep_corvette_2nd_turretA.smd"
	blank
}
$bodygroup "turretB"
{
	studio "rep_corvette_2nd_turretB.smd"
	blank
}
$bodygroup "turretC"
{
	studio "rep_corvette_2nd_turretC.smd"
	blank
}
$bodygroup "turretD"
{
	studio "rep_corvette_2nd_turretD.smd"
	blank
}
$bodygroup "turretE"
{
	studio "rep_corvette_2nd_turretE.smd"
	blank
}
$bodygroup "turretF"
{
	studio "rep_corvette_2nd_turretF.smd"
	blank
}
$bodygroup "turretG"
{
	studio "rep_corvette_2nd_turretG.smd"
	blank
}
$bodygroup "turretH"
{
	studio "rep_corvette_2nd_turretH.smd"
	blank
}
$bodygroup "turretI"
{
	studio "rep_corvette_2nd_turretI.smd"
	blank
}
$bodygroup "turretJ"
{
	studio "rep_corvette_2nd_turretJ.smd"
	blank
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_corvette2nd\"

$cbox 0 0 0 0 0 0

//$bbox -634.571 -1181.813 3.545 635.737 1479.962 603.168


$sequence "idle" {
	"rep_corvette_2nd_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_corvette_2nd_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
