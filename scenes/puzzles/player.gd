extends CharacterBody2D

const SPEED = 600
const STOP_DISTANCE = 10   # pixels

func _physics_process(delta: float) -> void:
	var mouse_position = get_global_mouse_position()
	var distance = position.distance_to(mouse_position)

	if distance > STOP_DISTANCE:
		var direction = (mouse_position - position).normalized()
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO # Para de correr quando chega na STOP_DISTANCE

	move_and_slide()
