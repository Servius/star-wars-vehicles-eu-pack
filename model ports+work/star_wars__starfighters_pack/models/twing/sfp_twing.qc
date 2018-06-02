// Created by Crowbar 0.51.0.0

$modelname "sfp_twing\sfp_twing.mdl"

$staticprop

$bodygroup "mybody"
{
	studio "sfp_twing.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "sfp_twing\"

$cbox 0 0 0 0 0 0

$bbox -156.173 -104.116 -64.609 132.97 104.116 63.378


$sequence "idle" {
	"sfp_twing_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "sfp_twing_physics.smd"
{
	$mass 0.5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
