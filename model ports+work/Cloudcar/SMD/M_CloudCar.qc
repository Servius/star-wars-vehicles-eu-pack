// Created by Crowbar 0.51.0.0

$modelname "servius\ships\cloudcar.mdl"

$bodygroup "body"
{
	studio "M_CloudCar.smd"
}


$surfaceprop "metal"

$contents "solid"

$cdmaterials "models\starwars\servius\cloudcar"

$origin 0 0 0 270

$sequence "idle" {
	"M_CloudCar_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "M_CloudCar_Physics.smd"
{
	$concave
	$automass
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
