// Created by Crowbar 0.51.0.0

$modelname "swEaW\ships/rep_corvette_3rd_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_corvette_3rd_corvette3rd.smd"
}
$bodygroup "turret"
{
	studio "rep_corvette_3rd_turret.smd"
	blank
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_corvette3rd\"

$cbox 0 0 0 0 0 0

//$bbox -671.626 -1167.741 -0.274 672.86 1456.838 634.347


$sequence "idle" {
	"rep_corvette_3rd_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_corvette_3rd_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
