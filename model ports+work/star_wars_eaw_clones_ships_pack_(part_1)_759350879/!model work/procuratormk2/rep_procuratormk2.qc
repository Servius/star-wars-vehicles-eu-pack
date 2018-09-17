// Created by Crowbar 0.51.0.0

$modelname "swEaW\ships/rep_procuratorMK2_serviusmini.mdl"

$bodygroup "body"
{
	studio "rep_procuratormk2_procuratorMK2.smd"
}


$surfaceprop "metal"

$contents "solid"

//$maxeyedeflection 90

$cdmaterials "models\starwars\swEaW\ships\rep_procuratorMK2\"

$cbox 0 0 0 0 0 0

//$bbox -1689.401 -8958.708 -23.512 1689.654 8013.166 5010.106


$sequence "idle" {
	"rep_procuratormk2_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "rep_procuratormk2_physics.smd"
{
	$automass
	$inertia 10
	$damping 0
	$rotdamping 8
	$rootbone "root"

}
