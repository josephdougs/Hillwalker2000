extends Node3D

var charBody: CurrentBody
var rigidBody: CurrentBody
var currentBody: CurrentBody

func _ready() -> void:
	charBody = $PlayerCharBody
	rigidBody = $PlayerRigidBody
	currentBody = charBody
	
	print(charBody)
	print(rigidBody)


func _process(delta: float) -> void:
	if Input.is_action_just_released("switch"):
		switchChars()
		
func switchChars():
	if currentBody == charBody:
		currentBody.disable()
		currentBody = rigidBody
		currentBody.enable()
	elif currentBody == rigidBody:
		currentBody.disable()
		currentBody = charBody
		currentBody.enable()
	else:
		print("should not get here")
	
