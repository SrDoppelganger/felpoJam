extends Node2D
@onready var area_2d: Area2D = $Area2D
@onready var sprite: AnimatedSprite2D = $Area2D/Sprite2D

const SPEED = 1;
var velocity: Vector2;
var target_position: Vector2;
var spawn_position: Vector2;

#var para mudar sprites
var carimbado:bool = false

#deixando como var global para acessar no timeout
var target_x;
var target_y;

func _ready() -> void:
	target_x = randi_range(200, 1000);
	target_y = randi_range(150, 300);
	spawn_position = position;
	
	target_position = Vector2(target_x, target_y);
	
func _process(delta: float) -> void:
	if !carimbado:
		velocity = (target_position - position) * SPEED * delta
		translate(velocity)
	else:
		pass
	

func _on_area_2d_mouse_entered() -> void:
	pass;

func _on_area_2d_mouse_exited() -> void:
	pass;

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and !carimbado:
		if event.pressed:
			GlobalScript.playEffect("stamp");
			GlobalScript.addScore();
			sprite.play("stamped");
			carimbado = true;

# Faz o arquivo sair da mesa
func _on_timer_timeout() -> void:
	if !carimbado:
		var x = target_x
		var y = randi_range(900, 1000);
		target_position = Vector2(x,y);
	else:
		pass
