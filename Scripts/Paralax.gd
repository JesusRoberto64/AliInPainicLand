extends Sprite

export var velocity = Vector2()
export var offsetMult = 1
func _ready():
	#velocity.y = .5
	pass # Replace with function body.

# warning-ignore:unused_argument
func _process(delta):
	
	#velocity.y = 2
	
	position += velocity
	
	if position.y >= offsetMult*(get_viewport_rect().size.y):
		position.y = -self.texture.get_height() 
		pass
	
	pass