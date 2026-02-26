#Script para que ajudar a tocar os dialogos certos na hora certa.
extends Node


#para saber qual minigame já foi feito
var intro:bool = true;
var minigame1:bool = false;
var minigame2:bool = false;
var minigame3:bool = false;

var lastMinigame: String = "start";

#variaveis para salvar a pos. global do gato
var gatoPosition:Vector2;
var justFinished:bool = false;

func clearMinigame(scenario:String):
	match scenario:
		"minigame1":
			minigame1 = true;
			setLastMinigame("minigame1");
		"minigame2":
			minigame2 = true;
			setLastMinigame("minigame2");
		"minigame3":
			minigame3 = true;
			setLastMinigame("minigame3");

func setLastMinigame(minigame):
	lastMinigame = minigame;
func getLastMinigame():
	return lastMinigame;
