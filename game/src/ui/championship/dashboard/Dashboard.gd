# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Control

var show_confirm_pop:bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	# show matchday
	if Global.match_day > 0:
		if Global.is_worldcup:
			$Content/Matchday.text = ("%s/" % (Global.match_day) )+ str(9)
		else:
			$Content/Matchday.text = ("%s/" % (Global.match_day) )+ str(Global.teams.size() -1)
	else:
		$Content/Matchday.text = ""
	
	if Global.is_worldcup:
		if Global.match_day > 8:
			var prize = get_league_prize()
			show_confirm_pop = false
			if not Global.league_prize_rewarded:
				Global.add_coins(prize)
				Global.increase_stats()
				Global.league_prize_rewarded = true
			$Content/Buttons/NextMatch.hide()
			$Content/Buttons/HBoxContainer/PrizeMoney.text = str(prize)
			$Confetti.show()
			Global.save_all_data()
		else:
			$Content/Buttons/HBoxContainer.hide()
	else:
		if Global.match_day > Global.teams.size() - 2:
			var prize = get_league_prize()
			show_confirm_pop = false
			if not Global.league_prize_rewarded:
				Global.add_coins(prize)
				Global.increase_stats()
				Global.league_prize_rewarded = true
			$Content/Buttons/NextMatch.hide()
			$Content/Buttons/HBoxContainer/PrizeMoney.text = str(prize)
			$Confetti.show()
			Global.save_all_data()
		else:
			$Content/Buttons/HBoxContainer.hide()
	
	if Global.is_worldcup:
		set_up_world_cup()
	else:
		set_up_championship()


func set_up_championship() -> void:
	$Content/Table.show()
	$Content/Table.set_up()

func set_up_world_cup() -> void:
	if Global.final_teams.size() == 0:
		$Content/GroupStage.set_up()
		$Content/GroupStage.show()
	else:
		$Content/FinalStage.set_up()
		$Content/FinalStage.show()
		

func _on_GoBack_pressed() -> void:
	Global.click()
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")


func _on_NewChampionship_pressed() -> void:
	Global.click()
	if show_confirm_pop:
		$NewLeaguePopUp.popup_centered()
	else:
		Global.new_league()
		get_tree().change_scene("res://src/ui/championship/Championship.tscn")

func _on_NextMatch_pressed() -> void:
	Global.click()
	
	# check if worldcup
	# if yes check if groupstage
	# if not check if still in cup
	# if not only show results of simulation
	
	if Global.is_worldcup:
		if Global.final_teams.size() == 0:
			# group stage
			next_matchday()
			Global.set_home_team(Global.current_league_game["home"])
			Global.set_away_team(Global.current_league_game["away"])
			get_tree().change_scene("res://src/ui/championship/preview/GamePreview.tscn")
		else:
			if next_matchday():
				# finals
				Global.set_home_team(Global.current_league_game["home"])
				Global.set_away_team(Global.current_league_game["away"])
				get_tree().change_scene("res://src/ui/championship/preview/GamePreview.tscn")
			else: # not in worldcup anymore
#				Global.game_over(0,0,true)
#				get_tree().change_scene("res://src/ui/championship/dashboard/Dashboard.tscn")
				Global.set_home_team({})
				Global.set_away_team({})
#
				Global.current_league_game = {"simulation": true}
	
				get_tree().change_scene("res://src/ui/game/singleplayer/Singleplayer.tscn")
	
	
	else:
		next_matchday()
		Global.set_home_team(Global.current_league_game["home"])
		Global.set_away_team(Global.current_league_game["away"])
		get_tree().change_scene("res://src/ui/championship/preview/GamePreview.tscn")


func next_matchday() -> bool:
	for matchz in Global.matches:
		if matchz["result"] == ":" and matchz["home"]["name"] == Global.selected_squad:
			Global.current_league_game = matchz
			return true
	return false # retunrs fasle if out of worldcup

func get_league_prize() -> int:
	# TODO world cup league prize
	
	if Global.is_worldcup:
		if Global.final_teams[0]["name"] == Global.selected_squad:
			return 250000
		else:
			return 10000
	else:
		for team in Global.teams:
			if team["name"] == Global.selected_squad:
				match team["position"]:
					0:
						return 10000 * Global.teams.size()
					1:
						return 5000 * Global.teams.size()
					2:
						return 2000 * Global.teams.size()
					_:
						return 1000 * Global.teams.size()
	return 1000



func _on_Cancel_pressed() -> void:
	Global.click()
	$NewLeaguePopUp.hide()


func _on_Okay_pressed() -> void:
	Global.click()
	Global.new_league()
	get_tree().change_scene("res://src/ui/championship/Championship.tscn")
