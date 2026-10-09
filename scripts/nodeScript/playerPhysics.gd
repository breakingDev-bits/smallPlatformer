extends CharacterBody2D

const BASE_JUMP_VELOCITY = -400.0
const BASE_SPEED = 400.0
const GRAVITY = 1200.0

var jump_velocity = BASE_JUMP_VELOCITY
var speed = BASE_SPEED

func handle_input(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
		
	if is_on_floor():
		if Input.is_action_pressed("ui_sprint"):
			speed = BASE_SPEED * 2.0
			jump_velocity = BASE_JUMP_VELOCITY*1.5
		else:
			speed = move_toward(speed, BASE_SPEED, 1200.0 * delta)
			jump_velocity = BASE_JUMP_VELOCITY
	else:
		var air_target = BASE_SPEED * 1.8 if Input.is_action_pressed("ui_sprint") else BASE_SPEED
		if velocity.y > 0:
			var fall_modifier = clamp(remap(velocity.y, 0.0, 600.0, 1.0, 1.5), 1.0, 1.5)
			air_target *= fall_modifier
			
			speed = move_toward(speed, air_target, 600.0 * delta)
		else:
			speed = air_target

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	handle_input(delta)

	var direction := Input.get_axis("ui_left", "ui_right")
		
	if direction != 0:
		var is_reversing = (direction * velocity.x) < 0
		
		if is_reversing:
			var turn_decel = 6000.0 if is_on_floor() else 3000.0
			velocity.x = move_toward(velocity.x, direction * speed, turn_decel * delta)
		else:
			velocity.x = direction * speed
	else:
		var deceleration = 3000.0 if is_on_floor() else 1500.0
		velocity.x = move_toward(velocity.x, 0.0, deceleration * delta)

	move_and_slide()
