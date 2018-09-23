// Created by Crowbar 0.51.0.0

$modelname "servius\ships\consular_chargerc70_turretrear_barrel.mdl"

$bodygroup "body"
{
	studio "consular_chargerc70_turretrear_barrel.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\c70\"

//$cbox 0 0 0 0 0 0

//$bbox -12177.368 -20034.299 17.375 12177.37 19421.633 10714.373

$origin 0 0 0 90


$sequence "idle" {
	"consular_chargerc70_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "consular_chargerc70_turretrear_barrel.smd"
{
	$concave
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
