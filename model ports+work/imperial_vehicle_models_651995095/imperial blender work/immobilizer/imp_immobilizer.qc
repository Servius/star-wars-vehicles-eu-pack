// Created by Crowbar 0.51.0.0

$modelname "swbf3\vehicles\imp_immobilizer_serviusmini.mdl"

$bodygroup "swbf"
{
	studio "IMP_IMMOBILIZER.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 30

$mostlyopaque

$cdmaterials "models\starwars\swbf3\vehicles\IMP_IMMOBILIZER\"

$cbox 0 0 0 0 0 0

//$bbox -99.6 -73.602 0.041 108.677 74.547 296.58


$sequence "idle" {
	"imp_immobilizer_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionjoints "imp_immobilizer_physics.smd"
{
	$automass
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone "root"
	$concave

}
