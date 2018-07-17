// Created by Crowbar 0.51.0.0

$modelname "swEaW\ships/rep_corvette_1st_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_corvette_1st_corvette1st.smd"
}
$bodygroup "turret_back"
{
	studio "rep_corvette_1st_turret_back.smd"
	blank
}
$bodygroup "turret_front"
{
	studio "rep_corvette_1st_turret_front.smd"
	blank
}
$bodygroup "turretA"
{
	studio "rep_corvette_1st_turretA.smd"
	blank
}
$bodygroup "turretB"
{
	studio "rep_corvette_1st_turretB.smd"
	blank
}
$bodygroup "turretC"
{
	studio "rep_corvette_1st_turretC.smd"
	blank
}
$bodygroup "turretD"
{
	studio "rep_corvette_1st_turretD.smd"
	blank
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_corvette1st\"

$cbox 0 0 0 0 0 0

//$bbox -736.633 -1195.543 5.275 738.599 1282.672 583.36


$sequence "idle" {
	"rep_corvette_1st_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_corvette_1st_physics.smd"
{
	$mass 70
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
