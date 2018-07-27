// Created by Crowbar 0.51.0.0

$modelname "swEaW\ships\rep_Imperator_servius.mdl"

$bodygroup "turret"
{
	studio "rep_imperator_Imperator.smd"
}

//$origin 0 0 0 0
$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_Imperator\"

$cbox 0 0 0 0 0 0

//$bbox -8539.613 -13030.195 -33.266 8517.327 13061.026 8012.067


$sequence "idle" {
	"rep_imperator_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_imperator_physics.smd"
{
	$mass 800
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave

}
