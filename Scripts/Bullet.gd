extends Area2D

export var velocity = Vector2()
const magia_part = preload("res://Scenes/magicPart.tscn")

func _ready():
	#create_Magic()
	yield(get_node("vis_notifier"),"screen_exited")
	queue_free()
	
	pass

func _process(delta):
	position += velocity
	
	#if position.y >= get_viewport_rect().size.y or position.y <= 0:
	#	queue_free()
	#	pass 
	 
	pass

func create_Magic():
	
	var magicPart = magia_part.instance()
	magicPart.position = position
	#get_node("container ").add_child(magicPart)
	var rootNode = get_tree().get_root().get_node("World")
	rootNode.add_child(magicPart)
	pass

