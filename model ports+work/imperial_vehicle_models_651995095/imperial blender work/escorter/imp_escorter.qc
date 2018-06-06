// Created by Crowbar 0.51.0.0

$modelname "swbf3\vehicles\imp_escorter_serviusmini.mdl"

$bodygroup "Body"
{
	studio "imp_escorter_ESCORTER.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "models\starwars\swbf3\vehicles\imp_ESCORTER\"

$cbox 0 0 0 0 0 0

//$bbox -4342.871 -11446.229 0 4365.747 13233.9 5867.799


$sequence "idle" {
	"imp_escorter_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "imp_escorter_physics.smd"
{
	$automass
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave

}
