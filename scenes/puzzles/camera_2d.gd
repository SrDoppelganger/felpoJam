extends Camera2D


@export var min_zoom: Vector2 = Vector2(0.4, 0.4)
@export var max_zoom: Vector2 = Vector2(2, 2)
@export var zoom_speed: Vector2 = Vector2(0.1, 0.1)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			if zoom > min_zoom:
				zoom -= zoom_speed
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			if zoom < max_zoom:
				zoom += zoom_speed
