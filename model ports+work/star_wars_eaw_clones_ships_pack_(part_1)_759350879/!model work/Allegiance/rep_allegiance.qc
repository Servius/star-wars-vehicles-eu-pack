// Created by Crowbar 0.51.0.0

$modelname "DBARC\DBARC1.mdl"

$bodygroup "body"
{
	studio "barc1_BARC.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "DBARC\"

//$cbox 0 0 0 0 0 0

//$bbox -12177.368 -20034.299 17.375 12177.37 19421.633 10714.373


$sequence "idle" {
	"barc1_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "barc1_physics.smd"
{
	$mass 1
	$inertia 1
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
