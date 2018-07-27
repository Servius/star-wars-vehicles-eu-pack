// Created by Crowbar 0.51.0.0

$modelname "swEaW\ships/rep_lightcruiser_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_lightcruiser_lightcruiser.smd"
}
$bodygroup "turretA"
{
	studio "rep_lightcruiser_turretA.smd"
	blank
}
$bodygroup "turretB"
{
	studio "rep_lightcruiser_turretB.smd"
	blank
}
$bodygroup "turretC"
{
	studio "rep_lightcruiser_turretC.smd"
	blank
}
$bodygroup "turretD"
{
	studio "rep_lightcruiser_turretD.smd"
	blank
}
$bodygroup "turretE"
{
	studio "rep_lightcruiser_turretE.smd"
	blank
}
$bodygroup "turretF"
{
	studio "rep_lightcruiser_turretF.smd"
	blank
}
$bodygroup "turretF"
{
	studio "rep_lightcruiser_turretF_2.smd"
	blank
}

$origin 0 0 0 180

$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_lightcruiser\"

$cbox 0 0 0 0 0 0

//$bbox -2125.632 -4564.226 0.078 2123.821 5032.843 1774.74


$sequence "idle" {
	"rep_lightcruiser_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_lightcruiser_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
