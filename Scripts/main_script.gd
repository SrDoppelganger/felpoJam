extends Node2D

@onready var score: Label = $HUD/Score
@onready var targetNode = get_tree().get_first_node_in_group("alvos");

var stamped: int = 0;
@onready var spawn_rate: Timer = $SpawnRate

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score.text = "Pontos: " + str(GlobalScript.score);
	stamped = GlobalScript.score;
	var mouseLocation = get_global_mouse_position();
	if Input.is_action_just_pressed("click"):
		#print(mouseLocation);
		pass

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
	if stamped < 10:
		spawn_arquivos();
	else:
		spawn_rate.stop();
