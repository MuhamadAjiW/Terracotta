extends Node2D

onready var delayTimer = $delayTimer
var called = false
var open = false


func _ready():
	pass # Replace with function body.

func delay():
	if delayTimer.is_stopped():
		delayTimer.start(0.5)
func _on_delayTimer_timeout():
	called = false

func _process(delta):
	if $opener.overlaps_body($"/root/Global".player):
		if $"/root/Global".player.state == $"/root/Global".player.INTERACT:
			if called == false:
				$"/root/Global".player.event_triggered("door")
				delay()
				if open == false:
					$closer.visible = false
					$closer/CollisionShape2D.disabled = true
					open = true
				else:
					$closer.visible = true
					$closer/CollisionShape2D.disabled = false
					open = false
			called = true

