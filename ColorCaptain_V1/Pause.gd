extends Control

var pause = false


func _on_PlayButton_button_down():
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
