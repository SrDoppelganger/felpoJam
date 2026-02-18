extends Node
@onready var carimbado: AudioStreamPlayer = $carimbado;

var score: int = 0;

# Caso necessário, add param. de valor para pontuações diferentes
func addScore():
	score += 1;

func playEffect(sound):
	match sound:
		"stamp":
			carimbado.play();
