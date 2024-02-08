# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Control

onready var animation_player:AnimationPlayer = $AnimationPlayer

onready var home_icon:Sprite = $Control/Home/HomeIcon
onready var home_name:Label = $Control/Home/HomeName

onready var away_icon:Sprite = $Control/Away/AwayIcon
onready var away_name:Label = $Control/Away/AwayName

func _ready():
	
	home_icon.texture = Global.home_team_icon
	home_name.text = Global.home_team_name
	
	away_icon.texture = Global.away_team_icon
	away_name.text = Global.away_team_name
	
	animation_player.play("Show")
	yield(animation_player, "animation_finished" )
	get_tree().change_scene("res://src/ui/game/singleplayer/Singleplayer.tscn")
