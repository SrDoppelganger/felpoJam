extends CharacterBody2D

const SPEED = 300.0
var target = position;
var cutscene_state = GlobalScript.getCutscene();

var onMenu:bool;

func _ready() -> void:
	$NavigationAgent2D.target_position = position

func _input(event):
	if event.is_action_pressed("click") and !GlobalScript.speaking:
		$NavigationAgent2D.target_position = get_global_mouse_position();
		if $NavigationAgent2D.target_position.x < position.x:
			$AnimatedSprite2D.flip_h = true;
		else:
			$AnimatedSprite2D.flip_h = false;
	if onMenu:
		$NavigationAgent2D.target_position = get_global_mouse_position();
	

func _physics_process(delta: float) -> void:	
	#testando movimento usando navAgent2D
	if !$NavigationAgent2D.is_target_reached() and !GlobalScript.speaking:
		var nav_direction = to_local($NavigationAgent2D.get_next_path_position()).normalized();
		var distance = position.distance_to($NavigationAgent2D.target_position)
		var max_speed = (distance/delta)
		velocity = nav_direction * min(SPEED, max_speed);
		move_and_slide()
	if GlobalScript.speaking:
		$NavigationAgent2D.target_position = position;
		
	#para de mover o jogador em cutscenes
	if cutscene_state:
		$NavigationAgent2D.target_position = position;

func _on_gato_phone_on_focus() -> void:
	$NavigationAgent2D.target_position = position;
