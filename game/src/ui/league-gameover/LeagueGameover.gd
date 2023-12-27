extends Control

const MatchRow:PackedScene = preload("res://src/ui/league-gameover/match-row/MatchRow.tscn")

var multyplier

var reward_earned = false

onready var coins_label = $Container/MarginContainer/MarginContainer/VBoxContainer/Stats/CoinsStats/Coins
onready var goal_stats = $Container/MarginContainer/MarginContainer/VBoxContainer/Stats/GoalStats
onready var coins_stats = $Container/MarginContainer/MarginContainer/VBoxContainer/Stats

var coins

onready var teams = $Container/MarginContainer/MarginContainer/VBoxContainer/Teams

	
func _on_Menu_pressed():
	Global.click()
	get_tree().paused = false
	get_tree().change_scene("res://src/ui/menu/MenuScreen.tscn")

func _on_Gameover_visibility_changed():
	if is_visible_in_tree():
		var home_score = get_parent().get_node("Score").get_node("HomeScore").goals
		var away_score = get_parent().get_node("Score").get_node("AwayScore").goals
		
		
		
		var dynamic_font = DynamicFont.new()
		dynamic_font.font_data = load("res://assets/font/DSEG7ClassicMini-Bold.ttf")
		dynamic_font.size = 62
		
		
		# TODO show final stage in worldcup
		var from
		var to
		
		if Global.is_worldcup:
			if Global.final_teams.size() == 0 or Global.final_teams.size() == 8: # show last matchday
				from = (Global.match_day - 1) * 8
				to = Global.match_day * 8
			else:
				match Global.final_teams.size():
					4:
						from = Global.matches.size() - 6
						to = Global.matches.size() -2
					2:
						from = Global.matches.size() - 3
						to = Global.matches.size() - 1
					_:
						from = Global.matches.size() - 1
						to = Global.matches.size()
		else:
			from = (Global.match_day - 1) * (Global.teams.size() / 2)
			to =  ((Global.match_day - 1) * (Global.teams.size() / 2)) + (Global.teams.size() / 2)
			
		for i in range(from , to):
			if Global.matches[i]["home"]["id"] != 0 and Global.matches[i]["away"]["id"] != 0:
				var match_row = MatchRow.instance()
				match_row.set_up(Global.matches[i])
				teams.add_child(match_row)
		
		# hide coins stats and don't give money, because simulation
		if Global.current_league_game == null or Global.current_league_game is String:
			coins_stats.hide()
		else:
			_calculateCoinsWin(home_score,away_score)
			coins_label.text = str(coins)
			goal_stats.text = _get_stats(home_score,away_score)
		get_tree().paused = true
		
func _calculateCoinsWin(home_goals, away_goals):
	var win = home_goals > away_goals
	coins = 0
	
	if win:
		coins = 500
	else:
		coins = 300
				
	coins += home_goals * 100
	coins -= away_goals * 50
		
	if away_goals == 0:
		coins += 250
	Global.add_coins(coins)
	
	
func _get_stats(home_goals, away_goals):
	var stats
	if home_goals > away_goals:
		if away_goals == 0:
			stats = "750 + 100x%s - 50x%s =" % [home_goals, away_goals]
		else:
			stats = "500 + 100x%s - 50x%s =" % [home_goals, away_goals]
	else:
		stats = "300 + 100x%s - 50x%s =" % [home_goals, away_goals]
	return stats

func _on_GoBack_pressed():
	Global.click()
	get_tree().paused = false
	get_tree().change_scene("res://src/ui/championship/dashboard/Dashboard.tscn")

