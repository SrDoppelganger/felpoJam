extends Control

signal openConfig;

func _ready():
	hide()

func _process(_delta: float) -> void:
	escPress()

func resume():
	get_tree().paused = false
	hide()


func pause():
	get_tree().paused = true
	show()

func escPress():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		resume()

func _on_resumir_button_down() -> void:
	resume()

func _on_menu_principal_button_down() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menus/MainMenu.tscn");


func _on_config_pressed() -> void:
	openConfig.emit();
	hide();

func _on_config_open_pause() -> void:
	show();
