extends PhysicsBody3D
class_name CurrentBody

var myCamera: Camera3D

func _ready() -> void:
	myCamera = $"./Camera3D"

func enable() -> void:
	print("enabling me " + str(self))
	self.visible = true
	myCamera.make_current()
	unfreezePlayer()

func disable() -> void:
	print("disabling me " + str(self))
	self.visible = false
	freezePlayer()

func freezePlayer() -> void:
	if "freeze" in self:
		self.freeze = true

func unfreezePlayer() -> void:
	if "freeze" in self:
		self.freeze = false
