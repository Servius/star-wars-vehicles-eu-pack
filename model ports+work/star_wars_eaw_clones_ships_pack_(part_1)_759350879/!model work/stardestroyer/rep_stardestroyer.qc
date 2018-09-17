// Created by Crowbar 0.51.0.0

$modelname "sweaw\ships\rep_StarDestroyer_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_stardestroyer_Repstardestroyer.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_rsd\"

$cbox 0 0 0 0 0 0

$origin 0 0 0 90

//$bbox -9693.651 -16518.053 41.625 9693.652 14884.003 9064.435


$sequence "idle" {
	"rep_stardestroyer_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_stardestroyer_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
