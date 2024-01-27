extends Spatial

onready var timer = $Timer
onready var hud = $Player/HUD

func make_gift():
	hud.gift = Gifts.Gifts.Banana
	print(hud.gift)

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.one_shot = false
	timer.wait_time = 10
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.start()

func _on_timer_timeout() -> void:
	make_gift()
