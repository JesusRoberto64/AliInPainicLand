extends Area2D

var velocity = Vector2(0,1)

func _ready():
	pass # Replace with function body.
func _process(delta):
	
	position += velocity
	if position.y >= get_viewport_rect().size.y:
		
		queue_free()
		pass
	pass
