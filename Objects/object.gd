extends KinematicBody

onready var player = get_node("../Player")

func _ready():
	pass

func _process(delta):
	$Sprite3D.look_at(Vector3(player.global_transform.origin.x,global_transform.origin.y, player.global_transform.origin.z),Vector3(0,1,0))
