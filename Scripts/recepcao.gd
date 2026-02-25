extends Node2D
@onready var intro_cutscene: AnimationPlayer = $Intro_cutscene
var dialog;
var catraca: bool = false;
var curr_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	curr_scene = SceneHandler.getLastMinigame();
	dialog = load("res://Scripts/dialogues/intro.dialogue");
	if curr_scene == "start":
		intro_cutscene.play("intro");
		GlobalScript.setCutscene(true);
	else:
		intro_cutscene.play("elevador");

func _process(_delta: float) -> void:
	if catraca:
		$catraca/AudioStreamPlayer.play();
		get_tree().change_scene_to_file("res://scenes/salas/elevador.tscn");

func _on_intro_cutscene_animation_finished(_anim_name: StringName) -> void:
	if curr_scene == "start":
		DialogueManager.show_dialogue_balloon(dialog);
		GlobalScript.setCutscene(false);
	else:
		pass

#lógica para cena de elevador
func _on_catraca_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		catraca = true
