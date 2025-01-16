# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Control

func set_up_teams(teams: Array) -> void:
	var position = 1
	for team in teams:
		if team["id"] != 0:
			var position_label = Label.new()
			position_label.text = str(position) + "."
			$MarginContainer/GridContainer.add_child(position_label)
			position += 1
			
			var name_label = Label.new()
			name_label.text = team["name"]
			$MarginContainer/GridContainer.add_child(name_label)
			
			var points_label = Label.new()
			points_label.text = str(team["points"])
			$MarginContainer/GridContainer.add_child(points_label)
			
			var wins_label = Label.new()
			wins_label.text = str(team["wins"])
			$MarginContainer/GridContainer.add_child(wins_label)
			
			var lose_label = Label.new()
			lose_label.text = str(team["lost"])
			$MarginContainer/GridContainer.add_child(lose_label)
			
			var gd_label = Label.new()
			gd_label.text = str(team["goal_difference"])
			$MarginContainer/GridContainer.add_child(gd_label)
			
			if team["name"] == Global.selected_squad:
				position_label.add_color_override("font_color", Color(35/255.0,168/255.0,193/255.0,1))
				gd_label.add_color_override("font_color", Color(35/255.0,168/255.0,193/255.0,1))
				lose_label.add_color_override("font_color", Color(35/255.0,168/255.0,193/255.0,1))
				wins_label.add_color_override("font_color", Color(35/255.0,168/255.0,193/255.0,1))
				name_label.add_color_override("font_color", Color(35/255.0,168/255.0,193/255.0,1))
				points_label.add_color_override("font_color", Color(35/255.0,168/255.0,193/255.0,1))

func set_up() -> void:
	var position: int = 1
	
	for team in Global.teams:
		if team["id"] != 0:
			var position_label = Label.new()
			position_label.text = str(position) + "."
			$MarginContainer/GridContainer.add_child(position_label)
			position += 1
			
			var name_label = Label.new()
			name_label.text = team["name"]
			$MarginContainer/GridContainer.add_child(name_label)
			
			var points_label = Label.new()
			points_label.text = str(team["points"])
			$MarginContainer/GridContainer.add_child(points_label)
			
			var wins_label = Label.new()
			wins_label.text = str(team["wins"])
			$MarginContainer/GridContainer.add_child(wins_label)
			
			var lose_label = Label.new()
			lose_label.text = str(team["lost"])
			$MarginContainer/GridContainer.add_child(lose_label)
			
			var gd_label = Label.new()
			gd_label.text = str(team["goal_difference"])
			$MarginContainer/GridContainer.add_child(gd_label)
			
			if team["name"] == Global.selected_squad:
				position_label.add_color_override("font_color", Color(35/255.0,168/255.0,193/255.0,1))
				gd_label.add_color_override("font_color", Color(35/255.0,168/255.0,193/255.0,1))
				lose_label.add_color_override("font_color", Color(35/255.0,168/255.0,193/255.0,1))
				wins_label.add_color_override("font_color", Color(35/255.0,168/255.0,193/255.0,1))
				name_label.add_color_override("font_color", Color(35/255.0,168/255.0,193/255.0,1))
				points_label.add_color_override("font_color", Color(35/255.0,168/255.0,193/255.0,1))
