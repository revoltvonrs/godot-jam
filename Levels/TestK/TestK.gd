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
	#var bounds = get_aabb_global_endpoints(mesh_instance)

	var random_x = 0.0
	var random_z = 0.0
	#var hard_y = bounds[2][1]
	
	#while true:
	#	random_x = rand_range(bounds.position.x, bounds.position.x + bounds.size.x)
	#	random_z = rand_range(bounds.position.z, bounds.position.z + bounds.size.z)
	#	
	#	if not (mesh_instance.intersects_ray(Vector3(random_x, hard_y, random_z), Vector3(0, -1, 0))):
	#		break
	
	print("found gift location to spawn")
	
	hud.gift = Gifts.Gifts.Banana

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.one_shot = false
	timer.wait_time = 10
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.start()

func _on_timer_timeout() -> void:
	make_gift()
