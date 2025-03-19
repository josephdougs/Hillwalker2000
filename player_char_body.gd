extends CharacterBody3D

# hack to use CharacterBody3D functions
var myself: CharacterBody3D
var myCamera: Camera3D
var hTerrain

func _ready() -> void:
	myCamera = $"./Camera3D"
	hTerrain = $"../../HTerrain"

func _process(delta: float) -> void:
	var collision = move_and_collide(Vector3(1,0,0) * delta)
	if collision != null:
		print(collision)

func enable(currentPosition: Vector3, currentRotation: Vector3) -> void:
	self.visible = true
	self.position = currentPosition
	self.rotation = currentRotation
	myCamera.make_current()

func disable() -> void:
	self.visible = false
