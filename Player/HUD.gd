extends Control

var previousState = 3
var gift = null

onready var clown = get_node("/root/TestK/Clown")

#func grayscale():

func highlight(state: int):
	pass
	#match state:
		#3:
			

func _process(delta):
	if clown.state != previousState:
		highlight(clown.state)

func _ready():
	pass
