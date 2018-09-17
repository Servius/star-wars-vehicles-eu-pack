// Created by Crowbar 0.51.0.0

$modelname "sweaw/ships\rep_z95_servius.mdl"

$bodygroup "body"
{
	studio "rep_z95_z95.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_z95\"

$cbox 0 0 0 0 0 0

//$bbox -354.998 -299.456 6.39 354.998 308.501 92.407

$origin 0 0 0 180

$sequence "idle" {
	"rep_z95_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_z95_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
