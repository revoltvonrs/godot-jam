extends KinematicBody

var speed = 10

onready var player = get_parent().get_node("../Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	$Sprite3D.look_at(Vector3(player.global_transform.origin.x,global_transform.origin.y, player.global_transform.origin.z),Vector3(0,1,0))
	var player_position = player.global_transform.origin
	var direction = (player_position - global_transform.origin).normalized()
	#direction.y = 0
	#print(direction.y)
	move_and_slide(direction * 5)
	
