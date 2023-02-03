extends Node
#builds cycle of object 

var  obj = preload("res://ColorCircleHSL.tscn")

var x = 0
var y = 0
var z = 0 

var height_num = 6
var height_spc = 2 # space between objects y 

var ring_num = 5
var num_per_ring = 6
var ring_spc = 3
var set_ring_num = 0
var set_ring = 0

var pos = Vector3(0,0,0)
var angle_dif = 360/num_per_ring
var angle = 0 
var dist  = 3
# 
func _ready():
	set_object()
	check()#set first block 
	#print("angl dif:",angle_dif)

func check():
	if set_ring < num_per_ring: 
		#place objects in ring 
		var angle = set_ring*angle_dif
		set_ring += 1
		var i = deg2rad(angle)
		#print(i)
		x = dist*cos(i)
		z = dist*sin(i)
		pos = Vector3(x,y,z)
		set_object()
	elif set_ring_num < ring_num:
		new_ring()
	elif height_num > 0: 
		# new layer  
		set_ring_num = 0
		set_ring = 0 
		dist = 0
		z = 0
		x = 0 
		y += height_spc
		height_num -= 1
		pos = Vector3(x,y,z)
		set_object()	
		new_ring()
	else:
		#set new ring 
		#z += ring_spc
		pass

func set_object():
	var obj_instance = obj.instance()
	add_child(obj_instance)
	obj_instance.translation = pos
	obj_instance._update()
	check()
	#print("new object : ",height_num)
func new_ring():
	set_ring = 0
	set_ring_num += 1
	dist += height_spc
	check()
