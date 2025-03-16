# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Control

var game_over: bool = false

onready var home_score:Label = $Score/HomeScore
onready var away_score:Label = $Score/AwayScore
onready var goals: Node2D = $Field/Goals
onready var animation_player:AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	get_tree().paused = false
	TouchHelper.reset()
	
	Global.music_loop.fade_out()
	$Field/Sounds/Crowd.play()

	goals.connect("home_goal",self,"_home_goal")
	goals.connect("away_goal",self,"_away_goal")
	
	animation_player.play("FadeIn")


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


func _process(delta: float) -> void:
	if (away_score.goals == Global.round_limit || home_score.goals == Global.round_limit) && !game_over:
		$Field/Commentator.win()
		game_over = true
		Global.game_over(home_score.goals,away_score.goals)
		get_tree().paused = true
		$Pause.queue_free()
		$Computer2.queue_free()
		$Computer.queue_free()
		$Ball.queue_free()
		$GameOver.bots_winner(home_score.goals == Global.round_limit)
		$GameOver.show()
		Global.music_loop.fade_in()


