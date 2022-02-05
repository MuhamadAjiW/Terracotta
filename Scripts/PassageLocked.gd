extends Area2D

onready var delayTimer = $delayTimer
onready var locktimer = $lockTimer
export(String) var itemname = "none"
export(String) var path = ""
var called = false

func _ready():
	pass # Replace with function body.

func delay():
	if delayTimer.is_stopped():
		delayTimer.start(0.5)
func _on_delayTimer_timeout():
	called = false

func _process(delta):
	if overlaps_body($"/root/Global".player):
		if $"/root/Global".player.state == $"/root/Global".player.INTERACT:
			if $"/root/Global".inventory.get_node(itemname).visible == true:
				Global.door_name = name
				if called == false:
					$"/root/Global".player.event_triggered("passage")
					get_parent().get_parent().transition(path)
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
