// Created by Crowbar 0.51.0.0

$modelname "swEaW\ships\fo_mediumcruiser_mini.mdl"

$bodygroup "Main"
{
	studio "fo_mediumcruiser_MediumCruiser.smd"
	blank
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 30

$mostlyopaque

$cdmaterials "models\starwars\swEaW\ships\FO_MediumCruiser\"

$cbox 0 0 0 0 0 0

//$bbox -3294.08 -12505.889 -25.236 3283.195 13298.109 3671.893


$sequence "idle" {
	"fo_mediumcruiser_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$collisionmodel "fo_mediumcruiser_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
