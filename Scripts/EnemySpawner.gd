extends Node

#const enmeyKamikaze = preload("res://Scenes/enemyKamikaze.tscn")

const enemies = [preload("res://Scenes/enemyKamikaze.tscn"),
preload("res://Scenes/Enemy_zigzag.tscn")]

var timer

func _ready():
	
	timer = get_tree().create_timer(rand_range(1,1.5))
	
	#print(timer)
	#spawn()
	pass

func _process(delta):
	
	
	if timer.get_time_left() <= 0.1:
		
		spawn()
		timer.set_time_left(rand_range(1,1.5))
	pass

func spawn():
	
	#while true:
	randomize()
	
	var enemy = enemies[randi()%enemies.size()].instance() 
	var enemyOffsetBor = enemy.get_node("Sprite").texture.get_width() / 2 # save zone pixels 
	var viewOffsetBor = get_viewport().get_visible_rect().size.x - enemyOffsetBor
	var pos = Vector2()
	
	pos.x = round(rand_range(enemyOffsetBor, viewOffsetBor))
	pos.y = - int(enemyOffsetBor) 
	enemy.position = pos
	
	get_node("container").add_child(enemy)
		#yield(get_tree().create_timer(rand_range(1,1.5)),"timeout") 
	
	pass

func test():
	
	
	
	
	
	pass 




