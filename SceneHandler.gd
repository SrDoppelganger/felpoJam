#Script para que ajudar a tocar os dialogos certos na hora certa.
extends Node

var scene = 'intro';

func changeScenario(scenario:String):
	scene = scenario;
	
func getScenario():
	return scene;
