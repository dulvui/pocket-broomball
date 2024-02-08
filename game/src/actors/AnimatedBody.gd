# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Node2D

export var shoulder_color:Color
export var arm_color:Color
export var upper_arm_color:Color
export var computer:bool = false

onready var left_team_logo:Sprite = $Body/LeftShoulder/TeamLogo
onready var right_team_logo:Sprite = $Body/RightShoulder/TeamLogo
onready var left_shoulder:Sprite = $Body/LeftShoulder
onready var right_shoulder:Sprite = $Body/RightShoulder
onready var right_arm:Sprite = $Body/RightArm
onready var left_arm:Sprite = $Body/LeftArm
onready var left_upper_arm:Sprite = $Body/LeftUpperArm
onready var right_upper_arm:Sprite = $Body/RightUpperArm
onready var stick:Sprite = $Body/Stick
onready var head:Sprite = $Body/Head

onready var animation_player:AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	# color gets override if global team color is set
	left_shoulder.self_modulate = Color(shoulder_color)
	right_shoulder.self_modulate = Color(shoulder_color)
	right_arm.self_modulate = Color(arm_color)
	left_arm.self_modulate = Color(arm_color)
	left_upper_arm.self_modulate = Color(upper_arm_color)
	right_upper_arm.self_modulate = Color(upper_arm_color)
	
	if computer:
		stick.texture = ShopUtil.get_random_texture("STICK")
		head.texture = ShopUtil.get_random_texture("HELMET")
	else:
		stick.texture = ShopUtil.get_texture("STICK")
		head.texture = ShopUtil.get_texture("HELMET")
	
	
	if get_parent().name == "Computer":
		if Global.away_team_icon != null:
			left_team_logo.texture = Global.away_team_icon
			right_team_logo.texture = Global.away_team_icon
			
			left_shoulder.self_modulate = Color(Global.away_team_colors[0])
			right_shoulder.self_modulate = Color(Global.away_team_colors[0])
			
			left_upper_arm.self_modulate = Color(Global.away_team_colors[1])
			right_upper_arm.self_modulate = Color(Global.away_team_colors[1])
			
			right_arm.self_modulate = Color(Global.away_team_colors[1])
			left_arm.self_modulate = Color(Global.away_team_colors[1])
			
			
	else:
		if Global.home_team_icon != null:
			left_team_logo.texture = Global.home_team_icon
			right_team_logo.texture = Global.home_team_icon
			
			left_shoulder.self_modulate = Color(Global.home_team_colors[0])
			right_shoulder.self_modulate = Color(Global.home_team_colors[0])
			
			left_upper_arm.self_modulate = Color(Global.home_team_colors[1])
			right_upper_arm.self_modulate = Color(Global.home_team_colors[1])
			
			right_arm.self_modulate = Color(Global.home_team_colors[1])
			left_arm.self_modulate = Color(Global.home_team_colors[1])
			
	
	animation_player.play("Idle")
	
	
func change_style() -> void:
	stick.texture = ShopUtil.get_texture("STICK")
	head.texture = ShopUtil.get_texture("HELMET")


func _on_AnimationPlayer_animation_finished(anim_name:String) -> void:
	if anim_name == "Shoot":
		animation_player.play("Idle")
