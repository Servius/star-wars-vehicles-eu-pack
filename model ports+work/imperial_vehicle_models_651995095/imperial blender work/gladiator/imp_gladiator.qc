// Created by Crowbar 0.51.0.0

$modelname "swbf3\vehicles\imp_gladiator_serviusmini.mdl"

$bodygroup "Body"
{
	studio "imp_gladiator_gladiator.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 30

$cdmaterials "models\starwars\swbf3\vehicles\imp_gladiator\"

$cbox 0 0 0 0 0 0

//$bbox -7019.228 -9634.465 -145.678 7089.73 11840.841 6470.861


$sequence "idle" {
	"imp_gladiator_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "imp_gladiator_physics.smd"
{
	$automass
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave

}
