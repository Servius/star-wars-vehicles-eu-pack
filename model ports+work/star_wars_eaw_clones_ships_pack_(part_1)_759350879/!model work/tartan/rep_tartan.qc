// Created by Crowbar 0.51.0.0

$modelname "sweaw\ships\rep_Tartan_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_tartan_Tartan.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_Tartan\"

$cbox 0 0 0 0 0 0

//$bbox -497.395 -1176.58 2.609 497.395 1217.958 790.508

$origin 0 0 0 180

$sequence "idle" {
	"rep_tartan_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_tartan_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
