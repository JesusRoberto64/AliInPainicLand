extends "res://Scripts/Bullet.gd"



func _ready():
	
	($Shoot_snd as AudioStreamPlayer).play()
	connect("area_entered",self,"on_area_enter")
	
	pass # Replace with function body.


func on_area_enter(other):
	if other.is_in_group("Player"):
		other.armor -= 1
		create_Magic()
		var  myCamera = get_tree().get_root().get_child(0).get_node_or_null("camera")
		myCamera._pass_shake(2.5,0.4)
		queue_free()
		pass
	pass