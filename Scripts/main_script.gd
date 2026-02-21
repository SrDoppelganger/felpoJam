extends Node2D


@onready var targetNode = get_tree().get_first_node_in_group("alvos");

@onready var score: Label = $HUD/Score
@onready var tentativas_label: Label = $HUD/Tentativas

@onready var label_carimbado: Label = $HUD/label_carimbado
@onready var carimbado_sublabel: Label = $HUD/carimbado_sublabel

var stamped: int = 0;
var tentativas:int = 3;

@onready var spawn_rate: Timer = $SpawnRate

var win_state:bool = false;
var lose_state:bool = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	score.text = "Pontos: " + str(GlobalScript.score);
	tentativas_label.text = "Tentativas: " + str(tentativas);
	stamped = GlobalScript.score;
	if Input.is_action_just_pressed("click") and win_state:
		#carregar próxima cena aq
		get_tree().change_scene_to_file("res://scenes/puzzles/RecFacial.tscn");
	elif Input.is_action_just_pressed("click") and lose_state:
		#carregar próxima cena aq
		get_tree().reload_current_scene();

func spawn_arquivos():
	var spawn_pos = %PathFollow2D.global_position;
	var novo_arq = preload("res://scenes/arquivo.tscn").instantiate();
	#randomiza ponto de spawn
	%PathFollow2D.progress_ratio = randf();
	novo_arq.global_position = spawn_pos;
	#adiciona arquivo na tela
	targetNode.call_deferred("add_child",novo_arq)

#spawn rate dos arquivos
func _on_spawn_rate_timeout() -> void:
	if stamped < 10 and tentativas > 0:
		spawn_arquivos();
	elif stamped >= 10 and tentativas > 0:
		spawn_rate.stop();
		victory();
	if tentativas <= 0:
		spawn_rate.stop();
		lose();

func victory():
	label_carimbado.text = "Carimbado!";
	carimbado_sublabel.text = "clique em qualquer lugar para continuar";
	label_carimbado.visible = true;
	carimbado_sublabel.visible = true;
	win_state = true;
	GlobalScript.playEffect("yay");

func lose():
	label_carimbado.text = "Você perdeu o prazo!";
	carimbado_sublabel.text = "clique em qualquer lugar para tentar de novo";
	label_carimbado.visible = true;
	carimbado_sublabel.visible = true;
	lose_state = true;

# detecta qnd um arquivo passa
func _on_killzone_area_entered(_area: Area2D) -> void:
	if tentativas > 0:
		tentativas -= 1;
