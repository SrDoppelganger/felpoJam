extends Node2D


@onready var targetNode = get_tree().get_first_node_in_group("alvos");

@onready var score: Label = $HUD/Score
@onready var tentativas_label: Label = $HUD/tentativasContainer/Tentativas

@onready var tinta: Label = $HUD/tintaContainer/Tinta

var stamped: int = 0000;
var tentativas:int = 3;

@onready var spawn_rate: Timer = $SpawnRate

var game_state:String = 'onGoing'


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalScript.score = 0000;
	GlobalScript.fillAmmo();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	score.text = "Pontos: " + str(GlobalScript.score);
	tentativas_label.text = str(tentativas);
	tinta.text = str(GlobalScript.ammo);
	stamped = GlobalScript.score;
	
	if Input.is_action_just_pressed("click") and game_state != "onGoing":
		endGame(game_state);

func spawn_arquivos():
	var spawn_pos = %PathFollow2D.global_position;
	var novo_arq = preload("res://scenes/puzzles/carimbarDocs_scripts/arquivo.tscn").instantiate();
	#randomiza ponto de spawn
	%PathFollow2D.progress_ratio = randf();
	novo_arq.global_position = spawn_pos;
	#adiciona arquivo na tela
	targetNode.call_deferred("add_child",novo_arq)

#spawn rate dos arquivos
func _on_spawn_rate_timeout() -> void:
	if stamped < 10000 and tentativas > 0:
		spawn_arquivos();
	elif stamped >= 10000 and tentativas > 0:
		spawn_rate.stop();
		victory();
	if tentativas <= 0:
		spawn_rate.stop();
		lose();

func endGame(state:String):
	match state:
		"loss":
			get_tree().reload_current_scene();
		"victory":
			get_tree().change_scene_to_file("res://scenes/puzzles/RecFacial.tscn");

func victory():
	game_state = "victory"
	GlobalScript.playEffect("yay");

func lose():
	game_state = "loss";

# detecta qnd um arquivo passa
func _on_killzone_area_entered(_area: Area2D) -> void:
	if tentativas > 0:
		tentativas -= 1;


func _on_tinta_pressed() -> void:
	GlobalScript.fillAmmo();
