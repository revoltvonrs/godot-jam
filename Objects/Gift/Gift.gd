extends KinematicBody

var texture = "res://Art/icon.png"
var get_gift = 0

onready var player = get_parent().get_node("../Player")
onready var hud = get_parent().get_node("Player").get_node("HUD")

func _ready():
	$Sprite3D.texture = load(texture)
	
func _physics_process(delta):
	$Sprite3D.look_at(Vector3(player.global_transform.origin.x,global_transform.origin.y, player.global_transform.origin.z),Vector3(0,1,0))	

func _on_Area_body_entered(body):
	if body == player:
		hud.gift = get_gift
		print(get_gift)
		queue_free()
