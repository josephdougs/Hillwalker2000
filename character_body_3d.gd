extends CharacterBody3D

var otherNode: RigidBody3D
var enabled = true

func _ready():
	pass
	#otherNode = $"../PlayerRigidBody"

func enable():
	print("enable character")

"""
func enable():
	otherNode.visible = false
	otherNode.freeze = true
	otherNode.enabled = false
	var otherCollisionShape: CollisionShape3D = otherNode.get_child(0)
	otherCollisionShape.disabled = true
	
	self.enabled = true
	self.visible = true
	var myCollisionShape: CollisionShape3D = self.get_child(0)
	myCollisionShape.disabled = false



func _process(delta: float) -> void:
	if Input.is_action_just_released("switch"):
		print("i am character")
		if self.enabled:
			self.enabled = false
			otherNode.enable()
"""
