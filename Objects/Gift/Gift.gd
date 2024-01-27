extends KinematicBody

var gift = 0

onready var player = get_parent().get_node("Player")
onready var hud = get_parent().get_node("Player").get_node("HUD")

func _process(delta):
	match gift:
		0:
			$Sprite3D.texture = load("res://Art/Banana.png")
		1:
			$Sprite3D.texture = load("res://Art/Balloons.png")
		2:
			$Sprite3D.texture = load("res://Art/BabyBomb.png")

func _physics_process(delta):
	$Sprite3D.look_at(Vector3(player.global_transform.origin.x,global_transform.origin.y, player.global_transform.origin.z),Vector3(0,1,0))	

func _on_Area_body_entered(body):
	if body == player:
		hud.gift = gift
		queue_free()
