// Created by Crowbar 0.51.0.0

$modelname "sweaw\ships\rep_Strident_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_strident_Strident.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_Strident\"

$cbox 0 0 0 0 0 0

$origin 0 0 0 0

//$bbox -5866.002 -15876.82 -0.11 6123.415 15077.55 9142.026


$sequence "idle" {
	"rep_strident_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_strident_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
