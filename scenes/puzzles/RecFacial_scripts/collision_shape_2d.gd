extends CollisionShape2D

func _ready() -> void:
	position.x = randf_range(-250, 750)
	position.y = randf_range(-43, 648)

func _on_area_2d_area_entered(_area: Area2D) -> void:
	print("colidiu")
