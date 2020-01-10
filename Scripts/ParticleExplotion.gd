extends Sprite

func _ready():
	
	var  myCamera = get_tree().get_root().get_child(0).get_node_or_null("camera")
	myCamera._pass_shake(1,0.1)
	($exploted as AudioStreamPlayer2D).play()
	get_node("Anim").play("fade")
	yield(get_node("Anim"),"animation_finished")
	queue_free()
	
	pass 




