// Created by Crowbar 0.51.0.0

$modelname "swEaW\ships/rep_kdy_longhorn_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_kdy_longhorn_kdy_longhorn.smd"
}
$bodygroup "turretDown"
{
	studio "rep_kdy_longhorn_turretDown.smd"
	blank
}
$bodygroup "turretA"
{
	studio "rep_kdy_longhorn_turretA.smd"
	blank
}
$bodygroup "turretB"
{
	studio "rep_kdy_longhorn_turretB.smd"
	blank
}
$bodygroup "turretC"
{
	studio "rep_kdy_longhorn_turretC.smd"
	blank
}
$bodygroup "turretD"
{
	studio "rep_kdy_longhorn_turretD.smd"
	blank
}
$bodygroup "turretE"
{
	studio "rep_kdy_longhorn_turretE.smd"
	blank
}
$bodygroup "turretF"
{
	studio "rep_kdy_longhorn_turretF.smd"
	blank
}
$bodygroup "turretG"
{
	studio "rep_kdy_longhorn_turretG.smd"
	blank
}
$bodygroup "turretH"
{
	studio "rep_kdy_longhorn_turretH.smd"
	blank
}
$bodygroup "turretI"
{
	studio "rep_kdy_longhorn_turretI.smd"
	blank
}
$bodygroup "turretJ"
{
	studio "rep_kdy_longhorn_turretJ.smd"
	blank
}

$origin -100 0 0 0

$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_kdy_longhorn\"

$cbox 0 0 0 0 0 0

//$bbox -1923.919 -4609.578 -307.061 1939.938 4932.652 2140.733


$sequence "idle" {
	"rep_kdy_longhorn_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_kdy_longhorn_physics.smd"
{
	$mass 70
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
