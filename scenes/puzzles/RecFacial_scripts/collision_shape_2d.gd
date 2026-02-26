extends CollisionShape2D

@export var isColliding = false

func _ready() -> void:
	randomArea()

func _on_area_2d_area_entered(_area: Area2D) -> void:
	isColliding = true
	
func _on_area_2d_area_exited(_area: Area2D) -> void:
	isColliding = false

func randomArea() -> void:
	position.x = randf_range(-52.0, 292.0)

func _on_rec_facial_retried() -> void:
	randomArea()
