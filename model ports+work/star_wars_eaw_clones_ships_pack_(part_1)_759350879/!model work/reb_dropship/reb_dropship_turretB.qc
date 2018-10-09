// Created by Crowbar 0.51.0.0

$modelname "swbf3\vehicles\reb_dropship_turretB.mdl"

$bodygroup "Body"
{
	studio "reb_dropship_turretB.smd"
}



$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swbf3\vehicles\reb_laat\"

$cbox 0 0 0 0 0 0

$origin 0 0 0 180

//$bbox -498.077 -372.266 -1.003 498.077 370.156 325.351


$sequence "idle" {
	"reb_dropship_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "reb_dropship_turretB.smd"
{
	$automass
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave

}
