extends Control

var previousState = 3
var gift = null

onready var handFree = $HandFree
onready var handBalloons = $HandBalloons
onready var handBanana = $HandBanana
onready var handBabyBomb = $HandBabyBomb
onready var angerTexture = $Anger
onready var sadnessTexture = $Sadness
onready var neutralTexture = $Neutral
onready var laughTexture = $Laugh
onready var clown = get_node("/root/TestK/Clown")

func to_grayscale(texture: Texture) -> Texture:
	var image = texture.get_data()
	image.convert(Image.FORMAT_LA8)
	image.convert(Image.FORMAT_RGBA8)
	
	var image_texture = ImageTexture.new()
	image_texture.create_from_image(image)
	
	return image_texture

func highlight(state: int):
	pass
	#match state:
		#3:
			

func _process(delta):
	if clown.state != previousState:
		highlight(clown.state)
	
	var sprite = clown.get_children()[0]
	
	if clown.state == 0:
		laughTexture.texture = load("res://Art/EbaloLaugh.png")
		neutralTexture.texture = to_grayscale(neutralTexture.texture)
		sadnessTexture.texture = to_grayscale(sadnessTexture.texture)
		angerTexture.texture = to_grayscale(angerTexture.texture)
	elif clown.state == 1:
		print("1")
		laughTexture.texture = to_grayscale(laughTexture.texture)
		neutralTexture.texture = load("res://Art/EbaloNeutral.png")
		sadnessTexture.texture = to_grayscale(sadnessTexture.texture)
		angerTexture.texture = to_grayscale(angerTexture.texture)
	elif clown.state == 2:
		laughTexture.texture = to_grayscale(laughTexture.texture)
		neutralTexture.texture = to_grayscale(neutralTexture.texture)
		sadnessTexture.texture = load("res://Art/EbaloSadness.png")
		angerTexture.texture = to_grayscale(angerTexture.texture)
	elif clown.state == 3:
		laughTexture.texture = to_grayscale(laughTexture.texture)
		neutralTexture.texture = to_grayscale(neutralTexture.texture)
		sadnessTexture.texture = to_grayscale(sadnessTexture.texture)
		angerTexture.texture = load("res://Art/EbaloAnger.png")
		
	match gift:
		0:
			handBanana.visible = true
			handFree.visible = false
			handBalloons.visible = false
			handBabyBomb.visible = false
			#hand.texture = load("res://Art/HandBanana.png")
		1:
			#hand.texture = load("res://Art/HandBalloons.png")
			handBanana.visible = false
			handFree.visible = false
			handBalloons.visible = true
			handBabyBomb.visible = false
		2:
			handBanana.visible = false
			handFree.visible = false
			handBalloons.visible = false
			handBabyBomb.visible = true
		null:
			handBanana.visible = false
			handFree.visible = true
			handBalloons.visible = false
			handBabyBomb.visible = false

func _ready():
	pass
