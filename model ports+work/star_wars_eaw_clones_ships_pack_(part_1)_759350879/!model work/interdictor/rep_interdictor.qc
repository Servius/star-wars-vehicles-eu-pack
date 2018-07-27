// Created by Crowbar 0.51.0.0

$modelname "swEaW\ships/rep_interdictor_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_interdictor_interdictor.smd"
}

$origin 0 0 0 0

$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_interdictor\"

$cbox 0 0 0 0 0 0

//$bbox -2385.686 -4827.081 5.359 2385.689 4820.302 2141.951


$sequence "idle" {
	"rep_interdictor_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_interdictor_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
