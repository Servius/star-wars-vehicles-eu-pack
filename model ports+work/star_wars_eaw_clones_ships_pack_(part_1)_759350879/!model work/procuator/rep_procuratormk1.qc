// Created by Crowbar 0.51.0.0

$modelname "swEaW\ships/rep_procuratorMK1_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_procuratormk1_procurator.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_procuratorMK1\"

$cbox 0 0 0 0 0 0

//$bbox -1689.401 -7469.944 46.274 1689.651 7469.945 5079.892


$sequence "idle" {
	"rep_procuratormk1_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_procuratormk1_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
