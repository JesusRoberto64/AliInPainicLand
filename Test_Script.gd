extends Node


func _ready():
	pass 

func _process(delta):
	
	if Input.is_action_pressed("ui_up"):
		myFuncTest()
		pass
	pass

func myFuncTest():
	print("In fuction line1")
	pass
