// Created by Crowbar 0.51.0.0

$modelname "sweaw/ships\rep_ntb630_servius.mdl"

$bodygroup "body"
{
	studio "rep_ntb630_ntb630.smd"
}

$origin 0 0 0 180

$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_ntb630\"

$cbox 0 0 0 0 0 0

//$bbox -407.748 -271.622 -0.092 412.142 271.622 171.215


$sequence "idle" {
	"rep_ntb630_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_ntb630_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
