extends Control

func _ready() -> void:
	GlobalScript.playMusic("main");

func _on_jogar_pressed() -> void:
	$confirm.play();
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/salas/recepcao.tscn")


func _on_fechar_pressed() -> void:
	$confirm.play();
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()


func _on_créditos_pressed() -> void:
	$confirm.play();
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/menus/creditos.tscn")


func _on_config_open_pause() -> void:
	$confirm.play();
	$Config.hide();
func _on_opções_pressed() -> void:
	$confirm.play();
	$Config.show();
