extends Node2D

onready var delayTimer = $delayTimer
onready var locktimer = $lockTimer
onready var opentimer = $Opentimer
export(String) var itemname = "none"
var called = false
var open = false
var ready = false

func _ready():
	opentimer.start(2)

func delay():
	if delayTimer.is_stopped():
		delayTimer.start(0.5)
func _on_delayTimer_timeout():
	called = false

func _input(event):
	if $opener.overlaps_body($"/root/Global".player):
		if $"/root/Global".player.state == $"/root/Global".player.INTERACT:
			if ($"/root/Global".inventory.get_node(itemname).visible == true or itemname == "none") and ready == true:
				if called == false:
					$"/root/Global".player.event_triggered("door")
					$Doorsound.play()
					delay()
					if open == false:
						$closer/CollisionShape2D.disabled = true
						$closer/LightOccluder2D.visible = false
						$closer.visible = false
						open = true
					else:
						$closer/CollisionShape2D.disabled = false
						$closer/LightOccluder2D.visible = true
						$closer.visible = true
						open = false
				called = true
			else:
				if called == false:
					delay()
					if locktimer.is_stopped():
						$Lockedsound.play()
						locktimer.start(0.5)
						$RichTextLabel.visible = true
				called = true

func _on_lockTimer_timeout():
	$RichTextLabel.visible = false


func _on_Opentimer_timeout():
	ready = true
