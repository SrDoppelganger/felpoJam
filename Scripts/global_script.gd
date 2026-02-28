extends Node
@onready var carimbado: AudioStreamPlayer = $carimbado;
@onready var yay: AudioStreamPlayer = $yay
@onready var confirm: AudioStreamPlayer = $confirm
@onready var moiado: AudioStreamPlayer = $moiado

#importar os cursores
var cursor_active = load("res://assets/graficos/Definitivo/cursor - clicker.png");
var cursor_neutral = load("res://assets/graficos/Definitivo/cursor - passivo.png");

var gatoName = "Cafélipe"

#variavel para para o input de andar enquanto a caixa de dialogo está ativa
var speaking: bool;
#variavel para saber se o jogo está numa cutscene
var is_in_cutscene: bool;
var score: int = 0000;

#variavies do minigame 1
var ammo:int = 5;
#ativar elementos da HUD
var phone_enabled = false;

#variaveis para cutscene do minigame2
var minigame2Scene:bool = false;

# funcs do minigame 1
func addScore(value):
	score += value;
func useAmmo():
	if ammo < 0:
		ammo = 0
	else:
		ammo -= 1;
func fillAmmo():
	ammo = 5;

# Funções para gerenciar cutscenes
func setCutscene(value:bool):
	is_in_cutscene = value;
func getCutscene():
	return is_in_cutscene;

func playMusic(track):
	match track:
		"main":
			$Musgas/main.play();

func playEffect(sound):
	match sound:
		"carimbado":
			carimbado.play();
		"yay":
			yay.play();
		"confirm":
			confirm.play();
		"moiado":
			moiado.play();
	
#Vou deixar o nome pequeno, já tô a mais de 8h programando...n consigo pensar em legibilidade agr...foi mal sucoDeArgila
func cursor(type):
	match type:
		0:
			Input.set_custom_mouse_cursor(cursor_neutral);
		1:
			Input.set_custom_mouse_cursor(cursor_active);
