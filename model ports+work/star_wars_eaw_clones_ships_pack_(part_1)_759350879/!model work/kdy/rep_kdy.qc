// Created by Crowbar 0.51.0.0

$modelname "swEaW\ships/rep_kdy_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_kdy_kdy.smd"
}
$origin 0 0 0 0

$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_kdy\"

$cbox 0 0 0 0 0 0

//$bbox -4525.204 -10183.018 -4.943 4372.103 10827.36 3701.121


$sequence "idle" {
	"rep_kdy_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_kdy_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
