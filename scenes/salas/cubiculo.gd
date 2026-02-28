extends Node2D

var dialog;
var corr_dialog;
var mesa_dialog;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialog = load("res://Scripts/dialogues/cubiculo.dialogue");
	corr_dialog = load("res://Scripts/dialogues/elevador_conf.dialogue");
	mesa_dialog = load("res://Scripts/dialogues/Mesa_cubiculo.dialogue");
	DialogueManager.show_dialogue_balloon(dialog)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_corredor_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			DialogueManager.show_dialogue_balloon(corr_dialog)


func _on_mesa_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			DialogueManager.show_dialogue_balloon(mesa_dialog)



# Atualiza o gráfico dos cursores
func _on_corredor_mouse_entered() -> void:
	GlobalScript.cursor(1);
func _on_corredor_mouse_exited() -> void:
	GlobalScript.cursor(0);
