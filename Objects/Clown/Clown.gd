extends KinematicBody

var speed = 5
var state = 3 # [3, 2, 1, 0]
var funrate = 0
var slip = false
var flying = false
var modifier= 1
var direction = null
var timer = Timer.new()
var bombed = false
onready var player = get_parent().get_node("Player")
onready var hud = get_parent().get_node("Player").get_node("HUD")
onready var sprite = $Sprite3D

func _ready():
	add_child(timer)
	timer.wait_time = 10
	timer.connect("timeout",self,"timeout")
	timer.start()

func _physics_process(delta):
	if !flying and !slip and !bombed:
		$Sprite3D.look_at(Vector3(player.global_transform.origin.x,global_transform.origin.y, player.global_transform.origin.z),Vector3(0,1,0))
		var player_position = Vector3(player.global_transform.origin.x, 1.75, player.global_transform.origin.z)
		direction = (player_position - global_transform.origin).normalized()
		#direction.y = 0
	funrate = clamp(funrate, 0, 30)
	state = ceil((30.0-funrate)/10.0)
	speed = clamp(2.5 * state * modifier, 0, 5)
	if state == 0:
		win()
	move_and_slide(direction * speed)
	if state == 0:
		if slip:
			sprite.texture = load("res://Art/FallenLaugh.png")
		else:
			sprite.texture = load("res://Art/ClownLaugh.png")
	elif state == 1:
		if slip:
			sprite.texture = load("res://Art/FallenNeutral.png")
		else:
			sprite.texture = load("res://Art/ClownNeutral.png")
	elif state == 2:
		if slip:
			sprite.texture = load("res://Art/FallenSadness.png")
		else:
			sprite.texture = load("res://Art/ClownSadness.png")
		
	elif state == 3:
		if slip:
			sprite.texture = load("res://Art/FallenAnger.png")
		else:
			sprite.texture = load("res://Art/ClownAnger.png")
	#direction.y = 0
	#print(direction.y)

func timeout():
	funrate -= 5
	
func _on_Area_area_entered(area):
	var drop = true
	
	match area.name:
		"Banana":
			area.get_parent().activate()
			print("animation slip")
			slip = true
			direction = Vector3()
			yield(get_tree().create_timer(2), "timeout")
			print("backUp")
		"Balloon":
			area.get_parent().activate()
			flying = true
			direction = Vector3(0, 1, 0)
			yield(get_tree().create_timer(2), "timeout")
		"BabyBomb":
			area.get_parent().activate()
			bombed = true
			direction = global_transform.origin - area.get_parent().global_transform.origin
			direction.y = 0
			modifier = 5
			yield(get_tree().create_timer(0.3), "timeout")
			modifier = 1
			bombed = false
		"Skates":
			area.get_parent().activate()
			modifier = 0.5
			yield(get_tree().create_timer(8), "timeout")
			modifier = 1
		_:
			drop = false
	
	slip = false
	flying = false
			
	if drop:
		funrate += 10
		area.get_parent().queue_free()


func win():
	$AudioStreamPlayer.play()
	hud.get_node("endGameText").visible = true
	hud.get_node("endScreen").visible = true
	hud.get_node("endGameText").text = "you win"
	print("win")

func lose():
	hud.get_node("endGameText").visible = true
	hud.get_node("endScreen").visible = true
	hud.get_node("endGameText").text = "you lose"
func _on_Area_body_entered(body):
	if body == player:
		lose()
