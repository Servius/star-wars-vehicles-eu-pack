// Created by Crowbar 0.51.0.0

$modelname "sweaw\ships\rep_guardsman_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_guardsman_guardsman.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_guardsman\"

$cbox 0 0 0 0 0 0

//$bbox -3661.563 -4636.318 -36.897 3661.562 4926.513 1810.875


$sequence "idle" {
	"rep_guardsman_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_guardsman_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
