extends Node2D

@export_enum("godot","Mirtilanna") var animation:String;
@onready var sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


#LEMBRETE: ADD AREA2D PARA TODA INSTANCIA DE NPC
#recebe o caminho para o arquivo de dialogo do plugin
@export_dir var dialogue_path;
var dialog;

var talkable: bool = false;
var near_player: bool

signal isTalkingWithPlayer;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loadSprite(animation);
	dialog = load(dialogue_path);

#func para carregar os sprites do NPC
func loadSprite(anim):
	match anim:
		"godot":
			sprite_2d.play("godot_idle")
		"Mirtilanna":
			sprite_2d.play("mirtilanna")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if talkable and near_player and !GlobalScript.speaking:
				isTalkingWithPlayer.emit();
				DialogueManager.show_dialogue_balloon(dialog);
				talkable = !talkable;

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			talkable = true;
			
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		near_player = true;

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		#DialogueManager.show_dialogue_balloon(dialog);
		near_player = false;
