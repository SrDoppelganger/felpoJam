extends Control

func _ready() -> void:
	GlobalScript.playMusic("placeholder");

#VOLUME MASTER
func _on_volume_master_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value);
func _on_mute_master_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0,toggled_on);

#VOLUME MÚSICA
func _on_volume_musica_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1,value);
func _on_mute_musica_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(1,toggled_on);

#VOLUME EFEITOS SONOROS
func _on_volume_efeito_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2,value);
func _on_mute_efeito_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(2,toggled_on);


func _on_button_pressed() -> void:
	hide();
