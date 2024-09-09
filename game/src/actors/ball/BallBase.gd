# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends Node2D

export var singleplayer:bool = true

func _ready() -> void:
	$RigidBody2D/Sprite.texture = ShopUtil.get_ball_texture()
