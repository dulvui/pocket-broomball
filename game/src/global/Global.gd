# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Node

# increase to show 'Whats new' screen
var version:String = "9"

const FDROID:bool = false

var first_fade_in:bool = true

var sfx:bool
var music:String
var coins:int
var config:ConfigFile

var locale:String

var league_prize_rewarded:bool
var worldcup_prize_rewarded:bool

var music_loop:AudioStreamPlayer2D

const speed_factor:float = 1.5
const power_factor:int = 80

var unlocked_team_ids:Array

var home_team_icon:Texture
var home_team_name:String
var home_team_colors:Array

var away_team_icon:Texture
var away_team_name:String
var away_team_colors:Array

var home_team_speed:int
var home_team_power:int
var away_team_speed:int
var away_team_power:int

var league_started:bool


# league
var teams:Array
var matches:Array = []
var selected_squad:String

# worldcup
var is_worldcup:bool
#var is_group_stage # if group stage or final stage
var is_in_worlcup:bool # if group stage or final stage

# to save teams for table, but matches has normal matches so no new var is needed
var groups:Array = []
var final_teams:Array = []


var match_day:int
var current_league_game:Dictionary

var first_open:bool

var arcade_highscore:int
var arcade_speed:int
var arcade_power:int
var arcade_freeze:int

var league_stats:Dictionary
var current_league_name:String

# SHOP
var unlocked_helmets:Array
var unlocked_balls:Array
var unlocked_sticks:Array
var unlocked_gloves:Array

var round_limit:int = 5

func _ready() -> void:
	randomize()

func set_up() -> void:
	load_data()
	
	TranslationServer.set_locale(locale)
	
	# to unlock national teams
#	for i in range(-1,-20,-1):
#		unlocked_team_ids.append(i)
	
	if first_open:
		first_open = false
#		new_league()
#		save_all_data()
		config.set_value("first_open", version,first_open)
		save()
	
	if music == "chill":
		music_loop = $ChillMusic
	if music == "energetic":
		music_loop = $Music
	
	if music == "off":
		music_loop = $ChillMusic
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), true)
	
	music_loop.play()
		
	if not sfx:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Sfx"), true)

func load_data() -> void:
	config = ConfigFile.new()
	config.load("user://settings.cfg")
	
	# general
	locale = config.get_value("i18n", "locale", locale_to_lang(TranslationServer.get_locale()))
	first_open = config.get_value("first_open", version, true)
	sfx = config.get_value("sound", "sfx", true)
	music = config.get_value("sound", "music-type", "chill")
	coins = config.get_value("coins", "amount", 0)
	
	#league
	league_prize_rewarded = config.get_value("league", "prize_rewarded", false)
	matches = config.get_value("league", "matches", [])
	match_day = config.get_value("league", "match_day", 0)
	unlocked_team_ids = config.get_value("league", "unlocked_team_ids", [1,2,-1,-2])
	
	#unlock india and germany, if not unlocked yet
	if not -1 in unlocked_team_ids:
		unlocked_team_ids.append(-1)
		unlocked_team_ids.append(-2)
	
	league_started = config.get_value("league", "league_started", false)
	selected_squad = config.get_value("league", "selected_squad", "vikings")
	if not config.has_section_key("league", "statistics"):
		league_stats = {}
		for league in Teams.leagues:
			var league_stat = {
				"win" : 0,
				"played" : 0
			}
			league_stats[league["name"]] = league_stat
	else:
		league_stats = config.get_value("league", "statistics")
	current_league_name = config.get_value("league", "current_league_name", "")
	teams = config.get_value("league","teams", [])
	
	# arcade
	arcade_highscore = config.get_value("arcade", "highscore", 0)
	arcade_speed = config.get_value("arcade", "speed", 1)
	arcade_power = config.get_value("arcade", "power", 1)
	arcade_freeze = config.get_value("arcade", "freeze", 1)
	
	# worldcup
	is_worldcup = config.get_value("worldcup","is_worldcup", false)
	is_in_worlcup = config.get_value("worldcup","is_in_worlcup", false)
	groups = config.get_value("worldcup", "groups", [])
	final_teams = config.get_value("worldcup", "final_teams", [])
#	is_group_stage = config.get_value("worldcup", "is_group_stage", true)

	#shop
	for type in ShopUtil.TYPES.keys():
		ShopUtil.items[type]["selected"] = config.get_value("shop", "selected_" + type, 0)
		ShopUtil.items[type]["unlocked"] = config.get_value("shop", "unlocked_" + type, [0])
	
