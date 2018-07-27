// Created by Crowbar 0.51.0.0

$modelname "swEaW\ships/rep_NabooCruiser.mdl"

$bodygroup "body"
{
	studio "rep_naboocruiser_NabooCruiser.smd"
}

$origin 0 0 0 0

$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_NabooCruiser\"

$cbox 0 0 0 0 0 0

$bbox -1465.446 -617.84 0.986 1464.375 586.807 210.657


$sequence "idle" {
	"rep_naboocruiser_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_naboocruiser_physics.smd"
{
	$mass 70
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
