// Created by Crowbar 0.51.0.0

$modelname "sweaw\ships\rep_dreadnought_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_dreadnought_dreadnought.smd"
}
$bodygroup "antennaA"
{
	studio "rep_dreadnought_antennaA.smd"
	blank
}
$bodygroup "antennaB"
{
	studio "rep_dreadnought_antennaB.smd"
	blank
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_dreadnought\"

$cbox 0 0 0 0 0 0

//$bbox -843.474 -4527.227 -4.337 843.443 5314.796 1628.204


$sequence "idle" {
	"rep_dreadnought_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_dreadnought_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
