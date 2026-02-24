#Script para que ajudar a tocar os dialogos certos na hora certa.
extends Node


#para saber qual minigame já foi feito
var intro:bool = true;
var minigame1:bool = false;
var minigame2:bool = false;
var minigame3:bool = false;

func clearMinigame(scenario:String):
	match scenario:
		"minigame1":
			intro = false;
			minigame1 = true;
		"minigame2":
			intro = false;
			minigame1 = false
			minigame2 = true;
		"minigame3":
			intro = false;
			minigame1 = false;
			minigame2 = false;
			minigame3 = true;
	
func getLastMinigame(minigame:String):
	match minigame:
		"intro":
			return intro;
		"minigame1":
			return minigame1;
		"minigame2":
			return minigame2;
		"minigame3":
			return minigame3;
