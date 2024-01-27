extends Control

var previousState = 3
var gift = null

onready var hand = $Hand
onready var clown = get_node("/root/TestK/Clown")

#func grayscale():

func highlight(state: int):
	pass
	#match state:
		#3:
			

func _process(delta):
	if clown.state != previousState:
		highlight(clown.state)
		
	match gift:
		0:
			hand.texture = load("res://Art/HandBanana.png")
		1:
			hand.texture = load("res://Art/HandBalloons.png")
		null:
			hand.texture = load("res://Art/HandFree.png")

func _ready():
	pass
