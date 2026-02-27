extends Control

# Eu n acho que precisa de _ready() ou _process() pra isso funcionar
# mas vou deixar aqui ainda caso de merda

# Called when the node enters the scene tree for the first time.
# func _ready() -> void:
#	 pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta: float) -> void:
# 	 pass


func _on_jogar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/salas/recepcao.tscn")


func _on_fechar_pressed() -> void:
	get_tree().quit()


func _on_créditos_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/creditos.tscn")


func _on_config_open_pause() -> void:
	$Config.hide();
func _on_opções_pressed() -> void:
	$Config.show();
