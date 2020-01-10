extends TextureButton

func _ready():
	
	connect("pressed",self,"_on_pressed")
	pass # Replace with function body.

func _on_pressed():
	
	get_tree().change_scene("res://Scenes/World.tscn")
	
	pass
