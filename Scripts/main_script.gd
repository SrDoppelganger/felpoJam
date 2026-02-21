extends Node2D

@onready var score: Label = $HUD/Score


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score.text = "Pontos: " + str(GlobalScript.score);
	var mouseLocation = get_global_mouse_position();
	if Input.is_action_just_pressed("click"):
		print(mouseLocation);

func spawn_arquivos():
	pass
