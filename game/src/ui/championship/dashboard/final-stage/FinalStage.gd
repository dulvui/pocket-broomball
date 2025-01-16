# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Control


func set_up() -> void:
	var match_count: int = 8
	match Global.final_teams.size():
		4:
			$VBoxContainer/StageName.text = tr("SEMI FINALS")
			$VBoxContainer/VBoxContainer/Match3.hide()
			$VBoxContainer/VBoxContainer/Match4.hide()
			match_count = 2
		2:
			$VBoxContainer/StageName.text = tr("FINAL")
			$VBoxContainer/VBoxContainer/Match2.hide()
			$VBoxContainer/VBoxContainer/Match4.hide()
			$VBoxContainer/VBoxContainer/Match3.hide()
			$VBoxContainer/VBoxContainer/Match4.hide()
			match_count = 1
		1:
			$VBoxContainer/StageName.text = tr("WORLD CHAMPION")
			$VBoxContainer/Winner.text = Global.final_teams[0]["name"]
			$VBoxContainer/WinnerIcon.texture = Global.final_teams[0]["icon"]
			$VBoxContainer/VBoxContainer.hide()
			match_count = 0
		_:
			$VBoxContainer/StageName.text = tr("QUARTER FINALS")
			match_count = 8
	
	if Global.final_teams.size() > 1:
		for counter in range(1, match_count + 1):
			var matchz: Dictionary = Global.matches[-counter]
			if matchz["result"] == ":":
				var match_box:HBoxContainer = get_node("VBoxContainer/VBoxContainer/Match" + str(counter))
				match_box.get_node("Home").text = matchz["home"]["short_name"].to_upper()
				match_box.get_node("HomeIcon").texture = matchz["home"]["icon"]
				
				match_box.get_node("Away").text = matchz["away"]["short_name"].to_upper()
				match_box.get_node("AwayIcon").texture = matchz["away"]["icon"]
				
