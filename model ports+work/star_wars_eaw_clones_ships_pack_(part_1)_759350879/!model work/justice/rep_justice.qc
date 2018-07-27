// Created by Crowbar 0.51.0.0

$modelname "sweaw\ships\rep_justice_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_justice_justice.smd"
}

$origin 0 0 0 0
$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_justice\"

$cbox 0 0 0 0 0 0

//$bbox -7603.771 -20782.316 -1.747 7603.769 19235.01 6822.848


$sequence "idle" {
	"rep_justice_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_justice_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
