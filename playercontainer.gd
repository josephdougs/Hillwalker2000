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
	
