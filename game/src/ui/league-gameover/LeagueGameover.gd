extends Control

var multyplier


var reward_earned = false

var coins_label
var coins

var goal_stats

func _ready():
	goal_stats = $CenterContainer/MarginContainer/MarginContainer/VBoxContainer/VBoxContainer/CoinsStats/GoalStats
	coins_label = $CenterContainer/MarginContainer/MarginContainer/VBoxContainer/VBoxContainer/CoinsStats/Coins
	
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
		dynamic_font.size = 120
		
		
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
				var short_label_home = Label.new()
				var short_label_away = Label.new()
				if Global.matches[i]["home"].has("short_name"):
					short_label_home.text = Global.matches[i]["home"]["short_name"] + " "
					short_label_away.text = " " + Global.matches[i]["away"]["short_name"]
				else:
					short_label_home.text = "   "
					short_label_away.text = "   "
				
				var label = Label.new()
				label.text =  "  " +str(Global.matches[i]["result"]) + "  "
				label.add_font_override("font", dynamic_font)
				
				var home_icon = TextureRect.new()
				var away_icon = TextureRect.new()
				home_icon.texture = Global.matches[i]["home"]["icon"]
				away_icon.texture = Global.matches[i]["away"]["icon"]
				$CenterContainer/MarginContainer/MarginContainer/VBoxContainer/GridContainer.add_child(short_label_home)
				$CenterContainer/MarginContainer/MarginContainer/VBoxContainer/GridContainer.add_child(home_icon)
				$CenterContainer/MarginContainer/MarginContainer/VBoxContainer/GridContainer.add_child(label)
				$CenterContainer/MarginContainer/MarginContainer/VBoxContainer/GridContainer.add_child(away_icon)
				$CenterContainer/MarginContainer/MarginContainer/VBoxContainer/GridContainer.add_child(short_label_away)
		
		# hide coins stast and don't give money, because simulation
		if Global.current_league_game == null or Global.current_league_game is String:
			$CenterContainer/MarginContainer/MarginContainer/VBoxContainer/VBoxContainer/CoinsStats.hide()
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

