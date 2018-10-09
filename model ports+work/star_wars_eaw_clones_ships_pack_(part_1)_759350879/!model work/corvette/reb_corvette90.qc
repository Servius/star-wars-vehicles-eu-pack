// Created by Crowbar 0.51.0.0

$modelname "swbf3\vehicles\reb_corvette90_servius.mdl"

$bodygroup "ship"
{
	studio "reb_corvette90_corvette.smd"
}
$bodygroup "antenna"
{
	studio "reb_corvette90_antenna.smd"
	blank
}
$bodygroup "turret_sidaA"
{
	studio "reb_corvette90_turret_sidaA.smd"
	blank
}
$bodygroup "turret_sidaB"
{
	studio "reb_corvette90_turret_sidaB.smd"
	blank
}
$bodygroup "turret_frontA"
{
	studio "reb_corvette90_turret_frontA.smd"
	blank
}
$bodygroup "turret_frontB"
{
	studio "reb_corvette90_turret_frontB.smd"
	blank
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swbf3\vehicles\reb_corvette\"

$cbox 0 0 0 0 0 0

//$bbox -886.985 -3166.42 -467.231 2155.565 4283.231 736.295


$sequence "idle" {
	"reb_corvette90_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$collisionmodel "reb_corvette90_physics.smd"
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
