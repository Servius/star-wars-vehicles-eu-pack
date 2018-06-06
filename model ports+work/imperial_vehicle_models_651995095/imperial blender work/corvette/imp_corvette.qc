// Created by Crowbar 0.51.0.0

$modelname "swbf3\vehicles\imp_corvette_serviusmini.mdl"

$bodygroup "Body"
{
	studio "imp_corvette_CORVETTE.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 30

$cdmaterials "models\starwars\swbf3\vehicles\imp_CORVETTE\"

$cbox 0 0 0 0 0 0

//$bbox -6351.268 -11022.667 0 6351.269 9201.548 4534.63


$sequence "idle" {
	"imp_corvette_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "imp_corvette_physics.smd"
{
	$automass
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave

}
