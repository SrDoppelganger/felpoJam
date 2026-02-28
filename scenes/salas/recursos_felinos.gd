extends Node2D
@onready var carimberto: CharacterBody2D = $Carimberto

#variaveis do corredor
var corr_dialog;
var corr_near;
var corr_reachable:bool = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	corr_dialog = load("res://Scripts/dialogues/elevador_conf.dialogue");
	if SceneHandler.justFinished:
		SceneHandler.justFinished = false;
		$Carimberto.position = SceneHandler.gatoPosition;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if corr_near and corr_reachable and !GlobalScript.speaking:
		DialogueManager.show_dialogue_balloon(corr_dialog);
		corr_reachable = !corr_reachable;


func _on_corredor_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		corr_near = true;
func _on_corredor_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		corr_near = false;

func _on_corredor_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			corr_reachable = true;


func _on_emilho_is_talking_with_player() -> void:
	SceneHandler.gatoPosition = $Carimberto.position
