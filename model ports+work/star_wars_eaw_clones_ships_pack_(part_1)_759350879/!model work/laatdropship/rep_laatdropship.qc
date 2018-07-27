// Created by Crowbar 0.51.0.0

$modelname "sweaw\ships\rep_LaatDropship_serviusbmini.mdl"

$bodygroup "body"
{
	studio "rep_laatdropship_LaatDropship.smd"
}
$bodygroup "LaatA"
{
	studio "rep_laatdropship_LaatA.smd"
	blank
}
$bodygroup "LaatB"
{
	studio "rep_laatdropship_LaatB.smd"
	blank
}

$origin 0 0 0 180

$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_LaatDropship\"

$cbox 0 0 0 0 0 0

//$bbox -348.72 -988.094 -0.724 347.756 772.953 647.086


$sequence "idle" {
	"rep_laatdropship_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_laatdropship_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
