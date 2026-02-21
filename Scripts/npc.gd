extends Node2D

@export_enum("godot") var animation:String;
@onready var sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loadSprite(animation);

#func para carregar os sprites do NPC
func loadSprite(anim):
	match anim:
		"godot":
			sprite_2d.play("godot_idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			print("bweh");
