extends Node
@onready var carimbado: AudioStreamPlayer = $carimbado;
@onready var yay: AudioStreamPlayer = $yay

#variavel para para o input de andar enquanto a caixa de dialogo está ativa
var speaking: bool;
#variavel para saber se o jogo está numa cutscene
var is_in_cutscene: bool;
var score: int = 0;

# Caso necessário, add param. de valor para pontuações diferentes
func addScore():
	score += 1;

# Funções para gerenciar cutscenes
func setCutscene(value:bool):
	is_in_cutscene = value;
func getCutscene():
	return is_in_cutscene;

func playMusic(track):
	match track:
		"placeholder":
			$Musgas/placeholder.play();
		"yay":
			yay.play();

func playEffect(sound):
	match sound:
		"stamp":
			carimbado.play();
		"yay":
			yay.play();
