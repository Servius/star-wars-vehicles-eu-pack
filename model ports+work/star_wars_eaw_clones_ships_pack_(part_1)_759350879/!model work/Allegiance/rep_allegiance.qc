// Created by Crowbar 0.51.0.0

$modelname "sweaw\ships\rep_Allegiance_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_allegiance_Allegiance.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_Allegiance\"

//$cbox 0 0 0 0 0 0

//$bbox -12177.368 -20034.299 17.375 12177.37 19421.633 10714.373


$sequence "idle" {
	"rep_allegiance_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_allegiance_physics.smd"
{
	$concave
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
