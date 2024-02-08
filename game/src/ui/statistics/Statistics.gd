# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Control

onready var statistics:GridContainer = $Statistics

func _ready() -> void:
	for league in Global.league_stats:
		var name_label:Label = Label.new()
		name_label.set_text(league)
		statistics.add_child(name_label)
		
		var stats_label:Label = Label.new()
		var wins:int = Global.league_stats[league]["win"]
		var played:int = Global.league_stats[league]["played"]
		stats_label.set_text("%d/%d"%[wins,played])
		statistics.add_child(stats_label)
		
func _on_Menu_pressed() -> void:
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")
