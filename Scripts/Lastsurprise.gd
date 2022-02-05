extends "res://Scripts/BasicEnemy.gd"

onready var timer = $Timer
var walking = true

func _ready():
	timer.start(5)

func _process(delta):

	if walking == true:
		velocity.x = 250

func _on_Timer_timeout():
	walking = false
