// Created by Crowbar 0.51.0.0

$modelname "swbf3\vehicles\imp_gozanti_serviusmini.mdl"

$bodygroup "Body"
{
	studio "imp_gozanti_GOZANTI.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 30

$cdmaterials "models\starwars\swbf3\vehicles\imp_GOZANTI\"

$cbox 0 0 0 0 0 0

//$bbox -481.508 -1164.77 0 483.157 1307.877 528.48


$sequence "idle" {
	"imp_gozanti_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "imp_gozanti_physics.smd"
{
	$automass
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave

}
