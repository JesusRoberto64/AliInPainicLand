extends "res://Scripts/enemyParent.gd"

const bulletEnemy = preload("res://Scenes/Bullet_bug.tscn")

onready var  timeBetweenShots =  0.3  # porfrmaes
onready var timeShots = 1

var myTimer
var shootTime = 0.3

func _ready():
	
	randomize()
	var direction = [-1,1]
	
	velocity.x = velocity.x*direction[randi()%direction.size()]
	
	myTimer = Timer.new()
	myTimer.set_wait_time(shootTime)
	add_child(myTimer)
	myTimer.connect("timeout",self,"shoot")
	
	myTimer.start()
	
	pass # Replace with function body.

func _process(delta):
	var myOffsetSpr = get_node("Sprite").texture.get_width()/2
	
	if position.x <= myOffsetSpr:
		velocity.x = abs(velocity.x)
	if position.x >= get_viewport_rect().size.x - myOffsetSpr:
		velocity.x = -abs(velocity.x)
	pass

func shoot():
	
	var bullet = bulletEnemy.instance()
	bullet.position = position 
	## TESTING 
	#var rootNode = get_parent()
	var rootNode = get_tree().get_root().get_node("World")
	rootNode.add_child(bullet)
	myTimer.set_wait_time(0.3)
	
	pass