#TODO MAKE SAFE GENERAL, SAFE arcade etc...

func save_all_data() -> void:
	# general
	config.set_value("i18n", "locale", locale)
	config.set_value("first_open", version,first_open)
	config.set_value("coins","amount",coins)
	config.set_value("sound","sfx",sfx)
	config.set_value("sound","music-type",music)
	
	# league
	config.set_value("league","match_day", match_day)
	config.set_value("league","league_started", league_started)
	config.set_value("league","unlocked_team_ids", unlocked_team_ids)
	config.set_value("league","selected_squad", selected_squad)
	config.set_value("league","teams", teams)
	config.set_value("league", "prize_rewarded", league_prize_rewarded)
	config.set_value("league","matches", matches)
	config.set_value("league", "statistics", league_stats)
	config.set_value("league", "current_league_name", current_league_name)
	
	# arcade
	config.set_value("arcade", "highscore", arcade_highscore)
	config.set_value("arcade", "speed", arcade_speed)
	config.set_value("arcade", "power", arcade_power)
	config.set_value("arcade", "freeze", arcade_freeze)
	
	# worldcup
	config.set_value("worldcup","is_worldcup", is_worldcup)
	config.set_value("worldcup","is_in_worlcup", is_in_worlcup)
#	config.set_value("worldcup","is_group_stage", is_group_stage)
	config.set_value("worldcup","final_teams", final_teams)
	config.set_value("worldcup","groups", groups)

	#shop
	for type in ShopUtil.TYPES.keys():
		config.set_value("shop", "selected_" + type, ShopUtil.items[type]["selected"])
		config.set_value("shop", "unlocked_" + type, ShopUtil.items[type]["unlocked"])

	save()
	
func locale_to_lang(_locale:String) -> String:
	if "en" in  _locale:
		return "en"
	elif "de" in  _locale:
		return "de"
	elif "it" in  _locale:
		return "it"
	else:
		return "en"

func increase_stats() -> void:
	if is_worldcup:
		if final_teams[0]["name"] == selected_squad:
			league_stats[current_league_name]["played"] += 1
			league_stats[current_league_name]["win"] += 1
		else:
			league_stats[current_league_name]["played"] += 1
	else:
		for team in teams:
			if team["name"] == selected_squad:
				if team["position"] == 0:
					league_stats[current_league_name]["played"] += 1
					league_stats[current_league_name]["win"] += 1
				else:
					league_stats[current_league_name]["played"] += 1

func fade_in_goals() -> void:
	$AnimationPlayer.play("FadeIn")
		
func _find_team(name:String) -> Dictionary:
	for team in teams:
		if team["name"] == name:
			return team
	return {}

func toggle_music()  -> void:
	if music == "off":
		music = "chill"
		music_loop.stop()
		music_loop = $ChillMusic
		music_loop.play()
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), false)
	elif music == "chill":
		music = "energetic"
		music_loop.stop()
		music_loop = $Music
		music_loop.play()
	else:
		music = "off"
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), true)
	config.set_value("sound","music-type",music)
	save()
		

	
func save() -> void:
	config.save("user://settings.cfg")


