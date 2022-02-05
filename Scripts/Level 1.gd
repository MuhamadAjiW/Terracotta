extends "res://Scripts/Door movements.gd"

func _ready():
	$"/root/Global".audio.get_node("Theme").stop()
	$"/root/Global".audio.get_node("Forest").play()
	
