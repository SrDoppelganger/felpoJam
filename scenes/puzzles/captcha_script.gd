extends Node2D

@onready var line_edit: LineEdit = $CanvasLayer/LineEdit
@onready var label: Label = $CanvasLayer/Label
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var attempt: int = 0
var correct_text: String = "3310"

func _ready():
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
		3:
			success_captcha()

func fail_captcha(next: String):
	await get_tree().create_timer(1.0).timeout
	label.text = "Incorreto, tente novamente"
	
	line_edit.clear()
	
	sprite.play(next)
	
func success_captcha():
	label.text = "Verificado!"
	
	line_edit.editable = false
