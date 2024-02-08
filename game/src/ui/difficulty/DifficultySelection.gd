# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Control


func _ready() -> void:
	Global.set_home_team({})
	Global.set_away_team({})
	Global.current_league_game = {}
	Global.home_team_power = 10
	Global.home_team_speed = 10
	

func _on_Easy_pressed() -> void:
	Global.click()
	Global.away_team_power = 2.5
	Global.away_team_speed = 2.5
	get_tree().change_scene("res://src/ui/game/singleplayer/Singleplayer.tscn")


func _on_Medium_pressed() -> void:
	Global.click()
	Global.away_team_power = 4
	Global.away_team_speed = 4
	get_tree().change_scene("res://src/ui/game/singleplayer/Singleplayer.tscn")


func _on_Hard_pressed() -> void:
	Global.click()
	Global.away_team_power = 6
	Global.away_team_speed = 6
	get_tree().change_scene("res://src/ui/game/singleplayer/Singleplayer.tscn")
	


func _on_Extreme_pressed() -> void:
	Global.click()
	Global.away_team_power = 8
	Global.away_team_speed = 8
	get_tree().change_scene("res://src/ui/game/singleplayer/Singleplayer.tscn")


func _on_Legend_pressed() -> void:
	Global.click()
	Global.away_team_power = 10
	Global.away_team_speed = 10
	get_tree().change_scene("res://src/ui/game/singleplayer/Singleplayer.tscn")


func _on_GoBack_pressed() -> void:
	Global.click()
	get_tree().change_scene("res://src/ui/menu/play/Play.tscn")
