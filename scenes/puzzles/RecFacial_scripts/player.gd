extends CharacterBody2D

const SPEED = 600
const STOP_DISTANCE = 10   # pixels

# ZOOM
@export var min_zoom: Vector2 = Vector2(0.4, 0.4)
@export var max_zoom: Vector2 = Vector2(2, 2)
@export var zoom_speed: Vector2 = Vector2(0.1, 0.1)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			if scale > min_zoom:
				scale -= zoom_speed
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			if scale < max_zoom:
				scale += zoom_speed
				

func _physics_process(_delta: float) -> void:
	var mouse_position = get_global_mouse_position()
	var distance = position.distance_to(mouse_position)
	if distance > STOP_DISTANCE:
		if (mouse_position.y > 216.0) and (mouse_position.y < 434.0):
			var direction = (mouse_position - position).normalized()
			velocity = direction * SPEED
		else:
			velocity = Vector2.ZERO
	else:
		velocity = Vector2.ZERO # Para de correr quando chega na STOP_DISTANCE
	move_and_slide()
