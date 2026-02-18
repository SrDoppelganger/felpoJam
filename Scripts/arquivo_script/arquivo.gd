extends Node2D
@onready var area_2d: Area2D = $Area2D

const SPEED = 0.7;
var velocity: Vector2;
var target_position: Vector2;

func _ready() -> void:
	var target_x = randf_range(20, 1122);
	var target_y = randf_range(150, 625);
	
	target_position = Vector2(target_x, target_y);
	
func _process(delta: float) -> void:
	velocity = (target_position - position) * SPEED * delta
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
