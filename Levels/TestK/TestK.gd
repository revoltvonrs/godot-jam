extends Spatial

onready var timer = $Timer
onready var hud = $Player/HUD
onready var mesh_instance = $MeshInstance

func get_aabb_global_endpoints(mesh_instance: MeshInstance) -> Array:
	if not is_instance_valid(mesh_instance):
		return []

	var mesh: Mesh = mesh_instance.mesh
	
	if not mesh:
		return []

	var aabb: AABB = mesh.get_aabb()
	var global_endpoints := []
	
	for i in range(8):
		var local_endpoint: Vector3 = aabb.get_endpoint(i)
		var global_endpoint: Vector3 = mesh_instance.to_global(local_endpoint)
		global_endpoints.push_back(global_endpoint)
		
	return global_endpoints

func make_gift():
	var bounds = get_aabb_global_endpoints(mesh_instance)
	var random_x = rand_range(bounds[0][0], bounds[4][0])
	var random_z = rand_range(bounds[0][2], bounds[1][2])
	
	hud.gift = Gifts.Gifts.Banana

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.one_shot = false
	timer.wait_time = 10
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.start()

func _on_timer_timeout() -> void:
	make_gift()
