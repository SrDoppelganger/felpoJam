extends Node2D
@onready var intro_cutscene: AnimationPlayer = $Intro_cutscene
var dialog;
var catraca: bool = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialog = load("res://Scripts/dialogues/intro.dialogue");
	intro_cutscene.play("intro");
	GlobalScript.setCutscene(true);

func _process(_delta: float) -> void:
	if catraca:
		$catraca/AudioStreamPlayer.play();
		get_tree().change_scene_to_file("res://scenes/puzzles/carimbarDocs.tscn");

func _on_intro_cutscene_animation_finished(_anim_name: StringName) -> void:
	DialogueManager.show_dialogue_balloon(dialog);
	GlobalScript.setCutscene(false);

#lógica para cena de elevador
func _on_catraca_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		catraca = true
