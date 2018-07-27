// Created by Crowbar 0.51.0.0

$modelname "sweaw/ships\rep_pelta_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_pelta_pelta.smd"
}

$origin 0 0 0 180

$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_pelta\"

$cbox 0 0 0 0 0 0

//$bbox -364.486 -1219.279 -0.553 365.6 1248.739 664.78


$sequence "idle" {
	"rep_pelta_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_pelta_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
