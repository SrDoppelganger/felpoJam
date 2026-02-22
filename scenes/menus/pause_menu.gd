extends Control

func _ready():
	hide()
	print(get_tree().paused)

func _process(delta: float) -> void:
	escPress()

func resume():
	get_tree().paused = false
	hide()


func pause():
	get_tree().paused = true
	print(get_tree().paused)
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
