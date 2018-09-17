// Created by Crowbar 0.51.0.0

$modelname "sweaw/ships\rep_valiant2nd_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_valiant2nd_valiant.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_valiant2nd\"

$cbox 0 0 0 0 0 0

//$bbox -6899.282 -15065.553 -20.069 6899.285 15083.534 5632.127


$sequence "idle" {
	"rep_valiant2nd_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_valiant2nd_physics.smd"
{
	$mass 70
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
