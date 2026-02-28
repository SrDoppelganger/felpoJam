extends Node2D

var dialog;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialog = load("res://Scripts/dialogues/cubiculo.dialogue")
	DialogueManager.show_dialogue_balloon(dialog)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
