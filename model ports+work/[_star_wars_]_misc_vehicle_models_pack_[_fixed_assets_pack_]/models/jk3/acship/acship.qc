// Created by Crowbar 0.51.0.0

$modelname "JK3/AcShip_servius.mdl"

$bodygroup "studio"
{
	studio "AcShip.smd"
}


$surfaceprop "Metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\JK3_Ports\Acs\"

$cbox 0 0 0 0 0 0

//$bbox -475.679 -345.974 -131.258 1007.29 346.362 198.262

// $hboxset "default"

$origin 0 0 0 270

$sequence "idle1" {
	"acship_anims\idle1.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$collisionmodel "acship_physics.smd"
{
	$mass 100
	$inertia 10
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave

}
