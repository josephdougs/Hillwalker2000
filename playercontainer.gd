extends Node3D

var charBody
var rigidBody
var currentBody
var currentNormalY: float = 1

func _ready() -> void:
	charBody = $PlayerCharBody
	rigidBody = $PlayerRigidBody
	currentBody = charBody
	

func _process(delta: float) -> void:
	if Input.is_action_just_released("switch"):
		switchChars()
		print(currentNormalY)
		
func _physics_process(delta):
	currentNormalY = get_ground_normal()
	
	
func get_ground_normal():
	var space_state = get_world_3d().direct_space_state
	# use global coordinates, not local to node
	var query = PhysicsRayQueryParameters3D.create(currentBody.global_position, currentBody.global_position - Vector3(0,1000,0))
	var result = space_state.intersect_ray(query)
	
	if result.has("normal"):
		return result["normal"].y
	else:
		# just hack it and return 1 for now in this case
		return 1
	
		
func switchChars():
	if currentBody == charBody:
		currentBody.disable()
		var currentPosition = currentBody.position
		var currentRotation = currentBody.rotation
		currentBody = rigidBody
		currentBody.enable(currentPosition, currentRotation)
	elif currentBody == rigidBody:
		currentBody.disable()
		var currentPosition = currentBody.position
		var currentRotation = currentBody.rotation
		currentBody = charBody
		currentBody.enable(currentPosition, currentRotation)
	else:
		print("should not get here")
	
