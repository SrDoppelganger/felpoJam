extends Node2D
@onready var area_2d: Area2D = $Area2D

const SPEED = 1;
var velocity: Vector2;
var target_position: Vector2;
var spawn_position: Vector2;

func _ready() -> void:
	var target_x = randi_range(200, 1000);
	var target_y = randi_range(150, 625);
	spawn_position = position;
	
	target_position = Vector2(target_x, target_y);
	
func _process(delta: float) -> void:
	velocity = (target_position - position) * SPEED * delta
	translate(velocity)
	

func _on_area_2d_mouse_entered() -> void:
	pass;

func _on_area_2d_mouse_exited() -> void:
	pass;

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			GlobalScript.playEffect("stamp");
			GlobalScript.addScore();
			queue_free();

# Faz o arquivo sair da mesa
func _on_timer_timeout() -> void:
	var x = randi_range(28,1143);
	var y = randi_range(370, 400);
	
	target_position = Vector2();
