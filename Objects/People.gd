extends Sprite3D

#onready var people = get_node("/root/TestK/People")
#onready var player = get_node("/root/TestK/Player")

#func _physics_process(delta):
#	people.look_at(Vector3(player.global_transform.origin.x,global_transform.origin.y, player.global_transform.origin.z),Vector3(0,1,0))	
