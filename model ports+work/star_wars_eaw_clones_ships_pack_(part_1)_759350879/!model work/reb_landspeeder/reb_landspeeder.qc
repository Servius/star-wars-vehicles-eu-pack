// Created by Crowbar 0.51.0.0

$modelname "swbf3\vehicles\reb_landspeeder_servius.mdl"

$bodygroup "Body"
{
	studio "reb_landspeeder_landspeeder.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swbf3\vehicles\reb_landspeeder\"

$cbox 0 0 0 0 0 0

//$bbox -89.965 -66.064 0.177 98.243 66.064 55.138

$origin 0 0 0 270

$sequence "idle" {
	"reb_landspeeder_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "reb_landspeeder_physics.smd"
{
	$concave
	$mass 10
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave

}
