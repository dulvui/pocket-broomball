# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Control


onready var speed_bar_away: TextureProgress = $VBoxContainer/Speed1/SpeedBar1
onready var power_bar_away: TextureProgress = $VBoxContainer/Power1/PowerBar1
onready var speed_bar_home: TextureProgress = $VBoxContainer/Speed2/SpeedBar2
onready var power_bar_home: TextureProgress = $VBoxContainer/Power2/PowerBar2


func _ready() -> void:
	Global.set_home_team({})
	Global.set_away_team({})
	Global.current_league_game = {}
	Global.home_team_power = 5
	Global.home_team_speed = 5
	Global.away_team_power = 5
	Global.away_team_speed = 5


func _on_Start_pressed() -> void:
	Global.click()
	get_tree().change_scene("res://src/ui/game/bots/Bots.tscn")


func _on_GoBack_pressed() -> void:
	Global.click()
	get_tree().change_scene("res://src/ui/menu/play/Play.tscn")


func _on_PowerPlus1_pressed() -> void:
	Global.away_team_power = min(10 , Global.away_team_power + 1)
	power_bar_away.value = Global.away_team_power


func _on_PowerMinus1_pressed() -> void:
	Global.away_team_power = max(1 , Global.away_team_power - 1)
	power_bar_away.value = Global.away_team_power


func _on_SpeedPlus1_pressed() -> void:
	Global.away_team_speed = min(10 , Global.away_team_speed + 1)
	speed_bar_away.value = Global.away_team_speed


func _on_SpeedMinus1_pressed() -> void:
	Global.away_team_speed = max(1 , Global.away_team_speed - 1)
	speed_bar_away.value = Global.away_team_speed


func _on_PowerPlus2_pressed() -> void:
	Global.home_team_power = min(10 , Global.home_team_power + 1)
	power_bar_home.value = Global.home_team_power


func _on_PowerMinus2_pressed() -> void:
	Global.home_team_power = max(1 , Global.home_team_power - 1)
	power_bar_home.value = Global.home_team_power


func _on_SpeedPlus2_pressed() -> void:
	Global.home_team_speed = min(10 , Global.home_team_speed + 1)
	speed_bar_home.value = Global.home_team_speed


func _on_SpeedMinus2_pressed() -> void:
	Global.home_team_speed = max(1 , Global.home_team_speed - 1)
	speed_bar_home.value = Global.home_team_speed



