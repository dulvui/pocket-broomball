# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Node2D

signal home_goal
signal away_goal

var goal:bool = false

onready var timer:Timer = $Timer


func reset() -> void:
	goal = false

func _on_AwayBallDetector_body_entered(body:Node) -> void:
	if not goal:
		goal = true
		timer.start()
		emit_signal("home_goal")


func _on_HomeBallDetector_body_entered(body:Node) -> void:
	if not goal:
		goal = true
		timer.start()
		emit_signal("away_goal")


func _on_Timer_timeout() -> void:
	goal = false