func game_over(home_goals:int,away_goals:int, simulation:bool = false) -> void:
	if current_league_game != null or simulation:
		if is_worldcup:
		
		# group stage TODO make better since league after 6 is broken
			if match_day < 5: # 5 = 6 - 1 because 24 + 24 ritorno
				random_world_cup_results()
				_save_current_game(home_goals, away_goals)
			elif match_day == 5: # create final stage
				random_world_cup_results()
				_save_current_game(home_goals, away_goals)
				create_quarter_finals()
				
			elif match_day == 6: # semi stage
				# calc random results, HOW TO SIMULATE IF NOT PLAYING ANYMORE?
				# prize is given after cup finished
				final_teams = []
				
				
				if not simulation:
					_save_current_game(home_goals, away_goals)
					if home_goals > away_goals: # win, go to seminfinals
						final_teams.append(current_league_game["home"])
					else:
						final_teams.append(current_league_game["away"])
					
				# random result for other matches
				for i in range(-5,-1):
					if matches[i+1]["home"]["name"] != selected_squad:
						if randi()%2 == 0:
							final_teams.append(matches[i+1]["home"])
							matches[i+1]["result"] = str(5) + ":" + str(randi()%5)
						else:
							final_teams.append(matches[i+1]["away"])
							matches[i+1]["result"] = str(randi()%5) + ":" + str(5)
							
				if final_teams.size() != 4:
					print("ERROR SEMI FINAL TEAMS ARE NOT 4")
				
				matches.append({"home": final_teams[0],"away":final_teams[1], "result":":"})
				matches.append({"home": final_teams[2],"away":final_teams[3], "result":":"})
				
				
					
			elif match_day == 7: # semi final
				final_teams = []
				
				if not simulation:
					_save_current_game(home_goals, away_goals)
					if home_goals > away_goals: # win, go to seminfinals
						final_teams.append(current_league_game["home"])
					else:
						final_teams.append(current_league_game["away"])
				else:
					if randi()%2 == 0:
						final_teams.append(matches[-2]["home"])
						matches[-2]["result"] = str(5) + ":" + str(randi()%5)
					else:
						final_teams.append(matches[-2]["away"])
						matches[-2]["result"] = str(randi()%5) + ":" + str(5)
				
				# random result for other matches
				if randi()%2 == 0:
					final_teams.append(matches[-1]["home"])
					matches[-1]["result"] = str(5) + ":" + str(randi()%5)
				else:
					final_teams.append(matches[-1]["away"])
					matches[-1]["result"] = str(randi()%5) + ":" + str(5)
				
				# add final match
				matches.append({"home": final_teams[0],"away": final_teams[1], "result":":"})
			else:
				final_teams = []
				# FINAL finished, worldcup end
				
				if not simulation:
					_save_current_game(home_goals, away_goals)
					
					if home_goals > away_goals:
						final_teams.append(current_league_game["home"])
					else:
						final_teams.append(current_league_game["away"])
				else:
					if randi()%2 == 0:
						final_teams.append(matches[-1]["home"])
						matches[-1]["result"] = str(5) + ":" + str(randi()%5)
					else:
						final_teams.append(matches[-1]["away"])
						matches[-1]["result"] = str(randi()%5) + ":" + str(5)
					
					
		
		# normal league
		else:
			random_results()
			_save_current_game(home_goals, away_goals)
			
		match_day += 1
		
		# sort teams with points

			
		
		save_all_data()
		
func _save_current_game(home_goals,away_goals) -> void:
	if "home" in current_league_game and "away" in current_league_game:
		var home_team = _get_team_from_name(current_league_game["home"]["name"])
		var away_team = _get_team_from_name(current_league_game["away"]["name"])
		
		if away_team["id"] != 0:
			if home_goals > away_goals:
				home_team["wins"] += 1
				home_team["points"] += 3
				away_team["lost"] += 1
			else:
				away_team["wins"] += 1
				away_team["points"] += 3
				home_team["lost"] += 1
			
		away_team["goal_difference"] += away_goals - home_goals
		home_team["goal_difference"] += home_goals - away_goals
			
		current_league_game["result"] = str(home_goals) + " : " + str(away_goals)
		
		sort_table()
		
func sort_table() -> void:
	if is_worldcup:
		for group in groups:
			group.sort_custom(PointsSorter, "sort")
	else:
		teams.sort_custom(PointsSorter, "sort")
		for i in range(0,teams.size()):
			teams[i]["position"] = i
	
func create_quarter_finals() -> void:
	# create final teams
	final_teams.append(groups[0][0]) # A1
	final_teams.append(groups[0][1]) # A2
	
	final_teams.append(groups[1][0]) # B1
	final_teams.append(groups[1][1]) # B2
	
	final_teams.append(groups[2][0]) # C1
	final_teams.append(groups[2][1]) # C2
	
	final_teams.append(groups[3][0]) # D1
	final_teams.append(groups[3][1]) # D2
	
	matches.append({"home": groups[0][0],"away":groups[1][1], "result":":"})
	matches.append({"home": groups[1][0],"away":groups[2][1], "result":":"})
	matches.append({"home": groups[2][0],"away":groups[3][1], "result":":"})
	matches.append({"home": groups[3][0],"away":groups[0][1], "result":":"})
	
	# make sure you play always at home
	for i in range(-5, -1, 1):
		if matches[i]["away"]["name"] == selected_squad:
			matches[i] = {"home": matches[i]["away"],"away":matches[i]["home"], "result":":"}
			break # finished for sure



