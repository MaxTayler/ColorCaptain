extends Spatial

var  obj = preload("res://ColorCircleHSL.tscn")

var x = 0
var z = 0 
onready var y = global_transform.origin.y#get_node("/root/TestScene").get_translation()
var height_spc = 3 # space between objects y 

var ring_num = 5
var num_per_ring = 6
var ring_spc = 3
var set_ring_num = 1
var set_ring = 0

var pos = Vector3(0,0,0)
var angle_dif = 360/num_per_ring
var angle = 0 
var dist  = 3
#
func _update():
	set_object()
	check()#set first block 
	#print("angl dif:",angle_dif)

func check():
	if set_ring != num_per_ring: 
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
	else:
		pass # script ends here 
func new_ring():
	if set_ring_num < 1 :
		num_per_ring = 6
		angle_dif = 360/num_per_ring
	else:
		num_per_ring = 12
		angle_dif = 360/num_per_ring
	set_ring = 0
	set_ring_num += 1
	dist += height_spc
	check()		
		
func set_object():
	var obj_instance = obj.instance()
	add_child(obj_instance)
	obj_instance.translation = pos
	obj_instance._update()
	check()
	#print("new object : ",height_num)
