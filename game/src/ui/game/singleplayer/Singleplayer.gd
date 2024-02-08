# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Control

var game_over:bool = false

onready var home_score:Label = $Score/HomeScore
onready var away_score:Label = $Score/AwayScore
onready var goals:Node2D = $Field/Goals
onready var animation_player:AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	get_tree().paused = false
	TouchHelper.reset()
	
	if Global.music:
		Global.music_loop.fade_out()
	if Global.sfx:
		$Field/Sounds/Crowd.play()
		
	goals = $Field/Goals
	goals.connect("home_goal",self,"_home_goal")
	goals.connect("away_goal",self,"_away_goal")
	
	animation_player.play("FadeIn")
	
	
	# break game or simulation
	if (Global.is_worldcup and "simulation" in Global.current_league_game) or (not Global.current_league_game.empty() and Global.current_league_game["away"]["id"] == 0):
		game_over = true
		get_tree().paused = true
		$Pause.queue_free()
		
		Global.game_over(0,0, "simulation" in Global.current_league_game)
			
		$Player.queue_free()
		$Computer.queue_free()
		$Ball.queue_free()
		
		$LeagueGameover.show()
		Global.music_loop.fade_in()
	
func _home_goal() -> void:
	home_score.goal()
	$Field.goal_sound()
	$Field/Commentator.home_goal()
	$Ball/RigidBody2D.on_home_goal()
		

func _away_goal() -> void:
	away_score.goal()
	$Field.goal_sound()
	$Field/Commentator.away_goal()
	$Ball/RigidBody2D.on_away_goal()
		
	
func _process(delta:float) -> void:
	if Global.current_league_game == null &&  (away_score.goals == Global.round_limit || home_score.goals == Global.round_limit) && !game_over:
		if home_score.goals == Global.round_limit:
			$Field/Commentator.win()
#			var player = $Player/Body/AnimationPlayer
#			player.play("Win")
#			yield(player,"animation_finished")
		else:
#			var player = $Computer/Body/AnimationPlayer
#			player.play("Win")
#			yield(player,"animation_finished")
			$Field/Commentator.loose()
		game_over = true
		get_tree().paused = true
		Global.game_over(home_score.goals,away_score.goals)
		$Pause.queue_free()
		$Player.queue_free()
		$Computer.queue_free()
		$Ball.queue_free()
		$GameOver.show()
		Global.music_loop.fade_in()
		Global.current_league_game = {}
	elif not Global.current_league_game.empty() && (away_score.goals == 5 || home_score.goals == 5) && !game_over:
			if home_score.goals == 5:
				$Field/Commentator.win()
#				var player = $Player/Body/AnimationPlayer
#				player.play("Win")
#				yield(player,"animation_finished")
			else:
#				var player = $Computer/Body/AnimationPlayer
#				player.play("Win")
#				yield(player,"animation_finished")
				$Field/Commentator.loose()
			game_over = true
			get_tree().paused = true
			Global.game_over(home_score.goals,away_score.goals)
			$Pause.queue_free()
			$Player.queue_free()
			$Computer.queue_free()
			$Ball.queue_free()
			$LeagueGameover.show()
			Global.music_loop.fade_in()
			Global.current_league_game = {}



