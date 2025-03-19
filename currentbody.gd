extends RigidBody3D
class_name CurrentBody

var myCamera: Camera3D

func _ready() -> void:
	myCamera = $"./Camera3D"

func enable(currentPosition: Vector3, currentRotation: Vector3) -> void:
	self.visible = true
	self.position = currentPosition
	self.rotation = currentRotation
	myCamera.make_current()
	unfreezePlayer()

func disable() -> void:
	self.visible = false
	freezePlayer()

func freezePlayer() -> void:
	if "freeze" in self:
		self.freeze = true

func unfreezePlayer() -> void:
	if "freeze" in self:
		self.freeze = false

func _process(delta: float) -> void:
	if Input.is_action_just_released("try"):
		self.freeze = not(self.freeze)
		
		
func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	if self.freeze:
		self.global_position.y += 1
		
