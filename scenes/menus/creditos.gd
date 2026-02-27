extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var membros: AnimatedSprite2D = $roll_call/membros
@export_enum("PLACEHOLDER","bell","doppel") var animation:String;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("créditos");

func _process(_delta: float) -> void:
	playSprite2D(animation);

func playSprite2D(anim):
	membros.play(anim)
	


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://scenes/menus/MainMenu.tscn")
