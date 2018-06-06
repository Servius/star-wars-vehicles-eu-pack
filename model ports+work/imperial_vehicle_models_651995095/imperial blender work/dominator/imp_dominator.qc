// Created by Crowbar 0.51.0.0

$modelname "swbf3\vehicles\imp_dominator_serviusmini.mdl"

$bodygroup "Body"
{
	studio "imp_dominator_DOMINATOR.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 30

$cdmaterials "models\starwars\swbf3\vehicles\imp_DOMINATOR\"

$cbox 0 0 0 0 0 0

//$bbox -7551.989 -12238.016 -2060.199 7544.112 13233.8 6998.096


$sequence "idle" {
	"imp_dominator_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "imp_dominator_physics.smd"
{
	$automass
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave

}
