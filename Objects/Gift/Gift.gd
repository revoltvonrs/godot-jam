extends "res://Objects/object.gd"

var texture = "res://Art/icon.png"
var get_gift = 0
onready var hud = get_parent().get_node("Player").get_node("HUD")

func _ready():
	$Sprite3D.texture = load(texture)

func _on_Area_body_entered(body):
	if body == player:
		hud.gift = get_gift
		print(get_gift)
		queue_free()
