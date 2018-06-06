// Created by Crowbar 0.51.0.0

$modelname "swbf3\vehicles\imp_imperator_serviusmini.mdl"

$bodygroup "Body"
{
	studio "imp_imperator_imperator.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 30

$cdmaterials "models\starwars\swbf3\vehicles\imp_imperator\"

$cbox 0 0 0 0 0 0

//$bbox -9777.837 -15792.485 0 9778.39 15926.944 9092.603


$sequence "idle" {
	"imp_imperator_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "imp_imperator_physics.smd"
{
	$automass
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave

}
