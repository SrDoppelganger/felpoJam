extends Node2D

@onready var cutscene: AnimationPlayer = $Cutscene

var dialog;
var curr_scene;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#DEBUG
	SceneHandler.clearMinigame("minigame3");
	
	dialog = load("res://Scripts/dialogues/sala_do_chefe.dialogue");
	curr_scene = SceneHandler.getLastMinigame();
	if curr_scene == "minigame3":
		cutscene.play("final");
		GlobalScript.setCutscene(true);

func _on_cutscene_animation_finished(_anim_name: StringName) -> void:
	DialogueManager.show_dialogue_balloon(dialog);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
