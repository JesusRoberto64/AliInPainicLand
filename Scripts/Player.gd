extends Area2D

const bulletAli_scn = preload("res://Scenes/Bullet_Ali.tscn")
const scn_explotion = preload("res://Scenes/Particle.tscn")

export var armor = 1 setget set_armor
export var shootTime = 0.3

const snc_flash = preload("res://Scenes/Flare.tscn")

var is_double_shoting = false setget set_doubel_shooting

signal armor_change
signal exit_tree 

var myTimer
var doubleTimer

func _ready():
	add_to_group("Player")
	
	myTimer = Timer.new()
	myTimer.set_wait_time(shootTime)
	add_child(myTimer)
	myTimer.connect("timeout",self,"shoot")
	
	myTimer.start()
	
	doubleTimer = Timer.new()
	doubleTimer.set_wait_time(5)
	add_child(doubleTimer)
	
	pass

func _process(delta):
	
	var mousePos =  Vector2()
	var playerPos = position.x
	var playerPosY = position.y
	
	mousePos = get_global_mouse_position()
	
	var motionPlayer = Vector2((mousePos.x - playerPos)*.5,(mousePos.y - playerPosY)*.5) 
	
	#clamp palyer 
	var viewWidth = get_viewport_rect().size.x
	var viewHeigth = get_viewport_rect().size.y # implmentacion de Y coordenada 
	var spriteSize = get_node("Sprite").texture.get_width()
	var spriteHeigth = ($Sprite as Sprite).texture.get_height()
	
	position += motionPlayer#.normalized()  
	position.y = clamp(position.y, 0 + spriteHeigth/2, viewHeigth -spriteHeigth/2)
	position.x = clamp(position.x, 0 + spriteSize/2, viewWidth -spriteSize/2)
	
	#Implemetacion Y
	#position.y += motionPlayer
	
	if doubleTimer.time_left < 0.1 and is_double_shoting:
		is_double_shoting = false
		doubleTimer.stop() 
		pass
	pass 

func shoot():
	myTimer.set_wait_time(0.3) # Se recetea el timer
	var pos_left =  get_node("cannos/left").global_position
	var pos_rigth = get_node("cannos/rigth").global_position
	create_Bullet(pos_left)
	create_Bullet(pos_rigth)
	
	if is_double_shoting:
		myTimer.set_wait_time(0.1)
		var bullet_left = create_Bullet(pos_left)
		var bullet_rigth = create_Bullet(pos_rigth)
		bullet_left.position.x += 15 
		bullet_rigth.position.x -= 15 
	
	pass


func set_armor(new_value):
	if new_value >= 4: return
	if new_value < armor:
		var flare = snc_flash.instance()
		var root = get_tree().get_root().get_node_or_null("World")
		root.add_child(flare)
		pass
	
	armor = new_value
	
	emit_signal("armor_change",armor)
	
	if armor <= 0:
		
		create_explotion()
		emit_signal("exit_tree")
		queue_free()
	
	pass

func create_Bullet(pos):
	var bulletAli =  bulletAli_scn.instance()
	
	bulletAli.position = pos
	
	get_node("container").add_child(bulletAli)
	return bulletAli
	pass

func create_explotion():
	
	var explotion = scn_explotion.instance()
	explotion.position = position 
	var rootNode = get_tree().get_root().get_node("World")
	rootNode.add_child(explotion)
	pass

func set_doubel_shooting(new_value):
	is_double_shoting = new_value
	myTimer.start(0.1)
	doubleTimer.start(5)
	pass
