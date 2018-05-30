// Created by Crowbar 0.51.0.0

$modelname "swEaW\ships\fo_interdictor_mini.mdl"

$bodygroup "Main"
{
	studio "fo_interdictor_Interdictor.smd"
	blank
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 30

$mostlyopaque

$cdmaterials "models\starwars\swEaW\ships\FO_Interdictor\"

$cbox 0 0 0 0 0 0

//$bbox -1663.395 -6314.2 14.176 1645.417 6009.143 1998.523


$sequence "idle" {
	"fo_interdictor_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$collisionmodel "fo_interdictor_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
