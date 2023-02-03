extends Spatial

# the that is pre writen before the hsv 

# get position of object realitive global origin 	
onready var x = global_transform.origin.x#get_node("/root/TestScene").get_translation()
onready var y = global_transform.origin.y#get_node("/root/TestScene").get_translation()
onready var z = global_transform.origin.z#get_node("/root/TestScene").get_translation()
#setup color
var color = Color(0,0,0,0)

#set up rgb values 1 is max value 
var r = 0.5 
var g = 0.5
var b = 0.5
# value diffrents  
var i = 0.04 # 
var h = 0.06

func _ready(): 
	_update()
	
func _update():
	x = global_transform.origin.x
	y = global_transform.origin.y
	z = global_transform.origin.z
	var go = Vector2(0,0) #global origin 
	var lo = Vector2(z,x) #local origin
	var degree = rad2deg(lo.angle_to_point(go))
	var dist = Vector3(0,0,0).distance_to(Vector3(x,0,z))
	var h = degree/360
	if h < 0:
		h = h+1 
	var s = dist*0.1
	var l = y/6
	var v = l-s*2
	color = Color.from_hsv(h,s,v, 1)
	
	
	#set color based on location
	#color = Color(r,g,b)
	var material = $MeshInstance.get_surface_material(0) #material 
	material = material.duplicate() # maae new material 
	material.albedo_color = color# set material shader new color
	$MeshInstance.set_surface_material(0, material) #replace with function body. 
	#update label of godot color
	$Label3D.set_text(String(color))
		#update label of RGB Value
	var h_val = h
	var s_val = s
	var v_val = v
	var hsv = Vector3(h_val,s_val,v_val)
	#update label of RGB Value
	#var r_val = round(128*color[0])
	#var g_val = round(128*color[1])
	#var b_val = round(128*color[2])
	#var rgb = Vector3(r_val,g_val,b_val)
	$Label3D.set_text(String(degree))
	$Label3D2.set_text(String(v))
	#print(" X:",x," Y:",y," Z:",z)
	#print(" GlobalOrigin:",go," localOrigin: ",lo)
	#print(dist*0.05)
	#print(dist)
	
