extends RigidBody3D

var otherNode: CharacterBody3D
var enabled = false

func _ready():
	otherNode = $"../PlayerCharBody"  

func enable():
	otherNode.visible = false
	var otherCollisionShape: CollisionShape3D = otherNode.get_child(0)
	otherCollisionShape.disabled = true
	
	self.enabled = true
	self.visible = true
	self.freeze = false
	var myCollisionShape: CollisionShape3D = self.get_child(0)
	myCollisionShape.disabled = false

	
func _process(delta: float) -> void:
	if Input.is_action_just_released("switch"):
		print("i am rigid")
		if self.enabled:
			self.enabled = false
			otherNode.enable()
		# print(otherNode)
