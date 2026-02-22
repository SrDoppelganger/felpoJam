extends CharacterBody2D

const SPEED = 600
const STOP_DISTANCE = 10   # pixels

#label com instrução pro jogador
@onready var instrucao: Label = $"../CanvasLayer/instrucao"

# ZOOM
@export var min_zoom: Vector2 = Vector2(0.4, 0.4)
@export var max_zoom: Vector2 = Vector2(2, 2)
@export var zoom_speed: Vector2 = Vector2(0.1, 0.1)

var rng = RandomNumberGenerator.new()
@export var random: float
func _ready():
	random = rng.randf_range(0.4, 2)
	print(random)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			if scale > min_zoom:
				scale -= zoom_speed
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			if scale < max_zoom:
				scale += zoom_speed

func _physics_process(_delta: float) -> void:
	var mouse_position = get_global_mouse_position()
	var distance = position.distance_to(mouse_position)

	if distance > STOP_DISTANCE:
		var direction = (mouse_position - position).normalized()
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO # Para de correr quando chega na STOP_DISTANCE

	move_and_slide()
	
func _process(_delta: float) -> void:
	if (random - scale.x) < 0.2 and (scale.x - random) < 0.2:
		instrucao.text = "Scaneando, não se mexa";
	else:
		if (random - scale.x) < 0.2:
			instrucao.text = "Se afaste de camera";
		else:
			instrucao.text = "Se aproxime da camera";
