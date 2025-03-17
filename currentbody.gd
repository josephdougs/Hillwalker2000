extends PhysicsBody3D
class_name CurrentBody

func enable() -> void:
	print("enabling me " + str(self))

func disable() -> void:
	print("disabling me " + str(self))
