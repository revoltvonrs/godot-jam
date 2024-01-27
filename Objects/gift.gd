extends "res://Objects/Object.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mouseIn = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("click") && mouseIn:
		print("lol")


func _on_Area_mouse_entered():
	mouseIn = true


func _on_Area_mouse_exited():
	mouseIn = false
