extends Node


func _ready():
	pass # Replace with function body.

# warning-ignore:unused_argument
func _process(delta):
	
	if Input.is_action_pressed("ui_up"):
		myFuncTest()
		
		pass
	
	pass

func myFuncTest():
	print("In fuction line1")
	
	pass
