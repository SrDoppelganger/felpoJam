extends Control

signal openPause;
func _ready() -> void:
	GlobalScript.playMusic("placeholder");

#VOLUME MASTER
func _on_volume_master_value_changed(value: float) -> void:
	if value == -50.0:
		AudioServer.set_bus_mute(0,true);
	else:
		AudioServer.set_bus_mute(0,false);
		AudioServer.set_bus_volume_db(0,value);

#VOLUME MÚSICA
func _on_volume_musica_value_changed(value: float) -> void:
	if value == -50.0:
		AudioServer.set_bus_mute(1,true);
	else:
		AudioServer.set_bus_mute(1,false);
		AudioServer.set_bus_volume_db(1,value);

#VOLUME EFEITOS SONOROS
func _on_volume_efeito_value_changed(value: float) -> void:
	if value == -50.0:
		AudioServer.set_bus_mute(2,true);
	else:
		AudioServer.set_bus_mute(2,false);
		AudioServer.set_bus_volume_db(2,value);


func _on_button_pressed() -> void:
	openPause.emit();
	hide();

func _on_pause_menu_open_config() -> void:
	show();
