extends Camera2D
var magnitud = 0
var timeLeft = 0
var is_shaking = false

func _ready():
	#_myFunc()
	#print("My instance number is :", self.get_instance_id() )
	pass # Replace with function body.
	

func _process(delta):

	if is_shaking:
		_shake()
	pass

#func shake(new_Magnitud, leftTime):
#	if magnitud > new_Magnitud: return
#
#	magnitud = new_Magnitud
#	timeLeft = leftTime
#
#	if is_shaking: return
#	#is_shaking = true
#
#	if timeLeft > 0:
#		var pos = Vector2()
#		pos.x = rand_range(-magnitud,magnitud)
#		pos.y = rand_range(-magnitud,magnitud)
#		position = pos
#
#		timeLeft -= get_process_delta_time()
#		#is_shaking = true
#		#return#yield(get_tree(),"idle_frame")
#	else:
#		magnitud = 0
#		is_shaking = false
#		position = Vector2(0,0)
#	pass

func _shake():
	if timeLeft > 0:
		var pos = Vector2()
		pos.x = rand_range(-magnitud,magnitud)
		pos.y = rand_range(-magnitud,magnitud)
		position = pos
		timeLeft -= get_process_delta_time()
	else:
		magnitud = 0
		position = Vector2(0,0)
		is_shaking = false
	pass

func _pass_shake(new_magnitud,new_time):
	if is_shaking: return
	magnitud = new_magnitud
	timeLeft = new_time
	is_shaking = true
	pass
