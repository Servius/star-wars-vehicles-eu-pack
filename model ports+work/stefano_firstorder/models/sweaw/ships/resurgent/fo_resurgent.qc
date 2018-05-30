// Created by Crowbar 0.51.0.0

$modelname "swEaW\ships\fo_resurgent_mini.mdl"

$bodygroup "Main"
{
	studio "fo_resurgent_Resurgent.smd"
	blank
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 30

$mostlyopaque

$cdmaterials "models\starwars\swEaW\ships\FO_Resurgent\"

$cbox 0 0 0 0 0 0

//$bbox -1907.158 -3310.455 -0.21 1907.158 2912.486 1925.898


$sequence "idle" {
	"fo_resurgent_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$collisionmodel "fo_resurgent_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
