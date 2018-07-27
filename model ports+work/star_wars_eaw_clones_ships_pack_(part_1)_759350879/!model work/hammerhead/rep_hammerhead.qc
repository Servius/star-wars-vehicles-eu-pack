// Created by Crowbar 0.51.0.0

$modelname "swEaW\ships/rep_Hammerhead_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_hammerhead_Hammerhead.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_Hammerhead\"

$cbox 0 0 0 0 0 0

//$bbox -2268.559 -5300.121 12.838 2300.964 4648.535 4323.126


$sequence "idle" {
	"rep_hammerhead_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_hammerhead_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
