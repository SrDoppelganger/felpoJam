extends Node2D

@onready var sala_do_gato: Button = $Menu/VBoxContainer/SalaDoGato
@onready var rf: Button = $Menu/VBoxContainer/RF
@onready var gabinete: Button = $Menu/VBoxContainer/Gabinete

@onready var ding: AudioStreamPlayer = $Sons/ding


func _ready() -> void:
	#habilita e desabilita os botões dependendo do ultimo minigame feito
	sala_do_gato.disabled = !SceneHandler.intro;
	sala_do_gato.visible = SceneHandler.intro;
	
	rf.disabled = !SceneHandler.minigame2
	rf.visible = SceneHandler.minigame2
	
	gabinete.disabled = !SceneHandler.minigame3
	gabinete.visible = SceneHandler.minigame3
	
	SceneHandler.curr_room = "elevador"

func _on_recepcao_pressed() -> void:
	ding.play();
	get_tree().change_scene_to_file("res://scenes/salas/recepcao.tscn")

func _on_sala_do_gato_pressed() -> void:
	ding.play();
	get_tree().change_scene_to_file("res://scenes/salas/cubiculo.tscn");

func _on_rf_pressed() -> void:
	ding.play();
	get_tree().change_scene_to_file("res://scenes/salas/recursos_felinos.tscn");

func _on_gabinete_pressed() -> void:
	ding.play();
	get_tree().change_scene_to_file("res://scenes/salas/sala_do_chefe.tscn");


func button_mouse_entered() -> void:
	GlobalScript.cursor(1);
func button_mouse_exited() -> void:
	GlobalScript.cursor(0);
