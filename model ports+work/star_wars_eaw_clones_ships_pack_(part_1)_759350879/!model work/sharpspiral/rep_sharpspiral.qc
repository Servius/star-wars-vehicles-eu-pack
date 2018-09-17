// Created by Crowbar 0.51.0.0

$modelname "sweaw/ships\rep_sharpspiral_servius.mdl"

$bodygroup "body"
{
	studio "rep_sharpspiral_sharpspiral.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_sharpspiral\"

$cbox 0 0 0 0 0 0

$origin 0 0 0 180

//$bbox -162.704 -204.863 0.02 162.704 258.759 105.23


$sequence "idle" {
	"rep_sharpspiral_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_sharpspiral_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
