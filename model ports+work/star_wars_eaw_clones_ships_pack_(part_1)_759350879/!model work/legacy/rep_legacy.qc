// Created by Crowbar 0.51.0.0

$modelname "swEaW\ships\rep_legacy_serviusmini.mdl"

$bodygroup "turret"
{
	studio "rep_legacy_legacy.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_legacy\"

$cbox 0 0 0 0 0 0

//$bbox -6987.993 -16128.248 -1.37 7082.24 14096.184 8063.976


$sequence "idle" {
	"rep_legacy_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_legacy_physics.smd"
{
	$automass
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave

}
