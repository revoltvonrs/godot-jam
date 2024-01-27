extends "res://Objects/object.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_position = Player.global_transform.origin
	var direction = (player_position - global_transform.origin).normalized()
	direction.y = 0
	move_and_slide(direction * 10)
	
