extends Node2D

@onready var cutscene: AnimationPlayer = $Cutscene

var dialog;
var curr_scene;
var cakeGiven: bool = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SceneHandler.curr_room = "chefe"
	
	SceneHandler.setLastMinigame("minigame3")
	
	dialog = load("res://Scripts/dialogues/sala_do_chefe.dialogue");
	curr_scene = SceneHandler.getLastMinigame();
	if curr_scene == "minigame3":
		cutscene.play("final");
		GlobalScript.setCutscene(true);

func _on_cutscene_animation_finished(_anim_name: StringName) -> void:
	DialogueManager.show_dialogue_balloon(dialog);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if SceneHandler.theEnd:
		$Ending.show()
		$Ending/Bolo.disabled = false;

func _on_bolo_pressed() -> void:
	#tocar som
	await get_tree().create_timer(1.0).timeout #ou detectar quando o som acabar :p
	get_tree().change_scene_to_file("res://scenes/menus/creditos.tscn")


func _on_bolo_mouse_entered() -> void:
	GlobalScript.cursor(1);
func _on_bolo_mouse_exited() -> void:
	GlobalScript.cursor(0);
