// Created by Crowbar 0.51.0.0

$modelname "swbf3\vehicles\reb_snowspeeder_servius.mdl"

$bodygroup "ship"
{
	studio "reb_snowspeeder_snowspeeder.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swbf3\vehicles\reb_snowspeeder\"

$cbox 0 0 0 0 0 0

$bbox -165.796 -152.621 -0.34 167.448 152.503 85.075


$sequence "idle" {
	"reb_snowspeeder_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "reb_snowspeeder_physics.smd"
{
	$mass 20
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone "root"
	$concave

}

$KeyValues
{
	prop_data 
	{
		"base" "metal.Small"
	}
}
