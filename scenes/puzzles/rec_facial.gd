extends Node2D

@onready var instrucao: Label = $Instrucao/VBoxContainer/instrucao
var rng = RandomNumberGenerator.new()
@export var random: float
@onready var player = get_node("Player")
@onready var progressBar = get_node("Instrucao/VBoxContainer/ProgressBar")
@onready var Recon = get_node("Reconhecimento/CollisionShape2D")
@onready var Recon_sprite: ColorRect = $Reconhecimento/CollisionShape2D/ColorRect

@onready var retries = 0
signal retried

var messageTime: bool = false;
var win_state: bool;

func _ready() -> void:
	win_state = false;
	random = rng.randf_range(0.6, 1.8)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("click") and win_state:
		get_tree().change_scene_to_file("res://scenes/puzzles/captcha.tscn");
	elif !win_state:
		facialRec()

func facialRec() -> void:
	var recArea = get_node("Reconhecimento/CollisionShape2D")
	
	if messageTime:
		return
	
	if recArea.isColliding:
		if (random - player.scale.x) < 0.2 and (player.scale.x - random) < 0.2:
			instrucao.text = "Scaneando, não se mexa";
			progressBar.set_value(progressBar.get_value() + 0.2)
		else:
			if (random - player.scale.x) < 0.2:
				instrucao.text = "Se afaste de camera";
				progressBar.set_value(0.0)
			else:
				instrucao.text = "Se aproxime da camera";
				progressBar.set_value(0.0)
	else:
		instrucao.text = "Se aproxime da area"
		progressBar.set_value(0.0)

	if (progressBar.get_value() == 100.0) and (retries < 3):
		retry()
		retries += 1
		random = rng.randf_range(0.6, 1.8)
		
	elif retries >= 3:
		instrucao.text = "Reconhecimento realizado com sucesso!"
		GlobalScript.playEffect("yay")
		win_state = true;

func retry() -> void:
	messageTime = true;
	$Timers/MessageTime.start();
	Recon_sprite.hide();
	instrucao.text = "Ocorreu um erro no reconhecimento, por favor tente novamente"
	progressBar.set_value(0.0)

func _on_message_time_timeout() -> void:
	messageTime = false;
	Recon_sprite.show();
	retried.emit()
