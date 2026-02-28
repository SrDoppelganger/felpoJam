extends Node2D
@onready var intro_cutscene: AnimationPlayer = $Intro_cutscene
var dialog;
var dialog2;
var catraca: bool = false;
var curr_scene

#var para cutscene de barramento de catraca
var isPlaying = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	curr_scene = SceneHandler.getLastMinigame();
	dialog = load("res://Scripts/dialogues/intro.dialogue");
	dialog2 = load("res://Scripts/dialogues/Mirtilanna_minigame_intro.dialogue");
	if curr_scene == "start":
		intro_cutscene.play("intro");
		GlobalScript.setCutscene(true);
	elif SceneHandler.justFinished:
		$Carimberto.position = SceneHandler.gatoPosition;
		SceneHandler.justFinished = false;
	else:
		intro_cutscene.play("elevador");

func _process(_delta: float) -> void:
	if intro_cutscene.current_animation == "minigame2_intro":
		if Input.is_action_just_pressed("click"):
			intro_cutscene.play("minigame2")
	
	if catraca and curr_scene != "minigame1":
		$catraca/AudioStreamPlayer.play();
		get_tree().change_scene_to_file("res://scenes/salas/elevador.tscn");
	elif catraca and curr_scene == "minigame1":
		startMinigame2();

func _on_intro_cutscene_animation_finished(anim_name: StringName) -> void:
	if curr_scene == "start" and anim_name == "intro":
		DialogueManager.show_dialogue_balloon(dialog);
		GlobalScript.setCutscene(false);
	elif curr_scene == "minigame1" and anim_name == "minigame2":
		SceneHandler.gatoPosition = $Carimberto.position;
		GlobalScript.minigame2Scene = true;
		DialogueManager.show_dialogue_balloon(dialog2);
		GlobalScript.setCutscene(false);
	else:
		pass

#lógica para cena de elevador
func _on_catraca_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		catraca = true

func startMinigame2():
	if !isPlaying:
		DialogueManager.show_dialogue_balloon(dialog2);
		intro_cutscene.play("minigame2_intro");
		isPlaying = true
