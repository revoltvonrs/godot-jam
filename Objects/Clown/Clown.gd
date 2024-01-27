extends KinematicBody

var speed = 5
var state = 3 # [3, 2, 1, 0]
var funrate = 10
var stun = false
var direction = null
var timer = Timer.new()

onready var player = get_parent().get_node("Player")
onready var sprite = $Sprite3D

func _ready():
	timer.wait_time = 5
	timer.start()

func _physics_process(delta):
	if !stun:
		$Sprite3D.look_at(Vector3(player.global_transform.origin.x,global_transform.origin.y, player.global_transform.origin.z),Vector3(0,1,0))
		var player_position = player.global_transform.origin
		direction = (player_position - global_transform.origin).normalized()
	state = ceil((30-funrate) / 10)
	match state: # texture, speed change
		0:
			sprite.set_texture(load("res://Art/ClownNeutral.png"))
		1:
			sprite.set_texture(load("res://Art/ClownNeutral.png"))
		2:
			sprite.set_texture(load("res://Art/ClownNeutral.png"))
		3:
			sprite.set_texture(load("res://Art/ClownNeutral.png"))
		
	move_and_slide(direction * speed)
	#direction.y = 0

func timeout():
	funrate -= 5
	
func _on_Area_area_entered(area):
	var drop = true
	
	match area.name:
		"Banana":
			area.get_parent().activate()
			print("animation slip")
			stun = true
			direction = Vector3()
			yield(get_tree().create_timer(3), "timeout")
			print("backUp")
			funrate += 10
		"Balloon":
			area.get_parent().activate()
			stun = true
			direction = Vector3(0, 1, 0)
			yield(get_tree().create_timer(2), "timeout")
			funrate += 10
		_:
			drop = false
			
	stun = false
	
	if drop:
		area.get_parent().queue_free()

func win():
	print("win")
