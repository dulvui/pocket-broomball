# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Node2D

onready var goal_cheer:AudioStreamPlayer2D = $Sounds/GoalCheer
onready var goal_sound:AudioStreamPlayer2D = $Sounds/GoalSound
onready var home_icon:Sprite = $HomeIcon
onready var away_icon:Sprite = $AwayIcon


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	home_icon.set_texture(Global.home_team_icon)
	away_icon.set_texture(Global.away_team_icon)


func goal_sound() -> void:
	if Global.sfx:
		goal_cheer.play()
		goal_sound.play()
