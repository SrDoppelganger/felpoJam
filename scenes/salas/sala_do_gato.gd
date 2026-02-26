extends Node2D
@onready var carimberto: CharacterBody2D = $Carimberto

var dialog;
var dialog2;

var mesa_near:bool;
var mesa_reachable:bool;
var corr_near:bool;
var corr_reachable:bool;
var curr_scene;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	curr_scene = SceneHandler.getLastMinigame();
	dialog = load("res://Scripts/dialogues/cubiculo_intro.dialogue");
	dialog2 = load("res://Scripts/dialogues/elevador_conf.dialogue");
	if SceneHandler.justFinished:
		SceneHandler.justFinished = false;
		carimberto.position = SceneHandler.gatoPosition;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if mesa_near and mesa_reachable and !GlobalScript.speaking:
		SceneHandler.gatoPosition = carimberto.position;
		DialogueManager.show_dialogue_balloon(dialog);
		mesa_reachable = !mesa_reachable;
	if corr_near and corr_reachable and !GlobalScript.speaking:
		DialogueManager.show_dialogue_balloon(dialog2);
		corr_reachable = !corr_reachable;

# reutilizei código da recepção, 'catraca' é a 'mesa_gato'
func _on_catraca_body_entered(_body: Node2D) -> void:
	#DialogueManager.show_dialogue_balloon(dialog);
	mesa_near = true;
func _on_catraca_body_exited(_body: Node2D) -> void:
	mesa_near = false;
func _on_catraca_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			mesa_reachable = true;


func _on_corredor_body_entered(_body: Node2D) -> void:
	corr_near = true;
func _on_corredor_body_exited(_body: Node2D) -> void:
	corr_near = false;
func _on_corredor_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			corr_reachable = true;
