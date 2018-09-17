// Created by Crowbar 0.51.0.0

$modelname "sweaw\ships\rep_rsdmk1_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_rsdmk1_rsdmk1.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_rsdmk1\"

$cbox 0 0 0 0 0 0

//$bbox -8517.106 -14991.106 30.068 8534.744 14991.61 9396.036


$sequence "idle" {
	"rep_rsdmk1_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_rsdmk1_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
