# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Control

var game_over: bool = false


func _ready() -> void:
	get_tree().paused = false
	TouchHelper.reset()

	Global.music_loop.fade_out()
	$Field/Sounds/Crowd.play()

	var goals: Node2D = $Field/Goals
	goals.connect("away_goal", $Score/AwayScore, "goal")
	goals.connect("home_goal", $Score/HomeScore, "goal")
	goals.connect("away_goal", $Field, "goal_sound")
	goals.connect("home_goal", $Field, "goal_sound")
	goals.connect("away_goal", $Field/Commentator, "away_goal")
	goals.connect("home_goal", $Field/Commentator, "home_goal")
	goals.connect("away_goal", $Ball/RigidBody2D, "on_away_goal")
	goals.connect("home_goal", $Ball/RigidBody2D, "on_home_goal")


func _process(delta: float) -> void:
	if (
		!game_over
		&& (
			$Score/AwayScore.goals == Global.round_limit
			|| $Score/HomeScore.goals == Global.round_limit
		)
	):
		game_over = true
		$Pause.queue_free()
		$Player.queue_free()
		$Player2.queue_free()
		$Ball.queue_free()
		$GameOver.multiplayer_winner($Score/HomeScore.goals == Global.round_limit)
		$GameOver.show()
		Global.music_loop.fade_in()
		get_tree().paused = true
