extends Node
#builds stack

var  obj = preload("res://LayerMaker.tscn")

var x = 0
var y = 0
var z = 0 

var height_num = 6
var height_spc = 3 # space between objects y 
var pos = Vector3(x,y,z)
func _ready():
	set_object()
	check()

func check():
	if height_num > 1: 
		# new layer  
		z = 0
		x = 0 
		y += height_spc
		height_num -= 1
		pos = Vector3(x,y,z)
		set_object() #make ceter object 
	else:
		pass

func set_object():
	var obj_instance = obj.instance()
	add_child(obj_instance)
	obj_instance.translation = pos
	obj_instance._update()
	check()
