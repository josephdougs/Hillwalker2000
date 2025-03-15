extends CharacterBody3D

var otherNode: RigidBody3D
var enabled = true

func _ready():
	otherNode = $"../PlayerRigidBody"

func enable():
	otherNode.visible = false
	otherNode.freeze = true
	var otherCollisionShape: CollisionShape3D = otherNode.get_child(0)
	otherCollisionShape.disabled = true
	
	self.enabled = true
	self.visible = true
	var myCollisionShape: CollisionShape3D = self.get_child(0)
	myCollisionShape.disabled = false


func _process(delta: float) -> void:
	print("char " + str(enabled))
	if not(enabled):
		return
		
	if Input.is_action_just_released("switch"):
		print("i am character")
		self.enabled = false
		otherNode.enable()
