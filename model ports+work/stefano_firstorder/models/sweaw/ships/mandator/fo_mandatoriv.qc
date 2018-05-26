// Created by Crowbar 0.51.0.0

$modelname "swEaW\ships\FO_MandatorIV.mdl"

$bodygroup "Main"
{
	studio "fo_mandatoriv_MandatorIV.smd"
	blank
}
$bodygroup "Turrets"
{
	studio "fo_mandatoriv_Turrets.smd"
	blank
}
$bodygroup "Cannons"
{
	studio "fo_mandatoriv_Cannons.smd"
	blank
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$mostlyopaque

$cdmaterials "models\starwars\swEaW\ships\FO_MandatorIV\"

$cbox 0 0 0 0 0 0

$bbox -1000 -1000 -13.691 1000.625 1000.781 1000.666


$sequence "idle" {
	"fo_mandatoriv_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$collisionmodel "fo_mandatoriv_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
