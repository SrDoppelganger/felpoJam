extends Node2D

@onready var line_edit: LineEdit = $CanvasLayer/LineEdit
@onready var label: Label = $CanvasLayer/Label

func _ready():
	#detecta texto que está dentro da caixa de texto
	line_edit.text_submitted.connect(_on_lineEdit_text_entered)

#função que pega o texto que o usuário digitou
func _on_lineEdit_text_entered(input_text: String):
	label.text = input_text;
