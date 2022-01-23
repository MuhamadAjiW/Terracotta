extends Node2D

var inventoryOpen = false
var pauseEnabled = true

func _ready():
	pass

func disable_pause():
	pauseEnabled = false
func enable_pause():
	pauseEnabled = true

func input_processing():
	if Input.is_action_just_pressed("Letter I"):
		inventoryOpen = not inventoryOpen
		if inventoryOpen:
			$CanvasLayer/ColorRect/Close.grab_focus()
			get_tree().paused = true
			$CanvasLayer/ColorRect.visible = true
			get_parent().get_node("Pause").disable_pause()
		else:
			get_tree().paused = false
			$CanvasLayer/ColorRect.visible = false
			get_parent().get_node("Pause").enable_pause()
	elif Input.is_action_just_pressed("Escape"):
		if inventoryOpen:
			get_tree().paused = false
			$CanvasLayer/ColorRect.visible = false
			get_parent().get_node("Pause").enable_pause()
		else:
			pass

func _process(delta):
	if pauseEnabled:
		input_processing()

func _on_Close_button_up():
	Input.action_press("Letter I")
