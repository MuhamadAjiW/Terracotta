extends Node2D

func _ready():
	if Global.door_name == "Secretpassage":
		Global.door_name = "Secretpassage2"
	elif Global.door_name == "Secretpassage2":
		Global.door_name = "Secretpassage"
	get_parent().transition("res://Scenes/Level 9.tscn")
