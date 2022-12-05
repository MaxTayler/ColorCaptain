extends MeshInstance
# get position of object	
var position = self.transform
var trans = position[3] 
#get xyz position 
var x = trans[0]
var y = trans[1]
var z = trans[2]
#setup color
var color = Color(0,0,0)
#set up rgb values
var r = 1
var g = 1
var b = 1
# value diffrents Low with 
var i = 0.08 # 

func _ready():
	#calculate color value based on position 
	r += x*i 
	g += y*i
	b += z*i
	#set color based on location
	color = Color(r,g,b)
	var material = get_surface_material(0) #material 
	material = material.duplicate() # maake new material 
	material.albedo_color = color# set materail shader new color
	set_surface_material(0, material) #replace with function body.
	#_print()# Print in debug (keep low object)
func _print():
	print(position)
	print(trans)
	print(color)
