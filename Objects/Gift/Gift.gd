extends "res://Objects/object.gd"

var texture = ""
var get_gift= 0
onready var hud = get_node("../HUD")

func _ready():
	$Sprite3D.texture = texture

func _on_Area_body_entered(body):
	if body == player:
		hud.gift = get_gift
		print(get_gift)
		queue_free()
