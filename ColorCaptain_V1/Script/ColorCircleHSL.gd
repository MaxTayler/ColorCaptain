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

onready var material #= $MeshInstance.get_surface_material(0) #material 

func _ready(): 
	material = $MeshInstance.get_surface_material(0) #material 
	material = material.duplicate() # make new material 
	material.albedo_color = color# set material shader new color
	$MeshInstance.set_surface_material(0, material) #replace with function body. 
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

	var v = y*0.16
	var s = dist*0.16
	color = Color.from_hsv(h,s,v, 1)
	var hsl_mod =  (y/6) - (s/6) 
	
	color[0] += hsl_mod
	color[1] += hsl_mod
	color[2] += hsl_mod
	#set color based on location
	#color = Color(r,g,b)
	#material = $MeshInstance.get_surface_material(0) #material 
	#material = material.duplicate() # make new material 
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
	var r_val = round(128*color[0])#per clean up mode 
	var g_val = round(128*color[1])
	var b_val = round(128*color[2])
	var rgb = Vector3(r_val,g_val,b_val)
	$Label3D.set_text(String(rgb))
	$Label3D2.set_text(String(color))
	#print(" X:",x," Y:",y," Z:",z)
	#print(" GlobalOrigin:",go," localOrigin: ",lo)
	#print(dist*0.05)
	#print(dist)
	
