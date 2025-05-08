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
	# set current y position to whatever the ground is plus 0.5 (half the height of the player)
	currentPositionY = dict["position"].y + 0.5
	
	self.global_position.y = currentPositionY
	
	
func get_ground_normal():
	var space_state = get_world_3d().direct_space_state
	# use global coordinates, not local to node
	var query = PhysicsRayQueryParameters3D.create(self.global_position, self.global_position - Vector3(0,1000,0))
	var result = space_state.intersect_ray(query)
	
	return result


func _process(delta: float) -> void:
	var move_vector = Vector3.ZERO
	if Input.is_action_pressed("up"):
		move_vector = Vector3(0, 0, 10)
	if Input.is_action_pressed("down"):
		move_vector = Vector3(0, 0, -10)
	if Input.is_action_pressed("right"):
		move_vector = Vector3(-10, 0, 0)
	if Input.is_action_pressed("left"):
		move_vector = Vector3(10, 0, 0)
		

	move_and_collide(move_vector * delta * currentNormalY**4)

func enable(currentPosition: Vector3, currentRotation: Vector3) -> void:
	self.visible = true
	self.position = currentPosition
	self.rotation = currentRotation
	myCamera.make_current()

func disable() -> void:
	self.visible = false
