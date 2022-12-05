extends MeshInstance
	
var position = self.transform
var trans = position[3] 

var x = trans[0]
var y = trans[1]
var z = trans[2]

var color = Color(0,0,0)

var r = 1
var g = 1
var b = 1

func _ready():
	
	r += x*0.05
	g += y*0.05
	b += z*0.05
	
	#r += z*10
	#g += z*10
	#b += z*10
	
	color = Color(r,g,b)
	var material = get_surface_material(0) #$MeshInstance.
	material = material.duplicate() 
	material.albedo_color = color
	#$MeshInstance.
	set_surface_material(0, material) #eplace with function body.
	#_print()
	
func _print():
	print(position)
	print(trans)
	print(color)
