# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Control

var revived:bool = false

var _coins:int = 0
var _score:int = 0

onready var animation_player:AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	if OS.get_name() == "iOS":
		$CenterContainer/MarginContainer/VBoxContainer/Highscore.show()

	
func is_highscore(highscore:int) -> void:
	if highscore:
		$Highscore.play()
		$NewHighscore.show()

func set_collected_coins_and_score(collected_coins:int ,score:int) -> void:
	_coins = collected_coins
	_score = score
	$VBoxContainer/HBoxContainer/Coins.text = str(collected_coins * 50) + "x" + str(score) 
	Global.music_loop.fade_in()
	
func _on_Replay_pressed() -> void:
	Global.click()
	Global.add_coins(_coins * 50 * _score)
	get_tree().paused = false
	get_tree().change_scene("res://src/ui/game/arcade/Arcade.tscn")


func _on_Continue_pressed() -> void:
	Global.click()
	Global.add_coins(_coins * 50 * _score)
	get_tree().paused = false
	get_tree().change_scene("res://src/ui/game/arcade/ArcadeDashboard.tscn")

func _on_Revive_pressed() -> void:
	Global.click()
	Global.music_loop.fade_out()
	
	

func _on_GameOver_visibility_changed() -> void:
	if revived:
		$CenterContainer/MarginContainer/VBoxContainer/Revive.hide()
