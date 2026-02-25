extends Control

@onready var texture_button: TextureButton = $TextureButton
signal onFocus
var dialog

func _ready() -> void:
	dialog = load("res://Scripts/dialogues/gatoZap.dialogue");

# Called when the node enters the scene tree for the first time.
func _process(_delta:float) -> void:
	texture_button.visible = GlobalScript.phone_enabled
	texture_button.disabled = !GlobalScript.phone_enabled

func _on_texture_button_pressed() -> void:
	print("meow")
	onFocus.emit();
	DialogueManager.show_dialogue_balloon(dialog)
