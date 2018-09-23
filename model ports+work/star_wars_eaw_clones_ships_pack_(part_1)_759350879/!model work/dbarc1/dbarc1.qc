// Created by Crowbar 0.51.0.0

$modelname "DBARC\DBARC1.mdl"

$bodygroup "body"
{
	studio "dbarc1_BARC.smd"
}


$surfaceprop "metal"

$contents "solid"


$cdmaterials "DBARC\"

$origin 0 0 0 -90

$sequence "idle" {
	"barc1_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "dbarc1_physics.smd"
{
	$mass 1
	$inertia 11
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
