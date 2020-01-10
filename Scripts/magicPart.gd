extends Sprite

func _ready():
	($get_hit as AudioStreamPlayer2D).play()
	get_node("Anim").play("fade")
	yield(get_node("Anim"),"animation_finished")
	queue_free()
	pass # Replace with function body.


