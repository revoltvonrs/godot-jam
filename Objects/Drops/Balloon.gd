extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = get_parent().get_node("Player")
onready var clown = get_parent().get_node("Clown")
var go_up = false
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	$Sprite3D.look_at(Vector3(player.global_transform.origin.x,global_transform.origin.y, player.global_transform.origin.z),Vector3(0,1,0))	
	if go_up:
		global_transform.origin = clown.global_transform.origin
func activate():
	go_up = true
