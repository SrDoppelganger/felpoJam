extends Node2D

const SPEED = 2;
var velocity = Vector2()

func _ready() -> void:
	velocity = Vector2(-SPEED, 0)

func _process(delta: float) -> void:
	translate(velocity)

func _on_area_2d_mouse_entered() -> void:
	print("MOUSE!");

func _on_area_2d_mouse_exited() -> void:
	print("bye bye");

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			GlobalScript.playEffect("stamp");
			GlobalScript.addScore();
			queue_free();
