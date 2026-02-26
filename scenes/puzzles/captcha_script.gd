extends Node2D

@onready var line_edit: LineEdit = $CanvasLayer/LineEdit
@onready var label: Label = $CanvasLayer/Label
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var attempt: int = 0
var text: String = ""

func _ready():
	#detecta texto que está dentro da caixa de texto
	line_edit.text_submitted.connect(_on_lineEdit_text_entered)

#função que pega o texto que o usuário digitou
func _on_lineEdit_text_entered(input_text: String):
	# n ter ++ me deixa triste
	attempt += 1

	if attempt < 3:
		fail_captcha()
	else:
		success_captcha()
		

func fail_captcha():
	await get_tree().create_timer(1.0).timeout
	label.text = "Incorreto, tente novamente"
	
	line_edit.clear()
	
func success_captcha():
	label.text = "Verificado!"
	
	line_edit.editable = false
