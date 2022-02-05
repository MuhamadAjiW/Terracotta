extends Node2D


func _ready():
	$"CanvasLayer/Menu Button".grab_focus()

func _on_Menu_Button2_button_up():
	get_parent().transition("res://Scenes/Main menu.tscn")


func _on_Menu_Button_button_up():
	get_tree().quit()
