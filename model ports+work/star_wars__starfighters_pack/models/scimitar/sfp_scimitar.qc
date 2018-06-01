// Created by Crowbar 0.51.0.0

$modelname "sfp_scimitar\sfp_scimitar.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_scimitar.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_scimitar\"

$cbox 0 0 0 0 0 0

$bbox -164.634 -78.5 -39.413 164.634 78.5 39.413


$sequence "idle" {
	"sfp_scimitar_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_scimitar_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
