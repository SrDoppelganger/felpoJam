extends Node2D

@onready var instrucao: Label = $Instrucao/VBoxContainer/instrucao
var rng = RandomNumberGenerator.new()
@export var random: float
@onready var player = get_node("Player")
@onready var progressBar = get_node("Instrucao/VBoxContainer/ProgressBar")
@onready var Recon = get_node("Reconhecimento/CollisionShape2D")
@onready var retries = 0
signal retried

func _ready() -> void:
	random = rng.randf_range(0.6, 1.8)

func _process(_delta: float) -> void:
	facialRec()

func facialRec() -> void:
	var recArea = get_node("Reconhecimento/CollisionShape2D")
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
		retry(retries)
		retries += 1
		random = rng.randf_range(0.6, 1.8)
		retried.emit()
	elif retries >= 3:
		instrucao.text = "Reconhecimento realizado com sucesso!"

func retry(retries: int) -> void:
	instrucao.text = "Ocorreu um erro no reconhecimento, por favor tente novamente"
	progressBar.set_value(0.0)
