// Created by Crowbar 0.51.0.0

$modelname "swbf3\vehicles\reb_millenniumfalcon_flight.mdl"

$bodygroup "Body"
{
	studio "reb_millenniumfalcon_reference2.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swbf3\vehicles\reb_milleniumfalcon\"

$cbox 0 0 0 0 0 0

//$bbox -503.853 -625.382 -0.503 740.078 617.57 378.239

$origin 0 0 0 270

$sequence "idle" {
	"reb_millenniumfalcon_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "reb_millenniumfalcon_physics.smd"
{
	$concave
	$mass 800
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave

}
