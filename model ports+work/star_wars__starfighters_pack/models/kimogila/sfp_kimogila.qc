// Created by Crowbar 0.51.0.0

$modelname "sfp_kimogila\sfp_kimogila.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_kimogila.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_kimogila\"

$cbox 0 0 0 0 0 0

$bbox -423.829 -393.517 -116.679 385.037 393.517 130.556


$sequence "idle" {
	"sfp_kimogila_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_kimogila_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
