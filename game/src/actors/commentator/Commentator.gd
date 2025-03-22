# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Node2D

var home_goals: int = 0
var away_goals: int = 0


func _ready() -> void:
	$Ready.play()


func _on_Ready_finished() -> void:
	$Go.play()


func win() -> void:
	$Win.play()


func lose() -> void:
	$Lose.play()


func home_goal() -> void:
	home_goals += 1
	_play_goal(home_goals)
	yield(get_tree().create_timer(0.5), "timeout")
	_play_goal(away_goals)


func away_goal() -> void:
	away_goals += 1
	_play_goal(home_goals)
	yield(get_tree().create_timer(0.5), "timeout")
	_play_goal(away_goals)


func _play_goal(goal):
	match goal:
		1:
			$Goal1.play()
		2:
			$Goal2.play()
		3:
			$Goal3.play()
		4:
			$Goal4.play()
		5:
			$Goal5.play()
		6:
			$Goal6.play()
		7:
			$Goal7.play()
		8:
			$Goal8.play()
		9:
			$Goal9.play()
		10:
			$Goal10.play()
