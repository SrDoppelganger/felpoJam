extends Node2D

@onready var line_edit: LineEdit = $Login/LineEdit
@onready var label: Label = $Login/Label
@onready var sprite: AnimatedSprite2D = $Login/AnimatedSprite2D

@onready var punchline: CanvasLayer = $Punchline

var attempt: int = 0
var correct_text: String = "3310"

var dialog;
var dialogPlaying:bool = false;

func _ready():
	dialog = load("res://Scripts/dialogues/minigame3.dialogue");
	#detecta texto que está dentro da caixa de texto
	line_edit.text_submitted.connect(_on_lineEdit_text_entered)
	
	sprite.play("fail1")

#função que pega o texto que o usuário digitou
func _on_lineEdit_text_entered(input_text: String):
	# n ter ++ me deixa triste
	attempt += 1
	
	match attempt:
		1:
			fail_captcha("fail2")
		2:
			fail_captcha("success")
		_:
			if input_text == correct_text:
				success_captcha()
			else:
				fail_captcha("success")

func fail_captcha(next: String):
	await get_tree().create_timer(1.0).timeout
	label.text = "INCORRETO, TENTE NOVAMENTE"
	label.add_theme_color_override("font_color","#ff0800");
	line_edit.clear()
	
	sprite.play(next)
	
func success_captcha():
	label.text = "VERIFICADO!"
	label.add_theme_color_override("font_color","#7fff00");
	line_edit.editable = false
	await get_tree().create_timer(1.0).timeout
	GlobalScript.changeTrack("yay");
	$Punchline.show();
	$Login.hide();
	await get_tree().create_timer(1.0).timeout
	playCutscene();

func playCutscene():
	dialogPlaying = true;
	DialogueManager.show_dialogue_balloon(dialog)
