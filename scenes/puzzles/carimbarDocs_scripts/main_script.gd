extends Node2D

@onready var targetNode = get_tree().get_first_node_in_group("alvos");
@onready var alvos: Node2D = $alvos

@onready var score: Label = $HUD/Score
@onready var tentativas_label: Label = $HUD/tentativasContainer/Tentativas
@onready var wave_label: RichTextLabel = $HUD/wave_label
@onready var tinta: Label = $HUD/tintaContainer/Tinta

var stamped: int = 0;
var goal:int = 5;
var tentativas:int = 3;

@onready var spawn_rate: Timer = $SpawnRate
@onready var wave_timer: Timer = $WaveTimer

@onready var cutscene: AnimationPlayer = $cutscene

@onready var killzone: CollisionShape2D = $killzone/CollisionShape2D


var game_state:String = 'onGoing'
var curr_wave:int = 1;
var last_wave:int = 1;

var win_dialog;
var lose_dialog;

var inTutorial: bool;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inTutorial = true;
	win_dialog = load("res://Scripts/dialogues/minigame1_win.dialogue");
	lose_dialog = load("res://Scripts/dialogues/minigame1_lose.dialogue");
	GlobalScript.score = 0;
	GlobalScript.fillAmmo();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if inTutorial:
		tutorialLogic();
	elif !inTutorial:
		gameLogic();

#funções para deixar o ready e process mais legivel T .T
func tutorialLogic():
	$tutorial_layer.visible = true
	if Input.is_action_just_pressed("spacebar"):
		$tutorial_layer.visible = false;
		score.visible = true;
		inTutorial = false;
		spawn_rate.start();


func gameLogic():
	score.text = "Onda: "+ str(curr_wave) + "\n" + str(GlobalScript.score)+"/"+str(goal);
	tentativas_label.text = str(tentativas);
	tinta.text = str(GlobalScript.ammo);
	stamped = GlobalScript.score;
	updateWave(stamped);
	checkWave(last_wave);
func updateWave(pontos):
	if pontos < 5:
		curr_wave = 1;
	elif pontos >= 5 and pontos < 15:
		curr_wave = 2;
		goal = 15;
	elif pontos >= 15 and pontos < 30:
		curr_wave = 3;
		goal = 30;
	else:
		curr_wave = 4;

func checkWave(check:int):
	if curr_wave != check:
		disableKillzone();
		wave_timer.start();
		last_wave = curr_wave
		updateGoal(curr_wave);
		wave_label.show();
		
		
func updateGoal(wave:int):
	match wave:
		1:
			wave_label.text = "Onda completa!!!"
		2:
			wave_label.text = "Onda completa!!!"
		3:
			wave_label.text = "Onda completa!!!"
		4:
			wave_label.text = "Trabalho feito!"
func updateSpawn(wave: int):
	match wave:
		"1":
			spawn_rate.wait_time = 1.5;
		"2":
			spawn_rate.wait_time = 1.0;
		"3":
			spawn_rate.wait_time = 0.5;

func disableKillzone():
	killzone.disabled = true;

func spawn_arquivos():
	var spawn_pos = %PathFollow2D.global_position;
	var novo_arq = preload("res://scenes/puzzles/carimbarDocs_scripts/arquivo.tscn").instantiate();
	#randomiz a ponto de spawn
	%PathFollow2D.progress_ratio = randf();
	novo_arq.global_position = spawn_pos;
	#adiciona arquivo na tela
	targetNode.call_deferred("add_child",novo_arq)

#spawn rate dos arquivos
func _on_spawn_rate_timeout() -> void:
	if wave_timer.is_stopped():
		if curr_wave <= 3 and tentativas > 0:
			spawn_arquivos();
		elif curr_wave > 3 and tentativas > 0:
			spawn_rate.stop();
			victory();
		if tentativas <= 0:
			spawn_rate.stop();
			lose();

func victory():
	DialogueManager.show_dialogue_balloon(win_dialog);
	game_state = "victory"
	GlobalScript.playEffect("yay");
	playCutscene();

func lose():
	DialogueManager.show_dialogue_balloon(lose_dialog);
	game_state = "loss";

# detecta qnd um arquivo passa
func _on_killzone_area_entered(_area: Area2D) -> void:
	if tentativas > 0:
		tentativas -= 1;

func _on_tinta_pressed() -> void:
	GlobalScript.fillAmmo();
	
func _on_wave_timer_timeout() -> void:
	wave_label.hide();
	GlobalScript.fillAmmo();
	tentativas = 3;
	killzone.disabled = false;  

func playCutscene():
	cutscene.play("documento");
