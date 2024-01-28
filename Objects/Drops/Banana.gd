extends KinematicBody

onready var player = get_parent().get_node("Player")

func _physics_process(delta):
	$Sprite3D.look_at(Vector3(player.global_transform.origin.x, global_transform.origin.y, player.global_transform.origin.z), Vector3(0, 1, 0))	

func activate():
	$AudioStreamPlayer3D.play()
