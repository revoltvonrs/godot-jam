extends KinematicBody

var speed = 10
var state = 3 # [3, 2, 1, 0]
var stun = false
onready var player = get_parent().get_node("../Player")

func _ready():
	pass

func _physics_process(delta):
	if !stun:
		$Sprite3D.look_at(Vector3(player.global_transform.origin.x,global_transform.origin.y, player.global_transform.origin.z),Vector3(0,1,0))
		var player_position = player.global_transform.origin
		var direction = (player_position - global_transform.origin).normalized()
		move_and_slide(direction * 5)
	#direction.y = 0
	#print(direction.y)
	



func _on_Area_area_entered(area):
	match area.name:
		"Banana":
			print("animation slip")
			stun = true
			yield(get_tree().create_timer(3), "timeout")
			stun = false
			print("backUp")
	area.get_parent().queue_free()


