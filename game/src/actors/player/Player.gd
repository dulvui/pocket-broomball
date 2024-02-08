# SPDX-FileCopyrightText: 2023 Simon Dalvai <info@simondalvai.org>

# SPDX-License-Identifier: AGPL-3.0-or-later

extends KinematicBody2D

class_name Player

onready var ball:RigidBody2D = get_parent().get_node("Ball").get_node("RigidBody2D")

export var away:bool = false
export var oneVsOne:bool = false

var direction:Vector2

var power:int

var destination:Vector2 = Vector2.ZERO

onready var animation_player:AnimationPlayer =  $Body/AnimationPlayer

func _ready() -> void:
	power = Global.home_team_power
	direction = (ball.global_position - global_position).normalized()

func _physics_process(delta:float) -> void:
	if oneVsOne:
		if away and TouchHelper.away_pressed:
			destination = TouchHelper.state["away"]
		elif !away and TouchHelper.home_pressed:
			destination = TouchHelper.state["home"]
	elif TouchHelper.home_pressed:
			destination = TouchHelper.state["home"]
	
	if destination != Vector2.ZERO:
		direction = (destination - global_position).normalized()
		var distance_to_player = global_position.distance_to(destination)
		move_and_slide(direction * Global.home_team_speed  * Global.speed_factor * distance_to_player)
		
		if distance_to_player > 10:
			look_at(ball.global_position)

func _on_ChargeDetector_body_entered(body:Node) -> void:
	animation_player.play("Charge")


func _on_AnimatedSprite_animation_finished() -> void:
	animation_player.play("Idle")


func _on_ChargeDetector_body_exited(body:Node) -> void:
	animation_player.play("Idle")
