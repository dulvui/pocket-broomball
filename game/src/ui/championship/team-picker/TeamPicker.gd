extends Control

onready var price_label:Label = $VBoxContainer/Price
onready var team_label:Label = $VBoxContainer/Team/TeamLabel
onready var league_label:Label = $VBoxContainer/League/LeagueLabel
onready var speed_bar:TextureProgress = $VBoxContainer/SpeedBar
onready var power_bar:TextureProgress = $VBoxContainer/PowerBar
onready var animation_player:AnimationPlayer = $AnimationPlayer
onready var select_button:Button = $VBoxContainer/Select
onready var locker:Node2D = $Locker

var team_index:int
var league_index:int
var teams:Array

func _ready():
	team_index = 0
	league_index = 0
	
	set_teams()
	league_label.text = Teams.leagues[league_index].name
	_set_team_first_time()
	
	animation_player.play("FadeIn")
	
func _set_team():
	var team = teams[team_index]
	
#	animation_player.play("TeamFadeOut")
#	yield(animation_player, "animation_completed")
	
	$Team.texture = team.icon
	team_label.text = team["name"]
	
	if  not Global.unlocked_team_ids.has(team["id"]):
		select_button.text = tr("BUY")
		price_label.text = str(team["price"])
		price_label.modulate = Color(1,1,1,1)
#		$Team.modulate = Color(0,0,0,1)
		locker.show()
	else:
		select_button.text = tr("PLAY")
		price_label.text = ""
#		$Team.modulate = Color(1,1,1,1)
		locker.hide()
	
	
	power_bar.value = team.power
	speed_bar.value = team.speed
	
#	animation_player.play("TeamFadeIn")
#	yield(animation_player, "animation_completed")
	
func _set_team_first_time():
	var team = teams[team_index]
	
	$Team.texture = team.icon
	team_label.text = team["name"]
	
	if  not Global.unlocked_team_ids.has(team["id"]):
		select_button.text = tr("BUY")
		price_label.text = str(team["price"])
		price_label.modulate = Color(1,1,1,1)
#		$Team.modulate = Color(0,0,0,1)
		locker.show()
	else:
		select_button.text = tr("PLAY")
		price_label.text = ""
#		$Team.modulate = Color(1,1,1,1)
		locker.hide()
			
	power_bar.value = team.power
	speed_bar.value = team.speed
	
func _on_PrevTeam_pressed():
	Global.click()
	team_index -= 1
	if team_index == -1:
		team_index = teams.size() - 1
	_set_team()


func _on_NextTeam_pressed():
	Global.click()
	team_index += 1
	if team_index == teams.size():
		team_index = 0
	_set_team()


func _on_PrevLeague_pressed():
	Global.click()
	league_index -= 1
	if league_index == -1:
		league_index = Teams.leagues.size() - 1
	
	set_teams()
	team_index = 0
	_set_team()
	
		
#	animation_player.play("FadeOutLeague")
#	yield(animation_player, "tween_completed")
	
	league_label.text = Teams.leagues[league_index].name
	
#	animation_player.play("FadeInLeague")
#	yield(animation_player, "tween_completed")
	


func _on_NextLeague_pressed():
	Global.click()
	league_index += 1
	if league_index == Teams.leagues.size():
		league_index = 0
	set_teams()
	team_index = 0
	_set_team()
	
#	animation_player.play("FadeOutLeague")
#	yield(animation_player, "tween_completed")
	
	league_label.text = Teams.leagues[league_index].name
	
#	animation_player.play("FadeInLeague")
#	yield(animation_player, "tween_completed")


func _on_Select_pressed():
	Global.click()
	var team = teams[team_index]
	if not Global.unlocked_team_ids.has(team["id"]):
		if unlock_team(team):
			locker.play("open")
			yield(locker,"animation_finished")
			locker.play("idle")
			locker.hide()
			animation_player.play("Unlock")
			select_button.text = tr("PLAY")
	else:
		Global.current_league_name = Teams.leagues[league_index]["name"]
		Global.selected_squad = team["name"]
		Global.league_started = true

		if Teams.leagues[league_index].name == "World Cup":
			Global.is_worldcup = true
			inizialize_worldcup_matches()
		else:
			Global.is_worldcup = false
			inizialize_matches()
		
		animation_player.play("FadeOut")
		yield(animation_player,"animation_finished")
		get_tree().change_scene("res://src/ui/championship/dashboard/Dashboard.tscn")



