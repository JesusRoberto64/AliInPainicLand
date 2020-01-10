extends TextureRect

var score = 0 setget set_score

func _ready():
	
	#set_score(score)
	pass # Replace with function body.

func set_score(newValue):
	
	score = newValue
	get_node("Label").set_text(str(score))
	
	pass
