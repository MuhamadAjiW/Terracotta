extends "res://Scripts/Door movements.gd"

func _ready():
	$"/root/Global".audio.get_node("Forest").stop()
	if $"/root/Global".audio.get_node("Theme").is_playing() == false:
		$"/root/Global".audio.get_node("Theme").play()
