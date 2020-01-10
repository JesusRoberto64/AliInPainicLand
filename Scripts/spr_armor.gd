extends Sprite



func _ready():
	
	#source node, ship
	#sorce signal, armor change
	#target node, self
	# target function, _on_armor_changed
	
	var rootPlayer = get_tree().get_root().get_child(0).get_node_or_null("Player")
	rootPlayer.connect("armor_change",self,"_on_armor_changed")
	pass # Replace with function body.

func _on_armor_changed(armor):
	if armor < 0: return
	frame = armor
	#set_frame
	pass
