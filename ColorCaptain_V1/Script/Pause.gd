extends Control

var pause = false


func _on_PlayButton_button_down():
	_on_pause_button_pressed()		

func _on_PlayMobile_button_up():
	_on_pause_button_pressed()
	_on_mobile()	
	
func _on_PauseButton_button_up():
	_on_pause_button_pressed()

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		_on_pause_button_pressed()
		
func _on_pause_button_pressed():
	if pause == false:
		get_tree().paused = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		pause = true
	else:
		get_tree().paused = false 
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		pause = false
	$PausePanel.visible = pause
	
func _on_mobile():
	$MobileUI.visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)



func _on_PlayHSLButton_button_up():
	get_tree().change_scene("res://TestSceneCircleHSL.tscn")


func _on_PlayHSVButton_pressed():
	get_tree().change_scene("res://TestSceneCircleHSV.tscn")


func _on_Button_button_up():
	get_tree().change_scene("res://ColorCubeScene.tscn")
