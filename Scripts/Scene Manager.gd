extends Node2D

func change_scene(path):
	var scene = load(path).instance()
	get_child(2).free()
	add_child(scene)
	move_child(scene, 2)

func transition(path):
	if not "menu" in str(get_child(2).name):
		$"/root/Global".caching_start()
		
	$Transition/ColorRect.visible = true
	$Transition/AnimationPlayer.play("Fade")
	get_tree().paused = true
	yield($Transition/AnimationPlayer, "animation_finished")
	
	
	change_scene(path)
	
	
	$Transition/AnimationPlayer.play_backwards("Fade")
	get_tree().paused = false
	yield($Transition/AnimationPlayer, "animation_finished")
	$Transition/ColorRect.visible = false
