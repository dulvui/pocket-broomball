extends Node

var version = "7"

var first_fade_in = true

var sfx
var music
var coins
var config

var locale

var league_prize_rewarded
var worldcup_prize_rewarded

var music_loop

const speed_factor = 1.5
const power_factor = 80

var unlocked_team_ids

var home_team_icon
var home_team_name
var home_team_colors

var away_team_icon
var away_team_name
var away_team_colors

var home_team_speed
var home_team_power
var away_team_speed
var away_team_power

var league_started


# league
var teams
var matches = []
var selected_squad

# worldcup
var is_worldcup
#var is_group_stage # if group stage or final stage
var is_in_worlcup # if group stage or final stage

# to save teams for table, but matches has normal matches so no new var is needed
var groups = []
var final_teams = []


var match_day
var current_league_game

var first_open
var show_pop_up = false

var arcade_highscore
var arcade_speed
var arcade_power
var arcade_freeze

var league_stats
var current_league_name

# SHOP
var unlocked_helmets
var unlocked_balls
var unlocked_sticks
var unlocked_gloves

var round_limit = 5

func _ready():
	randomize()

func set_up():
	load_data()
	
	TranslationServer.set_locale(locale)
	
	print(locale)
	
	# to unlock national teams
#	for i in range(-1,-20,-1):
#		unlocked_team_ids.append(i)
	
	if first_open:
		first_open = false
		show_pop_up = true
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

func load_data():
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
	current_league_name = config.get_value("league", "current_league_name", 0)
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

#TODO MAKE SAFE GENERAL, SAFE arcade etc...

func save_all_data():
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
	
	
	save()
	
func locale_to_lang(_locale):
	if "en" in  _locale:
		return "en"
	elif "de" in  _locale:
		return "de"
	elif "it" in  _locale:
		return "eit"
	else:
		return "en"

func increase_stats():
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

func fade_in_goals():
	$AnimationPlayer.play("FadeIn")
		
func _find_team(name):
	for team in teams:
		if team["name"] == name:
			return team
	return null

func toggle_music():
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
		

	
func save():
	config.save("user://settings.cfg")

	
func game_over(home_goals,away_goals, simulation = false):
	if current_league_game != null or simulation:
		if is_worldcup:
		
		# group stage TODO make better since league after 6 is broken
			if match_day < 5: # 5 = 6 - 1 because 24 + 24 ritorno
				random_world_cup_results()
				_save_current_game(home_goals, away_goals)
			elif match_day == 5: # create final stage
				random_world_cup_results()
				_save_current_game(home_goals, away_goals)
				
#				is_group_stage = false
				
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
		if is_worldcup:
			for group in groups:
				group.sort_custom(PointsSorter, "sort")
		else:
			teams.sort_custom(PointsSorter, "sort")
		for i in range(0,teams.size()):
			teams[i]["position"] = i
		
			
		current_league_game = null
		
		save_all_data()
	
func create_quarter_finals():
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
			

func _save_current_game(home_goals,away_goals):
	if not current_league_game is String:
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

func random_world_cup_results():
	
	var from = match_day * 8 # 8 because worlcup teams are 16?
	var to = (match_day + 1) * 8
	for i in range(from,to):
		if matches[i]["home"]["name"] != selected_squad and matches[i]["away"]["name"] != selected_squad:
			var home_team = _get_team_from_name(matches[i]["home"]["name"])
			var away_team = _get_team_from_name(matches[i]["away"]["name"])
			
			var home_win = randi()&1
			var home_goals
			var away_goals
			
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
		

func random_results():
	var from = match_day * (teams.size() / 2)
	var to = (match_day + 1) * (teams.size() / 2)
	
	for i in range(from,to):
		if matches[i]["home"]["name"] != selected_squad and matches[i]["away"]["name"] != selected_squad:
			var home_team = _get_team_from_name(matches[i]["home"]["name"])
			var away_team = _get_team_from_name(matches[i]["away"]["name"])
			
			var home_win = randi()&1
			var home_goals
			var away_goals
			
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


	
func add_coins(more):
	coins += more
	config.set_value("coins","amount",coins)
	save()
	
func set_home_team(team):
	if team != null:
		home_team_name = team.name
		home_team_power = team.power
		home_team_speed = team.speed
		home_team_colors = team.colors
		home_team_icon = team.get("icon")
	else:
		home_team_icon = null
	
	
func set_away_team(team):
	if team != null:
		away_team_name = team.name
		away_team_power = team.power
		away_team_speed = team.speed
		away_team_colors = team.colors
		away_team_icon = team.get("icon")
	else:
		away_team_icon = null
	
func new_league():
	league_started = false
	teams = []
	matches = []
	
	groups = []
	final_teams = []

#	is_group_stage = true
	is_in_worlcup = false
	is_worldcup = false
	
	match_day = 0
	current_league_game = null
	selected_squad = ""
	league_prize_rewarded = false
	save_all_data()
	
func use_coins(less):
	if coins - less < 0:
		return false
	coins -= less
	config.set_value("coins","amount",coins)
	save()
	return true

# to play sound on ui click
func click():
	if sfx:
		$Click.play()

# to save on close
func _notification(event):
	if event == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST or event == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		if current_league_game != null:
			game_over(0,5) # game over a tavolino on exit
		save_all_data()
		

class PointsSorter:
	static func sort(a, b):
		if a["points"] > b["points"] or (a["points"] == b["points"] and a["goal_difference"] > b["goal_difference"]):
			return true
		return false

	
func _get_team_from_name(name):
	if is_worldcup:
		for group in groups:
			for team in group:
				if name == team["name"]:
					return team
		return null
	else:
		for team in teams:
			if name == team["name"]:
				return team
		return null
