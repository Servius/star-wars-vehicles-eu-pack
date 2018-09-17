// Created by Crowbar 0.51.0.0

$modelname "sweaw\ships\rep_protector_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_protector_protector.smd"
}
$bodygroup "turretA"
{
	studio "rep_protector_turretA.smd"
	blank
}
$bodygroup "turretB"
{
	studio "rep_protector_turretB.smd"
	blank
}
$bodygroup "turretC"
{
	studio "rep_protector_turretC.smd"
	blank
}
$bodygroup "turretD"
{
	studio "rep_protector_turretD.smd"
	blank
}
$bodygroup "turretE"
{
	studio "rep_protector_turretE.smd"
	blank
}
$bodygroup "turretF"
{
	studio "rep_protector_turretF.smd"
	blank
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_protector\"

$texturegroup "skinfamilies"
{
	{ "REP_Protector"  }
	{ "REP_Protector1" }
}

$cbox 0 0 0 0 0 0

//$bbox -6449.785 -15119.586 -13.436 6670.679 14970.061 6005.06


$sequence "idle" {
	"rep_protector_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_protector_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
