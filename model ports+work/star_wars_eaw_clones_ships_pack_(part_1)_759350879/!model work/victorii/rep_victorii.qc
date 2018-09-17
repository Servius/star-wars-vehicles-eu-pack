// Created by Crowbar 0.51.0.0

$modelname "sweaw\ships\rep_VictorII_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_victorii_VictorII.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_VictorII\"

$cbox 0 0 0 0 0 0

//$bbox -4964.283 -5469.003 -8.308 4964.284 6255.136 2349.818


$sequence "idle" {
	"rep_victorii_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_victorii_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
