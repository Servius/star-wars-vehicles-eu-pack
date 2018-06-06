// Created by Crowbar 0.51.0.0

$modelname "swbf3\vehicles\imp_adjudicator_serviusmini.mdl"

$bodygroup "Body"
{
	studio "imp_adjudicator_ADJUDICATOR.smd"
}


$surfaceprop "metal"

$contents "solid"

$maxeyedeflection 30

$cdmaterials "models\starwars\swbf3\vehicles\imp_ADJUDICATOR\"

$cbox 0 0 0 0 0 0

//$bbox -8699.852 -13857.985 -26.694 8629.057 14182.5 4816.317


$sequence "idle" {
	"imp_adjudicator_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "imp_adjudicator_physics.smd"
{
	$automass
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
	$concave

}
