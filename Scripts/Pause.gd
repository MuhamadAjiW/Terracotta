extends Node2D

var conditionPaused = false
var conditionInControl = false
var pauseEnabled = true

func _ready():
	pass

func disable_pause():
	pauseEnabled = false
func enable_pause():
	pauseEnabled = true

func input_processing():
	if Input.is_action_just_pressed("Escape"):
		if conditionInControl == false:
			conditionPaused = not conditionPaused
			if conditionPaused:
				$"CanvasLayer/ColorRect".visible = true
				$"CanvasLayer/ColorRect/Menu/Button Container/Continue".grab_focus()
				get_tree().paused = true
				get_parent().get_node("Inventory").disable_pause()
			else:
				$"CanvasLayer/ColorRect".visible = false
				get_tree().paused = false
				get_parent().get_node("Inventory").enable_pause()
		else:
			_on_Close_button_up()

func _process(delta):
	if pauseEnabled:
		input_processing()



func _on_Continue_button_up():
	Input.action_press("Escape")


func _on_Controls_button_up():
	conditionInControl = true
	$"CanvasLayer/ColorRect/Menu".visible = false
	$"CanvasLayer/ColorRect/Control overlay".visible = true
	$"CanvasLayer/ColorRect/Control overlay/Close".grab_focus()
	


func _on_Main_Menu_button_up():
	get_parent().get_parent().get_parent().transition('res://Scenes/Main menu.tscn')


func _on_Close_button_up():
	conditionInControl = false
	$"CanvasLayer/ColorRect/Control overlay".visible = false
	$"CanvasLayer/ColorRect/Menu".visible = true
	$"CanvasLayer/ColorRect/Menu/Button Container/Controls".grab_focus()