func random_world_cup_results() -> void:
	
	var from:int = match_day * 8 # 8 because worlcup teams are 16?
	var to:int = (match_day + 1) * 8
	for i in range(from,to):
		if matches[i]["home"]["name"] != selected_squad and matches[i]["away"]["name"] != selected_squad:
			var home_team:Dictionary = _get_team_from_name(matches[i]["home"]["name"])
			var away_team:Dictionary = _get_team_from_name(matches[i]["away"]["name"])
			
			var home_win:int = randi()&1
			var home_goals:int
			var away_goals:int
			
			# break team
			if home_team["id"] == 0:
				away_goals = 0
				home_goals = 0
			elif away_team["id"] == 0:
				home_goals = 0
				away_goals = 0
				
				
			elif home_win:
				home_goals = 5
				away_goals = randi()%5
				home_team["wins"] += 1
				home_team["points"] += 3
				away_team["lost"] += 1
			else:
				away_goals = 5
				home_goals = randi()%5
				away_team["wins"] += 1
				away_team["points"] += 3
				home_team["lost"] += 1
				
			away_team["goal_difference"] += away_goals - home_goals
			home_team["goal_difference"] += home_goals - away_goals
			
			matches[i]["result"] = str(home_goals) + " : " + str(away_goals)
		

func random_results() -> void:
	var from:int = match_day * (teams.size() / 2)
	var to:int = (match_day + 1) * (teams.size() / 2)
	
	for i in range(from,to):
		if matches[i]["home"]["name"] != selected_squad and matches[i]["away"]["name"] != selected_squad:
			var home_team:Dictionary = _get_team_from_name(matches[i]["home"]["name"])
			var away_team:Dictionary = _get_team_from_name(matches[i]["away"]["name"])
			
			var home_win:bool = randi()&1
			var home_goals:int
			var away_goals:int
			
			# break team
			if home_team["id"] == 0:
				away_goals = 0
				home_goals = 0
			elif away_team["id"] == 0:
				home_goals = 0
				away_goals = 0
				
			elif home_win:
				home_goals = 5
				away_goals = randi()%5
				home_team["wins"] += 1
				home_team["points"] += 3
				away_team["lost"] += 1
			else:
				away_goals = 5
				home_goals = randi()%5
				away_team["wins"] += 1
				away_team["points"] += 3
				home_team["lost"] += 1
				
			away_team["goal_difference"] += away_goals - home_goals
			home_team["goal_difference"] += home_goals - away_goals
			
			matches[i]["result"] = str(home_goals) + " : " + str(away_goals)


	
func add_coins(more:int) -> void:
	coins += more
	config.set_value("coins","amount",coins)
	save()
	
func use_coins(less:int) -> bool:
	if coins - less < 0:
		return false
	coins -= less
	config.set_value("coins","amount",coins)
	save()
	return true
	
func set_home_team(team:Dictionary) -> void:
	if not team.empty():
		home_team_name = team.name
		home_team_power = team.power
		home_team_speed = team.speed
		home_team_colors = team.colors
		home_team_icon = team.get("icon")
	else:
		home_team_icon = null
	
	
func set_away_team(team:Dictionary) -> void:
	if not team.empty():
		away_team_name = team.name
		away_team_power = team.power
		away_team_speed = team.speed
		away_team_colors = team.colors
		away_team_icon = team.get("icon")
	else:
		away_team_icon = null
	
func new_league() -> void:
	league_started = false
	teams = []
	matches = []
	
	groups = []
	final_teams = []

#	is_group_stage = true
	is_in_worlcup = false
	is_worldcup = false
	
	match_day = 0
	current_league_game = {}
	selected_squad = ""
	league_prize_rewarded = false
	save_all_data()


# to play sound on ui click
func click() -> void:
	if sfx:
		$Click.play()

# to save on close
func _notification(event:int) -> void:
	if event == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST or event == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
#		if current_league_game != null:
#			game_over(0,5) # game over a tavolino on exit
		save_all_data()
		

class PointsSorter:
	static func sort(a:Dictionary, b:Dictionary) -> bool:
		if a["points"] > b["points"] or (a["points"] == b["points"] and a["goal_difference"] > b["goal_difference"]):
			return true
		return false

	
func _get_team_from_name(name:String) -> Dictionary:
	if is_worldcup:
		for group in groups:
			for team in group:
				if name == team["name"]:
					return team
		return {}
	else:
		for team in teams:
			if name == team["name"]:
				return team
		return {}
