extends Node

#const enmeyKamikaze = preload("res://Scenes/enemyKamikaze.tscn")

const powups = [preload("res://Scenes/Powerup_lamp.tscn"),
preload("res://Scenes/Powerup_hearth.tscn")]

var timer

func _ready():
	#yield(get_tree().create_timer(1),"timeout")
	timer = get_tree().create_timer(rand_range(5,8.5))
	
	#print(timer)
	#spawn()
	pass

# warning-ignore:unused_argument
func _process(delta):
	
	
	if timer.get_time_left() <= 0.1:
		
		spawn()
		timer.set_time_left(rand_range(1,3)) # 5 a 6.5
	pass

func spawn():
	
	#while true:
	randomize()
	
	var powup =  powups[randi()%powups.size()].instance() 
	var enemyOffsetBor = powup.get_node("Sprite").texture.get_width() / 2 # save zone pixels 
	var viewOffsetBor = get_viewport().get_visible_rect().size.x - enemyOffsetBor
	var pos = Vector2()
	
	pos.x = round(rand_range(enemyOffsetBor, viewOffsetBor))
	pos.y = - int(enemyOffsetBor) 
	powup.position = pos
	
	get_node("container").add_child(powup)
		#yield(get_tree().create_timer(rand_range(1,1.5)),"timeout") 
	
	pass
