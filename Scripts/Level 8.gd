extends "res://Scripts/Door movements.gd"

func _ready():
	$"/root/Global".audio.get_node("Theme").stop()
	if $"/root/Global".audio.get_node("Themedisorted").is_playing() == false:
		$"/root/Global".audio.get_node("Themedisorted").play()
