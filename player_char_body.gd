extends CharacterBody3D

# hack to use CharacterBody3D functions
var myself: CharacterBody3D
var myCamera: Camera3D
var hTerrain
var currentNormalY: float = 1
var currentPositionY: float = self.global_position.y

func _ready() -> void:
	myCamera = $"./Camera3D"
	hTerrain = $"../../HTerrain"
	
func _physics_process(delta):
	var dict = get_ground_normal()
	currentNormalY = dict["normal"].y
	currentPositionY = dict["position"].y + 0.5
	
	self.global_position.y = currentPositionY
	
	
func get_ground_normal():
	var space_state = get_world_3d().direct_space_state
	# use global coordinates, not local to node
	var query = PhysicsRayQueryParameters3D.create(self.global_position, self.global_position - Vector3(0,1000,0))
	var result = space_state.intersect_ray(query)
	
	return result


func _process(delta: float) -> void:
	var collision = move_and_collide(Vector3(-1,0,0) * delta)
	if collision != null:
		print(collision)

func enable(currentPosition: Vector3, currentRotation: Vector3) -> void:
	self.visible = true
	self.position = currentPosition
	self.rotation = currentRotation
	myCamera.make_current()

func disable() -> void:
	self.visible = false
