extends "res://Objects/object.gd"

var speed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var player_position = player.global_transform.origin
	var direction = (player_position - global_transform.origin).normalized()
	#direction.y = 0
	print(direction.y)
	move_and_slide(direction * 5)
	
