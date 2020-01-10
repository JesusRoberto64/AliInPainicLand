extends "res://Scripts/Powerup.gd"

func _ready():
	
	connect("area_entered",self,"_on_area_enter")
	pass # Replace with function body.

func _process(delta):
	pass
func _on_area_enter(other):
	if other.is_in_group("Player"):
		other.armor += 1
		other.get_node("Hearth_snd").play()
		queue_free()
		pass
	
	pass