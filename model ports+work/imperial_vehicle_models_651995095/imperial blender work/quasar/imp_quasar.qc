// Created by Crowbar 0.51.0.0

$modelname "swbf3\vehicles\imp_quasar_serviusmini.mdl"

$bodygroup "body"
{
	studio "imp_quasar_quasar.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 30

$cdmaterials "models\starwars\swbf3\vehicles\imp_quasar\"

$cbox 0 0 0 0 0 0

//$bbox -8351.562 -12464.897 37.808 8351.569 12100.082 3318.779


$sequence "idle" {
	"imp_quasar_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "imp_quasar_physics.smd"
{
	$automass
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave

}
