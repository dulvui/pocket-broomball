extends Node

var play_games_services = null
var game_center = null

var play_services_ids = {
	"wins_1" : {"ios":"","android":""}, # win 10 games
	"wins_2" : {"ios":"","android":""}, # 20
	"wins_3" : {"ios":"","android":""}, # 50
	"wins_4" : {"ios":"","android":""}, # 100
	"wins_5" : {"ios":"","android":""}, # 500
	"unlocked_teams_1" : {"ios":"","android":""}, # unlock 5 teams
	"unlocked_teams_2" : {"ios":"","android":""}, # 10
	"unlocked_teams_3" : {"ios":"","android":""}, # 20
	"unlocked_teams_4" : {"ios":"","android":""}, # 50
	"unlocked_teams_5" : {"ios":"","android":""}, # ALL
	"league_1st_place_1" : {"ios":"","android":""}, # win 1 league
	"league_1st_place_2" : {"ios":"","android":""}, # 2
	"league_1st_place_3" : {"ios":"","android":""}, # 3
	"league_1st_place_4" : {"ios":"","android":""}, # 5
	"league_1st_place_5" : {"ios":"","android":""}, # 10
	"arcade_score_1" : {"ios":"","android":""}, # score 1
	"arcade_score_2" : {"ios":"","android":""}, # score 5
	"arcade_score_3" : {"ios":"","android":""}, # score 10
	"arcade_score_4" : {"ios":"","android":""}, # score 20
	"arcade_score_5" : {"ios":"","android":""}, # score 50
	"single_match_1" : {"ios":"","android":""}, # make 10 wins in easy
	"single_match_2" : {"ios":"","android":""}, # medium
	"single_match_3" : {"ios":"","android":""}, # hard
	"single_match_4" : {"ios":"","android":""}, # extreme
	"single_match_5" : {"ios":"","android":""} # legend
}


# Called when the node enters the scene tree for the first time.
func _ready():
	# Check if plugin was added to the project
	print("checking game services")
	if Engine.has_singleton("GodotPlayGamesServices"):
		play_games_services = Engine.get_singleton("GodotPlayGamesServices")
		print("checking game services login...")	
		var show_popups := true # For example, your game can display a “Welcome back” or an “Achievements unlocked” pop-up. true for enabling it.
		var request_email := true
		var request_profile := true
		#The client id must be created in [the google console](https://console.cloud.google.com/apis/credentials), an OAuth 2.0 Client credentials of a Web application type
		var request_token := "ClientID"
#		492494125380-j5kk7qjp2sa308shshrpj232qg71h65v.apps.googleusercontent.com
#		play_games_services.init(show_popups, request_email, request_profile, request_token)
		play_games_services.init(show_popups)
		print("checking game services login done")
	if Engine.has_singleton("GameCenter"):
		game_center = Engine.get_singleton("GameCenter")
		

func increment_achievement(id, amount):
	if play_games_services != null:
		play_games_services.increment_achievement("ACHIEVEMENT_ID", 0)
	
	if game_center != null:
		game_center.award_achievement({ "name": "hard_mode_completed", "progress": 6.1, "show_completion_banner": true })
	
func show_achievements():
	if play_games_services != null:
		play_games_services.show_achievements()
		
	if game_center != null:
		 game_center.show_game_center( { "view": "achievements" } )
		
func submit_arcade_score(score):
	if play_games_services != null:
		play_games_services.submitLeaderBoardScore("leaderboard_id", score)
		
	if game_center != null:
		game_center.post_score({ "score": score, "category": "arcade", } )

func show_leaderboard():
	print("show leaderboard")	
	if play_games_services != null:
		print("show leaderboard on android...")
		play_games_services.showLeaderBoard("leaderboard_id")
		print("show leaderboard on android done")
		
	if game_center != null:
		game_center.show_game_center( { "view": "leaderboards", "leaderboard_name": "Arcade" } )

func login():
	if play_games_services != null:
		play_games_services.sign_in()

# Callbacks:
func _on_sign_out_success():
	pass
  
func _on_sign_out_failed():
	pass
	
func _on_leaderboard_score_submitted(leaderboard_id: String):
	pass

func _on_leaderboard_score_submitting_failed(leaderboard_id: String):
	pass
	
func _on_player_is_already_connected(is_connected: bool):
	pass
	
	
