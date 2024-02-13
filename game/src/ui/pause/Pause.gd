# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Control

onready var buttons:VBoxContainer = $Buttons

func _on_PauseButton_pressed() -> void:
	Global.click()
	buttons.show()
	get_tree().paused = true
	
func _on_Menu_pressed() -> void:
	if Global.music:
		Global.music_loop.fade_in()
	Global.click()
	if not Global.current_league_game.empty():
#		Global.game_over(5,0)
		Global.game_over(0,5)
	get_tree().paused = false
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")


func _on_Resume_pressed() -> void:
	Global.click()
	buttons.hide()
	get_tree().paused = false
