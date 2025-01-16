# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Control

func _on_League_pressed() -> void:
	Global.click()
	if Global.league_started:
		get_tree().change_scene("res://src/ui/championship/dashboard/Dashboard.tscn")
	else:
		get_tree().change_scene("res://src/ui/championship/Championship.tscn")


func _on_Arcade_pressed() -> void:
	Global.click()
	get_tree().change_scene("res://src/ui/game/arcade/ArcadeDashboard.tscn")


func _on_Single_Match_pressed() -> void:
	Global.click()
	get_tree().change_scene("res://src/ui/difficulty/DifficultySelection.tscn")


func _on_OneVsOne_pressed() -> void:
	Global.click()
	Global.set_home_team({})
	Global.set_away_team({})
	Global.home_team_power = 10
	Global.home_team_speed = 10
	Global.away_team_power = 10
	Global.away_team_speed = 10
	get_tree().change_scene("res://src/ui/game/multiplayer/Multiplayer.tscn")


func _on_BotVsBot_pressed() -> void:
	Global.click()
	Global.set_home_team({})
	Global.set_away_team({})
	Global.away_team_power = 10
	Global.away_team_speed = 10
	Global.home_team_power = 2
	Global.home_team_speed = 2
	get_tree().change_scene("res://src/ui/bots-difficulty/BotsDifficultySelection.tscn")


func _on_Back_pressed() -> void:
	Global.click()
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")

