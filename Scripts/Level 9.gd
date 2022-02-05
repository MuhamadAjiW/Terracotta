extends "res://Scripts/Door movements.gd"

onready var timer = $Timer
var soundcreeps

func _ready():
	timer.start(10)
	$"/root/Global".audio.get_node("Theme").stop()
	if $"/root/Global".audio.get_node("Themedisorted").is_playing() == false:
		$"/root/Global".audio.get_node("Themedisorted").play()


func _on_Timer_timeout():
	soundcreeps = randi()%10+1
	if soundcreeps == 1:
		$"/root/Global".audio.get_node("Giggle1").play()
	elif soundcreeps == 2:
		$"/root/Global".audio.get_node("Giggle2").play()
	elif soundcreeps == 3:
		$"/root/Global".audio.get_node("Giggle4").play()
	elif soundcreeps == 4:
		$"/root/Global".audio.get_node("Screech1").play()
	elif soundcreeps == 5:
		$"/root/Global".audio.get_node("Screech3").play()
	elif soundcreeps == 6 or soundcreeps == 7:
		$"/root/Global".audio.get_node("Animal call").play()
	else:
		pass
	yield(get_tree().create_timer(1), "timeout")
	timer.start(10)
