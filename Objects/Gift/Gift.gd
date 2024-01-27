extends "res://Objects/object.gd"

func _ready():
	pass

func _on_Area_body_entered(body):
	if body == player:
		print("Player entered")
		queue_free()
