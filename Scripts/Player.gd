extends KinematicBody2D

#States
enum {
	IDLE,
	WALK,
	RUN,
	JUMP,
	FALL,
	INTERACT
}

enum {
	LEFT,
	RIGHT
}

#Variables
export(int) var walkspeed = 300
export(int) var sprintspeed = 600
export(int) var jumpspeed = 1000
var velocity: Vector2
var speed = walkspeed
var state = IDLE
var event = false

onready var direction = $"/root/Global".direction

onready var sprite = $Sprite
onready var interacting = $InteractTimer



func _ready():
	$"/root/Global".register_player(self)



func input_processing():
	if Input.is_action_pressed("Up"):
		if is_on_floor():
			velocity.y -= jumpspeed

	if Input.is_action_pressed("Shift"):
		speed = lerp(speed,sprintspeed,0.15)
	else:
		speed = lerp(speed,walkspeed,0.15)

	if Input.is_action_pressed("Right") and Input.is_action_pressed("Left"):
		pass
	elif Input.is_action_pressed("Left"):
		velocity.x = -speed
	elif Input.is_action_pressed("Right"):
		velocity.x = speed
		
	elif Input.is_action_pressed("Down"):
		if interacting.is_stopped():
			interacting.wait_time = 0.5
			interacting.start()



func detect_state():
	if is_on_floor() == false and is_on_ceiling() == false:
		if velocity.y < 0:
			state = JUMP
		elif velocity.y > 0:
			state = FALL
	else:
		if velocity.x > walkspeed or velocity.x < -walkspeed:
			state = RUN
		elif velocity.x > -25 and velocity.x < 25:
			if interacting.is_stopped():
				state = IDLE
			else:
				state = INTERACT
		else:
			state = WALK



func detect_direction():
	if velocity.x != 0:
		if velocity.x < 0:
			direction = LEFT
		elif velocity.x > 0:
			direction = RIGHT



func gravity():
	if velocity.y < 500:
		velocity.y += 25



func event_triggered():
	print("Event Triggered")
	event = true
	yield(get_tree().create_timer(0.5), "timeout")
	event = false



func _physics_process(delta):
	detect_state()
	match state:
		IDLE:
			sprite.play("idle")
		WALK:
			sprite.play("walk")
		RUN:
			sprite.play("run")
		JUMP:
			sprite.play("jump")
		FALL:
			sprite.play("fall")
		INTERACT:
			yield(get_tree().create_timer(delta), "timeout")
			if not event:
				sprite.play("interact")

	detect_direction()
	match direction:
		LEFT:
			sprite.flip_h = true
		RIGHT:
			sprite.flip_h = false

	input_processing()
	gravity()
	move_and_slide(velocity, Vector2(0,-1))
	velocity.x = lerp(velocity.x,0,0.15)
