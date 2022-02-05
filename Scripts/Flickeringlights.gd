extends Node2D

onready var randomint = 0
onready var timer = $Timer

func _ready():
	pass

func _process(delta):
	if randomint > 8:
		self.visible = false
		randomint = randi()%10+1
	else:
		visible = true
		if timer.is_stopped():
			timer.start(0.5)
	




func _on_Timer_timeout():
	randomint = randi()%10+1
