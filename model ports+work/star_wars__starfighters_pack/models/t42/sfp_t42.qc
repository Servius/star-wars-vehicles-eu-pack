// Created by Crowbar 0.51.0.0

$modelname "sfp_t42\sfp_t42.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_t42.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_t42\"

$cbox 0 0 0 0 0 0

$bbox -151.496 -208.947 -41.287 151.496 208.947 30.406


$sequence "idle" {
	"sfp_t42_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_t42_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
