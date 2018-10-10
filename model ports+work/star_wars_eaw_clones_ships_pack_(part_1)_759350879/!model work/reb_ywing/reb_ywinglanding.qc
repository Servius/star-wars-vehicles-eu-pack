// Created by Crowbar 0.51.0.0

$modelname "swbf3\vehicles\reb_YWinglanding_servius.mdl"

$bodygroup "Body"
{
	studio "reb_ywinglanding_ywing.smd"
}
$bodygroup "droid"
{
	studio "reb_ywing_droid.smd"
	blank
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$origin 0 0 0 270

$cdmaterials "models\starwars\swbf3\vehicles\reb_ywing\"

$cbox 0 0 0 0 0 0

//$bbox -276.32 -523.279 -0.07 279.604 519.615 173.691


$sequence "idle" {
	"reb_ywing_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "reb_ywinglanding_physics.smd"
{
	$concave
	$mass 800
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave

}
