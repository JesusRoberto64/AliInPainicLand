extends Area2D

export var velocity = Vector2()
export var armor = 6 setget set_armor 
var offsetSpr

const scn_explotion = preload("res://Scenes/Particle.tscn")

func _ready():
	
	get_node("AnimatedSprite").play("default")
	offsetSpr = get_node("Sprite").texture.get_height()
	
	add_to_group("enemy")
	
	connect("area_entered",self,"_on_area_enter")
	
	pass # Replace with function body.

func _process(_delta):
	
	position += velocity
	
	if position.y >= get_viewport_rect().size.y + offsetSpr:
		queue_free()
		pass 
	pass

func _on_area_enter(other):
	if other.is_in_group("Player"):
		create_explotion()
		var  myCamera = get_tree().get_root().get_child(0).get_node_or_null("camera")
		myCamera._pass_shake(3,0.5)
		other.armor -= 1
		queue_free()
	pass

func set_armor(new_value):
	
	armor = new_value
	if armor <= 0:
		var tt = get_tree().get_root().get_child(0).get_node_or_null("hud").get_node("text_score")
		tt.score += 1
		create_explotion()
		queue_free()
		pass
	pass

func create_explotion():
	
	var explotion = scn_explotion.instance()
	explotion.position = position 
	var rootNode = get_tree().get_root().get_node("World")
	rootNode.add_child(explotion)
	
	pass