func _on_GoBack_pressed():
	Global.click()
	animation_player.play("FadeOut")
	yield(animation_player,"animation_finished")
	get_tree().change_scene("res://src/ui/menu/play/Play.tscn")


# add for world cup rounds and then final stage
func inizialize_matches():
	Global.matches = []
	Global.match_day = 0
	var random_teams = Global.teams.duplicate(true)
	random_teams.shuffle()
	
	var last_team = random_teams.pop_front()
	
	for i in random_teams.size():
		var matchOne
		if last_team["name"] == Global.selected_squad:
			matchOne = {"home": last_team,"away": random_teams[0], "result":":"}
		else:
			matchOne = {"home":random_teams[0] ,"away": last_team, "result":":"}
		Global.matches.append(matchOne)
		
		var copy = random_teams.duplicate(true)
		copy.remove(0)
		
		for j in range(0,(Global.teams.size()/2) - 1):
			var matchTwo
			var home_index = j
			var away_index = - j - 1
			
			if copy[away_index]["name"] == Global.selected_squad:
				matchTwo = {"home": copy[away_index],"away":copy[home_index], "result":":"}
			else:
				matchTwo = {"home": copy[home_index],"away":copy[away_index], "result":":"}
			
			Global.matches.append(matchTwo)
		_shift_array(random_teams)
	
		
		
	Global.save_all_data()
#	var o = 0
#	for matchz in Global.matches:
#		o += 1
#		print(str(o) + ": " + matchz["home"]["name"] + " : " + matchz["away"]["name"])

func inizialize_worldcup_matches():
	Global.matches = []
	Global.groups = []
	Global.match_day = 0
	var random_teams = Global.teams.duplicate(true)
	random_teams.shuffle()
	
	# make 4 groups of 3 teams
	var group = []
	for i in 12:
		if i % 3 == 0 and i > 0:
			group.append(Teams.break_team)
			Global.groups.append(group)
			group = []
		group.append(random_teams[i])
	group.append(Teams.break_team)
	Global.groups.append(group)
	
	Global.match_day = 0
	
	var group_matches = []
	
	# now make matches depending on groups
	for groupz in Global.groups:
		var teamz = groupz.duplicate(true)
#		var random_group_teams = .teams.duplicate(true)
		
		teamz.shuffle()
		
		var matchez = []
		
		
		var last_team = teamz.pop_front()
		
		for i in teamz.size():
			var matchOne
			if last_team["name"] == Global.selected_squad:
				matchOne = {"home": last_team,"away": teamz[0], "result":":"}
			else:
				matchOne = {"home":teamz[0] ,"away": last_team, "result":":"}
			matchez.append(matchOne)
			
			var copy = teamz.duplicate(true)
			copy.remove(0)
			
			for j in range(0,1):
				var matchTwo
				var home_index = j
				var away_index = - j - 1
				
				if copy[away_index]["name"] == Global.selected_squad:
					matchTwo = {"home": copy[away_index],"away":copy[home_index], "result":":"}
				else:
					matchTwo = {"home": copy[home_index],"away":copy[away_index], "result":":"}
				
				matchez.append(matchTwo)
			_shift_array(teamz)
		group_matches.append(matchez)
		
		
	# swap matches beacuse now they are in group order
	# but cronological order is need
	for i in 6:
		for j in 4:
			Global.matches.append(group_matches[j][i])
	print(Global.matches.size())
	
	# ritorno
	for i in Global.matches.size():
		var matchz = Global.matches[i]
		var opposide_match
		
		# to make sure you play always at home
		if matchz["home"]["name"] == Global.selected_squad:
			opposide_match = {"home": matchz["home"],"away":matchz["away"], "result":":"}
		else:
			opposide_match = {"home": matchz["away"],"away":matchz["home"], "result":":"}
		Global.matches.append(opposide_match)
		
	print(Global.matches.size())
	print(Global.matches.size())
	
func unlock_team(team):
	if Global.coins - team["price"] < 0:
		return false
	Global.coins -= team["price"]
	Global.unlocked_team_ids.append(team["id"])
	Global.save_all_data()
	return true
		
func _shift_array(array):
	var temp = array[0]
	for i in range(array.size() - 1):
		array[i] = array[i+1]
	array[array.size() - 1] = temp

func set_teams():
	Global.teams = Teams.leagues[league_index].teams.duplicate(true)
	teams = Teams.leagues[league_index].teams.duplicate(true)
	for team in teams:
		if team["id"] == 0:
			teams.erase(team)
#	teams
