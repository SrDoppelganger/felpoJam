extends CharacterBody2D


const SPEED = 8000.0
var target = position;

func _ready() -> void:
	$NavigationAgent2D.target_position = position

func _input(event):
	if event.is_action_pressed("click"):
		$NavigationAgent2D.target_position = get_global_mouse_position();

func _physics_process(delta: float) -> void:	
	#testando movimento usando navAgent2D
	if !$NavigationAgent2D.is_target_reached():
		var nav_direction = to_local($NavigationAgent2D.get_next_path_position()).normalized();
		velocity = nav_direction * SPEED * delta
		move_and_slide()
