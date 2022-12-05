extends Spatial

# get position of object	
#var current_scene = get_global_transform_interpolated()
onready var x = global_transform.origin.x#get_node("/root/TestScene").get_translation()
onready var y = global_transform.origin.y#get_node("/root/TestScene").get_translation()
onready var z = global_transform.origin.z#get_node("/root/TestScene").get_translation()
#setup color
var color = Color(0,0,0)
#set up rgb values 1 is max value 
var r = 1 
var g = 1
var b = 1
# value diffrents  
var i = 0.065 # 

func _ready():
	#calculate color value based on position 
	r += stepify(x*i,0.1) 
	g += stepify(y*i,0.1)
	b += stepify(z*i,0.1)
	#set color based on location
	color = Color(r,g,b)
	var material = $MeshInstance.get_surface_material(0) #material 
	material = material.duplicate() # maae new material 
	material.albedo_color = color# set material shader new color
	$MeshInstance.set_surface_material(0, material) #replace with function body. 
	#update label of godot color
	$Label3D.set_text(String(color))
	#update label of RGB Value
	var r_val = round(128*color[0])
	var g_val = round(128*color[1])
	var b_val = round(128*color[2])
	var rgb = Vector3(r_val,g_val,b_val)
	$Label3D2.set_text(String(rgb))
